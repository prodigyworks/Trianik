<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	require_once(__DIR__ . "/../businessobjects/UserRoleClass.php");
	require_once(__DIR__ . "/../businessobjects/MediaContentClass.php");
	
	/**
	 * @table "roles"
	 */
	class RoleClass extends AbstractBaseDataClass {
		const ROLE_PUBLIC = "PUBLIC";
		const ROLE_UNAUTHENTICATED = "UNAUTHENTICATED";
		
		/** Properties **/
		private $id = null;
		private $roleid = null;
		private $systemrole = null;
		private $defaultpageid = null;
		private $description = null;
		private $priority = null;

		/** One to many **/
		private $userroles = null;
		
		/**
		 * Get role from name.
		 * @param string $name
		 * @return RoleClass
		 */
		public static function getRole($name) {
			$role = new RoleClass();
			$role->loadByName($name);
				
			return $role;
		}
		
		/**
		 * Send role email.
		 * @param string $subject
		 * @param string $message
		 */
		public function sendEmailMessage($subject, $message) {
			if ($this->getUserRoles() != null) {
				foreach ($this->getUserRoles() AS $userrole) {
					$userrole->getUser()->sendEmail($subject, $message);
				}
			}
		}

		/**
		 * Send role email.
		 */
		public function sendEmail() {
			if ($this->getUserRoles() != null) {
				foreach ($this->getUserRoles() AS $userrole) {
					$userrole->getUser()->sendDailyTaskAlertEmail();
				}
			}
		}
		
		/**
		 * Load by name.
		 * @param $id ID
		 * @throws Exception
		 */
		public function loadByName($name) {
			$sql = "SELECT *
					FROM {$_SESSION['DB_PREFIX']}roles
					WHERE roleid = ?";

			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $name, PDO::PARAM_STR);
			$stmt->execute();
			
			$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
				
			foreach ($rows AS $row) {
				$this->loadRecordFromResultset($row);
			}		
		}
		
		/**
		 * id
		 * @param int $id
		 * @return int
		 */
		public function setId($id){
			$this->id = $id;
			return $this;
		}
		
		/**
		 * @primarykey true
		 * @column "id"
		 * @property
		 * id
		 * @return int
		 */
		public function getId(){
			return $this->id;
		}
		
		/**
		 * roleid
		 * @param string $roleid
		 * @return string
		 */
		public function setRoleid($roleid){
			$this->roleid = $roleid;
			return $this;
		}
		
		/**
		 * @column "roleid"
		 * @property
		 * roleid
		 * @return string
		 */
		public function getRoleid(){
			return $this->roleid;
		}
		
		/**
		 * systemrole
		 * @param string $systemrole
		 * @return string
		 */
		public function setSystemrole($systemrole){
			$this->systemrole = $systemrole;
			return $this;
		}
		
		/**
		 * @column "systemrole"
		 * @property
		 * systemrole
		 * @return string
		 */
		public function getSystemrole(){
			return $this->systemrole;
		}
		
		/**
		 * defaultpageid
		 * @param int $defaultpageid
		 * @return int
		 */
		public function setDefaultpageid($defaultpageid){
			$this->defaultpageid = $defaultpageid;
			return $this;
		}
		
		/**
		 * @column "defaultpageid"
		 * @property
		 * defaultpageid
		 * @return int
		 */
		public function getDefaultpageid(){
			return $this->defaultpageid;
		}
		
		/**
		 * description
		 * @param string $description
		 * @return string
		 */
		public function setDescription($description){
			$this->description = $description;
			return $this;
		}
		
		/**
		 * @column "description"
		 * @property
		 * description
		 * @return string
		 */
		public function getDescription(){
			return $this->description;
		}
		
		/**
		 * priority
		 * @param int $priority
		 * @return int
		 */
		public function setPriority($priority){
			$this->priority = $priority;
			return $this;
		}
		
		/**
		 * @column "priority"
		 * @property
		 * priority
		 * @return int
		 */
		public function getPriority(){
			return $this->priority;
		}
	    
	    /**
	     * Clear user roles.
	     * @throws Exception
	     */
	    public function clearUserRoles() {
	    	$sql = "DELETE FROM {$_SESSION['DB_PREFIX']}userroles
			    	WHERE roleid = ?";
		    		
	    	$stmt = SessionControllerClass::getDB()->prepare($sql);
	    	$stmt->bindValue(1, $this->roleid, PDO::PARAM_STR);
	    	$stmt->execute();
	    		
	    	$this->userroles = null;
	    }
	     
	    /**
	     * @onetomany
	     * User Roles
	     * @return UserRoleClass
	     */
	    public function getUserRoles($load = true){
	    	if ($this->userroles == null && $load) {
	    		$this->userroles = array();
	    		 
	    		$sql = "SELECT A.*
			    		FROM {$_SESSION['DB_PREFIX']}userroles A
			    		INNER JOIN {$_SESSION['DB_PREFIX']}members B
			    		ON B.member_id = A.memberid
			    		WHERE A.roleid = ?
			    		ORDER BY B.fullname";
	    
	    		$stmt = SessionControllerClass::getDB()->prepare($sql);
	    		$stmt->bindValue(1, $this->roleid, PDO::PARAM_STR);
	    		$stmt->execute();
	    		
	    		$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
	    		
	    		foreach ($rows AS $row) {
	    			$role = new UserRoleClass();
	    			$role->loadRecordFromResultset($row);
	    	   
	    			$this->userroles[] = $role;
	    		}
	    	}
	    
	    	return $this->userroles;
	    }
    }
?>