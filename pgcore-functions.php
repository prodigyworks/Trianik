<?php

function stringEncryption($action, $string){
	$output = false;
	$key = "-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCtl7Dgf4x0fi0lXfws7Cq/lk0d
TIEXnCu8PBMep0mtRia9WEJ8N53d+8gbuAcMzb4sW6MVOzTEKYrmtq/DTbiaXKiJ
o6osz5KgBjbcGrCzKKvk8uQuTZWusqp69LQfTYSwxwJIp45kl0g8yalewGUtpYuu
yWXBBsw7Z909BpTLBQIDAAAD
-----END PUBLIC KEY-----";

	$encrypt_method = 'AES-256-CBC';                // Default
	$secret_key = $key;               // Change the key!
	$secret_iv = '!IV@_$2';  // Change the init vector!

	// hash
	$key = hash('sha256', $secret_key);

	// iv - encrypt method AES-256-CBC expects 16 bytes - else you will get a warning
	$iv = substr(hash('sha256', $secret_iv), 0, 16);

	if( $action == 'encrypt' ) {
		$output = openssl_encrypt($string, $encrypt_method, $key, 0, $iv);
		$output = base64_encode($output);
	}
	else if( $action == 'decrypt' ){
		$output = openssl_decrypt(base64_decode($string), $encrypt_method, $key, 0, $iv);
	}

	return $output;
}

/**
 * Encrypt a message
 *
 * @param string $message - message to encrypt
 * @param string $key - encryption key
 * @return string
 * @throws RangeException
 */
function pgEncrypt($message)
{
	return stringEncryption("encrypt", $message);

}

/**
 * Decrypt a message
 *
 * @param string $encrypted - message encrypted with safeEncrypt()
 * @param string $key - encryption key
 * @return string
 * @throws Exception
 */
