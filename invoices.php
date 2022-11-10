<?php
	require_once(__DIR__ . "/crud.php");
	require_once(__DIR__ . "/businessobjects/InvoiceClass.php");
	require_once(__DIR__ . "/businessobjects/InvoiceitemClass.php");
	
	function acceptinvoice() {
		$id = $_POST['invoiceid'];
		
		SessionControllerClass::getDB()->beginTransaction();
		
		$invoice = new InvoiceClass();
		$invoice->loadRecord($id);
		$invoice->setStatus(1);
		$invoice->setConverteddatetime(date("Y-m-d H:i"));
		$invoice->updateRecord();

		SessionControllerClass::getDB()->commit();
	}
	
	function undo() {
		$id = $_POST['invoiceid'];
		
		SessionControllerClass::getDB()->beginTransaction();
		
		$invoice = new InvoiceClass();
		$invoice->loadRecord($id);
		$invoice->setStatus(0);
		$invoice->setConverteddatetime(null);
		$invoice->updateRecord();
		
		SessionControllerClass::getDB()->commit();
	}
	
	class invoiceCrud extends Crud {
		
		/* Post header event. */
		public function postHeaderEvent() {
			createConfirmDialog("confirmacceptdialog", "Confirm acceptance ?", "confirmaccept");
			createConfirmDialog("confirmundodialog", "Confirm undo ?", "confirmundo");
			createConfirmDialog("confirmRemoveDialog", "Confirm removal ?", "confirmRemoval");
		}
		
		public function afterInsertRow() {
?>
			var status = rowData['paid'];

			if (status == "Yes") {
				$(this).jqGrid('setRowData', rowid, false, { color: '#0000FF' });
		   	}
<?php
		}
		
		public function postUpdateEvent($invoiceid) {
			SessionControllerClass::getDB()->beginTransaction();
			
			$items = json_decode($_POST['item_serial'], true);
			$memberid = SessionControllerClass::getUser()->getMemberid();
			
			$invoice = new InvoiceClass();
			$invoice->loadRecord($invoiceid);
			$invoice->deleteItems();
			
			foreach ($items as $k=>$item) {
				$qty = $item['quantity'];
				$vatrate = $item['vatrate'];
				$linetotal = $item['linetotal'];
				$vat = $item['vat'];
				$unitprice = $item['priceeach'];
				$description = ($item['description']);
				$productid = $item['productid'];
				
				$invoiceitem = new InvoiceitemClass();
				$invoiceitem->setInvoiceid($invoiceid);
				$invoiceitem->setDescription($description);
				$invoiceitem->setQuantity($qty);
				$invoiceitem->setPriceeach($unitprice);
				$invoiceitem->setVatrate($vatrate);
				$invoiceitem->setVat($vat);
				$invoiceitem->setLinetotal($linetotal);
				$invoiceitem->setProductid($productid);
				$invoiceitem->insertRecord();
			}
			
			$invoice->setStatus(0);
			$invoice->setConverteddatetime(null);
			$invoice->updateRecord();

			SessionControllerClass::getDB()->commit();
		}
		
		public function postInsertEvent($invoiceid) {
			SessionControllerClass::getDB()->beginTransaction();
			
			$items = json_decode($_POST['item_serial'], true);
			$memberid = SessionControllerClass::getUser()->getMemberid();
			
			$invoice = new InvoiceClass();
			$invoice->loadRecord($invoiceid);
			$invoice->deleteItems();
			
			foreach ($items as $k=>$item) {
				$qty = $item['quantity'];
				$vatrate = $item['vatrate'];
				$linetotal = $item['linetotal'];
				$vat = $item['vat'];
				$unitprice = $item['priceeach'];
				$productid = $item['productid'];
				$description = ($item['description']);
				
				$invoiceitem = new InvoiceitemClass();
				$invoiceitem->setInvoiceid($invoiceid);
				$invoiceitem->setDescription($description);
				$invoiceitem->setQuantity($qty);
				$invoiceitem->setPriceeach($unitprice);
				$invoiceitem->setVatrate($vatrate);
				$invoiceitem->setVat($vat);
				$invoiceitem->setLinetotal($linetotal);
				$invoiceitem->setProductid($productid);
				$invoiceitem->insertRecord();
			}
			
			SessionControllerClass::getDB()->commit();
		}
		
		public function postAddScriptEvent() {
?>
			$("#revision").val("1");
			$("#deliverycharge").val("0.00");
			$("#discount").val("0.00");
			$("#total").val("0.00");
			$("#orderdate").val("<?php echo date("d/m/Y"); ?>");
			$("#takenbyid").val("<?php echo SessionControllerClass::getUser()->getMemberid(); ?>");
			itemArray = [];
			
			populateTable();
<?php 
		}
		
		public function postEditScriptEvent() {
?>
			$("#revision").val(parseInt($("#revision").val()) + 1);
			
			businessObjectToJSon({
					classname: "InvoiceUIClass", 
					methodname: "load", 
					args: {
						id: currentCrudID
					},
					success: function(node) {
					console.log(node);
						var invoiceaddress = "";
						var deliveryaddress = "";
						
						if (node.customer.deliveryaddress1 != null) deliveryaddress += node.customer.deliveryaddress1+ "\n";
						if (node.customer.deliveryaddress2!= null) deliveryaddress += node.customer.deliveryaddress2+ "\n";
						if (node.customer.deliveryaddress3!= null) deliveryaddress += node.customer.deliveryaddress3+ "\n";
						if (node.customer.deliverycity!= null) deliveryaddress += node.customer.deliverycity+ "\n";
						if (node.customer.deliverypostcode!= null) deliveryaddress += node.customer.deliverypostcode+ "\n";
						
						if (node.customer.invoiceaddress1!= null) invoiceaddress += node.customer.invoiceaddress1+ "\n";
						if (node.customer.invoiceaddress2!= null) invoiceaddress += node.customer.invoiceaddress2+ "\n";
						if (node.customer.invoiceaddress3!= null) invoiceaddress += node.customer.invoiceaddress3+ "\n";
						if (node.customer.invoicecity!= null) invoiceaddress += node.customer.invoicecity+ "\n";
						if (node.customer.invoicepostcode!= null) invoiceaddress += node.customer.invoicepostcode+ "\n";
						
						if (deliveryaddress == "") {
							deliveryaddress = invoiceaddress;
						}
						
						$("#accountcode").val(node.accountnumber);
						$("#invoiceaddress").val(invoiceaddress);
						$("#deliveryaddress").val(deliveryaddress);

						itemArray = node.items;
						
						populateTable(node.items);
					}
				});
<?php 
		}
			
		public function editScreenSetup() {
			include("invoiceform.php");
		}
		
		public function postScriptEvent() {
?>
			var currentID = 0;
			var currentItem = -1;
			var itemArray = [];
			
			function customerid_onchange() {
				businessObjectToJSon({
						classname: "CustomerUIClass", 
						methodname: "load", 
						args: {
							id: $("#customerid").val()
						},
						success: function(node) {
						console.log(node);
							var invoiceaddress = "";
							var deliveryaddress = "";
							
							if (node.deliveryaddress1 != null) deliveryaddress += node.deliveryaddress1+ "\n";
							if (node.deliveryaddress2!= null) deliveryaddress += node.deliveryaddress2+ "\n";
							if (node.deliveryaddress3!= null) deliveryaddress += node.deliveryaddress3+ "\n";
							if (node.deliverycity!= null) deliveryaddress += node.deliverycity+ "\n";
							if (node.deliverypostcode!= null) deliveryaddress += node.deliverypostcode+ "\n";
							
							if (node.invoiceaddress1!= null) invoiceaddress += node.invoiceaddress1+ "\n";
							if (node.invoiceaddress2!= null) invoiceaddress += node.invoiceaddress2+ "\n";
							if (node.invoiceaddress3!= null) invoiceaddress += node.invoiceaddress3+ "\n";
							if (node.invoicecity!= null) invoiceaddress += node.invoicecity+ "\n";
							if (node.invoicepostcode!= null) invoiceaddress += node.invoicepostcode+ "\n";
							
							if (deliveryaddress == "") {
								deliveryaddress = invoiceaddress;
							}
							
							$("#accountcode").val(node.customer.accountnumber);
							$("#invoiceaddress").val(invoiceaddress);
							$("#deliveryaddress").val(deliveryaddress);
						}
					});
			}
			
			function total_onchange() {
				calculate_total();
			}
			
			function calculate_total() {
				var total;
				var deliverycharge;
				var discount;
				
				deliverycharge = parseFloat($("#deliverycharge").val());
				discount = parseFloat($("#discount").val());
				
				total = parseFloat($("#total").val());
				total -= deliverycharge;
				
				if (total < 0) {
					total = 0;
				}
				
				total -= (total * (discount) / 100);
				
				$("#discount").val(new Number(discount).toFixed(2));
				$("#deliverycharge").val(new Number(deliverycharge).toFixed(2));
				$("#total").val(new Number(total).toFixed(2));
			}
			
			function productid_onchange() {
				businessObjectToJSon({
						classname: "ProductUIClass", 
						methodname: "load", 
						args: {
							id: $("#item_productid").val()
						},
						success: function(node) {
							$("#item_productcode").val(node.productcode);
							$("#item_productdesc").val(node.description);
							$("#item_unitprice").val(new Number(node.rspnet).toFixed(2)).trigger("change");
						}
					});
			}
			
			function qty_onchange(node) {
				var qty = parseInt($("#item_quantity").val());
				var unitprice = parseFloat($("#item_unitprice").val());
				var vatrate = parseFloat($("#item_vatrate").val());

				if (isNaN(unitprice)) {
					unitprice = 0;
				}
				
				if (isNaN(vatrate)) {
					vatrate = 0;
				}
				
				if (isNaN(qty)) {
					qty = 0;
				}
				
				var total = parseFloat(qty * unitprice);
				var vat = total * (vatrate / 100);
				
				total += vat;
				
				$("#item_vatrate").val(new Number(vatrate).toFixed(2));
				$("#item_vat").val(new Number(vat).toFixed(2));
				$("#item_unitprice").val(new Number(unitprice).toFixed(2));
				$("#item_quantity").val(new Number(qty).toFixed(0));
				$("#item_linetotal").val(new Number(total).toFixed(2));
			}
			
			function printQuote(id) {
				window.open("invoicereport.php?id=" + id);
			}
			
			function populateTable(data) {
				var total = 0;
				var html = "<TABLE width='100%' class='grid list'><THEAD><?php createHeader(); ?></THEAD>";
				
				if (data != null) {
    				data.sort(
    						function(a, b) {
    						    if(a.product.description < b.product.description) return -1;
    						    if(a.product.description > b.product.description) return 1;
    						    
    						    return 0;
    						}
    					);
				}
										
				$("#item_serial").val(JSON.stringify(data));
											
				if (data != null) {
					for (var i = 0; i < data.length; i++) {
						var node = data[i];
						
						if (node.product.description != null) {
							html += "<TR>";
							html += "<TD><img src='images/edit.png'  title='Edit item' onclick='editItem(" + i + ")' />&nbsp;<img src='images/delete.png'  title='Remove item' onclick='removeItem(" + i + ")' /></TD>";
							html += "<TD>" + node.product.description + "</TD>";
							html += "<TD align=right>" + new Number(node.quantity).toFixed(0) + "</TD>";
							html += "<TD align=right>" + new Number(node.priceeach).toFixed(2) + "</TD>";
							html += "<TD align=right>" + new Number(node.vatrate).toFixed(2) + "</TD>";
							html += "<TD align=right>" + new Number(node.vat).toFixed(2) + "</TD>";
							html += "<TD align=right>" + new Number(node.linetotal).toFixed(2) + "</TD>";
							html += "</TR>\n";
							
							total += parseFloat(node.linetotal);
						}
					}
				}
				
				if ($("#deliverycharge").val() == "6.50" || $("#deliverycharge").val() == "0.00") {
					if (total < 75) {
						$("#deliverycharge").val("6.50");
						
					} else {
						$("#deliverycharge").val("0.00");
					}
				}
				
				$("#total").val(new Number(total).toFixed(2));
				
				calculate_total();

				html = html + "</TABLE>";
				
				$("#divtable").html(html);
			}
			
			function saveQuoteItem() {
				if (! verifyStandardForm("#invoiceitemform")) {
					pwAlert("Invalid form");
					return false;
				}
				
				var item = {
						id: $("#item_id").val(),
						quantity: $("#item_quantity").val(),
						priceeach: $("#item_unitprice").val(),
						vatrate: $("#item_vatrate").val(),
						vat: $("#item_vat").val(),
						linetotal: $("#item_linetotal").val(),
						productid: $("#item_productid").val(),
						product: {
							description: $("#item_productdesc").val()
						},
						proddesc: $("#item_productdesc").val(),
						description: $("#item_description").val()
					};
					
				if (currentItem == -1) {
					if (itemArray == null) {
						itemArray = [];
					}
					
					itemArray.push(item);
					
				} else {
					itemArray[currentItem] = item;
				}
				
				populateTable(itemArray);
				
				return true;
			}
			
			function removeItem(id) {
				currentItem = id;
				
				$("#confirmRemoveDialog .confirmdialogbody").html("You are about to approve this item.<br>Are you sure ?");
				$("#confirmRemoveDialog").dialog("open");
			} 
			
			function confirmRemoval() {
				var newItemArray = [];
				var i;
				
				$("#confirmRemoveDialog").dialog("close");
				
				for (i = 0; i < itemArray.length; i++) {
					if (currentItem != i) {
						newItemArray.push(itemArray[i]);
					}
				}
				
				itemArray = newItemArray;
				
				populateTable(itemArray);
			}
			
			function editItem(id) {
				currentItem = id;
				var node = itemArray[id];
			
				$("#item_itemid").val(node.id);
				$("#item_productid").val(node.productid).trigger("change");
				$("#item_description").val(node.description);
				$("#item_productdesc").val(node.product.description);
				$("#item_quantity").val(node.quantity);
				$("#item_vat").val(node.vat);
				$("#item_vatrate").val(node.vatrate);
				$("#item_unitprice").val(node.priceeach);
				$("#item_linetotal").val(node.linetotal);
				
				$('#invoiceitemdialog').dialog('open');				
			}
			
			function addQuoteItem() {
				currentItem = -1;
				
				$("#item_itemid").val("0");
				$("#item_productid").val("0");
				$("#item_productdesc").val("");
				$("#item_description").val("");
				$("#item_quantity").val("1");
				$("#item_vatrate").val("<?php echo SessionControllerClass::getSiteConfig()->getVatrate(); ?>");
				$("#item_vat").val("0.00");
				$("#item_unitprice").val("0.00");
				$("#item_linetotal").val("0.00");
				
				$('#invoiceitemdialog').dialog('open');				
			
			}
			
			function validateForm() {
				return true;
			}
			
			$(document).ready(
					function() {
						$("#item_productid").change(productid_onchange);
						$("#customerid").change(customerid_onchange);
						
						$("#invoiceitemdialog").dialog({
								modal: true,
								autoOpen: false,
								show:"fade",
								closeOnEscape: true,
								width: 690,
								hide:"fade",
								title:"Quote Item",
								open: function(event, ui){
									
								},
								buttons: {
									"Save": function() {
										if (saveQuoteItem()) {
											$(this).dialog("close");
											
										}
									},
									Cancel: function() {
										$(this).dialog("close");
									}
								}
							});
					}
				);


			function bookingReference(node) {
				return "<?php echo "INV-"; ?>" + padZero(node.id, 6);
			}
			
			function accept(id) {
				currentID = id;
				
				$("#confirmacceptdialog .confirmdialogbody").html("You are about to accept this invoice.<br>Are you sure ?");
				$("#confirmacceptdialog").dialog("open");
			}
			
			function undo(id) {
				currentID = id;
				
				$("#confirmundodialog .confirmdialogbody").html("You are about to undo this invoice.<br>Are you sure ?");
				$("#confirmundodialog").dialog("open");
			}
			
			function confirmaccept() {
				post("editform", "acceptinvoice", "submitframe", 
						{ 
							invoiceid: currentID
						}
					);
					
				$("#confirmacceptdialog").dialog("close");
			}
			
			function confirmundo() {
				post("editform", "undo", "submitframe", 
						{ 
							invoiceid: currentID
						}
					);
					
				$("#confirmundodialog").dialog("close");
			}
			
			function checkStatus(node) {
				if (node.status == 0) {
					$("#acceptbutton").show();
					$("#undobutton").hide();
					
				} else {
					$("#acceptbutton").hide();
					$("#undobutton").show();
				}
			}
<?php			
		}
	}
	
	$crud = new invoiceCrud();
	$crud->dialogwidth = 840;
	$crud->title = "Invoices";
	$crud->onClickCallback = "checkStatus";
	$crud->table = "{$_SESSION['DB_PREFIX']}invoice";
	$crud->sql = "SELECT A.*, B.name AS customername, C.fullname AS takenbyname
				  FROM  {$_SESSION['DB_PREFIX']}invoice A
				  INNER JOIN  {$_SESSION['DB_PREFIX']}customer B
				  ON B.id = A.customerid
				  INNER JOIN  {$_SESSION['DB_PREFIX']}members C
				  ON C.member_id = A.takenbyid
				  ORDER BY A.id DESC";

	$crud->document = array(
			"tablename"		=>	"invoicedocs",
			"primaryidname"	=>	"quoteid"
	);
	
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
				'label' 	 => 'Invoice Number'
			),
			array(
				'name'       => 'customerid',
				'type'       => 'DATACOMBO',
				'length' 	 => 60,
				'label' 	 => 'Customer',
				'table'		 => 'customer',
				'required'	 => true,
				'table_id'	 => 'id',
				'alias'		 => 'customername',
				'table_name' => 'name'
			),
			array(
				'name'       => 'revision',
				'length' 	 => 10,
				'readonly'	 => true,
				'label' 	 => 'Revision'
			),			
			array(
				'name'       => 'orderdate',
				'length' 	 => 12,
				'datatype'   => 'date',
				'label' 	 => 'Invoice Date'
			),
			array(
				'name'       => 'converteddatetime',
				'length' 	 => 16,
				'bind'		 => false,
				'edit'		 => false,
				'datatype'   => 'date',
				'label' 	 => 'Conversion Date'
			),
			array(
				'name'       => 'yourordernumber',
				'length' 	 => 20,
				'label' 	 => 'Your Order Number'
			),			
			array(
				'name'       => 'paid',
				'length' 	 => 10,
				'label' 	 => 'Paid',
				'type'       => 'COMBO',
				'options'    => array(
						array(
							'value'		=> "Y",
							'text'		=> 'Yes'
						),
						array(
							'value'		=> "N",
							'text'		=> 'No'
						)
					)
			),			
			array(
				'name'       => 'status',
				'type'		 => 'CHECKBOX',
				'length' 	 => 10,
				'label' 	 => 'Accepted'
			),			
			array(
				'name'       => 'takenbyid',
				'type'       => 'DATACOMBO',
				'length' 	 => 18,
				'label' 	 => 'Taken By',
				'table'		 => 'members',
				'required'	 => true,
				'table_id'	 => 'member_id',
				'alias'		 => 'takenbyname',
				'table_name' => 'fullname'
			),
			array(
				'name'       => 'deliverycharge',
				'length' 	 => 13,
				'datatype'   => 'double',
				'align'		 => 'right',
				'label' 	 => 'Delivery Charge'
			),
			array(
				'name'       => 'discount',
				'length' 	 => 12,
				'align'		 => 'right',
				'label' 	 => 'Discount %'
			),	
			array(
				'name'       => 'total',
				'length' 	 => 12,
				'align'		 => 'right',
				'label' 	 => 'Total'
			)	
		);

	$crud->subapplications = array(
			array(
				'title'		  => 'Accept',
				'id'		  => 'acceptbutton',
				'imageurl'	  => 'images/accept.png',
				'script' 	  => 'accept'
			),
			array(
				'title'		  => 'Undo',
				'id'		  => 'undobutton',
				'imageurl'	  => 'images/invalid.png',
				'script' 	  => 'undo'
			),
			array(
				'title'		  => 'Print',
				'imageurl'	  => 'images/print.png',
				'script' 	  => 'printQuote'
			)
		);
		
	$crud->messages = array(
			array('id'		  => 'invoiceid')
		);
		
	$crud->run();
?>
