<?php
	require_once('system-db.php');
	require_once('pdfreport.php');
	require_once("simple_html_dom.php");
	
	class LeadsCallbackReport extends PDFReport {
		function newPage() {
			$this->Image("images/logomain.png", 75.6, 1);

			$this->SetFont('Arial','', 6);
			$this->SetY(30);
		}
		
		function AddPage($orientation='', $size='') {
			parent::AddPage($orientation, $size);
			
			$this->newPage();
			
			$this->addText( 151.5, 21,SessionControllerClass::getSiteConfig()->getCompanydetails(), 9, 3.5, '');
		}
		
		function __construct($orientation, $metric, $size) {
			$dynamicY = 0;
			
	        parent::__construct($orientation, $metric, $size);
	        
	        $this->SetAutoPageBreak(true, 30);
	        
			$this->AddPage();
			$this->addText( 10, 50, $_POST['adhoctext'], 11, 3.7, '');
		}
	}
	
	start_db();
	
	$pdf = new LeadsCallbackReport( 'P', 'mm', 'A4');
	$pdf->Output();
?>