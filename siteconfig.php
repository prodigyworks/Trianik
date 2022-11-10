<?php
	require_once(__DIR__ . "/system-header.php");
	require_once(__DIR__ . "/tinymce.php");
	require_once(__DIR__ . "/businessobjects/SiteConfigClass.php");
	require_once(__DIR__ . "/businessobjects/ImageClass.php");
	require_once(__DIR__ . "/ui/ComboUIClass.php");
	?>

<!--  Start of content -->
<?php
	$siteconfig = new SiteConfigClass();
	$siteconfig->loadRecord();
	
	if (isset($_POST['domainurl'])) {
		try {
			SessionControllerClass::getDB()->beginTransaction();
				
			$logoimage = new ImageClass();
			$logoimage->setDescription("Logo Image");
			$logoimage->uploadFromFile("logoimageid");
			$logoimage->insertRecord();
	
			$faviconimage = new ImageClass();
			$faviconimage->setDescription("Fav Icon Image");
			$faviconimage->uploadFromFile("faviconimageid");
			$faviconimage->insertRecord();
				
			$siteconfig->setDomainurl($_POST['domainurl']) ;
			$siteconfig->setEmailfooter($_POST['emailfooter']);
			$siteconfig->setEmailheader($_POST['emailheader']);
			$siteconfig->setCompanydetails($_POST['companydetails']);
			$siteconfig->setAdminemail($_POST['adminemail']);
			$siteconfig->setTimezoneoffset($_POST['timezoneoffset']);
			$siteconfig->setLogoimageid($logoimage->getId());
			$siteconfig->setFaviconimageid($faviconimage->getId());
			$siteconfig->setSslayer($_POST['ssl']);
			$siteconfig->setCompanyname($_POST['companyname']);
			$siteconfig->setSmsapikey($_POST['smsapikey']);
			$siteconfig->setSmstestmode($_POST['smstestmode']);
			$siteconfig->setSmssendername($_POST['smssendername']);
			$siteconfig->setPhpdateformat($_POST['phpdateformat']);
			$siteconfig->setJsdateformat($_POST['jsdateformat']);
			$siteconfig->setCurrencycode($_POST['currencycode']);
			$siteconfig->setIsodialingcode($_POST['isodialingcode']);
			$siteconfig->setIsolanguage($_POST['isolanguage']);
			$siteconfig->setMobilepattern($_POST['mobilepattern']);
			$siteconfig->setAsciicurrency($_POST['asciicurrency']);
			$siteconfig->setTimezone($_POST['timezone']);
			$siteconfig->updateRecord();
				
			SessionControllerClass::getDB()->commit();
				
		} catch (Exception $e) {
			logError($e->getMessage(), false);
			SessionControllerClass::getDB()->rollBack();
		}
	}
	
