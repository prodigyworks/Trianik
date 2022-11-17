<?php
	require_once(__DIR__ . "/../businessobjects/BankholidayClass.php");
	require_once(__DIR__ . "/../businessobjects/BankholidayCollectionClass.php");
	require_once(__DIR__ . "/../businessobjects/HolidayAdminClass.php");
	require_once(__DIR__ . "/../ui/AbstractBaseDataUIClass.php");
	
	class BankholidayUIClass extends AbstractBaseDataUIClass {
		
		/**
		 * Load
		 * @param DateTime $startdate
		 * @param DateTime $enddate
		 * @return string
		 */
		public function loadByDateRange($startdate, $enddate) {
			$bankholiday = new BankholidayCollectionClass();
			$bankholiday->loadByDateRange($startdate, $enddate);

			return $bankholiday->toJSON();
		}

		/**
		 * Load
		 * @param DateTime $startdate
		 * @param DateTime $enddate
		 * @param int $startdate
		 * @param int $enddate
		 * @return string
		 */
		public function workingdays(string $startdate, string $startdate_half, string $enddate, string $enddate_half): string {
			$days = HolidayAdminClass::weekDays($startdate, $enddate);
			$bankholiday = new BankholidayCollectionClass();
			$bankholiday->loadByDateRange($startdate, $enddate);
		
			foreach ($bankholiday->getBankholidays() AS $holiday) {
				$days -= $holiday->weekDays();
			}

			if ($startdate_half == 1) {
				$days -= 0.5;
			}

			if ($enddate_half == 1) {
				$days -= 0.5;
			}
				
			return json_encode(array("count" => $days));
		}
	}