<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	require_once(__DIR__ . "/../SimpleImage.php");
	
	/**
	 * @table "images"
	 */
	class ImageClass extends AbstractBaseDataClass {
		
		private $id = null;
		private $path = null;
		private $uuid = null;
		private $sessionid = null;
		private $mimetype = null;
		private $name = null;
		private $imgwidth = null;
		private $imgheight = null;
		private $tag = null;
		private $description = null;
		private $image = null;
		private $createddate = null;
				
		/* Constants. */
		public static $permittedImageFiles = array('image/gif', 'image/jpeg', 'image/png', 'image/x-png', 'image/x-icon');
		
		/**
		 * {@inheritDoc}
		 * @see AbstractBaseDataClass::insertRecord()
		 */
	    public function insertRecord() {
	    	if ($this->image == null) {
	    		return;
	    	}
	    	
	    	$this->uuid = uniqid();
	    	$this->createddate = date("Y-m-d H:I:s");
	    	$this->createdby = SessionControllerClass::getUser()->getMemberid();
	    	$this->lastmodifiedby = SessionControllerClass::getUser()->getMemberid();
	    	
	    	parent::insertRecord();
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
    		$this->name = str_replace(' ', '_', $_FILES[$name]['name']);
    		$this->mimetype = $_FILES[$name]['type'];
    		 
    		if ($this->mimetype == 'image/pjpeg') {
    			$this->mimetype = 'image/jpeg';
    		}
    	
			if (in_array($this->mimetype, self::$permittedImageFiles)) {
	    	 	switch ($_FILES[$name]['error']) {
	    	 		case 0:
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
	    	 			
	    		   		break;
	    		   		
	    	 		case 3:
	    	 		case 6:
	    	 		case 7:
	    	 		case 8:
	    	 			throw new Exception("Error uploading $name. Please try again.");
	    	 			
	    	 		case 4:
	    	 			throw new Exception("You didn't select a file to be uploaded.");
	    	 	}
	    	 	
	    	} else {
	    		throw new Exception("$name ($mimetype) is not an image.");
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
	     * image
	     * @return string
	     */
	    public function getImageBase64(){
	    	return "data:image/png;base64," . base64_encode($this->image);
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
	     * path
	     * @param string $path
	     * @return string
	     */
	    public function setPath($path){
	    	$this->path = $path;
	    	return $this;
	    }
	    
	    /**
	     * @column "path"
	     * @property
	     * path
	     * @return string
	     */
	    public function getPath(){
	    	return $this->path;
	    }
	    
	    /**
	     * uuid
	     * @param string $uuid
	     * @return string
	     */
	    public function setUuid($uuid){
	    	$this->uuid = $uuid;
	    	return $this;
	    }
	    
	    /**
	     * @column "uuid"
	     * @property
	     * uuid
	     * @return string
	     */
	    public function getUuid(){
	    	return $this->uuid;
	    }
	    
	    /**
	     * sessionid
	     * @param string $sessionid
	     * @return string
	     */
	    public function setSessionid($sessionid){
	    	$this->sessionid = $sessionid;
	    	return $this;
	    }
	    
	    /**
	     * @column "sessionid"
	     * @property
	     * sessionid
	     * @return string
	     */
	    public function getSessionid(){
	    	return $this->sessionid;
	    }
	    
	    /**
	     * mimetype
	     * @param string $mimetype
	     * @return string
	     */
	    public function setMimetype($mimetype){
	    	$this->mimetype = $mimetype;
	    	return $this;
	    }
	    
	    /**
	     * @column "mimetype"
	     * @property
	     * mimetype
	     * @return string
	     */
	    public function getMimetype(){
	    	return $this->mimetype;
	    }
	    
	    /**
	     * name
	     * @param string $name
	     * @return string
	     */
	    public function setName($name){
	    	$this->name = $name;
	    	return $this;
	    }
	    
	    /**
	     * @column "name"
	     * @property
	     * name
	     * @return string
	     */
	    public function getName(){
	    	return $this->name;
	    }
	    
	    /**
	     * imgwidth
	     * @param smallint $imgwidth
	     * @return smallint
	     */
	    public function setImgwidth($imgwidth){
	    	$this->imgwidth = $imgwidth;
	    	return $this;
	    }
	    
	    /**
	     * @column "imgwidth"
	     * @property
	     * imgwidth
	     * @return smallint
	     */
	    public function getImgwidth(){
	    	return $this->imgwidth;
	    }
	    
	    /**
	     * imgheight
	     * @param smallint $imgheight
	     * @return smallint
	     */
	    public function setImgheight($imgheight){
	    	$this->imgheight = $imgheight;
	    	return $this;
	    }
	    
	    /**
	     * @column "imgheight"
	     * @property
	     * imgheight
	     * @return smallint
	     */
	    public function getImgheight(){
	    	return $this->imgheight;
	    }
	    
	    /**
	     * tag
	     * @param string $tag
	     * @return string
	     */
	    public function setTag($tag){
	    	$this->tag = $tag;
	    	return $this;
	    }
	    
	    /**
	     * @column "tag"
	     * @property
	     * tag
	     * @return string
	     */
	    public function getTag(){
	    	return $this->tag;
	    }
	    
	    /**
	     * description
	     * @param string $description
	     * @return string
	     */
	    public function setDescription($description){
	    	$this->description = $description;
	    	return $this;
	    }
	    
	    /**
	     * @column "description"
	     * @property
	     * description
	     * @return string
	     */
	    public function getDescription(){
	    	return $this->description;
	    }
	    
	    /**
	     * image
	     * @param string $image
	     * @return string
	     */
	    public function setImage($image){
	    	$this->image = $image;
	    	return $this;
	    }
	    
	    /**
	     * @column "image"
	     * image
	     * @return string
	     */
	    public function getImage(){
	    	return $this->image;
	    }
	    
	    /**
	     * createddate
	     * @param timestamp $createddate
	     * @return timestamp
	     */
	    public function setCreateddate($createddate){
	    	$this->createddate = $createddate;
	    	return $this;
	    }
	    
	    /**
	     * @column "createddate"
	     * @property
	     * createddate
	     * @return timestamp
	     */
	    public function getCreateddate(){
	    	return $this->createddate;
	    }
	}
?>