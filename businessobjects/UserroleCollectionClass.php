<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseCollectionClass.php");
	require_once(__DIR__ . "/../businessobjects/UserRoleClass.php");
	
	/**
	 * @class "UserRoleClass"
	 */
	class UserroleCollectionClass extends AbstractBaseCollectionClass {
		
		/**
		 * Load user roles by role.
		 * 
		 * @param string $roleid
		 * @throws Exception
		 */
		public function loadByRole($roleid) {
			$sql = "SELECT A.*
					FROM {$_SESSION['DB_PREFIX']}userroles A
					INNER JOIN {$_SESSION['DB_PREFIX']}members B
					ON B.member_id = A.memberid
					WHERE A.roleid = ?
					ORDER BY B.fullname";
			
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $roleid, PDO::PARAM_STR);
				
			$this->populateRecords($stmt);
		}		
		
		/**
		 * user roles
		 * @return UserRoleClass
		 */
		public function getUserroless(){
			return parent::getRecords();
		}
	}
?>