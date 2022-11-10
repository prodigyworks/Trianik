<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	/** 
	 * @table "loginaudit" 
	 */
	class LoginauditClass extends AbstractBaseDataClass {
		
        /* Properties. */
        private $id = null;
        private $memberid = null;
        private $timeon = null;
        private $timeoff = null;
       
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
		 * timeon 
		 * @param DateTime $timeon 
		 * @return DateTime  
		 */
		public function setTimeon($timeon){
			$this->timeon = $timeon;
			return $this;
		}
		
		/**
		 * @column "timeon"
		 * @property
		 * timeon 
		 * @return DateTime  
		 */
		public function getTimeon(){
			return $this->timeon;
		}
			
		/**
		 * timeoff 
		 * @param DateTime $timeoff 
		 * @return DateTime  
		 */
		public function setTimeoff($timeoff){
			$this->timeoff = $timeoff;
			return $this;
		}
		
		/**
		 * @column "timeoff"
		 * @property
		 * timeoff 
		 * @return DateTime  
		 */
		public function getTimeoff(){
			return $this->timeoff;
		}
			
	}
?>