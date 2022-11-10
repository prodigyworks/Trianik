<?php
	require_once(__DIR__ . "/crud.php");
	require_once(__DIR__ . "/businessobjects/ClientscheduleClass.php");
	require_once(__DIR__ . "/businessobjects/ClientClass.php");
	
	class ClientCrud extends Crud {
		/**
		 * @var ClientscheduleClass
		 */
		public $clientschedule;
		
		public function preUpdateEvent($id) {			
			$this->clientschedule = new ClientscheduleClass();
			$this->clientschedule->loadRecord($id);
		}
		
		public function postInsertEvent($id) {
			try {
				SessionControllerClass::getDB()->beginTransaction();
				
				$schedule = new ClientscheduleClass();
				$schedule->loadRecord($id);
				$schedule->notifyCleanerIfChanged($this->clientschedule);
				
				SessionControllerClass::getDB()->commit();
				
			} catch (Exception $e) {
				SessionControllerClass::getDB()->rollBack();
			}
		}
		
		public function postUpdateEvent($id) {
			try {
				SessionControllerClass::getDB()->beginTransaction();
			
				$schedule = new ClientscheduleClass();
				$schedule->loadRecord($id);
				$schedule->notifyCleanerIfChanged($this->clientschedule);
				
				SessionControllerClass::getDB()->commit();
			
			} catch (Exception $e) {
				SessionControllerClass::getDB()->rollBack();
			}
		}
		
		/* Post script event. */
		public function postScriptEvent() {
?>
			var cleanerID = 0;
			var cleanerName = ""
			var cleanerTime = "";
			
			function preDeleteScriptEvent(id) {
				cleanerID = 0;
				
				businessObjectToJSon({
						classname: "ClientscheduleUIClass", 
						methodname: "load", 
						async: false,
						args: {
							id: id
						},
						success: function(data) {
							cleanerID = data.memberid;
							cleanerTime = data.weekday;
							cleanerName = data.name;
						}
					});
				
				return true;			
			}
			
			function postDeleteScriptEvent(id) {
				businessObjectToJSon({
						classname: "DiaryUIClass", 
						methodname: "scheduleChange", 
						async: false,
						args: {
							id: id,
							cleanerid: cleanerID,
							clientname: cleanerName,
							weekday: cleanerTime
						},
						success: function(data) {
						}
					});
			}
		
			function mode_onchange() {
				if ($("#begindate").val() != "") {
					var parts = $("#begindate").val().split('/');
					var date = new Date(parts[2], parts[1] - 1, parts[0]);

					$("#weekday").val(date.getDay());
				}
			}
<?php
		}
	}
	
	$crud = new ClientCrud();
	$crud->clientid = $_GET['id'];
	$crud->preDeleteScriptEvent = "preDeleteScriptEvent";
	$crud->postDeleteScriptEvent = "postDeleteScriptEvent";
	$crud->title = "Client Schedule";
	$crud->table = "{$_SESSION['DB_PREFIX']}clientschedule";
	$crud->sql = "SELECT A.*, B.name, C.fullname
				  FROM  {$_SESSION['DB_PREFIX']}clientschedule A
				  INNER JOIN {$_SESSION['DB_PREFIX']}client B
				  ON B.id = A.clientid
				  LEFT OUTER JOIN {$_SESSION['DB_PREFIX']}members C
				  ON C.member_id = A.memberid
				  WHERE A.clientid = " . $crud->clientid . "
				  ORDER BY A.weekday, A.starttime";
	$crud->columns = array(
			array(
				'name'       => 'id',
				'viewname'   => 'uniqueid',
				'length' 	 => 6,
				'showInView' => false,
				'filter'	 => false,
				'bind' 	 	 => false,
				'editable' 	 => false,
				'pk'		 => true,
				'label' 	 => 'ID'
			),
			array(
				'name'       => 'clientid',
				'datatype'	 => 'integer',
				'length' 	 => 6,
				'showInView' => false,
				'filter'	 => false,
				'editable' 	 => false,
				'default'	 => $crud->clientid,
				'label' 	 => 'Client'
			),
			array(
				'name'       => 'name',
				'length' 	 => 25,
				'bind'		 => false,
				'editable'	 => false,
				'label' 	 => 'Client'
			),
			array(
				'name'       => 'weekday',
				'length' 	 => 20,
				'onchange'	 => 'mode_onchange',
				'label' 	 => 'Weekday',
				'type'       => 'COMBO',
				'options'    => array(
						array(
							'value'		=> '0',
							'text'		=> 'Sunday'
						),
						array(
							'value'		=> '1',
							'text'		=> 'Monday'
						),
						array(
							'value'		=> '2',
							'text'		=> 'Tuesday'
						),
						array(
							'value'		=> '3',
							'text'		=> 'Wednesday'
						),
						array(
							'value'		=> '4',
							'text'		=> 'Thursday'
						),
						array(
							'value'		=> '5',
							'text'		=> 'Friday'
						),
						array(
							'value'		=> '6',
							'text'		=> 'Saturday'
						)
					)
			),
			array(
				'name'       => 'mode',
				'length' 	 => 20,
				'onchange'	 => 'mode_onchange',
				'label' 	 => 'Schedule',
				'type'       => 'COMBO',
				'options'    => array(
						array(
							'value'		=> 'O',
							'text'		=> 'One Off'
						),
						array(
							'value'		=> 'W',
							'text'		=> 'Weekly'
						),
						array(
							'value'		=> 'T',
							'text'		=> 'Two Weekly'
						),
						array(
							'value'		=> 'F',
							'text'		=> 'Four Weekly'
						)
					)
			),
			array(
				'name'       => 'begindate',
				'datatype'	 => 'date',
				'onchange'	 => 'mode_onchange',
				'length' 	 => 12,
				'label' 	 => 'Start From'
			),
			array(
				'name'       => 'canceldate',
				'datatype'	 => 'date',
				'required'	 => false,
				'length' 	 => 12,
				'label' 	 => 'End Date'
			),
			array(
				'name'       => 'starttime',
				'datatype'	 => 'time',
				'length' 	 => 12,
				'label' 	 => 'Start Time'
			),
			array(
				'name'       => 'endtime',
				'datatype'	 => 'time',
				'length' 	 => 12,
				'label' 	 => 'End Time'
			),
			array(
				'name'       => 'memberid',
				'type'       => 'DATACOMBO',
				'length' 	 => 18,
				'label' 	 => 'Default Cleaner',
				'table'		 => 'members',
				'required'	 => true,
				'table_id'	 => 'member_id',
				'alias'		 => 'fullname',
				'table_name' => 'fullname'
			)
		);

	$crud->run();
?>
