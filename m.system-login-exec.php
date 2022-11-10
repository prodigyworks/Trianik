<?php
	require_once(__DIR__ . "/pgcore-db.php");
	require_once(__DIR__ . "/session/SessionControllerClass.php");
	
	try {
		SessionControllerClass::login($_POST['login'], $_POST['password']);
	
		header("location: m.index.php");
	
	} catch (Exception $e) {
		header("location: m.system-login.php");
	}
?>