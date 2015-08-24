<?php
	require_once("system-db.php");
	
	start_db();
	
	$id = $_POST['id'];
	
	$sql = "UPDATE {$_SESSION['DB_PREFIX']}diary  
			SET deleted = 'Y'
			WHERE id = $id";
	logError("$sql", false);
	if (! mysql_query($sql)) {
		logError($sql . " - " . mysql_error());
	}
	
	mysql_query("COMMIT");
?>