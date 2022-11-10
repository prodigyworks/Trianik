<?php
	require_once(__DIR__ . "/pgcore-db.php");
	
	SessionControllerClass::logout();

	header("location: index.php");
?>
