<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	require_once(__DIR__ . "/../businessobjects/ClientClass.php");
	require_once(__DIR__ . "/../businessobjects/UserClass.php");
	require_once(__DIR__ . "/../businessobjects/DiaryClass.php");
	
	/** 
	 * @table "clientschedule" 
	 */
	class ClientscheduleClass extends AbstractBaseDataClass {
		
	    /* Properties. */
	    private $id = null;
	    private $clientid = null;
	    private $memberid = null;
	    private $weekday = null;
	    private $begindate = null;
	    private $canceldate = null;
	    private $starttime = null;
	    private $endtime = null;
	    private $mode = null;
	    
	    /* One to ones. */
	    private $client = null;
	    private $cleaner = null;
	     
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
		 * clientid 
		 * @param int $clientid 
		 * @return int  
		 */
		public function setClientid($clientid){
			$this->clientid = $clientid;
			return $this;
		}
		
		/**
		 * @column "clientid"
		 * @property
		 * clientid 
		 * @return int  
		 */
		public function getClientid(){
			return $this->clientid;
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
		 * begindate 
		 * @param DateTime $begindate 
		 * @return DateTime  
		 */
		public function setBegindate($begindate){
			$this->begindate = $begindate;
			return $this;
		}
		
		/**
		 * @column "begindate"
		 * @property
		 * begindate 
		 * @return DateTime  
		 */
		public function getBegindate(){
			return $this->begindate;
		}
			
		/**
		 * canceldate 
		 * @param DateTime $canceldate 
		 * @return DateTime  
		 */
		public function setCanceldate($canceldate){
			$this->canceldate = $canceldate;
			return $this;
		}
		
		/**
		 * @column "canceldate"
		 * @property
		 * canceldate 
		 * @return DateTime  
		 */
		public function getCanceldate(){
			return $this->canceldate;
		}
			
		/**
		 * starttime 
		 * @param string $starttime 
		 * @return string  
		 */
		public function setStarttime($starttime){
			$this->starttime = $starttime;
			return $this;
		}
		
		/**
		 * @column "starttime"
		 * @property
		 * starttime 
		 * @return string  
		 */
		public function getStarttime(){
			return $this->starttime;
		}
			
		/**
		 * endtime 
		 * @param string $endtime 
		 * @return string  
		 */
		public function setEndtime($endtime){
			$this->endtime = $endtime;
			return $this;
		}
		
		/**
		 * @column "endtime"
		 * @property
		 * endtime 
		 * @return string  
		 */
		public function getEndtime(){
			return $this->endtime;
		}
			
		/**
		 * mode 
		 * @param string $mode 
		 * @return string  
		 */
		public function setMode($mode){
			$this->mode = $mode;
			return $this;
		}
		
		/**
		 * @column "mode"
		 * @property
		 * mode 
		 * @return string  
		 */
		public function getMode(){
			return $this->mode;
		}

		/**
		 * Get week day description.
		 * @return string
		 */
		public function getWeekdayDescription() {
			if ($this->weekday == 0) return "Sunday";
			if ($this->weekday == 1) return "Monday";
			if ($this->weekday == 2) return "Tuesday";
			if ($this->weekday == 3) return "Wednesday";
			if ($this->weekday == 4) return "Thursday";
			if ($this->weekday == 5) return "Friday";
			if ($this->weekday == 6) return "Saturday";
				
			return "N/A";
		}

		/**
		 * Notify cleaner.
		 * @param ClientscheduleClass $originalSchedule
		 */
		public function notifyCleanerIfChanged($originalSchedule) {
			try {
				if ($this->weekday != $originalSchedule->weekday ||
					$this->memberid != $originalSchedule->memberid) {
							
// 					UserClass::getUser($this->memberid)->sendEmail(
// 							"Work Allocation", 
// 							"Shift allocated to you on {$this->getWeekdayDescription()} {$this->getStarttime()} - {$this->getEndtime()} for {$this->getClient()->getName()}\n"
// 						);
				}
				 
				if ($this->weekday != $originalSchedule->weekday) {
					DiaryClass::deleteByUnplannedByScheduleId($this->id);
					 
				} else if ($this->memberid != $originalSchedule->memberid) {
					DiaryClass::updateMemberByUnplannedByScheduleId($this->id, $this->memberid);
				}
	
				if ($this->canceldate != $originalSchedule->canceldate) {
					DiaryClass::deleteByUnplannedByScheduleIdAfterDate($this->id, $this->canceldate);
				}
	
				if ($this->starttime != $originalSchedule->starttime || 
					$this->endtime != $originalSchedule->endtime) {
						
					DiaryClass::updateTimeByUnplannedByScheduleId($this->id, $this->starttime, $this->endtime);
				}
				
			} catch (Exception $e) {
				logError($e->getMessage());
			}
		}

		/**
		 * @onetoone
		 * Client
		 * @return ClientClass
		 */
		public function getClient($load = true){
			if ($this->client == null && $load) {
				$this->client = new ClientClass();
		
				if ($this->getClientid() != null) {
					$this->client->loadRecord($this->getClientid());
				}
			}
		
			return $this->client;
		}

		/**
		 * @onetoone
		 * Cleaner
		 * @return UserClass
		 */
		public function getCleaner($load = true){
			if ($this->cleaner == null && $load) {
				$this->cleaner = new UserClass();
		
				if ($this->getMemberid() != null) {
					$this->cleaner->loadRecord($this->getMemberid());
				}
			}
		
			return $this->cleaner;
		}
	}
?>