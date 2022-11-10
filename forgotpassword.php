<?php
	require_once(__DIR__ . "/pgcore-db.php");
	require_once(__DIR__ . "/businessobjects/UserClass.php");
	
	$errmsg_arr = null;
	
	if (! isset($_POST['login']) || $_POST['login'] == "") {
		$errmsg_arr[] = "Missing User ID";
		
	} else {
		try {
			$user = new UserClass();
			$user->loadByLogin($_POST['login']);
			$user->forgotPassword();
			
		} catch (Exception $e) {
			$_SESSION['ERRMSG_ARR'] = $e->getMessage();
		}
	}
	
	header("location: passwordchanged.php");
?>