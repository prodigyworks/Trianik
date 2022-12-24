<?php
require_once(__DIR__ . "/pgcore-db.php");

header("location: " . SessionControllerClass::getSiteConfig()->getDomainurl() . "/images/underconstruction.jpg");
exit();

require_once(__DIR__ . "/businessobjects/MessageClass.php");
require_once(__DIR__ . "/businessobjects/UserClass.php");
require_once(__DIR__ . "/ui/PageUIClass.php");

function showBreadCrumb() {
	PageUIClass::showBreadcrumbTrail();
}

PageUIClass::loadLandingPage();

require_once(__DIR__ . "/confirmdialog.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title><?php echo SessionControllerClass::getSiteConfig()->getCompanyname(); ?></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<link rel="shortcut icon" href="<?php echo SessionControllerClass::getSiteConfig()->getDomainurl() . "/system-imageviewer.php?id=" . SessionControllerClass::getSiteConfig()->getFaviconimageid(); ?>">

<link href="css/style-19122017.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
<link href="css/dcmegamenu.css" rel="stylesheet" type="text/css" />
<link href="css/skins/white.css" rel="stylesheet" type="text/css" />
<link href="css/toastr.css" rel="stylesheet"/>
<link href="css/prodigy.css" rel="stylesheet"/>
<script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/jquery-ui.min.js" type="text/javascript"></script>
<script src='js/jquery.hoverIntent.minified.js' type='text/javascript'></script>
<script src='js/jquery.dcmegamenu.1.3.3.js' type='text/javascript'></script>
<script src="js/prodigyworks-<?php echo SessionControllerClass::getSiteConfig()->getIsolanguage(); ?>-10042019.js" language="javascript" ></script>
<script src="js/businessobject-20170130.js" language="javascript" ></script>
<script src="js/toastr.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', function () {
		  if (Notification.permission !== "granted")
		    Notification.requestPermission();
		});
	
	function showNotification(title, body, link) {
		if (! Notification) {
			pwAlert('Desktop notifications not available in your browser. Try Chromium.'); 
			return;
		}
	
		if (Notification.permission !== "granted") {
			Notification.requestPermission();
	
		} else {
			var notification = new Notification(title, {
					icon: "<?php echo SessionControllerClass::getSiteConfig()->getDomainurl() . "/system-imageviewer.php?id=" . SessionControllerClass::getSiteConfig()->getLogoimageid(); ?>",
				    body: body
			    });

			if (link) {
				notification.onclick = function () {
				      window.open(link);      
				    };		    
			}
		}
	}
</script>
<!--[if lt IE 7]>
<script type="text/javascript" src="js/ie_png.js"></script>
<script type="text/javascript">
	ie_png.fix('.png, .carousel-box .next img, .carousel-box .prev img');
</script>
<link href="css/ie6.css" rel="stylesheet" type="text/css" />
<![endif]-->

</head>
<body id="page22">
<?php
	createConfirmDialog("passworddialog", "Forgot password ?", "forgotPassword");
	
	if (isset($_POST['command'])) {
		$_POST['command']();
	}
?>
	<form method="post" id="commandForm" name="commandForm">
		<input type="hidden" id="command" name="command" />
		<input type="hidden" id="pk1" name="pk1" />
		<input type="hidden" id="pk2" name="pk2" />
		<input type="hidden" id="pk3" name="pk3" />
		<input type="hidden" id="pk4" name="pk4" />
	</form>
	
	<div style="BORDER-COLLAPSE: collapse; border:<?php echo SessionControllerClass::getUser()->isAuthenticated() ? "1px solid black" : ""; ?>" id="main2">
		<!-- header -->
		<div id="header3">
			<div id="subheader3">
<?php 
	if (SessionControllerClass::getUser()->isAuthenticated()) {
?>
			<img height=70 src='<?php echo SessionControllerClass::getSiteConfig()->getDomainurl() . "/system-imageviewer.php?id=" . SessionControllerClass::getSiteConfig()->getLogoimageid(); ?>' />
<?php		
		SessionControllerClass::getUser()->createAuditTrail();
		$messagecount = MessageClass::getUnreadMessageCountForUser(SessionControllerClass::getUser()->getMemberid());
		$emailImage = "email.gif";
					
		if (isset($_SESSION['SESSION_MESSAGE_COUNT'])) {
			if ($_SESSION['SESSION_MESSAGE_COUNT'] < $messagecount) {
				$emailImage = "email_new.png";
				
				if (! isset($_SESSION['SESSION_MESSAGE_VIEWED'])) {
					$_SESSION['SESSION_MESSAGE_VIEWED'] = true;
?>
			<script>
			showNotification("Message Alert", "You have a new message", "<?php echo SessionControllerClass::getSiteConfig()->getDomainurl()?>/messages.php");
			</script>
<?php								
				}
			}
		}
?>
			<div id="toppanel">
				<div class="profileimage">
					<a class="messages" href="messages.php">
						<img src='images/<?php echo $emailImage; ?>'></img>&nbsp;
<?php 
		echo "($messagecount)";
?>
					</a>
<?php 
		if (SessionControllerClass::getUser()->getImageid() != null && 
			SessionControllerClass::getUser()->getImageid() != 0) {
?>	  
					<img id="profileimage_img" src='system-imageviewer.php?id=<?php echo SessionControllerClass::getUser()->getImageid(); ?>' />
<?php
		} else {
?>	  
					<img id="profileimage_img" src='images/noprofile.png'  />
<?php 
		}
?>									
					<div class='profileimageselector'>
						<img src='images/minimize.gif' />
					</div>
					<ul id="profileimageselectormenu" class="submenu">
						<li onclick='navigate("profile.php");'>&nbsp;&nbsp;<img src='images/edit.png' />&nbsp;Edit Profile&nbsp;&nbsp;</a></li>
						<li onclick='navigate("system-logout.php");'>&nbsp;&nbsp;<img src='images/logout2.png' />&nbsp;Log Out&nbsp;&nbsp;</a></li>
					</ul>
				</div>
			</div>
			
<?php
	if (SessionControllerClass::getUser()->isAuthenticated()) {
		echo PageUIClass::loadHomePageMenu();
	}
?>
<?php 
	if (SessionControllerClass::getUser()->isAuthenticated()) {
			
   		if (isset($_GET['callee'])) {
			cache_function("showBreadCrumb", array("pageid" => SessionControllerClass::getPage()->getId(), "callee" => $_GET['callee']));
				
   		} else {
   			cache_function("showBreadCrumb", array("pageid" => SessionControllerClass::getPage()->getId()));
   		}
   		 
		echo "<hr>\n";
	}
?>
			</div>
		</div>
<?php		
	}
?>
		<!-- content -->
		<div id="content2" class="scrollable">