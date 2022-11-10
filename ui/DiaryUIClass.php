<?php
	require_once(__DIR__ . "/../businessobjects/DiaryClass.php");
	require_once(__DIR__ . "/../businessobjects/UserClass.php");
	require_once(__DIR__ . "/../ui/AbstractBaseDataUIClass.php");
	
	class DiaryUIClass extends AbstractBaseDataUIClass {

		/**
		 * Load
		 * @param int $id
		 * @return string
		 */
		public function load($id) {
			$diary = new DiaryClass();
			$diary->loadRecord($id);
			$diary->getClient();
				
			return $diary->toJSON();
		}

		/**
		 * Remove
		 * @param int $id
		 * @return string
		 */
		public function remove($id) {
			$diary = new DiaryClass();
			$diary->loadRecord($id);
			$diary->setDeleted("Y");
			$diary->updateRecord();
				
			return $diary->toJSON();
		}

		/**
		 * Clock out
		 * @param int $id
		 * @return string
		 */
		public function clockOut($id) {
			$diary = new DiaryClass();
			$diary->loadRecord($id);
			$diary->clockOut();
		
			return $diary->toJSON();
		}
		
		/**
		 * Clock in
		 * @param int $id
		 * @return string
		 */
		public function clockIn($id) {
			$diary = new DiaryClass();
			$diary->loadRecord($id);
			$diary->clockIn();
		
			return $diary->toJSON();
		}
		
		/**
		 * Update schedule.
		 * @param int $id
		 * @param array $properties
		 */
		public function update($id, $properties) {
			$schedule = new DiaryClass();
			$schedule->loadRecord($id);
		
			$this->mapUIToBO($properties, $schedule);

			if ($schedule->getStatus() == "U") {
				$schedule->setStarttime($properties['dummy_starttime']);
				$schedule->setEndtime($properties['dummy_enddate']);
			
			} else if ($schedule->getStatus() == "I") {
				$schedule->setActualstarttime($properties['dummy_starttime']);
				$schedule->setEndtime($properties['dummy_enddate']);
			
			} else {
				$schedule->setActualstarttime($properties['dummy_starttime']);
				$schedule->setActualendtime($properties['dummy_enddate']);
			}
				
			$schedule->updateRecord();
		
			return $schedule->toJSON();
		}
		
		/**
		 * Schedule change.
		 * 
		 * @param int $id
		 * @param int $memberid
		 * @param String $clientname
		 * @param int $weekday
		 * @return string
		 */
		public function scheduleChange($id, $memberid, $clientname, $weekday) {
			if ($weekday == 0) $day = "Sunday";
			if ($weekday == 1) $day = "Monday";
			if ($weekday == 2) $day = "Tuesday";
			if ($weekday == 3) $day = "Wednesday";
			if ($weekday == 4) $day = "Thursday";
			if ($weekday == 5) $day = "Friday";
			if ($weekday == 6) $day = "Saturday";
				
			UserClass::getUser($memberid)->sendEmail("Schedule change", "Client '$clientname' scheduled for '$day' has been cancelled");
			
			DiaryClass::deleteByUnplannedByScheduleId($id);
			
			return json_encode(array("deleted" => true));
		}
	}
?>