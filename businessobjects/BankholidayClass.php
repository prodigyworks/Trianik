<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	
	/** 
	 * @table "bankholiday" 
	 */
	class BankholidayClass extends AbstractBaseDataClass {
		
	    /* Properties. */
	    private $id = null;
	    private $name = null;
	    private $startdate = null;
	    private $enddate = null;
	    private $daystaken = null;
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
	
		/**
		 Calculated the number o wekdays(M-F) beteen two timestamps (iclusive).
		 * @return int the number of weekdays etween the two timesamps
		 */
		 public function weekDays() {
			 return HoldayAdminClass::weekDays($his->getStartdate(), $this>getEnddate());
		 }
	}
?>