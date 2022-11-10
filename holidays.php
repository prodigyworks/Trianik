<?php
require_once(__DIR__ . "/crud.php");
require_once(__DIR__ . "/businessobjects/HolidayAdminClass.php");
require_once(__DIR__ . "/businessobjects/HolidayClass.php");
require_once(__DIR__ . "/businessobjects/RoleClass.php");
require_once(__DIR__ . "/businessobjects/UserClass.php");

class HolidayCrud extends Crud {

	public function postAddScriptEvent() {
		?>
			var myDate = new Date(); 
			var prettyDate =
					padZero(myDate.getDate()) + '/' +         
				    padZero((myDate.getMonth() + 1)) + '/' + 
					myDate.getFullYear(); 
					 
			$("#requesteddate").val(prettyDate).trigger("change");
			$("#startdate").val(prettyDate).trigger("change");
			$("#enddate").val(prettyDate).trigger("change");
			$("#startdate_half").attr("checked", true).trigger("change");
			$("#enddate_half").attr("checked", true).trigger("change");
<?php
		}
		
		/* Pre script event. */
		public function preScriptEvent() {
?>
			var currentID = 0;
<?php
		}
		
		public function postInsertEvent($id) {
			$holiday = new HolidayClass();
			$holiday->loadRecord($id);
			$holiday->updateRecord();
		}
		
		public function postHeaderEvent() {
			createConfirmDialog("confirmapprovaldialog", "Confirm approval ?", "approve");
			
?>
				<div id="reasondialog" class="modal">
					<label>Reason</label>
					<textarea id="reason" name="reason" class="tinyMCE" style='width:770px; height: 300px'></textarea>
				</div>
				<div id="reasondivdialog" class="modal">
					<h5>Reason</h5>
					<br>
					<div id="reasondiv" style='width:770px; height: 290px; border: 1px solid black'></div>
				</div>
<?php
		}
		
		public function postScriptEvent() {
?>
			$(document).ready(
					function() {
					$("#reasondialog").dialog({
							modal: true,
							autoOpen: false,
							title: "Reason for rejection",
							width: 810,
							height: 420,
							buttons: {
								"Reject": function() {
									tinyMCE.triggerSave();
									$(this).dialog("close");
									
									post("editform", "rejectHoliday", "submitframe", 
											{ 
												holidayid: currentID, 
												reasonnotes: $("#reason").val() 
											}
										);
								},
								Cancel: function() {
									$(this).dialog("close");
								}
							}
						});
						
						$("#reasondivdialog").dialog({
								modal: true,
								autoOpen: false,
								title: "Reason for rejection",
								width: 810,
								height: 420,
								buttons: {
									"Close": function() {
										$(this).dialog("close");
									}
								}
							});
					}
				);
				
			function statusFormatter(el, cval, opts) {
				if (el == "Rejected") {
					return "<a style='color:blue' href='javascript: viewReason(" + opts.uniqueid + ")'>" + el + "</a>";
				}
				
				return el;
		    } 	
				
			function viewReason(id) {
				businessObjectToJSon({
					classname: "HolidayUIClass", 
					methodname: "load", 
					args: {
						id: id
					},
					success: function(node) {
						$('#reasondiv').html(node.reason); 
						$("#reasondivdialog").dialog("open");
					}
				});
			}
				
			function approveHoliday(crudID) {
				currentID = crudID;
				
				$("#confirmapprovaldialog .confirmdialogbody").html("You are about to approve this holiday.<br>Are you sure ?");
				$("#confirmapprovaldialog").dialog("open");
			}
			
			function approve() {
				$("#confirmapprovaldialog").dialog("close");
				
				post("editform", "approveHoliday", "submitframe", { holidayid: currentID });
			}
			
			function rejectHoliday(crudID) {
				currentID = crudID;
				
				$("#reasondialog").dialog("open");
			}
			
			function calculateDuration() {
				businessObjectToJSon({
					classname: "BankholidayUIClass", 
					methodname: "workingdays", 
					args: {
						startdate: dateToYMD($("#startdate").val()),
						startdate_half: $("#startdate_half").attr("checked") ? 0 : 1,
						enddate: dateToYMD($("#enddate").val()),
						enddate_half: $("#enddate_half").attr("checked") ? 0 : 1
					},
					success: function(node) {
						days = node.count;
						
						$("#daystaken").val(days);
					}
				});
			}
			
			function checkStatus(node) {
				if (node.status != "Pending" && node.status != "Rejected") {
					$("#approvebutton").attr("disabled", true);
					$("#rejectbutton").attr("disabled", true);
				}
			}
			
			function daysRemaining(node) {
				return node.holidayentitlement - node.daysremaining;
			}
			
			function duration(node) {
				return node.daystaken;
			}
			
			function statusName(node) {
				var startDate = new Date(node.startdate.substring(6, 10), (parseFloat(node.startdate.substring(3, 5)) - 1), node.startdate.substring(0, 2));
				var now = new Date();

				if (node.rejectedby != null) {
					return "Rejected";
					
				} else if (startDate.getTime() <= now.getTime()) {
					if (node.acceptedby != null) {
						return "Taken";
						
					} else {
						return "Pending";
					}
				
				} else if (node.acceptedby != null) {
					return "Accepted";
					
				} else {
					return "Pending";
				}
			}
<?php			
		}
		
