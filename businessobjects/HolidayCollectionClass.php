<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseCollectionClass.php");
	require_once(__DIR__ . "/../businessobjects/HolidayClass.php");
	require_once(__DIR__ . "/../businessobjects/HolidayAdminClass.php");
	
	/**
	 * @class "HolidayClass"
	 */
	class HolidayCollectionClass extends AbstractBaseCollectionClass {

		/**
		 * Load driver holidays accepted between dates.
		 * @param DateTime $startdate
		 * @param DateTime $enddate
		 * @param HolidayClass $callback
		 * @return HolidayCollectionClass
		 */
		public function loadHolidaysPendingBetweenDates($startdate, $enddate, $callback = null) {
			$sql = "SELECT A.*
					FROM {$_SESSION['DB_PREFIX']}holiday A
					INNER JOIN {$_SESSION['DB_PREFIX']}members B
					ON B.member_id = A.memberid
					WHERE A.accepteddate IS NULL
					AND
					(
						(? < A.enddate)
						AND
						(? >= A.startdate)
					)
					ORDER BY A.id";
		
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $startdate, PDO::PARAM_STR);
			$stmt->bindValue(2, $enddate, PDO::PARAM_STR);
		
			$this->populateRecords($stmt, $callback);
		}
		/**
		 * Load by date range.
		 * @param DateTime $startdate
		 * @param DateTime $enddate
		 * @param mixed $callback
		 */
		public function loadByDateRange($startdate, $enddate, $callback) {
			$sql = "SELECT A.*
			FROM {$_SESSION['DB_PREFIX']}holiday A
			WHERE startdate <= ?
			AND enddate >= ?";
				
			/* Prepare delete statement. */
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $enddate, PDO::PARAM_STR);
			$stmt->bindValue(2, $startdate, PDO::PARAM_STR);
		
			$this->populateRecords($stmt, $callback);
		}
		
		/**
		 * Load driver holidays accepted between dates.
		 * @param DateTime $startdate
		 * @param DateTime $enddate
		 * @param HolidayClass $callback
		 * @return HolidayCollectionClass
		 */
		public function loadHolidaysAcceptedBetweenDates($startdate, $enddate, $callback = null) {
			$sql = "SELECT A.*
					FROM {$_SESSION['DB_PREFIX']}holiday A
					INNER JOIN {$_SESSION['DB_PREFIX']}members B
					ON B.member_id = A.memberid
					WHERE A.accepteddate IS NOT NULL
					AND
					(
						(? < A.enddate)
						AND
						(? >= A.startdate)
					)
					ORDER BY A.id";
		
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $startdate, PDO::PARAM_STR);
			$stmt->bindValue(2, $enddate, PDO::PARAM_STR);
		
			$this->populateRecords($stmt, $callback);
		}
		
		/**
		 * @onetomany
		 * items
		 * @return HolidayClass
		 */
		public function getHolidays(){
			return $this->getRecords();
		}
	}
?>