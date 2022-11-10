<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseCollectionClass.php");
	require_once(__DIR__ . "/../businessobjects/AbsenceClass.php");
	
	/**
	 * @class "AbsenceClass"
	 */
	class AbsenceCollectionClass extends AbstractBaseCollectionClass {

	    /**
	     * Load by date range.
		 * @param DateTime $startdate
		 * @param DateTime $enddate
		 * @param mixed $callback
		 */
		public function loadByDateRange($startdate, $enddate, $callback) {
			$sql = "SELECT A.*
					FROM {$_SESSION['DB_PREFIX']}absence A
					WHERE startdate <= ?
					AND enddate >= ?";
					
			/* Prepare delete statement. */
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $enddate, PDO::PARAM_STR);
			$stmt->bindValue(2, $startdate, PDO::PARAM_STR);
				
			$this->populateRecords($stmt, $callback);
		}
			
		/**
		 * Records
		 * @return AbsenceClass
		 */
		public function getAbsences() {
			return parent::getRecords();
		}
	}
?>