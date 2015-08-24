<?php
	require_once("system-db.php");
	
	start_db();
	
	$id = $_POST['id'];
	
	$sql = "DELETE FROM {$_SESSION['DB_PREFIX']}diary  
			WHERE id = $id";
	
	if (! mysql_query($sql)) {
		logError($sql . " - " . mysql_error());
	}
	
	mysql_query("COMMIT");
?>