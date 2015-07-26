<?php
	require_once("system-db.php");
	
	start_db();
	
	$id = $_POST['id'];
	$sectionid = $_POST['sectionid'];
	$startdate = convertStringToDateTime($_POST['startdate']);
	$enddate = convertStringToDateTime($_POST['enddate']);
	$mode = $_POST['mode'];
	
	if ($mode == "C") {
		$sql = "UPDATE {$_SESSION['DB_PREFIX']}diary SET 
				starttime = '$startdate', 
				endtime = '$enddate', 
				clientid = $sectionid
				WHERE id = $id";

	} else {
		$sql = "UPDATE {$_SESSION['DB_PREFIX']}diary SET 
				starttime = '$startdate', 
				endtime = '$enddate', 
				memberid = $sectionid
				WHERE id = $id";
	}
	
	if (! mysql_query($sql)) {
		logError($sql . " - " . mysql_error());
	}
	
	mysql_query("COMMIT");
?>