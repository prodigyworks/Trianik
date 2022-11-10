<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	require_once(__DIR__ . "/../businessobjects/ApplicationActionRoleClass.php");
	require_once(__DIR__ . "/../businessobjects/RoleClass.php");
	
	/** 
	 * @table "applicationactions" 
	 */
	class ApplicationActionClass extends AbstractBaseDataClass {
		public static $enums = array(
				"EditItem" 				=> "Edit item",
				"AddItem" 				=> "Add item",
				"RemoveItem"			=> "Remove item",
				"ViewItem"				=> "View item",
				"EditHeader" 			=> "Edit header",
				"AddHeader" 			=> "Add header",
				"ViewHeader" 			=> "Viiew header",
				"RemoveHeader"			=> "Remove header",
				"RemoveHeader"			=> "Remove header",
				"RemoveHeader"			=> "Remove header",
				"Appraisals"			=> "Show appraisals",
				"Absences"				=> "Show absences",
				"Holidays"				=> "Show annual holidays",
				"Approve"				=> "Approve",
				"Reject"				=> "Reject",
				"Filter"				=> "Filter",
				"Training"				=> "Show training delivered"
		);
			
		/**
		 * Get action description from code.
		 * @param string $action
		 * @return string
		 */
		public static function getActionDescription($action) {
			if (isset(self::$enums[$action])) {
				return self::$enums[$action];
			}
			
			return null;
		}
		
		/* Properties. */
		private $id = null;
		private $pageid = null;
		private $description = null;
		private $code = null;
		
		/* One to many. */
		private $roles = null;
		
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
	     * pageid
	     * @property
	     * @column "pageid"
	     * @return int
	     */
	    public function getPageid() {
	        return $this->pageid;
	    }
	
	    /**
	     * pageid
	     * @param int $pageid
	     * @return ApplicationActionClass
	     */
	    public function setPageid($pageid) {
	        $this->pageid = $pageid;
	        return $this;
	    }
	
	    /**
	     * description
	     * @property
	     * @column "description"
	     * @return string
	     */
	    public function getDescription() {
	        return $this->description;
	    }
	
	    /**
	     * description
	     * @param string $description
	     * @return ApplicationActionClass
	     */
	    public function setDescription($description) {
	        $this->description = $description;
	        return $this;
	    }
	
	    /**
	     * code
	     * @property
	     * @column "code"
	     * @return string
	     */
	    public function getCode() {
	        return $this->code;
	    }
	
	    /**
	     * code
	     * @param string $code
	     * @return ApplicationActionClass
	     */
	    public function setCode($code) {
	        $this->code = $code;
	        return $this;
	    }
	    
	    /**
	     * @onetomany
	     * Action Roles
	     * @return ApplicationActionRoleClass
	     */
	    public function getRoles($load = true) {
	    	if ($this->roles == null && $load) {
	    		$this->roles = array();
	    
	    		$sql = "SELECT *
			    		FROM {$_SESSION['DB_PREFIX']}applicationactionroles
			    		WHERE actionid = {$this->id}";
		    
	    		/* Prepare delete statement. */
	    		$stmt = SessionControllerClass::getDB()->prepare($sql);
	    		$stmt->bindValue(1, $this->id, PDO::PARAM_INT);
	    		$stmt->execute();
	    		
	    		$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
	    
	    		foreach ($rows AS $row) {
	    			$role = new ApplicationActionRoleClass();
	    			$role->loadRecordFromResultset($row);
	    
	    			$this->roles[$role->getRoleid()] = $role;
	    		}
	    	}
	    		 
    		return $this->roles;
	    }
	    
	    /**
	     * Get role IDs
	     * return array
	     */
	    public function getRoleIds() {
	    	return array_map(
    			function($role) {
		    		return $role->getRoleid();
		    	},
		    	$this->getRoles()
	    	 );
	    }

	    /**
	     * {@inheritDoc}
	     * @see AbstractBaseDataClass::insertRecord()
	     */
	    public function insertRecord() {
	    	if ($this->description == null) {
	    		$this->description = ApplicationActionClass::getActionDescription($this->getCode());
	    	}
	    	
	    	parent::insertRecord();
	    	
	    	$role = new ApplicationActionRoleClass();
	    	$role->setActionid($this->id);
	    	$role->setRoleid("PUBLIC");
	    	$role->insertRecord();

	    	$this->roles[$role->getRoleid()] = $role;
	    }
	}
?>