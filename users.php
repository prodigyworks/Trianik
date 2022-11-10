<?php
	require_once(__DIR__ . "/crud.php");
	require_once(__DIR__ . "/ui/ComboUIClass.php");
	require_once(__DIR__ . "/businessobjects/UserClass.php");
	
	function expire() {
		SessionControllerClass::getDB()->beginTransaction();
		
		$user = new UserClass();
		$user->loadRecord($_POST['expiredmemberid']);
		$user->deactivate();

		SessionControllerClass::getDB()->commit();
	}
	
	function live() {
		SessionControllerClass::getDB()->beginTransaction();
		
		$user = new UserClass();
		$user->loadRecord($_POST['expiredmemberid']);
		$user->activate();

		SessionControllerClass::getDB()->commit();
	}
	
	class UserCrud extends Crud {
	
		public function afterInsertRow() {
?>
			var status = rowData['status'];

			if (status == "Expired") {
				$(this).jqGrid('setRowData', rowid, false, { 'text-decoration': 'line-through', 'color': 'red' });
		   	}
<?php
		}

		public function postUpdateEvent($id) {
			$user = new UserClass();
			$user->loadRecord($id);
			/* Update forces fullname correction. */
			$user->updateRecord();
		}
		
		/* Post header event. */
		public function postHeaderEvent() {
?>
			<script src='js/jquery.picklists.js' type='text/javascript'></script>
			
			<div id="pwdDialog" class="modal">
				<table cellspacing=10>
					<tr>
						<td>
							<label>New Password</label>
						</td>
						<td>
							<input type="password" id="newpassword" />
						</td>
					</tr>
					<tr>
						<td>
							<label>Confirm Password</label>
						</td>
						<td>
							<input type="password" id="confirmnewpassword" />
						</td>
					</tr>
				</table>
			</div>
			<div id="roleDialog" class="modal">
				<form id="rolesForm" name="rolesForm" method="post">
					<input type="hidden" id="memberid" name="memberid" />
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
			var currentID = null;
			
			function fullName(node) {
				return (node.firstname + " " + node.lastname);
			}
			
			function changePassword(memberid) {
				currentID = memberid;
				
				$("#pwdDialog").dialog("open");
			}
			
			function checkClick(node) {
				if (node.status != "Yes") {
					$("#enablebutton").show();
					$("#disablebutton").hide();
					
				} else {
					$("#disablebutton").show();
					$("#enablebutton").hide();
				}				
			}
			
			$(document).ready(function() {
					$("#roles").pickList({
							removeText: 'Remove Role',
							addText: 'Add Role',
							testMode: false
						});
					
					$("#pwdDialog").dialog({
							autoOpen: false,
							modal: true,
							title: "Password",
							buttons: {
								Ok: function() {
									if ($("#newpassword").val() != $("#confirmnewpassword").val()) {
										pwAlert("Passwords do not match");
										return;
									}
									
									businessObjectToJSon({
											classname: "UserUIClass", 
											methodname: "changePassword", 
											args: {
												memberid: currentID,
												password: $("#newpassword").val()
											},
											success: function() {
												toastr.success("Password changed", "<?php echo SessionControllerClass::getSiteConfig()->getCompanyname(); ?>");
												
												$("#pwdDialog").dialog("close");
											}
										});
									
								},
								Cancel: function() {
									$(this).dialog("close");
								}
							}
						});
						
					$("#pwdDialog").dialog({
							autoOpen: false,
							modal: true,
							title: "Password",
							buttons: {
								Ok: function() {
									if ($("#newpassword").val() != $("#confirmnewpassword").val()) {
										pwAlert("Passwords do not match");
										return;
									}
									
									businessObjectToJSon({
											classname: "UserUIClass", 
											methodname: "changePassword", 
											args: {
												memberid: currentID,
												password: $("#newpassword").val()
											},
											success: function() {
												toastr.success("Password changed", "<?php echo SessionControllerClass::getSiteConfig()->getCompanyname(); ?>");
												
												$("#pwdDialog").dialog("close");
											}
										});
									
								},
								Cancel: function() {
									$(this).dialog("close");
								}
							}
						});
						
						
					$("#roleDialog").dialog({
							autoOpen: false,
							modal: true,
							width: "auto",
							title: "Roles",
							buttons: {
								"Save": function() {
									var roleArray = []; 
									var i = 0;
									
									$(".listpicker option").each(
											function(){ 
										  		roleArray[i++] = $(this).val(); 
											}
										);
										
									businessObjectToJSon({
											classname: "UserUIClass", 
											methodname: "saveRoles", 
											args: {
												memberid: currentID,
												roleid: roleArray
											},
											success: function() {
												toastr.success("Roles saved", "<?php echo SessionControllerClass::getSiteConfig()->getCompanyname(); ?>");
												
												$("#roleDialog").dialog("close");
											}
										});
								},
								Cancel: function() {
									$(this).dialog("close");
								}
							}
						});
				});
				
			function userRoles(memberid) {
				currentID = memberid;
				
				var node = businessObjectToJSon({
						classname: "UserUIClass", 
						methodname: "load", 
						args: {
							memberid: currentID
						}
					});
					
				$("option", ".listpicker").remove();  
				
				if (node.userroles != null) {
					var options = $(".listpicker").attr("options");
					
					for (i = 0; i < node.userroles.length; i++) {
						options[options.length] = new Option(
								node.userroles[i].roleid,
								node.userroles[i].roleid
							);  
					}
				}
				
				$("#roleDialog").dialog("open");
			}
			
			function changePassword(memberid) {
				currentID = memberid;
				
				$("#pwdDialog").dialog("open");
			}
				
			function expire(memberid) {
				post("editform", "expire", "submitframe", 
						{ 
							expiredmemberid: memberid
						}
					);
			}
				
			function live(memberid) {
				post("editform", "live", "submitframe", 
						{ 
							expiredmemberid: memberid
						}
					);
			}
<?php
		}
	}

	$crud = new UserCrud();
	$crud->messages = array(
			array('id'		  => 'expiredmemberid')
		);
	$crud->subapplications = array(
			array(
				'title'		  => 'User Roles',
				'imageurl'	  => 'images/user.png',
				'script' 	  => 'userRoles'
			),
			array(
				'title'		  => 'Expire',
				'imageurl'	  => 'images/cancel.png',
				'script' 	  => 'expire'
			),
			array(
				'title'		  => 'Live',
				'imageurl'	  => 'images/heart.png',
				'script' 	  => 'live'
			),
			array(
				'title'		  => 'Change Password',
				'imageurl'	  => 'images/lock.png',
				'script' 	  => 'changePassword'
			),
			array(
				'title'		  => 'Rota',
				'imageurl'	  => 'images/checkin.png',
				'application' => 'userrota.php'
			)
		);
	$crud->checkconstraints = array(
			array(
				'table'      => 'applicationtables',
				'column' 	 => 'memberid'
			),
			array(
				'table'      => 'applicationtables',
				'column' 	 => 'memberid'
			),
			array(
				'table'      => 'errors',
				'column' 	 => 'memberid'
			),
			array(
				'table'      => 'filter',
				'column' 	 => 'memberid'
			),
			array(
				'table'      => 'loginaudit',
				'column' 	 => 'memberid'
			),
			array(
				'table'      => 'userroles',
				'column' 	 => 'memberid'
			)
		);
	$crud->allowAdd = false;
	$crud->dialogwidth = 950;
	$crud->title = "Users";
	$crud->table = "{$_SESSION['DB_PREFIX']}members";
	
	$crud->sql = 
			"SELECT A.*
			 FROM {$_SESSION['DB_PREFIX']}members A
			 ORDER BY A.firstname, A.lastname";
			
	$crud->columns = array(
			array(
				'name'       => 'member_id',
				'length' 	 => 6,
				'showInView' => false,
				'bind' 	 	 => false,
				'filter'	 => false,
				'editable' 	 => false,
				'pk'		 => true,
				'label' 	 => 'ID'
			),
			array(
				'name'       => 'login',
				'length' 	 => 30,
				'label' 	 => 'Login ID'
			),
			array(
				'name'       => 'staffname',
				'type'		 => 'DERIVED',
				'length' 	 => 60,
				'bind'		 => false,
				'function'   => 'fullName',
				'sortcolumn' => 'A.firstname',
				'label' 	 => 'Name'
			),
			array(
				'name'       => 'firstname',
				'length' 	 => 30,
				'showInView' => false,
				'label' 	 => 'First Name'
			),
			array(
				'name'       => 'lastname',
				'length' 	 => 30,
				'showInView' => false,
				'label' 	 => 'Last Name'
			),
			array(
				'name'       => 'email',
				'length' 	 => 60,
				'label' 	 => 'Email'
			),
			array(
				'name'       => 'landline',
				'length' 	 => 13,
				'label' 	 => 'Land line'
			),
			array(
				'name'       => 'fax',
				'length' 	 => 13,
				'label' 	 => 'Fax'
			),
			array(
				'name'       => 'mobile',
				'length' 	 => 13,
				'label' 	 => 'Cell phone'
			),
			array(
				'name'       => 'status',
				'length' 	 => 30,
				'label' 	 => 'Status',
				'type'       => 'COMBO',
				'options'    => array(
						array(
							'value'		=> 'Y',
							'text'		=> 'Live'
						),
						array(
							'value'		=> 'N',
							'text'		=> 'Expired'
						)
					)
			),
			array(
				'name'       => 'imageid',
				'type'		 => 'IMAGE',
				'length' 	 => 64,
				'required'	 => false,
				'showInView' => false,
				'label' 	 => 'Image'
			),
			array(
				'name'       => 'title',
				'length'	 => 20,
				'label' 	 => 'Title'
			),
			array(
				'name'       => 'address',
				'type'		 => 'TEXTAREA',
				'showInView' => false,
				'filter'     => false,
				'label' 	 => 'Address'
			),
			array(
				'name'       => 'description',
				'type'		 => 'TEXTAREA',
				'showInView' => false,
				'filter'     => false,
				'label' 	 => 'Details'
			),
			array(
				'name'       => 'passwd',
				'type'		 => 'PASSWORD',
				'length' 	 => 30,
				'showInView' => false,
				'label' 	 => 'Password'
			),
			array(
				'name'       => 'cpassword',
				'type'		 => 'PASSWORD',
				'length' 	 => 30,
				'bind' 	 	 => false,
				'showInView' => false,
				'label' 	 => 'Confirm Password'
			)
		);
		
	$crud->run();
?>