?>
<form id="contentForm" enctype="multipart/form-data" name="contentForm" method="post" class="entryform">
	<h4><?php echo SessionControllerClass::getPage()->getLabel(); ?></h4>
	<label>Domain URL</label>
	<input required="true" type="url" class="textbox90" id="domainurl" name="domainurl" value="<?php echo $siteconfig->getDomainurl(); ?>" />

	<label>Admin Email</label>
	<input type="text" class="textbox90" id="adminemail" name="adminemail" value="<?php echo $siteconfig->getAdminemail(); ?>" />

	<label>E-mail Header</label>
	<textarea id="emailheader" name="emailheader" rows="15" cols="60" style="height:340px;width: 340px" class="tinyMCE"></textarea>

	<label>E-mail Footer</label>
	<textarea id="emailfooter" name="emailfooter" rows="15" cols="60" style="height:340px;width: 340px" class="tinyMCE"></textarea>

	<label>Timezone Offset</label>
	<input type="text" class="textbox20" id="timezoneoffset" name="timezoneoffset" value="<?php echo $siteconfig->getTimezoneoffset(); ?>" />

	<label>SSL</label>
	<SELECT id='ssl' name='ssl'>
		<OPTION value='N'>No</OPTION>
		<OPTION value='Y'>Yes</OPTION>
	</SELECT>

	<label>SMS API Key</label>
	<input type="text" class="textbox90" id="smsapikey" name="smsapikey" value="<?php echo $siteconfig->getSmsapikey(); ?>" />

	<label>SMS Sender Name</label>
	<input type="text" class="textbox90" id="smssendername" name="smssendername" value="<?php echo $siteconfig->getSmssendername(); ?>" />

	<label>SMS Test Mode</label>
	<SELECT id='smstestmode' name='smstestmode'>
		<OPTION value='N'>No</OPTION>
		<OPTION value='Y'>Yes</OPTION>
	</SELECT>
	
	<label>PHP Date Format</label>
	<input type="text" size=10 id="phpdateformat" name="phpdateformat" value="<?php echo $siteconfig->getPhpdateformat(); ?>" />
	
	<label>JavaScript Date Format</label>
	<input type="text" size=10 id="jsdateformat" name="jsdateformat" value="<?php echo $siteconfig->getJsdateformat(); ?>" />
	
	<label>Currency Code</label>
	<input type="text" size=5 id="currencycode" name="currencycode" value="<?php echo $siteconfig->getCurrencycode(); ?>" />
	
	<label>ISO Language</label>
	<input type="text" size=2 id="isolanguage" name="isolanguage" value="<?php echo $siteconfig->getIsolanguage(); ?>" />
	
	<label>ISO Dialing Code</label>
	<input type="text" size=2 id="isodialingcode" name="isodialingcode" value="<?php echo $siteconfig->getIsodialingcode(); ?>" />
	
	<label>Ascii Currency Number</label>
	<input type="text" size=3 id="asciicurrency" name="asciicurrency" value="<?php echo $siteconfig->getAsciicurrency(); ?>" />
	
	<label>Time Zone</label>
	<input type="text" size=30 id="timezone" name="timezone" value="<?php echo $siteconfig->getTimezone(); ?>" />
	
	<label>Mobile Pattern</label>
	<input type="text" size=10 id="mobilepattern" name="mobilepattern" value="<?php echo $siteconfig->getMobilepattern(); ?>" />

	<label>Company Name</label>
	<input type="text" class="textbox90" id="companyname" name="companyname" value="<?php echo $siteconfig->getCompanyname(); ?>" />

	<label>Company Details</label>
	<textarea id="companydetails" name="companydetails" rows="5" cols="60" style="height:200px;width: 740px"></textarea>

	<label>Company Logo</label>
	<input type="file" style="width:400px" id="logoimageid" name="logoimageid" value="" />
	<br>
<?php 
	if ($siteconfig->getLogoimageid() != null && $siteconfig->getLogoimageid() != 0) {
?>	
	<img src="system-imageviewer.php?id=<?php echo $siteconfig->getLogoimageid(); ?>" height=50 />
<?php 
	}
?>	

	<label>Fav Icon Image</label>
	<input type="file" style="width:400px" id="faviconimageid" name="faviconimageid" value="" />
	<br>
<?php 
	if ($siteconfig->getFaviconimageid() != null && $siteconfig->getFaviconimageid() != 0) {
?>	
	<img src="system-imageviewer.php?id=<?php echo $siteconfig->getFaviconimageid(); ?>" height=16 />
<?php 
	}
?>	
	<br>
	
	<span class="wrapper"><a href="javascript:if (verifyStandardForm('#contentForm')) $('#contentForm').submit();"><input class="commandButton" type="submit" value="Update" /></span>
	<br>
	<br>
	<br>
</form>
<script type="text/javascript">
	$(document).ready(function() {
			$("#companydetails").val("<?php echo escape_notes($siteconfig->getCompanydetails()); ?>");
			$("#emailfooter").val("<?php echo escape_notes($siteconfig->getEmailfooter()); ?>");
			$("#emailheader").val("<?php echo escape_notes($siteconfig->getEmailheader()); ?>");
			$("#ssl").val("<?php echo escape_notes($siteconfig->getSslayer()); ?>");
			$("#smstestmode").val("<?php echo escape_notes($siteconfig->getSmstestmode()); ?>");
		});
</script>
<!--  End of content -->

<?php include("system-footer.php"); ?>
