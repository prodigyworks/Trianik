<?php
	require_once("crud.php");
	
	class ClientCrud extends Crud {
		
	}
	
	$clientid = $_GET['id'];
	
	$crud = new ClientCrud();
	$crud->title = "Client Schedule";
	$crud->table = "{$_SESSION['DB_PREFIX']}clientschedule";
	$crud->sql = "SELECT A.*, B.name, C.fullname
				  FROM  {$_SESSION['DB_PREFIX']}clientschedule A
				  INNER JOIN {$_SESSION['DB_PREFIX']}client B
				  ON B.id = A.clientid
				  LEFT OUTER JOIN {$_SESSION['DB_PREFIX']}members C
				  ON C.member_id = A.memberid
				  WHERE A.clientid = $clientid
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
				'default'	 => $clientid,
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
				'label' 	 => 'Schedule',
				'type'       => 'COMBO',
				'options'    => array(
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
