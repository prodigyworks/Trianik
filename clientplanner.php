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
				}
			);

		function init() {
			modSchedHeight();
			
			scheduler.locale.labels.timeline_tab = "Timeline";
			scheduler.locale.labels.section_custom="Section";
			scheduler.config.details_on_create=true;
			scheduler.config.details_on_dblclick=true;
			scheduler.config.xml_date="%Y-%m-%d %H:%i";
			
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
				x_unit:	"day",
				x_date:	"%d/%m/%y",
				x_step:	1,
				x_size: 7,
				x_start: 0,
				x_length:	7,
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
						"updatebooking.php", 
						{ 
							id: ev.id,
							sectionid: ev.section_id,
							startdate: strStartDate,
							enddate: strEndDate
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
<?php 
			$date = new DateTime();
			$date->sub(new DateInterval("P" . date("w") .  "D"));
?>		
			scheduler.init('scheduler_here',new Date("<?php echo $date->format('Y-m-d')?>"),"timeline");
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
			<div class="dhx_cal_today_button"></div>
			<div class="dhx_cal_date"></div>
			<div class="dhx_cal_tab" name="day_tab" style="right:215px;"></div>
			<div class="dhx_cal_tab" name="timeline_tab" style="right:280px;"></div>
		</div>
		<div class="dhx_cal_header">
		</div>
		<div class="dhx_cal_data">
		</div>		
	</div>
<?php 
	include("system-footer.php");
?>