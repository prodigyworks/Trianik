<?php
	require_once(__DIR__ . "/crud.php");
	require_once(__DIR__ . "/businessobjects/ErrorClass.php");

	function clearAllErrors() {
		SessionControllerClass::getDB()->beginTransaction();
		
		ErrorsClass::clear();
		
		SessionControllerClass::getDB()->commit();
		
	}
	
	class ErrorCrud extends Crud {
		
		public function postScriptEvent() {
?>
			function clearErrors(id) {
				post("editform", "clearAllErrors", "submitframe", {});
			}
<?php			
		}
	}

	$crud = new ErrorCrud();
	$crud->allowAdd = false;
	$crud->allowEdit = false;
	$crud->title = "Errors";
	$crud->table = "{$_SESSION['DB_PREFIX']}errors";
	$crud->dialogwidth = 900;
	$crud->sql = 
			"SELECT A.*, B.label, C.fullname
			 FROM {$_SESSION['DB_PREFIX']}errors A 
			 INNER JOIN {$_SESSION['DB_PREFIX']}pages B 
			 ON B.pageid = A.pageid 
			 LEFT OUTER	 JOIN {$_SESSION['DB_PREFIX']}members C 
			 ON C.member_id = A.memberid 
			 ORDER BY A.id DESC";
	
	$crud->columns = array(
			array(
				'name'       => 'id',
				'length' 	 => 6,
				'pk'		 => true,
				'showInView' => false,
				'editable'	 => false,
				'bind' 	 	 => false,
				'label' 	 => 'ID'
			),
			array(
				'name'       => 'pageid',
				'length' 	 => 6,
				'showInView' => false,
				'editable'	 => false,
				'bind' 	 	 => false,
				'label' 	 => 'Page ID'
			),
			array(
				'name'       => 'createddate',
				'length' 	 => 12,
				'bind'		 => false,
				'label' 	 => 'Created Date'
			),
			array(
				'name'       => 'label',
				'length' 	 => 60,
				'label' 	 => 'Page'
			),
			array(
				'name'       => 'fullname',
				'length' 	 => 60,
				'label' 	 => 'User'
			),
			array(
				'name'       => 'description',
				'showInView' => false,
				'type'		 => 'TEXTAREA',
				'label' 	 => 'Error'
			)
		);
	$crud->applications = array(
			array(
				'title'		  => 'Clear',
				'imageurl'	  => 'images/minimize.gif',
				'script' 	  => 'clearErrors'
			)
		);
		
	$crud->run();
?>
