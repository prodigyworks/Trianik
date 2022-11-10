<?php
	require_once(__DIR__ . "/../pgcore-db.php");
	require_once(__DIR__ . "/../session/SessionControllerClass.php");
	require_once(__DIR__ . "/../cache/Cache.php");
	require_once(__DIR__ . "/../businessobjects/AnnotationReader.php");
	
	abstract class AbstractBaseDataClass {
		
		/* Table name. */
		private $tableName;
		private $columnDefinitions = null;
		private $primarykeyColumn = null;
		
		/* Meta columns. */
		private $metacreateddate = null;
		private $metamodifieddate = null;
		private $metacreateduserid = null;
		private $metamodifieduserid = null;
		
		private $cache = null;
		
		/**
		 * Constructor
		 */
		public function __construct($publicMode = false) {
			$this->cache = new Cache(array(
					'name'      => get_class($this) . "-cache",
					'path'      => __DIR__ . "/../tmp/",
					'extension' => '.cache'
				));
				
			$reader = new DocBlockReader\Reader($this);
			/* Get table name. */
			$this->tableName = $reader->getParameter("table");
		}

		/**
		 * Date to fixed DMY format.
		 * @param DateTime $date
		 * @return string
		 */
		public function dateToHMS($date) {
			if ($date == null || $date == 0 || $date == "") {
				return "";
			}
				
			return date("H:i:s", strtotime($date));
		}
		
		/**
		 * Date to fixed DMY format.
		 * @param DateTime $date
		 * @return string
		 */
		public function dateToDMY($date) {
			if ($date == null || $date == 0 || $date == "") {
				return "";
			}
			
			return date(SessionControllerClass::getSiteConfig()->getPhpdateformat(), strtotime($date));
		}

		/**
		 * DateTime to fixed DMYHMS format.
		 * @param DateTime $date
		 * @return string
		 */
		public function dateToDMYHMS($date) {
			if ($date == null || $date == 0 || $date == "") {
				return "";
			}
				
			return date(SessionControllerClass::getSiteConfig()->getPhpdateformat() . " H:i:s", strtotime($date));
		}
		
		/**
		 * Convert to JSON
		 */
		public function toJSON() {
			return json_encode($this->toArray(), JSON_PRETTY_PRINT);
		}
		
		/**
		 * Get table name.
		 * @return string
		 */
		public function getTableName() {
			return $this->tableName;
		}

		/**
		 * Get primary key column.
		 * @return array Primary key column.
		 */
		public function getPrimaryKeyColumn() {
			if ($this->primarykeyColumn == null) {
				$key = $this->cache->retrieve("definition/primarykey/{$this->getTableName()}");
				$this->primarykeyColumn = $key;
			}
			
			return $this->primarykeyColumn;
		}
		
		/**
		 * Update record.
		 * @throws Exception
		 */
		public function updateRecord() {
			$this->metamodifieddate = date("Y-m-d H:i:s");
				
			if ($this->metamodifieduserid == null) {
				if (SessionControllerClass::getUser()->isAuthenticated()) {
					$this->metamodifieduserid = SessionControllerClass::getUser()->getMemberid();
			
				} else {
					$this->metamodifieduserid = 1;
				}
			}
				
			/* Filter columns. */
			$filteredColumns = array_filter(
				$this->getColumnDefinitions(), 
				function ($column) {
			        return $column['column'] != null &&
			        	 ! $column['primarykey'] &&
			        	 ! $column['noupdate'];
		        }
			);

			$mappedColumns = array_map(
					function ($u) {
						return "{$u['column']} = ?";
					},
					$filteredColumns
				);
			
			/* Build update statement. */
			$sql = "UPDATE {$_SESSION['DB_PREFIX']}{$this->getTableName()} SET ";
			$sql .= implode(", ", $mappedColumns);
			
			if ($this->getPrimaryKeyColumn()) {
				$sql .= " WHERE {$this->getPrimaryKeyColumn()['column']} = ?";
			}
			
			/* Prepare update statement. */
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$index = 1;
			
			foreach ($filteredColumns AS $column) {
				$method = $column['getmethod'];
				
				if ($column['type'] == "int" ||
					$column['type'] == "long") {
			
					$value = $this->$method();
						
					if ($value == "") {
						$value = null;
					}
		
					$stmt->bindValue($index++, $value, PDO::PARAM_INT);
					
				} else {
					$stmt->bindValue($index++, $this->$method(), PDO::PARAM_STR);
				}
			}
			
			if ($this->getPrimaryKeyColumn()) {
				$method = $this->getPrimaryKeyColumn()['getmethod'];
				
				/* Primary key bind. */
				$stmt->bindValue($index++, $this->$method(), PDO::PARAM_INT);
			}
			
			try {
				$stmt->execute();
			
			} catch (PDOException $e) {
				if (isset($stmt->errorInfo()[1])) {
					throw new Exception($e->getMessage(), $stmt->errorInfo()[1]);
				}
			
				throw $e;
			}
		}
		
		/**
		 * Load record.
		 * @param int $id
		 * @throws Exception
		 * @return AbstractBaseDataClass
		 */
		public function loadRecord($id = null) {
			$this->syncCache();
			
			if ($id != null) {
				$sql = "SELECT *
						FROM {$_SESSION['DB_PREFIX']}{$this->getTableName()} 
						WHERE {$this->getPrimaryKeyColumn()['column']} = ?";

			} else {
				$sql = "SELECT *
						FROM {$_SESSION['DB_PREFIX']}{$this->getTableName()}";
			}
				
			try {
				/* Prepare delete statement. */
				$stmt = SessionControllerClass::getDB()->prepare($sql);
				
				if ($id != null) {
					/* Primary key bind. */
					$stmt->bindValue(1, $id, PDO::PARAM_INT);
				}
				
				try {
					$stmt->execute();
				
				} catch (Throwable  $e) {
					if (isset($stmt->errorInfo()[1])) {
						throw new Exception($e->getMessage(), $stmt->errorInfo()[1]);
					}
				
					throw $e;
				}
				
				$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
			
				foreach ($rows AS $row) {
					$this->loadRecordFromResultset($row);
				}
				
			} catch (Throwable  $e) {
				throw new PDOException("$sql - {$e->getMessage()}");
			}
		}
		
		/**
		 * Load record from result set
		 * @param array $row
		 */
		public function loadRecordFromResultset($row) {
			foreach ($this->getColumnDefinitions() AS $column) {
				if ($column['column'] != null) {
					$this->{$column['setmethod']}($row[$column['column']]);
				}
			}
		}

		/**
		 * Load record from Json
		 * @param array $row
		 */
		public function fromJson($row) {
			foreach ($this->getColumnDefinitions() AS $column) {
				if ($column['column'] != null) {
					if (isset($row[$column['column']])) {
						$this->{$column['setmethod']}($row[$column['column']]);
					}
				}
			}
		}
		
		/**
		 * Delete record.
		 * @throws Exception
		 */
		public function deleteRecord() {
			$this->syncCache();
			
			if (! $this->getPrimaryKeyColumn()) {
				return;
			}
			
			/* Build update statement. */
			$sql = "DELETE FROM {$_SESSION['DB_PREFIX']}{$this->getTableName()} 
					WHERE {$this->getPrimaryKeyColumn()['column']} = ?";
				
			/* Prepare delete statement. */
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$method = $this->getPrimaryKeyColumn()['getmethod'];

			/* Primary key bind. */
			$stmt->bindValue(1, $this->$method(), PDO::PARAM_INT);
			
			try {
				$stmt->execute();
			
			} catch (PDOException $e) {
				if (isset($stmt->errorInfo()[1])) {
					throw new Exception($e->getMessage(), $stmt->errorInfo()[1]);
				}
			
				throw $e;
			}
		}
		
		/**
		 * Insert record.
		 * @throws Exception
		 */
		public function insertRecord() {
			if ($this->metacreateddate == null) {
				$this->metacreateddate = date("Y-m-d H:i:s");
			}
			
			if ($this->metacreateduserid == null) {
				if (SessionControllerClass::getUser()->isAuthenticated()) {
					$this->metacreateduserid = SessionControllerClass::getUser()->getMemberid();
			
				} else {
					$this->metacreateduserid = 1;
				}
			}
			
			if ($this->metamodifieddate == null) {
				$this->metamodifieddate = date("Y-m-d H:i:s");
			}
			
			if ($this->metamodifieduserid == null) {
				if (SessionControllerClass::getUser()->isAuthenticated()) {
					$this->metamodifieduserid = SessionControllerClass::getUser()->getMemberid();
					 
				} else {
					$this->metamodifieduserid = 1;
				}
			}
				
			/* Filter columns. */
			$filteredColumns = array_filter(
				$this->getColumnDefinitions(),
				function ($column) {
					return $column['column'] != null &&
						 ! $column['primarykey'];
				}
			);

			$mappedColumns = array_map(
					function ($u) {
						return $u['column'];
					},
					$filteredColumns
				);

			$mappedBindings = array_map(
					function ($u) {
						return "?";
					},
					$filteredColumns
				);
				
			/* Build insert statement. */
			$sql  = "INSERT INTO {$_SESSION['DB_PREFIX']}{$this->getTableName()} (";
			$sql .= implode(", ", $mappedColumns);
			$sql .= ") VALUES (";
			$sql .= implode(", ", $mappedBindings);
			$sql .= ")";
			
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$index = 1;
			foreach ($filteredColumns AS $column) {
				$method = $column['getmethod'];

				if ($column['type'] == "int" ||
					$column['type'] == "long") {
						
					$value = $this->$method();
					
					if ($value == "") {
						$value = null;
					}
						
					$stmt->bindValue($index++, $value, PDO::PARAM_INT);
						
				} else {
					$stmt->bindValue($index++, $this->$method(), PDO::PARAM_STR);
				}
			}
		
			try {
				$stmt->execute();
				
			} catch (PDOException $e) {
				if (isset($stmt->errorInfo()[1])) {
					throw new Exception($e->getMessage(), $stmt->errorInfo()[1]);
				}
				
				throw $e;
			}
			
			if ($this->getPrimaryKeyColumn()) {
				/* Populate with last insert ID */
				$this->{$this->getPrimaryKeyColumn()['setmethod']}(SessionControllerClass::getDB()->lastInsertId());
			}
		}
		
		/**
		 * Get columns from properties.
		 * @return array Column definitions.
		 */
		public function getColumnDefinitions() {
			if ($this->columnDefinitions != null) {
				/* Found class reference. For current thread. */
				return $this->columnDefinitions;
			}

			if ($this->cache->isCached("definition/columns/{$this->getTableName()}")) {
				return $this->cache->retrieve("definition/columns/{$this->getTableName()}");
			}
				
			/* Search methods and store in cache. */
			$this->columnDefinitions = array();
			
			foreach (get_class_methods($this) as $method) {
				if (substr($method, 0, 3) != "get") {
					continue;
				}
				
				$reader = new DocBlockReader\Reader($this, $method, "method");
				
				$column = array();
				$column['property'] = $reader->getParameter("property");
				$column['propertyname'] = strtolower(substr($method, 3));
				$column['column'] = $reader->getParameter("column");
				$column['primarykey'] = $reader->getParameter("primarykey");
				$column['getmethod'] = $method;
				$column['noupdate'] = $reader->getParameter("noupdate") ? true : false;
				$column['setmethod'] = "s" . substr($method, 1);
				$column['type'] = $reader->getParameter("return");
				$column['onetoone'] = $reader->getParameter("onetoone") ? true : false;
				$column['onetomany'] = $reader->getParameter("onetomany") ? true : false;
				$column['set'] = substr($method, 0, 3) == "set" ? true : false;
				
				if ($reader->getParameter("primarykey") != null) {
					$this->cache->store("definition/primarykey/{$this->getTableName()}", $column);
				}
				
				array_push($this->columnDefinitions, $column);
			}

			$this->cache->store("definition/columns/{$this->getTableName()}", $this->columnDefinitions);
			
			return $this->columnDefinitions;
		}
		
		/**
		 * Get cache
		 * @return Cache
		 */
		public function getCache() {
			return $this->cache;
		}
				
		/**
		 * Convert to JSON
		 */
		public function toArray() {
			$json = array();

			try {
				/* Filter columns. */
				$filteredColumns = array_filter(
					$this->getColumnDefinitions(),
					function ($column) {
						return $column['property'] != "" ||
							   $column['onetoone'] != "" ||
							   $column['onetomany'] != "" ;
					}
				);
				
				foreach ($filteredColumns AS $column) {
					if ($column['property'] != "") {
						$value = $this->{$column['getmethod']}(); 
						
						if ($value != null) {
							$json[$column['propertyname']] = $value;
					
						} else {
							$json[$column['propertyname']] = null;
						}
					
					} else if ($column["onetoone"] != "") {
						$value = $this->{$column['getmethod']}(false);
						
						if ($value != null) {
							$json[$column['propertyname']] = $value->toArray();
					
						} else {
							$json[$column['propertyname']] = null;
						}
					
					} else if ($column["onetomany"] != "") {
						$value = $this->{$column['getmethod']}(false);
						
						if ($value != null) {
							$elements = array();
					
							foreach ($value AS $element) {
								$elements[] = $element->toArray();
							}
					
							$json[$column['propertyname']] = $elements;
					
						} else {
							$json[$column['propertyname']] = null;
						}
					}
				}
				
			} catch (Exception $e) {
				logError($e->getMessage(), false);
			}

			return $json;
		}
		
		/**
		 * Replace tokenised string with object values.
		 * @param string $text Tokenised string.
		 * @return string
		 */
		public function replaceTokens($text) {
			$offset = 0;
			$newText = "";
				
			while (($found = strpos($text, '${', $offset)) != false) {
				$newText .= substr($text, $offset, $found - $offset);
				$token = substr($text, $found + 2, strpos($text, "}", $found) - ($found + 2));
				$newText .= $this->getTokenValue($token);
		
				$offset = strpos($text, "}", $found) + 1;
			}
			
			$newText .= substr($text, $offset);
		
			return $newText;
		}
		
		/**
		 * Get the token moniker.
		 * @param string $token
		 * @throws Exception
		 * @return mixed
		 */
		public function getTokenMoniker($token) {
			if ($token == "data::datestamp") {
				return date(SessionControllerClass::getSiteConfig()->getPhpdateformat());
			
			} else if ($token == "data::user") {
				return SessionControllerClass::getUser();

			} else if ($token == "data::config") {
				return SessionControllerClass::getSiteConfig();

			} else if ($token == "data::page") {
				return SessionControllerClass::getPage();
							
			} else if ($token == "data::timestamp") {
				return date(SessionControllerClass::getSiteConfig()->getPhpdateformat() . " H:i:s");
			
			} else {
				$method = "get" . strtoupper(substr($token, 0, 1)) . substr($token, 1);
				
				try {
					return call_user_func_array(array($this, $method), array(true));
						
				} catch (Exception $e) {
					throw new Exception("Cannot find method [$method]");
				}
			}
		}
		
		/**
		 * Get token value from token
		 * @param string $token
		 * @return mixed
		 */
		public function getTokenValue($token) {
			if (strpos($token, ".")) {
				$value = $this->getTokenMoniker(substr($token, 0, strpos($token, ".")));
				
				if ($value == null) {
					return "";
				}
				
				return $value->getTokenValue(substr($token, strpos($token, ".") + 1));
				
			} else {
				return $this->getTokenMoniker($token);
			}
		}

		/**
		 * @column "metacreateddate"
		 * @property
		 * @noupdate
		 * metacreateddate
		 * @return DateTime
		 */
		public function getMetacreateddate(){
			return $this->metacreateddate;
		}
		
		/**
		 * metacreateddate
		 * @param DateTime $metacreateddate
		 * @return AbstractBaseDataClass
		 */
		public function setMetacreateddate($metacreateddate){
			$this->metacreateddate = $metacreateddate;
			return $this;
		}
		
		/**
		 * @column "metamodifieddate"
		 * @property
		 * metamodifieddate
		 * @return DateTime
		 */
		public function getMetamodifieddate(){
			return $this->metamodifieddate;
		}
		
		/**
		 * metamodifieddate
		 * @param DateTime $metamodifieddate
		 * @return AbstractBaseDataClass
		 */
		public function setMetamodifieddate($metamodifieddate){
			$this->metamodifieddate = $metamodifieddate;
			return $this;
		}
		
		/**
		 * @column "metacreateduserid"
		 * @property
		 * @noupdate
		 * metacreateduserid
		 * @return int
		 */
		public function getMetacreateduserid(){
			return $this->metacreateduserid;
		}
		
		/**
		 * metacreateduserid
		 * @param int $metacreateduserid
		 * @return AbstractBaseDataClass
		 */
		public function setMetacreateduserid($metacreateduserid){
			$this->metacreateduserid = $metacreateduserid;
			return $this;
		}
		
		/**
		 * @column "metamodifieduserid"
		 * @property
		 * metamodifieduserid
		 * @return int
		 */
		public function getMetamodifieduserid(){
			return $this->metamodifieduserid;
		}
		
		/**
		 * metamodifieduserid
		 * @param int $metamodifieduserid
		 * @return AbstractBaseDataClass
		 */
		public function setMetamodifieduserid($metamodifieduserid){
			$this->metamodifieduserid = $metamodifieduserid;
			return $this;
		}
		
		/**
		 * Sync cache.
		 */
		private function syncCache() {
			/* Force cache. */
			$this->getColumnDefinitions();
		}
		
		/**
		 * Load row from statement.
		 * @param unknown $stmt
		 * @return boolean
		 */
		public function loadRowFromStatement($stmt) {
		    $found = false;
		    
			try {
				$stmt->execute();
			
			} catch (PDOException $e) {
				if (isset($stmt->errorInfo()[1])) {
					throw new Exception($e->getMessage(), $stmt->errorInfo()[1]);
				}
			
				throw $e;
			}
				
			while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
				$this->loadRecordFromResultset($row);
				$found = true;
				
				break;
			}
			
			return $found;
		}
	}
?>