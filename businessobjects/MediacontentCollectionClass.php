<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseCollectionClass.php");
	require_once(__DIR__ . "/../businessobjects/MediaContentClass.php");
	
	/**
	 * @class "MediaContentClass"
	 */
	class MediacontentCollectionClass extends AbstractBaseCollectionClass {

	    /**
	     * Load by partner.
	     * @param $partnerid Partner ID.
	     */
		public function loadByPartnerId($partnerid) {
			$sql = "SELECT A.*
					FROM  {$_SESSION['DB_PREFIX']}mediacontent A
					WHERE A.partnerid = ?
					ORDER BY A.code";
					
			/* Prepare delete statement. */
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $partnerid, PDO::PARAM_INT);
				
			$this->populateRecords($stmt);
		}
			
		/**
		 * Records
		 * @return MediaContentClass
		 */
		public function getMediacontents() {
			return parent::getRecords();
		}
	}
?>