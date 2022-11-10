<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseCollectionClass.php");
	require_once(__DIR__ . "/../businessobjects/BankholidayClass.php");
	
	/**
	 * @class "BankholidayClass"
	 */
	class BankholidayCollectionClass extends AbstractBaseCollectionClass {

		/**
		 * Load by date range
		 * @param DateTime $startdate
		 * @param DateTime $enddate
		 * @param BankholidayClass $callback
		 */
		public function loadByDateRange($startdate, $enddate, $callback = null) {
			$sql = "SELECT A.*
					FROM {$_SESSION['DB_PREFIX']}bankholiday A
					WHERE (startdate >= ? AND startdate <= ?) 
					OR (enddate >= ? AND enddate <= ?)
					ORDER BY A.startdate";

			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $startdate, PDO::PARAM_STR);
			$stmt->bindValue(2, $enddate, PDO::PARAM_STR);
			$stmt->bindValue(3, $startdate, PDO::PARAM_STR);
			$stmt->bindValue(4, $enddate, PDO::PARAM_STR);
				
			$this->populateRecords($stmt, $callback);
		}

		/**
		 * @onetomany
		 * booking PODs
		 * @return BankholidayClass
		 */
		public function getBankholidays(){
			return $this->getRecords();
		}
	}
?>