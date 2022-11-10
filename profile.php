<?php 
	require_once("system-header.php"); 
	require_once("businessobjects/UserClass.php");
	
	showErrors(); 
?>
<h4><?php echo SessionControllerClass::getPage()->getLabel(); ?></h4>
<!--  Start of content -->
<?php
	$user = new UserClass();
	$user->loadRecord(SessionControllerClass::getUser()->getMemberid());
?>
	<form id="loginForm" class="manualform entryform" enctype="multipart/form-data" name="loginForm" method="post" action="profile-exec.php">
	  <table border="0" align="left">
	    <tr>
	      <td>First Name </td>
	      <td><input required="true" name="fname" type="text" class="textfield" id="fname" value="<?php echo $user->getFirstname(); ?>" /></td>
	    </tr>
	    <tr>
	      <td>Last Name </td>
	      <td><input required="true" name="lname" type="text" class="textfield" id="lname" value="<?php echo $user->getLastname(); ?>" /></td>
	    </tr>
	    <tr>
	      <td>Email</td>
	      <td>
	      	<input required="true" name="email" type="email" class="textfield60" id="email"  value="<?php echo $user->getEmail(); ?>" />
	      	<input name="confirmemail" type="hidden" class="textfield60" id="confirmemail" />
	      </td>
	    </tr>
	      <td>Image</td>
	      <td>
<?php
	if ($user->getImageid() != 0 && $user->getImageid() != null) {
?>
			<img height=60 src='system-imageviewer.php?id=<?php echo $user->getImageid(); ?>' />
<?php
	} else {
?>
			<img height=60 src='images/no-image.gif' />
				
<?php
	}
?>
			<br>
	      	<input name="image" type="file" class="textfield60" id="image"  value="" />
	      </td>
	    </tr>
	    <tr>
	    	<td colspan="2">
	    		<br />
	    		<h4>Security</h4>
	    		<hr />
	    	</td>
	    </tr>
	    <tr>
	      <td>Password</td>
	      <td><input name="password" class="pwd" type="password" class="textfield" id="password" /></td>
	    </tr>
	    <tr>
	      <td>Confirm Password </td>
	      <td><input name="cpassword" type="password" class="textfield" id="cpassword" /></td>
	    </tr>
	    <tr>
	      <td>&nbsp;</td>
	      <td>
		  	<span class="wrapper"><a class='link2' href="javascript:if (verify()) $('#loginForm').submit();"><em><b>Update</b></em></a></span>
	      </td>
	    </tr>
	  </table>
	  <input type="hidden" id="description" name="description" value="Profile image" />
	  <script>
	  $(document).ready(
			function() {
				$(".pwd").blur(verifypassword);
				$("#email").blur(checkEmail);
				$("#cpassword").blur(verifycpassword);
				$("#fname").focus();
			});
	
	function verify() {
		var isValid = verifyStandardForm('#loginForm');
		
		if (! verifypassword()) {
			isValid = false;
		}
		
		if (! verifycpassword()) {
			isValid = false;
		}
		
		if (! checkEmail()) {
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
	
	
	function checkEmail() {
		var node = $("#email");
		var returnValue = true;
		
		if ($(node).val() == "") {
			return false;
		}
		
		$("#confirmemail").val(node.val());
		
		return returnValue;
	}
</script>
</form>
<!--  End of content -->

<?php include("system-footer.php"); ?>
