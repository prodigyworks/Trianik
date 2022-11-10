<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseCollectionClass.php");
	require_once(__DIR__ . "/../businessobjects/ClientClass.php");
	
	/**
	 * @class "ClientClass"
	 */
	class ClientCollectionClass extends AbstractBaseCollectionClass {

	    /**
	     * Load by partner.
		 * @param mixed $callback
		 */
		public function loadLiveClients($callback) {
			$sql = "SELECT A.*
					FROM  {$_SESSION['DB_PREFIX']}client A
					WHERE status = 'L' OR status IS NULL 
					ORDER BY name";
					
			/* Prepare delete statement. */
			$stmt = SessionControllerClass::getDB()->prepare($sql);
				
			$this->populateRecords($stmt, $callback);
		}
			
		/**
		 * Records
		 * @return ClientClass
		 */
		public function getClients() {
			return parent::getRecords();
		}
	}
?>