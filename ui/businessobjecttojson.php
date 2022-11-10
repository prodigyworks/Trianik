<?php
	require_once(__DIR__ . "/../pgcore-db.php");
	require_once(__DIR__ . "/../ui/businessobjecttojsoncall.php");
	
	header("Content-type: application/{$_POST['datatype']}");
	
	echo businessObjectToJSon(
			$_POST['classname'], 
			$_POST['methodname'], 
			$_POST['args']
		);
?>