function pgDecrypt($encrypted)
{
	return stringEncryption("decrypt", $encrypted);
}

	/**
	 * Decrypt.
	 *
	 * @param string $str
	 * @return string
	 */
	function pgDecrypt2($str) {
		$key = <<<EOD
-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCtl7Dgf4x0fi0lXfws7Cq/lk0d
TIEXnCu8PBMep0mtRia9WEJ8N53d+8gbuAcMzb4sW6MVOzTEKYrmtq/DTbiaXKiJ
o6osz5KgBjbcGrCzKKvk8uQuTZWusqp69LQfTYSwxwJIp45kl0g8yalewGUtpYuu
yWXBBsw7Z909BpTLBQIDAAAD
-----END PUBLIC KEY-----
EOD;
		$data = base64_decode($str);
// 		$iv = substr($data, 0, mcrypt_get_iv_size(MCRYPT_RIJNDAEL_128, MCRYPT_MODE_CBC));
	
// 		return rtrim(
// 				mcrypt_decrypt(
// 						MCRYPT_RIJNDAEL_128,
// 						hash('sha256', $key, true),
// 						substr($data, mcrypt_get_iv_size(MCRYPT_RIJNDAEL_128, MCRYPT_MODE_CBC)),
// 						MCRYPT_MODE_CBC,
// 						$iv
// 						),
// 				"\0"
// 				);

		if (!openssl_public_decrypt($data, $method, $key)) {
			throw new Exception("Failed decrypting the data with this public key:$str $data $key.");
		}
		
		return $method;
	}

	function pgEncrypt2($data) {
		$key = <<<EOD
-----BEGIN PUBLIC KEY-----
MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCtl7Dgf4x0fi0lXfws7Cq/lk0d
TIEXnCu8PBMep0mtRia9WEJ8N53d+8gbuAcMzb4sW6MVOzTEKYrmtq/DTbiaXKiJ
o6osz5KgBjbcGrCzKKvk8uQuTZWusqp69LQfTYSwxwJIp45kl0g8yalewGUtpYuu
yWXBBsw7Z909BpTLBQIDAAAD
-----END PUBLIC KEY-----
EOD;
		// 		$iv = mcrypt_create_iv(
// 				mcrypt_get_iv_size(MCRYPT_RIJNDAEL_128, MCRYPT_MODE_CBC),
// 				MCRYPT_DEV_URANDOM
// 				);
			
// 		return base64_encode(
// 				$iv .
// 				mcrypt_encrypt(
// 						MCRYPT_RIJNDAEL_128,
// 						hash('sha256', $key, true),
// 						$data,
// 						MCRYPT_MODE_CBC,
// 						$iv
// 						)
// 				);
		openssl_public_encrypt($data, $method, $key);

		return base64_encode($method);
	}

	function endsWith( $str, $sub ) {
		return ( substr( $str, strlen( $str ) - strlen( $sub ) ) == $sub );
	}
	
	function escape_notes($notes) {
		return str_replace("\r", "", str_replace("'", "\\'", str_replace("\n", "\\n", str_replace("\"", "\\\"", str_replace("\\", "\\\\", $notes)))));
	}
	
	function logError($description, $kill = true) {
        error_log($description);
	}
	
	function convertStringToDate($str) {
		if (trim($str) == "") {
			return "";
		}

		return DateTime::createFromFormat(SessionControllerClass::getSiteConfig()->getPhpdateformat(), $str)->format("Y-m-d");
	}
	
	function convertStringToDateTime($str) {
		if (trim($str) == "") {
			return "";
		}
		
		return DateTime::createFromFormat(SessionControllerClass::getSiteConfig()->getPhpdateformat() . " H:i", $str)->format("Y-m-d H:i");
	}
	
	function cache_function($functionname, $arguments = array()) {
		$encoded = md5(json_encode($arguments));
		$cachekey = 'FNC_CACHE_' . $functionname . "_" . $encoded;
	
		if (! isset($_SESSION[$cachekey]) || $_SESSION['CACHING'] == "false") {
			ob_start();
				
			$functionname($arguments);
				
			$_SESSION[$cachekey] = ob_get_clean();
		}
	
		echo $_SESSION[$cachekey];
	
	}
	
	function showErrors() {
		if( isset($_SESSION['ERRMSG_ARR'])) {
			echo '<ul class="err">';
			echo "<li>{$_SESSION['ERRMSG_ARR']}</li>";
			echo '</ul>';
	
			unset($_SESSION['ERRMSG_ARR']);
		}
	}
	
	/**
	 * Encrypt a message
	 *
	 * @param string $message - message to encrypt
	 * @param string $key - encryption key
	 * @return string
	 * @throws RangeException
	 */
	function safeEncrypt($message, $key)	{
		if (mb_strlen($key, '8bit') !== SODIUM_CRYPTO_SECRETBOX_KEYBYTES) {
			throw new RangeException('Key is not he correct size (must be 32 bytes).');
		}
		$nonce = random_bytes(SODIUM_CRYPTO_SECRETBOX_NONCEBYTES);
	
		$cipher = base64_encode(
				$nonce.
				sodium_crypto_secretbox(
						$message,
						$nonce,
						$key
						)
				);
		sodium_memzero($message);
		sodium_memzero($key);
		return $cipher;
	}
	
	/**
	 * Decrypt a message
	 *
	 * @param string $encrypted - message encrypted with safeEncrypt()
	 * @param string $key - encryption key
	 * @return string
	 * @throws Exception
	 */
	function safeDecrypt(string $encrypted, string $key) {
		$decoded = base64_decode($encrypted);
		$nonce = mb_substr($decoded, 0, SODIUM_CRYPTO_SECRETBOX_NONCEBYTES, '8bit');
		$ciphertext = mb_substr($decoded, SODIUM_CRYPTO_SECRETBOX_NONCEBYTES, null, '8bit');
	
		$plain = sodium_crypto_secretbox_open(
				$ciphertext,
				$nonce,
				$key
				);
		if (!is_string($plain)) {
			throw new Exception('Invalid MAC');
		}
		sodium_memzero($ciphertext);
		sodium_memzero($key);
		return $plain;
	}
	
	
	function createDocumentLink() {
?>
	<div class='modal documentmodal' id='documentDialog'>
		<iframe id='documentiframe' width=100% height=100% src='' frameborder='0' scrolling='no' src='' ></iframe>
	</div>
	<script>
		function viewDocument(headerid, callback, id) {
			var parameters = "";
			
			if (callback) {
				parameters = "&documentcallback=" + callback;
			}
			
			if (id) {
				parameters += "&identifier=" + id ;
				
			} else {
				parameters += "&identifier=";
			}
			
			parameters += "&table=documents&key=headerid";

			if (headerid == null) {
				$('#documentiframe').attr('src', 'documents.php?sessionid=<?php echo session_id(); ?>' + parameters);

			} else {
				$('#documentiframe').attr('src', 'documents.php?sessionid=<?php echo session_id(); ?>&id=' + headerid + parameters);
			}
			
			$('#documentDialog').dialog('open');
		}
		
		function viewSessionDocument(sessionid, callback, id) {
			try {resetRefresh(); } catch(e) {}
			var parameters = "";
			
			if (callback) {
				parameters = "&documentcallback=" + callback + "&identifier=" + id;
			}
			
			$('#documentiframe').attr('src', 'documents.php?sessionid=' + sessionid + parameters);
			$('#documentDialog').dialog('open');
		}
		
		
		$(document).ready(function() {
			$('#documentDialog').dialog({
					autoOpen: false,
					modal: true,
					width: 1050,
					height: 600,
					title: 'Documents',
					show:'fade',
					hide:'fade',
					dialogClass: 'document-dialog',
					buttons: {
						'Back': function() {
							$(this).dialog('close');
							try { resetTimer(); } catch (e) {}
						}
					}
				});
			});
	</script>
<?php			
	}
?>