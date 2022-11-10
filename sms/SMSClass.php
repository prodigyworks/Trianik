<?php
	require_once(__DIR__ . "/../pgcore-db.php");
	require_once(__DIR__ . "/../session/SessionControllerClass.php");
	
	class SMSClass {
		
		/**
		 * Send SMS message.
		 * @param string $number
		 * @param string $text
		 * @return mixed
		 */
	    public static function send($number, $text, $apiKey, $senderName) {
	    	if ($number == null || $number == "") {
	    		return false;
	    	}
	    	
	    	$number = str_replace(" ", "", $number);
	    	$number = str_replace("-", "", $number);
	    	$number = str_replace("(", "", $number);
	    	$number = str_replace(")", "", $number);
	    	$number = str_replace("+", "", $number);
	    	
	    	/* Mobile phones only. */
	    	if (SessionControllerClass::getSiteConfig()->getMobilepattern() != "") {
		    	if (substr($number, 0, 2) == SessionControllerClass::getSiteConfig()->getMobilepattern()) {
		    		$number = substr($number, 1);
		    	}
	    	}
	    	
	    	if (substr($number, 0, strlen(SessionControllerClass::getSiteConfig()->getIsodialingcode())) != SessionControllerClass::getSiteConfig()->getIsodialingcode()) {
		    	$number = SessionControllerClass::getSiteConfig()->getIsodialingcode() . $number;
	    	}
	    	
	    	$number = filter_var($number, FILTER_SANITIZE_STRING, FILTER_FLAG_STRIP_HIGH);
	    	
	    	/* Prepare data for POST request. */
	    	$data = array(
	    			'apiKey' => $apiKey,
	    			'numbers' => implode(',', array($number)),
	    			"sender" => $senderName,
	    			"test" => (SessionControllerClass::getSiteConfig()->getSmstestmode() == "Y") ? true : false,
	    			"message" => rawurlencode($text)
		    	);
	    	
	    	// Send the POST request with cURL
	    	$ch = curl_init('http://api.txtlocal.com/send/');
	    	curl_setopt($ch, CURLOPT_POST, true);
	    	curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
	    	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	    	$response = curl_exec($ch);
	    	curl_close($ch);

	    	return $response;
	    }

	    /**
	     * Get messages.
	     * 
	     * @param string $inboxName
	     * @return array
	     */
	    public static function getMessages($inboxName) {
	    	$messages = array();
	    
	    	// Prepare data for POST request
	    	$data = array(
	    			"apikey" => SessionControllerClass::getSiteConfig()->getSmsapikey(),
	    			"sort_order" => "desc",
	    			"min_time" => strtotime("-1 Hours")
		    	);
	    
	    	// Send the POST request with cURL
	    	$ch = curl_init('https://api.txtlocal.com/get_inboxes/');
	    	curl_setopt($ch, CURLOPT_POST, true);
	    	curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
	    	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	    	$response = curl_exec($ch);
	    	curl_close($ch);
	    
	    	$inboxes = json_decode($response, true);
	    
	    	foreach ($inboxes['inboxes'] AS $row) {
	    		if ($row['keyword'] == $inboxName) {
	    			// Prepare data for POST request
	    			$data = array('apikey' => SessionControllerClass::getSiteConfig()->getSmsapikey(), 'inbox_id' => $row['id']);
	    				
	    			// Send the POST request with cURL
	    			$ch = curl_init('https://api.txtlocal.com/get_messages/');
	    			curl_setopt($ch, CURLOPT_POST, true);
	    			curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
	    			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	    			$response = curl_exec($ch);
	    			curl_close($ch);
	    				
	    			$message = json_decode($response, true);
	    			$messages = $message['messages'];
	    		}
	    	}
	    
	    	return $messages;
	    }
    }
?>