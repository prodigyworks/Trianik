<?php
	require_once(__DIR__ . "/../ui/AbstractBaseDataUIClass.php");
	require_once(__DIR__ . "/../businessobjects/PortletClass.php");
	require_once(__DIR__ . "/../businessobjects/PortletRoleClass.php");
	
	class PortletUIClass extends AbstractBaseDataUIClass {

		/**
		 * Insert portlet.
		 * @param array $properties
		 */
		public function insert($properties) {
			$portlet = new PortletClass();
		
			$this->mapUIToBO($properties, $portlet);
			$portlet->insertRecord();
		}
		
		/**
		 * Load
		 * @param ID $id
		 * @return string
		 */
		public function load($id) {
			$portlet = new PortletClass();
			$portlet->loadRecord($id);
			$portlet->getRoles(true);
				
			return $portlet->toJSON();
		}

		/**
		 * Load
		 * @param int $id
		 * @param string $roleid
		 */
		public function saveRoles($id, $roleid) {
			$user = new PortletClass();
			$user->loadRecord($id);
			$user->clearRoles();
		
			foreach ($roleid AS $role) {
				$userrole = new PortletRoleClass();
				$userrole->setPortletid($id);
				$userrole->setRoleid($role);
				$userrole->insertRecord();
			}
			
			return $user->toJSON();
		}
	}
?>