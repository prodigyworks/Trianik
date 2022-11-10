<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	require_once(__DIR__ . "/../businessobjects/PortletClass.php");

	/**
	 * @table portletroles
	 */
	class PortletRoleClass extends AbstractBaseDataClass {
	
		/** Properties **/
		private $id = null;
		private $roleid = null;
		private $portletid = null;
		
		/* One to one */
		private $portlet = null;
		 
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
		 * @return PortletClass
		 */
		public function getPortlet($load = true){
			if ($this->portlet == null && $load) {
				$this->portlet = new PortletClass();
		
				if ($this->getPortletid() != null) {
					$this->portlet->loadRecord($this->getPortletid());
				}
			}
		
			return $this->portlet;
		}
		
		/**
		 * id
		 * @param int $id
		 * @return int
		 */
		public function setId($id){
			$this->id = $id;
			return $this;
		}
		
		/**
		 * @primarykey true
		 * @column "id"
		 * @property
		 * id
		 * @return int
		 */
		public function getId(){
			return $this->id;
		}
		
		/**
		 * portletid
		 * @param int $portletid
		 * @return int
		 */
		public function setPortletid($portletid){
			$this->portletid = $portletid;
			return $this;
		}
		
		/**
		 * @column "portletid"
		 * @property
		 * portletid
		 * @return int
		 */
		public function getPortletid(){
			return $this->portletid;
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
	}
?>