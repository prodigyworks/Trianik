<?php
	if (strpos($_SERVER['HTTP_USER_AGENT'], "iPhone")) {
		header("location: myplanner.php");
		
	} else {
		header("location: clientplanner.php");
	}
?>