		function __construct() {
			parent::__construct();
			
			$this->title = "Holidays";
			$this->table = "{$_SESSION['DB_PREFIX']}holiday";
			$this->dialogwidth = 500;
			$this->onClickCallback = "checkStatus";
			
			$holidayClass = new HolidayAdminClass();
			
			if (! SessionControllerClass::getUser()->hasRole("ADMIN")) {
				$memberid = SessionControllerClass::getUser()->getMemberid();
				
				$this->sql = 
					"SELECT A.*, 
					 B.holidayentitlement,
					 B.fullname, 
					 (
					 	SELECT SUM(D.daystaken) 
					 	FROM {$_SESSION['DB_PREFIX']}holiday D 
						WHERE D.startdate >= '{$holidayClass->getStart()}'
					  	AND   D.startdate <  '{$holidayClass->getEnd()}'
					 	AND D.memberid = A.memberid 
					 	AND D.acceptedby IS NOT NULL
					 ) AS daysremaining 
					 FROM {$_SESSION['DB_PREFIX']}holiday A 
					 INNER JOIN {$_SESSION['DB_PREFIX']}members B 
					 ON B.member_id = A.memberid 
					 WHERE B.member_id = $memberid
					 ORDER BY A.startdate DESC";
				
			} else {
				$this->sql = 
					"SELECT A.*, 
					 B.holidayentitlement,
					 B.fullname, 
					 (
					 	SELECT SUM(D.daystaken) 
					 	FROM {$_SESSION['DB_PREFIX']}holiday D 
						WHERE D.startdate >= '{$holidayClass->getStart()}'
					  	AND   D.startdate <  '{$holidayClass->getEnd()}'
					 	AND D.memberid = A.memberid 
					 	AND D.acceptedby IS NOT NULL
					 ) AS daysremaining 
					 FROM {$_SESSION['DB_PREFIX']}holiday A 
					 INNER JOIN {$_SESSION['DB_PREFIX']}members B 
					 ON B.member_id = A.memberid
					 ORDER BY A.startdate DESC";
			}
			
			$this->messages = array(
					array('id'		  => 'holidayid'),
					array('id'		  => 'reasonnotes')
				);
			$this->subapplications = array(
					array(
						'id'		  => 'approvebutton',
						'title'		  => 'Approve',
						'imageurl'	  => 'images/approve.png',
						'script' 	  => 'approveHoliday'
					),
					array(
						'id'		  => 'rejectbutton',
						'title'		  => 'Reject',
						'imageurl'	  => 'images/cancel.png',
						'script' 	  => 'rejectHoliday'
					)
				);
				
			$this->columns = array(
					array(
						'name'       => 'id',
						'length' 	 => 6,
						'pk'		 => true,
						'showInView' => false,
						'editable'	 => false,
						'bind' 	 	 => false,
						'filter'	 => false,
						'label' 	 => 'ID'
					),
					array(
						'name'       => 'memberid',
						'type'       => 'DATACOMBO',
						'length' 	 => 40,
						'label' 	 => 'Staff Member',
						'table'		 => 'members',
						'required'	 => true,
						'table_id'	 => 'member_id',
						'alias'		 => 'fullname',
						'table_name' => 'fullname'
					),
					array(
						'name'       => 'remaining',
						'type'		 => 'DERIVED',
						'length' 	 => 12,
						'filter'	 => false,
						'bind'		 => false,
						'editable' 	 => false,
						'function'   => 'daysRemaining',
						'align'		 => 'center',
						'label' 	 => 'Days Remainings'
					),
					array(
						'name'       => 'requesteddate',
						'datatype'	 => 'date',
						'length' 	 => 10,
						'filter'	 => false,
						'readonly'	 => true,
						'label' 	 => 'Request Date'
					),
					array(
						'name'       => 'startdate',
						'filter'	 => false,
						'datatype'	 => 'date',
						'associatedcolumns' => 
							array(
								'startdate_half'
							),
						'length' 	 => 15,
						'onchange'	 => 'calculateDuration',
						'label' 	 => 'Start Date'
					),
					array(
						'name'       => 'startdate_half',
						'type'	 	 => 'CHECKBOX',
						'showInView' => false,
						'filter'	 => false,
						'length' 	 => 15,
						'onchange'	 => 'calculateDuration',
						'label' 	 => 'Full Day'
					),
					array(
						'name'       => 'enddate',
						'filter'	 => false,
						'datatype'	 => 'date',
						'associatedcolumns' => 
							array(
								'enddate_half'
							),
						'length' 	 => 15,
						'onchange'	 => 'calculateDuration',
						'label' 	 => 'End Date'
					),
					array(
						'name'       => 'enddate_half',
						'filter'	 => false,
						'type'	 	 => 'CHECKBOX',
						'showInView' => false,
						'length' 	 => 15,
						'onchange'	 => 'calculateDuration',
						'label' 	 => 'Full Day'
					),
					array(
						'name'       => 'daystaken',
						'filter'	 => false,
						'align'	 	 => 'center',
						'length' 	 => 15,
						'readonly'	 => true,
						'required'	 => false,
						'label' 	 => 'Duration'
					),
					array(
						'name'       => 'status',
						'filter'	 => false,
						'type'		 => 'DERIVED',
						'length' 	 => 30,
						'bind'		 => false,
						'editable' 	 => false,
						'formatter'	 => 'statusFormatter',
						'function'   => 'statusName',
						'label' 	 => 'Status'
					)
				);
		}
	}
	
	function approveHoliday() {
		try {
			SessionControllerClass::getDB()->beginTransaction();
			
			$holiday = new HolidayClass();
			$holiday->loadRecord($_POST['holidayid']);
			$holiday->approve();
			
			SessionControllerClass::getDB()->commit();
				
		} catch (Exception $e) {
			SessionControllerClass::getDB()->rollBack();
		}
	}
	
	function rejectHoliday() {
		try {
			SessionControllerClass::getDB()->beginTransaction();
				
			$holiday = new HolidayClass();
			$holiday->loadRecord($_POST['holidayid']);
			$holiday->reject($_POST['reasonnotes']);
				
			SessionControllerClass::getDB()->commit();
		
		} catch (Exception $e) {
			SessionControllerClass::getDB()->rollBack();
		}
	}

	$crud = new HolidayCrud();
	$crud->run();
?>