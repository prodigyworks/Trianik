<?php 
	require_once(__DIR__ . "/pgcore-db.php");
	require_once(__DIR__ . "/businessobjects/ImageClass.php");

	try {
		SessionControllerClass::getDB()->beginTransaction();
		
		$image = new ImageClass();
		$image->setDescription("User Profile");
		$image->uploadFromFile("file", 16000, 16000);
		$image->setSessionid(session_id());
		$image->insertRecord();
		
		SessionControllerClass::getDB()->commit();
		
	} catch (Exception $e) {
		SessionControllerClass::getDB()->rollBack();
	}
?>