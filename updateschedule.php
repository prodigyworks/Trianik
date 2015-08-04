<?php
	require_once("system-db.php");
	
	start_db();
	
	$id = $_POST['id'];
	$clientid = $_POST['clientid'];
	$memberid = $_POST['memberid'];
	$startdate = convertStringToDate($_POST['startdate']) . " " . $_POST['starttime'];
	$enddate = convertStringToDate($_POST['enddate']) . " " . $_POST['endtime'];
	$status = $_POST['status'];
	
	if ($status == "U") {
		$sql = "UPDATE {$_SESSION['DB_PREFIX']}diary SET 
				starttime = '$startdate', 
				endtime = '$enddate', 
				memberid = $memberid,
				clientid = $clientid
				WHERE id = $id";

	} else if ($status == "I") {
		$sql = "UPDATE {$_SESSION['DB_PREFIX']}diary SET 
				actualstarttime = '$startdate', 
				endtime = '$enddate', 
				memberid = $memberid,
				clientid = $clientid
				WHERE id = $id";

	} else {
		$sql = "UPDATE {$_SESSION['DB_PREFIX']}diary SET 
				actualstarttime = '$startdate', 
				actualendtime = '$enddate', 
				memberid = $memberid,
				clientid = $clientid
				WHERE id = $id";
	}
	
	if (! mysql_query($sql)) {
		logError($sql . " - " . mysql_error());
	}
	
	mysql_query("COMMIT");
?>