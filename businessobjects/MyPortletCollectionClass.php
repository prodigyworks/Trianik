<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseCollectionClass.php");
	require_once(__DIR__ . "/../businessobjects/MyPortletClass.php");
	
	/**
	 * @class "MyPortletClass"
	 */
	class MyPortletCollectionClass extends AbstractBaseCollectionClass {
		
	    /**
	     * Load my portlets
	     */
		public function loadMyPortlets() {
			$sql = "SELECT A.*
					FROM  {$_SESSION['DB_PREFIX']}myportlet A
					INNER JOIN {$_SESSION['DB_PREFIX']}portlet B
					ON B.id = A.portletid
					WHERE A.memberid = ?
					ORDER BY A.sequence";
			
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, SessionControllerClass::getUser()->getMemberid(), PDO::PARAM_INT);
			
			$this->populateRecords($stmt);
		}

		/**
		 * portlets
		 * @return MyPortletClass
		 */
		public function getMyPortlets(){
			return $this->getRecords();
		}
	}
?>