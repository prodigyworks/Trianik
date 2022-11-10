<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseCollectionClass.php");
	require_once(__DIR__ . "/../businessobjects/PageRolesClass.php");
	
	/**
	 * @class "PageRolesClass"
	 */
	class PageRolesCollectionClass extends AbstractBaseCollectionClass {
		
		/**
		 * Load by page ID
		 * @param int $pageid
		 */
		public function loadByPageID($pageid) {
			$sql = "SELECT * 
					FROM {$_SESSION['DB_PREFIX']}pageroles 
					WHERE pageid = ?
					ORDER BY roleid";
			
			/* Prepare delete statement. */
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $pageid, PDO::PARAM_INT);
			
			$this->populateRecords($stmt);
		}
		
		/**
		 * @onetomany
		 * Records
		 * @return PageRolesClass
		 */
		public function getRecords() {
			return parent::getRecords();
		}
	}
?>