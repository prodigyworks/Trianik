<?php
	require_once(__DIR__ . "/pgcore-db.php");
	require_once(__DIR__ . "/businessobjects/DocumentClass.php");
	
	if (! isset($_GET['id'])) {
		header('HTTP/1.0 403 Forbidden');
		exit();
	     
	} else {
		$document = new DocumentClass();
		$document->loadRecord($_GET['id']);
		
		$expires = 60*60*24*14;
		header("Pragma: public");
		header("Cache-Control: maxage=$expires");
		header('Expires: ' . gmdate('D, d M Y H:i:s', time() + $expires) . ' GMT');
		header("Content-type: {$document->getMimeType()}");
		header("Content-Length: {$document->getSize()}");
		header("Content-disposition: attachment; filename='{$document->getFilename()}'");
		
		if ($document->isExpired()) {
			header('HTTP/1.0 408 Request Time-out');
				
		} elseif (! $document->isPermitted()) {
			header('HTTP/1.0 401 Unauthorized');
		
		} else {
			if ($document->getCompressed() == 1) {
				echo gzuncompress($document->getImage());
					
			} else {
				echo $document->getImage();
			}
		}
	}
?> 