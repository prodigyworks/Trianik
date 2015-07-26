<?php 
	$mode = "C";
	
	include("system-header.php");
	
	function clientmode() {
		global $mode;
		
		$mode = "C";
	}
		
	function staffmode() {
		global $mode;
		
		$mode = "S";
	}
	?>
	<script src='./codebase/dhtmlxscheduler.js' type="text/javascript" charset="utf-8"></script>
	<script src='./codebase/ext/dhtmlxscheduler_timeline.js' type="text/javascript" charset="utf-8"></script>
	<link rel='STYLESHEET' type='text/css' href='./codebase/dhtmlxscheduler_glossy.css'>
	<link rel="stylesheet" href="./codebase/ext/dhtmlxscheduler_ext.css" type="text/css" media="screen" title="no title" charset="utf-8">
	
	<style type="text/css" media="screen">
		.keyblock {
			width:10px;
			height:10px;
			border:1px solid black;
		}
		.yellow {
			background-color: yellow;
		}
		.red {
			background-color: red;
		}
		.green {
			background-color: green;
		}
		.one_line{
			white-space:nowrap;
			overflow:hidden;
			padding-top:5px; padding-left:5px;
			text-align:left !important;
		}
		
		.dhx_cal_event_line  {
			font-size:11px;
			line-height:12px;
		}
	</style>
	
	<script type="text/javascript" charset="utf-8">
	
		$(document).ready(
				function() {
					init();

					$("#keydialog").dialog({
							modal: false,
							minWidth: 90,
							dialogClass: "kev",
							autoOpen: true,
							width: "auto",
							opacity: 0.4,
							position: ["left", "top"],
							overlay: { opacity: 0.3, background: "white" },
							title: "Key"
						});
							
				}
			);

		function init() {
			modSchedHeight();
			
			scheduler.locale.labels.timeline_tab = "Timeline";
			scheduler.locale.labels.section_custom="Section";
			scheduler.config.details_on_create=false;
			scheduler.config.dblclick_create = false;
			scheduler.config.xml_date="%Y-%m-%d %H:%i";
			scheduler.attachEvent("onBeforeFolderToggle", function(section,isOpen,allSections){
			    //any custom logic here
			    alert("X");
			    return false;
			});			
			scheduler.config.first_hour = 6;
			scheduler.config.last_hour = 23;
			//===============
			//Configuration
			//===============
			var sections=[
<?php 
				if ($mode == "S") {
					$sql = "SELECT member_id AS id, fullname AS name FROM {$_SESSION['DB_PREFIX']}members ORDER BY fullname	";

				} else if ($mode == "C") {
					$sql = "SELECT id, name FROM {$_SESSION['DB_PREFIX']}client WHERE status = 'L' ORDER BY name";
				}
				
				$result = mysql_query($sql);
				$first = true;
			
				//Check whether the query was successful or not
				if($result) {
					while (($member = mysql_fetch_assoc($result))) {
						if ($first) {
							$first = false;
						} else {
							echo ", ";
						}
?>
						{key:<?php echo $member['id']; ?>, label:"<?php echo $member['name']; ?>"}
<?php
					}
				}
		
?>
			];
				
			scheduler.createTimelineView({
				name:	"timeline",
				x_unit:	"minute",
				 x_unit:"minute",//measuring unit of the X-Axis.
			     x_date:"%H:%i", //date format of the X-Axis
			     x_step:60,      //X-Axis step in 'x_unit's
			     x_size:24,      //X-Axis length specified as the total number of 'x_step's
			     x_start:0,     //X-Axis offset in 'x_unit's
			     x_length:24,    //number of 'x_step's that will be scrolled at a time
				y_unit:	sections,
				y_property:	"section_id",
				render:"bar"
			});
				
			scheduler.attachEvent("onBeforeEventChanged", function(ev, e, is_new){
			    //any custom logic here
			    var strStartDate, strEndDate;

			    strStartDate = padZero(ev.start_date.getDate());
			    strStartDate += "/" + padZero(ev.start_date.getMonth() + 1);
			    strStartDate += "/" + (1900 + ev.start_date.getYear());
			    strStartDate += " " + padZero(ev.start_date.getHours());
			    strStartDate += ":" + padZero(ev.start_date.getMinutes());
			    
			    strEndDate = padZero(ev.end_date.getDate());
			    strEndDate += "/" + padZero(ev.end_date.getMonth() + 1);
			    strEndDate += "/" + (1900 + ev.end_date.getYear());
			    strEndDate += " " + padZero(ev.end_date.getHours());
			    strEndDate += ":" + padZero(ev.end_date.getMinutes());
			    
				callAjax(
						"updateschedule.php", 
						{ 
							id: ev.id,
							sectionid: ev.section_id,
							startdate: strStartDate,
							enddate: strEndDate,
							mode : "<?php echo $mode;?>"
						},
						function(data) {
						}
					);

			    return true;
			    
			});			
			
			//===============
			//Data loading
			//===============
			scheduler.config.lightbox.sections=[	
				{name:"description", height:130, map_to:"text", type:"textarea" , focus:true},
				{name:"custom", height:23, type:"select", options:sections, map_to:"section_id" },
				{name:"time", height:12, type:"time", map_to:"auto"}
			];

			scheduler.init('scheduler_here',new Date(),"timeline");
			scheduler.setLoadMode("day");
			scheduler.config.show_loading = true;

			scheduler.load("clientevents.php?mode=<?php echo $mode; ?>","json",function(){
			    // alert("Data has been successfully loaded");
			    scheduler.updateCollection("sections",sections );
			});
			var dp = new dataProcessor("clientevents.php");
			dp.init(scheduler);
		}
		
		function modSchedHeight(){
			var sch = document.getElementById("scheduler_here");
			sch.style.height = (document.body.offsetHeight - 20) + "px";
			var contbox = document.getElementById("contbox");
			contbox.style.width = (parseInt(document.body.offsetWidth)-300)+"px";
		}

		function clientmode() {
			call("clientmode");
		}

		function staffmode() {
			call("staffmode");
		}
	</script>
	<div onclick="clientmode()" style="font-size:11px; position:absolute; left:460px; top:62px; z-index:100" class="dhx_cal_today_button">&nbsp;&nbsp;Clients</div>
	<div onclick="staffmode()" style="font-size:11px; position:absolute; left:530px; top:62px; z-index:100" class="dhx_cal_today_button">&nbsp;Staff</div>
	<div style="height:0px;background-color:#3D3D3D;border-bottom:5px solid #828282;">
		<div id="contbox" style="float:left;color:white;margin:22px 75px 0 75px; overflow:hidden;font: 17px Arial,Helvetica;color:white">
		</div>
	</div>
	<!-- end. info block -->
	<div id="scheduler_here" class="dhx_cal_container" style='width:100%; height:100%;'>
		<div class="dhx_cal_navline">
			<div class="dhx_cal_prev_button">&nbsp;</div>
			<div class="dhx_cal_next_button">&nbsp;</div>
			<div class="dhx_cal_date"></div>
			<div class="dhx_cal_tab" name="month_tab" style="right:85px;"></div>
			<div class="dhx_cal_tab" name="day_tab" style="right:150px;"></div>
			<div class="dhx_cal_tab" name="week_tab" style="right:215px;"></div>
			<div class="dhx_cal_tab" name="timeline_tab" style="right:280px;"></div>
		</div>
		<div class="dhx_cal_header">
		</div>
		<div class="dhx_cal_data">
		</div>		
	</div>
	<div id="keydialog" class="modal">
		<table width='150px'>
			<tr>
				<td>No Started</td>
				<td>
					<div class="keyblock yellow">&nbsp;</div>
				</td>
			</tr>
			<tr>
				<td>Clocked In</td>
				<td>
					<div class="keyblock red">&nbsp;</div>
				</td>
			</tr>
			<tr>
				<td>Completed</td>
				<td>
					<div class="keyblock green">&nbsp;</div>
				</td>
			</tr>
		</table>
	</div>
<?php 
	include("system-footer.php");
?>