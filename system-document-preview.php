<?php
	require_once(__DIR__ . "/pgcore-db.php");
	require_once(__DIR__ . "/businessobjects/DocumentClass.php");
	require_once(__DIR__ . "/businessobjects/ImageClass.php");
	
	$name = $_POST['name'];
	$document = new DocumentClass();
	$document->loadRecord($_POST['id']);
	
	if (! in_array($document->getMimeType(), ImageClass::$permittedImageFiles)) {
?>
		$("#<?php echo $name; ?>_img").hide();
		$("#<?php echo $name; ?>_frame").show();
		$("#<?php echo $name; ?>_frame_cover").show();
<?php
	} else {
?>
		$("#<?php echo $name; ?>_img").show();
		$("#<?php echo $name; ?>_frame").hide();
		$("#<?php echo $name; ?>_frame_cover").hide();
<?php
	}
?>
