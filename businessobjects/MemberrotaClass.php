<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	
	/** 
	 * @table "memberrota" 
	 */
	class MemberrotaClass extends AbstractBaseDataClass {
		
	    /* Properties. */
	    private $id = null;
	    private $memberid = null;
	    private $weekday = null;
	       
	     /* One to ones */
	
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
		 * weekday 
		 * @param int $weekday 
		 * @return int  
		 */
		public function setWeekday($weekday){
			$this->weekday = $weekday;
			return $this;
		}
		
		/**
		 * @column "weekday"
		 * @property
		 * weekday 
		 * @return int  
		 */
		public function getWeekday(){
			return $this->weekday;
		}
			
		/**
		 * Load by member and weekday
		 * @param int $memberid
		 * @param int $weekday
		 */
		public function loadByMemberAndWeekday($memberid, $weekday) {
			$sql = "SELECT * 
					FROM {$_SESSION['DB_PREFIX']}memberrota 
					WHERE memberid = ?
					AND weekday = ?";
			
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $memberid, PDO::PARAM_INT);
			$stmt->bindValue(2, $weekday, PDO::PARAM_INT);
			
			$this->loadRowFromStatement($stmt);
		}
	}
?>