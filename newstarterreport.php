<?php
	require_once('system-db.php');
	require_once('pdfreport.php');
	require_once("simple_html_dom.php");
	
	class NewStarterReport extends PDFReport {
		
		function AddPage($orientation='', $size='') {
			parent::AddPage($orientation, $size);
			
			$this->Image("images/logomain2.png", 165.6, 1);
		}
		
		function __construct($orientation, $metric, $size, $id) {
			$dynamicY = 0;
			
	        parent::__construct($orientation, $metric, $size);
	        
	        $this->SetAutoPageBreak(true, 5);
	        
			$this->AddPage();
			
			try {
				$sql = "SELECT * 
						FROM {$_SESSION['DB_PREFIX']}client A 
						WHERE id = $id";
				$result = mysql_query($sql);
				
				if ($result) {
					while (($member = mysql_fetch_assoc($result))) {
						$this->Rect(5, 21, 200, 270);
						$this->Line(5, 28, 205, 28);
						$this->Line(5, 55, 205, 55);
						$this->Line(5, 81, 205, 81);
						$this->Line(5, 88, 205, 88);
						$this->Line(5, 95.5, 205, 95.5);
						
//						if ($member['paymentmethod'] == "Q") {
//							$paymentmethod = "Cheque";
//						
//						} else if ($member['paymentmethod'] == "C") {
//							$paymentmethod = "Credit Card";
//						
//						} else if ($member['paymentmethod'] == "D") {
//							$paymentmethod = "Debit Card";
//						
//						} else if ($member['paymentmethod'] == "B") {
//							$paymentmethod = "Bank Transfer";
//						}
						$paymentmethod = "Cheque / Credit Card / Debit Card / Bank Transfer";
						
						$this->addText( 10, 13, "Trianik Cleaners Ltd Starter Form", 12, 4, 'B');
						
						$this->addText( 10, 23, "Name of Organisation", 10, 4, '');
						$this->addText( 50, 23, $member['name'], 10, 4, '');
						$this->addText( 110, 23, "Contact Name", 10, 4, '');
						$this->addText( 140, 23, $member['firstname'] . " " . $member['lastname'], 10, 4, '');
						
						$this->addText( 10, 38, "Address", 10, 4, '');
						$this->addText( 50, 30, $member['address'], 10, 4, '');
						
						$this->addText( 10, 63, "Billing Address If Different", 10, 4, '', 29);
						$this->addText( 50, 57, $member['billingaddress'], 10, 4, '');
						
						$this->addText( 10, 83, "Home Phone", 10, 4, '', 30);
						$this->addText( 50, 83, $member['telephone'], 10, 4, '', 30);
						
						$this->addText( 110, 83, "Mobile number", 10, 4, '');
						$this->addText( 140, 83, $member['mobile'], 10, 4, '', 30);
						
						$this->addText( 10, 90, "Work Phone", 10, 4, '', 30);
						$this->addText( 50, 90, $member['workphone'], 10, 4, '', 30);
						
						$this->addText( 10, 98, "Email Address", 10, 4, '', 30);
						$this->addText( 50, 98, $member['email'], 10, 4, '');
						
						$this->addText( 10, 108, "Paper Free Biling Address", 10, 4, '', 30);
						$this->addText( 50, 108, $member['paperfreebillingaddress'], 10, 4, '');
						
						$this->addText( 10, 118, "Payment Method", 10, 4, '', 30);
						$this->addText( 50, 118, $paymentmethod, 10, 4, '');
						$this->addText( 10, 153, "Credit/Debit Card Details", 10, 4, '', 30);
						
						$this->addText( 50, 125, "Name as it appears on Card", 8, 3, 'B');
						$this->addText( 50, 137, "Address of cardholder", 8, 3, 'B');
						$this->addText( 50, 149, "16 Digits on the front of the card", 8, 3, 'B');
						$this->addText( 50, 161, "Valid from", 8, 3, 'B');
						$this->addText( 80, 161, "Expiry Date", 8, 3, 'B');
						$this->addText( 110, 161, "Card security code", 8, 3, 'B');
						$this->addText( 150, 161, "Issue Number", 8, 3, 'B');
						
						$this->SetTextColor(180, 180, 180);
						$this->addText( 50, 167, "MM", 8, 3, '');
						$this->addText( 60, 167, "YY", 8, 3, '');
						
						$this->addText( 80, 167, "MM", 8, 3, '');
						$this->addText( 90, 167, "YY", 8, 3, '');
						
						$this->SetTextColor(0, 0, 0);
						
						$this->Image("images/newstarterform.png", 50, 173);
						
						$this->addText( 10, 198, "Payment Authorisation", 10, 4, '', 30);
						$this->addText( 50, 186, "I authorise Trianik Cleaners Ltd to debit my account monthly on or around the _________ of the Month", 8, 3, '');
						$this->addText( 60, 196, "Signature", 8, 3, 'B');
						
						$this->SetTextColor(255, 0, 0);
						$this->addText( 76, 194, "X", 16, 5, 'B');
						
						$this->SetTextColor(0, 0, 0);
						
						$this->addText( 120, 196, "Print Name", 8, 3, 'B');
						$this->addText( 120, 202, "Date", 8, 3, 'B');
						
						$this->SetTextColor(180, 180, 180);
						$this->addText( 130, 202, "D", 8, 3, '');
						$this->addText( 140, 202, "D", 8, 3, '');
						$this->addText( 150, 202, "M", 8, 3, '');
						$this->addText( 160, 202, "M", 8, 3, '');
						$this->addText( 170, 202, "Y", 8, 3, '');
						$this->addText( 180, 202, "Y", 8, 3, '');
						
						$this->SetTextColor(0, 0, 0);

						$this->addText( 50, 208, "TCL will debit your card for payment on or after the date shown above. Please make sure you have enough money in your account to meet the payment in full", 8, 3, 'B', 146);

						$this->addText( 10, 232, "Keyholding", 10, 4, '', 30);
						$this->addText( 50, 218, "Number of keys given ?", 8, 3, 'B');
						$this->addText( 50, 226, "Alarm Fob been given ?", 8, 3, 'B');
						$this->addText( 50, 234, "Alarm Codes", 8, 3, 'B');
						$this->addText( 50, 242, "Access Instructions", 8, 3, 'B');
						$this->addText( 50, 250, "Trianik take responsibility of your keys, they will be given a keyring with its own unique code, never displaying names or address, we will only gain access to your property at mutually agreed times.", 8, 3, 'B', 146);
						
						$this->addText( 10, 270, "Access Authorisation", 10, 4, '', 30);
						$this->addText( 50, 260, "I authorise Trianik Cleaners Ltd to act as resposible key holders to my property.", 8, 3, 'B', 146);
						
						$this->addText( 60, 270, "Signature", 8, 3, 'B');
						
						$this->SetTextColor(255, 0, 0);
						$this->addText( 76, 268, "X", 16, 5, 'B');
						
						$this->SetTextColor(0, 0, 0);
						
						$this->addText( 120, 270, "Print Name", 8, 3, 'B');
						$this->addText( 120, 276, "Date", 8, 3, 'B');
						
						$this->SetTextColor(180, 180, 180);
						$this->addText( 130, 276, "D", 8, 3, '');
						$this->addText( 140, 276, "D", 8, 3, '');
						$this->addText( 150, 276, "M", 8, 3, '');
						$this->addText( 160, 276, "M", 8, 3, '');
						$this->addText( 170, 276, "Y", 8, 3, '');
						$this->addText( 180, 276, "Y", 8, 3, '');
						
						$this->SetTextColor(0, 0, 0);
					}
					
				} else {
					logError($sql . " - " . mysql_error());
				}
				
			} catch (Exception $e) {
				logError($e->getMessage());
			}
		}
	}
	
	start_db();
	
	$pdf = new NewStarterReport( 'P', 'mm', 'A4', $_GET['id']);
	$pdf->Output();
?>