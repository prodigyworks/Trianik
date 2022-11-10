<?php
	require_once(__DIR__ . "/ui/ComboUIClass.php");
	require_once(__DIR__ . "/businessobjects/DocumentClass.php");
	
	if (! isStandalone())  {
		include("system-embeddedheader.php"); 
		
	} else {
		include("system-header.php"); 
	}
	
	require_once("confirmdialog.php");
	
	createConfirmDialog("confirmdialog", "Delete document ?", "deleteDocumentFromDialog");
?>
<style>
	#documentlist_div {
		border:1px solid grey;
	}
	#documentlist {
		table-layout: fixed;
	}
	#documentlist tr:nth-child(even) {
	  background: #D0E4F5;
	}
	#documentlist td {
	}
	#resultscontainer table {
	}
</style>
<div style='background-color: white'>
	<div id="documentDiv">
		<table cellspacing=10>
<?php
	if (isStandalone())  {
?>
			<tr>
				<td>
					<label>SEARCH</label>
				</td>
				<td>
					<input type="text" id="search" name="search" style="width:350px; " />
				</td>
				<td>
					<button id="searchbutton" style='display:inline; padding:6px' class='link2'>Search</button>
				</td>
			</tr>
<?php
	}
?>
			<tr>
				<td>
					<label>Title</label>
				</td>
				<td>
					<input type="text" id="title" name="title" style="width:450px" />
				</td>
				<td>
					<label>Expiry Date</label>
				</td>
				<td>
					<input type="text" autocomplete='off' class="datepicker" id="expirydate" name="expirydate"   />
				</td>
			</tr>
			<tr>
				<td>
					<label>Document</label>
				</td>
				<td>
					<input type="file" id="document" name="document" style="width:550px" />
				</td>
<?php 
	if (SessionControllerClass::getUser()->hasRole("MARTIN")) {
?>				
				<td>
					<label>Role</label>
				</td>
				<td>
<?php 
				ComboUIClass::getInstance()
					->setId("roleid")
					->setValue("roleid")
					->setName("roleid")
					->setTable("roles")
					->render();
?>
				</td>
<?php 
	} else {
?>
				<td colspan=2>
					<input type="hidden" id="roleid" value="" />
				</td>			
<?php		
	}
?>			
			</tr>
		</table>
		<input type="button" style="margin-left:0px; padding:6px" class="link2"  value="Add Document" id="btnHeanerNotes" />
		<br>
		<br>
		<br>
	</div>
</div>
<?php
	if (! isStandalone())  {
?>
<div style="position: absolute; top: 170px; background-color: white;width: 98%; height:335px; overflow-y: scroll" id="documentlist_div">
<?php
	} else {
?>
<div style="height:340px; overflow-y: scroll" id="documentlist_div">
<?php
	}
?>
	<div id="resultscontainer">
	</div>
