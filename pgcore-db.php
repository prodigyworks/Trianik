<?php
	require_once(__DIR__ . "/session/SessionControllerClass.php");
	require_once(__DIR__ . "/pgcore-functions.php");
	
	if(!isset($_SESSION)) {
		session_start();
	}
	
	
	
	error_reporting(E_STRICT);
	
	if (! isset($_SESSION['PRODIGYWORKS.INI'])) {
		$_SESSION['PRODIGYWORKS.INI'] = parse_ini_file("prodigyworks.ini");
		$_SESSION['DB_PREFIX'] = $_SESSION['PRODIGYWORKS.INI']['DB_PREFIX'];
		$_SESSION['CACHING'] = $_SESSION['PRODIGYWORKS.INI']['CACHING'];
	}
	
	if (! defined('DB_HOST')) {
		$iniFile = $_SESSION['PRODIGYWORKS.INI'];
	
		define('DB_HOST', $iniFile['DB_HOST']);
		define('DB_USER', $iniFile['DB_USER']);
		define('DB_PASSWORD', $iniFile['DB_PASSWORD']);
		define('DB_DATABASE', $iniFile['DB_DATABASE']);
		define('DEV_ENV', $iniFile['DEV_ENV']);
			
		date_default_timezone_set(SessionControllerClass::getSiteConfig()->getTimezone());
	}
?>