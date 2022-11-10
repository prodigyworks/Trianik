<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	require_once(__DIR__ . "/../businessobjects/UserClass.php");

	/**
	 * @table userroles
	 */
	class UserRoleClass extends AbstractBaseDataClass {
	
		/** Properties **/
		private $userroleid = null;
		private $roleid = null;
		private $memberid = null;
		
		/* One to one */
		private $user = null;
		 
		/**
		 * Constructor
		 * @param boolean $publicMode Public mode.
		 * @param string $roleid Roleid
		 */
		public function __construct($publicMode = false, $roleid = "") {
			parent::__construct($publicMode);
			
			$this->roleid = $roleid;
		}
		
		/**
		 * @onetoone
		 * User
		 * @return UserClass
		 */
		public function getUser($load = true){
			if ($this->user == null && $load) {
				$this->user = new UserClass();
		
				if ($this->getMemberid() != null) {
					$this->user->loadRecord($this->getMemberid());
				}
			}
		
			return $this->user;
		}
		
		/**
		 * userroleid
		 * @param int $userroleid
		 * @return int
		 */
		public function setUserroleid($userroleid){
			$this->userroleid = $userroleid;
			return $this;
		}
		
		/**
		 * @primarykey true
		 * @column "userroleid"
		 * @property
		 * userroleid
		 * @return int
		 */
		public function getUserroleid(){
			return $this->userroleid;
		}
		
		/**
		 * roleid
		 * @param string $roleid
		 * @return string
		 */
		public function setRoleid($roleid){
			$this->roleid = $roleid;
			return $this;
		}
		
		/**
		 * @column "roleid"
		 * @property
		 * roleid
		 * @return string
		 */
		public function getRoleid(){
			return $this->roleid;
		}
		
		/**
		 * memberid
		 * @param int $memberid
		 * @return int
		 */
		public function setMemberid($memberid){
			$this->memberid = $memberid;
			return $this;
		}
		
		/**
		 * @column "memberid"
		 * @property
		 * memberid
		 * @return int
		 */
		public function getMemberid(){
			return $this->memberid;
		}
	}
?>