</div>
<script>
	var selectedDocumentID;
	var base64File = null;
	var successfulLoad = function(data) {
		/* Refresh page. */
		$("#resultscontainer").html(data);
		
		$(".deletebutton").click(
			function() {
				deleteDocument($(this).attr("docid"));
			}
		);
	};

	function encodeImageFileAsURL(element) {
	  var file = element.files[0];
	  var reader = new FileReader();
		  
	  reader.onload = function() {
			$("#btnHeanerNotes").removeClass("disabledbutton");
			$("#btnHeanerNotes").attr("disabled", false);

			base64File = reader.result;
	  };
		  
	  reader.readAsDataURL(file);
	}
	
	function deleteDocumentFromDialog() {
		businessObjectToJSon({
			classname: "DocumentUIClass", 
			methodname: "remove", 
			args: {
				id: selectedDocumentID 
			},
			success: function() {
				toastr.success("Document removed", "<?php echo SessionControllerClass::getSiteConfig()->getCompanyname(); ?>");
				$("#confirmdialog").dialog("close");
				
				/* Refresh page. */
				loadRows();
			}
		});
	}
	
	function deleteDocument(id) {
		selectedDocumentID = id;
		$("#confirmdialog").dialog("open");
	}
	
	function validate() {
		if ($("#title").val() == "") {
			pwAlert("Please enter a title");
			$("#title").focus();
			return false;
		}
		
		if ($("#document").val() == "") {
			pwAlert("Please enter a file");
			$("#document").focus();
			return false;
		}
		
		return true;
	}

	function disableAdd() {
		$("#btnHeanerNotes").attr("disabled", true);
		$("#btnHeanerNotes").addClass("disabledbutton");
	}

	function search() {
		disableAdd();
		
		businessObjectToJSon({
			classname: "DocumentUIClass",
			methodname: "search",
			async: true,
			datatype: "html",
			args: {
				match: $("#search").val()
			},
			success: successfulLoad
		});
	}

	function loadRows() {
		disableAdd();
			
<?php 
		if (isset($_GET['id'])) {
?>			
			/* Documents associated with actual row. */
			businessObjectToJSon({
				classname: "DocumentUIClass", 
				methodname: "loadBySubtable", 
				async: true,
				datatype: "html",
				args: {
					table: "<?php echo $_GET['table']; ?>", 
					key: "<?php echo $_GET['key']; ?>", 
					id: "<?php echo $_GET['id']; ?>"
				},
				success: successfulLoad
			});
<?php 

		} elseif (isset($_GET['sessionid'])) {
?>
			/* Documents associated with potential row. */
			businessObjectToJSon({
				classname: "DocumentUIClass", 
				methodname: "loadBySession", 
				async: true,
				datatype: "html",
				args: {
					sessionid: "<?php echo $_GET['sessionid']; ?>"
				},
				success: successfulLoad
			});
		<?php 
		}
?>	
	}
		
	$(document).ready(
		function() {
			loadRows();

			$("#btnHeanerNotes").click(
					function() {
						if (! validate()) {
							return;
						}
						
						businessObjectToJSon({
							classname: "DocumentUIClass",
							methodname: "upload",
							async: true,
							args: {
								title: $("#title").val(),
								filename: $("#document").val().substring($("#document").val().lastIndexOf('/') + 1).substring($("#document").val().lastIndexOf('\\') + 1),
								expiry: $("#expirydate").val() == "" ? "" : dateToYMD($("#expirydate").val()),
								roleid: $("#roleid").val(),
<?php 
	if (isset($_GET['id'])) {
?>
								tablename: "<?php echo $_GET['table']; ?>",
								id: <?php echo $_GET['id']; ?>,
								primaryidname: "<?php echo $_GET['key']; ?>",
<?php 
	
	} elseif (isset($_GET['sessionid'])) {
?>
								sessionid: "<?php echo $_GET['sessionid']; ?>",
<?php
	}
?>
								image: base64File
							},
							success: function() {
								toastr.success("Document uploaded", "<?php echo SessionControllerClass::getSiteConfig()->getCompanyname(); ?>");
								
								$("#title").val("");
								$("#document").val("");

<?php 
								if (! isStandalone())  {
?>
									loadRows();
<?php 
								} else {
?>
									search();
<?php 
								}
?>
							}
						});
					}
				);

			$("#searchbutton").click(search);
			
			$("#document").change(
					function() {
						var val = $(this).val();

						if ($("#title").val() == "") {
							$("#title").val(val.substring(val.lastIndexOf('/') + 1).substring(val.lastIndexOf('\\') + 1));
						}

						encodeImageFileAsURL(this);
					}
				);
			
			$("#confirmdialog .confirmdialogbody").html("You are about to remove this document.<br>Are you sure ?");
		});
</script>
<?php
	if (! isStandalone())  {
		include("system-embeddedfooter.php"); 
		
	} else {
		include("system-footer.php"); 
	}
	
	function isStandalone() {
		return (! isset($_GET['id']) && ! isset($_GET['sessionid']));
	}
?>
