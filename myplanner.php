<?php
	require_once(__DIR__ . "/system-mobileheader.php");
	require_once(__DIR__ . "/ui/ComboUIClass.php");
	require_once(__DIR__ . "/businessobjects/DiaryCollectionClass.php");
	?>
	<style>
		thead td {
			font-weight:bold;
		}
		td {
			font-size:10px;
			height:19px;
		}
		
		#myplanner table td {
			padding: 2px 2px 2px 0px;
		}
		
		#myplanner a {
			line-height:20px;
		}
		
		.documents {
			color: pink;
			font-size:12px;
		}
		
		.newstarter {
			color: yellow;
			font-size:15px;
		}
		
		.norows {
			color: orange;
			font-size:15px;
		}
	</style>
<div id="myplanner">
<?php 
	if (SessionControllerClass::getUser()->hasRole("ADMIN")) {
?>
		<label>Staff Member</label>
<?php 		
		ComboUIClass::getInstance()
			->setId("memberid")
			->setValue("member_id")
			->setName("fullname")
			->setTable("members")
			->render();
	}
?>
	<table width='100%'>
		<thead>
			<tr>
				<td>Client</td>
				<td width='46px' align='center'>Due Start</td>
				<td width='46px' align='center'>Due End</td>
				<td width='52px' align='center'>Clock In</td>
				<td width='52px' align='center'>Clock Out</td>
			</tr>
		</thead>
<?php 
	if (isset($_GET['id'])) {
		$memberid = $_GET['id'];
		
	} else {
		$memberid = SessionControllerClass::getUser()->getMember_id();
	}
	$date = date("Y-m-d");
	$enddate = date ("Y-m-d", strtotime("+7 day", strtotime($date)));
	
	while (strtotime($date) < strtotime($enddate)) {
		$showdate = date ("D d M Y", strtotime($date));
		
		echo "<tr>";
		echo "<td colspan=5>";
        echo "<div>Date : " . $showdate . "</div><br/>";
		echo "</td>";
		echo "</tr>";
		
		$name = "Unknown";
		$found = false;
		
		$schedules = new DiaryCollectionClass();
		$schedules->loadMyPlanner($date, $memberid, function (DiaryClass $diary) use(&$name, &$found) {
			
  			$found = true;
?>
    		<tr>
    			<td>
    				<a target='_new' class="newstarter" href='newstarterreport.php?id=<?php echo $diary->getClientid(); ?>'><?php echo $diary->getClient()->getName(); ?></a>
<?php
    
				$documents = $diary->getClient()->getDocuments();
				
				foreach ($documents AS $document) {
?>
					<br /><a class="documents" target='_new' href='viewdocuments.php?id=<?php echo $document->getDocumentid(); ?>'><?php echo $document->getDocument()->getName(); ?></a>
<?php
    			}
    					 
?>
    			</td>
    			<td align='center'><?php echo $diary->dateToHMS($diary->getStarttime()); ?></td>
    			<td align='center'><?php echo $diary->dateToHMS($diary->getEndtime()); ?></td>
    			<td width='50px' align='center' id='x<?php echo $diary->getId(); ?>_checkin'>
<?php 
    			if ($diary->getStatus() == "U") {
?>
    				<button style="width:50px; text-align:center" onclick="clockIn(<?php echo $diary->getId(); ?>)">In</button>
<?php 
    			} else {
    				echo $diary->dateToHMS($diary->getActualstarttime());
    			}
?>
    			</td>
    			<td width='50px' align='center' id='x<?php echo $diary->getId(); ?>_checkout'>
<?php 
    			if ($diary->getStatus() == "U") {
    				echo "&nbsp;";
    				
    			} else if ($diary->getStatus() == "I") {
?>
    				<button style="width:50px; text-align:center" onclick="clockOut(<?php echo $diary->getId(); ?>)">Out</button>
<?php 
    			} else {
    				echo $diary->dateToHMS($diary->getActualendtime());
    			}
?>
    			</td>
			</tr>
<?php
    	});
    
    	if (! $found) {
?>
			<tr>
				<td colspan=4 class="norows">No appointments found</td>
			</tr>
<?php    		
    	}
    	
		echo "<tr>";
		echo "<td colspan=5>";
        echo "<hr />";
		echo "</td>";
		echo "</tr>";
		
		$date = date ("Y-m-d", strtotime("+1 day", strtotime($date)));
	}
?>
	</table>
</div>
	<script>
		$(document).ready(
				function() {
<?php 
	if (isset($_GET['id'])) {
?>
					$("#memberid").val("<?php echo $_GET['id']; ?>");
<?php 
	}
?>
					$("#memberid").change(
							function() {
								window.location.href = "myplanner.php?id=" + $(this).val();
							}
						);
				}
			);
		
		function clockIn(id) {
			businessObjectToJSon({
				classname: "DiaryUIClass", 
				methodname: "clockIn", 
				args: {
					id: id
				},
				success: function(data) {
					$("#x" + id + "_checkin").html(dateToHMS(new Date(data.actualstarttime)));
					$("#x" + id + "_checkout").html("<button style='width:50px; text-align:center' onclick='clockOut(" + id + ")'>Out</button>");
				}
			});			
		}

		function clockOut(id) {
			businessObjectToJSon({
				classname: "DiaryUIClass", 
				methodname: "clockOut", 
				args: {
					id: id
				},
				success: function(data) {
					console.log(data);
					console.log(dateToHMS(new Date(data.actualendtime)));
					console.log($("#x" + id + "_checkout").html());
					$("#x" + id + "_checkout").html(dateToHMS(new Date(data.actualendtime)));
					console.log("TEST 1");
				}
			});			
		}
	</script>
<?php 
	require_once("system-mobilefooter.php");
?>	
	