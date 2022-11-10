<?php
	require_once(__DIR__ . "/pgcore-db.php");
	require_once(__DIR__ . "/businessobjects/MessageClass.php");
	require_once(__DIR__ . "/ui/PageUIClass.php");
	
	PageUIClass::loadLandingPage();

	require_once("confirmdialog.php");
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title><?php echo SessionControllerClass::getSiteConfig()->getCompanyname(); ?></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<link rel="shortcut icon" href="<?php echo SessionControllerClass::getSiteConfig()->getDomainurl() . "/system-imageviewer.php?id=" . SessionControllerClass::getSiteConfig()->getFaviconimageid(); ?>">

<link href="css/m.style-06072017.css" rel="stylesheet" type="text/css" />
<!-- 
<link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
 -->
<link href="css/jquery-ui.css" rel="stylesheet" type="text/css" />
<link href="css/dcmegamenu.css" rel="stylesheet" type="text/css" />
<link href="css/skins/white.css" rel="stylesheet" type="text/css" />


<script src="js/jquery-1.8.0.min.js" type="text/javascript"></script>
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/jquery-ui.min.js" type="text/javascript"></script>
<script src='js/jquery.hoverIntent.minified.js' type='text/javascript'></script>
<script src='js/jquery.dcmegamenu.1.3.3.js' type='text/javascript'></script>
<script src="js/prodigyworks-<?php echo SessionControllerClass::getSiteConfig()->getIsolanguage(); ?>-10042019.js" language="javascript" ></script>
<script src="js/businessobject-20170130.js" language="javascript" ></script>
<script src="js/toastr.js"></script>
<!--[if lt IE 7]>
<script type="text/javascript" src="js/ie_png.js"></script>
<script type="text/javascript">
	ie_png.fix('.png, .carousel-box .next img, .carousel-box .prev img');
</script>
<link href="css/ie6.css" rel="stylesheet" type="text/css" />
<![endif]-->
</head>
<body>
	<?php
		if (isset($_POST['command'])) {
			$_POST['command']();
		}
	?>
	
	<form method="post" id="commandForm" name="commandForm">
		<input type="hidden" id="command" name="command" />
		<input type="hidden" id="pk1" name="pk1" />
		<input type="hidden" id="pk2" name="pk2" />
	</form>
		<div id="embeddedcontent">
			<div class="embeddedpage">
				<div class="title"><?php echo SessionControllerClass::getPage()->getLabel(); ?></div>
				<div class="logout">
					<a href="system-logout.php"><img src='images/logout.png' height=20 /></a>
				</div>
				<hr>

			