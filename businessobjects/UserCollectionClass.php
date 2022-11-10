<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseCollectionClass.php");
	require_once(__DIR__ . "/../businessobjects/UserClass.php");
	
	/**
	 * @class "UserClass"
	 */
	class UserCollectionClass extends AbstractBaseCollectionClass {
		
		/**
		 * Load users by role.
		 * 
		 * @param string $roleid
		 * @throws Exception
		 */
		public function loadByRole($roleid) {
			$sql = "SELECT *
					FROM {$_SESSION['DB_PREFIX']}members
					WHERE member_id IN
					(
						SELECT memberid
						FROM {$_SESSION['DB_PREFIX']}userroles
						WHERE roleid = ?
					)
					ORDER BY fullname";
			
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $roleid, PDO::PARAM_STR);
				
			$this->populateRecords($stmt);
		}		
		
	    /**
	     * Load users available for messaging.
	     */
	    public function loadAvailbleForMessaging() {
	    	if (SessionControllerClass::getUser()->hasRole("USER")) {
	    		return $this->loadAll();
	    	}
	    	
	    	$this->loadByRole("EXTERNALMESSAGING");
	    }
		
	    /**
	     * Load all users
	     */
		public function loadAll($callback = null) {
			$sql = "SELECT *
					FROM {$_SESSION['DB_PREFIX']}members
					ORDER BY fullname";

			$stmt = SessionControllerClass::getDB()->prepare($sql);

			$this->populateRecords($stmt, $callback);
		}

		/**
		 * Load all users bar admin
		 */
		public function loadAllButAdmin($callback = null) {
			$sql = "SELECT *
					FROM {$_SESSION['DB_PREFIX']}members
					WHERE member_id != 1
					ORDER BY fullname";
		
			$stmt = SessionControllerClass::getDB()->prepare($sql);
		
			$this->populateRecords($stmt, $callback);
		}
		
		/**
		 * Load by member ID
		 * @param int $memberid
		 */
		public function loadByMemberID($memberid) {
			$sql = "SELECT *
					FROM {$_SESSION['DB_PREFIX']}members
					WHERE member_id = ?";
					
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $memberid, PDO::PARAM_INT);
			
			$this->populateRecords($stmt);
		}
		
		/**
		 * users
		 * @return UserClass
		 */
		public function getUsers(){
			return parent::getRecords();
		}
	}
?>