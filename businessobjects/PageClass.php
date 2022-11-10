<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	require_once(__DIR__ . "/../businessobjects/PageNavigationClass.php");
	require_once(__DIR__ . "/../businessobjects/ApplicationActionClass.php");
	
	/**
	 * @table "pages"
	 */
	class PageClass extends AbstractBaseDataClass {
		const PAGE_HOMEPAGE = 1;
		
		/** Properties **/
		private $pageid = null;
		private $pagename = null;
		private $label = null;
		private $type = null;
		private $mobilepagename = null;
		private $content = null;

		/** One to many **/
		private $childpages = null;
		private $childmenuitems = null;
		private $mobilemenuitems = null;
		private $actions = null;
		
		/**
		 * Get maximum sequence of navigation records.
		 * @return int
		 */
		public function getMaximumSequenceForPage() {
			$maxSequence = 0;
			 
			$sql = "SELECT MAX(sequence) AS maxseq
					FROM {$_SESSION['DB_PREFIX']}pagenavigation A
					WHERE A.pageid = ?";
		
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $this->getId(), PDO::PARAM_INT);
			$stmt->execute();
		
			$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
		
			foreach ($rows AS $row) {
				$maxSequence = $row['maxseq'];
			}
			 
			return $maxSequence + 100;
		}
		
		/**
		 * Load default role
		 */
		public function loadDefaultRolePage() {
			$roles = implode("', '", SessionControllerClass::getUser()->getRoles());
			$sql = "SELECT B.*
					FROM {$_SESSION['DB_PREFIX']}roles A
					INNER JOIN {$_SESSION['DB_PREFIX']}pages B
					ON B.pageid = A.defaultpageid
					WHERE roleid in ('$roles')
					ORDER BY priority
					LIMIT 1";
				
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->execute();
		
			$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
				
			foreach ($rows AS $row) {
				$this->loadRecordFromResultset($row);
			}
		}
		
		/**
		 * Load by page name.
		 * @param string $pagename
		 * @throws Exception
		 */
		public function loadByPageName($pagename) {
			$roles = implode("', '", SessionControllerClass::getUser()->getRoles());
			$sql = "SELECT DISTINCT A.*
					FROM {$_SESSION['DB_PREFIX']}pages A
					INNER JOIN {$_SESSION['DB_PREFIX']}pageroles B 
					ON B.pageid = A.pageid 
					AND B.roleid IN ('$roles')
					WHERE A.pagename = ?";

			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $pagename, PDO::PARAM_STR);
			$stmt->execute();
			
			$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
			
			foreach ($rows AS $row) {
				$this->loadRecordFromResultset($row);
			}
		}
		
		/**
		 * Delete by page ID.
		 */
		public function deletePageRoles() {
			$sql = "DELETE FROM {$_SESSION['DB_PREFIX']}pageroles
					WHERE pageid = ?";
				
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $this->getId(), PDO::PARAM_INT);
			$stmt->execute();
		}
		
	    /**
	     * @property
	     * id
	     * @return int
	     */
	    public function getId(){
	        return $this->getPageId();
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
	     * @primarykey true
	     * @column "pageid"
	     * @property
	     * pageid
	     * @return int
	     */
	    public function getPageid(){
	    	return $this->pageid;
	    }
	    
	    /**
	     * pagename
	     * @param string $pagename
	     * @return string
	     */
	    public function setPagename($pagename){
	    	$this->pagename = $pagename;
	    	return $this;
	    }
	    
	    /**
	     * @column "pagename"
	     * @property
	     * pagename
	     * @return string
	     */
	    public function getPagename(){
	    	return $this->pagename;
	    }
	    
	    /**
	     * label
	     * @param string $label
	     * @return string
	     */
	    public function setLabel($label){
	    	$this->label = $label;
	    	return $this;
	    }
	    
	    /**
	     * @column "label"
	     * @property
	     * label
	     * @return string
	     */
	    public function getLabel(){
	    	return $this->label;
	    }
	    
	    /**
	     * type
	     * @param string $type
	     * @return string
	     */
	    public function setType($type){
	    	$this->type = $type;
	    	return $this;
	    }
	    
	    /**
	     * @column "type"
	     * @property
	     * type
	     * @return string
	     */
	    public function getType(){
	    	return $this->type;
	    }
	    
	    /**
	     * mobilepagename
	     * @param string $mobilepagename
	     * @return string
	     */
	    public function setMobilepagename($mobilepagename){
	    	$this->mobilepagename = $mobilepagename;
	    	return $this;
	    }
	    
	    /**
	     * @column "mobilepagename"
	     * @property
	     * mobilepagename
	     * @return string
	     */
	    public function getMobilepagename(){
	    	return $this->mobilepagename;
	    }
	    
	    /**
	     * content
	     * @param text $content
	     * @return text
	     */
	    public function setContent($content){
	    	$this->content = $content;
	    	return $this;
	    }
	    
	    /**
	     * @column "content"
	     * @property
	     * content
	     * @return text
	     */
	    public function getContent(){
	    	return $this->content;
	    }
	    
	    /**
	     * Get action.
	     * @param string $code
	     * @return ApplicationActionClass
	     */
	    public function getAction($code, $description = null) {
	    	if (isset($this->getActions()[$code])) {
	    		return $this->getActions()[$code];
	    	}
	    	
	    	$action = new ApplicationActionClass();
	    	$action->setCode($code);
	    	$action->setDescription($description);
	    	$action->setPageid($this->getId());
	    	$action->insertRecord();
	    	
	    	$this->actions[$code] = $action;
	    	
	    	return $action;
	    }
	    	 
	    /**
	     * @onetomany
	     * Actions
	     * @return ApplicationActionClass
	     */
	    public function getActions($load = true){
	    	if ($this->actions == null && $load) {
	    		$this->actions = array();
	    		 
	    		$sql = "SELECT *
			    		FROM {$_SESSION['DB_PREFIX']}applicationactions
			    		WHERE pageid = ?";
	    			
	    		/* Prepare delete statement. */
	    		$stmt = SessionControllerClass::getDB()->prepare($sql);
	    		$stmt->bindValue(1, $this->pageid, PDO::PARAM_INT);
	    		$stmt->execute();
	    		
	    		$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
	    			
	    		foreach ($rows AS $row) {
	    			$action = new ApplicationActionClass();
	    			$action->loadRecordFromResultset($row);
	    			
	    			$this->actions[$action->getCode()] = $action;
				}
	    	}
	    	 
	    	return $this->actions;
	    }
	     
	    /**
	     * @onetomany
	     * Child menu items
	     * @return PageNavigationClass
	     */
	    public function getChildMenuItems($load = true){
	    	if ($this->childmenuitems == null && $load) {
	    		$this->childmenuitems = array();
	    		$roles = implode("', '", SessionControllerClass::getUser()->getRoles());
	    
	    		$sql = "SELECT DISTINCT A.* FROM {$_SESSION['DB_PREFIX']}pagenavigation A
			    		INNER JOIN {$_SESSION['DB_PREFIX']}pageroles B
			    		ON B.pageid = A.childpageid
			    		INNER JOIN {$_SESSION['DB_PREFIX']}pages C
			    		ON C.pageid = A.childpageid
			    		WHERE A.pageid = ?
			    		AND A.pagetype = 'M'
			    		AND B.roleid IN ('$roles')
			    		ORDER BY A.sequence";
	    
	    		$stmt = SessionControllerClass::getDB()->prepare($sql);
	    		$stmt->bindValue(1, $this->pageid);
	    		$stmt->execute();
	    		
	    		$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
	    			
	    		foreach ($rows AS $row) {
	    			$pagenav = new PageNavigationClass();
	    			$pagenav->loadRecordFromResultset($row);
	    			 
	    			/* Add leg to the array. */
	    			$this->childmenuitems[] = $pagenav;
    			}
	    	}
	    	 
	    	return $this->childmenuitems;
	    }

	    /**
	     * @onetomany
	     * Child menu items
	     * @return PageNavigationClass
	     */
	    public static function getMobileMenuItems($load = true){
    		$mobilemenuitems = array();
    		$roles = implode("', '", SessionControllerClass::getUser()->getRoles());
    	  
    		$sql = "SELECT A.*
		    		FROM {$_SESSION['DB_PREFIX']}pagenavigation A
		    		WHERE A.pagetype = 'X'
		    		ORDER BY A.sequence";

    		$stmt = SessionControllerClass::getDB()->prepare($sql);
    		$stmt->execute();
    			
    		$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
    			
    		foreach ($rows AS $row) {
    			$pagenav = new PageNavigationClass();
    			$pagenav->loadRecordFromResultset($row);
    			 
    			/* Add leg to the array. */
    			$mobilemenuitems[] = $pagenav;
    		}
	    	 
	    	return $mobilemenuitems;
	    }
	     
	    /**
	     * @onetomany
	     * Page Navigation
	     * @return PageNavigationClass
	     */
	    public function getChildPages($load = true){
	    	if ($this->childpages == null && $load) {
	    		$this->childpages = array();
	    		$roles = implode("', '", SessionControllerClass::getUser()->getRoles());
	    		 
	    		$sql = "SELECT DISTINCT A.* FROM {$_SESSION['DB_PREFIX']}pagenavigation A 
			    		INNER JOIN {$_SESSION['DB_PREFIX']}pageroles B 
			    		ON B.pageid = A.childpageid 
			    		INNER JOIN {$_SESSION['DB_PREFIX']}pages C 
			    		ON C.pageid = A.childpageid 
			    		WHERE A.pageid = ?
			    		AND A.pagetype = 'P' 
			    		AND B.roleid IN ('$roles') 
			    		ORDER BY A.sequence";
	    		 
	    		$stmt = SessionControllerClass::getDB()->prepare($sql);
	    		$stmt->bindValue(1, $this->pageid);
	    		$stmt->execute();
	    		 
	    		$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
	    		
	    		foreach ($rows AS $row) {
	    			$pagenav = new PageNavigationClass();
	    			$pagenav->loadRecordFromResultset($row);
	    			 
	    			/* Add leg to the array. */
	    			$this->childpages[] = $pagenav;
	    		}
    		}
	    
	    	return $this->childpages;
	    }
	    

	   /**
	    * Load breadcrumb trail
	    * @return PageClass Page trail
	    */
	    public function loadBreadcrumbTrail() {
	    	$trail = array();
	    	$trail[] = $this;
	    
    		$trail = $this->fetchParent($trail, $this);
	    	
	    	return $trail;
	    }
	    
	    /**
	     * Fetch parent.
	     * @trail array Page trail
	     * @param PageClass $page
	     * @return array Trail
	     */
	    private function fetchParent($trail, $page) {
	    	$navigation = new PageNavigationClass(true);
	    	$navigation->loadByChildPageId($page->getPageid());
	    
	    	if ($navigation->getPagenavigationid()!= null) {
	    		if ($page->getPageid() != $navigation->getPageid()) {
	    			$trail[] = $navigation->getPage();
	    			$trail = $this->fetchParent($trail, $navigation->getPage());
	    		}
	    
	    	} else {
	    		if ($page->getPageid() > PageClass::PAGE_HOMEPAGE) { /* Not a home connection */
	    			$homepage = new PageClass();
	    			$homepage->loadRecord(PageClass::PAGE_HOMEPAGE);
	    			
	    			$trail[] = $homepage;
	    		}
	    	}
	    	
	    	return $trail;
	    }
	}
?>