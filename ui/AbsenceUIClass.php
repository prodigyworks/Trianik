<?php
	require_once(__DIR__ . "/../businessobjects/AbsenceClass.php");
	require_once(__DIR__ . "/../ui/AbstractBaseDataUIClass.php");
	
	class AbsenceUIClass extends AbstractBaseDataUIClass {
		
		/**
		 * Load
		 * @param array $array
		 * @return string
		 */
		public function load($memberid) {
			$user = new AbsenceClass();
			$user->loadRecord($memberid);
			
			return $user->toJSON();
		}
	}
?>