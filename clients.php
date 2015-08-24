<?php
	require_once("crud.php");
	
	class ClientCrud extends Crud {
		
		/* Post header event. */
		public function postHeaderEvent() {
			createDocumentLink();
		}
		
		public function postScriptEvent() {
?>
			function editDocuments(node) {
				viewDocument(node, "addclientdocument.php", node, "clientdocs", "clientid");
			}
			
			function newStarterForm(node) {
				window.open("newstarterreport.php?id=" + node);
			}
<?php			
		}
	}
	
	$crud = new ClientCrud();
	$crud->dialogwidth = 950;
	$crud->title = "Client";
	$crud->table = "{$_SESSION['DB_PREFIX']}client";
	$crud->sql = "SELECT A.*
				  FROM  {$_SESSION['DB_PREFIX']}client A
				  ORDER BY A.name";
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
				'name'       => 'name',
				'length' 	 => 30,
				'label' 	 => 'Name'
			),
			array(
				'name'       => 'status',
				'length' 	 => 10,
				'label' 	 => 'Status',
				'type'       => 'COMBO',
				'options'    => array(
						array(
							'value'		=> 'L',
							'text'		=> 'Live'
						),
						array(
							'value'		=> 'I',
							'text'		=> 'Inactive'
						)
					)
			),
			array(
				'name'       => 'firstname',
				'length' 	 => 15,
				'label' 	 => 'First Name'
			),			
			array(
				'name'       => 'lastname',
				'length' 	 => 15,
				'label' 	 => 'Last Name'
			),			
			array(
				'name'       => 'address',
				'length' 	 => 12,
				'showInView' => false,
				'type'		 => 'BASICTEXTAREA',
				'label' 	 => 'Address'
			),
			array(
				'name'       => 'billingaddress',
				'length' 	 => 12,
				'showInView' => false,
				'type'		 => 'BASICTEXTAREA',
				'label' 	 => 'Billing Address'
			),
			array(
				'name'       => 'paperfreebillingaddress',
				'length' 	 => 60,
				'required'	 => false,
				'showInView' => false,
				'label' 	 => 'Paper Free Biling Address'
			),
			array(
				'name'       => 'email',
				'length' 	 => 40,
				'label' 	 => 'Email'
			),
			array(
				'name'       => 'telephone',
				'length' 	 => 12,
				'label' 	 => 'Telephone'
			),
			array(
				'name'       => 'mobile',
				'length' 	 => 12,
				'required' 	 => false,
				'label' 	 => 'Mobile'
			),
			array(
				'name'       => 'workphone',
				'length' 	 => 12,
				'required' 	 => false,
				'label' 	 => 'Work Phone'
			),
			array(
				'name'       => 'frequency',
				'length' 	 => 20,
				'label' 	 => 'Frequence',
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
				'name'       => 'startdate',
				'length' 	 => 12,
				'datatype'	 => 'date',
				'required' 	 => false,
				'label' 	 => 'Start Date'
			),
			array(
				'name'       => 'hoursrequired',
				'length' 	 => 12,
				'align'		 => 'right',
				'required' 	 => false,
				'label' 	 => 'Hours Required'
			),
			array(
				'name'       => 'preferreddaytime',
				'length' 	 => 60,
				'required' 	 => false,
				'label' 	 => 'Preferred Day And Time'
			),
			array(
				'name'       => 'numberofbedrooms',
				'length' 	 => 12,
				'align'		 => 'right',
				'required' 	 => false,
				'label' 	 => 'Number Of Bedrooms'
			),
			array(
				'name'       => 'numberofbathrooms',
				'length' 	 => 12,
				'align'		 => 'right',
				'required' 	 => false,
				'label' 	 => 'Number Of Bathrooms'
			),
			array(
				'name'       => 'valuablestoberemoved',
				'length' 	 => 12,
				'showInView' => false,
				'type'		 => 'BASICTEXTAREA',
				'required' 	 => false,
				'label' 	 => 'Valuable items to be removed or not cleaned'
			),
			array(
				'name'       => 'vacuum',
				'length' 	 => 10,
				'label' 	 => 'Vacuum',
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
			),
			array(
				'name'       => 'ironingrequired',
				'length' 	 => 10,
				'label' 	 => 'Ironing Required',
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
			),
			array(
				'name'       => 'paymentmethod',
				'length' 	 => 10,
				'label' 	 => 'Paymenth Method',
				'type'       => 'COMBO',
				'options'    => array(
						array(
							'value'		=> 'Q',
							'text'		=> 'Cheque'
						),
						array(
							'value'		=> 'B',
							'text'		=> 'Bank Transfer'
						),
						array(
							'value'		=> 'C',
							'text'		=> 'Credit Card'
						),
						array(
							'value'		=> 'D',
							'text'		=> 'Debit Card'
						)
					)
			),
			array(
				'name'       => 'numberofkeysgiven',
				'length' 	 => 12,
				'align'		 => 'right',
				'required' 	 => false,
				'label' 	 => 'Number Of Keys Given'
			),
			array(
				'name'       => 'alarmfobgiven',
				'length' 	 => 10,
				'label' 	 => 'Alarm Fob Given',
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
			),
			array(
				'name'       => 'alarmcodes',
				'length' 	 => 6,
				'required' 	 => false,
				'label' 	 => 'Alarm Codes'
			),
			array(
				'name'       => 'accessinstructions',
				'length' 	 => 60,
				'required' 	 => false,
				'label' 	 => 'Access Instructions'
			),
			array(
				'name'       => 'specificrequirements',
				'length' 	 => 12,
				'showInView' => false,
				'type'		 => 'BASICTEXTAREA',
				'required' 	 => false,
				'label' 	 => 'Specific Requirements'
			)
		);

	$crud->subapplications = array(
			array(
				'title'		  => 'Documents',
				'imageurl'	  => 'images/document.gif',
				'script' 	  => 'editDocuments'
			),
			array(
				'title'		  => 'Schedule',
				'imageurl'	  => 'images/checkin.png',
				'application' => 'clientschedule.php'
			),
			array(
				'title'		  => 'New Starter Form',
				'imageurl'	  => 'images/print.png',
				'script' 	  => 'newStarterForm'
			)
		);
		
	$crud->run();
?>
