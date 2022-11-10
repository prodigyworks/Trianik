<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	require_once(__DIR__ . "/../businessobjects/PortletRoleClass.php");
	
	/**
	 * @table portlet
	 */
	class PortletClass extends AbstractBaseDataClass {
	
		/* Properties. */
		private $id = null;
		private $name = null;
		private $header = null;
		private $filename = null;
		private $refreshrate = null;
		
		/* One to many */
		private $portletroles = null;
			
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
		 * name
		 * @param string $name
		 * @return string
		 */
		public function setName($name){
			$this->name = $name;
			return $this;
		}
		
		/**
		 * @column "name"
		 * @property
		 * name
		 * @return string
		 */
		public function getName(){
			return $this->name;
		}
		
		/**
		 * header
		 * @param string $header
		 * @return string
		 */
		public function setHeader($header){
			$this->header = $header;
			return $this;
		}
		
		/**
		 * @column "header"
		 * @property
		 * header
		 * @return string
		 */
		public function getHeader(){
			return $this->header;
		}
		
		/**
		 * filename
		 * @param string $filename
		 * @return string
		 */
		public function setFilename($filename){
			$this->filename = $filename;
			return $this;
		}
		
		/**
		 * @column "filename"
		 * @property
		 * filename
		 * @return string
		 */
		public function getFilename(){
			return $this->filename;
		}
		
		/**
		 * refreshrate
		 * @param int $refreshrate
		 * @return int
		 */
		public function setRefreshrate($refreshrate){
			$this->refreshrate = $refreshrate;
			return $this;
		}
		
		/**
		 * @column "refreshrate"
		 * @property
		 * refreshrate
		 * @return int
		 */
		public function getRefreshrate(){
			return $this->refreshrate;
		}
	    
	    /**
	     * @onetomany
	     * roles
	     * @return PortletRoleClass
	     */
	    public function getRoles($load = true){
	    	if ($this->portletroles == null && $load) {
	    		$this->portletroles = array();
	    		 
	    		$sql = "SELECT A.*
			    		FROM {$_SESSION['DB_PREFIX']}portletroles A
			    		WHERE A.portletid = ?
			    		ORDER BY A.roleid";
	    
	    		$stmt = SessionControllerClass::getDB()->prepare($sql);
	    		$stmt->bindValue(1, $this->id, PDO::PARAM_INT);
	    		$stmt->execute();
	    		
	    		$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
	    		
	    		foreach ($rows AS $row) {
	    			$role = new PortletRoleClass(true);
	    			$role->loadRecordFromResultset($row);
	    	   
	    			/* Add leg to the array. */
	    			$this->portletroles[] = $role;
	    		}
	    	}
	    
	    	return $this->portletroles;
	    }

	    /**
	     * Clear user roles.
	     * @throws Exception
	     */
	    public function clearRoles() {
	    	$sql = "DELETE FROM {$_SESSION['DB_PREFIX']}portletroles
			    	WHERE portletid = ?";
	    		
	    	$stmt = SessionControllerClass::getDB()->prepare($sql);
	    	$stmt->bindValue(1, $this->id, PDO::PARAM_INT);
	    	$stmt->execute();
	    		
	    	$this->portletroles = null;
	    }
    }
?>