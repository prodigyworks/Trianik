<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	
	/** 
	 * @table "absence" 
	 */
	class AbsenceClass extends AbstractBaseDataClass {
		
	    /* Properties. */
	    private $id = null;
	    private $memberid = null;
	    private $absencetype = null;
	    private $year = null;
	    private $startdate = null;
	    private $requesteddate = null;
	    private $enddate = null;
	    private $daystaken = null;
	    private $reason = null;
	    private $enddate_half = null;
	    private $startdate_half = null;
	       
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
		 * absencetype 
		 * @param string $absencetype 
		 * @return string  
		 */
		public function setAbsencetype($absencetype){
			$this->absencetype = $absencetype;
			return $this;
		}
		
		/**
		 * @column "absencetype"
		 * @property
		 * absencetype 
		 * @return string  
		 */
		public function getAbsencetype(){
			return $this->absencetype;
		}
			
		/**
		 * year 
		 * @param int $year 
		 * @return int  
		 */
		public function setYear($year){
			$this->year = $year;
			return $this;
		}
		
		/**
		 * @column "year"
		 * @property
		 * year 
		 * @return int  
		 */
		public function getYear(){
			return $this->year;
		}
			
		/**
		 * startdate 
		 * @param DateTime $startdate 
		 * @return DateTime  
		 */
		public function setStartdate($startdate){
			$this->startdate = $startdate;
			return $this;
		}
		
		/**
		 * @column "startdate"
		 * @property
		 * startdate 
		 * @return DateTime  
		 */
		public function getStartdate(){
			return $this->startdate;
		}
			
		/**
		 * requesteddate 
		 * @param DateTime $requesteddate 
		 * @return DateTime  
		 */
		public function setRequesteddate($requesteddate){
			$this->requesteddate = $requesteddate;
			return $this;
		}
		
		/**
		 * @column "requesteddate"
		 * @property
		 * requesteddate 
		 * @return DateTime  
		 */
		public function getRequesteddate(){
			return $this->requesteddate;
		}
			
		/**
		 * enddate 
		 * @param DateTime $enddate 
		 * @return DateTime  
		 */
		public function setEnddate($enddate){
			$this->enddate = $enddate;
			return $this;
		}
		
		/**
		 * @column "enddate"
		 * @property
		 * enddate 
		 * @return DateTime  
		 */
		public function getEnddate(){
			return $this->enddate;
		}
			
		/**
		 * daystaken 
		 * @param float $daystaken 
		 * @return float  
		 */
		public function setDaystaken($daystaken){
			$this->daystaken = $daystaken;
			return $this;
		}
		
		/**
		 * @column "daystaken"
		 * @property
		 * daystaken 
		 * @return float  
		 */
		public function getDaystaken(){
			return $this->daystaken;
		}
			
		/**
		 * reason 
		 * @param string $reason 
		 * @return string  
		 */
		public function setReason($reason){
			$this->reason = $reason;
			return $this;
		}
		
		/**
		 * @column "reason"
		 * @property
		 * reason 
		 * @return string  
		 */
		public function getReason(){
			return $this->reason;
		}
			
		/**
		 * enddate_half 
		 * @param int $enddate_half 
		 * @return int  
		 */
		public function setEnddate_half($enddate_half){
			$this->enddate_half = $enddate_half;
			return $this;
		}
		
		/**
		 * @column "enddate_half"
		 * @property
		 * enddate_half 
		 * @return int  
		 */
		public function getEnddate_half(){
			return $this->enddate_half;
		}
			
		/**
		 * startdate_half 
		 * @param int $startdate_half 
		 * @return int  
		 */
		public function setStartdate_half($startdate_half){
			$this->startdate_half = $startdate_half;
			return $this;
		}
		
		/**
		 * @column "startdate_half"
		 * @property
		 * startdate_half 
		 * @return int  
		 */
		public function getStartdate_half(){
			return $this->startdate_half;
		}
			
	}
?>