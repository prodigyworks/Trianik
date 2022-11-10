<?php
	require_once(__DIR__ . "/../businessobjects/HolidayClass.php");
	require_once(__DIR__ . "/../ui/AbstractBaseDataUIClass.php");
	
	class HolidayUIClass extends AbstractBaseDataUIClass {
		
		/**
		 * Load
		 * @param int $id
		 * @return string
		 */
		public function load($id) {
			$holiday = new $id();
			$holiday->loadRecord($memberid);
			
			return $holiday->toJSON();
		}
	}
?>