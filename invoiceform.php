<?php 
	require_once(__DIR__ . "/ui/ComboUIClass.php");
?>
<style>
.entryform .bubble {
	display: none;
}
</style>
<table width="100%" cellpadding="0" cellspacing="4" class="entryformclass">
	<tbody>
		<tr valign="center">
			<td>Customer</td>
			<td colspan=2>
<?php 
				ComboUIClass::getInstance()
					->setId("customerid")
					->setValue("id")
					->setName("name")
					->setTable("customer")
					->render();
?>				
			</td>
		</tr>
		<tr valign="center">
			<td>Account Code</td>
			<td colspan=2>
				<input type="text" id="accountcode" name="accountcode" size="9" readonly  />
			</td>
		</tr>
		<tr valign="center">
			<td>&nbsp;</td>
			<td>
				<div>Invoice Address</div>
				<textarea readonly id="invoiceaddress" name="invoiceaddress" cols="50" rows="6"></textarea>
			</td>
			<td>
				<div>Delivery Address</div>
				<textarea readonly id="deliveryaddress" name="deliveryaddress" cols="50" rows="6"></textarea>
			</td>
		</tr>
		<tr valign="center">
			<td>Revision</td>
			<td colspan=2>
				<input type="text" style="width:60px" id="revision" readonly name="revision">
				<input type="hidden" id="item_serial" name="item_serial" />
			</td>
		</tr>
		<tr valign="center">
			<td>Invoice Date</td>
			<td colspan=2>
				<input type="text" autocomplete='off' class="datepicker" id="orderdate" name="orderdate">
			</td>
		</tr>
		<tr valign="center">
			<td>Your Reference</td>
			<td colspan=2>
				<input type="text" style="width:260px" id="yourordernumber" name="yourordernumber">
			</td>
		</tr>
		<tr valign="center">
			<td>Paid</td>
			<td colspan=2>
				<SELECT id="paid" name="paid">
					<OPTION value="N">No</OPTION>
					<OPTION value="Y">Yes</OPTION>
				</SELECT>
			</td>
		</tr>
		<tr valign="center">
			<td>Taken By</td>
			<td colspan=2>
<?php 
				ComboUIClass::getInstance()
					->setId("takenbyid")
					->setValue("member_id")
					->setName("fullname")
					->setTable("members")
					->render();
?>				
			</td>
		</tr>
		<tr valign="center">
			<td>Delivery Charge</td>
			<td colspan=2>
				<input type="text" style="width:70px" id="deliverycharge" name="deliverycharge" onchange="total_onchange()" value="0.00">
			</td>
		</tr>
		<tr valign="center">
			<td>Discount %</td>
			<td colspan=2>
				<input type="text" style="width:70px" id="discount" name="discount" onchange="total_onchange()" value="0.00">
			</td>
		</tr>
		<tr valign="center">
			<td>Total</td>
			<td colspan=2>
				<input type="text" style="width:70px" id="total" name="total" readonly value="0.00">
			</td>
		</tr>
	</tbody>
</table>

<table>
	<tr>
		<td>
		   	<span class="wrapper">
		   		<a disabled class='subapp rgap2 link2' href="javascript:addQuoteItem()">
		   			<em>
		   				<b>
		   					<img src='images/add.png' /> Add
		   				</b>
		   			</em>
		   		</a>
		   	</span>
		</td>
		<td>
		   	<span class="wrapper">
		   		<a disabled class='subapp rgap2 link2' href="javascript:printQuote(currentCrudID)">
		   			<em>
		   				<b>
		   					<img src='images/print.png' /> Print
		   				</b>
		   			</em>
		   		</a>
		   	</span>
		</td>
	</tr>
</table>
<?php 
function createHeader() {
?><tr><td>Actions</td><td>Product</td><td align='right'>Quantity</td><td align='right'>Unit Price</td><td align='right'>VAT Rate</td><td align='right'>VAT</td><td align='right'>Total</td></tr><?php 
}
?>
<div id="divtable">
	<table width="100%" class="grid list">
		<thead>
		<?php createHeader(); ?>
		</thead>
	</table>
</div>

<div id="invoiceitemdialog" class="modal">
	<table width="100%" cellpadding="0" cellspacing="4" class="entryformclass">
		<tbody>
			<tr valign="center">
				<td width='120px'>Product</td>
				<td>
<?php 
					ComboUIClass::getInstance()
						->setId("item_productid")
						->setValue("id")
						->setName("description")
						->setTable("product")
						->render();
?>				
				</td>
			</tr>
			<tr valign="center">
				<td>Product Code</td>
				<td>
					<input type="text" id="item_productcode" name="item_productcode" size=19 readonly />
					<input type="hidden" id="item_productdesc" name="item_productdesc"  />
				</td>
			</tr>
			<tr valign="center">
				<td>Description</td>
				<td>
					<textarea id="item_description" name="item_description" cols=80 rows=20></textarea>
				</td>
			</tr>
			<tr valign="center">
				<td>Quantity</td>
				<td>
					<input type="text" id="item_quantity" name="item_quantity" size=9 onchange="productid_onchange()" />
					<input type="hidden" id="item_id" name="item_id" />
				</td>
			</tr>
			<tr valign="center">
				<td>Unit Price</td>
				<td>
					<input type="text" id="item_unitprice" name="item_unitprice" size=9 onchange="qty_onchange()" />
				</td>
			</tr>
			<tr valign="center">
				<td>VAT Rate</td>
				<td>
					<input type="text" id="item_vatrate" name="item_vatrate" size=9 onchange="qty_onchange()" />
				</td>
			</tr>
			<tr valign="center">
				<td>VAT</td>
				<td>
					<input type="text" id="item_vat" name="item_vat" size=9 readonly />
				</td>
			</tr>
			<tr valign="center">
				<td>Line Total</td>
				<td>
					<input type="text" id="item_linetotal" name="item_linetotal" size=9 onchange="qty_onchange()" />
				</td>
			</tr>
		</tbody>
	</table>
</div>