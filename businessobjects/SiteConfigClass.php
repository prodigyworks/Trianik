<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	
	/** 
	 * @table "siteconfig" 
	 */
	class SiteconfigClass extends AbstractBaseDataClass {
		
	    /* Properties. */
	    private $id = null;
	    private $domainurl = null;
	    private $address = null;
	    private $bookingprefix = null;
	    private $productcodeprefix = null;
	    private $productgroupprefix = null;
	    private $emailfooter = null;
	    private $lastschedulerun = null;
	    private $runscheduledays = null;
	    private $vatrate = null;
	    private $changeset = null;
	    private $phpdateformat = null;
	    private $jsdateformat = null;
	    private $currencycode = null;
	    private $isodialingcode = null;
	    private $mobilepattern = null;
	    private $smsapikey = null;
	    private $smstestmode = null;
	    private $smssendername = null;
	    private $timezone = null;
	    private $sslayer = null;
	    private $isolanguage = null;
	    private $timezoneoffset = null;
	    private $sslencryption = null;
	    private $logoimageid = null;
	    private $faviconimageid = null;
	    private $companyname = null;
	    private $asciicurrency = null;
	    private $adminemail = null;
	    private $reportlogo = null;
	    private $reportfooter = null;
	    private $companydetails = null;
    	private $emailheader = null;
	     
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
		 * domainurl 
		 * @param string $domainurl 
		 * @return string  
		 */
		public function setDomainurl($domainurl){
			$this->domainurl = $domainurl;
			return $this;
		}
		
		/**
		 * @column "domainurl"
		 * @property
		 * domainurl 
		 * @return string  
		 */
		public function getDomainurl(){
			return $this->domainurl;
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
		 * bookingprefix 
		 * @param string $bookingprefix 
		 * @return string  
		 */
		public function setBookingprefix($bookingprefix){
			$this->bookingprefix = $bookingprefix;
			return $this;
		}
		
		/**
		 * @column "bookingprefix"
		 * @property
		 * bookingprefix 
		 * @return string  
		 */
		public function getBookingprefix(){
			return $this->bookingprefix;
		}
			
		/**
		 * productcodeprefix 
		 * @param string $productcodeprefix 
		 * @return string  
		 */
		public function setProductcodeprefix($productcodeprefix){
			$this->productcodeprefix = $productcodeprefix;
			return $this;
		}
		
		/**
		 * @column "productcodeprefix"
		 * @property
		 * productcodeprefix 
		 * @return string  
		 */
		public function getProductcodeprefix(){
			return $this->productcodeprefix;
		}
			
		/**
		 * productgroupprefix 
		 * @param string $productgroupprefix 
		 * @return string  
		 */
		public function setProductgroupprefix($productgroupprefix){
			$this->productgroupprefix = $productgroupprefix;
			return $this;
		}
		
		/**
		 * @column "productgroupprefix"
		 * @property
		 * productgroupprefix 
		 * @return string  
		 */
		public function getProductgroupprefix(){
			return $this->productgroupprefix;
		}
			
		/**
		 * emailfooter 
		 * @param string $emailfooter 
		 * @return string  
		 */
		public function setEmailfooter($emailfooter){
			$this->emailfooter = $emailfooter;
			return $this;
		}
		
		/**
		 * @column "emailfooter"
		 * @property
		 * emailfooter 
		 * @return string  
		 */
		public function getEmailfooter(){
			return $this->emailfooter;
		}
			
		/**
		 * lastschedulerun 
		 * @param DateTime $lastschedulerun 
		 * @return DateTime  
		 */
		public function setLastschedulerun($lastschedulerun){
			$this->lastschedulerun = $lastschedulerun;
			return $this;
		}
		
		/**
		 * @column "lastschedulerun"
		 * @property
		 * lastschedulerun 
		 * @return DateTime  
		 */
		public function getLastschedulerun(){
			return $this->lastschedulerun;
		}
			
		/**
		 * runscheduledays 
		 * @param int $runscheduledays 
		 * @return int  
		 */
		public function setRunscheduledays($runscheduledays){
			$this->runscheduledays = $runscheduledays;
			return $this;
		}
		
		/**
		 * @column "runscheduledays"
		 * @property
		 * runscheduledays 
		 * @return int  
		 */
		public function getRunscheduledays(){
			return $this->runscheduledays;
		}
			
		/**
		 * vatrate 
		 * @param double $vatrate 
		 * @return double  
		 */
		public function setVatrate($vatrate){
			$this->vatrate = $vatrate;
			return $this;
		}
		
		/**
		 * @column "vatrate"
		 * @property
		 * vatrate 
		 * @return double  
		 */
		public function getVatrate(){
			return $this->vatrate;
		}
			
		/**
		 * changeset 
		 * @param int $changeset 
		 * @return int  
		 */
		public function setChangeset($changeset){
			$this->changeset = $changeset;
			return $this;
		}
		
		/**
		 * @column "changeset"
		 * @property
		 * changeset 
		 * @return int  
		 */
		public function getChangeset(){
			return $this->changeset;
		}
			
		/**
		 * phpdateformat 
		 * @param string $phpdateformat 
		 * @return string  
		 */
		public function setPhpdateformat($phpdateformat){
			$this->phpdateformat = $phpdateformat;
			return $this;
		}
		
		/**
		 * @column "phpdateformat"
		 * @property
		 * phpdateformat 
		 * @return string  
		 */
		public function getPhpdateformat(){
			return $this->phpdateformat;
		}
			
		/**
		 * jsdateformat 
		 * @param string $jsdateformat 
		 * @return string  
		 */
		public function setJsdateformat($jsdateformat){
			$this->jsdateformat = $jsdateformat;
			return $this;
		}
		
		/**
		 * @column "jsdateformat"
		 * @property
		 * jsdateformat 
		 * @return string  
		 */
		public function getJsdateformat(){
			return $this->jsdateformat;
		}
			
		/**
		 * currencycode 
		 * @param string $currencycode 
		 * @return string  
		 */
		public function setCurrencycode($currencycode){
			$this->currencycode = $currencycode;
			return $this;
		}
		
		/**
		 * @column "currencycode"
		 * @property
		 * currencycode 
		 * @return string  
		 */
		public function getCurrencycode(){
			return $this->currencycode;
		}
			
		/**
		 * isodialingcode 
		 * @param string $isodialingcode 
		 * @return string  
		 */
		public function setIsodialingcode($isodialingcode){
			$this->isodialingcode = $isodialingcode;
			return $this;
		}
		
		/**
		 * @column "isodialingcode"
		 * @property
		 * isodialingcode 
		 * @return string  
		 */
		public function getIsodialingcode(){
			return $this->isodialingcode;
		}
			
		/**
		 * mobilepattern 
		 * @param string $mobilepattern 
		 * @return string  
		 */
		public function setMobilepattern($mobilepattern){
			$this->mobilepattern = $mobilepattern;
			return $this;
		}
		
		/**
		 * @column "mobilepattern"
		 * @property
		 * mobilepattern 
		 * @return string  
		 */
		public function getMobilepattern(){
			return $this->mobilepattern;
		}
			
		/**
		 * smsapikey 
		 * @param string $smsapikey 
		 * @return string  
		 */
		public function setSmsapikey($smsapikey){
			$this->smsapikey = $smsapikey;
			return $this;
		}
		
		/**
		 * @column "smsapikey"
		 * @property
		 * smsapikey 
		 * @return string  
		 */
		public function getSmsapikey(){
			return $this->smsapikey;
		}
			
		/**
		 * smstestmode 
		 * @param string $smstestmode 
		 * @return string  
		 */
		public function setSmstestmode($smstestmode){
			$this->smstestmode = $smstestmode;
			return $this;
		}
		
		/**
		 * @column "smstestmode"
		 * @property
		 * smstestmode 
		 * @return string  
		 */
		public function getSmstestmode(){
			return $this->smstestmode;
		}
			
		/**
		 * smssendername 
		 * @param string $smssendername 
		 * @return string  
		 */
		public function setSmssendername($smssendername){
			$this->smssendername = $smssendername;
			return $this;
		}
		
		/**
		 * @column "smssendername"
		 * @property
		 * smssendername 
		 * @return string  
		 */
		public function getSmssendername(){
			return $this->smssendername;
		}
			
		/**
		 * timezone 
		 * @param string $timezone 
		 * @return string  
		 */
		public function setTimezone($timezone){
			$this->timezone = $timezone;
			return $this;
		}
		
		/**
		 * @column "timezone"
		 * @property
		 * timezone 
		 * @return string  
		 */
		public function getTimezone(){
			return $this->timezone ?? "Europe/London";
		}
			
		/**
		 * sslayer 
		 * @param string $sslayer 
		 * @return string  
		 */
		public function setSslayer($sslayer){
			$this->sslayer = $sslayer;
			return $this;
		}
		
		/**
		 * @column "sslayer"
		 * @property
		 * sslayer 
		 * @return string  
		 */
		public function getSslayer(){
			return $this->sslayer;
		}
			
		/**
		 * isolanguage 
		 * @param string $isolanguage 
		 * @return string  
		 */
		public function setIsolanguage($isolanguage){
			$this->isolanguage = $isolanguage;
			return $this;
		}
		
		/**
		 * @column "isolanguage"
		 * @property
		 * isolanguage 
		 * @return string  
		 */
		public function getIsolanguage(){
			return $this->isolanguage;
		}
			
		/**
		 * timezoneoffset 
		 * @param string $timezoneoffset 
		 * @return string  
		 */
		public function setTimezoneoffset($timezoneoffset){
			$this->timezoneoffset = $timezoneoffset;
			return $this;
		}
		
		/**
		 * @column "timezoneoffset"
		 * @property
		 * timezoneoffset 
		 * @return string  
		 */
		public function getTimezoneoffset(){
			return $this->timezoneoffset;
		}
			
		/**
		 * sslencryption 
		 * @param string $sslencryption 
		 * @return string  
		 */
		public function setSslencryption($sslencryption){
			$this->sslencryption = $sslencryption;
			return $this;
		}
		
		/**
		 * @column "sslencryption"
		 * @property
		 * sslencryption 
		 * @return string  
		 */
		public function getSslencryption(){
			return $this->sslencryption;
		}
			
		/**
		 * logoimageid
		 * @param int $logoimageid
		 * @return int
		 */
		public function setLogoimageid($logoimageid){
			if ($logoimageid != 0 && $logoimageid != null) {
				$this->logoimageid = $logoimageid;
			}
		
			return $this;
		}
		
		/**
		 * @column "logoimageid"
		 * @property
		 * logoimageid
		 * @return int
		 */
		public function getLogoimageid(){
			return $this->logoimageid;
		}
		
		/**
		 * faviconimageid
		 * @param int $faviconimageid
		 * @return int
		 */
		public function setFaviconimageid($faviconimageid){
			if ($faviconimageid != 0 && $faviconimageid != null) {
				$this->faviconimageid = $faviconimageid;
			}
		
			return $this;
		}
		
		/**
		 * @column "faviconimageid"
		 * @property
		 * faviconimageid
		 * @return int
		 */
		public function getFaviconimageid(){
			return $this->faviconimageid;
		}
		
		/**
		 * companyname 
		 * @param string $companyname 
		 * @return string  
		 */
		public function setCompanyname($companyname){
			$this->companyname = $companyname;
			return $this;
		}
		
		/**
		 * @column "companyname"
		 * @property
		 * companyname 
		 * @return string  
		 */
		public function getCompanyname(){
			return $this->companyname;
		}
			
		/**
		 * asciicurrency 
		 * @param int $asciicurrency 
		 * @return int  
		 */
		public function setAsciicurrency($asciicurrency){
			$this->asciicurrency = $asciicurrency;
			return $this;
		}
		
		/**
		 * @column "asciicurrency"
		 * @property
		 * asciicurrency 
		 * @return int  
		 */
		public function getAsciicurrency(){
			return $this->asciicurrency;
		}
			
		/**
		 * adminemail 
		 * @param string $adminemail 
		 * @return string  
		 */
		public function setAdminemail($adminemail){
			$this->adminemail = $adminemail;
			return $this;
		}
		
		/**
		 * @column "adminemail"
		 * @property
		 * adminemail 
		 * @return string  
		 */
		public function getAdminemail(){
			return $this->adminemail;
		}
			
		/**
		 * reportlogo 
		 * @param int $reportlogo 
		 * @return int  
		 */
		public function setReportlogo($reportlogo){
			if ($reportlogo != 0 && $reportlogo != null) {
				$this->reportlogo = $reportlogo;
			}
			return $this;
		}
		
		/**
		 * @column "reportlogo"
		 * @property
		 * reportlogo 
		 * @return int  
		 */
		public function getReportlogo(){
			return $this->reportlogo;
		}
			
		/**
		 * reportfooter 
		 * @param int $reportfooter 
		 * @return int  
		 */
		public function setReportfooter($reportfooter){
			if ($reportfooter != 0 && $reportfooter != null) {
				$this->reportfooter = $reportfooter;
			}
			return $this;
		}

		/**
		 * companydetails
		 * @param string $companydetails
		 * @return string
		 */
		public function setCompanydetails($companydetails){
			$this->companydetails = $companydetails;
			return $this;
		}
		
		/**
		 * @column "companydetails"
		 * @property
		 * companydetails
		 * @return string
		 */
		public function getCompanydetails(){
			return $this->companydetails;
		}
		
		/**
		 * @column "reportfooter"
		 * @property
		 * reportfooter 
		 * @return int  
		 */
		public function getReportfooter(){
			return $this->reportfooter;
		}		
		
		/**
		 * emailheader 
		 * @param string $emailheader 
		 * @return string  
		 */
		public function setEmailheader($emailheader){
			$this->emailheader = $emailheader;
			return $this;
		}
		
		/**
		 * @column "emailheader"
		 * @property
		 * emailheader 
		 * @return string  
		 */
		public function getEmailheader(){
			return $this->emailheader;
		}
		
		/**
		 * {@inheritDoc}
		 * @see AbstractBaseDataClass::updateRecord()
		 */
		public function updateRecord() {
			parent::updateRecord();
		
			$cache = new Cache(array(
					'name'      => 'session-cache',
					'path'      => __DIR__ . "/../tmp/",
					'extension' => '.cache'
			));
		
			$cache->erase("session");
		
			SessionControllerClass::setConfig($this);
		}
	}
?>