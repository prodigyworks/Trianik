<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseCollectionClass.php");
	require_once(__DIR__ . "/../businessobjects/InboxClass.php");
	
	/**
	 * @class "InboxClass"
	 */
	class InboxCollectionClass extends AbstractBaseCollectionClass {

	    /**
	     * Load by partner.
	     * @param $partnerid Partner ID.
	     */
		public function loadByPartnerId($partnerid) {
			$sql = "SELECT A.*
					FROM  {$_SESSION['DB_PREFIX']}inbox A
					WHERE A.partnerid = ?";
					
			/* Prepare delete statement. */
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $partnerid, PDO::PARAM_INT);
				
			$this->populateRecords($stmt);
		}
			
		/**
		 * Records
		 * @return InboxClass
		 */
		public function getInboxes() {
			return parent::getRecords();
		}
	}
?>