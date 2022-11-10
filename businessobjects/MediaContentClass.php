<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	
	/**
	 * @table mediatemplate
	 */
	class MediaContentClass extends AbstractBaseDataClass {
		/** Properties **/
		private $id = null;
		private $code = null;
		private $name = null;
		private $media = null;
		private $html = null;
		
		/**
		 * Load media content by code.
		 * @param $code Code
		 * @return MediaContentClass
		 * @throws Exception
		 */
		public static function loadByCode($code) {
			$mediatemplate = new MediaContentClass(true);
			$sql = "SELECT *
					FROM {$_SESSION['DB_PREFIX']}mediatemplate
					WHERE code = ?";
			
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $code, PDO::PARAM_STR);
				
			$mediatemplate->loadRowFromStatement($stmt);
			
			if ($mediatemplate->getId() == null) {
				throw new Exception("Missing media content - $code");
			}
			
			return $mediatemplate;
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
		 * code
		 * @param string $code
		 * @return string
		 */
		public function setCode($code){
			$this->code = $code;
			return $this;
		}
		
		/**
		 * @column "code"
		 * @property
		 * code
		 * @return string
		 */
		public function getCode(){
			return $this->code;
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
		 * html
		 * @param string $html
		 * @return string
		 */
		public function setHtml($html){
			$this->html = $html;
			return $this;
		}
		
		/**
		 * @column "html"
		 * @property
		 * html
		 * @return string
		 */
		public function getHtml(){
			return $this->html;
		}
		
		/**
		 * media
		 * @param string $media
		 * @return string
		 */
		public function setMedia($media){
			$this->media = $media;
			return $this;
		}
		
		/**
		 * @column "media"
		 * @property
		 * media
		 * @return string
		 */
		public function getMedia(){
			return $this->media;
		}
	}
?>