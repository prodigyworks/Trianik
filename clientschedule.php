<?php
	require_once("crud.php");
	
	class ClientCrud extends Crud {
		public $clientid;
		
		private function getWeekDay($weekday) {
			if ($weekday == 0) return "Sunday";
			if ($weekday == 1) return "Monday";
			if ($weekday == 2) return "Tuesday";
			if ($weekday == 3) return "Wednesday";
			if ($weekday == 4) return "Thursday";
			if ($weekday == 5) return "Friday";
			if ($weekday == 6) return "Saturday";
			
			return "N/A";
		}
		
		public function postInsertEvent() {
			$this->notifyCleaner(mysql_insert_id());
		}
		
		public function postUpdateEvent($id) {
			$this->notifyCleaner($id);
		}
		
		public function notifyCleaner($id) {
			$sql = "SELECT A.name AS clientname
					FROM {$_SESSION['DB_PREFIX']}client A
					WHERE id = " . $this->clientid;
			$result = mysql_query($sql);

			if ($result) {
				while (($member = mysql_fetch_assoc($result))) {
					$clientname = $member['clientname'];
					$lines = "Shift allocated to you on " . $this->getWeekDay($_POST['weekday']) . " " . $_POST['starttime'] . "-" . $_POST['endtime'] . " for $clientname\n";
					$memberid = $_POST['memberid'];
	    			
	    			sendUserMessage($memberid, "Work Allocation", $lines);
	    			
	    			$sql = "DELETE FROM {$_SESSION['DB_PREFIX']}diary 
	    					WHERE scheduleid = $id
	    					AND status = 'U'";
	    			$itemresult = mysql_query($sql);
	    			
	    			if (! $itemresult) {
	    				logError($sql . " - " . mysql_error());
	    			}
				}
			}
		}
		
		/* Post script event. */
		public function postScriptEvent() {
?>
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
