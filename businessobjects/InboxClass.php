<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	
	/** 
	 * @table "inbox" 
	 */
	class InboxClass extends AbstractBaseDataClass {
		
		/* Properties. */
		private $id = null;
		private $partnerid = null;
		private $inboxid = null;
		private $keyword = null;
		private $number = null;
		private $responseurl = null;
		private $responsebody = null;
		 
		/**
		 * Respond.
		 * @param array $message
		 */
		public function respond($message) {
			$text = $this->getResponsebody();
			$text = str_replace("${message}", $message['message'], $text);
			$text = str_replace("${date}", $message['date'], $text);
			$text = str_replace("${number}", $message['number'], $text);
			
			// Send the POST request with cURL
			$ch = curl_init($this->getResponseurl());
			curl_setopt($ch, CURLOPT_POST, true);
			curl_setopt($ch, CURLOPT_POSTFIELDS, $text);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
			$response = curl_exec($ch);
			curl_close($ch);
			
			return $response;
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
		 * partnerid
		 * @param int $partnerid
		 * @return int
		 */
		public function setPartnerid($partnerid){
			$this->partnerid = $partnerid;
			return $this;
		}
		
		/**
		 * @column "partnerid"
		 * @property
		 * partnerid
		 * @return int
		 */
		public function getPartnerid(){
			return $this->partnerid;
		}
		
		/**
		 * inboxid
		 * @param bigint $inboxid
		 * @return bigint
		 */
		public function setInboxid($inboxid){
			$this->inboxid = $inboxid;
			return $this;
		}
		
		/**
		 * @column "inboxid"
		 * @property
		 * inboxid
		 * @return bigint
		 */
		public function getInboxid(){
			return $this->inboxid;
		}
		
		/**
		 * keyword
		 * @param string $keyword
		 * @return string
		 */
		public function setKeyword($keyword){
			$this->keyword = $keyword;
			return $this;
		}
		
		/**
		 * @column "keyword"
		 * @property
		 * keyword
		 * @return string
		 */
		public function getKeyword(){
			return $this->keyword;
		}
		
		/**
		 * number
		 * @param bigint $number
		 * @return bigint
		 */
		public function setNumber($number){
			$this->number = $number;
			return $this;
		}
		
		/**
		 * @column "number"
		 * @property
		 * number
		 * @return bigint
		 */
		public function getNumber(){
			return $this->number;
		}
		
		/**
		 * responseurl
		 * @param string $responseurl
		 * @return string
		 */
		public function setResponseurl($responseurl){
			$this->responseurl = $responseurl;
			return $this;
		}
		
		/**
		 * @column "responseurl"
		 * @property
		 * responseurl
		 * @return string
		 */
		public function getResponseurl(){
			return $this->responseurl;
		}
		
		/**
		 * responsebody
		 * @param string $responsebody
		 * @return string
		 */
		public function setResponsebody($responsebody){
			$this->responsebody = $responsebody;
			return $this;
		}
		
		/**
		 * @column "responsebody"
		 * @property
		 * responsebody
		 * @return string
		 */
		public function getResponsebody(){
			return $this->responsebody;
		}
	}
?>