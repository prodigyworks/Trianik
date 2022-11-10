<?php
	require_once(__DIR__ . "/pgcore-db.php");
	require_once(__DIR__ . "/businessobjects/ImageClass.php");

	if(! isset($_GET['id'])){
	     SessionControllerClass::error("Please select your image!");
	     
	} else {
		$image = new ImageClass(true);
		$image->loadRecord($_GET['id']);
		
		$expires = 60*60*24*14;
		header("Pragma: public");
		header("Cache-Control: maxage=$expires");
		header('Expires: ' . gmdate('D, d M Y H:i:s', time() + $expires) . ' GMT');
		header("Content-type: text/plain");
		header("Content-type: {$image->getMimetype()}");

		echo $image->getImage();
	}
?> 