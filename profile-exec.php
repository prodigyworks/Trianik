<?php
	require_once(__DIR__ . "/pgcore-db.php");
	require_once(__DIR__ . "/businessobjects/UserClass.php");
	require_once(__DIR__ . "/businessobjects/ImageClass.php");

	$image = new ImageClass();
	$image->setDescription("User Profile");
	$image->uploadFromFile("image");
	$image->insertRecord();
	
	$user = new UserClass();
	$user->loadRecord(SessionControllerClass::getUser()->getMemberid());
	$user->setFirstname($_POST['fname']);
	$user->setLastname($_POST['lname']);
	
	if ($_POST['password'] != "") {
		$user->setPasswd(md5($_POST['password']));
	}
	
	$user->setEmail($_POST['email']);
	$user->setImageid($image->getId());
	$user->updateRecord();
	
	/* Update session */
	SessionControllerClass::setUser($user);
	
	header("location: system-register-amend.php");
?>