<?php 
	require_once(__DIR__ . "/pgcore-db.php");
	require_once(__DIR__ . "/liquibase.php");

	$protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";
    	
	if (SessionControllerClass::getSiteConfig()->getSslayer() == "Y" && $protocol == "http://" && strpos(SessionControllerClass::getSiteConfig()->getDomainurl(), "https://") === 0) {
		header("location: " . SessionControllerClass::getSiteConfig()->getDomainurl());
		exit(0);
	}
	
	require_once("system-header.php"); 
	require_once("confirmdialog.php");
	
	createConfirmDialog("loginDialog", "Forgot password ?", "forgotPassword");
?>
<style>
	.content, .footer {
		display: none;
	}
	html {
		background-color: #f4f4f4;
		overflow: hidden;
	}
	.loginerror {
		color: red;
		z-index:9999922;
		font-style: italic;
	}
</style>
<!--  Start of content -->
<p align="center">&nbsp;</p>
<img src="images/login-page.png" />
		<?php
			if (! SessionControllerClass::getUser()->isAuthenticated()) {
		?>
		<div class="modal" id="dialog">
		<?php
			if (isset($_SESSION['ERRMSG_ARR'])) {
				echo "<div class='loginerror'>\n";
				echo "<img src='images/alert.png' />";
				
				echo "<p>" . $_SESSION['ERRMSG_ARR'] . "</p>";
				
				unset($_SESSION['ERRMSG_ARR']);
				unset($_SESSION['ERR_USER']);
				
				echo "</div>";
			}
		?>
			<form action="system-login-exec.php" method="post" id="loginForm">
				<div><label>User name</label></div>
				<input type="text" name="login" id="login" value="<?php if (isset($_SESSION['ERR_USER'])) echo $_SESSION['ERR_USER']; ?>"/>
				<br/>
				<br/>
				<input type="hidden" id="callback" name="callback" value="<?php if (isset($_GET['session'])) echo base64_decode( urldecode( $_GET['session'])); else echo $protocol . $_SERVER['SERVER_NAME'] . $_SERVER['PHP_SELF'] . "?" . $_SERVER['QUERY_STRING']; ?>" />
				<div><label>password</label></div>
				<input type="password" name="password" id="password" value="" />
				<div style="float:right;margin-top:-50px">
					<img height=90 src="<?php echo SessionControllerClass::getSiteConfig()->getDomainurl() . "/system-imageviewer.php?id=" . SessionControllerClass::getSiteConfig()->getLogoimageid(); ?>" />				
				</div>
				<img src="images/loginlogo.png" class="loginlogo"  />
				<br />
				<br />
				<br />
				<div>
					<div class="loginbutton" onclick="$('#loginForm').submit()">Click To Log In</div>
				</div>
				<br>
				<br />
				<br />
				<br />
				<br>
				<a href="javascript:void(0)" onclick="checkForgotPassword()">Forgotten password ?</a>
			</form>
			<div>
				<span style="">
					<img src="images/mobiledevice.png" height=42 id="iammobile"  />
					<br />
					<h6 style='color: black'>Mobile version</h6>
				</span>
			
			</div>
			<script>
				$(document).ready(
						function() {
							$("#iammobile").click(
									function() {
										navigate("m.system-login.php?fromdesktop=true");
									}
								);
						}
					);
				
				document.onkeypress = changeHREF;
				function changeHREF(ev) {
					ev = ev || event;
					
					if (ev.keyCode == 13) {
						$('#loginForm').submit();
					}
				}

			</script>
		</div>
		
		<script>
			function checkForgotPassword() {
				if ($("#login").val() != "") {
					$("#loginDialog .confirmdialogbody").html("An email will be sent to your registered email address containing your existing password.<br><br>Continue ?");
					$("#loginDialog").dialog("open");
					
				} else {
					pwAlert("Login must be specified");
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
							pwAlert("An email has been sent to your registered email address.");
						}
					});
			}
			
			$(document).ready(function() {
					$("#login").change(
							function() {
//								$(".loginerror").hide();
							}
						);
						
					$("#dialog").dialog({
							modal: true,
							width: 480,
							closeOnEscape: false,
							dialogClass: 'login-dialog',
							beforeClose: function() { return false; }
						});
				});
			
		</script>
				
		<?php
			}
			
		?>
<!--  End of content -->

<?php include("system-footer.php"); ?>					
