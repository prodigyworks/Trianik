<?php
	require_once(__DIR__ . "/crud.php");
	require_once(__DIR__ . "/businessobjects/AbsenceClass.php");
	
	class AbsenceCrud extends Crud {
		
		public function postAddScriptEvent() {
?>
			var myDate = new Date(); 
			var prettyDate =
					padZero(myDate.getDate()) + '/' +         
				    padZero((myDate.getMonth() + 1)) + '/' + 
					myDate.getFullYear(); 
					 
			$("#memberid").val("<?php echo SessionControllerClass::getUser()->getMember_id(); ?>").trigger("change");
			$("#requesteddate").val(prettyDate).trigger("change");
			$("#startdate").val(prettyDate).trigger("change");
			$("#enddate").val(prettyDate).trigger("change");
			$("#startdate_half").attr("checked", true).trigger("change");
			$("#enddate_half").attr("checked", true).trigger("change");
<?php
		}
		
		public function postHeaderEvent() {
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
								Ok: function() {
									tinyMCE.triggerSave();
									$(this).dialog("close");
									
									post("editform", "rejectAbsence", "submitframe", 
											{ 
												absenceid: currentID, 
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
									Ok: function() {
										$(this).dialog("close");
									}
								}
							});
					}
				);
				
			function statusFormatter(el, cval, opts) {
				if (el == "Rejected") {
					return "<a style='color:red' href='javascript: viewReason(" + opts.uniqueid + ")'>" + el + "</a>";
				}
				
				return el;
		    } 	
				
			function viewReason(id) {
				businessObjectToJSon({
							classname: "AbsenceUIClass", 
							methodname: "load", 
							args: {
								id: id
							},
							success: function(data) {
								$('#reasondiv').html(data.reason); 
								$("#reasondivdialog").dialog("open");
							}
						});
			}
				
				
			/* Full name callback. */
			function fullName(node) {
				return (node.firstname + " " + node.lastname);
			}
			
			function calculateDuration() {
				var startDateStr = $("#startdate").val();
				var endDateStr = $("#enddate").val();
				
				var startDate = new Date(startDateStr.substring(6, 10), (parseFloat(startDateStr.substring(3, 5)) - 1), startDateStr.substring(0, 2));
				var endDate = new Date(endDateStr.substring(6, 10), (parseFloat(endDateStr.substring(3, 5)) - 1), endDateStr.substring(0, 2));
				var days = workingDaysBetweenDates(startDate, endDate);
				
				if (days > 0) {
					if ($("#startdate_half").attr("checked") == false) {
						if (startDate.getDay() > 0 && startDate.getDay() < 6) {
							days -= 0.5;
						}
					}
					
					if ($("#enddate_half").attr("checked") == false) {
						if (endDate.getDay() > 0 && endDate.getDay() < 6) {
							days -= 0.5;
						}
					}
				}
				
				$("#daystaken").val(days);
			}
			
			function checkStatus(node) {
				if (node.status != "Pending" && node.status != "Rejected") {
					$("#approvebutton").attr("disabled", true);
					$("#rejectbutton").attr("disabled", true);
				}
			}
			
			function daysRemaining(node) {
				return node.absenceentitlement - node.daysremaining;
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
			
			$this->title = "Absences";
			$this->table = "{$_SESSION['DB_PREFIX']}absence";
			$this->dialogwidth = 500;
			$this->onClickCallback = "checkStatus";
	
			$this->sql = 
				"SELECT A.*, 
				 B.firstname, B.lastname , B.fullname
				 FROM {$_SESSION['DB_PREFIX']}absence A 
				 INNER JOIN {$_SESSION['DB_PREFIX']}members B 
				 ON B.member_id = A.memberid";
			
			$this->messages = array(
					array('id'		  => 'absenceid'),
					array('id'		  => 'reasonnotes')
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
						'name'       => 'requestedbyname',
						'type'		 => 'DERIVED',
						'length' 	 => 30,
						'bind'		 => false,
						'editable' 	 => false,
						'filter'	 => false,
						'sortcolumn' => 'B.firstname',
						'function'   => 'fullName',
						'label' 	 => 'Employee'
					),
					array(
							'name'       => 'memberid',
							'type'       => 'DATACOMBO',
							'length' 	 => 18,
							'label' 	 => 'Employee',
							'table'		 => 'members',
							'required'	 => true,
							'table_id'	 => 'member_id',
							'alias'		 => 'fullname',
							'table_name' => 'fullname'
					),
					array(
						'name'       => 'absencetype',
						'length' 	 => 30,
						'label' 	 => 'Type',
						'type'       => 'COMBO',
						'options'    => array(
								array(
									'value'		=> 'Unauthorised',
									'text'		=> 'Unauthorised'
								),
								array(
									'value'		=> 'Authorised',
									'text'		=> 'Authorised'
								),
								array(
									'value'		=> 'Sick',
									'text'		=> 'Sick'
								),
								array(
									'value'		=> 'Family Matter',
									'text'		=> 'Family Matter'
								),
								array(
									'value'		=> 'Not In',
									'text'		=> 'Not In'
								),
								array(
									'value'		=> 'Leaver',
									'text'		=> 'Leaver'
								)
							)
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
					)
				);
		}
	}
	
	$crud = new AbsenceCrud();
	$crud->run();
?>