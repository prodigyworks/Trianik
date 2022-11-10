<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseCollectionClass.php");
	require_once(__DIR__ . "/../businessobjects/DocumentClass.php");
	
	/**
	 * @class "DocumentClass"
	 */
	class DocumentCollectionClass extends AbstractBaseCollectionClass {
		
		/**
		 * @onetomany
		 * Documents
		 * @return DocumentClass
		 */
		public function getRecords(){
			return parent::getRecords();
		}
		
		/**
		 * Upload session documents
		 * @param int $primaryid
		 * @param string $primaryidname
		 * @param string $tablename
		 */
		function uploadSessionDocuments($primaryid, $primaryidname, $tablename) {
			$memberid = SessionControllerClass::getUser()->getMemberid();
			$sessionid = session_id();
		
			if ($primaryid != null) {
				$sql = "SELECT 		
					    A.id, A.name, A.filename, A.mimetype, A.expirydate, 
						A.roleid, A.size, A.sessionid, A.compressed, A.createdby, 
						A.createddate, A.lastmodifiedby, A.lastmodifieddate, 
						A.metacreateddate, A.metacreateduserid, 
						A.metamodifieddate, A.metamodifieduserid, 
					    A.image 
					    FROM {$_SESSION['DB_PREFIX']}documents A
						WHERE A.sessionid = ?
						AND A.id NOT IN (
							SELECT documentid
							FROM {$_SESSION['DB_PREFIX']}$tablename
							WHERE documentid = A.id
						)
						ORDER BY A.id";
				
				$stmt = SessionControllerClass::getDB()->prepare($sql);
				$stmt->bindValue(1, $sessionid, PDO::PARAM_STR);
				
				$this->populateRecords($stmt);
				
				foreach ($this->getRecords() AS $document) {
					$sql = "INSERT INTO {$_SESSION['DB_PREFIX']}$tablename
							(
								$primaryidname, documentid, createddate,
								metacreateddate, metacreateduserid,
								metamodifieddate, metamodifieduserid
							)
							VALUES
							(
								$primaryid, {$document->getId()}, NOW(),
								NOW(), ?,
								NOW(), ?
							)";
		
					$itemstmt = SessionControllerClass::getDB()->prepare($sql);
					$itemstmt->bindValue(1, $primaryid, PDO::PARAM_INT);
					$itemstmt->bindValue(2, $document->getId(), PDO::PARAM_INT);
					$itemstmt->bindValue(3, $memberid, PDO::PARAM_INT);
					$itemstmt->bindValue(4, $memberid, PDO::PARAM_INT);
					$itemstmt->execute();
				}
		
				$sql = "UPDATE {$_SESSION['DB_PREFIX']}documents SET
						sessionid = NULL,
						metamodifieddate = NOW(),
						metamodifieduserid = ?
						WHERE sessionid = ?";
				
				$itemstmt = SessionControllerClass::getDB()->prepare($sql);
				$itemstmt->bindValue(1, $memberid, PDO::PARAM_INT);
				$itemstmt->bindValue(2, $sessionid, PDO::PARAM_STR);
				$itemstmt->execute();
			}
		}
		
		/**
		 * Clear session documents.
		 */
		public function clearSessionDocuments() {
			$sessionid = session_id();
			$sql = "DELETE FROM {$_SESSION['DB_PREFIX']}documents
					WHERE sessionid = ?";
		
			/* Prepare delete statement. */
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $sessionid, PDO::PARAM_STR);
			$stmt->execute();
		}
		
		/**
		 * Search documents.
		 * @param string $match
		 */
		public function search($match) {
			if ($match == null || $match == "") {
				$sql = "SELECT A.*
						FROM {$_SESSION['DB_PREFIX']}documents A
						ORDER BY A.id";

				/* Prepare delete statement. */
				$stmt = SessionControllerClass::getDB()->prepare($sql);
				
			} else {
				$sql = "SELECT A.*
						FROM {$_SESSION['DB_PREFIX']}documents A
						WHERE MATCH(name, filename) AGAINST (?  IN BOOLEAN MODE)
						ORDER BY A.id";

				/* Prepare delete statement. */
				$stmt = SessionControllerClass::getDB()->prepare($sql);
				$stmt->bindValue(1, $match, PDO::PARAM_STR);
			}

			$this->populateRecords($stmt);
		}

		/**
		 * Load by session ID
		 * @param string $sessionid
		 */
		public function loadBySession($sessionid) {
			$sql = "SELECT A.*
					FROM {$_SESSION['DB_PREFIX']}documents A
					WHERE A.sessionid = ?
					ORDER BY A.id";
				
			/* Prepare delete statement. */
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $sessionid, PDO::PARAM_STR);

			$this->populateRecords($stmt);
		}
		
		/**
		 * Load by sub table.
		 * @param string $table
		 * @param string $key
		 * @param int $id
		 */
		public function loadBySubtable($table, $key, $id) {
			$table = pgDecrypt($table);
			$key = pgDecrypt($key);
			$sql = "SELECT A.*
					FROM {$_SESSION['DB_PREFIX']}documents A
					INNER JOIN {$_SESSION['DB_PREFIX']}$table C
					ON C.documentid = A.id
					WHERE C.$key = ?
					ORDER BY A.id";
		
			/* Prepare delete statement. */
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $id, PDO::PARAM_INT);
		
			$this->populateRecords($stmt);
		}
	}
?>