<?php include("system-header.php"); ?>

<?php
if( isset($_SESSION['ERRMSG_ARR'])) {
?>
	<script>
		$(document).ready(
				function() {
					pwAlert("<?php echo escape_notes($_SESSION['ERRMSG_ARR']); ?>");
				}
			);
	</script>
<?php
	unset($_SESSION['ERRMSG_ARR']);
}
?>
	<script src='js/jquery.ui.timepicker.js'></script>
	<form id="loginForm" enctype="multipart/form-data" name="loginForm" class="entryform" method="post" action="system-register-exec.php">
	<h4><?php echo SessionControllerClass::getPage()->getLabel(); ?></h4>
	  <table border="0" align="left">
	    <tr>
	      <td width='150px'>First Name </td>
	      <td><input required="true" name="fname" type="text" class="textfield" id="fname" /></td>
	    </tr>
	    <tr>
	      <td>Last Name </td>
	      <td><input required="true" name="lname" type="text" class="textfield" id="lname" /></td>
	    </tr>
	    <tr>
	      <td>Login</td>
	      <td><input required="true" name="login" type="text" class="textfield60 logintext" id="login" /></td>
	    </tr>
	    <tr>
	      <td>Email</td>
	      <td><input required="true" name="email" type="email" class="textfield60" id="email" /></td>
	    </tr>
	    <tr>
	      <td>Confirm Email</td>
	      <td><input required="true" name="confirmemail" type="email" class="textfield60" id="confirmemail" /></td>
	    </tr>
	    <tr>
	      <td>Image</td>
	      <td><input name="image" type="file" class="textfield60" id="image" /></td>
	    </tr>
	    <tr>
	    	<td colspan="2">
	    		<h4>Security</h4>
	    		<hr />
	    	</td>
	    </tr>
	    <tr>
	      <td>Password</td>
	      <td>
	      	<input required="true" name="password" type="password" class="textfield pwd" id="password" />
	      </td>
	    </tr>
	    <tr>
	      <td>Confirm Password </td>
	      <td><input required="true" name="cpassword" type="password" class="textfield" id="cpassword" /></td>
	    </tr>
	    <tr>
	      <td>&nbsp;</td>
	      <td>
	  		<span class="wrapper"><a class='link2' href="javascript:if (verify()) $('#loginForm').submit();"><em><b>Submit</b></em></a></span>
	      </td>
	    </tr>
	  </table>
	  <input type="hidden" id="description" name="description" value="Profile image" />
	</form>
<script>
	$(document).ready(function() {
		$("#accounttype").change(
				function() {
					if ($(this).val() == "MANAGEMENT") {
						$(".management").show();
						$(".pincode").attr("required", true);
						
					} else {
						$(".management").hide();
						$(".pincode").attr("required", false);
					}
				}
			);

		$(".exclusion").click(
				function() {
					if ($(this).attr("checked")) {
						$(this).parent().find(".alldaytimepicker").val("");
						$(this).parent().find(".alldaytimepicker").attr("placeholder", "N/A");
						$(this).parent().find(".alldaytimepicker").attr("disabled", true);
						
					} else {
						$(this).parent().find(".alldaytimepicker").val("");
						$(this).parent().find(".alldaytimepicker").attr("placeholder", "");
						$(this).parent().find(".alldaytimepicker").attr("disabled", false);
					}
				}
			);
		
		$(".pwd").blur(verifypassword);
		$(".logintext").blur(checkLogin);
		$("#email").blur(checkEmail);
		$("#cpassword").blur(verifycpassword);
		$("#confirmemail").blur(verifycemail);
		$("#fname").focus();
		$("#accounttype").trigger("change");
		
	});

	function verify() {
		var isValid = verifyStandardForm('#loginForm');
		
		if (! verifypassword()) {
			isValid = false;
		}
		
		if (! verifycpassword()) {
			isValid = false;
		}
		
		if (! checkLogin()) {
			isValid = false;
		}
		
		if (! checkEmail()) {
			isValid = false;
		}
		
		if (! verifycemail()) {
			isValid = false;
		}
		
		return isValid;
	}
	
	function verifypassword() {
		var node = $(".pwd");
		var str = $(node).val();
		
		return true;
	}
	
	function verifycpassword() {
		var node = $("#cpassword");
		var str = $(node).val();
		
		if ($(node).val() == "") {
			return false;
		}
		
		if( str == $(".pwd").val()) {
			$(node).removeClass("invalid");
			$(node).next().css("visibility", "hidden");
			$(node).next().attr("title", "Required field.");
			
			return true;
			
		} else {
			$(node).addClass("invalid");
			$(node).next().css("visibility", "visible");
			$(node).next().attr("title", "Passwords do not match.");
			
			return false;
		}
	}
	
	function checkLogin() {
		var node = $(".logintext");
		var returnValue = true;
		
		if ($(node).val() == "") {
			return false;
		}
		
		var bo = businessObjectToJSon({
				classname: "UserUIClass", 
				methodname: "loadByLogin", 
				args: {
					login: node.val()
				}
			});

		if (bo.memberid != null) {
			$(node).addClass("invalid");
			$(node).next().css("visibility", "visible");
			$(node).next().attr("title", "Login is already in use.");

			return false;
		}
		
		$(node).removeClass("invalid");
		$(node).next().css("visibility", "hidden");
		$(node).next().attr("title", "Required field.");

		return true;
	}
	
	function checkEmail() {
		var node = $("#email");
		var returnValue = true;
		
		if ($(node).val() == "") {
			return false;
		}
		
		var user = businessObjectToJSon({
			classname: "UserUIClass", 
			methodname: "loadByEmail", 
			args: {
				email: node.val()
			}
		});

		if (user.memberid != null) {
			pwAlert("Email has already been registered");
			return false;
		}
		
		return returnValue;
	}
	
	function verifycemail() {
		var node = $("#confirmemail");
		var str = $(node).val();
		
		if ($(node).val() == "") {
			return false;
		}
		
		if( str == $("#email").val()) {
			$(node).removeClass("invalid");
			$(node).next().css("visibility", "hidden");
			$(node).next().attr("title", "Required field.");
			
			return true;
			
		} else {
			$(node).addClass("invalid");
			$(node).next().css("visibility", "visible");
			$(node).next().attr("title", "Email addresses do not match.");
			
			return false;
		}
	}
</script>
<!--  End of content -->

<?php include("system-footer.php"); ?>
