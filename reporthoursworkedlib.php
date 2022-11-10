<?php
	require_once(__DIR__ . "/pgcore-db.php");
	require_once(__DIR__ . "/pdfreport.php");
	require_once(__DIR__ . "/simple_html_dom.php");
	require_once(__DIR__ . "/businessobjects/DiaryCollectionClass.php");
	
	class HoursWorkedReport extends PDFReport {
		
		function AddPage($orientation = '', $format = '', $rotationOrKeepmargins = false, $tocpage = false) {
			parent::AddPage($orientation, $format, $rotationOrKeepmargins, $tocpage);
			
			$this->DynamicImage(SessionControllerClass::getSiteConfig()->getLogoimageid(), 173.6, 1, 30);
			
			$size = $this->addText( 10, 13, "Hours Worked - Monthly", 12, 4, 'B') + 5;
			$this->SetFont('Arial','', 8);
				
			$cols = array( 
					"Customer"  		=> 110	,
					"Dates Cleaned" 	=> 40,
					"Hours Per Visit" 	=> 40
				);
			
			$this->addCols($size, $cols);

			$cols = array(
					"Customer"  		=> "L",
					"Dates Cleaned" 	=> "L",
					"Hours Per Visit" 	=> "R"
				);
			$this->addLineFormat( $cols);
			$this->SetY(29);
		}
		
		function __construct($orientation, $metric, $size, $year, $month) {
			$dynamicY = 0;
			
	        parent::__construct($orientation, $metric, $size);
	        
	        $this->SetAutoPageBreak(true, 30);
	        
			$this->AddPage();
			
			try {
				$sql = "SELECT TIMESTAMPDIFF(MINUTE, starttime, endtime) AS hours, DATE_FORMAT(A.starttime, '%d/%m/%Y') AS starttime, B.name AS customername
						FROM {$_SESSION['DB_PREFIX']}diary A 
						INNER JOIN {$_SESSION['DB_PREFIX']}client B 
						ON B.id = A.clientid 
						WHERE A.status IN ('I', 'C')
						AND YEAR(A.starttime) = ?
						AND MONTH(A.starttime) = ?
						AND A.deleted != 'Y'
						ORDER BY B.name, A.starttime";
				
				$stmt = SessionControllerClass::getDB()->prepare($sql);
				$stmt->bindValue(1, $year, PDO::PARAM_INT);
				$stmt->bindValue(2, $month, PDO::PARAM_INT);
				$stmt->execute();

				$prev = null;
				$total = 0;
				$subtotal = 0;
				
				while (($row = $stmt->fetch(PDO::FETCH_ASSOC))) {
					if ($prev != null && $prev != $row['customername']) {
						
						$line=array(
								"Dates Cleaned" 	=> "Customer total",
								"Hours Per Visit" 	=> number_format($subtotal, 2)
						);
						
						if ($this->GetY() > 260) {
							$this->AddPage();
						}
						
						$this->SetFont('Arial','B', 8);
						$this->addLine( $this->GetY(), $line, 5.5);
						$this->Line( 10, $this->GetY() - 0.5, 200, $this->GetY() - 0.5);
						
						$subtotal = 0;
						$this->SetY($this->GetY() + 3);
						$this->SetFont('Arial','', 8);
					}
					
					$subtotal += floatval(number_format($row['hours'] / 60, 2));
					$total += floatval(number_format($row['hours'] / 60, 2));
						
					$line=array(
							"Customer"  		=> $row['customername'],
							"Dates Cleaned" 	=> $row['starttime'],
							"Hours Per Visit" 	=> number_format($row['hours'] / 60, 2)
						);
						
					if ($this->GetY() > 264) {
						$this->AddPage();
					}
						
					$this->addLine( $this->GetY(), $line, 5.5);
					$this->Line( 10, $this->GetY() - 0.5, 200, $this->GetY() - 0.5);
					
					$prev = $row['customername'];
				}
				
				$line=array(
						"Dates Cleaned" 	=> "Customer total",
						"Hours Per Visit" 	=> number_format($subtotal, 2)
				);
				
				if ($this->GetY() > 260) {
					$this->AddPage();
				}
				
				$this->SetFont('Arial','B', 8);
				$this->addLine( $this->GetY(), $line, 5.5);
				$this->Line( 10, $this->GetY() - 0.5, 200, $this->GetY() - 0.5);
				
				$line=array(
						"Dates Cleaned" 	=> "Total",
						"Hours Per Visit" 	=> number_format($total, 2)
				);
				
				if ($this->GetY() > 260) {
					$this->AddPage();
				}
				
				$this->addLine( $this->GetY(), $line, 5.5);
				$this->Line( 10, $this->GetY() - 0.5, 200, $this->GetY() - 0.5);
				
			} catch (Exception $e) {
				logError($e->getMessage());
			}
		}
	}
	
	$pdf = new HoursWorkedReport( 'P', 'mm', 'A4', $_POST['year'], $_POST['month']);
	$pdf->Output();
?>