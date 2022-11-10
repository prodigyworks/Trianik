<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	require_once(__DIR__ . "/../businessobjects/UserClass.php");

	/** 
	 * @table "errors" 
	 */
	class ErrorsClass extends AbstractBaseDataClass {
	
        /* Properties. */
        private $id = null;
        private $pageid = null;
        private $memberid = null;
        private $description = null;
        private $createddate = null;
       
        /* One to ones */
        private $user = null; 

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
         * pageid
         * @param int $pageid
         * @return int
         */
        public function setPageid($pageid){
        	$this->pageid = $pageid;
        	return $this;
        }
        
        /**
         * @column "pageid"
         * @property
         * pageid
         * @return int
         */
        public function getPageid(){
        	return $this->pageid;
        }
        
        /**
         * memberid
         * @param int $memberid
         * @return int
         */
        public function setMemberid($memberid){
        	$this->memberid = $memberid;
        	return $this;
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
         * description
         * @param text $description
         * @return text
         */
        public function setDescription($description){
        	$this->description = $description;
        	return $this;
        }
        
        /**
         * @column "description"
         * @property
         * description
         * @return text
         */
        public function getDescription(){
        	return $this->description;
        }
        
        /**
         * createddate
         * @param timestamp $createddate
         * @return timestamp
         */
        public function setCreateddate($createddate){
        	$this->createddate = $createddate;
        	return $this;
        }
        
        /**
         * @column "createddate"
         * @property
         * createddate
         * @return timestamp
         */
        public function getCreateddate(){
        	return $this->createddate;
        }
			
		/**
		 * @onetoone
		 * user 
		 * @return UserClass
		 */
		public function getUser($load = true){
			if ($this->user == null && $load) {
				$this->user = new UserClass();
	
				if ($this->getMemberid() != null) {
					$this->user->loadRecord($this->getMemberid());
				}
			}
		
			return $this->user;
		}

		/**
		 * Clear errors.
		 */
		public static function clear() {
			$sql = "DELETE FROM {$_SESSION['DB_PREFIX']}errors";
			
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->execute();
		}
	}
?>