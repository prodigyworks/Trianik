<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseCollectionClass.php");
	require_once(__DIR__ . "/../businessobjects/DiaryClass.php");
	
	/**
	 * @class "DiaryClass"
	 */
	class DiaryCollectionClass extends AbstractBaseCollectionClass {

	    /**
	     * Load by client.
		 * @param int $clientid
		 * @param DateTime $startdate
		 * @param DateTime $enddate
		 * @param mixed $callback
		 */
		public function loadDiaryByClientInDateRange($clientid, $startdate, $enddate, $callback = null) {
			$sql = "SELECT A.*
					FROM {$_SESSION['DB_PREFIX']}diary A
					WHERE A.deleted = 'N'
					AND A.clientid = ?
					AND DATE(A.starttime) <= ? 
					AND DATE(A.endtime) >= ? 
					ORDER BY A.starttime";
					
			/* Prepare delete statement. */
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $clientid, PDO::PARAM_INT);
			$stmt->bindValue(2, $enddate, PDO::PARAM_STR);
			$stmt->bindValue(3, $startdate, PDO::PARAM_STR);
				
			$this->populateRecords($stmt, $callback);
		}
		
		/**
		 * Load reports worked.
		 * @param int $year
		 * @param int $month
		 * @param mixed $callback
		 */
		public function loadReportsWorked($year, $month, $callback = null) {
			$sql = "SELECT A.*
					FROM {$_SESSION['DB_PREFIX']}diary A
					WHERE A.status IN ('I', 'C')
					AND YEAR(A.starttime) = ?
					AND MONTH(A.starttime) = ?
					AND A.deleted != 'Y'
					ORDER BY B.name";
				
			/* Prepare delete statement. */
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $year, PDO::PARAM_INT);
			$stmt->bindValue(2, $month, PDO::PARAM_INT);
		
			$this->populateRecords($stmt, $callback);
		}
		
		/**
		 * Load my planner.
		 * @param DateTime $date
		 * @param int $memberid
		 */
		public function loadMyPlanner($date, $memberid, $callback = null) {
			$sql = "SELECT A.*
					FROM {$_SESSION['DB_PREFIX']}diary A
					WHERE A.memberid = ?
					AND DATE(A.starttime) >= ?
					AND DATE(A.endtime) <= ?
					AND A.deleted != 'Y'
					ORDER BY A.starttime";
			
			/* Prepare delete statement. */
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $memberid, PDO::PARAM_INT);
			$stmt->bindValue(2, $date, PDO::PARAM_STR);
			$stmt->bindValue(3, $date, PDO::PARAM_STR);
			
			$this->populateRecords($stmt, $callback);
		}
			
		/**
		 * Records
		 * @return DiaryClass
		 */
		public function getDiarys() {
			return parent::getRecords();
		}
	}
?>