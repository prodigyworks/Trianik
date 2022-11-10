<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	require_once(__DIR__ . "/../businessobjects/UserClass.php");
	require_once(__DIR__ . "/../businessobjects/RoleClass.php");
	require_once(__DIR__ . "/../businessobjects/MediaContentClass.php");
	
	/**
	 * @table "holiday"
	 */
	class HolidayClass extends AbstractBaseDataClass {
	
		/* Properties. */
		private $id = null;
		private $memberid = null;
		private $year = null;
		private $startdate = null;
		private $enddate = null;
		private $daystaken = null;
		private $accepteddate = null;
		private $acceptedby = null;
		private $requesteddate = null;
		private $rejecteddate = null;
		private $rejectedby = null;
		private $reason = null;
		private $enddate_half = null;
		private $startdate_half = null;
		
		private $user = null;
		
		/**
		 * Formatted start date
		 * @property
		 * @return string
		 */
		public function getStartdateDMY() {
			return $this->dateToDMY($this->getStartdate());
		}
		
		/**
		 * Formatted end date
		 * @property
		 * @return string
		 */
		public function getEnddateDMY() {
			return $this->dateToDMY($this->getEnddate());
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
		 * Approve
		 */
		public function approve() {
			logError("TEST 1", false);
			$this->setRejectedby(null);
			$this->setRejecteddate(null);
			$this->setAcceptedby(SessionControllerClass::getUser()->getMemberid());
			logError("TEST 2", false);
				$this->setAccepteddate(date("Y-m-d"));
				logError("TEST 3", false);
				$this->updateRecord();
				
				logError("TEST 4", false);
				/* Email approval. */
			$message = MediaContentClass::loadByCode("HOLIDAYAPPROVAL")->getMedia();
			logError("TEST 5", false);
				$message = $this->replaceTokens($message);
				logError("TEST 6", false);
				}
		
		/**
		 * Reject
		 */
		public function reject($reason) {
			$this->setAcceptedby(null);
			$this->setAccepteddate(null);
			$this->setRejectedby(SessionControllerClass::getUser()->getMemberid());
			$this->setRejecteddate(date("Y-m-d"));
			$this->setReason($reason);
			$this->updateRecord();
		
			/* Email rejection. */
			$message = MediaContentClass::loadByCode("HOLIDAYAPPROVAL")->getMedia();
			$message = $this->replaceTokens($message);
		}
		
		/**
		 * {@inheritDoc}
		 * @see AbstractBaseDataClass::insertRecord()
		 */
		public function insertRecord() {
			parent::insertRecord();
			
			/* Send holiday request email. */
			$message = MediaContentClass::loadByCode("HOLIDAYREQUEST")->getMedia();
			$message = $this->replaceTokens($message);
		}

		/**
		 * {@inheritDoc}
		 * @see AbstractBaseDataClass::updateRecord()
		 */
		public function updateRecord() {
			parent::updateRecord();

			/* Send holiday request email. */
			$message = MediaContentClass::loadByCode("HOLIDAYREQUEST")->getMedia();
			$message = $this->replaceTokens($message);
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
		 * accepteddate
		 * @param DateTime $accepteddate
		 * @return DateTime
		 */
		public function setAccepteddate($accepteddate){
			$this->accepteddate = $accepteddate;
			return $this;
		}
	
		/**
		 * @column "accepteddate"
		 * @property
		 * accepteddate
		 * @return DateTime
		 */
		public function getAccepteddate(){
			return $this->accepteddate;
		}
	
		/**
		 * acceptedby
		 * @param int $acceptedby
		 * @return int
		 */
		public function setAcceptedby($acceptedby){
			$this->acceptedby = $acceptedby;
			return $this;
		}
	
		/**
		 * @column "acceptedby"
		 * @property
		 * acceptedby
		 * @return int
		 */
		public function getAcceptedby(){
			return $this->acceptedby;
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
		 * rejecteddate
		 * @param DateTime $rejecteddate
		 * @return DateTime
		 */
		public function setRejecteddate($rejecteddate){
			$this->rejecteddate = $rejecteddate;
			return $this;
		}
	
		/**
		 * @column "rejecteddate"
		 * @property
		 * rejecteddate
		 * @return DateTime
		 */
		public function getRejecteddate(){
			return $this->rejecteddate;
		}
	
		/**
		 * rejectedby
		 * @param int $rejectedby
		 * @return int
		 */
		public function setRejectedby($rejectedby){
			$this->rejectedby = $rejectedby;
			return $this;
		}
	
		/**
		 * @column "rejectedby"
		 * @property
		 * rejectedby
		 * @return int
		 */
		public function getRejectedby(){
			return $this->rejectedby;
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