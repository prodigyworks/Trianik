<?php
	require('invoicereportlib.php');
	
	$pdf = new QuoteReport( 'P', 'mm', 'A4', $_GET['id']);
	$pdf->Output();
?>