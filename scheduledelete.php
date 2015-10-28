<?php
	require_once('system-db.php');
	
	start_db();
	
	$id = $_POST['id'];
	
	$qry = "DELETE FROM {$_SESSION['DB_PREFIX']}diary WHERE scheduleid = $id AND status = 'U'";
	$result = mysql_query($qry);
	
	mysql_query("COMMIT");
?>