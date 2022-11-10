<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");

	/** 
	 * @table "pageroles" 
	 */
	class PagerolesClass extends AbstractBaseDataClass {
	
        /* Properties. */
        private $pageroleid = null;
        private $pageid = null;
        private $roleid = null;
	
		/**
		 * pageroleid 
		 * @param int $pageroleid 
		 * @return int  
		 */
		public function setPageroleid($pageroleid){
			$this->pageroleid = $pageroleid;
			return $this;
		}
		
		/**
		 * @primarykey true 
		 * @column "pageroleid"
		 * @property
		 * pageroleid 
		 * @return int  
		 */
		public function getPageroleid(){
			return $this->pageroleid;
		}
			
		/**
		 * pageid 
		 * @param int $pageid 
		 * @return int  
		 */
		public function setPageid($pageid){
			$this->pageid = $pageid;
			return $this;
		}
		
		/**
		 * @column "pageid"
		 * @property
		 * pageid 
		 * @return int  
		 */
		public function getPageid(){
			return $this->pageid;
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
	    
