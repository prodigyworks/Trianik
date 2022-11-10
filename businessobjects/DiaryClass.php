<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	require_once(__DIR__ . "/../businessobjects/ClientClass.php");
	require_once(__DIR__ . "/../businessobjects/UserClass.php");
	
	/** 
	 * @table "diary" 
	 */
	class DiaryClass extends AbstractBaseDataClass {
		
	    /* Properties. */
	    private $id = null;
	    private $clientid = null;
	    private $memberid = null;
	    private $status = null;
	    private $deleted = null;
	    private $starttime = null;
	    private $actualstarttime = null;
	    private $actualendtime = null;
	    private $endtime = null;
	    private $scheduleid = null;
	    
	    private $origclientid = null;
	    private $origmemberid = null;
	    private $origstatus = null;
	    private $origdeleted = null;
	    private $origstarttime = null;
	    private $origactualstarttime = null;
	    private $origactualendtime = null;
	    private $origendtime = null;
	    private $origscheduleid = null;
	     
	    /* One to ones */
	    private $client = null;
	    private $cleaner = null;
	    private $origclient = null;
	     
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
		 * status 
		 * @param string $status 
		 * @return string  
		 */
		public function setStatus($status){
			$this->status = $status;
			return $this;
		}
		
		/**
		 * @column "status"
		 * @property
		 * status 
		 * @return string  
		 */
		public function getStatus(){
			return $this->status;
		}
			
		/**
		 * deleted 
		 * @param string $deleted 
		 * @return string  
		 */
		public function setDeleted($deleted){
			$this->deleted = $deleted;
			return $this;
		}
		
		/**
		 * @column "deleted"
		 * @property
		 * deleted 
		 * @return string  
		 */
		public function getDeleted(){
			return $this->deleted;
		}
			
		/**
		 * starttime 
		 * @param DateTime $starttime 
		 * @return DateTime  
		 */
		public function setStarttime($starttime){
			$this->starttime = $starttime;
			return $this;
		}
		
		/**
		 * @column "starttime"
		 * @property
		 * starttime 
		 * @return DateTime  
		 */
		public function getStarttime(){
			return $this->starttime;
		}
			
		/**
		 * actualstarttime 
		 * @param DateTime $actualstarttime 
		 * @return DateTime  
		 */
		public function setActualstarttime($actualstarttime){
			$this->actualstarttime = $actualstarttime;
			return $this;
		}
		
		/**
		 * @column "actualstarttime"
		 * @property
		 * actualstarttime 
		 * @return DateTime  
		 */
		public function getActualstarttime(){
			return $this->actualstarttime;
		}
			
		/**
		 * actualendtime 
		 * @param DateTime $actualendtime 
		 * @return DateTime  
		 */
		public function setActualendtime($actualendtime){
			$this->actualendtime = $actualendtime;
			return $this;
		}
		
		/**
		 * @column "actualendtime"
		 * @property
		 * actualendtime 
		 * @return DateTime  
		 */
		public function getActualendtime(){
			return $this->actualendtime;
		}
			
		/**
		 * endtime 
		 * @param DateTime $endtime 
		 * @return DateTime  
		 */
		public function setEndtime($endtime){
			$this->endtime = $endtime;
			return $this;
		}
		
		/**
		 * @column "endtime"
		 * @property
		 * endtime 
		 * @return DateTime  
		 */
		public function getEndtime(){
			return $this->endtime;
		}
			
		/**
		 * scheduleid 
		 * @param int $scheduleid 
		 * @return int  
		 */
		public function setScheduleid($scheduleid){
			$this->scheduleid = $scheduleid;
			return $this;
		}
		
		/**
		 * @column "scheduleid"
		 * @property
		 * scheduleid 
		 * @return int  
		 */
		public function getScheduleid(){
			return $this->scheduleid;
		}
		
		

		/* Clear down. */
		public static function deleteByUnplannedByScheduleIdAfterDate($scheduleid, $enddate) {
			$sql = "DELETE FROM {$_SESSION['DB_PREFIX']}diary 
    				WHERE scheduleid = ?
    				AND starttime > ?
    				AND status = 'U'
    				AND deleted != 'Y'";
			
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $scheduleid, PDO::PARAM_INT);
			$stmt->bindValue(2, $enddate, PDO::PARAM_STR);
			$stmt->execute();
		}
		
		/* Clear down. */
		public static function deleteByUnplannedByScheduleId($scheduleid) {
			$sql = "DELETE FROM {$_SESSION['DB_PREFIX']}diary
					WHERE scheduleid = ?
					AND status = 'U'
					AND deleted != 'Y'";
			
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $scheduleid, PDO::PARAM_INT);
			$stmt->execute();
		}
		
		/* Update time. */
		public static function updateTimeByUnplannedByScheduleId($scheduleid, $starttime, $endtime) {
			$sql = "UPDATE {$_SESSION['DB_PREFIX']}diary SET
					starttime = ?,
					endtime = ?
					WHERE scheduleid = ?
					AND status = 'U'
					AND deleted != 'Y'";
		
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $starttime, PDO::PARAM_STR);
			$stmt->bindValue(2, $endtime, PDO::PARAM_STR);
			$stmt->bindValue(3, $scheduleid, PDO::PARAM_INT);
			$stmt->execute();
		}
		
		/* Update member. */
		public static function updateMemberByUnplannedByScheduleId($scheduleid, $memberid) {
			$sql = "UPDATE {$_SESSION['DB_PREFIX']}diary SET
					memberid = $memberid
					WHERE scheduleid = $scheduleid
					AND status = 'U'
					AND deleted != 'Y'";
						
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $memberid, PDO::PARAM_INT);
			$stmt->bindValue(2, $scheduleid, PDO::PARAM_INT);
			$stmt->execute();
		}
		
		/**
		 * {@inheritDoc}
		 * @see AbstractBaseDataClass::loadRecord()
		 */
		public function loadRecord($id = null) {
			parent::loadRecord($id);
			
			$this->origactualendtime = $this->actualendtime;
			$this->origactualstarttime = $this->actualstarttime;
			$this->origclientid = $this->clientid;
			$this->origdeleted = $this->deleted;
			$this->origendtime = $this->endtime;
			$this->origmemberid = $this->memberid;
			$this->origscheduleid = $this->scheduleid;
			$this->origstarttime = $this->starttime;
			$this->origstatus = $this->status;
		}
		
		/**
		 * {@inheritDoc}
		 * @see AbstractBaseDataClass::updateRecord()
		 */
		public function updateRecord() {
// 			if ($this->status == "U") {
// 				if ($this->memberid != $this->origmemberid) {
// 					UserClass::getUser($this->origmemberid)->sendEmail(
// 							"Cancellation", 
// 							"The shift originally allocated on {$this->dateToDMY($this->origstarttime)} 
// 							 for {$this->getOriginalclient()->getName()} 
// 							 has been cancelled");

// 				} else {
// 					UserClass::getUser($this->origmemberid)->sendEmail(
// 							"Appointment Amendment",
// 							"The shift originally allocated on {$this->dateToDMY($this->origstarttime)}
// 							for {$this->getOriginalclient()->getName()}
// 							has been moved to {$this->dateToDMY($this->starttime)}
// 							for {$this->getclient()->getName()}");
// 					}
// 			}
			
			parent::updateRecord();
			
			$this->origactualendtime = $this->actualendtime;
			$this->origactualstarttime = $this->actualstarttime;
			$this->origclientid = $this->clientid;
			$this->origdeleted = $this->deleted;
			$this->origendtime = $this->endtime;
			$this->origmemberid = $this->memberid;
			$this->origscheduleid = $this->scheduleid;
			$this->origstarttime = $this->starttime;
			$this->origstatus = $this->status;
		}

		/**
		 * @onetoone
		 * Original client
		 * @return ClientClass
		 */
		public function getOriginalclient($load = true){
			if ($this->origclient == null && $load) {
				$this->origclient = new ClientClass();
		
				if ($this->origclientid != null) {
					$this->origclient->loadRecord($this->origclientid);
				}
			}
		
			return $this->origclient;
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

		/**
		 * Clock in.
		 */
		public function clockIn() {
			$this->setActualstarttime(date("Y-m-d H:i:s"));
			$this->setStatus("I");
			$this->updateRecord();
		}

		/**
		 * Clock out.
		 */
		public function clockOut() {
			$this->setActualendtime(date("Y-m-d H:i:s"));
			$this->setStatus("C");
			$this->updateRecord();
		}
	}
?>