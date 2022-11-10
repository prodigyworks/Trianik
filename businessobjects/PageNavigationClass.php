<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	require_once(__DIR__ . "/../businessobjects/PageClass.php");
	
	/**
	 * @table "pagenavigation"
	 */
	class PageNavigationClass extends AbstractBaseDataClass {
		const PAGENAVIGATIONTYPE_MOBILE = "X";
		const PAGENAVIGATIONTYPE_PAGE = "P";
		const PAGENAVIGATIONTYPE_MENU = "M";
		const PAGENAVIGATIONTYPE_HIDDEN = "L";
				
		/* Properties. */
		private $pagenavigationid = null;
		private $pageid = null;
		private $childpageid = null;
		private $sequence = null;
		private $pagetype = null;
		private $title = null;
		private $divider = null;
		private $target = null;
		private $color = null;

		/** One to one **/
		private $page = null;
		private $childpage = null;
		
		/**
		 * Load by child page ID
		 * @param int $childpageid
		 * @return PageNavigationClass
		 * @throws Exception
		 */
		public function loadByChildPageId($childpageid) {
			$sql = "SELECT *
					FROM {$_SESSION['DB_PREFIX']}pagenavigation
					WHERE childpageid = ?";
			
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $childpageid, PDO::PARAM_INT);
			$stmt->execute();
			
			$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
			 
			foreach ($rows AS $row) {
				$this->loadRecordFromResultset($row);
			}
		}

		/**
		 * Load by child page ID
		 * @param int $pageid
		 * @param int $childpageid
		 * @return PageNavigationClass
		 * @throws Exception
		 */
		public function loadByParentAndChildPageId($pageid, $childpageid) {
			$sql = "SELECT *
					FROM {$_SESSION['DB_PREFIX']}pagenavigation
					WHERE pageid = ?
					AND childpageid = ?";
				
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $pageid, PDO::PARAM_INT);
			$stmt->bindValue(2, $childpageid, PDO::PARAM_INT);
			$stmt->execute();
				
			$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
				
			foreach ($rows AS $row) {
				$this->loadRecordFromResultset($row);
			}
		}

		/**
		 * Load previous sibling
		 * @return PageNavigationClass
		 * @throws Exception
		 */
		public function loadPreviousSibling() {
			$sibling = null;
			$sql = "SELECT *
					FROM {$_SESSION['DB_PREFIX']}pagenavigation A
					WHERE A.pageid = ? AND
					A.sequence < ?
					ORDER BY A.sequence DESC 
					LIMIT 1";
				
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $this->pageid, PDO::PARAM_INT);
			$stmt->bindValue(2, $this->sequence, PDO::PARAM_INT);
			$stmt->execute();
		
			$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
		
			foreach ($rows AS $row) {
				$sibling = new PageNavigationClass();
				$sibling->loadRecordFromResultset($row);
			}
				
			return $sibling;
		}

		/**
		 * Load next sibling
		 * @return PageNavigationClass
		 * @throws Exception
		 */
		public function loadNextSibling() {
			$sibling = null;
			$sql = "SELECT *
					FROM {$_SESSION['DB_PREFIX']}pagenavigation A
					WHERE A.pageid = ? AND
					A.sequence > ?
					ORDER BY A.sequence
					LIMIT 1";
				
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $this->pageid, PDO::PARAM_INT);
			$stmt->bindValue(2, $this->sequence, PDO::PARAM_INT);
			$stmt->execute();
		
			$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
		
			foreach ($rows AS $row) {
				$sibling = new PageNavigationClass();
				$sibling->loadRecordFromResultset($row);
			}

			return $sibling;
		}
		
		/**
		 * {@inheritDoc}
		 * @see AbstractBaseDataClass::updateRecord()
		 */
		public function updateRecord() {
			parent::updateRecord();

			$cache = new Cache(array(
					'name'      => 'page-cache',
					'path'      => __DIR__ . "/../tmp/",
					'extension' => '.cache'
			));
				
			$cache->eraseAll();
		}

		/**
		 * {@inheritDoc}
		 * @see AbstractBaseDataClass::insertRecord()
		 */
		public function insertRecord() {
			parent::insertRecord();

			$cache = new Cache(array(
					'name'      => 'page-cache',
					'path'      => __DIR__ . "/../tmp/",
					'extension' => '.cache'
			));
			
			$cache->eraseAll();
		}
		
		/**
		 * Move up.
		 */
		public function moveUp() {
			$sibling = $this->loadPreviousSibling();
				
			if ($sibling != null) {
				$siblingSequence = $sibling->getSequence();
				
				$sibling->setSequence($this->getSequence());
				$sibling->updateRecord();
				
				$this->setSequence($siblingSequence);
				$this->updateRecord();
			}
		}

		/**
		 * Move down.
		 */
		public function moveDown() {
			$sibling = $this->loadNextSibling();
				
			if ($sibling != null) {
				$siblingSequence = $sibling->getSequence();
		
				$sibling->setSequence($this->getSequence());
				$sibling->updateRecord();
		
				$this->setSequence($siblingSequence);
				$this->updateRecord();
			}
		}
		
		/**
		 * pagenavigationid
		 * @param int $pagenavigationid
		 * @return int
		 */
		public function setPagenavigationid($pagenavigationid){
			$this->pagenavigationid = $pagenavigationid;
			return $this;
		}
		
		/**
		 * @primarykey true
		 * @column "pagenavigationid"
		 * @property
		 * pagenavigationid
		 * @return int
		 */
		public function getPagenavigationid(){
			return $this->pagenavigationid;
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
		 * childpageid
		 * @param int $childpageid
		 * @return int
		 */
		public function setChildpageid($childpageid){
			$this->childpageid = $childpageid;
			return $this;
		}
		
		/**
		 * @column "childpageid"
		 * @property
		 * childpageid
		 * @return int
		 */
		public function getChildpageid(){
			return $this->childpageid;
		}
		
		/**
		 * sequence
		 * @param int $sequence
		 * @return int
		 */
		public function setSequence($sequence){
			$this->sequence = $sequence;
			return $this;
		}
		
		/**
		 * @column "sequence"
		 * @property
		 * sequence
		 * @return int
		 */
		public function getSequence(){
			return $this->sequence;
		}
		
		/**
		 * pagetype
		 * @param string $pagetype
		 * @return string
		 */
		public function setPagetype($pagetype){
			$this->pagetype = $pagetype;
			return $this;
		}
		
		/**
		 * @column "pagetype"
		 * @property
		 * pagetype
		 * @return string
		 */
		public function getPagetype(){
			return $this->pagetype;
		}
		
		/**
		 * title
		 * @param string $title
		 * @return string
		 */
		public function setTitle($title){
			$this->title = $title;
			return $this;
		}
		
		/**
		 * @column "title"
		 * @property
		 * title
		 * @return string
		 */
		public function getTitle(){
			return $this->title;
		}
		
		/**
		 * divider
		 * @param int $divider
		 * @return int
		 */
		public function setDivider($divider){
			$this->divider = $divider;
			return $this;
		}
		
		/**
		 * @column "divider"
		 * @property
		 * divider
		 * @return int
		 */
		public function getDivider(){
			return $this->divider;
		}
		
		/**
		 * target
		 * @param string $target
		 * @return string
		 */
		public function setTarget($target){
			$this->target = $target;
			return $this;
		}
		
		/**
		 * @column "target"
		 * @property
		 * target
		 * @return string
		 */
		public function getTarget(){
			return $this->target;
		}
		
		/**
		 * color
		 * @param string $color
		 * @return string
		 */
		public function setColor($color){
			$this->color = $color;
			return $this;
		}
		
		/**
		 * @column "color"
		 * @property
		 * color
		 * @return string
		 */
		public function getColor(){
			return $this->color;
		}
	
	    /**
	     * @onetoone
	     * page
	     * @return PageClass
	     */
	    public function getPage($load = true){
	    	if ($this->page == null && $load) {
	    		$this->page = new PageClass();
	    	
	    		if ($this->getPageid() != null) {
	    			$this->page->loadRecord($this->getPageid());
	    		}
	    	}
	    	
	    	return $this->page;
	    }

	    /**
	     * @onetoone
	     * Child page
	     * @return PageClass
	     */
	    public function getChildPage($load = true){
	    	if ($this->childpage == null && $load) {
	    		$this->childpage = new PageClass();
	    
	    		if ($this->getChildpageid() != null) {
	    			$this->childpage->loadRecord($this->getChildpageid());
	    		}
	    	}
	    
	    	return $this->childpage;
	    }
    }
?>