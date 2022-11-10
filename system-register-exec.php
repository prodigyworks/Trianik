<?php
	require_once(__DIR__ . "/pgcore-db.php");
	require_once(__DIR__ . "/businessobjects/UserClass.php");
	require_once(__DIR__ . "/businessobjects/ImageClass.php");
	
	try {
		SessionControllerClass::getDB()->beginTransaction();
		
		$image = new ImageClass();
		$image->setDescription("User Profile");
		$image->uploadFromFile("image");
		$image->insertRecord();
		
		$user = new UserClass();
		$user->setFirstname($_POST['fname']);
		$user->setLastname($_POST['lname']);
		$user->setPasswd($_POST['password']);
		$user->setEmail($_POST['email']);
		$user->setLogin($_POST['login']);
		$user->setLoginauditid(0);
		$user->setImageid($image->getId());
		
		unset($_SESSION['ERRMSG_ARR']);
		
		$user->insertRecord(array());
		
		SessionControllerClass::getDB()->commit();
		
		header("location: system-register-success.php");
		
	} catch (Exception $e) {
		SessionControllerClass::getDB()->rollBack();
		
		$_SESSION['ERRMSG_ARR'] = $e->getMessage();
		
		header("location: system-register.php");
	}
?>