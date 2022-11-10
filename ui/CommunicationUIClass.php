<?php
	require_once(__DIR__ . "/../ui/AbstractBaseDataUIClass.php");
	require_once(__DIR__ . "/../businessobjects/PartnerClass.php");
	require_once(__DIR__ . "/../businessobjects/SmstemplateClass.php");
	require_once(__DIR__ . "/../businessobjects/SmsoutgoingClass.php");
	require_once(__DIR__ . "/../sms/SMSClass.php");
	require_once(__DIR__ . "/../session/SessionControllerClass.php");

	class CommunicationUIClass extends AbstractBaseDataUIClass {

		/**
		 * Send SMS
		 * @param string $number
		 * @param string $message
		 * @return string
		 */
		public function sms($number, $message) {
			return SMSClass::send($number, $message);
		}
		
		/**
		 * Send SMS message.
		 * 
		 * @param unknown $apiKey API Key. 
		 * @param unknown $request Request.
		 * @param unknown $number Number.
		 * @param unknown $properties Properties.
		 * @return mixed|boolean Response
		 */
		public function send($apiKey, $request, $number, $properties) {
			$partner = PartnerClass::loadByPublicKey($apiKey);
			$template = SmstemplateClass::loadByPartnerAndRequest($partner->getId(), $request);
				
			$message = $this->replaceSMSTokens($properties, $template->getTemplate());
			
			$smsout = new SmsoutgoingClass();
			$smsout->setPartnerid($partner->getId());
			$smsout->setDescription("");
			$smsout->setErrormessage("");
			$smsout->setMessage($message);
			$smsout->setStatus(200);
			$smsout->setNumber($number);
			$smsout->insertRecord();

			$json = SMSClass::send($number, $message, $partner->getPublickey(), $partner->getSmssendername());
			$json = json_decode($json, true);
				
			if (isset($json["errors"])) {
				throw new Exception($json["errors"][0]["message"], 400);
			}
			
			return $json;
		}
		
		/**
		 * Send email
		 * @param string $to
		 * @param string $from
		 * @param string $from_name
		 * @param string $subject
		 * @param string $body
		 */
		public function email($to, $from, $from_name, $subject, $body) {
			try {
				SessionControllerClass::email($to, $from, $from_name, $subject, $body);
				
			} catch (Exception $e) {
				return json_encode(array("error" => $e->getMessage()));
			}
			
			return json_encode(array("ok" => true));
		}
		

		/**
		 * Replace tokenised string with object values.
		 * @param string $text Tokenised string.
		 * @return string
		 */
		private function replaceSMSTokens($properties, $text) {
			$offset = 0;
			$newText = "";
		
			while (($found = strpos($text, '${', $offset)) != false) {
				$newText .= substr($text, $offset, $found - $offset);
				$token = substr($text, $found + 2, strpos($text, "}", $found) - ($found + 2));
				$newText .= $this->getSMSTokenValue($properties, $token);
		
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
		private function getTokenSMSMoniker($properties, $token) {
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
				try {
					return $properties[$token];
		
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
		private function getSMSTokenValue($properties, $token) {
			if (strpos($token, ".")) {
				$properties = $properties[substr($token, 0, strpos($token, "."))];
		
				if ($value == null) {
					return "";
				}
		
				return $this->getSMSTokenValue($properties, substr($token, strpos($token, ".") + 1));
		
			} else {
				return $this->getTokenSMSMoniker($properties, $token);
			}
		}
	}
?>