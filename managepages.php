<?php
	require_once(__DIR__ . "/crud.php");
	require_once(__DIR__ . "/businessobjects/PageClass.php");
	require_once(__DIR__ . "/businessobjects/PageNavigationClass.php");
	require_once(__DIR__ . "/businessobjects/PageRolesClass.php");
	require_once(__DIR__ . "/cache/Cache.php");
	require_once(__DIR__ . "/ui/ComboUIClass.php");

	function setDividerTitle() {
		$pagenav = new PageNavigationClass();
		$pagenav->loadByParentAndChildPageId($_POST['navigationpageid'], $_POST['navigationid']);
		$pagenav->setTitle($_POST['title']);
		$pagenav->updateRecord();
	}

	function sequenceUp() {
		$pagenav = new PageNavigationClass();
		$pagenav->loadByParentAndChildPageId($_POST['navigationpageid'], $_POST['navigationid']);
		$pagenav->moveUp();
	}
	
	function sequenceDown() {		
		$pagenav = new PageNavigationClass();
		$pagenav->loadByParentAndChildPageId($_POST['navigationpageid'], $_POST['navigationid']);
		$pagenav->moveDown();
	}
	
	function saveContent() {
		$page = new PageClass();
		$page->loadRecord($_POST['contentpageid']);
		$page->setContent($_POST['contentvalue']);
		$page->updateRecord();
	}
	
	class PageEdit extends Crud {
		public function postUpdateEvent($pageid) {
			$cache = new Cache(array(
					'name'      => 'page-cache',
					'path'      => __DIR__ . "/tmp/",
					'extension' => '.cache'
				));
			
			$cache->eraseAll();
		}
		
		/* Post insert event. */
		public function postInsertEvent($pageid) {
			if (isset($_GET['id'])) {
				$parentpageid = $_GET['id'];
				
			} else {
				$parentpageid = PageClass::PAGE_HOMEPAGE;
			}

			/* Load the parent page. */
			$page = new PageClass();
			$page->loadRecord($parentpageid);

			/* Create page role - default is PUBLIC. */
			$pagerole = new PagerolesClass();
			$pagerole->setPageid($pageid);
			$pagerole->setRoleid("PUBLIC");
			$pagerole->insertRecord();
			
			$pagenav = new PageNavigationClass();
			$pagenav->setPageid($parentpageid);
			$pagenav->setChildpageid($pageid);
			$pagenav->setSequence($page->getMaximumSequenceForPage());

			if ($_POST['menuitem'] == "Y") {
				if ($parentpageid == PageClass::PAGE_HOMEPAGE) {
					$pagenav->setPagetype(PageNavigationClass::PAGENAVIGATIONTYPE_PAGE);
						
				} else {
					$pagenav->setPagetype(PageNavigationClass::PAGENAVIGATIONTYPE_MENU);
				}
			
			} else if ($_POST['menuitem'] == "X") {
				$pagenav->setPagetype(PageNavigationClass::PAGENAVIGATIONTYPE_MOBILE);
			
			} else {
				$pagenav->setPagetype(PageNavigationClass::PAGENAVIGATIONTYPE_HIDDEN);
			}
			
			$pagenav->insertRecord();
		}
		
		/* Pre command event. */
		public function preCommandEvent() {
			if (isset($_POST['rolecmd'])) {
				if (isset($_POST['roles'])) {
					$counter = count($_POST['roles']);
		
				} else {
					$counter = 0;
				}
				
				SessionControllerClass::getDB()->beginTransaction();
				
				try {
					/* Load the page. */
					$page = new PageClass();
					$page->loadRecord($_POST['pageid']);
					$page->deletePageRoles();
			
					for ($i = 0; $i < $counter; $i++) {
						$pagerole = new PagerolesClass();
						$pagerole->setPageid($_POST['pageid']);
						$pagerole->setRoleid($_POST['roles'][$i]);
						$pagerole->insertRecord();
					};
					
					SessionControllerClass::getDB()->commit();
					
				} catch (Exception $e) {
					SessionControllerClass::getDB()->rollBack();
					
					throw $e;
				}
			}
		}

		/* Post header event. */
		public function postHeaderEvent() {
?>
			<script src='js/jquery.picklists.js' type='text/javascript'></script>
			
			<div id="contentDialog" class="modal">
				<label>NOTES</label><br>
				<textarea id="editemailnotes" name="editemailnotes" class="tinyMCE" cols="180" rows=17 style="height: 400px"></textarea>
			</div>
			
			<div id="divider_dialog" class="modal">
				<label>Title</label>
				<input type="text" size=40 id="divider_title" />
			</div>
			
			<div id="roleDialog" class="modal">
				<form id="rolesForm" name="rolesForm" method="post">
					<input type="hidden" id="pageid" name="pageid" />
					<input type="hidden" id="rolecmd" name="rolecmd" value="X" />
					<select class="listpicker" name="roles[]" multiple="true" id="roles" >
<?php 
					    ComboUIClass::getInstance()
						    ->setValue("roleid")
						    ->setName("roleid")
						    ->setTable("roles")
						    ->setRequired(false)
					        ->renderOptions();
?>
					</select>
				</form>
			</div>
<?php
		}
		
		/* Post script event. */
		public function postScriptEvent() {
?>
			var currentRole = null;
			var currentPageID = null;
			
			function sequenceUp(id) {
				var pageid = <?php
					if (isset($_GET['id'])) {
						echo $_GET['id'];
						
					} else {
						echo "1";
					}
				?>;
				
				post("editform", "sequenceUp", "submitframe", { navigationid: id, navigationpageid: pageid});
			}
			
			function setTitleDivider(id) {
				currentPageID = id;
				
				$("#divider_dialog").dialog("open");
			}
			
			function sequenceDown(id) {
				var pageid = <?php
					if (isset($_GET['id'])) {
						echo $_GET['id'];
						
					} else {
						echo "1";
					}
				?>;
				
				post("editform", "sequenceDown", "submitframe", { navigationid: id, navigationpageid: pageid});
			}
			
			
			function typeChange() {
				if ($("#type").val() == "D") {/* Dynamic */
					if ($("#pagename").val().substring(0, 21) != "dynamicpage.php?page=") {
						$("#pagename").val("dynamicpage.php?page=" + $("#pagename").val());
					}

				} else {
					if ($("#pagename").val().length > 21) {
						if ($("#pagename").val().substring(0, 21) == "dynamicpage.php?page=") {
							$("#pagename").val($("#pagename").val().substring(21, $("#pagename").val().length));
						}
					}
				}
			}
			
			$(document).ready(function() {
					$("#roles").pickList({
							removeText: 'Remove Role',
							addText: 'Add Role',
							testMode: false
						});
					
					$("#roleDialog").dialog({
							autoOpen: false,
							modal: true,
							width: "auto",
							title: "Roles",
							buttons: {
								"Save": function() {
									$("#rolesForm").submit();
								},
								Cancel: function() {
									$(this).dialog("close");
								}
							}
						});
					
					$("#divider_dialog").dialog({
							autoOpen: false,
							modal: true,
							width: "auto",
							title: "Divider Title",
							buttons: {
								"Update": function() {
									var pageid = <?php
										if (isset($_GET['id'])) {
											echo $_GET['id'];
											
										} else {
											echo "1";
										}
									?>;
									
									post("editform", "setDividerTitle", "submitframe", { 
										navigationid: currentPageID, 
										navigationpageid: pageid, 
										title: $("#divider_title").val()
									});
									
									$(this).dialog("close");
								},
								Cancel: function() {
									$(this).dialog("close");
								}
							}
						});
					
					$("#contentDialog").dialog({
							autoOpen: false,
							modal: true,
							width: 800,
							title: "Content",
							buttons: {
								"Save": function() {
									tinyMCE.triggerSave();
									
									$(this).dialog("close");
									
									post(
											"editform", 
											"saveContent", 
											"submitframe", 
											{ 
												contentpageid: currentPageID, 
												contentvalue: tinyMCE.get('editemailnotes').getContent() 
											}
										);
								},
								Cancel: function() {
									$(this).dialog("close");
								}
							}
						});
				});
				
			function editContent(pageid) {
				currentPageID = pageid;
				
				businessObjectToJSon({
						classname: "PageUIClass", 
						methodname: "load", 
						args: {
							pageid: pageid
						},
						success: function(data) {
							if (data.content == null) {
								tinyMCE.get("editemailnotes").setContent("");
								
							} else {
								tinyMCE.get("editemailnotes").setContent(data.content);
							}
							
							$("#contentDialog").dialog("open");
						}
					});
			}
				
			function pageRoles(pageid) {
				businessObjectToJSon({
						classname: "PageRolesUIClass", 
						methodname: "loadByPageID", 
						datatype: "html",
						args: {
							pageid: pageid
						},
						success: function(data) {
							$("#roles").html(data);
							
							$("#pageid").val(pageid);
							$("#roleDialog").dialog("open");
						}
					});
			}
<?php
		}
	}
	
	$crud = new PageEdit();
	$crud->title = "Pages";
	$crud->table = "{$_SESSION['DB_PREFIX']}pages";
	
	if (isset($_GET['id'])) {
		$crud->sql = 
				"SELECT A.*, B.pagetype 
				 FROM {$_SESSION['DB_PREFIX']}pages A 
				 INNER JOIN {$_SESSION['DB_PREFIX']}pagenavigation B 
				 ON B.childpageid = A.pageid 
				 AND B.pagetype != 'P' 
				 WHERE B.pageid = {$_GET['id']}
				 ORDER BY B.sequence"; 
		
	} else {
		$crud->sql = 
				"SELECT A.*, B.pagetype 
				 FROM {$_SESSION['DB_PREFIX']}pages A 
				 INNER JOIN {$_SESSION['DB_PREFIX']}pagenavigation B 
				 ON B.childpageid = A.pageid 
				 AND B.pagetype = 'P'
				 WHERE B.pageid = 1  
				 ORDER BY B.sequence"; 
	}
	
	$crud->messages = array(
			array('id'		  => 'contentvalue'),
			array('id'		  => 'contentpageid'),
			array('id'		  => 'title'),
			array('id'		  => 'navigationid'),
			array('id'		  => 'navigationpageid')
		);
	$crud->subapplications = array(
			array(
				'title'		  => 'Navigate',
				'imageurl'	  => 'images/minimize.gif',
				'application' => 'managepages.php'
			),
			array(
				'title'		  => 'Roles',
				'imageurl'	  => 'images/user.png',
				'script' 	  => 'pageRoles'
			),
			array(
				'title'		  => 'Actions',
				'imageurl'	  => 'images/action.png',
				'application' => 'manageactions.php'
			),
			array(
				'title'		  => 'Content',
				'imageurl'	  => 'images/article.png',
				'script'      => 'editContent'
			),
			array(
				'title'		  => 'Move Up',
				'imageurl'	  => 'images/up.png',
				'script'      => 'sequenceUp'
			),
			array(
				'title'		  => 'Move Down',
				'imageurl'	  => 'images/down.png',
				'script'      => 'sequenceDown'
			),
			array(
				'title'		  => 'Set Title Divider',
				'imageurl'	  => 'images/appraisal.png',
				'script'      => 'setTitleDivider'
			)
		);
	$crud->columns = array(
			array(
				'name'       => 'pageid',
				'length' 	 => 6,
				'pk'		 => true,
				'showInView' => false,
				'editable'	 => false,
				'bind' 	 	 => false,
				'label' 	 => 'ID'
			),
			array(
				'name'       => 'label',
				'length' 	 => 60,
				'sortby'	 => true,
				'label' 	 => 'Application'
			),
			array(
				'name'       => 'pagename',
				'length' 	 => 50,
				'label' 	 => 'Page Name'
			),
			array(
				'name'       => 'type',
				'length' 	 => 20,
				'label' 	 => 'Page Type',
				'onchange'	 => 'typeChange',
				'type'       => 'COMBO',
				'options'    => array(
						array(
							'value'		=> 'P',
							'text'		=> 'PHP'
						),
						array(
							'value'		=> 'C',
							'text'		=> 'Content Managed'
						),
						array(
							'value'		=> 'D',
							'text'		=> 'Dynamic'
						)
					)
			),
			array(
				'name'       => 'menuitem',
				'length' 	 => 20,
				'bind'		 => false,
				'showInView' => false,
				'label' 	 => 'Add to menu',
				'type'       => 'COMBO',
				'options'    => array(
						array(
							'value'		=> 'Y',
							'text'		=> 'Yes'
						),
						array(
							'value'		=> 'N',
							'text'		=> 'No'
						),
						array(
							'value'		=> 'X',
							'text'		=> 'Mobile Only'
						)
					)
			)
		);
		
	$crud->run();
?>
