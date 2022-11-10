<?php
	require_once(__DIR__ . "/crud.php");
	require_once(__DIR__ . "/ui/ComboUIClass.php");
	
	class RoleCrud extends Crud {
		
		/* Post header event. */
		public function postHeaderEvent() {
?>
			<script src='js/jquery.picklists.js' type='text/javascript'></script>
			
			<div id="roleDialog" class="modal">
				<form id="membersForm" name="membersForm" method="post">
					<input type="hidden" id="roleid" name="roleid" />
					<input type="hidden" id="rolecmd" name="rolecmd" value="X" />
					<select class="listpicker" name="members[]" multiple="true" id="members" >
<?php 
					    ComboUIClass::getInstance()
						    ->setValue("member_id")
						    ->setName("fullname")
						    ->setTable("members")
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
			var currentID;
			
			$(document).ready(function() {
					$("#members").pickList({
							removeText: 'Remove Member',
							addText: 'Add Member',
							testMode: false
						});
					
					$("#roleDialog").dialog({
							autoOpen: false,
							modal: true,
							width: "auto",
							title: "Users",
							buttons: {
								"Save": function() {
									var userArray = []; 
									var i = 0;
									
									$(".listpicker option").each(
											function(){ 
										  		userArray[i++] = $(this).val(); 
											}
										);
										
									businessObjectToJSon({
											classname: "RoleUIClass", 
											methodname: "saveUserRoles", 
											args: {
												roleid: currentID,
												memberid: userArray
											}
										});
										
									$(this).dialog("close");
								},
								Cancel: function() {
									$(this).dialog("close");
								}
							}
						});
				});
				
			function userRoles(roleid) {
				currentID = roleid;
				
				var node = businessObjectToJSon({
						classname: "RoleUIClass", 
						methodname: "load", 
						args: {
							roleid: currentID
						}
					});
								
				$("option", ".listpicker").remove();  
				
				if (node.userroles != null) {
					var options = $(".listpicker").attr("options");
					
					for (i = 0; i < node.userroles.length; i++) {
						options[options.length] = new Option(
								node.userroles[i].user.fullname,
								node.userroles[i].user.memberid
							);  
					}
				}
				
				$("#roleDialog").dialog("open");
			}
<?php
		}
	}
	
	$crud = new RoleCrud();
	$crud->dialogwidth = 900;
	$crud->title = "Roles";
	$crud->table = "{$_SESSION['DB_PREFIX']}roles";
	$crud->sql = "SELECT A.*, B.label
				  FROM {$_SESSION['DB_PREFIX']}roles A
				  LEFT OUTER JOIN {$_SESSION['DB_PREFIX']}pages B
				  ON B.pageid = A.defaultpageid
				  ORDER BY A.roleid";
	$crud->subapplications = array(
			array(
				'title'		  => 'User Roles',
				'imageurl'	  => 'images/user.png',
				'script' 	  => 'userRoles'
			)
		);
	$crud->columns = array(
			array(
				'name'       => 'id',
				'length' 	 => 20,
				'pk'		 => true,
				'bind'		 => false,
				'editable'	 => false,
				'showInView' => false,
				'label' 	 => 'ID'
			),
			array(
				'name'       => 'roleid',
				'length' 	 => 40,
				'label' 	 => 'Role'
			),
			array(
				'name'       => 'priority',
				'length' 	 => 10,
				'align'		 => 'right',
				'label' 	 => 'Priority'
			),
			array(
				'name'       => 'defaultpageid',
				'type'       => 'DATACOMBO',
				'length' 	 => 20,
				'label' 	 => 'Default Page',
				'table'		 => 'pages',
				'table_id'	 => 'pageid',
				'showInVIew' => false,
				'alias'		 => 'label',
				'required'	 => false,
				'table_name' => 'label'
			),
			array(
				'name'       => 'description',
				'length' 	 => 120,
				'label' 	 => 'Usage'
			),
			array(
				'name'       => 'systemrole',
				'length' 	 => 17,
				'label' 	 => 'System Role',
				'type'       => 'COMBO',
				'options'    => array(
						array(
							'value'		=> 'Y',
							'text'		=> 'Yes'
						),
						array(
							'value'		=> 'N',
							'text'		=> 'No'
						)
					)
			)
		);
		
	$crud->run();
?>
