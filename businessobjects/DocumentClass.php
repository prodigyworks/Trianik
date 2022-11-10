<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	require_once(__DIR__ . "/../businessobjects/UserClass.php");
	require_once(__DIR__ . "/../businessobjects/ImageClass.php");
	require_once(__DIR__ . "/../SimpleImage.php");
	
	/**
	 * @table "documents"
	 */
	class DocumentClass extends AbstractBaseDataClass {
		
		private $id = null;
		private $name = null;
		private $filename = null;
		private $mimetype = null;
		private $roleid = null;
		private $expirydate = null;
		private $size = null;
		private $compressed = null;
		private $image = null;
		private $createdby = null;
		private $createddate = null;
		private $lastmodifiedby = null;
		private $lastmodifieddate = null;
		private $sessionid = null;
		
		/* Meta info. */
		private $subtablename = null;
		private $subtablepkname = null;
		private $subtablepkvalue = null;
		
		/* One to one. */
		private $creator = null;
		
		/**
		 * Associate session documents.
		 */
		public static function associateDocuments() {
			$sql = "UPDATE {$_SESSION['DB_PREFIX']}documents SET
					sessionid = NULL
					WHERE sessionid = ?";
				
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(2, session_id(), PDO::PARAM_STR);
			$stmt->execute();
		}
		
		/**
		 * Clear session documents.
		 */
		public static function clearSessionDocuments() {
			$sql = "DELETE FROM {$_SESSION['DB_PREFIX']}documents 
					WHERE sessionid = ?";
			
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, session_id(), PDO::PARAM_STR);
			$stmt->execute();
		}
	    
    	/**
    	 * Upload from file.
    	 * @param string $name
    	 * @param int $maxHeight
    	 * @param int $maxWidth
    	 * @throws Exception
    	 */
    	public function uploadFromFile($name, $maxHeight = 1000, $maxWidth = 1000) {
    		if (! is_uploaded_file($_FILES[$name]['tmp_name'])) {
    			return;
    		}
    	
    		$this->id = 0;
    		 
    		/* replace any spaces in original filename with underscores. */
    		$this->filename = str_replace(' ', '_', $_FILES[$name]['name']);
    		$this->mimetype = $_FILES[$name]['type'];
    		 
    		if ($this->mimetype == 'image/pjpeg') {
    			$this->mimetype = 'image/jpeg';
    		}
    		 
    		switch ($_FILES[$name]['error']) {
    			case 0:
    				if (in_array($this->mimetype, ImageClass::$permittedImageFiles)) {
    					/* get the dimensions. */
    					$size = getimagesize($_FILES[$name]['tmp_name']);
    					$this->imgwidth = $size[0];
    					$this->imgheight = $size[1];
    					 
    					if ($this->imgwidth > $maxWidth || $this->imgheight > $maxHeight) {
    						$image = new SimpleImage();
    						$image->load($_FILES[$name]['tmp_name']);
    	
    						if (($this->imgwidth - $maxWidth) > ($this->imgheight - $maxHeight)) {
    							$image->resizeToWidth($maxWidth);
    							 
    						} else {
    							$image->resizeToHeight($maxHeight);
    						}
    	
    						ob_start();
    						$image->output();
    						$this->image = ob_get_clean();
    	
    					} else {
    						$this->image = file_get_contents($_FILES[$name]['tmp_name']);
    					}
    					
    				} else {
    					$this->image = file_get_contents($_FILES[$name]['tmp_name']);
    				}
   
    				$this->size = strlen($this->image);
    				
   					break;
    	
    			case 3:
    			case 6:
    			case 7:
    			case 8:
    				throw new Exception("Error uploading $name. Please try again.");
    	
    			case 4:
    				throw new Exception("You didn't select a file to be uploaded.");
    		}
    	}
		
		/**
		 * {@inheritDoc}
		 * @see AbstractBaseDataClass::insertRecord()
		 */
		public function insertRecord() {
			$this->createddate = date("Y-m-d H:I:s");
			$this->lastmodifieddate = date("Y-m-d H:I:s");
			$this->createdby = SessionControllerClass::getUser()->getMemberid();
			$this->lastmodifiedby = SessionControllerClass::getUser()->getMemberid();
			
			if (substr($this->image, 0, 5) == "data:") {
				/* Base 64. */
				$this->mimetype = substr($this->image, 5, strpos($this->image, ";") - 5);
				$this->image = base64_decode(substr($this->image, strpos($this->image, ",") + 1));
			}

			$this->size = strlen($this->image);

			if ($this->getCompressed() == 1) {
				$this->image = gzcompress($this->image, 9);
			}

			parent::insertRecord();
				
			/* sub tables support. */
			if ($this->subtablename != null) {
				$sql = "INSERT INTO {$_SESSION['DB_PREFIX']}{$this->subtablename}
						(
							{$this->subtablepkname}, documentid, createddate,
							metacreateddate, metacreateduserid,
							metamodifieddate, metamodifieduserid
						)
						VALUES
						(
							?, ?, NOW(),
							NOW(), ?,
							NOW(), ?
						)";
			
				$stmt = SessionControllerClass::getDB()->prepare($sql);
				$stmt->bindValue(1, $this->subtablepkvalue, PDO::PARAM_INT);
				$stmt->bindValue(2, $this->getId(), PDO::PARAM_INT);
				$stmt->bindValue(3, SessionControllerClass::getUser()->getMemberid(), PDO::PARAM_INT);
				$stmt->bindValue(4, SessionControllerClass::getUser()->getMemberid(), PDO::PARAM_INT);
				$stmt->execute();			
			}
		}
	    
	    /**
	     * @property
	     * suffix
	     * @return string
	     */
	    public function getSuffix(){
	    	return "." . substr($this->mimetype, strpos($this->mimetype, "/") + 1);
	    }
	     
	    /**
	     * id
	     * @primarykey true
	     * @property
	     * @column "id"
	     * @return int
	     */
	    public function getId(){
	        return $this->id;
	    }
	    
	    /**
	     * Set ID.
	     * @param int $id
	     */
	    public function setId($id) {
	    	$this->id = $id;
	    }

	    /**
	     * name
	     * @property
	     * @column "name"
	     * @return string
	     */
	    public function getName(){
	    	if ($this->name == null || $this->name == "") {
	    		return $this->filename;
	    	}
	    	
	        return $this->name;
	    }
	
	    /**
	     * name
	     * @param int $name
	     * @return DocumentClass
	     */
	    public function setName($name){
	        $this->name = $name;
	        return $this;
	    }
	
	    /**
	     * @property
	     * @column "filename"
	     * filename
	     * @return string
	     */
	    public function getFilename(){
	        return $this->filename;
	    }
	
	    /**
	     * filename
	     * @param string $filename
	     * @return DocumentClass
	     */
	    public function setFilename($filename){
	        $this->filename = $filename;
	        return $this;
	    }
	
	    /**
	     * @property
	     * @column "mimetype"
	     * mimetype
	     * @return int
	     */
	    public function getMimeType(){
	        return $this->mimetype;
	    }
	
	    /**
	     * mimetype
	     * @param int $mimetype
	     * @return DocumentClass
	     */
	    public function setMimeType($mimetype){
	        $this->mimetype = $mimetype;
	        return $this;
	    }
	
	    /**
	     * @property
	     * expirydate
	     * @column "expirydate"
	     * @return DateTime
	     */
	    public function getExpiryDate(){
	        return $this->expirydate;
	    }
	
	    /**
	     * expirydate
	     * @param DateTime $expirydate
	     * @return DocumentClass
	     */
	    public function setExpiryDate($expirydate){
	        $this->expirydate = $expirydate;
	        return $this;
	    }
	
	    /**
	     * image
	     * @column "image"
	     * @return string
	     */
	    public function getImage(){
	        return $this->image;
	    }
	
	    /**
	     * image
	     * @param string $image
	     * @return DocumentClass
	     */
	    public function setImage($image){
	        $this->image = $image;
	        return $this;
	    }
	
	    /**
	     * @property
	     * @column "roleid"
	     * roleid
	     * @return int
	     */
	    public function getRoleID(){
	        return $this->roleid;
	    }
	
	    /**
	     * roleid
	     * @param int $roleid
	     * @return DocumentClass
	     */
	    public function setRoleID($roleid){
	        $this->roleid = $roleid;
	        return $this;
	    }

	    /**
	     * size
	     * @column "size"
	     * @return int
	     */
	    public function getSize(){
	        return $this->size;
	    }

	    /**
	     * Is expired.
	     * @property
	     * @return boolean
	     */
	    public function isExpired() {
	    	if ($this->getExpiryDate() != null) {
	    		if (strtotime($this->getExpiryDate()) < strtotime(date("Y-m-d"))) {
	    			return true;
	    		}
	    	}
	    
	    	return false;
	    }

	    /**
	     * Is permitted
	     * @property
	     * @return boolean
	     */
	    public function isPermitted() {
	    	if ($this->getRoleID() != null) {
	    		if (! SessionControllerClass::getUser()->hasRole($this->getRoleID()) && 
	    			  SessionControllerClass::getUser()->getMemberid() != $this->getMetacreateduserid()) {
	    			  	
	    			return false;
	    		}
	    	}
	    	
	    	return true;
    	}

	    /**
	     * Display size
	     * @property
	     * @return string
	     */
	    public function getDisplaySize() {
	    	if ($this->size > 1073741824) {
	    		return floor($this->size / 1073741824) . " gb";
	    			
	    	} else if ($this->size > 1048576) {
	    		return floor($this->size / 1048576) . " mb";
	    			
	    	} else if ($this->size > 1024) {
	    		return floor($this->size / 1024) . " kb";
	    			
	    	} else {
	    		return "{$this->size} bytes";
	    	}
	    }
	
	    /**
	     * size
	     * @param int $size
	     * @return DocumentClass
	     */
	    public function setSize($size){
	        $this->size = $size;
	        return $this;
	    }
	
	    /**
	     * @property
	     * @column "sessionid"
	     * sessionid
	     * @return int
	     */
	    public function getSessionid(){
	        return $this->sessionid;
	    }
	
	    /**
	     * sessionid
	     * @param int $sessionid
	     * @return DocumentClass
	     */
	    public function setSessionid($sessionid){
	        $this->sessionid = $sessionid;
	        return $this;
	    }
	
	    /**
	     * @property
	     * compressed
	     * @column "compressed"
	     * @return int
	     */
	    public function getCompressed(){
	        return $this->compressed;
	    }
	
	    /**
	     * compressed
	     * @param int $compressed
	     * @return DocumentClass
	     */
	    public function setCompressed($compressed){
	        $this->compressed = $compressed;
	        return $this;
	    }
	
	    /**
	     * @property
	     * createdby
	     * @column "createdby"
	     * @return int
	     */
	    public function getCreatedby(){
	        return $this->createdby;
	    }
	
	    /**
	     * createdby
	     * @param int $createdby
	     * @return DocumentClass
	     */
	    public function setCreatedby($createdby){
	        $this->createdby = $createdby;
	        return $this;
	    }
	
	    /**
	     * @property
	     * createddate
	     * @column "createddate"
	     * @return DateTime
	     */
	    public function getCreateddate(){
	        return $this->createddate;
	    }
	
	    /**
	     * createddate
	     * @param DateTime $createddate
	     * @return DocumentClass
	     */
	    public function setCreateddate($createddate){
	        $this->createddate = $createddate;
	        return $this;
	    }
	
	    /**
	     * @property
	     * lastmodifiedby
	     * @column "lastmodifiedby"
	     * @return int
	     */
	    public function getLastmodifiedby(){
	        return $this->lastmodifiedby;
	    }
	
	    /**
	     * lastmodifiedby
	     * @param int $lastmodifiedby
	     * @return DocumentClass
	     */
	    public function setLastmodifiedby($lastmodifiedby){
	        $this->lastmodifiedby = $lastmodifiedby;
	        return $this;
	    }
	
	    /**
	     * @property
	     * lastmodifieddate
	     * @column "lastmodifieddate"
	     * @return DateTime
	     */
	    public function getLastmodifieddate(){
	        return $this->lastmodifieddate;
	    }
	
	    /**
	     * lastmodifieddate
	     * @param DateTime $lastmodifieddate
	     * @return DocumentClass
	     */
	    public function setLastmodifieddate($lastmodifieddate){
	        $this->lastmodifieddate = $lastmodifieddate;
	        return $this;
	    }
	
	    /**
	     * @onetoone
	     * User
	     * @return UserClass
	     */
	    public function getCreator($load = true){
	    	if ($this->creator == null && $load) {
	    		$this->creator = new UserClass();
	    
	    		if ($this->getCreatedby() != null) {
	    			$this->creator->loadRecord($this->getCreatedby());
	    		}
	    	}
	    
	    	return $this->creator;
	    }
    
	    /**
	     * subtablename
	     * @param string $subtablename
	     * @return DocumentClass
	     */
	    public function setSubtablename($subtablename){
	        $this->subtablename = $subtablename;
	        return $this;
	    }
	
	    /**
	     * subtablepkname
	     * @param string $subtablepkname
	     * @return DocumentClass
	     */
	    public function setSubtablepkname($subtablepkname){
	        $this->subtablepkname = $subtablepkname;
	        return $this;
	    }
	
	    /**
	     * subtablepkvalue
	     * @param int $subtablepkvalue
	     * @return DocumentClass
	     */
	    public function setSubtablepkvalue($subtablepkvalue){
	        $this->subtablepkvalue = $subtablepkvalue;
	        return $this;
	    }
	}
?>