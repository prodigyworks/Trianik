<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseCollectionClass.php");
	require_once(__DIR__ . "/../businessobjects/ImageClass.php");
	
	/**
	 * @class "ImageClass"
	 */
	class ImageCollectionClass extends AbstractBaseCollectionClass {
		
		/**
		 * Load by session ID
		 * @param string $sessionid
		 * @return ImageCollectionClass
		 */
		public function loadBySessionID($sessionid) {
			$sql = "SELECT A.*
					FROM {$_SESSION['DB_PREFIX']}images A
					WHERE A.sessionid = ?";

			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $sessionid, PDO::PARAM_STR);
				
			$this->populateRecords($stmt);
		}
				
		/**
		 * @onetomany
		 * images
		 * @return ImageClass
		 */
		public function getImages(){
			return parent::getRecords();
		}
	}
?>