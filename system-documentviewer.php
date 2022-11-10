<?php
	require_once(__DIR__ . "/pgcore-db.php");
	require_once(__DIR__ . "/businessobjects/DocumentClass.php");
	
	if (! isset($_GET['id'])) {
		header('HTTP/1.0 403 Forbidden');
		exit();
	     
	} else {
		$document = new DocumentClass();
		$document->loadRecord($_GET['id']);

		if ($document->isExpired()) {
			header('HTTP/1.0 408 Request Time-out');
			
		} elseif (! $document->isPermitted()) {
			header('HTTP/1.0 401 Unauthorized');

		} else {
			header("Content-type: {$document->getMimeType()}");
			
			if ($document->getCompressed() == 1) {
				echo gzuncompress($document->getImage());
					
			} else {
				echo $document->getImage();
			}
		}
	}
?> 