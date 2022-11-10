<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseCollectionClass.php");
	require_once(__DIR__ . "/../businessobjects/ClientscheduleClass.php");
	
	/**
	 * @class "ClientscheduleClass"
	 */
	class ClientscheduleCollectionClass extends AbstractBaseCollectionClass {

	    /**
	     * Load by client.
		 * @param int $clientid
		 * @param int $weekday
		 * @param DateTime $date
		 * @param mixed $callback
		 */
		public function loadLiveClientSchedulesByWeekday($clientid, $weekday, $date, $callback) {
			$sql = "SELECT A.*
					FROM {$_SESSION['DB_PREFIX']}clientschedule A
					WHERE A.clientid = ?
					AND A.weekday = ?
					AND A.begindate <= ?
					AND (A.canceldate >= ? OR A.canceldate IS NULL OR A.canceldate = '0000-00-00' OR A.canceldate = '')
					AND A.id NOT IN
					(
						SELECT IFNULL(B.scheduleid, 0) FROM {$_SESSION['DB_PREFIX']}diary B
						WHERE DATE(B.starttime) >= ?
						AND DATE(B.endtime) <= ?
					)";
					
			/* Prepare delete statement. */
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $clientid, PDO::PARAM_INT);
			$stmt->bindValue(2, $weekday, PDO::PARAM_INT);
			$stmt->bindValue(3, $date, PDO::PARAM_STR);
			$stmt->bindValue(4, $date, PDO::PARAM_STR);
			$stmt->bindValue(5, $date, PDO::PARAM_STR);
			$stmt->bindValue(6, $date, PDO::PARAM_STR);
				
			$this->populateRecords($stmt, $callback);
		}
			
		/**
		 * Records
		 * @return ClientscheduleClass
		 */
		public function getClientschedules() {
			return parent::getRecords();
		}
	}
?>