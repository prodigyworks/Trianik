<?php
	require_once(__DIR__ . "/ui/ComboUIClass.php");
	require_once(__DIR__ . "/businessobjects/DocumentCollectionClass.php");
	require_once(__DIR__ . "/businessobjects/ImageClass.php");
	require_once(__DIR__ . "/businessobjects/DocumentClass.php");
	require_once(__DIR__ . "/PHPSQLParser/autoload.php");
	
	use PHPSQLParser\PHPSQLParser;
	use PHPSQLParser\PHPSQLCreator;
	
	class Crud  {
		private $pkName = "id";
		private $pkViewName = "uniqueid";
		private $orderColumn = "";
		private $fromrow = 0;
		public $torow = 100;
		public $pagesize = 100;
		private $rowcount = 0;
		private $pages = 1;
		private $sortby = "";
		private $sortdirection = "ASC";
		private $geolocation = false;
	
		public $cascadeDelete = null;
		public $onDblClick = null;
		public $validateForm = null;
		public $onClickCallback = "";
		public $postDataRefreshEvent = null;
		public $preAddScriptEvent = null;
		public $preDeleteScriptEvent = null;
		public $postDeleteScriptEvent = null;
		public $autoPopulate = true;
		public $preEditScript = null;
		public $allowAdd = true;
		public $allowEdit = true;
		public $allowFilter = true;
		public $allowRemove = true;
		public $allowView = true;
		public $table = "";
		public $title = "";
		public $sql = "";
		public $autoWildCard = true;
		public $dialogwidth = 500;
		public $document = null;
		public $subapplications = array();
		public $applications = array();
		public $messages = array();
		public $checkconstraints = array();
		public $defaultappcolumn = array(
					'id'		  => '',
					'title'		  => '',
					'imageurl'	  => '',
					'application' => '',
					'script' 	  => '',
					'tooltip'	  => '',
					'action' 	  => '',
					'rule'		  => ''
				);
				
		public $defaultsubappcolumn = array(
					'id'		  => '',
					'title'		  => '',
					'imageurl'	  => '',
					'application' => '',
					'hide' 	  	  => false,
					'tooltip'	  => '',
					'script' 	  => '',
					'action' 	  => '',
					'rule'		  => ''
				);
				
		public $defaultcolumn = array(
					'name'       		=> 'id',
					'viewname'          => '',
					'type'       		=> 'TEXTBOX',
					'bind' 		 		=> true,
					'default' 	 		=> '',
					'editable' 	 		=> true,
					'validate' 			=> '',
					'length' 	 		=> 20,
					'height'			=> 6,
					'hidden'	 		=> false,
					'viewlength' 	 	=> 20,
					'sortable'	 		=> true,
					'alias' 	 		=> '',
					'align' 	 		=> 'left',
					'where'				=> " ",
					'filterprefix'		=> null,
					'locked'		    => false,
					'datatype'   		=> 'string',
					'filter'			=> true,
					'required'   		=> true,
					'role'				=> null,
					'pk'   		 		=> false,
					'parentid'	 		=> false,
					'sortby'	 		=> false,
					'unique'   	 		=> false,
					'associated'		=> false,
					'onchange'			=> null,
					'sortcolumn'		=> null,
					'filtercolumn'		=> null,
					'formatter'			=> '',
					'associatedcolumns' => array(
						array()
					),
					'options' 	 		=> array(
						array()
					),
					'showInView' 		=> true,
					'readonly'   		=> false,
					'label' 	 		=> 'ID',
					'suffix' 	 		=> ''
			);
		public $columns = array();
		private $errorDescriptions = array();
		
		function __construct() {
			require_once(__DIR__ . "/pgcore-db.php");
			
			if (isset($_GET['from'])) {
				$this->fromrow = $_GET['from'];
			}
			
			if (isset($_GET['to'])) {
				$this->torow = $_GET['to'];
			}
			
			if (isset($_GET['direction'])) {
				$this->sortdirection = $_GET['direction'];
			}
			
			if (isset($_GET['sort'])) {
				$this->sortby = $_GET['sort'];
			}
			
			$this->pagesize = ($this->torow - $this->fromrow);
		}
		
		public function setSQL($str) {
			$this->sql = $str;
		}
		
		public function preScriptEvent() {
			
		}
		
		public function postEditScriptEvent() {
			/* Event for override. */
		}
		
		public function postViewScriptEvent() {
			/* Event for override. */
		}
		
		public function postAddScriptEvent() {
			/* Event for override. */
		}
		
		public function preViewScriptEvent() {
		}
		
		public function preFilterScriptEvent() {
		}
		
		public function preCommandEvent() {
			/* Event for pre-command. */
		}
		
		public function postLoadScriptEvent() {
			
		}
		
		public function postScriptEvent() {
			/* Event for override. */
		}
		
		public function preEditScreenMarkup() {
			
		}
	
		public function preUpdateScriptEvent() {
		
		}
	
		public function postUpdateScriptEvent() {
		
		}
		
		public function afterInsertRow() {
		}
		
		public function postDeleteEvent($id) {
			
		}
		
		private function populateFields() {
			foreach ($this->columns as $col) {
				if ($col['editable']) {
					if ($col['type'] == "TEXTBOX") {
						if ($col['datatype'] == "datetime" || $col['datatype'] == "timestamp") {
							echo "$('#editpanel #" . $col['name'] . "').val(node." . $col['name'] . ".substring(0, 10));\n";
							echo "$('#editpanel #" . $col['name'] . "_time').val(node." . $col['name'] . ".substring(11, 16));\n";
							
						} else {
							echo "$('#editpanel #" . $col['name'] . "').val(node." . $col['name'] . ");\n";
						}
						
					} else if ($col['type'] == "GEOLOCATION") {
						echo "$('#editpanel #" . $col['name'] . "').val(node." . $col['name'] . ");\n";
	
					} else if ($col['type'] == "CHECKBOX") {
						echo "$('#" . $col['name'] . "').attr('checked', node." . $col['name'] . " == 1 ? true : false);\n";
						echo "$('#" . $col['name'] . "').trigger('change');\n";
	
					} else if ($col['type'] == "DERIVED") {
						echo "$('#" . $col['name'] . "').val(" . $col['function'] . "(node));\n";
						
					} else if ($col['type'] == "BASICTEXTAREA") {
						echo "$('#editpanel #" . $col['name'] . "').val(node." . $col['name'] . ");\n";
						
					} else if ($col['type'] == "TEXTAREA") {
	?>
						if (node.<?php echo $col['name']; ?> != null) {
							tinyMCE.get('<?php echo $col['name']; ?>').setContent(node.<?php echo $col['name']; ?>);
	
						} else {
							tinyMCE.get('<?php echo $col['name']; ?>').setContent("");
						}
	<?php
						
					} else if ($col['type'] == "FILE") {
	?>
						if (node.<?php echo $col['name']; ?> == 0 || node.<?php  echo $col['name']; ?> == null) {
							$('#<?php echo $col['name']; ?>_link').text('No link specified');
							$('#<?php echo $col['name']; ?>_link').attr('disabled', true);
							
						} else {
							$('#<?php echo $col['name']; ?>_link').attr('disabled', false);
							$('#<?php echo $col['name']; ?>_link').text('Click to preview');
							$('#<?php echo $col['name']; ?>_link').attr('href', 'viewdocuments.php?id=' + node.<?php  echo $col['name']; ?>);
						}
	
	<?php																
											
					} else if ($col['type'] == "PASSWORD") {
						echo "$('#" . $col['name'] . "').val('');\n";
		
					} else if ($col['type'] == "IMAGE") {
						echo "if (node." . $col['name'] . " == 0 || node." . $col['name'] . " == null)  {\n";
						echo "$('#" . $col['name'] . "_img').attr('src', 'images/no-image.gif');\n";
						echo "} else {\n";
						echo "$('#" . $col['name'] . "_img').attr('src', 'system-imageviewer.php?id=' + node." . $col['name'] . ");\n";
						echo "}\n";
						echo "$('#" . $col['name'] . "').val('');\n";
						
					} else if ($col['type'] == "COMBO") {
						echo "$('#" . $col['name'] . "').val(node." . $col['name'] . ");\n";
						
					} else if ($col['type'] == "DATACOMBO" || 
							   $col['type'] == "MULTIDATACOMBO" || 
							   $col['type'] == "LAZYDATACOMBO") {
						echo "$('#" . $col['name'] . "').val(node." . $col['name'] . ");\n";
						echo "$('#" . $col['name'] . "_lazy').val(node." . $col['alias'] . ");\n";
						
						if (isset($_GET['callee']) && isset($_GET['id'])) {
							if ($col['pk']) {
								echo "$('#" . $col['name'] . "').attr('disabled', 'true');\n";
							}
						}
					}
				}
			}
		}

		private function createDocumentLink() {
	?>
			<div class='modal documentmodal' id='documentDialog'>
			<iframe width=100% height=100% src='' id='documentiframe' frameborder='0' scrolling='no' src='' ></iframe>
			</div>
			<script>
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

				function viewDocument(headerid, callback, id, table, key) {
					var parameters = "";
					
					try {resetRefresh(); } catch(e) {}
					
					if (callback) {
						parameters = "&documentcallback=" + callback;
					}
					
					if (id) {
						parameters += "&identifier=" + id ;
						
					} else {
						parameters += "&identifier=";
					}
					
					parameters += "&table=" + table + "&key=" + key;
					
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
			</script>
	<?php
			}
			
		public function documentSetup() {
			if ($this->document != null) {
				$this->createDocumentLink();
			}
	?>		
				<div id="myModal" class="imagemodal">
				
				  <!-- The Close Button -->
				  <span class="close">&times;</span>
				
				  <!-- Modal Content (The Image) -->
				  <img class="modal-content" id="img01">
				
				  <!-- Modal Caption (Image Text) -->
				  <div id="caption"></div>
				</div>
				<div id="documentPreviewModal" class="imagemodal">
				
				  <!-- The Close Button -->
				  <span class="close">&times;</span>
				
				  <!-- Modal Content (The Image) -->
				  <iframe class="modal-content" id="iframe01"></iframe>
				
				  <!-- Modal Caption (Image Text) -->
				  <div id="documentcaption"></div>
				</div>
	<?php
		}
		
		public function postHeaderEvent() {
			/* Event for header. */
		}
		
		public function postToolbarEvent() {
			/* Event. */
		}
	
		public function postUpdateEvent($id) {
			/* Event. */
		}
	
		public function preUpdateEvent($id) {
			/* Event. */
		}
		
		public function postInsertEvent($id) {
			/* Event. */
		}

		public function triggerRefresh() {
			if (count($this->errorDescriptions) > 0) {
?>
				<html>
					<body>
						<script>
							window.parent.showError("<?php echo escape_notes($this->errorDescriptions[0]); ?>");
						</script>
					</body>
				</html>
<?php		
			} else {
?>
				<html>
					<body>
						<script>
							window.parent.refreshData();
						</script>
					</body>
				</html>
<?php
			}
		}
		
		private function getColumnWidths() {
			$pageid = SessionControllerClass::getPage()->getId();
			$memberid = SessionControllerClass::getUser()->getMemberid();
			$widthArray = array();

			$stmt = SessionControllerClass::getDB()->prepare(
					"SELECT B.columnindex, B.width, B.hidecolumn, B.label 
					 FROM {$_SESSION['DB_PREFIX']}applicationtables A 
					 INNER JOIN {$_SESSION['DB_PREFIX']}applicationtablecolumns B 
					 ON A.id = B.headerid 
					 WHERE A.pageid = ?
					 AND A.memberid = ?
					 ORDER BY B.columnindex"
				);
			$stmt->execute(array($pageid, $memberid));
				
			while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
				$widthArray[$row['columnindex']] = array(
						"width" => $row['width'],
						"label" => $row['label'],
						"hidden" => ($row['hidecolumn'] == 1)
					);
			}
			
			return $widthArray;
		}
		
		public function run() {
			for ($i = 0; $i < count($this->subapplications); $i++) {
				$this->subapplications[$i] = array_merge( $this->defaultsubappcolumn, $this->subapplications[$i]);
			}
			
			for ($i = 0; $i < count($this->applications); $i++) {
				$this->applications[$i] = array_merge( $this->defaultappcolumn, $this->applications[$i]);
			}
	
			if ($this->document != null) {
				$colarray = array();
				$colarray[] = array(
						'name'       => 'd',
						'datatype'	 => 'integer',
						'length' 	 => 4,
						'formatter'	 => 'documentFormatter',
						'showInView' => true,
						'required'   => false,
						'editable'   => false,
						'filter'   	 => false,
						'bind'   	 => false,
						'label' 	 => " "
					);
					
				for ($i = 0; $i < count($this->columns); $i++) {
					$colarray[] = $this->columns[$i];
				}
				
				$this->columns = $colarray;
			}
			
			for ($i = 0; $i < count($this->columns); $i++) {
				$this->columns[$i] = array_merge( $this->defaultcolumn, $this->columns[$i]);
				
				if ($this->columns[$i]['type'] == "GEOLOCATION") {
					$this->geolocation = true;
				}
				
				if ($this->columns[$i]['viewname'] == "") {
					$this->columns[$i]['viewname'] = $this->columns[$i]['name'];
				}
			
				if ($this->columns[$i]['viewname'] == "id") {
					$this->columns[$i]['viewname'] = "uniqueid";
				}
				
				if ($this->columns[$i]['pk'] == true) {
					$this->pkName = $this->columns[$i]['name'];
					$this->pkViewName = $this->columns[$i]['viewname'];
				}
				
				if ($this->columns[$i]['sortby'] == true) {
					$this->orderColumn = $this->columns[$i]['name'];
				}
				
				if ($this->columns[$i]['role'] != null) {
					$allowed = false;
	
					foreach ($this->columns[$i]['role'] as $roleid) {
						if (SessionControllerClass::getUser()->hasRole($roleid)) {
							$allowed = true;
							break;
						}
					}
					
					if (! $allowed) {
						$this->columns[$i]['showInView'] = false;
						$this->columns[$i]['editable'] = false;
						$this->columns[$i]['bind'] = false;
						$this->columns[$i]['filter'] = false;
					}
				}
			}
			
			if ($this->geolocation) {
				foreach ($this->columns as $col) {
					if ($col['type'] == 'GEOLOCATION') {
						$this->columns[count($this->columns)] = array_merge( 
								$this->defaultcolumn,
								array(
									'name'       => $col['name'] . '_lat',
									'datatype'	 => 'float',
									'length' 	 => 10,
									'required'   => false,
									'showInView' => false,
									'hidden'	 => true,
									'label' 	 => 'Latitude'
								)
							);
							
						$this->columns[count($this->columns)] = array_merge( 
								$this->defaultcolumn,
								array(
									'name'       => $col['name'] . '_lng',
									'datatype'	 => 'float',
									'length' 	 => 10,
									'showInView' => false,
									'required'   => false,
									'hidden'	 => true,
									'label' 	 => 'Longtitude'
								)
							);
					}
				}
			}	
			
			for ($i = 0; $i < count($this->columns); $i++) {
				foreach ($this->columns[$i]['associatedcolumns'] as $associated) {
					for ($j = 0; $j < count($this->columns); $j++) {
						if ($associated == $this->columns[$j]['name']) {
							$this->columns[$j]['associated'] = true;
						}
					}
				}
			}
			
			if ($this->orderColumn == "") {
				$this->orderColumn = $this->columns[0]['name'];
			}
				
			$this->preCommandEvent();
			
			if (isset($_POST['crudcmd'])) {
				if ($_POST['crudcmd'] == "update") {
					$this->update($_POST['crudid']);
					$this->triggerRefresh();
					
				} else if ($_POST['crudcmd'] == "insert") {
					$this->insert();
					$this->triggerRefresh();
					
				} else if ($_POST['crudcmd'] == "filtersave") {
					try {
						$this->filterSave();
						$this->view();
						
					} catch (Exception $e) {
						$this->view();
						echo "<script>pwAlert('" . $e->getMessage() . "');</script>\n";
					}
					
				} else if ($_POST['crudcmd'] == "filter") {
					$this->fromrow = 0;
					$this->torow = $this->pagesize;
					$this->autoPopulate = true;
					$this->view();
					
				} else {
					$_POST['crudcmd']($this);
					
					if ($_POST['triggerrefresh'] != "") {
						$this->triggerRefresh();
					}
				}
					
			} else {
				$this->view();
			}
		}
		
		public function view() {
			$this->filter();
			
			require_once(__DIR__ . "/system-header.php");
			require_once(__DIR__ . "/confirmdialog.php");
			require_once(__DIR__ . "/tinymce.php");
			
			?>
			<script src="js/i18n/grid.locale-en.js" type="text/javascript"></script>
			<script src="js/jquery.jqGrid.min.js" type="text/javascript"></script>
			<script src='js/jquery.ui.timepicker.js'></script>
			<script src="js/jquery.multiselect.filter.min.js" type="text/javascript"></script>
			<script src="js/jquery.multiselect.min.js" type="text/javascript"></script>
			<script src="js/imageviewer-03092016.js" type="text/javascript"></script>
			<link rel="stylesheet" type="text/css" href="css/jquery.multiselect.css" />
			<link rel="stylesheet" type="text/css" href="css/jquery.multiselect.filter.css" />
			<link rel="stylesheet" type="text/css" href="css/imageviewer-03092016.css" />
			<style>
				.toast-bottom-center {
					bottom: 80px ! important;
				}
			</style>
			
			<?php
			if ($this->geolocation) {
				?>
				<script src="https://maps.googleapis.com/maps/api/js?sensor=false&libraries=places&region=EU&key=AIzaSyB1DBBtL19Tc4sz0Nl_tmGa014MeHtqjLI" type="text/javascript"></script>
				<script type="text/javascript">
					var directionsService = null;
	
					if (typeof(google) != "undefined") {
						directionsService = new google.maps.DirectionsService();
					}
					
					function getLatLng(name, address)  {
					    var geocoder = new google.maps.Geocoder();
	
					    geocoder.geocode(
					    		{ 
					    			address: address,
					    			componentRestrictions: {
					    				country: 'uk'
						    		}
					    		}, 
					    		function( results, status ) {
					        		if (status == google.maps.DirectionsStatus.NOT_FOUND) {
					        			pwAlert("Location not found, please provide more detail, e.g. Post code");
					        			
					        		} else if (status == google.maps.DirectionsStatus.OK) {
								        $("#" + name + "_lat").val(results[0].geometry.location.lat());
										$("#" + name + "_lng").val(results[0].geometry.location.lng());
										
							        } else {
	//						            pwAlert( "Geocode was not successful for the following reason: " + status );
							        }
							    }
							);            
					}
					
					$(document).ready(function() {
						    var pacContainerInitialized = false; 
						<?php
							foreach ($this->columns as $col) {
								if ($col['type'] == "GEOLOCATION") {
						?>
	                        $('#<?php echo $col['name']; ?>').keypress(function() { 
	                                if (!pacContainerInitialized) { 
	                                        $('.pac-container').css('z-index', '9999'); 
	                                        pacContainerInitialized = true; 
	                                } 
	                        }); 
	
						
							$("#<?php echo $col['name']; ?>").change(function() {
									setTimeout(
											function() { 
												getLatLng("<?php echo $col['name']; ?>", $("#<?php echo $col['name']; ?>").val());
											},
											500
										);
											
									
								});
						<?php
									
								}
							}
						?>
						});
					
					function initialize() {
				        var options = {
				        		region: "uk",
				        		componentRestrictions: {country: ["uk"]}       
				        	};
				
						<?php
							foreach ($this->columns as $col) {
								if ($col['type'] == "GEOLOCATION") {
						?>
							    new google.maps.places.Autocomplete(
							    		document.getElementById('<?php echo $col['name']; ?>'), 
							    		{
							        		region: "uk",
							        		componentRestrictions: {country: ["uk"]}       
							        	}
							        );
						<?php
								}
							}
						?>
					}
					
	/*				function search() {
						setTimeout( 
								function() { 
									$('#jobform').submit(); 
								}, 
								500
							);
					}
						*/
	
					if (typeof(google) != "undefined") {
						google.maps.event.addDomListener(window, 'load', initialize);
					}
				</script>
				<?php
			}
			
?>
	<link href="css/ui.jqgrid.css" rel="stylesheet" type="text/css" />
<?php
			createConfirmDialog("confirmdialog", "Remove item ?", "crudDelete");
			createConfirmDialog("confirmfilterdialog", "Remove item ?", "crudFilterDelete");
			
			/* Event post header. */
			$this->crud_cache_function("documentSetup", array("pageid" => SessionControllerClass::getPage()->getId()));
			$this->crud_cache_function("postHeaderEvent", array("pageid" => SessionControllerClass::getPage()->getId()));
			$this->crud_cache_function("createFilterScreen", array("pageid" => SessionControllerClass::getPage()->getId()));
			$this->crud_cache_function("createEditScreen", array("pageid" => SessionControllerClass::getPage()->getId()));
			$this->createView();
		}
		
		public function createEditScreen() {
			$this->preEditScreenMarkup ();
	?>
	<div class="modal" id="editdialog">
		<div id="editpanel" class="crudentryform">
			<form id="editform" method="POST" enctype="multipart/form-data">
				<input type="hidden" id="crudid" name="crudid" value="" /> <input
					type="hidden" id="triggerrefresh" name="triggerrefresh" value="" />
				<input type="hidden" id="crudcmd" name="crudcmd" value="" /> <input
					type="hidden" id="fromrow" name="fromrow" value="" />
	<?php
			foreach ( $this->messages as $message ) {
				if (! isset ( $message ['array'] )) {
					echo "<input type=\"hidden\" id=\"" . $message ['id'] . "\" name=\"" . $message ['id'] . "\" value=\"\" />\n";
				}
			}
	?>
			<div>
	
	<?php		
			$this->editScreenSetup ();
	?>
			</div>
			</form>
		</div>
	</div>
	<?php
		}
		
		public function editScreenSetup() {
	?>
	<table width='100%' cellpadding=0 cellspacing=4 class="entryformclass">
	<?php
			foreach ( $this->columns as $col ) {
				if ($col ['editable'] && $col ['associated'] == false) {
					if ($col ['hidden']) {
						echo "<tr valign=center style='display:none'>\n";
		
					} else {
						echo "<tr valign=center>\n";
					}
					
					echo "<td valign=center nowrap>" . $col ['label'] . "</td>\n";
					echo "<td align='left' nowrap>";
					
					$this->showEditBox ( $col );
					
					foreach ( $col ['associatedcolumns'] as $associated ) {
						foreach ( $this->columns as $subcol ) {
							if ($associated == $subcol ['name']) {
								$this->showEditBox ( $subcol );
								
								echo $subcol ['label'];
							}
						}
					}
					
					echo "</td>";
					echo "</tr>\n";
				}
			}
	?>
	</table>
	<?php
		}
			
		private function showEditBox($col) {
			if ($col['type'] == "TEXTBOX") {
				if ($col['datatype'] == "timestamp" || $col['datatype'] == "datetime") {
					echo "<input autocomplete='off' class='" .($col['readonly'] != true ? "datepicker" : "") . "' " . ($col['required'] == true ? "required='true' " : "") . " " . ($col['readonly'] == true ? "readonly " : "") . " type='text' id='" . $col['name'] . "' name='" . $col['name'] . "' />\n";
					echo "<input autocomplete='off' class='" .($col['readonly'] != true ? "timepicker" : "") . "' " . ($col['required'] == true ? "required='true' " : "") . " " . ($col['readonly'] == true ? "readonly " : "") . " type='text' id='" . $col['name'] . "_time' name='" . $col['name'] . "_time' />\n";
					
				} else if ($col['datatype'] == "date") {
					echo "<input autocomplete='off' class='" .($col['readonly'] != true ? "datepicker" : "") . "' " . ($col['required'] == true ? "required='true' " : "") . " " . ($col['readonly'] == true ? "readonly " : "") . " type='text' id='" . $col['name'] . "' name='" . $col['name'] . "' />\n";
									
				} else if ($col['datatype'] == "time") {
					echo "<input autocomplete='off' class='" .($col['readonly'] != true ? "timepicker" : "") . "' " . ($col['required'] == true ? "required='true' " : "") . " " . ($col['readonly'] == true ? "readonly " : "") . " type='text' id='" . $col['name'] . "' name='" . $col['name'] . "' />\n";
					
				} else if ($col['datatype'] == "integer") {
					echo "<input " . ($col['required'] == true ? "required='true' " : "") . " " . ($col['readonly'] == true ? "readonly " : "") . " type='number' pattern='\d*' style='width:" . ($col['length'] * 6) . "px' id='" . $col['name'] . "' name='" . $col['name'] . "' />\n";
					
				} else if ($col['datatype'] == "float" || $col['datatype'] == "double") {
					echo "<input " . ($col['required'] == true ? "required='true' " : "") . " " . ($col['readonly'] == true ? "readonly " : "") . " type='number' pattern='[0-9]+([,\.][0-9]+)?' title='The number input must start with a number and use either comma or a dot as a decimal character.' style='width:" . ($col['length'] * 6) . "px' id='" . $col['name'] . "' name='" . $col['name'] . "' />\n";
					
				} else if ($col['datatype'] == "url") {
					echo "<input " . ($col['required'] == true ? "required='true' " : "") . " " . ($col['readonly'] == true ? "readonly " : "") . " type='url' style='width:" . ($col['length'] * 6) . "px' id='" . $col['name'] . "' name='" . $col['name'] . "' />\n";
					
				} else if ($col['datatype'] == "color") {
					echo "<input " . ($col['required'] == true ? "required='true' " : "") . " " . ($col['readonly'] == true ? "readonly " : "") . " type='color' style='width:" . ($col['length'] * 6) . "px' id='" . $col['name'] . "' name='" . $col['name'] . "' />\n";
					
				} else if ($col['datatype'] == "tel") {
					echo "<input " . ($col['required'] == true ? "required='true' " : "") . " " . ($col['readonly'] == true ? "readonly " : "") . " type='tel' style='width:" . ($col['length'] * 6) . "px' id='" . $col['name'] . "' name='" . $col['name'] . "' />\n";
					
				} else if ($col['datatype'] == "email") {
					echo "<input " . ($col['required'] == true ? "required='true' " : "") . " " . ($col['readonly'] == true ? "readonly " : "") . " type='email' style='width:" . ($col['length'] * 6) . "px' id='" . $col['name'] . "' name='" . $col['name'] . "' />\n";
					
				} else {
					echo "<input " . ($col['required'] == true ? "required='true' " : "") . " " . ($col['readonly'] == true ? "readonly " : "") . " type='text' style='width:" . ($col['length'] * 6) . "px' id='" . $col['name'] . "' name='" . $col['name'] . "' />\n";
				}
				
			} else if ($col['type'] == "GEOLOCATION") {
				echo "<input " . ($col['required'] == true ? "required='true' " : "") . " " . ($col['readonly'] == true ? "readonly " : "") . " type='text' style='width:" . ($col['length'] * 6) . "px' id='" . $col['name'] . "' name='" . $col['name'] . "' />\n";
				
			} else if ($col['type'] == "CHECKBOX") {
				echo "<input " . ($col['required'] == true ? "required='true' " : "") . " " . ($col['readonly'] == true ? "readonly " : "") . " type='checkbox' id='" . $col['name'] . "' name='" . $col['name'] . "' />\n";
				
			} else if ($col['type'] == "DERIVED") {
				echo "<input readonly type='text' style='width:" . ($col['length'] * 6) . "px' id='" . $col['name'] . "' name='" . $col['name'] . "' />\n";
				
			} else if ($col['type'] == "PASSWORD") {
				echo "<input " . ($col['required'] == true ? "required='true' " : "") . " " . ($col['readonly'] == true ? "readonly " : "") . " type='password' style='width:" . ($col['length'] * 6) . "px' id='" . $col['name'] . "' name='" . $col['name'] . "' />\n";
				
			} else if ($col['type'] == "FILE") {
				echo "<a id='" . $col['name'] . "_link'></a>\n<br>";
				echo "<input " . ($col['required'] == true ? "required='true' " : "") . " " . ($col['readonly'] == true ? "readonly " : "") . " type='file' style='width:400px' id='" . $col['name'] . "' name='" . $col['name'] . "' />\n";
				
			} else if ($col['type'] == "IMAGE") {
				echo "<img class='imageviewer' style='height:" . ($col['length']) . "px' id='" . $col['name'] . "_img' />\n<br>";
				echo "<input " . ($col['required'] == true ? "required='true' " : "") . " " . ($col['readonly'] == true ? "readonly " : "") . " type='file' style='width:400px' id='" . $col['name'] . "' name='" . $col['name'] . "' />\n";
				echo "<script>\n";
				echo "attachImageView('" . $col['name'] . "_img');\n";
				echo "</script>\n";
				
			} else if ($col['type'] == "BASICTEXTAREA") {
				echo "<textarea style='width:600px' rows={$col['height']} cols=80 " .($col['readonly'] == true ? "readonly " : "") . " id='" . $col['name'] . "' name='" . $col['name'] . "'></textarea>\n";
	
			} else if ($col['type'] == "TEXTAREA") {
				echo "<textarea class='tinyMCE' id='" . $col['name'] . "' name='" . $col['name'] . "'></textarea>\n";
				
			} else if ($col['type'] == "DATACOMBO") {
				ComboUIClass::getInstance()
					->setId($col['name'])
					->setValue($col['table_id'])
					->setName($col['table_name'])
					->setTable($col['table'])
					->setWhere($col['where'])
					->setRequired($col['required'])
					->render();
				
			} else if ($col['type'] == "LAZYDATACOMBO") {
				createLazyCombo($col['name'], $col['table_id'], $col['table_name'], $_SESSION['DB_PREFIX'] . $col['table'], $col['where'], ($col['required'] == true ? true : false), $col['length']);
				
			} else if ($col['type'] == "MULTIDATACOMBO") {
				ComboUIClass::getInstance()
					->setId($col['name'])
					->setValue($col['table_id'])
					->setName($col['table_name'])
					->setTable($col['table'])
					->setWhere($col['where'])
					->setRequired($col['required'])
					->setIsArray(true)
					->setAttributeArray(array("class" => "multiselect", "size" => "1", "multiple" => "true"))
					->setBlank(false)
					->render();
				
			} else if ($col['type'] == "COMBO") {
				echo "<SELECT id='" . $col['name'] . "' name='" . $col['name'] . "'>\n";
				echo "<OPTION value=''></OPTION>\n";
				
				foreach ($col['options'] as $opt) {
					echo "<OPTION value='" . $opt['value'] . "'>" . $opt['text'] . "</OPTION>\n";
				}
				
				echo "</SELECT>";
			}
			
			if ($col['onchange'] != null) {
			?>
				<SCRIPT>
					$(document).ready(
							function() {
								$("#<?php echo $col['name']; ?>").change(<?php echo $col['onchange']; ?>);
							}
						);
				</SCRIPT>
			
			<?php
			}
			
			echo "&nbsp;" . $col['suffix'];
		}
		
		public function filterScreenSetup() {
	?>
			<table width='100%' cellpadding=0 cellspacing=4>
	<?php
			foreach ($this->columns as $col) {
				if ($col['filter']) {
					if ($col['type'] == "DERIVED" ||
						$col['type'] == "PASSWORD" ||
						$col['type'] == "IMAGE" ||
						$col['type'] == "BASICTEXTAREA" ||
						$col['type'] == "TEXTAREA" ||
						$col['hidden'] == true) {
						continue;
					}
					
					echo "<tr valign=center>\n";
					echo "<td valign=center nowrap>" . $col['label'] . "</td>\n";
					echo "<td nowrap>";
				
					if ($col['type'] == "TEXTBOX") {
						if ($col['datatype'] == "timestamp" || $col['datatype'] == "datetime") {
							echo "<input autocomplete='off' class='datepicker' type='text' id='filter_" . $col['name'] . "' name='filter_" . $col['name'] . "'  />\n";
							
						} else if ($col['datatype'] == "date") {
							echo "<input autocomplete='off' class='datepicker' type='text' id='filter_" . $col['name'] . "' name='filter_" . $col['name'] . "' />\n";
							
						} else if ($col['datatype'] == "time") {
							echo "<input autocomplete='off' class='timepicker' type='text' id='filter_" . $col['name'] . "' name='filter_" . $col['name'] . "' />\n";
													
						} else {
							echo "<input  type='text' style='width:" . ($col['length'] * 6) . "px' id='filter_" . $col['name'] . "' name='filter_" . $col['name'] . "'  />\n";
						}
						
					} else if ($col['type'] == "GEOLOCATION") {
						echo "<input  type='text' style='width:" . ($col['length'] * 6) . "px' id='filter_" . $col['name'] . "' name='filter_" . $col['name'] . "'  />\n";
						
					} else if ($col['type'] == "CHECKBOX") {
						echo "<input  type='checkbox' id='filter_" . $col['name'] . "' name='filter_" . $col['name'] . "'  />\n";
						
					} else if ($col['type'] == "BASICTEXTAREA") {
						echo "<div  style='width:600px; height: " . ($col['height'] * 12) . "px; overflow:auto' id='filter_" . $col['name'] . "' name='filter_" . $col['name'] . "'></div>\n";
						
					} else if ($col['type'] == "TEXTAREA") {
						echo "<div  style='width:400px; height: 150px; overflow:auto' id='filter_" . $col['name'] . "' name='filter_" . $col['name'] . "'</div>\n";
						
					} else if ($col['type'] == "DATACOMBO") {
						ComboUIClass::getInstance()
							->setId("filter_{$col['name']}")
							->setValue($col['table_id'])
							->setName($col['table_name'])
							->setTable($col['table'])
							->setWhere($col['where'])
							->setRequired($col['required'])
							->render();
						
					} else if ($col['type'] == "LAZYDATACOMBO") {
						createLazyCombo("filter_" . $col['name'], $col['table_id'], $col['table_name'], $_SESSION['DB_PREFIX'] . $col['table'], $col['where'], false, $col['length']);
						
					} else if ($col['type'] == "MULTIDATACOMBO") {
						ComboUIClass::getInstance()
							->setId("filter_{$col['name']}")
							->setValue($col['table_id'])
							->setName($col['table_name'])
							->setTable($col['table'])
							->render();
						
					} else if ($col['type'] == "COMBO") {
						echo "<SELECT id='filter_" . $col['name'] . "' name='filter_" . $col['name'] . "'>\n";
						echo "<OPTION value=''></OPTION>\n";
						
						foreach ($col['options'] as $opt) {
							echo "<OPTION value='" . $opt['value'] . "'>" . $opt['text'] . "</OPTION>\n";
						}
						
						echo "</SELECT>";
					}
				
					echo "&nbsp;" . $col['suffix'];
					
					echo "</td>";
					echo "</tr>\n";
				}
			}
	?>
		</table>	
	<?php
		}
		
		public function createFilterScreen() {
		?>
		<iframe style="display:none" id="submitframe" name="submitframe">
		</iframe>
		<div class="modal" id="filtersavedialog">
			<label>Filter name</label>
			<input type="text" id="filtername" name="filtername" size=60 />
		</div>
		
		<div class="modal" id="filterdialog">
			<div id="filterpanel">
			  <?php
			  	$filterformaction = $_SERVER['PHP_SELF'] . "?filtering=true";
			  	
			  	foreach ( $_GET as $key => $value ) {
	//		  		if (strpos($key, "filtering") != 0 && strpos($key, "filter_") != 0	) {
				  		$filterformaction .= "&" . $key . "=" . $value;
	//		  		}
				}
			  ?>
			  <form id="filterform" method="POST" enctype="multipart/form-data" action="<?php echo $filterformaction; ?>" >
				<input type="hidden" id="triggerrefresh" name="triggerrefresh" value="" />
				<input type="hidden" id="crudcmd" name="crudcmd" value="" />
				<input type="hidden" id="savefiltername" name="savefiltername" value="" />
				<input type="hidden" id="currentfiltername" name="currentfiltername" value="" />
			  <?php 
				$this->filterScreenSetup();
	?>
			  </form>
			</div>
		</div>
	<SCRIPT>
	<?php			
				foreach ($this->columns as $col) {
					if ($col['filter']) {
						if ($col['type'] == "DERIVED" ||
							$col['type'] == "PASSWORD" ||
							$col['type'] == "IMAGE" ||
							$col['type'] == "BASICTEXTAREA" ||
							$col['type'] == "TEXTAREA" ||
							$col['hidden'] == true) {
							continue;
						}
						
						$filterValue = "";
						
						if (isset($_GET['filter_' . $col['name']])) {
							$filterValue = base64_decode($_GET['filter_' . $col['name']]);
						}
						
						if (isset($_POST['filter_' . $col['name']])) {
							$filterValue = $_POST['filter_' . $col['name']];
						}
	?>
						$("#filter_<?php echo $col['name']; ?>").val("<?php echo $filterValue; ?>");
	<?php 					
					}
				}
				?>
	</SCRIPT>
	<?php
		}
		
		public function filterSave() {
			$id = 0;
			$memberid = SessionControllerClass::getUser()->getMemberid();
			$pageid = SessionControllerClass::getPage()->getId();
			$description = $_POST['savefiltername'];
			
			/* Start transaction. */
			SessionControllerClass::getDB()->beginTransaction();
				
			try {
				$stmt = SessionControllerClass::getDB()->prepare(
						"INSERT INTO {$_SESSION['DB_PREFIX']}filter 
						 (
						 	memberid, pageid, description, 
						 	metacreateddate, metacreateduserid, 
						 	metamodifieddate, metamodifieduserid
						 ) 
						 VALUES 
						 (
						 	?, ?, ?, 
						 	NOW(), ?, 
						 	NOW(), ?
						 )"
					);
				
				$stmt->execute(array($memberid, $pageid, $description, $memberid, $memberid));
				$id = SessionControllerClass::getDB()->lastInsertId();
				
				foreach ($this->columns as $col) {
					if ($col['filter'] && isset($_POST['filter_' . $col['name']]) && $_POST['filter_' . $col['name']] != "") {
						
						$stmt = SessionControllerClass::getDB()->prepare(
								"INSERT INTO {$_SESSION['DB_PREFIX']}filterdata
								(
									filterid, columnname, value, 
									metacreateddate, metacreateduserid, 
									metamodifieddate, metamodifieduserid
								)
								VALUES
								(
									?, ?, ?,
									NOW(), ?,
									NOW(), ?
								)"
							);
							
						$stmt->execute(array($id, $col['name'], $_POST['filter_' . $col['name']], $memberid, $memberid));
					}
				}
	
				/* Commit transaction. */
				SessionControllerClass::getDB()->commit();
				
			} catch (Exception $e) {
				/* Rollback transaction. */
				SessionControllerClass::getDB()->rollBack();
				
				throw $e;
			}				
		}
		
		public function filter() {
			$parser = new PHPSQLParser($this->sql, true);
			$prefix = $this->table . ".";
			
			if ($parser->parsed['FROM'][0]['alias'] != "") {
				$prefix = $parser->parsed['FROM'][0]['alias']['name'] . ".";
			}
			
			if ($this->document != null) {
				$table = $this->document['tablename'];
				$column = $this->document['primaryidname'];
				
				$parser->parsed['SELECT'][] = 
					array(
							"expr_type" 		=> "colref",
							"alias"				=> "d",
							"base_expr"			=> ", (SELECT COUNT(*) FROM {$_SESSION['DB_PREFIX']}$table ZZ INNER JOIN {$_SESSION['DB_PREFIX']}documents ZA ON ZA.id = ZZ.documentid WHERE ZZ.$column = $prefix" . "id) AS d",
							"sub_tree"			=> ""
						);
			}
			
			foreach ($this->columns as $col) {
				$filterValue = "";
				
				if (isset($_GET['filter_' . $col['name']])) {
					$filterValue = base64_decode($_GET['filter_' . $col['name']]);
				}
				
				if (isset($_POST['filter_' . $col['name']])) {
					$filterValue = $_POST['filter_' . $col['name']];
				}
				
				if ($col['filter'] && $filterValue != "") {
					
					if ($col['type'] == "MULTIDATACOMBO" || 
						$col['type'] == "DATACOMBO" || 
						$col['type'] == "LAZYDATACOMBO") {
						if ($filterValue == "0") {
							continue;
						}
					}
					
					if ($col['filterprefix'] != null) {
						$prefix = $col['filterprefix'] . ".";
					}
					
					$filtercolumn = $prefix . $col['name'];
					
					if ($col['filtercolumn'] != null) {
						$filtercolumn = $prefix . $col['filtercolumn'];
					}
					
					if (! isset($parser->parsed['WHERE'])) {
						/* Create where clause. */
						$parser->parsed['WHERE'] = array();
									
					} else {
						/* Add to the where clause. */
						$parser->parsed['WHERE'][] = 
								array(
										"expr_type" 		=> "operator",
										"base_expr"			=> "AND",
										"sub_tree"			=> ""
									);
					}
								
					$parser->parsed['WHERE'][] = 
							array(
									"expr_type" 		=> "colref",
									"base_expr"			=> $filtercolumn,
									"sub_tree"			=> ""
								);
								
					if ($col['type'] == 'DATACOMBO' || $col['type'] == 'COMBO') {
						$parser->parsed['WHERE'][] = 
							array(
									"expr_type" 		=> "operator",
									"base_expr"			=> "=",
									"sub_tree"			=> ""
								);
						
					} else if ($col['datatype'] == "string" ||
						$col['datatype'] == "url" ||
						$col['datatype'] == "email" ||
						$col['datatype'] == "tel" ||
						$col['datatype'] == "color" ||
						$col['datatype'] == "string") {
							
						if ($this->autoWildCard) {
							$filterValue = "%$filterValue%";
						}
						
						$parser->parsed['WHERE'][] = 
								array(
										"expr_type" 		=> "operator",
										"base_expr"			=> "LIKE",
										"sub_tree"			=> ""
									);
									
					} else if ($col['datatype'] == "date") {
						$parser->parsed['WHERE'][] = 
								array(
										"expr_type" 		=> "operator",
										"base_expr"			=> "=",
										"sub_tree"			=> ""
									);
									
						$filterValue = convertStringToDate($filterValue);
						
					} else {
						$parser->parsed['WHERE'][] = 
								array(
										"expr_type" 		=> "operator",
										"base_expr"			=> "=",
										"sub_tree"			=> ""
									);
					}
								
					$parser->parsed['WHERE'][] = 
							array(
									"expr_type" 		=> "const",
									"base_expr"			=> "'$filterValue'",
									"sub_tree"			=> ""
								);
						
				}
			}
			
			try {
				$creator = new PHPSQLCreator($parser->parsed);
				$created = $creator->created;	
				
			} catch (Exception $e) {
				logError($e->getMessage());
			}
			
			$this->sql = $created;
		}
		
		/**
		 * Is user access permitted.
		 * @param string $code 
		 * @return boolean
		 */
		private function isUserAccessPermitted($code, $title = null) {
			return SessionControllerClass::getUser()
				->containsRole(
					SessionControllerClass::getPage()
						->getAction($code, $title)
						->getRoleIds()
				);
		}
		
		public function showHTMLAssets() {
?>
		<div style='height:22px'>
<?php
			if ($this->allowFilter) {
				if ($this->isUserAccessPermitted('Filter')) {
?> 
		   	<span id="filterbutton"  class="wrapper">
<?php
					$first = true;
					$stmt = SessionControllerClass::getDB()->prepare(
		   					"SELECT id, description 
		   					 FROM {$_SESSION['DB_PREFIX']}filter 
		   					 WHERE memberid = ? 
		   					 AND pageid = ?
		   					 ORDER BY description"
		   				);
		   			$stmt->execute(array(
		   					SessionControllerClass::getUser()->getMemberid(), 
		   					SessionControllerClass::getPage()->getId())
		   				);
		   			
		   			while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
						if ($first) {
							$first = false;
?>
						   	<ul class="submenu">
<?php	
						}
						echo "<li class='menuitem' onclick='selectFilter(" . $row['id'] . ")'>&nbsp;&nbsp;" . $row['description'] . "&nbsp;&nbsp; <div style='float:right'><img title='Remove filter' src='images/delete.png' onclick='removeFilter(event, " . $row['id'] . ")' /></div></li>";
					}
						
					if (! $first) {
?>
					   	</ul>
						<?php	
					}
				}
?>
		   	<a class='rgap2 link2' href="javascript:filter()"><em><b><img src='images/filter.png' /> Filter</b></em></a>
		   	</span>
			<?php
				}
?>
			
			<?php
				if ($this->allowAdd) {
					if ($this->isUserAccessPermitted('AddItem')) {
			?> 
		   	<span class="wrapper"><a id='crudaddbutton' class='rgap2 link2' href="javascript:addCrudItem()"><em><b><img src='images/add.png' /> Add</b></em></a></span>
			<?php
					}
				}
			?>
			
			<?php
				if ($this->allowView) {
					if ($this->isUserAccessPermitted('ViewItem')) {
			?> 
		   	<span class="wrapper"><a disabled class='disabledbutton subapp rgap2 link2' href="javascript:viewSelectedRow()"><em><b><img src='images/view.png' /> View</b></em></a></span>
			<?php
					}
				}
			?>
			
			<?php
				if ($this->allowEdit) {
					if ($this->isUserAccessPermitted('EditItem')) {
			?> 
		   	<span class="wrapper"><a id='crudeditbutton' disabled class='disabledbutton subapp rgap2 link2' href="javascript:editSelectedRow()"><em><b><img src='images/edit.png' /> Edit</b></em></a></span>
			<?php
					}
				}
			?>
			
			<?php
				if ($this->allowRemove) {
					if ($this->isUserAccessPermitted('RemoveItem')) {
			?> 
		   	<span class="wrapper"><a id='crudremovebutton' disabled class='disabledbutton subapp rgap2 link2' href="javascript:removeSelectedRow()"><em><b><img src='images/delete.png' /> Remove</b></em></a></span>
			<?php
					}
				}
				
				if ($this->document != null) {
	?>
					<span class="wrapper"><a disabled class='disabledbutton subapp rgap2 link2' href="javascript:editDocuments(getPK())"><em><b><img src='images/document.gif' /> Documents</b></em></a></span>
	<?php
				}
				
				if (count($this->subapplications) > 0) {
	?>
					<span class="wrapper">
						<div class="verticalLine">&nbsp;</div>
					</span>
	<?php
				}
							
				foreach ( $this->subapplications as $app ) {
					$okToRun = true;
					
					if ($app ['action'] != "") {
						$okToRun = $this->isUserAccessPermitted ( $app ['action'], $app ['title'] );
		
					} else if ($app ['script'] != "") {
						$okToRun = $this->isUserAccessPermitted ( $app ['script'], $app ['title'] );
					}
					
					if ($okToRun) {
						if (isset($app ['submenu'])) {
	?>
					   	<span title="<?php echo $app['tooltip']; ?>" class="submenuwrapper wrapper">
							<ul class="submenu">
	<?php
							foreach ( $app ['submenu'] as $submenu ) {
								echo "<li id='" . $submenu ['id'] . "' class='menuitem' onclick='if (this.disabled != true) " . $submenu ['script'] . "(getPK())'>" . $submenu ['title'] . "</li>";
							}
	?>
							</ul> 
							<a disabled class='disabledbutton subapp rgap2 link4' href="javascript:void()"> 
								<em> 
									<b> 
										<img width=16 height=16 src='<?php echo $app['imageurl']; ?>' /> <?php echo $app['title']; ?>
						   			</b>
								</em>
							</a>
						</span>
	<?php
						} else {
							if ($app ['application'] != "") {
	?>
	   	<span title="<?php echo $app['tooltip']; ?>" class="wrapper"> 
	   		<a disabled class='disabledbutton subapp rgap2 link4' id="<?php echo $app['id']; ?>" href="javascript: subApp('<?php echo $app['application']; ?>', getPK())">
				<em> 
					<b> 
						<img width=16 height=16 src='<?php echo $app['imageurl']; ?>' /> <?php echo $app['title']; ?>
	   				</b>
				</em>
			</a>
		</span>
	<?php
						} else {
	?>
	   	<span title="<?php echo $app['tooltip']; ?>" class="wrapper"> 
	   		<a disabled class='disabledbutton subapp rgap2 link4' id="<?php echo $app['id']; ?>" href="javascript: <?php echo $app['script']; ?>(getPK())"> 
	   			<em> 
	   				<b> 
	   					<img width=16 height=16 src='<?php echo $app['imageurl']; ?>' /> <?php echo $app['title']; ?>
	   				</b>
				</em>
			</a>
		</span>
	<?php
						}
					}
				}
			}
			
			if (count($this->applications) > 0) {
				?>
							<span class="wrapper">
								<div class="verticalLine">&nbsp;</div>
							</span>
			<?php
						}
						
						foreach ($this->applications as $app) {
							$okToRun = true;
								
							if ($okToRun && $app['action'] != "") {
								$okToRun = $this->isUserAccessPermitted($app['action'], $app['title']);
							}
								
							if ($okToRun) {
								if ($app['application'] != "") {
			?>
						   	<span title="<?php echo $app['tooltip']; ?>" id="<?php echo $app['id']; ?>"  class="wrapper"><a class='rgap2 link3' href="javascript:application('<?php echo $app['application']; ?>')"><em><b><img src='<?php echo $app['imageurl']; ?>' /> <?php echo $app['title']; ?></b></em></a></span>
			<?php
											
								} else {
			?>
						   	<span  title="<?php echo $app['tooltip']; ?>" id="<?php echo $app['id']; ?>"  class="wrapper"><a class='rgap2 link3' href="javascript:<?php echo $app['script']; ?>()"><em><b><img src='<?php echo $app['imageurl']; ?>' /> <?php echo $app['title']; ?></b></em></a></span>
			<?php
								}
							}
						}
					
			?>
			
			
			<?php
				if (isset($_GET['puri'])) {
			?>
			   	<span class="rgap5 wrapper"><a class='rgap2 link3' href="javascript:back()"><em><b><img src='images/back2.png' /> Back</b></em></a></span>
			
			<?php
				} else {
					echo "<br>";
				}
			?>
		</div>
		<br>
		
		<table id="tempgrid">
		</table>
		
		<div id="tempgrid_pager"></div>
		
		<?php
			$link = "";
			$linkfields = "";
			$firstlink = true;
			$where = "";
			
			if ($this->sql == "") {
				logError("No SQL provided");
			}
		?>
		<script>
	<?php
			$this->preScriptEvent();
	?>
			var crudFilterID = null;
			var currentCrudID = null;
			var sortByColumn = "<?php echo $this->sortby; ?>";
			var sortByDirection = "<?php echo $this->sortdirection; ?>";
			var fromRow = 0;
			var toRow = "<?php echo $this->torow; ?>";
			var pages = "<?php echo $this->pages; ?>";
			var pageSize = <?php echo $this->pagesize; ?>;

			function getRealNumber(num, dp) {
				var real = new Number(num).toFixed(dp);
				
				if (isNaN(real)) {
					return "0.00"
				}
				
				return real;
			}
	
			function editDocuments(node) {
	<?php 
				if ($this->document != null) {
	?>			
				viewDocument(
						node, 
						"adddocument.php",
						node, 
						"<?php echo pgEncrypt($this->document['tablename']); ?>",
						"<?php echo pgEncrypt($this->document['primaryidname']); ?>"
					);
	<?php 
				}
	?>			
			}
			
			function verifyUniqueKey(keyName, keyValue) {
				var retValue = true;
				
				businessObjectToJSon({
					classname: "CrudUIClass", 
					methodname: "fetchRow", 
					async: false,
					args: {
						id: keyValue,
						pkname: keyName,
						table: "<?php echo pgEncrypt($this->table); ?>"
					},
					success: function(data) {
						if (data.length > 0) {
							pwAlert("Row aleady exists");
							retValue = false;
						}
					}
				});
					
				return retValue;
			}
			
			function verifyCrudForm() {
				<?php
				if ($this->validateForm != null) {
					echo "if (" . $this->validateForm . "() == false) return false;\n";
				}
				?>
				return verifyStandardForm("#editform");
			}
	
			function removeFilter(e, id) {
				var event = e || window.event;
				
		        e.stopPropagation();
		        e.cancelBubble = true;
	
				$("#confirmfilterdialog .confirmdialogbody").html("You are about to remove this filter item.<br>Are you sure ?");
				$("#confirmfilterdialog").dialog("open");
	
				crudFilterID = id;
			}
			
			function subApp(app) {
	<?php
				$filterurl = "";
				
				foreach ($this->columns as $col) {
					if ($col['filter'] && isset($_POST['filter_' . $col['name']]) != "") {
						if ($col['type'] == "DATACOMBO" || $col['type'] == "MULTIDATACOMBO") {
							if ($_POST['filter_' . $col['name']] == "0") {
								continue;
							}
						}
						
						$filterurl .= "&filter_" . $col['name'] . "=";
						$filterurl .= base64_encode($_POST['filter_' . $col['name']]);
					}
				}
	?>			
	
				window.location.href = app + "?id=" + getSelectedRow().<?php echo $this->pkViewName; ?> + "&puri=<?php echo base64_encode($_SERVER['REQUEST_URI'] . $filterurl); ?>&callee=<?php echo base64_encode(basename($_SERVER['PHP_SELF'])); ?>";
			}
			
			<?php
				if (isset($_GET['puri'])) {
			?>
			function back() {
				window.location.href = "<?php echo base64_decode($_GET['puri']); ?>";
			}
			<?php
				}
			?>
			
			function selectFilter(filterid) {
				businessObjectToJSon({
					classname: "CrudUIClass", 
					methodname: "filter", 
					args: {
						id: filterid
					},
					success: function(data) {
						var i = 0;
						
						$("#filterpanel input").val("");
						$("#filterpanel select").val("");
						
						for (i = 0; i < data.length; i++) {
							var node = data[i];
							
							$("#filter_" + node.columnname).val(node.value);
							$("#filterform #currentfiltername").val(node.description);
						}
						
						/* Filter post. */						
						post("filterform", "filter");
					}
				});
			}
			
			function viewSelectedRow() {
				view(getSelectedRow().<?php echo $this->pkViewName; ?>);
			}
			
			function editSelectedRow() {
				<?php
					if ($this->allowEdit) {
						if ($this->isUserAccessPermitted('EditItem')) {
							
						if ($this->preEditScript != null) {
							$this->preEditScript();
						}
				?> 
				edit(getSelectedRow().<?php echo $this->pkViewName; ?>);
				<?php
						}
					}
				?> 
			}
			
			function getSelectedRow() {
				var gr = $("#tempgrid").jqGrid('getGridParam','selrow');
				
				if( gr != null ) {
					return $("#tempgrid").getLocalRow(gr);
				}
				
				return null;
			}
			
			function removeSelectedRow() {
				removeCrudItem(getSelectedRow().<?php echo $this->pkViewName; ?>);
			}
			
			function application(app) {
				post("editform", app);
			}
			
			function filter() {
	<?php
				$this->preFilterScriptEvent();
	?>
				$("#filterdialog").dialog("open");
			}
		
			function addCrudItem() {
				currentCrudID = null;
	
				<?php
				if ($this->preAddScriptEvent != null) {
					echo $this->preAddScriptEvent . "();\n";
				}
				?>
				
				$(".ui-dialog[aria-labelledby=ui-dialog-title-editdialog] .ui-dialog-title").text("Add");
				$(".ui-dialog[aria-labelledby=ui-dialog-title-editdialog] .ui-dialog-buttonset button:first").css("display", "");
				
				$("#crudcmd").val("insert");
				
				<?php
				foreach ($this->columns as $col) {
					if ($col['editable']) {
						if ($col['readonly'] || $col['type'] == "DERIVED") {
							
							if ($col['type'] == "DATACOMBO" || $col['type'] == "MULTIDATACOMBO") {
								echo "$('#editpanel #" . $col['name'] . "').attr('disabled', true);\n";
								
							} else {
								echo "$('#editpanel #" . $col['name'] . "').attr('readonly', true);\n";
							}
						}
	
						if ($col['type'] == "TEXTBOX") {
							echo "$('#" . $col['name'] . "').val('');\n";
							
							if ($col['datatype'] == "datetime" || $col['datatype'] == "timestamp") {
								echo "$('#" . $col['name'] . "_time').val('');\n";
							}
							
						} else if ($col['type'] == "GEOLOCATION") {
							echo "$('#" . $col['name'] . "').val('');\n";
						
						} else if ($col['type'] == "CHECKBOX") {
							echo "$('#" . $col['name'] . "').attr('checked', false);\n";
						
						} else if ($col['type'] == "DERIVED") {
							echo "$('#" . $col['name'] . "').val('');\n";
							
						} else if ($col['type'] == "FILE") {
	?>						
							$('#<?php echo $col['name']; ?>_link').text('No link specified');
							$('#<?php echo $col['name']; ?>_link').attr('disabled', true);
	<?php
							
						} else if ($col['type'] == "PASSWORD") {
							echo "$('#" . $col['name'] . "').val('');\n";
							
						} else if ($col['type'] == "BASICTEXTAREA") {
							echo "$('#" . $col['name'] . "').val('');\n";
							
						} else if ($col['type'] == "TEXTAREA") {
							echo "tinyMCE.get('" . $col['name'] . "').setContent('');\n";
							
						} else if ($col['type'] == "IMAGE") {
							echo "$('#" . $col['name'] . "_img').attr('src', 'images/no-image.gif');\n";
							
						} else if ($col['type'] == "DATACOMBO") {
							echo "$('#" . $col['name'] . "').val('0');\n";
							
							if (isset($_GET['callee']) && isset($_GET['id'])) {
								if ($col['pk']) {
									echo "$('#" . $col['name'] . "').val('" . $_GET['id'] . "');\n";
									echo "$('#" . $col['name'] . "').attr('disabled', 'true');\n";
								}
							}
							
						} else if ($col['type'] == "LAZYDATACOMBO") {
							echo "$('#" . $col['name'] . "').val('0');\n";
							echo "$('#" . $col['name'] . "_lazy').val('');\n";
							
						} else if ($col['type'] == "MULTIDATACOMBO") {
							echo "$('#" . $col['name'] . "').multiselect('uncheckAll');\n";
							
							if (isset($_GET['callee']) && isset($_GET['id'])) {
								if ($col['pk']) {
									echo "$('#" . $col['name'] . "').val('" . $_GET['id'] . "');\n";
									echo "$('#" . $col['name'] . "').attr('disabled', 'true');\n";
								}
							}
	  						
						} else if ($col['type'] == "COMBO") {
							echo "$('#" . $col['name'] . "').val('0');\n";
						}
					}
				}
				?>
				$("#editpanel .datepicker").attr("disabled", false);
				$("#editpanel input").attr("readonly", false);
				$("#editpanel input[type=checkbox]").attr("disabled", false);
				$("#editpanel select").attr("disabled", false);
				$(".mceToolbar > div").css("visibility", "visible");
	
				businessObjectToJSon({
						classname: "DocumentUIClass", 
						methodname: "clearSessionDocuments"
					});
	<?php 
				$this->postAddScriptEvent();
	?>			
	
				$("#editdialog").dialog("open");
			}
			
			function getGUID() {
				return getSelectedRow().guid;
			}
			
			function getPK() {
				return getSelectedRow().<?php echo $this->pkViewName; ?>;
			}
			
			function edit(id) {
				currentCrudID = id;
				
				$(".ui-dialog[aria-labelledby=ui-dialog-title-editdialog] .ui-dialog-title").text("Edit");
				$(".ui-dialog[aria-labelledby=ui-dialog-title-editdialog] .ui-dialog-buttonset button:first").css("display", "");
				
				$("#crudcmd").val("update");

				businessObjectToJSon({
					classname: "CrudUIClass", 
					methodname: "fetchRow", 
					args: {
						id: id,
						pkname: "<?php echo pgEncrypt($this->pkName); ?>",
						sql: "<?php echo pgEncrypt($this->sql); ?>"
					},
					success: function(data) {
						if (data.length > 0) {
							var node = data[0];
							
							$("#editpanel .datepicker").attr("disabled", false);
							$("#editpanel .timepicker").attr("disabled", false);
							$("#editpanel input").attr("readonly", false);
							$("#editpanel input[type=checkbox]").attr("disabled", false);
							$("#editpanel select").attr("disabled", false);
							$(".mceToolbar > div").css("visibility", "visible");
							
							<?php
							$this->populateFields();
							
							foreach ($this->columns as $col) {
								if ($col['type'] == "GEOLOCATION") {
?>
									if (node.<?php echo $col['name'] . '_lng'; ?> == "0" || node.<?php echo $col['name'] . '_lng'; ?> == null) {
										$("#editpanel #<?php echo $col['name']; ?>").trigger("change");
									}
<?php
								}
								
								if ($col['readonly']) {
?>	
									$("#editpanel #<?php echo $col['name']; ?>").attr("readonly", true);
<?php
								}
							}
							
							$this->postEditScriptEvent();
?>
							$("#crudid").val(id);
							$("#editdialog").dialog("open");

						} else {
							pwAlert("No rows found for edit");
						}
					}
				});
			}
	
			function previewDocument(id, name) {
				$.ajax({
					url: "system-document-preview.php",
					dataType: 'html',
					async: false,
					data: {
						id: id,
						name: name
					},
					type: "POST",
					error: function(jqXHR, textStatus, errorThrown) {
						alert (error);
					},
					success: function(data) {
						eval(data);
					}
				});
			}			
			
			function view(id) {
	<?php
				$this->preViewScriptEvent();
	?>
				currentCrudID = id;
				
				$("#crudcmd").val("view");
				
				$(".ui-dialog[aria-labelledby=ui-dialog-title-editdialog] .ui-dialog-title").text("View");
				$(".ui-dialog[aria-labelledby=ui-dialog-title-editdialog] .ui-dialog-buttonset button:first").css("display", "none");

				businessObjectToJSon({
					classname: "CrudUIClass", 
					methodname: "fetchRow", 
					args: {
						id: id,
						pkname: "<?php echo pgEncrypt($this->pkName); ?>",
						sql: "<?php echo pgEncrypt($this->sql); ?>"
					},
					success(data) {
						if (data.length > 0) {
							var node = data[0];
							
							<?php
							$this->populateFields();
							$this->postViewScriptEvent();
							?>
							$(".mceToolbar > div").css("visibility", "hidden");
							$("#editpanel input").attr("readonly", true);
							$("#editpanel input[type=checkbox]").attr("disabled", true);
							$("#editpanel select").attr("disabled", true);
							$("#editpanel .datepicker").attr("disabled", true);
							$("#editpanel .timepicker").attr("disabled", true);
							
							$("#crudid").val(id);
							$("#editdialog").dialog("open");
						}
					}
				});
				
			}
		
			function post(form, command, target, parameters) {
				var prevCMD = $("#" + form + " #crudcmd").val();
				
				if (target && target != null) {
					$("#" + form).attr("target", target);
					$("#" + form + " #triggerrefresh").val("true");
					
				} else {
					$("#" + form).attr("target", "");
				}
				
				if (parameters) {
					for (var param in parameters) {
						if (parameters[param] instanceof Array) {
							for (var ix = 0; ix < parameters[param].length; ix++) {
								$("<input type='hidden' id='" + param + "' name='" + param + "[]' value='" + parameters[param][ix] + "' />\n").appendTo("#editform");
							}
							
						} else {
							$("#" + form + " #" + param).val(parameters[param]);
						}
						
					}
				}
							
				$("#" + form + " #crudcmd").val(command);
				$("#" + form).submit();
				
				$("#" + form + " #crudcmd").val(prevCMD);
			}
	
			function crudFilterDelete() {
				$("#confirmfilterdialog").dialog("close");
	
				$.ajax({
						url: "crudremovefilter.php",
						dataType: 'html',
						async: false,
						data: {
							id: crudFilterID
						},
						type: "POST",
						error: function(jqXHR, textStatus, errorThrown) {
							alert (error);
						},
						success: function(data) {
							toastr.success("Filter removed", "<?php echo SessionControllerClass::getSiteConfig()->getCompanyname(); ?>");
							
							$("#filterbutton .submenu").html(data);
						}
					});
			}
			
			function crudDelete() {
				var correct = true;
				
				$("#confirmdialog").dialog("close");
				
<?php 
	
				if ($this->preDeleteScriptEvent != null) {
					echo "if (! ". $this->preDeleteScriptEvent . "(currentCrudID)) return;\n";
				}
					
				$tables = array();
				$columns = array();
				
				array_push($tables, pgEncrypt($this->table));
				array_push($columns, pgEncrypt($this->pkName));
				
				if ($this->cascadeDelete != null) {
					foreach ($this->cascadeDelete as $cascade) {
						array_push($tables, $_SESSION['DB_PREFIX'] . $cascade['table']);
						array_push($columns, $cascade['column']);
					}
				}
?>
	
				businessObjectToJSon({
					classname: "CrudUIClass", 
					methodname: "delete", 
					async: false,
					args: {
						table: [<?php echo "'" . implode("', '", $tables) . "'"; ?>],
						pkname: [<?php echo "'" . implode("', '", $columns) . "'"; ?>],
						id: currentCrudID
					},
					success: function(data) {
<?php 
						if ($this->postDeleteScriptEvent != null) {
							echo $this->postDeleteScriptEvent . "(currentCrudID);\n";
						}
?>
						refresh();

						toastr.success("Record removed", "<?php echo SessionControllerClass::getSiteConfig()->getCompanyname(); ?>");
					}
				});
			}
			
			function removeCrudItem(crudID) {
				currentCrudID = crudID;
				
				$("#confirmdialog .confirmdialogbody").html("You are about to remove this item.<br>Are you sure ?");
				$("#confirmdialog").dialog("open");
			}
			
			function refresh() {
				document.body.style.cursor = "wait";
				
				refreshData();
			}
			
			function showError(str) {
				pwAlert("An error has occurred: " + str);
			}
			
			var colNames = new Array();
			
			$(document).ready(
					function() {
						var grid = $("#tempgrid");
						var layout = new Array();
						var info;
						var colIndex = 0;
	<?php
						$visibleIndex = 1;
						$widthArray = $this->getColumnWidths();
							
						for ($i = 0; $i < count($this->columns); $i++) {
							$width = 0;
							$hidden = false;
							$columnlabel = "";
							
							if ($this->columns[$i]['showInView'] && ! $this->columns[$i]['pk']) {
								if (isset($widthArray[$visibleIndex])) {
									$width = $widthArray[$visibleIndex]['width'];
									$hidden = $widthArray[$visibleIndex]['hidden'];
									$columnlabel = $widthArray[$visibleIndex]['label'];
									
								} else {
									$width = $this->columns[$i]['length'];
									
									if ($this->columns[$i]['length'] < strlen($this->columns[$i]['label'])) {
										$width = strlen($this->columns[$i]['label']);
									}
									
									$width = intval($width * 6.2);
									$hidden = $this->columns [$i] ['hidden'];
								}
					
								$this->columns[$i]['viewlength'] = $width;
								$this->columns[$i]['hidden'] = $hidden;
								
								if ($columnlabel != null && $columnlabel != "") {
									$this->columns[$i]['label'] = $widthArray[$visibleIndex]['label'];
								}
								
								$visibleIndex++;
							}
						}
	?>										 
					   	$(".multiselect").multiselect({
					   			multiple: true
						   }); 
						 
						<?php
						
						foreach ($this->columns as $col) {
							if ($col['showInView'] || $col['pk']) {
						?>
						 info = {
								index:		"<?php echo $col['viewname']; ?>",
								name:		"<?php echo $col['viewname']; ?>",
								width:		<?php echo $col['viewlength']; ?>,
								hidden:		<?php echo ($col['pk'] && ! $col['showInView']) || $col['hidden'] ? "true" : "false";?>,
								align:		"<?php echo $col['align']; ?>",
								sortable:   false
								<?php 
									if ($col['type'] == "CHECKBOX") {
										echo ", formatter: checkboxFormatter";
										
									} else if ($col['formatter'] != "") {
										echo ", formatter: " . $col['formatter'];
									}
									
								?>
							};
							
						 colNames[colIndex] = "<?php echo $col['label']; ?>";
						 layout[colIndex++] = info;
						<?php
							}
						}
						?>
	
						 grid.jqGrid({
								datatype: "local",
								height: getAvailableHeight(),
							   	colNames: colNames,
							   	colModel: layout,
							   	sortable: false,
								shrinkToFit: false,
								width: getAvailableWidth(),
								autofitwidth: "100%",
								rowNum : <?php echo $this->pagesize; ?>,
							   	rowList: [18,20,30,50,80,100],
							   	pager: "#tempgrid_pager",
							   	
							   	viewRecords: true,
							   	multiselect: false,
							   	
								afterInsertRow: function(rowid, rowData, rowelem) {
							   		<?php
							   				$this->afterInsertRow ();
							   		?>
	   						    },						   	
				   	
								ondblClickRow: function (rowid,iRow,iCol,e) {
									if ($("#crudeditbutton").css("display") == "none") {
										return;
									}
											
								<?php
									if ($this->onDblClick != null) {
								?>
										<?php echo $this->onDblClick; ?>(getSelectedRow().<?php echo $this->pkViewName; ?>);
								<?php		
									} else if ($this->allowEdit && $this->isUserAccessPermitted('EditItem')) {
								?> 
										editSelectedRow();
								<?php
										
									} else if ($this->allowView && $this->isUserAccessPermitted('ViewItem')) {
								?> 
										viewSelectedRow();
								<?php
									}
								?> 
						        },						    
							    onSelectRow: function(rowid) {
							    	$(".subapp").removeAttr("disabled");
							    	$(".subapp").removeClass("disabledbutton");
									
									<?php
										if ($this->onClickCallback != "") {
											echo "$this->onClickCallback(getSelectedRow());\n";
										}
									?>
							    },
								resizeStop: function(width, index) { 
									businessObjectToJSon({
										classname: "CrudUIClass", 
										methodname: "columnSave", 
										args: {
											column: index,
											width: width,
											pageid: <?php echo SessionControllerClass::getPage()->getId(); ?>,
											memberid : <?php echo SessionControllerClass::getUser()->getMemberid(); ?>,
											label: colNames[index]
										},
										success: function(data) {
										}
									});
								},
								caption: "<?php echo $this->title; ?>"
							
							});
	
	<?php 
						if (isset($_GET['filtering']) && $_POST['currentfiltername'] != "") {
	?>
							$(".ui-jqgrid-title").text("<?php echo $this->title . ": Filter selected - By " . $_POST['currentfiltername']; ?>");
	<?php
						}
	?>
						
					    $('form').bind('submit', function() { 
						        $(this).find('select').removeAttr('disabled'); 
						    }); 
						
						$("#filterbutton").hover( 
								function () { 
									var child = $(this).find('ul');
									
									child.css("margin-top", "-20px");
									child.show();
							  	},  
							  	function () { 
									var child = $(this).find('ul');
									
							  		child.hide();
							  	} 
							); 
					
						$(".submenuwrapper").hover( 
								function () { 
									if ($(this).find("a").attr("disabled") != true) {
										var child = $(this).find('ul');
		
										child.css("margin-top", "-17px");
										child.css("margin-left", (($(this).find('a').offset().left - $(this).parent().offset().left) + 9) + "px");
										child.show();
									}
							  	},  
							  	function () { 
									var child = $(this).find('ul');
									
							  		child.hide();
							  	} 
							); 
						 					
						$("#editdialog").dialog({
								modal: true,
								autoOpen: false,
								show:"fade",
								hide:"fade",
								width: "auto",
								title:"Edit / Add",
								open: function(event, ui){
									
								},
								buttons: {
	<?php 
			if ($this->document != null) {
	?>
									"Documents": function() {
										editDocuments(currentCrudID);
									},
	<?php 
			}
	?>
									"Save": function() {
										if (! verifyCrudForm("#editpanel")) {
											return;
										}
										
										tinyMCE.triggerSave();
										
										if ($("#crudcmd").val() == "insert") {
	<?php
			for ($i = 0; $i < count($this->columns); $i++) {
				if ($this->columns[$i]['unique'] == true) {
	?>				
					if (! verifyUniqueKey("<?php echo pgEncrypt($this->columns[$i]['name']); ?>", $("#<?php echo $this->columns[$i]['name']; ?>").val())) {
						return;
					}
	<?php				
				}
			}
	?>									
										}
										
										$(this).dialog("close")
	<?php 
										$this->preUpdateScriptEvent();
	?>
																			
										post("editform", $("#editform #crudcmd").val(), "submitframe");
	
										setTimeout(
												function() {
	<?php									
													$this->postUpdateScriptEvent();
	?>									
												},
												1000
											);
									},
									Cancel: function() {
										$(this).dialog("close");
									}
								}
							});
	 					
						$("#filterdialog").dialog({
								modal: true,
								autoOpen: false,
								show:"fade",
								hide:"fade",
								width: "auto",
								height: "auto",
								title:"Search",
								open: function(event, ui){
									
								},
								buttons: {
									"Search": function() {
										$(this).dialog("close")
										
										post("filterform", "filter");
									},
									"Save": function() {
										$("#filtersavedialog").dialog("open");
									},
									"Clear": function() {
										$("#filterform input").val("");
										$("#filterform select").val("");
									},
									Cancel: function() {
										$("#filterdialog").dialog("close");
									}
								}
							});
	 					
						$("#filtersavedialog").dialog({
								modal: true,
								autoOpen: false,
								show:"fade",
								hide:"fade",
								width: 460,
								title:"Save Filter",
								open: function(event, ui){
									
								},
								buttons: {
									"Save": function() {
										$(this).dialog("close")
										$("#savefiltername").val($("#filtername").val());
										
										post("filterform", "filtersave");
									},
									Cancel: function() {
										$(this).dialog("close");
									}
								}
							});
							
						<?php
							if ($this->autoPopulate) {
								$this->rowcount = $this->getRowCount();
								$this->pages = intval($this->rowcount / $this->pagesize);
								
								if (($this->rowcount % $this->pagesize) > 0) {
									$this->pages++;
								}
								
								if ($this->pages == 0) {
									$this->pages = 1;
								}
						?>
								pages = <?php echo $this->pages; ?>;
								$("#tempgrid_pager_right").html("<div style='float:right'><b>Records found : </b><i><?php echo $this->rowcount; ?></i>&nbsp;</div>");
								refresh();
								
						<?php
							} else {
								$this->rowcount = 0;
								$this->pages = 1;
						?>
								pages = <?php echo $this->pages; ?>;
						<?php
							}
							
						?>
						
						var marker = false;
						
						$(".ui-pg-table td[dir='ltr']").each(
								function() {
									if (! marker) {
										$(this).html("Page <?php echo intval(($this->fromrow / $this->pagesize) + 1); ?> of <?php echo intval($this->pages); ?>");
										marker = true;
									}
								}
							);
						
						$(".ui-jqgrid-sortable").click(
								function() {
									var str = $(this).attr("id");
									var n=str.lastIndexOf("_") + 1; 
									var column = str.substring(n);
									
									$(".ui-jqgrid-sortable span").hide();
									$(this).find("span").show();
									
									<?php
										foreach ($this->columns as $col) {
											if ($col['sortcolumn'] != null) {
									?>
									if (column == "<?php echo $col['name']; ?>") column = "<?php echo $col['sortcolumn']; ?>";
									<?php
												
											}
										}
									?>
										
									if (sortByColumn == column) {
										/* Same column, so sort in reverse. */
										if (sortByDirection  == "ASC") {
											sortByDirection = "DESC";
											
										} else {
											sortByDirection = "ASC";
										}
										
									} else {
										sortByColumn = column;
										sortByDirection = "ASC";
									}
									
									refresh();
								}
							);
							
						$(".ui-pager-control .ui-icon-seek-first").click(
								function() {
									fromRow = 0;
									toRow = pageSize;
									
									refresh();
								}
							);
							
						$(".ui-pager-control .ui-icon-seek-end").click(
								function() {
									fromRow = parseInt((pages - 1) * pageSize);
									toRow = pageSize;
									
									refresh();
								}
							);
							
						$(".ui-pager-control .ui-icon-seek-prev").click(
								function() {
									if (fromRow > 0) {
										fromRow = parseInt(fromRow) - parseInt(pageSize);
										toRow = pageSize;
										
										refresh();
									}
								}
							);
							
						$(".ui-pg-selbox").change(
								function() {
									pageSize = parseInt($(this).val());
									fromRow = 0;
									toRow = pageSize;
									
									refresh();
								}
							);
							
						$(".ui-pager-control .ui-icon-seek-next").click(
								function() {
									if ((fromRow + pageSize) < <?php echo $this->rowcount; ?>) {
										fromRow = parseInt(fromRow) + parseInt(pageSize);
										toRow = pageSize;
										
										refresh();
									}
								}
							);
	
						$(".crudentryform select[required], .crudentryform input[required]").each(
								function() {
									var prev = $(this).parent().prev();
	
									if (prev.html() != null && prev.html().indexOf("requiredmarker") == -1) {
										prev.html(prev.html() + " <span class='requiredmarker'>*</span>");
									}
								}
							);
							
		<?php
						$this->postLoadScriptEvent();
		?>
					}
				);
				
			function refreshData() {
		    	$(".subapp").attr("disabled", true);
		    	$(".subapp").addClass("disabledbutton");
		    	$(".subapp").removeClass("pressed");

				businessObjectToJSon({
					classname: "CrudUIClass", 
					methodname: "fetch", 
					args: {
						sql: "<?php echo pgEncrypt($this->sql); ?>",
						orderby: sortByColumn,
						direction: sortByDirection,
						from: fromRow,
						to: pageSize
					},
					success: function(data) {
						var marker = false;
						pages = parseInt(<?php echo $this->rowcount; ?> / pageSize);
					
						if ((<?php echo $this->rowcount; ?> % pageSize) > 0) {
							pages++;
						}
						
						if (pages == 0) {
							pages = 1;
						}
					
						$(".ui-pg-table td[dir='ltr']").each(
								function() {
									if (! marker) {
										$(this).html("Page " + ((fromRow / pageSize) + 1) + " of " + pages);
										
										marker = true;
									}
								}
							);
							
						$("#tempgrid").clearGridData(true);
						
						var i = 0;
						var indexNo = 1;
						var item;
						
						for (i = 0; i < data.length; i++) {
							var node = data[i];
<?php
							$first = true;
							
							echo "item = {";
										
							foreach ($this->columns as $col) {
								
								if ($col['showInView'] || $col['pk']) {
									if ($first) {
										$first = false;
												
									} else {
										echo ", ";
									}
											
									echo "'" . $col['viewname'] . "': ";
											
									if ($col['type'] == "DATACOMBO" || 
									    $col['type'] == "LAZYDATACOMBO" || 
									    $col['type'] == "MULTIDATACOMBO") {
										echo "node.";
									
										if ($col['alias'] != '') {
											echo $col['alias'];
													
										} else {
											echo $col['table_name'];
										}
											
									} else if ($col['type'] == "DERIVED") {
										echo $col['function'] . "(node)";
									
									} else if ($col['type'] == "COMBO") {
										$comboArray = array();
										$descArray = array();
										
										foreach ($col['options'] as $opt) {
											array_push($comboArray, $opt['value']); 
											array_push($descArray, $opt['text']); 
										}

										echo "getComboValue(node." . $col['name'] . ", new Array('" . implode("', '", $comboArray) . "'), new Array('" . implode("', '", $descArray) . "'))";
												
									} else {
										echo "node." . $col['name'];
									}
								}
							}
	
							echo "};\n";
							echo "$('#tempgrid').addRowData(indexNo++, item);\n";
?>
						}
						
						$(".ui-state-disabled").each(
								function() {
									$(this).removeClass("ui-state-disabled");
								}
							);
							
						<?php
						if ($this->postDataRefreshEvent != null) {
							echo $this->postDataRefreshEvent . "(data);\n";
						}
						?>
						
						document.body.style.cursor = "default";
						$("#alertdialog").dialog("close");

						if ($("#crudcmd").val() == "insert") {
							toastr.success("Record added", "<?php echo SessionControllerClass::getSiteConfig()->getCompanyname(); ?>");
							
						} else if ($("#crudcmd").val() == "update") {
							toastr.success("Record updated", "<?php echo SessionControllerClass::getSiteConfig()->getCompanyname(); ?>");
						}

						$("#crudcmd").val("");
					}
				});
				
			}
			
		<?php
			$this->postScriptEvent();
		?>
	
		function getAvailableWidth() {
			return $("body").attr("offsetWidth") - 10;
		}
	
		function getAvailableHeight() {
			return $("body").attr("offsetHeight") - 280;
		}
	
		function checkboxFormatter(el, cval, opts) {
			if (el == 0) {
				return "<img height=16  src='images/checkbox_off.png' />";
			}
			
			return "<img height=16 src='images/checkbox_on.png' />";
	    } 	
	    
		function documentFormatter(el, cval, opts) {
			if (el == 0) {
				return " ";
			}
			
			return "<div class='docimg'><div>" + el + "</div></div>";
	    } 	
	    
		function getComboValue(value, comboArray, descArray) {
			for (var i = 0; i < comboArray.length; i++) {
				if (comboArray[i] == value) {
					return descArray[i];
				}
			}
			
			return "";
		}
				
		</script>
	<?php		
		} 
		
		public function createView() {
			if (isset($_GET['puri'])) {
				$this->crud_cache_function("showHTMLAssets", array("pageid" => SessionControllerClass::getPage()->getId(), "url" => $_GET['puri']));
				
			} else {
				$this->crud_cache_function("showHTMLAssets", array("pageid" => SessionControllerClass::getPage()->getId()));
			}
	?>
	
		<?php
			require_once("system-footer.php");
		}
	
		/**
		 * Delete record.
		 * @param int $id
		 */
		public function delete($id) {
			try {
				SessionControllerClass::getDB()->beginTransaction();
				SessionControllerClass::getDB()->exec("DELETE FROM {$this->table} WHERE {$this->pkName} = $id");
				
				$this->postDeleteEvent($id);
				
				SessionControllerClass::getDB()->commit();
				
			} catch (Exception $e) {
				SessionControllerClass::getDB()->rollBack();
			}
		}
		
		/**
		 * Property containing strings
		 * @param string $value
		 */
		private function propertyStringValue($value) {
			if (is_null($value)) {
				return null;
			}
				
			return $value;
		}
		
		/**
		 * Property containing integer
		 * @param int $value
		 */
		private function propertyIntValue($value) {
			if (is_null($value) || ! is_numeric($value)) {
				return null;
			}
				
			if (strval($value) == "") {
				return null;
			}
		
			return str_replace(",", "", $value);
		}
		
		/**
		 * Property containing double
		 * @param float $value
		 */
		private function propertyDoubleValue($value) {
			if (is_null($value) || ! is_float(floatval($value))) {
				return null;
			}
		
			if ($value == "") {
				return null;
			}
		
			return str_replace(",", "", $value);
		}
		
		/**
		 * Property containing date
		 * @param DateTime $value .
		 */
		private function propertyDateValue($value) {
			if (is_null($value) || $value == "") {
				return null;
			}
		
			if ($value == "") {
				return null;
			}
		
			return convertStringToDate($value);
		}

		/**
		 * Property containing date
		 * @param DateTime $value .
		 */
		private function propertyCheckbox($value) {
			if (isset($value) && $value == "on") {
				return 1;
			}
			
			return 0;
		}

		/**
		 * Property containing date
		 * @param DateTime $value .
		 */
		private function propertyPassword($value) {
			if (is_null($value) || $value == "") {
				return null;
			}
		
			if ($value == "") {
				return null;
			}
		
			return md5($this->propertyStringValue($value));
		}
		
		/**
		 * Update record.
		 * @param int $id
		 */
		public function update($id) {
			try {
				/* Begin transaction. */
				SessionControllerClass::getDB()->beginTransaction();
				
				$bindingParameters = array();
				$this->preUpdateEvent($id);
				
				$qry = "UPDATE {$this->table} SET ";
				
				foreach ($this->columns as $col) {
					if ($col['bind']) {
						$coltype = $col['type'];
						$colname = $col['name'];
						
						if ($coltype == "IMAGE") {
							if (is_uploaded_file($_FILES[$colname]['tmp_name'])) {
								$qry = "$qry $colname = ?, ";
								
								$image = new ImageClass();
								$image->setDescription($col['label']);
								$image->uploadFromFile($colname);
								$image->insertRecord();
								
								array_push($bindingParameters, $image->getId());
							}
							
							continue;
						}
							
						if ($coltype == "FILE") {
							if (is_uploaded_file($_FILES[$colname]['tmp_name'])) {
								$qry = "$qry $colname = ?, ";
								
								$document = new DocumentClass();
								$document->setCompressed(true);
								$document->setName($col['label']);
								$document->uploadFromFile($colname);
								$document->insertRecord();
								
								array_push($bindingParameters, $document->getId());
							}

							continue;
						}

						if ($coltype == "CHECKBOX") {
							$qry = "$qry $colname = ?, ";
							
							array_push($bindingParameters, $this->propertyCheckbox($_POST[$colname]));
							
							continue;
						}
						
						/* Amend update statement. */
						$qry = "$qry $colname = ?, ";
						
						if (isset($_POST[$colname])) {
							$value = $_POST[$colname];
							$datatype = $col['datatype'];
							
							if ($coltype == "PASSWORD") {
								array_push($bindingParameters, $this->propertyPassword($value));
									
							} elseif ($datatype == "timestamp" || $datatype == "datetime") {
								array_push($bindingParameters, " {$this->propertyDateValue($value)} {$_POST[$colname . "_time"]}");
								
							} elseif ($datatype == "float" || $datatype == "double") {
								array_push($bindingParameters, $this->propertyDoubleValue($value));
										
							} elseif ($datatype == "integer") {
								array_push($bindingParameters, $this->propertyIntValue($value));
								
							} elseif ($datatype == "date") {
								array_push($bindingParameters, $this->propertyDateValue($value));
								
							} else {
								array_push($bindingParameters, $this->propertyStringValue($value));
							}
							
						} else {
							array_push($bindingParameters, $col['default']);
						}
					}
				}
				
				/* Where clause bind. */
				array_push($bindingParameters, $id);
				
				$qry = $qry . "metamodifieddate = NOW(), 
							   metamodifieduserid = " . SessionControllerClass::getUser()->getMemberid() . " 
							   WHERE {$this->pkName} = ?";
				
				$statement = SessionControllerClass::getDB()->prepare($qry);
				$statement->execute($bindingParameters);

				/* Commit transaction. */
				SessionControllerClass::getDB()->commit();
				
				$this->postUpdateEvent($id);
				
			} catch (PDOException $e) {
				SessionControllerClass::getDB()->rollback();
					
				$this->errorDescriptions[] = $e->getMessage();
			}
		}
	
		public function insert() {
			try {
				/* Begin transaction. */
				SessionControllerClass::getDB()->beginTransaction();
			
				$bindingParameters = array();
				$qry = "INSERT INTO {$this->table} (";
				$first = true;
				
				foreach ($this->columns as $col) {
					if ($col['bind']) {
						$qry = "{$qry} {$col['name']}, ";
					}
				}
				
				$qry = $qry . "metacreateddate, metacreateduserid, metamodifieddate, metamodifieduserid) VALUES (";
				
				foreach ($this->columns as $col) {
					if ($col['bind']) {
						$qry = "{$qry}?, ";
						
						if ($col['type'] == "IMAGE") {
							$image = new ImageClass();
							$image->setDescription($col['label']);
							$image->uploadFromFile($col['name']);
							$image->insertRecord();
							
							array_push($bindingParameters, $image->getId());
								
						} else if ($col['type'] == "FILE") {
							$document = new DocumentClass();
							$document->setCompressed(true);
							$document->setName($col['label']);
							$document->uploadFromFile($col['name']);
							$document->insertRecord();
								
							array_push($bindingParameters, $document->getId());
							
						} else if ($col['type'] == "PASSWORD") {
							array_push($bindingParameters, md5($_POST[$col['name']]));
							
						} else if ($col['type'] == "CHECKBOX") {
							array_push($bindingParameters, (isset($_POST[$col['name']]) ? ($_POST[$col['name']] == "on" ? 1 : 0) : 0));
							
						} else {
							if (isset($_POST[$col['name']])) {
								if ($col['datatype'] == "timestamp" || $col['datatype'] == "datetime") {
									$mysql_date = convertStringToDate($_POST[$col['name']]);
									$mysql_time = $_POST[$col['name'] . "_time"];
									
									array_push($bindingParameters, "$mysql_date $mysql_time");
									
								} else if ($col['datatype'] == "date") {
									if ($_POST[$col['name']] == "" || $_POST[$col['name']] == null) {
										array_push($bindingParameters, null);
										
									} else {
										array_push($bindingParameters, convertStringToDate($_POST[$col['name']]));
									}
									
								} else {
									array_push($bindingParameters, $_POST[$col['name']]);
								}
								
							} else {
								if ($col['default'] == "TODAY") {
									array_push($bindingParameters, date("Y-m-d"));
									
								} else if ($col['default'] == "USER") {
									array_push($bindingParameters, SessionControllerClass::getUser()->getMemberid());

								} else if ($col ['default'] == "GUID") {
									array_push($bindingParameters, uniqid());
										
								} else {
									array_push($bindingParameters, $col['default']);
								}
							}
						}
					}
				}
				
				$memberid = SessionControllerClass::getUser()->getMemberid();
				$qry = $qry . "NOW(), $memberid, NOW(), $memberid)";
				
				$statement = SessionControllerClass::getDB()->prepare($qry);
				$statement->execute($bindingParameters);
				$insertid = SessionControllerClass::getDB()->lastInsertId();
				
				if ($this->document != null) {
						$documents = new DocumentCollectionClass();
						$documents->uploadSessionDocuments(
							$insertid,
							$this->document['primaryidname'],
							$this->document['tablename']
						);
				}

				/* Commit transaction. */
				SessionControllerClass::getDB()->commit();
				
				$this->postInsertEvent($insertid);
				
			} catch (PDOException $e) {
				SessionControllerClass::getDB()->rollback();
					
				$this->errorDescriptions[] = $e->getMessage();
			}
		}
		
		private function getRowCount() {
			$stmt = SessionControllerClass::getDB()->query($this->sql);
			
			return $stmt->rowCount();
		}
		
		public function crud_cache_function($functionname, $arguments = array()) {
	//				$stti = microtime(true);
			$encoded = md5(json_encode($arguments));
			$cachekey = 'CRUD_CACHE_' . $functionname . "_" . $encoded;
			
			if (! isset($_SESSION[$cachekey]) || $_SESSION['CACHING'] != "temp") {
				ob_start(); //Turn on output buffering 
				
				call_user_func(array($this, $functionname));
				
				$_SESSION[$cachekey] = ob_get_clean(); 
	//			$fiti = number_format(microtime(true) - $stti, 6);
	//			logError("<h1>CRUD - NONE CACHED $cachekey - ELAPSED $fiti:</h1>", false) ;
				
	//		} else {
	//			$fiti = number_format(microtime(true) - $stti, 6);
	//			logError("<h1>CRUD - CACHED $cachekey - ELAPSED $fiti</h1>", false) ;
			}
			
			echo $_SESSION[$cachekey];
			
		}
	}
?>