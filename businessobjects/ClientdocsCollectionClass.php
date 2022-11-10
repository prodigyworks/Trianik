<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseCollectionClass.php");
	require_once(__DIR__ . "/../businessobjects/ClientdocsClass.php");
	
	/**
	 * @class "ClientdocsClass"
	 */
	class ClientdocsCollectionClass extends AbstractBaseCollectionClass {

	    /**
	     * Load by client.
		 * @param int $clientid
		 * @param int $weekday
		 * @param DateTime $date
		 * @param mixed $callback
		 */
		public function loadByClientId($clientid, $callback = null) {
			$sql = "SELECT A.*
					FROM {$_SESSION['DB_PREFIX']}clientdocs A
					WHERE A.clientid = ?
					ORDER BY A.id";
					
			/* Prepare delete statement. */
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $clientid, PDO::PARAM_INT);
				
			$this->populateRecords($stmt, $callback);
		}
			
		/**
		 * Records
		 * @return ClientdocsClass
		 */
		public function getClientdocs() {
			return parent::getRecords();
		}
	}
?>