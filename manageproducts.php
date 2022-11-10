<?php
	require_once(__DIR__ . "/crud.php");
	require_once(__DIR__ . "/businessobjects/ProductClass.php");

	class ProductCrud extends Crud {
		
		public function postEditScriptEvent() {
?>
			$("#groupcode").css("font-style", "");
			$("#groupcode").css("color", "");
			$("#productcode").css("font-style", "");
			$("#productcode").css("color", "");
<?php
		}
		
		public function postAddScriptEvent() {
?>
			$("#groupcode").val("Auto Generated");
			$("#groupcode").css("font-style", "italic");
			$("#groupcode").css("color", "#888888");
			$("#productcode").val("Auto Generated");
			$("#productcode").css("font-style", "italic");
			$("#productcode").css("color", "#888888");
<?php
		}		
		
		public function postInsertEvent($id) {
			SessionControllerClass::getDB()->beginTransaction();
			
			$product = new ProductClass();
			$product->loadRecord($id);
			$product->setGroupcode(SessionControllerClass::getSiteConfig()->getProductgroupprefix() . $id);
			$product->setProductcode(SessionControllerClass::getSiteConfig()->getProductcodeprefix() . $id);
			$product->updateRecord();
			
			SessionControllerClass::getDB()->commit();
		}
	}
	
	$crud = new ProductCrud();
	$crud->dialogwidth = 840;
	$crud->title = "Products";
	$crud->table = "{$_SESSION['DB_PREFIX']}product";
	$crud->sql = "SELECT A.* 
				  FROM  {$_SESSION['DB_PREFIX']}product A
				  ORDER BY A.productcode";
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
				'name'       => 'groupcode',
				'length' 	 => 20,
				'readonly'	 => true,
				'label' 	 => 'Group Code'
			),			
			array(
				'name'       => 'productcode',
				'readonly'	 => true,
				'length' 	 => 20,
				'label' 	 => 'Product Code'
			),
			array(
				'name'       => 'description',
				'length' 	 => 90,
				'label' 	 => 'Description'
			),			
			array(
				'name'       => 'imageid',
				'type'		 => 'IMAGE',
				'required'   => false,
				'length' 	 => 35,
				'showInView' => false,
				'label' 	 => 'Image'
			),			
			array(
				'name'       => 'supplier',
				'required'   => false,
				'length' 	 => 35,
				'label' 	 => 'Supplier'
			),			
			array(
				'name'       => 'mainsupplierpartnumber',
				'required'   => false,
				'length' 	 => 20,
				'label' 	 => 'Main Supplier Part Number'
			),			
			array(
				'name'       => 'estimatedcost',
				'length' 	 => 12,
				'datatype'   => 'double',
				'required'   => false,
				'align'		 => 'right',
				'label' 	 => 'Estimated Cost'
			),			
			array(
				'name'       => 'rspnet',
				'length' 	 => 12,
				'datatype'   => 'double',
				'align'		 => 'right',
				'label' 	 => 'RSP net GBP / &pound;'
			),
			array(
				'name'       => 'weight',
				'length' 	 => 12,
				'required'   => false,
				'datatype'   => 'double',
				'align'		 => 'right',
				'label' 	 => 'Weight'
			)
		);
	
	$crud->document = array(
			"tablename"		=>	"productdocs",
			"primaryidname"	=>	"productid"
	);
	
	$crud->subapplications = array(
			array(
				'title'		  => 'Price Breaks',
				'imageurl'	  => 'images/document.gif',
				'application' => 'managepricebreaks.php'
			)
		);
		
	$crud->run();
?>
