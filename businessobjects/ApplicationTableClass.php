<?php
require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	
	/**
	 * @table "applicationtablecolumns"
	 */
	class ApplicationTableClass extends AbstractBaseDataClass {
	
		/* Properties. */
		private $id = null;
		private $pageid = null;
		private $memberid = null;
		
		/**
		 * id
	     * @primarykey true
		 * @property
		 * @column "id"
		 * @return int
		 */
		public function getId() {
			return $this->id;
		}
		
		/**
		 * id
		 * @param int $id
		 * @return ApplicationActionClass
		 */
		public function setId($id) {
			$this->id = $id;
			return $this;
		}
		
		/**
		 * pageid
		 * @property
		 * @column "pageid"
		 * @return int
		 */
		public function getPageid() {
			return $this->pageid;
		}
		
		/**
		 * pageid
		 * @param int $pageid
		 * @return ApplicationActionClass
		 */
		public function setPageid($pageid) {
			$this->pageid = $pageid;
			return $this;
		}
	
	    /**
	     * memberid
		 * @property
		 * @column "memberid"
	     * @return int
	     */
	    public function getMemberid(){
	        return $this->memberid;
	    }
	
	    /**
	     * memberid
	     * @param int $memberid
	     * @return ApplicationTableColumnClass
	     */
	    public function setMemberid($memberid){
	        $this->memberid = $memberid;
	        return $this;
	    }
	}
?>