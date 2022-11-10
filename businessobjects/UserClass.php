<?php
	require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");
	require_once(__DIR__ . "/../businessobjects/UserRoleClass.php");
	require_once(__DIR__ . "/../businessobjects/MessageClass.php");
	require_once(__DIR__ . "/../businessobjects/MediaContentClass.php");
	
	/**
	 * @table members
	 */
	class UserClass extends AbstractBaseDataClass {

		/* Properties. */
		private $member_id = null;
		private $firstname = null;
		private $lastname = null;
		private $fullname = null;
		private $login = null;
		private $passwd = null;
		private $email = null;
		private $title = null;
		private $imageid = null;
		private $holidayentitlement = null;
		private $clientid = null;
		private $description = null;
		private $lastaccessdate = null;
		private $status = null;
		private $postcode = null;
		private $systemuser = null;
		private $accepted = null;
		private $paymentmethod = null;
		private $website = null;
		private $guid = null;
		private $mobile = null;
		private $landline = null;
		private $fax = null;
		private $dateofbirth = null;
		private $notes = null;
		private $address = null;
		private $billingaddress = null;
		private $paperfreebillingaddress = null;
		private $loginauditid = null;
		private $postcode_lat = null;
		private $postcode_lng = null;
		private $deleted = null;
		 
		/* One to ones */
		
		/**
		 * member_id
		 * @param int $member_id
		 * @return int
		 */
		public function setMember_id($member_id){
			$this->member_id = $member_id;
			return $this;
		}
		
		/**
		 * @primarykey true
		 * @column "member_id"
		 * @property
		 * member_id
		 * @return int
		 */
		public function getMember_id(){
			return $this->member_id;
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
		 * fullname
		 * @param string $fullname
		 * @return string
		 */
		public function setFullname($fullname){
			$this->fullname = $fullname;
			return $this;
		}
		
		/**
		 * @column "fullname"
		 * @property
		 * fullname
		 * @return string
		 */
		public function getFullname(){
			return $this->fullname;
		}
		
		/**
		 * login
		 * @param string $login
		 * @return string
		 */
		public function setLogin($login){
			$this->login = $login;
			return $this;
		}
		
		/**
		 * @column "login"
		 * @property
		 * login
		 * @return string
		 */
		public function getLogin(){
			return $this->login;
		}
		
		/**
		 * passwd
		 * @param string $passwd
		 * @return string
		 */
		public function setPasswd($passwd){
			$this->passwd = $passwd;
			return $this;
		}
		
		/**
		 * @column "passwd"
		 * @property
		 * passwd
		 * @return string
		 */
		public function getPasswd(){
			return $this->passwd;
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
		 * title
		 * @param string $title
		 * @return string
		 */
		public function setTitle($title){
			$this->title = $title;
			return $this;
		}
		
		/**
		 * @column "title"
		 * @property
		 * title
		 * @return string
		 */
		public function getTitle(){
			return $this->title;
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
		 * holidayentitlement
		 * @param int $holidayentitlement
		 * @return int
		 */
		public function setHolidayentitlement($holidayentitlement){
			$this->holidayentitlement = $holidayentitlement;
			return $this;
		}
		
		/**
		 * @column "holidayentitlement"
		 * @property
		 * holidayentitlement
		 * @return int
		 */
		public function getHolidayentitlement(){
			return $this->holidayentitlement;
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
		 * description
		 * @param string $description
		 * @return string
		 */
		public function setDescription($description){
			$this->description = $description;
			return $this;
		}
		
		/**
		 * @column "description"
		 * @property
		 * description
		 * @return string
		 */
		public function getDescription(){
			return $this->description;
		}
		
		/**
		 * lastaccessdate
		 * @param DateTime $lastaccessdate
		 * @return DateTime
		 */
		public function setLastaccessdate($lastaccessdate){
			$this->lastaccessdate = $lastaccessdate;
			return $this;
		}
		
		/**
		 * @column "lastaccessdate"
		 * @property
		 * lastaccessdate
		 * @return DateTime
		 */
		public function getLastaccessdate(){
			return $this->lastaccessdate;
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
		 * postcode
		 * @param string $postcode
		 * @return string
		 */
		public function setPostcode($postcode){
			$this->postcode = $postcode;
			return $this;
		}
		
		/**
		 * @column "postcode"
		 * @property
		 * postcode
		 * @return string
		 */
		public function getPostcode(){
			return $this->postcode;
		}
		
		/**
		 * systemuser
		 * @param string $systemuser
		 * @return string
		 */
		public function setSystemuser($systemuser){
			$this->systemuser = $systemuser;
			return $this;
		}
		
		/**
		 * @column "systemuser"
		 * @property
		 * systemuser
		 * @return string
		 */
		public function getSystemuser(){
			return $this->systemuser;
		}
		
		/**
		 * accepted
		 * @param string $accepted
		 * @return string
		 */
		public function setAccepted($accepted){
			$this->accepted = $accepted;
			return $this;
		}
		
		/**
		 * @column "accepted"
		 * @property
		 * accepted
		 * @return string
		 */
		public function getAccepted(){
			return $this->accepted;
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
		 * website
		 * @param string $website
		 * @return string
		 */
		public function setWebsite($website){
			$this->website = $website;
			return $this;
		}
		
		/**
		 * @column "website"
		 * @property
		 * website
		 * @return string
		 */
		public function getWebsite(){
			return $this->website;
		}
		
		/**
		 * guid
		 * @param string $guid
		 * @return string
		 */
		public function setGuid($guid){
			$this->guid = $guid;
			return $this;
		}
		
		/**
		 * @column "guid"
		 * @property
		 * guid
		 * @return string
		 */
		public function getGuid(){
			return $this->guid;
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
		 * landline
		 * @param string $landline
		 * @return string
		 */
		public function setLandline($landline){
			$this->landline = $landline;
			return $this;
		}
		
		/**
		 * @column "landline"
		 * @property
		 * landline
		 * @return string
		 */
		public function getLandline(){
			return $this->landline;
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
		 * dateofbirth
		 * @param DateTime $dateofbirth
		 * @return DateTime
		 */
		public function setDateofbirth($dateofbirth){
			$this->dateofbirth = $dateofbirth;
			return $this;
		}
		
		/**
		 * @column "dateofbirth"
		 * @property
		 * dateofbirth
		 * @return DateTime
		 */
		public function getDateofbirth(){
			return $this->dateofbirth;
		}
		
		/**
		 * notes
		 * @param string $notes
		 * @return string
		 */
		public function setNotes($notes){
			$this->notes = $notes;
			return $this;
		}
		
		/**
		 * @column "notes"
		 * @property
		 * notes
		 * @return string
		 */
		public function getNotes(){
			return $this->notes;
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
		 * loginauditid
		 * @param int $loginauditid
		 * @return int
		 */
		public function setLoginauditid($loginauditid){
			$this->loginauditid = $loginauditid;
			return $this;
		}
		
		/**
		 * @column "loginauditid"
		 * @property
		 * loginauditid
		 * @return int
		 */
		public function getLoginauditid(){
			return $this->loginauditid;
		}
		
		/**
		 * postcode_lat
		 * @param float $postcode_lat
		 * @return float
		 */
		public function setPostcode_lat($postcode_lat){
			$this->postcode_lat = $postcode_lat;
			return $this;
		}
		
		/**
		 * @column "postcode_lat"
		 * @property
		 * postcode_lat
		 * @return float
		 */
		public function getPostcode_lat(){
			return $this->postcode_lat;
		}
		
		/**
		 * postcode_lng
		 * @param float $postcode_lng
		 * @return float
		 */
		public function setPostcode_lng($postcode_lng){
			$this->postcode_lng = $postcode_lng;
			return $this;
		}
		
		/**
		 * @column "postcode_lng"
		 * @property
		 * postcode_lng
		 * @return float
		 */
		public function getPostcode_lng(){
			return $this->postcode_lng;
		}
		
		/**
		 * deleted
		 * @param string $deleted
		 * @return string
		 */
		public function setDeleted($deleted){
			$this->deleted = $deleted;
			return $this;
		}
		
		/**
		 * @column "deleted"
		 * @property
		 * deleted
		 * @return string
		 */
		public function getDeleted(){
			return $this->deleted;
		}
		
		/**
		 * @column "member_id"
		 * @property
		 * member_id
		 * @return int
		 */
		public function getMemberid(){
			return $this->getMember_id();
		}
		
		public function setMemberid($id) {
			$this->setMember_id($id);
			
			return $this;
		}
		
		
		/** One to many **/
		private $userroles = null;
		
		/**
		 * Get user from ID.
		 * @param int $id
		 * @return UserClass
		 */
		public static function getUser($id) {
			$user = new UserClass();
			$user->loadRecord($id);
			
			return $user;
		}
		
		/**
		 * Create audit trail.
		 */
		public function createAuditTrail() {
			$sql = "UPDATE {$_SESSION['DB_PREFIX']}members SET
					lastaccessdate = NOW(),
					metamodifieddate = NOW(),
					metamodifieduserid = ?
					WHERE member_id = ?";
			
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $this->getMemberid(), PDO::PARAM_INT);
			$stmt->bindValue(2, $this->getMemberid(), PDO::PARAM_INT);
			$stmt->execute();
			
			$sql = "UPDATE {$_SESSION['DB_PREFIX']}loginaudit SET
					timeoff = NOW(),
					metamodifieddate = NOW(),
					metamodifieduserid = ?
					WHERE id = ?";

			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $this->getMemberid(), PDO::PARAM_INT);
			$stmt->bindValue(2, $this->getLoginauditid(), PDO::PARAM_INT);
			$stmt->execute();
		}
		
		/**
		 * Is the current user authenticated.
		 * @return boolean
		 */
		public function isAuthenticated()	{
			return ! in_array(RoleClass::ROLE_UNAUTHENTICATED, $this->getRoles());
		}
		
		/**
		 * Send daily task alert email
		 */
		public function sendDailyTaskAlertEmail() {
			$message = MediaContentClass::loadByCode("DAILYTASKALERT")->getMedia();
			$message = $this->replaceTokens($message);
			
			$this->sendEmail("Daily Alert Task Schedule", $message);
		}

		/**
		 * Send internal message.
		 * @param int $tomemberid
		 * @param string $subject
		 * @param string $message
		 * @param string $action
		 */
		public function sendInternalMessage($subject, $msg, $action = "") {
			$message = new MessageClass(true);
			$message->setAction($action);
			$message->setMessage($msg);
			$message->setStatus(MessageClass::MESSAGE_STATUS_NEW);
			$message->setDeleted("N");
			$message->setCreateddate(date("Y-m-d H:i:s"));
			$message->setSubject($subject);
			$message->setTo_member_id($this->getMemberid());
			$message->setFrom_member_id(SessionControllerClass::getUser()->getMemberid());
			$message->insertRecord();
		}
		
		/**
		 * Load user data by email
		 * @param string $email Email
		 * @throws Exception
		 */
		public function loadByEmail($email) {
			$sql = "SELECT A.*
					FROM {$_SESSION['DB_PREFIX']}members A
					WHERE A.email = ?";
			
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $email, PDO::PARAM_STR);
			
			$this->loadRowFromStatement($stmt);
		}
		
		/**
		 * Load by login
		 * @param string $login
		 * @throws Exception
		 * @return UserClass
		 */
		public function loadByLogin($login) {
			$sql = "SELECT A.*
					FROM {$_SESSION['DB_PREFIX']}members A
					WHERE A.login = ?";

			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $login, PDO::PARAM_STR);
				
			$this->loadRowFromStatement($stmt);
		}

		/**
		 * Load by login and password
		 * @param string $login
		 * @param string $pwd
		 * @throws Exception
		 * @return UserClass
		 */
		public function loadByLoginAndPassword($login, $pwd, $preventRole) {
				if ($preventRole == null) {
				$sql = "SELECT A.*
						FROM {$_SESSION['DB_PREFIX']}members A
						WHERE A.login = ?
						AND A.passwd = ?
						AND A.accepted = 'Y'
						AND A.status = 'Y'";

				$stmt = SessionControllerClass::getDB()->prepare($sql);
				$stmt->bindValue(1, $login, PDO::PARAM_STR);
				$stmt->bindValue(2, md5($pwd), PDO::PARAM_STR);
				
				$this->loadRowFromStatement($stmt);
				
			} else {
				$sql = "SELECT A.*
						FROM {$_SESSION['DB_PREFIX']}members A
						WHERE A.login = ?
						AND A.passwd = ?
						AND A.accepted = 'Y'
						AND A.status = 'Y'
						AND A.member_id NOT IN (
							SELECT B.memberid 
							FROM {$_SESSION['DB_PREFIX']}userroles B
							WHERE B.roleid = ?
						)";

				$stmt = SessionControllerClass::getDB()->prepare($sql);
				$stmt->bindValue(1, $login, PDO::PARAM_STR);
				$stmt->bindValue(2, md5($pwd), PDO::PARAM_STR);
				$stmt->bindValue(3, $preventRole, PDO::PARAM_STR);
				
				$this->loadRowFromStatement($stmt);
			}
		}
		
		/**
		 * Get role ID array/
		 * @return array
		 */
		public function getRoles() {
			$roles = array();
			
			foreach ($this->getUserRoles() AS $role) {
		 		$roles[] = $role->getRoleid();
		 	}
		 	
		 	return $roles;
		}
		
		/**
		 * Has the user a given role.
		 * @param string $roleid
		 * @return boolean
		 */
		public function hasRole($roleid) {
			foreach ($this->getUserRoles() AS $role) {
				if ($role->getRoleid() == $roleid) {
					return true;
				}
			}
			
			return false;
		}

		/**
		 * Does the user contain one of the given roles.
		 * @param array $roles
		 * @return boolean
		 */
		public function containsRole($roles) {
			foreach ($this->getUserRoles() AS $userrole) {
				foreach ($roles AS $role) {
					if ($userrole->getRoleid() == $role) {
						return true;
					}
				}
			}
				
			return false;
		}
		
		/**
		 * Deactivate.
		 */
		public function deactivate() {
			$this->setStatus("N");
			$this->updateRecord();
		}

		/**
		 * Activate.
		 */
		public function activate() {
			$this->setStatus("Y");
			$this->updateRecord();
		}
		
		/**
		 * Reset password.
		 * @throws Exception
		 */
		public function resetPassword() {
			if ($this->getMemberid() == null) {
				throw new Exception("Invalid user login.");
			}
			
			$word = "";
			
			srand(time());

			for ($i = 0; $i < 10; $i++) {
				$random = (rand()%52);
					
				if ($random > 26) {
					$random = $random - 26;
					$random = $random + 32;
				}
					
				$word = $word . chr($random + 65);
			}
			
			$this->changePassword($word);
		}
		
		/**
		 * Insert new row.
		 * @throws Exception
		 */
		public function insertRecord($rolesarray = array()) {
// 			if(! preg_match('/^(?=.*\d)(?=.*[A-Za-z])[0-9A-Za-z!@#$%]{8,20}$/', $this->getPasswd())) {
// 				throw new Exception("The password does not meet the requirements.<br>May contain letter and numbers<br>Must contain at least 1 number and 1 letter<br>May contain any of these characters: !@#$%<br>Must be 8-12 characters");
// 			}

			$this->accepted = "Y";
			$this->status = "Y";
			$this->timeoutperiod = 5;
			$this->setFullname("{$this->getFirstname()} {$this->getLastname()}");

			$userhtml = MediaContentClass::loadByCode("USERREGISTRATION")->getMedia();
			$userhtml = $this->replaceTokens($userhtml);
			
			$this->passwd = md5($this->passwd);
			$this->sendEmail("User Registration", $userhtml);
				
			parent::insertRecord();
			
			$userrole = new UserRoleClass();
			$userrole->setMemberid($this->member_id);
			$userrole->setRoleid("PUBLIC");
			$userrole->insertRecord();

			$userrole = new UserRoleClass();
			$userrole->setMemberid($this->member_id);
			$userrole->setRoleid("USER");
			$userrole->insertRecord();

			/* Default roles. */
			foreach ($rolesarray AS $role) {
				$userrole = new UserRoleClass();
				$userrole->setMemberid($this->member_id);
				$userrole->setRoleid($role);
				$userrole->insertRecord();
			}
		}
		
		/**
		 * Update.
		 * @throws Exception
		 */
		public function updateRecord() {
			$this->setFullname("{$this->getFirstname()} {$this->getLastname()}");
				
			parent::updateRecord();
		}
		
		/**
		 * Clear user roles.
		 * @throws Exception
		 */
		public function clearUserRoles() {
			$sql = "DELETE FROM {$_SESSION['DB_PREFIX']}userroles
					WHERE memberid = ?";
			
			$stmt = SessionControllerClass::getDB()->prepare($sql);
			$stmt->bindValue(1, $this->member_id, PDO::PARAM_INT);
			$stmt->execute();
				
			$this->userroles = null;
		}

		/**
		 * Change password
		 * @param string $password
		 */
		public function changePassword($password) {
			$this->setPasswd($password);
			
			$userhtml = MediaContentClass::loadByCode("USERRESETPASSWORD")->getMedia();
			$userhtml = $this->replaceTokens($userhtml);
				
			$this->sendEmail("Password Reset", $userhtml);
			$this->setPasswd(md5($password));
			$this->updateRecord();
		}
			
		/**
		 * Send message to user.
		 * @param string $subject
		 * @param string $message
		 * @param array $attachments
		 * @param string $action
		 */
		public function sendEmail($subject, $message, $attachments = array(), $action = "") {
			SessionControllerClass::email(
					$this->getEmail(),
					SessionControllerClass::getSiteConfig()->getAdminemail(),
					SessionControllerClass::getSiteConfig()->getCompanyname(),
					$subject,
					$message,
					$attachments
				);

//			$this->sendInternalMessage($subject, $message, $action);
		}

		/**
		 * Send internal message to user.
		 * @param string $subject
		 * @param string $message
		 * @param array $attachments
		 * @param string $action
		 */
		public function sendInternalEmail($subject, $message, $attachments = array(), $action = "") {
			SessionControllerClass::email(
					$this->getEmail(),
					SessionControllerClass::getUser()->getEmail(),
					SessionControllerClass::getUser()->getFullname(),
					$subject,
					$message,
					$attachments
				);
		
			$this->sendInternalMessage($subject, $message, $action);
		}
		
		/**
		 * Add user role.
		 * @param UserRoleClass $userrole
		 */
		public function addUserRole($userrole) {
			$this->userroles[] = $userrole;
		}
	
	    /**
		 * @onetomany
	     * roles
	     * @return UserRoleClass
	     */
	    public function getUserRoles($load = true){
	    	if ($this->userroles == null && $load) {
	    		$this->userroles = array();
	    		
	    		$sql = "SELECT A.*
			    		FROM {$_SESSION['DB_PREFIX']}userroles A
			    		WHERE A.memberid = ?
			    		ORDER BY A.roleid";
	    			
	    		$stmt = SessionControllerClass::getDB()->prepare($sql);
	    		$stmt->bindValue(1, $this->member_id, PDO::PARAM_INT);
	    		$stmt->execute();
	    		 
	    		$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
	    		 
	    		foreach ($rows AS $row) {
	    			$role = new UserRoleClass(true);
	    			$role->loadRecordFromResultset($row);
	    		
	    			$this->userroles[] = $role;
	    		}
    		}
	    	
	        return $this->userroles;
	    }
	
	    /**
	     * @property
	     * Get login link.
	     * @return string
	     */
	    public function getLoginLink() {
	    	return SessionControllerClass::getSiteConfig()->getDomainurl() . "/index.php";
	    }
	} 
?>