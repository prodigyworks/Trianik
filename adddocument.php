<?php
	require_once(__DIR__ . '/businessobjects/DocumentCollectionClass.php');
	
	$documents = new DocumentCollectionClass();
	$documents->uploadSessionDocuments(
			$_GET['id'],
			$_GET['primaryidname'],
			$_GET['tablename']
		);
		
	if (isset($_GET['refer'])) {
	  	header("location: " . base64_decode($_GET['refer']));
		
	} else {
	  	header("location: " . $_SERVER['HTTP_REFERER']);
	}	
?>