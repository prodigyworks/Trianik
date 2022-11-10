<?php
	require_once(__DIR__ . "/../businessobjects/ClientscheduleClass.php");
	require_once(__DIR__ . "/../businessobjects/UserClass.php");
	require_once(__DIR__ . "/../ui/AbstractBaseDataUIClass.php");
	
	class ClientscheduleUIClass extends AbstractBaseDataUIClass {

		/**
		 * Load
		 * @param int $id
		 * @return string
		 */
		public function remove($id) {
			$user = new ClientscheduleClass();
			$user->loadRecord($memberid);
			$user->getClient();
				
			return $user->toJSON();
		}	
		
		/**
		 * Remove
		 * @param int $id
		 * @return string
		 */
		public function remove($id) {
			$user = new ClientscheduleClass();
			$user->loadRecord($id);
			$user->deleteRecord();
			
			return $user->toJSON();
		}
	}
?>