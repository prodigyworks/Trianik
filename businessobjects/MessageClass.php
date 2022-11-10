<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	require_once(__DIR__ . "/../businessobjects/UserClass.php");

	/**
	 * @table messages
	 */
	class MessageClass extends AbstractBaseDataClass {
		const MESSAGE_STATUS_NEW = "N";
		const MESSAGE_STATUS_READ = "R";
		
		/* Properties. */
		private $id = null;
		private $from_member_id = null;
		private $to_member_id = null;
		private $subject = null;
		private $message = null;
		private $status = null;
		private $deleted = null;
		private $action = null;
		private $createddate = null;
		private $replied = null;
		
		/* One to one */
		private $toMember = null;
		private $fromMember = null;
		
	    /**
	     * Get message count.
	     */
	    public static function getUnreadMessageCountForUser($userid) {
	    	$messagecount = 0;
	    	$sql = "SELECT COUNT(*) AS messagecount 
	    			FROM {$_SESSION['DB_PREFIX']}messages
	    			WHERE to_member_id = ?
	    			AND status = 'N'
	    			AND (deleted != 'Y' OR deleted IS NULL)";

	    	$stmt = SessionControllerClass::getDB()->prepare($sql);
	    	$stmt->bindValue(1, $userid, PDO::PARAM_INT);
	    	$stmt->execute();
	    	
	    	$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
	    		
	    	foreach ($rows AS $row) {
	    		$messagecount = $row["messagecount"];
	    	}
	    		
	    	return $messagecount;
	    }
	    
	    /**
	     * Mark as replied.
	     * @param $messages Message array.
	     * @throws Exception
	     */
	    public static function markSelectedMessagesAsReplied($messages) {
	    	$inSQL = "'" . implode("', '", $messages) . "'";
	    	
			$sql = "UPDATE {$_SESSION['DB_PREFIX']}messages SET 
					replied = 'Y', 
					metamodifieddate = NOW(), 
					metamodifieduserid = ? 
					WHERE id IN ($inSQL)
					AND to_member_id = ?";
			
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, SessionControllerClass::getUser()->getMemberid(), PDO::PARAM_INT);
			$stmt->bindValue(2, SessionControllerClass::getUser()->getMemberid(), PDO::PARAM_INT);
			$stmt->execute();
	    }
	    
	    /**
	     * Delete selected messages.
	     * @param $messages Message array.
	     * @throws Exception
	     */
	    public static function deleteSelectedMessages($messages) {
	    	$inSQL = "'" . implode("', '", $messages) . "'";
	    	
			$sql = "UPDATE {$_SESSION['DB_PREFIX']}messages SET 
					deleted = 'Y', 
					metamodifieddate = NOW(), 
					metamodifieduserid = ? 
					WHERE id IN ($inSQL)
					AND to_member_id = ?";
					
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, SessionControllerClass::getUser()->getMemberid(), PDO::PARAM_INT);
			$stmt->bindValue(2, SessionControllerClass::getUser()->getMemberid(), PDO::PARAM_INT);
			$stmt->execute();
	    }
	    
	    /**
	     * Mark selected messages as read.
	     * @param $messages Message array.
	     * @throws Exception
	     */
	    public static function markSelectedMessagesAsRead($messages) {
	    	$inSQL = "'" . implode("', '", $messages) . "'";
	    	
			$sql = "UPDATE {$_SESSION['DB_PREFIX']}messages SET 
					status = 'R', 
					metamodifieddate = NOW(), 
					metamodifieduserid = ? 
					WHERE id IN ($inSQL)
					AND to_member_id = ?";

			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, SessionControllerClass::getUser()->getMemberid(), PDO::PARAM_INT);
			$stmt->bindValue(2, SessionControllerClass::getUser()->getMemberid(), PDO::PARAM_INT);
			$stmt->execute();
		}
	    
	    /**
	     * Mark selected messages as unread.
	     * @param $messages Message array.
	     * @throws Exception
	     */
        public static function markSelectedMessagesAsUnread($messages) {
	    	$inSQL = "'" . implode("', '", $messages) . "'";
	    	
			$sql = "UPDATE {$_SESSION['DB_PREFIX']}messages SET 
					status = 'N', 
					metamodifieddate = NOW(), 
					metamodifieduserid = ? 
					WHERE id IN ($inSQL)
					AND to_member_id = ?";
					
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, SessionControllerClass::getUser()->getMemberid(), PDO::PARAM_INT);
			$stmt->bindValue(2, SessionControllerClass::getUser()->getMemberid(), PDO::PARAM_INT);
			$stmt->execute();
		}
	    
		/**
		 * @property
		 * Get the status image name.
		 */
		public function getStatusImageName() {
			if ($this->replied == "Y") {
				return "<img src='images/replied.png' />";
				
			} else if ($this->status == "N") {
				return "<img src='images/unread.png' />";
				
			} else if ($this->status == "R") {
				return "<img src='images/read.png' />";
			}
			
			return "";
		}
		
		/**
		 * @onetoone
		 * fromMember
		 * @return UserClass
		 */
		public function getFromMember($load = true){
			if ($this->fromMember == null && $load) {
				$this->fromMember = new UserClass();
				
				if ($this->from_member_id != null) {
					$this->fromMember->loadRecord($this->from_member_id);
				}
			}
				
			return $this->fromMember;
		}
	
		/**
		 * fromMember
		 * @param UserClass $fromMember
		 * @return MessageClass
		 */
		public function setFromMember($fromMember){
			$this->fromMember = $fromMember;
			return $this;
		}
	
		/**
		 * @onetoone
		 * toMember
		 * @return UserClass
		 */
		public function getToMember($load = true){
			if ($this->toMember == null && $load) {
				$this->toMember = new UserClass();
				$this->toMember->loadRecord($this->to_member_id);
			}
			
			return $this->toMember;
		}
	
		/**
		 * toMember
		 * @param UserClass $toMember
		 * @return MessageClass
		 */
		public function setToMember($toMember){
			$this->toMember = $toMember;
			return $this;
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
		 * from_member_id
		 * @param int $from_member_id
		 * @return int
		 */
		public function setFrom_member_id($from_member_id){
			$this->from_member_id = $from_member_id;
			return $this;
		}
		
		/**
		 * @column "from_member_id"
		 * @property
		 * from_member_id
		 * @return int
		 */
		public function getFrom_member_id(){
			return $this->from_member_id;
		}
		
		/**
		 * to_member_id
		 * @param int $to_member_id
		 * @return int
		 */
		public function setTo_member_id($to_member_id){
			$this->to_member_id = $to_member_id;
			return $this;
		}
		
		/**
		 * @column "to_member_id"
		 * @property
		 * to_member_id
		 * @return int
		 */
		public function getTo_member_id(){
			return $this->to_member_id;
		}
		
		/**
		 * subject
		 * @param string $subject
		 * @return string
		 */
		public function setSubject($subject){
			$this->subject = $subject;
			return $this;
		}
		
		/**
		 * @column "subject"
		 * @property
		 * subject
		 * @return string
		 */
		public function getSubject(){
			return $this->subject;
		}
		
		/**
		 * message
		 * @param string $message
		 * @return string
		 */
		public function setMessage($message){
			$this->message = $message;
			return $this;
		}
		
		/**
		 * @column "message"
		 * @property
		 * message
		 * @return string
		 */
		public function getMessage(){
			return $this->message;
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
		 * action
		 * @param string $action
		 * @return string
		 */
		public function setAction($action){
			$this->action = $action;
			return $this;
		}
		
		/**
		 * @column "action"
		 * @property
		 * action
		 * @return string
		 */
		public function getAction(){
			return $this->action;
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
		 * replied
		 * @param string $replied
		 * @return string
		 */
		public function setReplied($replied){
			$this->replied = $replied;
			return $this;
		}
		
		/**
		 * @column "replied"
		 * @property
		 * replied
		 * @return string
		 */
		public function getReplied(){
			return $this->replied;
		}
	}
?>