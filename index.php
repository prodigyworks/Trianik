<?php
	require_once(__DIR__ . "/pgcore-db.php");
	require_once(__DIR__ . "/businessobjects/UseragentClass.php");

	if (strpos($_SERVER['HTTP_USER_AGENT'], "iPhone") ||
		strpos($_SERVER['HTTP_USER_AGENT'], "SAMSUNG") ||
		UseragentClass::isMobileDevice()) {
		header("location: myplanner.php");

	} else {
		header("location: clientplanner.php");
	}
?>
