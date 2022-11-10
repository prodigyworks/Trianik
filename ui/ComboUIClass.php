<?php
	require_once(__DIR__ . "/../pgcore-db.php");
	
	class ComboUIClass {
	    
		private $id = null;
		private $value = "id";
		private $name = "name";
		private $table = null;
		private $where = " ";
		private $required = true;
		private $isArray = false;
		private $attributeArray = array();
		private $blank = true;
		private $orderBy = null;
		private $useAll = false;
		
		/**
		 * Get new instance.
		 * @return ComboUIClass
		 */
		public static function getInstance() {
			return new ComboUIClass();
		}

        /**
         * Set ID.
         * @param string $id 
		 * @return ComboUIClass
         */
        public function setId($id) {
            $this->id = $id;
            
            return $this;
        }
        
        /**
         * Set Value.
         * @param string $value 
		 * @return ComboUIClass
         */
        public function setValue($value) {
            $this->value = $value;
            
            return $this;
        }
        
        /**
         * Set Name.
         * @param string $name 
		 * @return ComboUIClass
         */
        public function setName($name) {
            $this->name = $name;
            
            return $this;
        }
        
        /**
         * Set Table.
         * @param string $table 
		 * @return ComboUIClass
         */
        public function setTable($table) {
            $this->table = $table;
            
            return $this;
        }
        
        /**
         * Set Where.
         * @param string $where 
		 * @return ComboUIClass
         */
        public function setWhere($where) {
            $this->where = $where;
            
            return $this;
        }
        
        /**
         * Set Order By.
         * @param string $orderBy 
		 * @return ComboUIClass
         */
        public function setOrderBy($orderBy) {
            $this->orderBy = $orderBy;
            
            return $this;
        }
        
        /**
         * Set Required.
         * @param boolean $required 
		 * @return ComboUIClass
         */
        public function setRequired($required) {
            $this->required = $required;
            
            return $this;
        }
        
        /**
         * Set Blank.
         * @param boolean $blank 
		 * @return ComboUIClass
         */
        public function setBlank($blank) {
            $this->blank = $blank;
            
            return $this;
        }

        /**
         * Set use all.
         * @param boolean $useAll
         * @return ComboUIClass
         */
        public function setUseAll($useAll) {
        	$this->useAll = $useAll;
        
        	return $this;
        }
        
        /**
         * Set Is Arry.
         * @param boolean $isarray 
		 * @return ComboUIClass
         */
        public function setIsArray($isarray) {
            $this->isArray = $isarray;
            
            return $this;
        }
        
        /**
         * Set Attribute Array.
         * @param string $attributeArray 
		 * @return ComboUIClass
         */
        public function setAttributeArray($attributeArray) {
            $this->attributeArray = $attributeArray;
            
            return $this;
        }

        /**
         * Create combo.
         */
     	public function render() {
    		if (! $this->required) {
    			echo "<select class='datacombo' id='{$this->id}' ";
    	
    		} else {
    			echo "<select required='true' id='{$this->id}' ";
    		}
    	
    		foreach ($this->attributeArray as $i => $val) {
    			echo "$i='$val' ";
    		}
    	
    		if (! $this->isArray) {
    			echo "name='{$this->id}'>";
    	
    		} else {
    			echo "name='{$this->id}[]'>";
    		}
    	
    		$this->renderOptions();
    	
    		echo "</select>";
     	}
    	
    	/**
    	 * Create combo options. 
    	 */
    	public function renderOptions() {
    	    $orderby = "";
    	    
    		if ($this->blank) {
    			echo "<option value='0'>";
    			
    			if ($this->useAll) {
    				echo "All";
    			}
    			
    			echo "</option>";
    		}
    	
    		if ($this->orderBy == null) {
    			$orderby = $this->name;
    			
    		} else {
    			$orderby = $this->orderBy;
    		}
    			
    		$sql = "SELECT A.* 
    		        FROM {$_SESSION['DB_PREFIX']}{$this->table} A
            		{$this->where}
    	        	ORDER BY $orderby";
    	        	
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->execute();
			$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
		
			foreach ($rows AS $row) {
				echo "<option value=" . $row[$this->value] . ">" . $row[$this->name] . "</option>";
			}
    	}
	}
?>