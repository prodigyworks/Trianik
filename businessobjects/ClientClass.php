<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	require_once(__DIR__ . "/../businessobjects/ClientdocsCollectionClass.php");
	
	/** 
	 * @table "client" 
	 */
	class ClientClass extends AbstractBaseDataClass {
		
	    /* Properties. */
	    private $id = null;
	    private $imageid = null;
	    private $name = null;
	    private $status = null;
	    private $firstname = null;
	    private $lastname = null;
	    private $address = null;
	    private $billingaddress = null;
	    private $paperfreebillingaddress = null;
	    private $specificrequirements = null;
	    private $valuablestoberemoved = null;
	    private $healthsafetyriskassessment = null;
	    private $email = null;
	    private $numberofbedrooms = null;
	    private $numberofbathrooms = null;
	    private $numberofkeysgiven = null;
	    private $alarmfobgiven = null;
	    private $alarmcodes = null;
	    private $keycodes = null;
	    private $accessinstructions = null;
	    private $hoursrequired = null;
	    private $telephone = null;
	    private $mobile = null;
	    private $workphone = null;
	    private $paymentmethod = null;
	    private $ironingrequired = null;
	    private $vacuum = null;
	    private $frequency = null;
	    private $startdate = null;
	    private $preferreddaytime = null;
	    private $fax = null;
	       
	     /* One to many */
	    private $documents = null;
	
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
		 * imageid 
		 * @param int $imageid 
		 * @return int  
		 */
		public function setImageid($imageid){
			$this->imageid = $imageid;
			return $this;
		}
		
		/**
		 * @column "imageid"
		 * @property
		 * imageid 
		 * @return int  
		 */
		public function getImageid(){
			return $this->imageid;
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
		 * status 
		 * @param string $status 
		 * @return string  
		 */
		public function setStatus($status){
			$this->status = $status;
			return $this;
		}
		
		/**
		 * @column "status"
		 * @property
		 * status 
		 * @return string  
		 */
		public function getStatus(){
			return $this->status;
		}
			
		/**
		 * firstname 
		 * @param string $firstname 
		 * @return string  
		 */
		public function setFirstname($firstname){
			$this->firstname = $firstname;
			return $this;
		}
		
		/**
		 * @column "firstname"
		 * @property
		 * firstname 
		 * @return string  
		 */
		public function getFirstname(){
			return $this->firstname;
		}
			
		/**
		 * lastname 
		 * @param string $lastname 
		 * @return string  
		 */
		public function setLastname($lastname){
			$this->lastname = $lastname;
			return $this;
		}
		
		/**
		 * @column "lastname"
		 * @property
		 * lastname 
		 * @return string  
		 */
		public function getLastname(){
			return $this->lastname;
		}
			
		/**
		 * address 
		 * @param string $address 
		 * @return string  
		 */
		public function setAddress($address){
			$this->address = $address;
			return $this;
		}
		
		/**
		 * @column "address"
		 * @property
		 * address 
		 * @return string  
		 */
		public function getAddress(){
			return $this->address;
		}
			
		/**
		 * billingaddress 
		 * @param string $billingaddress 
		 * @return string  
		 */
		public function setBillingaddress($billingaddress){
			$this->billingaddress = $billingaddress;
			return $this;
		}
		
		/**
		 * @column "billingaddress"
		 * @property
		 * billingaddress 
		 * @return string  
		 */
		public function getBillingaddress(){
			return $this->billingaddress;
		}
			
		/**
		 * paperfreebillingaddress 
		 * @param string $paperfreebillingaddress 
		 * @return string  
		 */
		public function setPaperfreebillingaddress($paperfreebillingaddress){
			$this->paperfreebillingaddress = $paperfreebillingaddress;
			return $this;
		}
		
		/**
		 * @column "paperfreebillingaddress"
		 * @property
		 * paperfreebillingaddress 
		 * @return string  
		 */
		public function getPaperfreebillingaddress(){
			return $this->paperfreebillingaddress;
		}
			
		/**
		 * specificrequirements 
		 * @param string $specificrequirements 
		 * @return string  
		 */
		public function setSpecificrequirements($specificrequirements){
			$this->specificrequirements = $specificrequirements;
			return $this;
		}
		
		/**
		 * @column "specificrequirements"
		 * @property
		 * specificrequirements 
		 * @return string  
		 */
		public function getSpecificrequirements(){
			return $this->specificrequirements;
		}
			
		/**
		 * valuablestoberemoved 
		 * @param string $valuablestoberemoved 
		 * @return string  
		 */
		public function setValuablestoberemoved($valuablestoberemoved){
			$this->valuablestoberemoved = $valuablestoberemoved;
			return $this;
		}
		
		/**
		 * @column "valuablestoberemoved"
		 * @property
		 * valuablestoberemoved 
		 * @return string  
		 */
		public function getValuablestoberemoved(){
			return $this->valuablestoberemoved;
		}
			
		/**
		 * healthsafetyriskassessment 
		 * @param string $healthsafetyriskassessment 
		 * @return string  
		 */
		public function setHealthsafetyriskassessment($healthsafetyriskassessment){
			$this->healthsafetyriskassessment = $healthsafetyriskassessment;
			return $this;
		}
		
		/**
		 * @column "healthsafetyriskassessment"
		 * @property
		 * healthsafetyriskassessment 
		 * @return string  
		 */
		public function getHealthsafetyriskassessment(){
			return $this->healthsafetyriskassessment;
		}
			
		/**
		 * email 
		 * @param string $email 
		 * @return string  
		 */
		public function setEmail($email){
			$this->email = $email;
			return $this;
		}
		
		/**
		 * @column "email"
		 * @property
		 * email 
		 * @return string  
		 */
		public function getEmail(){
			return $this->email;
		}
			
		/**
		 * numberofbedrooms 
		 * @param int $numberofbedrooms 
		 * @return int  
		 */
		public function setNumberofbedrooms($numberofbedrooms){
			$this->numberofbedrooms = $numberofbedrooms;
			return $this;
		}
		
		/**
		 * @column "numberofbedrooms"
		 * @property
		 * numberofbedrooms 
		 * @return int  
		 */
		public function getNumberofbedrooms(){
			return $this->numberofbedrooms;
		}
			
		/**
		 * numberofbathrooms 
		 * @param int $numberofbathrooms 
		 * @return int  
		 */
		public function setNumberofbathrooms($numberofbathrooms){
			$this->numberofbathrooms = $numberofbathrooms;
			return $this;
		}
		
		/**
		 * @column "numberofbathrooms"
		 * @property
		 * numberofbathrooms 
		 * @return int  
		 */
		public function getNumberofbathrooms(){
			return $this->numberofbathrooms;
		}
			
		/**
		 * numberofkeysgiven 
		 * @param int $numberofkeysgiven 
		 * @return int  
		 */
		public function setNumberofkeysgiven($numberofkeysgiven){
			$this->numberofkeysgiven = $numberofkeysgiven;
			return $this;
		}
		
		/**
		 * @column "numberofkeysgiven"
		 * @property
		 * numberofkeysgiven 
		 * @return int  
		 */
		public function getNumberofkeysgiven(){
			return $this->numberofkeysgiven;
		}
			
		/**
		 * alarmfobgiven 
		 * @param string $alarmfobgiven 
		 * @return string  
		 */
		public function setAlarmfobgiven($alarmfobgiven){
			$this->alarmfobgiven = $alarmfobgiven;
			return $this;
		}
		
		/**
		 * @column "alarmfobgiven"
		 * @property
		 * alarmfobgiven 
		 * @return string  
		 */
		public function getAlarmfobgiven(){
			return $this->alarmfobgiven;
		}
			
		/**
		 * alarmcodes 
		 * @param string $alarmcodes 
		 * @return string  
		 */
		public function setAlarmcodes($alarmcodes){
			$this->alarmcodes = $alarmcodes;
			return $this;
		}
		
		/**
		 * @column "alarmcodes"
		 * @property
		 * alarmcodes 
		 * @return string  
		 */
		public function getAlarmcodes(){
			return $this->alarmcodes;
		}
			
		/**
		 * keycodes 
		 * @param string $keycodes 
		 * @return string  
		 */
		public function setKeycodes($keycodes){
			$this->keycodes = $keycodes;
			return $this;
		}
		
		/**
		 * @column "keycodes"
		 * @property
		 * keycodes 
		 * @return string  
		 */
		public function getKeycodes(){
			return $this->keycodes;
		}
			
		/**
		 * accessinstructions 
		 * @param string $accessinstructions 
		 * @return string  
		 */
		public function setAccessinstructions($accessinstructions){
			$this->accessinstructions = $accessinstructions;
			return $this;
		}
		
		/**
		 * @column "accessinstructions"
		 * @property
		 * accessinstructions 
		 * @return string  
		 */
		public function getAccessinstructions(){
			return $this->accessinstructions;
		}
			
		/**
		 * hoursrequired 
		 * @param double $hoursrequired 
		 * @return double  
		 */
		public function setHoursrequired($hoursrequired){
			$this->hoursrequired = $hoursrequired;
			return $this;
		}
		
		/**
		 * @column "hoursrequired"
		 * @property
		 * hoursrequired 
		 * @return double  
		 */
		public function getHoursrequired(){
			return $this->hoursrequired;
		}
			
		/**
		 * telephone 
		 * @param string $telephone 
		 * @return string  
		 */
		public function setTelephone($telephone){
			$this->telephone = $telephone;
			return $this;
		}
		
		/**
		 * @column "telephone"
		 * @property
		 * telephone 
		 * @return string  
		 */
		public function getTelephone(){
			return $this->telephone;
		}
			
		/**
		 * mobile 
		 * @param string $mobile 
		 * @return string  
		 */
		public function setMobile($mobile){
			$this->mobile = $mobile;
			return $this;
		}
		
		/**
		 * @column "mobile"
		 * @property
		 * mobile 
		 * @return string  
		 */
		public function getMobile(){
			return $this->mobile;
		}
			
		/**
		 * workphone 
		 * @param string $workphone 
		 * @return string  
		 */
		public function setWorkphone($workphone){
			$this->workphone = $workphone;
			return $this;
		}
		
		/**
		 * @column "workphone"
		 * @property
		 * workphone 
		 * @return string  
		 */
		public function getWorkphone(){
			return $this->workphone;
		}
			
		/**
		 * paymentmethod 
		 * @param string $paymentmethod 
		 * @return string  
		 */
		public function setPaymentmethod($paymentmethod){
			$this->paymentmethod = $paymentmethod;
			return $this;
		}
		
		/**
		 * @column "paymentmethod"
		 * @property
		 * paymentmethod 
		 * @return string  
		 */
		public function getPaymentmethod(){
			return $this->paymentmethod;
		}
			
		/**
		 * ironingrequired 
		 * @param string $ironingrequired 
		 * @return string  
		 */
		public function setIroningrequired($ironingrequired){
			$this->ironingrequired = $ironingrequired;
			return $this;
		}
		
		/**
		 * @column "ironingrequired"
		 * @property
		 * ironingrequired 
		 * @return string  
		 */
		public function getIroningrequired(){
			return $this->ironingrequired;
		}
			
		/**
		 * vacuum 
		 * @param string $vacuum 
		 * @return string  
		 */
		public function setVacuum($vacuum){
			$this->vacuum = $vacuum;
			return $this;
		}
		
		/**
		 * @column "vacuum"
		 * @property
		 * vacuum 
		 * @return string  
		 */
		public function getVacuum(){
			return $this->vacuum;
		}
			
		/**
		 * frequency 
		 * @param string $frequency 
		 * @return string  
		 */
		public function setFrequency($frequency){
			$this->frequency = $frequency;
			return $this;
		}
		
		/**
		 * @column "frequency"
		 * @property
		 * frequency 
		 * @return string  
		 */
		public function getFrequency(){
			return $this->frequency;
		}
			
		/**
		 * startdate 
		 * @param DateTime $startdate 
		 * @return DateTime  
		 */
		public function setStartdate($startdate){
			$this->startdate = $startdate;
			return $this;
		}
		
		/**
		 * @column "startdate"
		 * @property
		 * startdate 
		 * @return DateTime  
		 */
		public function getStartdate(){
			return $this->startdate;
		}
			
		/**
		 * preferreddaytime 
		 * @param string $preferreddaytime 
		 * @return string  
		 */
		public function setPreferreddaytime($preferreddaytime){
			$this->preferreddaytime = $preferreddaytime;
			return $this;
		}
		
		/**
		 * @column "preferreddaytime"
		 * @property
		 * preferreddaytime 
		 * @return string  
		 */
		public function getPreferreddaytime(){
			return $this->preferreddaytime;
		}
			
		/**
		 * fax 
		 * @param string $fax 
		 * @return string  
		 */
		public function setFax($fax){
			$this->fax = $fax;
			return $this;
		}
		
		/**
		 * @column "fax"
		 * @property
		 * fax 
		 * @return string  
		 */
		public function getFax(){
			return $this->fax;
		}
	
		/**
		 * @property
		 * Get full name.
		 * @return string
		 */
		public function getFullname() {
			return "{$this->getFirstname()} {$this->getLastname()}";
		}
		
		/**
		 * @property
		 * Get frequence description.
		 * @return string
		 */
		public function getFrequencyDescription() {
			if ($this->getFrequency() == "O") {
				return "One Off";
					
			} else if ($this->getFrequency() == "W") {
				return "Weekly";
					
			} else if ($this->getFrequency() == "T") {
				return "Two Weekly";
					
			} else if ($this->getFrequency() == "F") {
				return "Four Weekly";
			}

			return "";
		}
		
		/**
		 * @onetomany
		 * Get documents
		 * return ClientdocsClass
		 */
		public function getDocuments($load = true) {
			if ($this->documents == null) {
				$this->documents = new ClientdocsCollectionClass();
			}
			
			if ($load) {
				$this->documents->loadByClientId($this->getId());
			}
			
			return $this->documents->getClientdocs();
		}
	}
?>