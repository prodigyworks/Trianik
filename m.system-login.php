<?php 
	require_once(__DIR__ . "/system-mobileheader.php"); 
	require_once(__DIR__ . "/confirmdialog.php");
	require_once(__DIR__ . "/businessobjects/UseragentClass.php");
	
	createConfirmDialog("loginDialog", "Forgot password ?", "forgotPassword");
	
	if (isset($_GET['fromdesktop'])) {
		try {
			SessionControllerClass::getDB()->beginTransaction();
			
			$useragent = new UseragentClass(true);
			$useragent->setName("Auto Generated");
			$useragent->setUseragent($_SERVER['HTTP_USER_AGENT']);
			$useragent->insertRecord();
			
			SessionControllerClass::getDB()->commit();
			
		} catch (Exception $e) {
			SessionControllerClass::getDB()->rollBack();
		}
	}
?>
<style>
	form {
		overflow:visible;
	}
	section {
		color: black;
		background-color: white;
		width:100%;
		height:83%;
	}
	.content, .footer {
		display: none;
	}
	html {
		background-color: #f4f4f4;
		overflow: hidden;
	}
	.loginerror {
		position: absolute;
		margin-left: 200px;
		margin-top: -120px;
		color: red;
		z-index:9999922;
		font-style: italic;
	}
	
	.loginbutton {
		display: block;
		color: black;
		text-decoration: none;
		line-height: .92em;
		box-shadow: 3px 3px 5px #888888;
		border-radius: 8px;
		border: 1px solid #888888;
		margin:25px;
		padding:8px;	
		background: linear-gradient(to bottom, #f85032 0%,#f16f5c 50%,#f6290c 51%,#f02f17 71%,#e73827 100%);
		color: white;
	}
	.loginimage {
		max-width:50%;
		max-height:100px;
	}
	section input {
		font-size:15px;
	}
	.forgot {
		text-decoration: none;
	}
</style>
<!--  Start of content -->
<?php
	if (! SessionControllerClass::getUser()->isAuthenticated()) {
?>
<section>
	<img class='loginimage' src="<?php echo "system-imageviewer.php?id=" . SessionControllerClass::getSiteConfig()->getLogoimageid(); ?>" />
<?php
	if (isset($_SESSION['ERRMSG_ARR'])) {
		echo "<div class='loginerror'>\n";
		echo "<img src='images/alert.png' />";
		
		for ($i = 0; $i < count($_SESSION['ERRMSG_ARR']); $i++) {
			echo "<p>" . $_SESSION['ERRMSG_ARR'][$i] . "</p>";
		}

		echo "</div>";
	}
	
	$protocol = stripos($_SERVER['SERVER_PROTOCOL'],'https') === true ? 'https://' : 'http://';			
	?>
	<form action="m.system-login-exec.php" method="post" id="loginForm">
		<div><label>User name</label></div>
		<input type="text" name="login" id="login" value="<?php if (isset($_SESSION['ERR_USER'])) echo $_SESSION['ERR_USER']; ?>"/>
		<br/>
		<input type="hidden" id="callback" name="callback" value="<?php if (isset($_GET['session'])) echo base64_decode( urldecode( $_GET['session'])); else echo $protocol . $_SERVER['SERVER_NAME'] . $_SERVER['PHP_SELF'] . "?" . $_SERVER['QUERY_STRING']; ?>" />
		<div><label>Password</label></div>
		<input type="password" name="password" id="password" value="" />
		<br>
		<div>
			<div class="loginbutton" onclick="$('#loginForm').submit()">Click To Log In</div>
		</div>
		<a href="javascript:void(0)" class="forgot" onclick="checkForgotPassword()">Forgotten password ?</a>
		
		<br />
		<br />
	</form>
	<script>
		document.onkeypress = changeHREF;
		function changeHREF(ev) {
			ev = ev || event;
			
			if (ev.keyCode == 13) {
				$('#loginForm').submit();
			}
		}

	</script>
</section>
<footer>
<br>
	<b>Powered by Prodigy Global</b>
</footer>
<script>
	function checkForgotPassword() {
		if ($("#login").val() != "") {
			$("#loginDialog .loginDialogbody").html("You are about to reset the password.<br>Are you sure ?");
			$("#loginDialog").dialog("open");
		}
	}
	
	function forgotPassword() {
		businessObjectToJSon({
				classname: "UserUIClass", 
				methodname: "resetPassword", 
				async: true,
				args: {
					login: $("#login").val()
				},
				success: function() {
					toastr.success("An email has been sent to your registered email address.");
				}
			});
	}
	
	$(document).ready(function() {
			$("#login").change(
					function() {
						$(".loginerror").hide();
					}
				);
		});
	
</script>
		
<?php
	}
	
	unset($_SESSION['ERRMSG_ARR']);
	unset($_SESSION['ERR_USER']);
?>
<!--  End of content -->

<?php include("system-mobilefooter.php"); ?>					
