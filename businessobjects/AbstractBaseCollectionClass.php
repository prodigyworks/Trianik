<?php 
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	
	abstract class AbstractBaseCollectionClass extends AbstractBaseDataClass {
		
		/* Collection */
		private $records = array();
		private $className = null;

		/**
		 * Constructor
		 */
		public function __construct($publicMode = false) {
			parent::__construct($publicMode);
			
			$reader = new DocBlockReader\Reader($this);
			/* Get table name. */
			$this->className = $reader->getParameter("class");
		}
		
		/**
		 * Populate records
		 * @param PDOStatement $stmt
		 * @param mixed $callback
		 * @throws Exception
		 * @return AbstractBaseCollectionClass
		 */
		public function populateRecords($stmt, $callback = null) {
			/* Clear data. */
			$this->records = array();
		
			$stmt->execute();
			
			while (($row = $stmt->fetch(PDO::FETCH_ASSOC))) {
				if ($callback) {
					$record = new $this->className();
					$record->loadRecordFromResultset($row);
					
					$callback($record);
						
				} else {
					/* Create new document. */
					$record = new $this->className();
					$record->loadRecordFromResultset($row);

					/* Add to the array. */
					$this->records[] = $record;
				}
			}
		
			return $this;
		}
		
		/**
		 * Add record.
		 * @param unknown $record
		 */
		public function addRecord($record) {
			$this->records[] = $record;
		}
		
		/**
		 * @onetomany
		 * Records
		 * @return AbstractBaseCollectionClass
		 */
		public function getRecords() {
			return $this->records;
		}
	}
?>