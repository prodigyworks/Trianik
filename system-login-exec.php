<?php
	require_once(__DIR__ . "/pgcore-db.php");
	require_once(__DIR__ . "/session/SessionControllerClass.php");
	
	try {
		SessionControllerClass::login(
				$_POST['login'], 
				$_POST['password'],
				true,
				"HOST"
			);
		
		header("location: index.php");
		
	} catch (Exception $e) {
		$_SESSION['ERRMSG_ARR'] = $e->getMessage();
		
		header("location: system-login.php");
	}
?>