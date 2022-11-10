<?php
	require_once(__DIR__ . "/crud.php");
	require_once(__DIR__ . "/ui/ComboUIClass.php");
	require_once(__DIR__ . "/businessobjects/ApplicationActionRoleClass.php");
	
	class ActionEdit extends Crud {
		
		/* Pre command event. */
		public function preCommandEvent() {
			if (isset($_POST['rolecmd'])) {
				if (isset($_POST['roles'])) {
					$counter = count($_POST['roles']);
		
				} else {
					$counter = 0;
				}
				
				$actionid = $_POST['actionid'];
				
				/* start transaction */
				SessionControllerClass::getDB()->beginTransaction();
				
				try {
					/* Remove previous records. */
					ApplicationActionRoleClass::deleteRecordsByActionid($actionid);
			
					for ($i = 0; $i < $counter; $i++) {
						$roleid = $_POST['roles'][$i];
						
						$action = new ApplicationActionRoleClass();
						$action->setActionid($actionid);
						$action->setRoleid($roleid);
						$action->insertRecord();
					}
					
					SessionControllerClass::getDB()->commit();

				} catch (Exception $e) {
					SessionControllerClass::getDB()->rollBack();
				}
			} 
		}

		/* Post header event. */
		public function postHeaderEvent() {
?>
			<script src='js/jquery.picklists.js' type='text/javascript'></script>
			
			<div id="roleDialog" class="modal">
				<form id="rolesForm" name="rolesForm" method="post">
					<input type="hidden" id="actionid" name="actionid" />
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
			
			$(document).ready(function() {
					$("#roles").pickList({
							removeText: 'Remove Role',
							addText: 'Add Role',
							testMode: false
						});
					
					$("#roleDialog").dialog({
							autoOpen: false,
							modal: true,
							width: 800,
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
				});
				
			function actionRoles(actionid) {
				businessObjectToJSon({
						classname: "ApplicationActionRoleUIClass", 
						methodname: "loadByActionID", 
						datatype: "html",
						args: {
							actionid: actionid
						},
						success: function(data) {
							$("#roles").html(data);
							
							$("#actionid").val(actionid);
							$("#roleDialog").dialog("open");
						}
					});
			}
<?php
		}
	}
		
	$crud = new ActionEdit();
	$crud->title = "Actions";
	$crud->table = "{$_SESSION['DB_PREFIX']}applicationactions";
	$crud->allowAdd = false;
	
	if (isset($_GET['id'])) {
		$crud->sql = "SELECT * 
					  FROM {$_SESSION['DB_PREFIX']}applicationactions 
					  WHERE pageid = {$_GET['id']}
					  ORDER BY id";
		
	} else {
		$crud->sql = "SELECT * 
					  FROM {$_SESSION['DB_PREFIX']}applicationactions 
					  ORDER BY id";
	}
	
	$crud->subapplications = array(
			array(
				'title'		  => 'User Roles',
				'imageurl'	  => 'images/user.png',
				'script' 	  => 'actionRoles'
			)
		);
	$crud->columns = array(
			array(
				'name'       => 'id',
				'length' 	 => 6,
				'pk'		 => true,
				'showInView' => false,
				'bind' 	 	 => false,
				'editable' 	 => false,
				'label' 	 => 'ID'
			),
			array(
				'name'       => 'pageid',
				'length' 	 => 6,
				'parentid'	 => true,
				'editable'   => false,
				'showInView' => false,
				'label' 	 => 'Page ID'
			),
			array(
				'name'       => 'description',
				'length' 	 => 60,
				'sortby'	 => true,
				'label' 	 => 'Description'
			)
		);
		
	$crud->run();
?>
