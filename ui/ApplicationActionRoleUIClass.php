<?php
	require_once(__DIR__ . "/../ui/AbstractBaseDataUIClass.php");
	require_once(__DIR__ . "/../businessobjects/ApplicationActionRoleCollectionClass.php");
	
	class ApplicationActionRoleUIClass extends AbstractBaseDataUIClass {

		/**
		 * Load by action ID
		 * @param int $actionid
		 */
		public function loadByActionID($actionid) {
			$actionRoles = new ApplicationActionRoleCollectionClass();
			$actionRoles->loadByActionID($actionid);
			
			foreach ($actionRoles->getRecords() AS $record) {
				$this->addComboOption($record->getRoleid(), $record->getRoleid());
			}
			
			return $this->getComboOptions();
		}
	}
?>