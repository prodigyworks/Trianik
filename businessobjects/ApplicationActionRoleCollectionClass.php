<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseCollectionClass.php");
	require_once(__DIR__ . "/../businessobjects/ApplicationActionRoleClass.php");
	
	/**
	 * @class "ApplicationActionRoleClass"
	 */
	class ApplicationActionRoleCollectionClass extends AbstractBaseCollectionClass {
		
		/**
		 * Load by action ID
		 * @param int $actionid
		 */
		public function loadByActionID($actionid) {
			$sql = "SELECT * 
					FROM {$_SESSION['DB_PREFIX']}applicationactionroles 
					WHERE actionid = ?
					ORDER BY roleid";
			
			/* Prepare delete statement. */
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $actionid, PDO::PARAM_INT);
			
			$this->populateRecords($stmt);
		}
		
		/**
		 * @onetomany
		 * Records
		 * @return ApplicationActionRoleClass
		 */
		public function getRecords() {
			return parent::getRecords();
		}
	}
?>