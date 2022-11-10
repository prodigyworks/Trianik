<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	require_once(__DIR__ . "/../businessobjects/DocumentClass.php");

	/** 
	 * @table "clientdocs" 
	 */
	class ClientdocsClass extends AbstractBaseDataClass {
		
	    /* Properties. */
	    private $id = null;
	    private $clientid = null;
	    private $documentid = null;
	    private $createddate = null;
	       
	    /* One to ones */
	    private $document = null;
	
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
		 * clientid 
		 * @param int $clientid 
		 * @return int  
		 */
		public function setClientid($clientid){
			$this->clientid = $clientid;
			return $this;
		}
		
		/**
		 * @column "clientid"
		 * @property
		 * clientid 
		 * @return int  
		 */
		public function getClientid(){
			return $this->clientid;
		}
			
		/**
		 * documentid 
		 * @param int $documentid 
		 * @return int  
		 */
		public function setDocumentid($documentid){
			$this->documentid = $documentid;
			return $this;
		}
		
		/**
		 * @column "documentid"
		 * @property
		 * documentid 
		 * @return int  
		 */
		public function getDocumentid(){
			return $this->documentid;
		}
			
		/**
		 * createddate 
		 * @param DateTime $createddate 
		 * @return DateTime  
		 */
		public function setCreateddate($createddate){
			$this->createddate = $createddate;
			return $this;
		}
		
		/**
		 * @column "createddate"
		 * @property
		 * createddate 
		 * @return DateTime  
		 */
		public function getCreateddate(){
			return $this->createddate;
		}
			
		/**
		 * @onetoone
		 * Document
		 * @return DocumentClass
		 */
		public function getDocument($load = true){
			if ($this->document == null && $load) {
				$this->document = new DocumentClass();
		
				if ($this->getDocumentid() != null) {
					$this->document->loadRecord($this->getDocumentid());
				}
			}
		
			return $this->document;
		}
	}
?>