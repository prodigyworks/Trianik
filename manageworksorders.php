<?php
	require_once("crud.php");
	
	class ProductCrud extends Crud {
		public function postScriptEvent() {
?>
			function rateunit_onchange() {
				$("#rateunit").attr("readonly", false);
				$("#totalcost").attr("readonly", false);
				$("#unitprice").attr("readonly", false);
				
				if ($("#ratemode").val() == "N") {
					$("#rateunit").val("0");
					$("#unitprice").val("0.00");
					$("#totalcost").val("0.00");
					
					$("#rateunit").attr("readonly", true);
					$("#totalcost").attr("readonly", true);
					$("#unitprice").attr("readonly", true);
				
				} else if ($("#ratemode").val() == "F") {
					$("#rateunit").val("1");
					$("#rateunit").attr("readonly", true);
					$("#totalcost").attr("readonly", true);
				 
					calculate_cost();
					
				} else if ($("#ratemode").val() == "H") {
					$("#unitprice").val("30.00");
				 
					calculate_cost();
						
				} else if ($("#ratemode").val() == "D") {
					$("#unitprice").val("240.00");
				 
					calculate_cost();
				}
			}
			
			function calculate_cost() {
				$("#totalcost").val(
						new Number(
								parseFloat($("#unitprice").val()) *
								parseInt($("#rateunit").val())
							).toFixed(2)
					);
			}

			function bookingReference(node) {
				return "WON-" + padZero(node.id, 6);
			}
<?php
		}
		
		public function postEditScriptEvent() {
?>
			$("#ratemode").trigger("change");
<?php
		}
		
		public function postAddScriptEvent() {
?>
			$("#status").val("N");
			$("#takenbyid").val("<?php echo SessionControllerClass::getUser()->getMemberid(); ?>");
			$("#takendate").val("<?php echo date("d/m/Y"); ?>");
			$("#unitprice").val("0.00");
			$("#rateunit").val("0.00");
			$("#totalcost").val("0.00");
<?php
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
			'primaryidname'		=> 'worksorderid',
			'tablename'			=> 'worksorderdocs'
		);
	$crud->title = "Works Orders";
	$crud->table = "{$_SESSION['DB_PREFIX']}worksorder";

	if (SessionControllerClass::getUser()->hasRole("CUSTOMER")) {
		$customerid = SessionControllerClass::getUser()->getCustomerid();
		$crud->sql = "SELECT A.*,
				  B.fullname AS allocatedname,
				  C.fullname AS takenbyname,
				  D.name
				  FROM  {$_SESSION['DB_PREFIX']}worksorder A
				  LEFT OUTER JOIN {$_SESSION['DB_PREFIX']}members B
				  ON B.member_id = A.allocatedid
				  LEFT OUTER JOIN {$_SESSION['DB_PREFIX']}members C
				  ON C.member_id = A.takenbyid
				  LEFT OUTER JOIN {$_SESSION['DB_PREFIX']}customer D
				  ON D.id = A.customerid
				  WHERE D.id = $customerid
				  ORDER BY A.id DESC";

	} else {
		$crud->sql = "SELECT A.*,
				  B.fullname AS allocatedname,
				  C.fullname AS takenbyname,
				  D.name
				  FROM  {$_SESSION['DB_PREFIX']}worksorder A
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
				'label' 	 => 'Works Order Number'
			),
			array(
				'name'       => 'customerid',
				'type'       => 'DATACOMBO',
				'length' 	 => 20,
				'label' 	 => 'Customer',
				'table'		 => 'customer',
				'required'	 => true,
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
				'name'       => 'ratemode',
				'length' 	 => 16,
				'label' 	 => 'Rate',
				'type'       => 'COMBO',
				'onchange'   => 'rateunit_onchange',
				'options'    => array(
						array(
							'value'		=> 'N',
							'text'		=> 'Non Chargeable'
						),
						array(
							'value'		=> 'F',
							'text'		=> 'Fixed Price'
						),
						array(
							'value'		=> 'H',
							'text'		=> 'Hourly Rate'
						),
						array(
							'value'		=> 'D',
							'text'		=> 'Daily Rate'
						)
					)
			),
			array(
				'name'       => 'rateunit',
				'length' 	 => 12,
				'onchange'   => 'calculate_cost',
				'align'		 => 'right',
				'showInView' => false,
				'label' 	 => 'Units'
			),
			array(
				'name'       => 'unitprice',
				'length' 	 => 12,
				'onchange'   => 'calculate_cost',
				'align'		 => 'right',
				'showInView' => false,
				'label' 	 => 'Unit Price'
			),
			array(
				'name'       => 'totalcost',
				'length' 	 => 12,
				'align'		 => 'right',
				'label' 	 => 'Total Cost'
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
