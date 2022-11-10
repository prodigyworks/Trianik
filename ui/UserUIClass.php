<?php
	require_once(__DIR__ . "/../businessobjects/UserClass.php");
	require_once(__DIR__ . "/../businessobjects/UserRoleClass.php");
	require_once(__DIR__ . "/../ui/AbstractBaseDataUIClass.php");
	
	class UserUIClass extends AbstractBaseDataUIClass {
		
		/**
		 * Load
		 * @param array $array
		 * @return string
		 */
		public function load($memberid) {
			$user = new UserClass();
			$user->loadRecord($memberid);
			$user->getUserRoles();
			
			return $user->toJSON();
		}

		/**
		 * Load by email
		 * @param string $email 
		 * @return string
		 */
		public function loadByEmail($email) {
			$user = new UserClass();
			$user->loadByEmail($email);
				
			return $user->toJSON();
		}

		/**
		 * Load by login
		 * @param array $array
		 * @return string
		 */
		public function loadByLogin($login) {
			$user = new UserClass();
			$user->loadByLogin($login);
		
			return $user->toJSON();
		}

		/**
		 * Change password
		 * @param int $memberid
		 * @param string $password
		 * @return string
		 */
		public function changePassword($memberid, $password) {
			$user = new UserClass();
			$user->loadRecord($memberid);
			$user->changePassword($password);
		
			return $user->toJSON();
		}
		
		/**
		 * Verify pin code.
		 * @param int $id
		 * @param string $pincode
		 * @return string
		 */
		public function verifyPin($id, $pincode) {
			$user = new UserClass();
			$user->loadRecord($id);
			
			if ($pincode == $user->getPincode()) {
				return json_encode(array("returnvalue" => "Y"));
			}
			
			return json_encode(array("returnvalue" => "N"));
		}

		/**
		 * Forgot password
		 * @param string $login
		 * @return string
		 */
		public function resetPassword($login) {
			$user = new UserClass(true);
			$user->loadByLogin($login);
			$user->resetPassword();
				
			return $user->toJSON();
		}
		
		/**
		 * Load
		 * @param array $array
		 * @return string
		 */
		public function saveRoles($memberid, $roleid) {
			$user = new UserClass();
			$user->loadRecord($memberid);
			$user->clearUserRoles();
				
			foreach ($roleid AS $role) {
				$userrole = new UserRoleClass();
				$userrole->setMemberid($memberid);
				$userrole->setRoleid($role);
				$userrole->insertRecord();
			}

			return $user->toJSON();
		}
	}
?>