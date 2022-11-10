<?php
	require_once(__DIR__ . "/businessobjects/ProformaClass.php");
	require_once(__DIR__ . "/pdfreport.php");
	require_once(__DIR__ . "/simple_html_dom.php");

	class QuoteReport extends PDFReport {
		/**
		 * @var ProformaClass
		 */
		private $proforma = null;
		
		function newPage() {
			$this->AddPage();
			
			$this->DynamicImage(SessionControllerClass::getSiteConfig()->getReportlogo(), 177.6, 6);
			$this->Image("images/footer.png", 80, 262);
			
			$this->addText( 83.5, 273, "Valid for 30 days", 8, 3, 'B');
				
			$this->addText( 15, 13, SessionControllerClass::getSiteConfig()->getCompanyname(), 12, 4, 'B') + 5;
			$dynamicY = $this->addText(15, 20, SessionControllerClass::getSiteConfig()->getAddress(), 8, 3) + 4;
			
			$dynamicY = 47.5;
			
			$this->addText( 15, $dynamicY, "Supplier Name & Address", 8, 3, 'B');
			$this->addText( 75, $dynamicY, "Delivery Address", 8, 3, 'B');
			$this->addText( 160, $dynamicY, "PRO-FORMA", 8, 3, 'B');
			

			$this->addText( 145, $dynamicY + 5, "FAO:", 8, 3, 'B');
			$this->addText( 170, $dynamicY + 5, "{$this->proforma->getSupplier()->getFirstname()} {$this->proforma->getSupplier()->getLastname()}" , 8, 2.4, '', 30);
				
			$this->addText( 145, $dynamicY + 10, "Invoice Date:", 8, 3, 'B');
			$this->addText( 170, $dynamicY + 10, $this->proforma->dateToDMY($this->proforma->getOrderdate()), 8, 3);
				
			$this->addText( 145, $dynamicY + 15, "Your Acc No:", 8, 3, 'B');
			$this->addText( 170, $dynamicY + 15, $this->proforma->getSupplier()->getAccountnumber(), 8, 3);
				
			$this->addText( 145, $dynamicY + 20, "Your Reference:", 8, 3, 'B');
			$this->addText( 170, $dynamicY + 20, $this->proforma->getYourordernumber(), 8, 3);
			
			$this->addText( 145, $dynamicY + 25, "Taken By:", 8, 3, 'B');
			$this->addText( 170, $dynamicY + 25, $this->proforma->getTakenby()->getFullname(), 8, 3);
			
			$this->addText( 145, $dynamicY + 31.5, "Our Order No:", 8, 3, 'B');
			$this->addText( 170, $dynamicY + 31.5, SessionControllerClass::getSiteConfig()->getBookingprefix() . $this->proforma->getFormattedId(), 8, 3, 'B');
			
			$invoiceaddress = "";
			$deliveryaddress = "";
			
			if (trim($this->proforma->getSupplier()->getDeliveryaddress1()) != null) $deliveryaddress .= $this->proforma->getSupplier()->getDeliveryaddress1() . "\n";
			if (trim($this->proforma->getSupplier()->getDeliveryaddress2()) != null) $deliveryaddress .= $this->proforma->getSupplier()->getDeliveryaddress2() . "\n";
			if (trim($this->proforma->getSupplier()->getDeliveryaddress3()) != null) $deliveryaddress .= $this->proforma->getSupplier()->getDeliveryaddress3() . "\n";
			if (trim($this->proforma->getSupplier()->getDeliverycity()) != null) $deliveryaddress .= $this->proforma->getSupplier()->getDeliverycity() . "\n";
			if (trim($this->proforma->getSupplier()->getDeliverypostcode()) != null) $deliveryaddress .= $this->proforma->getSupplier()->getDeliverypostcode() . "\n";
				
			if (trim($this->proforma->getSupplier()->getInvoiceaddress1()) != null) $invoiceaddress .= $this->proforma->getSupplier()->getInvoiceaddress1() . "\n";
			if (trim($this->proforma->getSupplier()->getInvoiceaddress2()) != null) $invoiceaddress .= $this->proforma->getSupplier()->getInvoiceaddress2() . "\n";
			if (trim($this->proforma->getSupplier()->getInvoiceaddress3()) != null) $invoiceaddress .= $this->proforma->getSupplier()->getInvoiceaddress3() . "\n";
			if (trim($this->proforma->getSupplier()->getInvoicecity()) != null) $invoiceaddress .= $this->proforma->getSupplier()->getInvoicecity() . "\n";
			if (trim($this->proforma->getSupplier()->getInvoicepostcode()) != null) $invoiceaddress .= $this->proforma->getSupplier()->getInvoicepostcode() . "\n";
				
			if ($deliveryaddress == "") {
				$deliveryaddress = $invoiceaddress;
			}
			
			$this->addText(15, $dynamicY + 5, $this->proforma->getSupplier()->getName() . "\n" . $invoiceaddress, 8, 3.5, '', 60);
			$this->addText(75, $dynamicY + 5, $this->proforma->getSupplier()->getName() . "\n" . $deliveryaddress, 8, 3.5, '', 60);
			
			$this->RoundedRect(13, 46, 128, 38, 5, '1234', 'BD');
			$this->RoundedRect(143, 46, 58, 38, 5, '1234', 'BD');
			$this->Line(143, 51.5, 201, 51.5);
			$this->Line(143, 77, 201, 77);
			$this->Line(142, 246, 200, 246);
			$this->Line(142, 252, 200, 252);
			$this->Line(142, 258, 200, 258);
			$this->Line(142, 264, 200, 264);
			
			if ($this->proforma->getRevision() != 1) {
				$this->addText(55, $dynamicY + 38, "This is Order Revision No " . $this->proforma->getRevision() . " and Supersedes all Previous Issues", 8, 3.5, 'B');
			}
			
			$this->addText( 10, 270, SessionControllerClass::getSiteConfig()->getCompanydetails(), 7, 3);
// 			$this->addText( 170, 270, "Printed: " . date("d/m/Y H:i"), 7, 3);
// 			$this->addText( 186, 273, "Page " . $this->PageNo() . " of {nb}", 7, 3);
			
			$this->SetFont('Arial','', 8);
				
			$cols=array( "Quantity"    => 18,
			             "Code"  => 23,		
						 "Description"  => 90.5,
			             "Price Each"  => 19.5,
			             "Line Total"  => 19.5,
						 "Line VAT"  => 19.5
				);
		
			$this->addCols( $dynamicY + 45, $cols);
			
			$cols=array( "Quantity"    => "L",
			             "Code"  => "L",		
						 "Description"  => "L",
			             "Price Each"  => "R",
			             "Line Total"  => "R",
						 "Line VAT"  => "R"
				);
			$this->addLineFormat( $cols);
			
			return $this->GetY();
		}
		
		function __construct($orientation, $metric, $size, $id) {
			$dynamicY = 0;

	        parent::__construct($orientation, $metric, $size);
			
			try {
				$this->proforma = new ProformaClass();
				$this->proforma->loadRecord($id);
				$shipping = $this->proforma->getDeliverycharge();
				$discount = $this->proforma->getDiscount();
				$total = 0;
				$totalvat = 0;
				
				$dynamicY = $this->newPage() + 7;
				
				foreach ($this->proforma->getItems() AS $item) {
					$line = array( 
							 "Quantity"    => $item->getQuantity(),
				             "Code"  => $item->getProduct()->getProductcode(),		
							 "Description"  => $item->getDescription(),
				             "Price Each"  => number_format($item->getPriceeach(), 2),
				             "Line Total"  => number_format($item->getLinetotal(), 2),
							 "Line VAT"  => number_format($item->getVat(), 2)
				         );
								             
					$size = $this->addLine( $dynamicY, $line );
					$dynamicY += $size + 1;
					
					if ($dynamicY > 225) {
						$dynamicY = $this->newPage();
						$dynamicY = 102;
					}

					$total = $total + ($item->getPriceeach() * $item->getQuantity());

					$totalvat += $item->getVat();
				}
						
				$line = array( 
						 "Quantity"    => " ",
			             "Code"  => " ",		
						 "Description"  => " " ,
			             "Price Each"  => " ",
			             "Line Total"  => "Goods Net:",
						 "Line VAT"  => number_format($total, 2)
			         );
				             
				$size = $this->addLine( 248, $line );
				
				$line = array( 
						 "Quantity"    => " ",
			             "Code"  => " ",		
						 "Description"  => " " ,
			             "Price Each"  => " ",
			             "Line Total"  => "VAT:",
						 "Line VAT"  => number_format($totalvat, 2)
			         );
				             
				$size = $this->addLine( 254, $line );
				
				$line = array( 
						 "Quantity"    => " ",
			             "Code"  => " ",		
						 "Description"  => " " ,
			             "Price Each"  => " ",
			             "Line Total"  => "Total:",
						 "Line VAT"  => number_format(($totalvat + $total) - $discount, 2)
			         );
				             
				$size = $this->addLine( 260, $line );
				

				$this->addText( 162, 265, "Pounds Sterling", 6, 3);
				
			} catch (Exception $e) {
				logError($e->getMessage());
			}
			
			$this->AliasNbPages();
		}
	}
?>