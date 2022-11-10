<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	require_once(__DIR__ . "/../businessobjects/PortletClass.php");
	
	/** 
	 * @table "myportlet" 
	 */
	class MyPortletClass extends AbstractBaseDataClass {
	
		/* Properties. */
		private $id = null;
		private $memberid = null;
		private $portletid = null;
		private $columnnumber = null;
		private $sequence = null;
		
		/* One to one */
		private $portlet = null;
		
		/**
		 * Get next sequence.
		 */
		public function getNextSequence() {
			$sequence = 0;
			$sql = "SELECT MAX(sequence) AS maxsequence 
					FROM {$_SESSION['DB_PREFIX']}myportlet
					WHERE memberid = ?
					AND columnnumber = ?";
			
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $this->memberid, PDO::PARAM_INT);
			$stmt->bindValue(2, $this->columnnumber, PDO::PARAM_INT);
			$stmt->execute();
			
			$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

			foreach ($rows AS $row) {
				$sequence = $row['maxsequence'] + 10;
			}

			return $sequence;
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
		 * @column "memberid"
		 * @property
	     * memberid
	     * @return int
	     */
	    public function getMemberid(){
	        return $this->memberid;
	    }
	
	    /**
	     * memberid
	     * @param int $memberid
	     * @return MyPortletClass
	     */
	    public function setMemberid($memberid){
	        $this->memberid = $memberid;
	        return $this;
	    }
	
	    /**
		 * @column "portletid"
		 * @property
	     * portletid
	     * @return int
	     */
	    public function getPortletid(){
	        return $this->portletid;
	    }
	
	    /**
	     * portletid
	     * @param int $portletid
	     * @return MyPortletClass
	     */
	    public function setPortletid($portletid){
	        $this->portletid = $portletid;
	        return $this;
	    }
	
	    /**
		 * @column "columnnumber"
		 * @property
	     * columnnumber
	     * @return int
	     */
	    public function getColumnnumber(){
	        return $this->columnnumber;
	    }
	
	    /**
	     * columnnumber
	     * @param int $columnnumber
	     * @return MyPortletClass
	     */
	    public function setColumnnumber($columnnumber){
	        $this->columnnumber = $columnnumber;
	        return $this;
	    }
	
	    /**
		 * @column "sequence"
		 * @property
	     * sequence
	     * @return int
	     */
	    public function getSequence(){
	        return $this->sequence;
	    }
	
	    /**
	     * sequence
	     * @param int $sequence
	     * @return MyPortletClass
	     */
	    public function setSequence($sequence){
	        $this->sequence = $sequence;
	        return $this;
	    }
	
	    /**
	     * @onetoone
	     * portlet
	     * @return PortletClass
	     */
	    public function getPortlet($load = true){
	    	if ($this->portlet == null && $load) {
	    		$this->portlet = new PortletClass();
	    		 
	    		if ($this->getPortletid() != null) {
	    			$this->portlet->loadRecord($this->getPortletid());
	    		}
	    	}
	    
	    	return $this->portlet;
	    }
    }
?>