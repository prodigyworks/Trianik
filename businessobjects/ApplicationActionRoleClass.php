<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	
	/**
	 * @table "applicationactionroles"
	 */
	class ApplicationActionRoleClass extends AbstractBaseDataClass {
	
		/* Properties. */
		private $id = null;
		private $actionid = null;
		private $roleid = null;
		
		/**
		 * id
	     * @primarykey true
		 * @property
		 * @column "id"
		 * @return int
		 */
		public function getId() {
			return $this->id;
		}
		
		/**
		 * id
		 * @param int $id
		 * @return ApplicationActionClass
		 */
		public function setId($id) {
			$this->id = $id;
			return $this;
		}
		
	    /**
	     * actionid
	     * @property
	     * @column "actionid"
	     * @return int
	     */
	    public function getActionid(){
	        return $this->actionid;
	    }
	
	    /**
	     * actionid
	     * @param int $actionid
	     * @return ApplicationActionRoleClass
	     */
	    public function setActionid($actionid){
	        $this->actionid = $actionid;
	        return $this;
	    }
	
	    /**
	     * roleid
	     * @property
	     * @column "roleid"
	     * @return string
	     */
	    public function getRoleid(){
	        return $this->roleid;
	    }
	
	    /**
	     * roleid
	     * @param string $roleid
	     * @return ApplicationActionRoleClass
	     */
	    public function setRoleid($roleid){
	        $this->roleid = $roleid;
	        return $this;
	    }
	    
	    /**
	     * Delete records by action Id
	     * @param int $actionid
	     */
	    public static function deleteRecordsByActionid($actionid) {
	    	$sql = "DELETE FROM {$_SESSION['DB_PREFIX']}applicationactionroles 
	    			WHERE actionid = ?";
	    	
	    	$stmt = SessionControllerClass::getDB()->prepare($sql);
	    	$stmt->bindValue(1, $actionid, PDO::PARAM_INT);
	    	$stmt->execute();
	    }
	}
?>