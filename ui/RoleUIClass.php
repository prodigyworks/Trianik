<?php
	require_once(__DIR__ . "/../ui/AbstractBaseDataUIClass.php");
	require_once(__DIR__ . "/../businessobjects/RoleClass.php");
	require_once(__DIR__ . "/../businessobjects/UserRoleClass.php");
	
	class RoleUIClass extends AbstractBaseDataUIClass {
		
		/**
		 * Load
		 * @param int $roleid
		 * @return string
		 */
		public function load($roleid) {
			$role = new RoleClass();
			$role->loadRecord($roleid);
			
			foreach ($role->getUserRoles() AS $userrole) {
				/* Force lazy load. */
				$userrole->getUser();
			}
			
			return $role->toJSON();
		}
		
		/**
		 * Load
		 * @param int $roleid
		 * @param array $memberid
		 * @return string
		 */
		public function saveUserRoles($roleid, $memberid) {
			$user = new RoleClass();
			$user->loadRecord($roleid);
			$user->clearUserRoles();
				
			foreach ($memberid AS $member) {
				$userrole = new UserRoleClass();
				$userrole->setRoleid($user->getRoleid());
				$userrole->setMemberid($member);
				
				try {
					$userrole->insertRecord();
					
				} catch (Exception $e) {
					/* Ignore. */
				}
			}

			return $user->toJSON();
		}
	}
?>