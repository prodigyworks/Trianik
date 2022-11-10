<?php
	require_once("crud.php");
	
	class ProductCrud extends Crud {
		public function postScriptEvent() {
?>
			function bookingReference(node) {
				return "SUP-" + padZero(node.id, 6);
			}
<?php
		}
		
		public function postInsertEvent($id) {
			sendRoleMessage("SUPPORT", "Support log created", "Support log SUP-" . sprintf("%06d", $id) . " has been created");
			
			if ($_POST['allocatedid'] != 0) {
				sendUserMessage($_POST['allocatedid'], "Support log created", "Support log SUP-" . sprintf("%06d", $id) . " has been allocated to you");
			}
		}
		
		public function postUpdateEvent($id) {
			if ($_POST['allocatedid'] != 0) {
				sendUserMessage($_POST['allocatedid'], "Support log created", "The allocatd Support log SUP-" . sprintf("%06d", $id) . " has been amended");
			}
		}
		
		public function postAddScriptEvent() {
?>
			$("#status").val("N");
			$("#takenbyid").val("<?php echo SessionControllerClass::getUser()->getMemberid(); ?>");
			$("#takenbyid").attr("readonly", true);
			$("#takendate").val("<?php echo date("d/m/Y"); ?>");
			$("#takendate").attr("readonly", true);
<?php
			if (SessionControllerClass::getUser()->hasRole("CUSTOMER")) {
?>
			$("#customerid").val("<?php echo SessionControllerClass::getUser()->getCustomerid(); ?>");
			$("#customerid").attr("disabled", true);
<?php
			}
		}
		
		public function afterInsertRow() {
?>
			var status = rowData['status'];

			if (status == "Completed") {
				$(this).jqGrid('setRowData', rowid, false, { color: '#0000FF' });
				
		   	} else if (status == "In Progress") {
				$(this).jqGrid('setRowData', rowid, false, { color: '#CC00FF' });
				
		   	} else if (status == "Feedback Required") {
				$(this).jqGrid('setRowData', rowid, false, { color: '#FF0000' });
				
		   	} else if (status == "Customer Testing") {
				$(this).jqGrid('setRowData', rowid, false, { color: '#00AA00' });
		   	}
<?php
		}
	}
	
	$crud = new ProductCrud();
	$crud->dialogwidth = 1000;
	$crud->document = array(
			'primaryidname'		=> 'supportid',
			'tablename'			=> 'supportdocs'
		);
	$crud->title = "Support";
	$crud->table = "{$_SESSION['DB_PREFIX']}support";

	if (SessionControllerClass::getUser()->hasRole("CUSTOMER")) {
		$customerid = SessionControllerClass::getUser()->getCustomerid();
		$crud->sql = "SELECT A.*, 
					  B.fullname AS allocatedname,
					  C.fullname AS takenbyname, 
					  D.name
					  FROM  {$_SESSION['DB_PREFIX']}support A
					  LEFT OUTER JOIN {$_SESSION['DB_PREFIX']}members B
					  ON B.member_id = A.allocatedid
					  LEFT OUTER JOIN {$_SESSION['DB_PREFIX']}members C
					  ON C.member_id = A.takenbyid
					  LEFT OUTER JOIN {$_SESSION['DB_PREFIX']}customer D
					  ON D.id = A.customerid
					  WHERE A.customerid = $customerid
					  ORDER BY A.id DESC";
		
	} else {
		$crud->sql = "SELECT A.*, 
					  B.fullname AS allocatedname,
					  C.fullname AS takenbyname, 
					  D.name
					  FROM  {$_SESSION['DB_PREFIX']}support A
					  LEFT OUTER JOIN {$_SESSION['DB_PREFIX']}members B
					  ON B.member_id = A.allocatedid
					  LEFT OUTER JOIN {$_SESSION['DB_PREFIX']}members C
					  ON C.member_id = A.takenbyid
					  LEFT OUTER JOIN {$_SESSION['DB_PREFIX']}customer D
					  ON D.id = A.customerid
					  ORDER BY A.id DESC";
	}
	
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
				'name'       => 'bookingref',
				'function'   => 'bookingReference',
				'sortcolumn' => 'A.id',
				'type'		 => 'DERIVED',
				'length' 	 => 17,
				'editable'	 => false,
				'bind' 	 	 => false,
				'filter'	 => false,
				'label' 	 => 'Ticket Number'
			),
			array(
				'name'       => 'customerid',
				'type'       => 'DATACOMBO',
				'length' 	 => 20,
				'label' 	 => 'Customer',
				'table'		 => 'customer',
				'required'	 => true,
				'default'	 => SessionControllerClass::getUser()->hasRole("CUSTOMER") ? SessionControllerClass::getUser()->getCustomerid() : 0,
				'table_id'	 => 'id',
				'alias'		 => 'name',
				'table_name' => 'name'
			),
			array(
				'name'       => 'status',
				'length' 	 => 17,
				'label' 	 => 'Status',
				'type'       => 'COMBO',
				'options'    => array(
						array(
							'value'		=> 'N',
							'text'		=> 'New'
						),
						array(
							'value'		=> 'I',
							'text'		=> 'In Progress'
						),
						array(
							'value'		=> 'F',
							'text'		=> 'Feedback Required'
						),
						array(
							'value'		=> 'W',
							'text'		=> 'Customer Testing'
						),
						array(
							'value'		=> 'C',
							'text'		=> 'Completed'
						)
					)
			),
			array(
				'name'       => 'takenbyid',
				'type'       => 'DATACOMBO',
				'length' 	 => 25,
				'label' 	 => 'Created By',
				'table'		 => 'members',
				'required'	 => true,
				'table_id'	 => 'member_id',
				'alias'		 => 'takenbyname',
				'table_name' => 'fullname'
			),
			array(
				'name'       => 'takendate',
				'length' 	 => 15,
				'datatype'	 => 'date',
				'label' 	 => 'Created Date'
			),			
			array(
				'name'       => 'allocatedid',
				'type'       => 'DATACOMBO',
				'length' 	 => 25,
				'required'	 => false,
				'label' 	 => 'Allocated To',
				'table'		 => 'members',
				'table_id'	 => 'member_id',
				'alias'		 => 'allocatedname',
				'table_name' => 'fullname'
			),
			array(
				'name'       => 'allocateddate',
				'length' 	 => 15,
				'datatype'	 => 'date',
				'required'	 => false,
				'label' 	 => 'Allocated Date'
			),			
			array(
				'name'       => 'estimatedcompletiondate',
				'length' 	 => 20,
				'required'	 => false,
				'datatype'	 => 'date',
				'label' 	 => 'Estimated Completion Date'
			),			
			array(
				'name'       => 'reference',
				'length' 	 => 30,
				'label' 	 => 'Reference'
			),			
			array(
				'name'       => 'description',
				'length' 	 => 20,
				'type'		 => 'TEXTAREA',
				'showInView' => false,
				'label' 	 => 'Description'
			)
		);
		
	$crud->run();
?>
