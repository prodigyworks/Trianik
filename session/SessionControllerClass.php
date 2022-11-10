<?php
	require_once(__DIR__ . "/../businessobjects/UserClass.php");
	require_once(__DIR__ . "/../businessobjects/PageClass.php");
	require_once(__DIR__ . "/../businessobjects/UserRoleClass.php");
	require_once(__DIR__ . "/../businessobjects/RoleClass.php");
	require_once(__DIR__ . "/../businessobjects/LoginauditClass.php");
	require_once(__DIR__ . "/../businessobjects/ErrorClass.php");
	require_once(__DIR__ . "/../businessobjects/SiteConfigClass.php");
	require_once(__DIR__ . "/../cache/Cache.php");
	
	class SessionControllerClass {
		private static $staticPage = null;
		private static $staticConfig = null;
		
		/**
		 * Get DB.
		 * @return PDO
		 */
		public static function getDB() {
			static $db = null;
				
			if ($db == null) {
				$db = new PDO(
						"mysql:host=" . DB_HOST .
						";dbname=" . DB_DATABASE .
						";charset=utf8mb4",
						DB_USER,
						DB_PASSWORD
					);
		
				$db->setAttribute(PDO::ATTR_EMULATE_PREPARES, true);
				$db->setAttribute(PDO::ATTR_AUTOCOMMIT, false);
				$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			}
				
			return $db;
		}
		
		/**
		 * Log error.
		 * @param string $description
		 */
		public static function error($description) {
			if (SessionControllerClass::getDB()->inTransaction()) {
				SessionControllerClass::getDB()->rollBack();
			}
			
			SessionControllerClass::getDB()->beginTransaction();
			SessionControllerClass::debug($description);
			SessionControllerClass::getDB()->commit();
		    
			die($description);
    	}
		
		/**
		 * Log debug.
		 * @param string $description
		 */
		public static function debug($description) {
			$error = new ErrorsClass(true);
			$error->setPageid(SessionControllerClass::getPage()->getId());
			$error->setMemberid(SessionControllerClass::getUser()->getMemberid());
			$error->setDescription($description);
			$error->insertRecord();
    	}

    	/**
    	 * Set curent page.
    	 * @param $page PageClass
    	 */
    	public static function setPage($page) {
    		self::$staticPage = $page;
    	}
    	
		/**
		 * Get curent page.
		 * @return PageClass
		 */
		public static function getPage() {
			if (self::$staticPage == null) {
				/* System process to report page information as Home */
				$page = new PageClass(true);
				$page->loadRecord(PageClass::PAGE_HOMEPAGE);
				
				SessionControllerClass::setPage($page);
			}
			
			return self::$staticPage;
		}

		/**
		 * Set config.
		 * @param $config SessionConfgClass
		 */
		public static function setConfig($config) {
			self::$staticConfig = $config;
		}
		
		/**
		 * Get site config.
		 * @return SiteConfigClass
		 */
		public static function getSiteConfig() {
			if (self::$staticConfig == null) {
				$cache = new Cache(array(
						'name'      => 'session-cache',
						'path'      => __DIR__ . "/../tmp/",
						'extension' => '.cache'
					));
				
				if ($cache->isCached("session")) {
					self::$staticConfig = $cache->retrieve("session");
					
					return self::$staticConfig;
				}
	
				self::$staticConfig = new SiteConfigClass(true);
				self::$staticConfig->loadRecord();
	
	            $cache->store("session", self::$staticConfig);
			
				return self::$staticConfig;
			}
			
			return self::$staticConfig;
		}
		
		/**
		 * Get session user.
		 * @return UserClass
		 */
		public static function getUser() {
			if (! isset($_SESSION['SESSION_USER'])) {
				/* Create public access user. */
				$user = new UserClass(true);
				$user->setMemberid(0);
				$user->setFullname("Public Access");
				$user->addUserRole(new UserRoleClass(true, RoleClass::ROLE_PUBLIC));
				$user->addUserRole(new UserRoleClass(true, RoleClass::ROLE_UNAUTHENTICATED));
		
				$_SESSION['SESSION_USER'] = $user;
			}
				
			return $_SESSION['SESSION_USER'];
		}
		
		/**
		 * Set the session user.
		 * @param UserClass $user
		 */
		public static function setUser($user) {
			$_SESSION['SESSION_USER'] = $user;
		}
		
		/**
		 * Email.
		 * @param string $to
		 * @param string $from
		 * @param string $from_name
		 * @param string $subject
		 * @param string $body
		 * @param array $attachments
		 * @throws Exception
		 */
		public static function email($to, $from, $from_name, $subject, $body, $attachments = array()) {
			if (DEV_ENV == "true") {
				return;
			}
			
		    $email = filter_var($to, FILTER_SANITIZE_EMAIL);
		    
            if (! filter_var($email, FILTER_VALIDATE_EMAIL)) {
                return;
            }

			require_once(__DIR__ . "/../phpmailer/class.phpmailer.php");
		
			$array = explode(',', $to);
		
			try {
				$mail = new PHPMailer();  // create a new object
				$mail->AddReplyTo($from, $from_name);
				$mail->SetFrom(SessionControllerClass::getSiteConfig()->getAdminemail(), $from_name);
				$mail->IsHTML(true);
				$mail->Subject = $subject;
				$mail->Body = $body;
		
				for ($i = 0; $i < count($attachments); $i++) {
					$mail->AddAttachment($attachments[$i]);
				}
		
				for ($i = 0; $i < count($array); $i++) {
					$mail->AddAddress($array[$i]);
				}
		
				if(! $mail->Send()) {
					throw new Exception("Mail error: {$mail->ErrorInfo}");
				}
		
			} catch (phpmailerException $e) {
				logError("Mail error: {$e->errorMessage()} - $to, $from, $from_name, $subject, $body", false);
		
//				throw($e);
					
			} catch (Exception $e) {
				logError("Mail error: {$e->errorMessage()} - $to, $from, $from_name, $subject, $body", false);
		
//				throw($e);
			}
		}
		
		/**
		 * Login.
		 * @param string $login
		 * @param string $password
		 * @param boolean $redirect
		 */
		public static function login($login, $password, $redirect = true, $preventRole = null) {
			unset($_SESSION['MENU_CACHE']);
	
			if (trim($login) == '') {
				throw new Exception("User ID missing");
			}
				
			if (trim($password) == '') {
				throw new Exception("Password missing");
			}
	
			/* Create new user class. */
			$user = new UserClass(true);
			$user->loadByLoginAndPassword($login, $password, $preventRole);
			
			if ($user->getMemberid() == null) {
				throw new Exception("Invalid user or incorrect password");
			}
				
			/* Generate new session. */
			session_regenerate_id();
	
			/* Store session user. */
			$_SESSION['SESSION_USER'] = $user;
			
			$audit = new LoginauditClass();
			$audit->setMemberid($user->getMemberid());
			$audit->setTimeon(date("Y-m-d H:i"));
			$audit->insertRecord();
	
			/* Update user new audit link. */
			$user->setLoginauditid($audit->getId());
			$user->updateRecord();
		}
	
		/**
		 * Logout.
		 */
		public static function logout() {
			if (SessionControllerClass::getUser()->isAuthenticated()) {
				SessionControllerClass::getUser()->createAuditTrail();
			}
	
			session_unset();
		}
	}
?>