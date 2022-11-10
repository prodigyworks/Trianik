<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	
	/** 
	 * @table "applicationtablecolumns" 
	 */
	class ApplicationTableColumnClass extends AbstractBaseDataClass {
	
		/* Properties. */
		private $id = null;
		private $headerid = null;
		private $columnindex = null;
		private $width = null;
		private $hidecolumn = null;
		private $label = null;
	
	    /**
	     * id
	     * @primarykey true
	     * @property
	     * @column "id"
	     * @return int
	     */
	    public function getId() {
	        return $this->id;
	    }
	
	    /**
	     * id
	     * @param int $id
	     * @return ApplicationTableColumnClass
	     */
	    public function setId($id) {
	        $this->id = $id;
	        return $this;
	    }
	
	    /**
	     * headerid
	     * @property
	     * @column "headerid"
	     * @return int
	     */
	    public function getHeaderid() {
	        return $this->headerid;
	    }
	
	    /**
	     * headerid
	     * @param int $headerid
	     * @return ApplicationTableColumnClass
	     */
	    public function setHeaderid($headerid) {
	        $this->headerid = $headerid;
	        return $this;
	    }
	
	    /**
	     * columnindex
	     * @property
	     * @column "columnindex"
	     * @return int
	     */
	    public function getColumnindex() {
	        return $this->columnindex;
	    }
	
	    /**
	     * columnindex
	     * @param int $columnindex
	     * @return ApplicationTableColumnClass
	     */
	    public function setColumnindex($columnindex) {
	        $this->columnindex = $columnindex;
	        return $this;
	    }
	
	    /**
	     * width
	     * @property
	     * @column "width"
	     * @return int
	     */
	    public function getWidth() {
	        return $this->width;
	    }
	
	    /**
	     * width
	     * @param int $width
	     * @return ApplicationTableColumnClass
	     */
	    public function setWidth($width) {
	        $this->width = $width;
	        return $this;
	    }
	
	    /**
	     * hidecolumn
	     * @property
	     * @column "hidecolumn"
	     * @return int
	     */
	    public function getHidecolumn() {
	        return $this->hidecolumn;
	    }
	
	    /**
	     * hidecolumn
	     * @param int $hidecolumn
	     * @return ApplicationTableColumnClass
	     */
	    public function setHidecolumn($hidecolumn) {
	        $this->hidecolumn = $hidecolumn;
	        return $this;
	    }
	
	    /**
	     * label
	     * @property
	     * @column "label"
	     * @return stringn
	     */
	    public function getLabel() {
	        return $this->label;
	    }
	
	    /**
	     * label
	     * @param stringn $label
	     * @return ApplicationTableColumnClass
	     */
	    public function setLabel($label) {
	        $this->label = $label;
	        return $this;
	    }

	    /**
	     * Hide.
	     */
	    public function hide() {
	    	$this->setHidecolumn(1);
	    	$this->updateRecord();
	    }

	    /**
	     * Hide.
	     */
	    public function show() {
	    	$this->setHidecolumn(0);
	    	$this->updateRecord();
	    }
    }
?>