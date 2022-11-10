<?php
function businessObjectToJSon($classname, $methodname, $args) {
	try {
		require_once("$classname.php");
			
		$refClass = new ReflectionClass($classname);
		$object = $refClass->newInstanceArgs();
		$reflectmethod = New ReflectionMethod($classname, $methodname);
		$real_params = array();

		foreach ($reflectmethod->getParameters() as $param) {
			if (isset($args[$param->getName()])) {
				$real_params[] = $args[$param->getName()];
					
			} else {
				$real_params[] = null;
			}
		}
			
		if (! SessionControllerClass::getUser()->isAuthenticated() && isset($_POST['user']) && isset($_POST['password'])) {
			/* Login. */
			SessionControllerClass::login($_POST['user'], $_POST['password']);
		}

		$roles = $object->role($methodname);
			
		foreach ($roles AS $role) {
			if (SessionControllerClass::getUser()->hasRole($role)) {
				SessionControllerClass::getDB()->beginTransaction();
					
				$retValue = call_user_func_array(array($object, $methodname), $real_params);
					
				SessionControllerClass::getDB()->commit();
					
				return $retValue;
			}
		}
			
		header('HTTP/1.0 403 Forbidden');
			
	} catch (Exception $e) {
		SessionControllerClass::getDB()->rollBack();
			
		/* Logging. */
		$errorMessage = str_replace("\r", " ", str_replace("\n", " ", str_replace("\"", "'", $e->getMessage())));
			
		logError("{$e->getMessage()} - {$e->getTraceAsString()}", false);
			
		header("HTTP/1.0 500 $errorMessage");
	}
}
?>