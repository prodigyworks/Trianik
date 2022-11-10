<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");

	/**
	 * @table "useragent"
	 */
	class UseragentClass extends AbstractBaseDataClass {
	
		/* Properties. */
		private $id = null;
		private $name = null;
		private $useragent = null;
		private $width = null;
		private $height = null;
		 
		/* One to ones */
	
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
		 * useragent
		 * @param string $useragent
		 * @return string
		 */
		public function setUseragent($useragent){
			$this->useragent = $useragent;
			return $this;
		}
	
		/**
		 * @column "useragent"
		 * @property
		 * useragent
		 * @return string
		 */
		public function getUseragent(){
			return $this->useragent;
		}
	
		/**
		 * width
		 * @param int $width
		 * @return int
		 */
		public function setWidth($width){
			$this->width = $width;
			return $this;
		}
	
		/**
		 * @column "width"
		 * @property
		 * width
		 * @return int
		 */
		public function getWidth(){
			return $this->width;
		}
	
		/**
		 * height
		 * @param int $height
		 * @return int
		 */
		public function setHeight($height){
			$this->height = $height;
			return $this;
		}
	
		/**
		 * @column "height"
		 * @property
		 * height
		 * @return int
		 */
		public function getHeight(){
			return $this->height;
		}
		
		/**
		 * Is the current user session a mobile device.
		 * @return boolean
		 */
		public static function isMobileDevice() {
			$sql = "SELECT id
					FROM {$_SESSION['DB_PREFIX']}useragent
					WHERE useragent = ?";
			
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $_SERVER['HTTP_USER_AGENT'], PDO::PARAM_STR);
			$stmt->execute();

			return ($stmt->rowCount() > 0);
		}
	}
?>