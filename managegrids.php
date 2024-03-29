<?php
	require_once(__DIR__ . "/crud.php");
	require_once(__DIR__ . "/businessobjects/ApplicationTableColumnClass.php");
	
	function hideColumn() {
		$column = new ApplicationTableColumnClass();
		$column->loadRecord($_POST['gridid']);
		$column->hide();
	}
	
	function showColumn() {
		$column = new ApplicationTableColumnClass();
		$column->loadRecord($_POST['gridid']);
		$column->show();
	}
	
	class GridEdit extends Crud {
		
		/* Post script event. */
		public function postScriptEvent() {
?>
			function hideColumn(pk) {
				post("editform", "hideColumn", "submitframe", { gridid: pk });
			}
			
			function showColumn(pk) {
				post("editform", "showColumn", "submitframe", { gridid: pk });
			}
<?php
		}
	}
		
	$crud = new GridEdit();
	$crud->title = "Grids";
	$crud->table = "{$_SESSION['DB_PREFIX']}applicationtablecolumns";
	$crud->allowAdd = false;
	$crud->dialogwidth = 500;
	
	$memberid = SessionControllerClass::getUser()->getMemberid();
	
	if (isset($_GET['id'])) {
		$crud->sql = "SELECT A.* FROM {$_SESSION['DB_PREFIX']}applicationtablecolumns A
					  INNER JOIN {$_SESSION['DB_PREFIX']}applicationtables B 
					  ON B.id = A.headerid 
					  WHERE B.pageid = {$_GET['id']}
					  AND B.memberid = $memberid
					  ORDER BY A.columnindex";
		
	} else {
		$crud->sql = "SELECT A.* FROM {$_SESSION['DB_PREFIX']}applicationtablecolumns A
					  INNER JOIN {$_SESSION['DB_PREFIX']}applicationtables B
					  ON B.id = A.headerid
					  WHERE B.memberid = $memberid
					  ORDER BY A.columnindex";
	}
	
	$crud->subapplications = array(
			array(
				'title'		  => 'Hide',
				'imageurl'	  => 'images/user.png',
				'script' 	  => 'hideColumn'
			),
			array(
				'title'		  => 'Show',
				'imageurl'	  => 'images/user.png',
				'script' 	  => 'showColumn'
			)
		);
		
	$crud->messages = array(
			array('id'		  => 'gridid')
			);
			
	$crud->columns = array(
			array(
				'name'       => 'id',
				'length' 	 => 6,
				'pk'		 => true,
				'showInView' => false,
				'bind' 	 	 => false,
				'editable' 	 => false,
				'label' 	 => 'ID'
			),
			array(
				'name'       => 'pageid',
				'length' 	 => 6,
				'parentid'	 => true,
				'editable'   => false,
				'bind'   	 => false,
				'showInView' => false,
				'label' 	 => 'Page ID'
			),
			array(
				'name'       => 'columnindex',
				'length' 	 => 12,
				'sortby'	 => true,
				'readonly'	 => true,
				'label' 	 => 'Column'
			),
			array(
				'name'       => 'label',
				'length' 	 => 50,
				'sortby'	 => true,
				'label' 	 => 'Label'
			),
			array(
				'name'       => 'hidecolumn',
				'length' 	 => 30,
				'editable'	 => false,
				'label' 	 => 'Hidden',
				'type'       => 'COMBO',
				'options'    => array(
						array(
							'value'		=> 0,
							'text'		=> 'Visible'
						),
						array(
							'value'		=> 1,
							'text'		=> 'Hidden'
						)
					)
			),
			array(
				'name'       => 'width',
				'length' 	 => 12,
				'sortby'	 => true,
				'label' 	 => 'Width'
			),
		);
		
	$crud->run();
?>
