<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseCollectionClass.php");
	require_once(__DIR__ . "/../businessobjects/MessageClass.php");
	
	/**
	 * @class "MessageClass"
	 */
	class MessageCollectionClass extends AbstractBaseCollectionClass {
		
		/** @onetomany **/
		private $messages = array();

	    /**
	     * Load messages by user.
	     * @param $memberid User ID.
	     */
		public function loadInboxByUser($memberid) {
			$sql = "SELECT A.*
					FROM  {$_SESSION['DB_PREFIX']}messages A
					WHERE A.to_member_id = ?
					AND (A.deleted != 'Y' OR A.deleted IS NULL)
					ORDER BY A.createddate DESC";
					
			/* Prepare delete statement. */
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $memberid, PDO::PARAM_INT);
				
			$this->populateRecords($stmt);
		}
			
		/**
		 * Records
		 * @return MessageClass
		 */
		public function getMessages() {
			return parent::getRecords();
		}

		/**
		 * Load messages by user.
		 * @param $memberid User ID.
		 */
		public function loadUnreadByUser($memberid) {
			$sql = "SELECT A.*
					FROM  {$_SESSION['DB_PREFIX']}messages A
					WHERE A.to_member_id = ?
					AND A.status = 'N'
					AND (A.deleted != 'Y' OR A.deleted IS NULL)
					ORDER BY A.createddate DESC
					LIMIT 10";
						
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $memberid, PDO::PARAM_INT);
			
			$this->populateRecords($stmt);
		}
		
	    /**
	     * Load sent messages by user.
	     * @param $memberid User ID.
	     */
		public function loadSentMessagesByUser($memberid) {
			$sql = "SELECT A.*
					FROM  {$_SESSION['DB_PREFIX']}messages A 
					WHERE A.from_member_id = ?
					ORDER BY A.createddate DESC";
			
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $memberid, PDO::PARAM_INT);
				
			$this->populateRecords($stmt);
		}

	    /**
	     * Load archived messages by user.
	     * @param $memberid User ID.
	     */
		public function loadArchivedMessagesByUser($memberid) {
			$sql = "SELECT A.*
					FROM  {$_SESSION['DB_PREFIX']}messages A 
					WHERE A.to_member_id = ? 
					AND A.deleted = 'Y' 
					ORDER BY A.createddate DESC";
				
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $memberid, PDO::PARAM_INT);
			
			$this->populateRecords($stmt);
		}
	}
?>