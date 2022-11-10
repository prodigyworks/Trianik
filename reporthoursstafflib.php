<?php
	require_once(__DIR__ . "/pgcore-db.php");
	require_once(__DIR__ . "/pdfreport.php");
	require_once(__DIR__ . "/simple_html_dom.php");
	require_once(__DIR__ . "/businessobjects/DiaryCollectionClass.php");

	class HoursWorkedReport extends PDFReport {
		
		function AddPage($orientation = '', $format = '', $rotationOrKeepmargins = false, $tocpage = false) {
			parent::AddPage($orientation, $format, $rotationOrKeepmargins, $tocpage);
				
			$this->DynamicImage(SessionControllerClass::getSiteConfig()->getLogoimageid(), 173.6, 1, 30);
		
			$size = $this->addText( 10, 13, "Hours - Staff", 12, 4, 'B') + 5;
			$this->SetFont('Arial','', 8);
				
			$cols = array( 
					"Staff Member"  => 115,
					"Holidays"  => 25,
					"Absences"  => 25,
					"Hours Worked"  => 25
				);
			
			$this->addCols($size, $cols);

			$cols = array(
					"Staff Member"  => "L",
					"Holidays"  => "R",
					"Absences"  => "R",
					"Hours Worked"  => "R"
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
			    $startdate = "$year-$month-01";
			    $enddate = "$year-$month-" . cal_days_in_month(CAL_GREGORIAN, $month, $year);
			    
				$sql = "SELECT SUM(TIMESTAMPDIFF(MINUTE, starttime, endtime)) AS hours,  B.fullname AS customername, B.member_id
						FROM {$_SESSION['DB_PREFIX']}diary A 
						INNER JOIN {$_SESSION['DB_PREFIX']}members B 
						ON B.member_id = A.memberid 
						WHERE A.status IN ('I', 'C')
						AND YEAR(A.starttime) = ?
						AND MONTH(A.starttime) = ?
						GROUP BY B.fullname
						ORDER BY B.fullname";
				
				$stmt = SessionControllerClass::getDB()->prepare($sql);
				$stmt->bindValue(1, $year, PDO::PARAM_INT);
				$stmt->bindValue(2, $month, PDO::PARAM_INT);
				$stmt->execute();
				
				while (($row = $stmt->fetch(PDO::FETCH_ASSOC))) {
				
        			    $holidays = 0;
        			    $absences = 0;
        			    $memberid = $row['member_id'];
        			    
        				$sql = "SELECT A.startdate, A.enddate, A.enddate_half, A.startdate_half
        						FROM {$_SESSION['DB_PREFIX']}holiday A 
                                WHERE A.memberid = ?
                                AND A.startdate <= ? 
                                AND A.enddate >= ?
        						UNION ALL
        						SELECT B.startdate, B.enddate, B.enddate_half, B.startdate_half
        						FROM {$_SESSION['DB_PREFIX']}bankholiday B
                                WHERE B.startdate <= ? 
                                AND B.enddate >= ?";
        				
        				$stmt2 = SessionControllerClass::getDB()->prepare($sql);
        				$stmt2->bindValue(1, $memberid, PDO::PARAM_INT);
        				$stmt2->bindValue(2, $enddate, PDO::PARAM_STR);
        				$stmt2->bindValue(3, $startdate, PDO::PARAM_STR);
        				$stmt2->bindValue(4, $enddate, PDO::PARAM_STR);
        				$stmt2->bindValue(5, $startdate, PDO::PARAM_STR);
        				$stmt2->execute();
        				
        				while (($itemmember = $stmt2->fetch(PDO::FETCH_ASSOC))) {
        					    $date1 = new DateTime($startdate);
                                $date2 = new DateTime($itemmember['startdate']);

                                $diff = $date2->diff($date1)->format("%a");

                                if ($diff > 0) {
                                    $realstartdate = $date2;
                                    
                                } else {
                                    $realstartdate = $date1;
                                }
                                
        					    $date1 = new DateTime($enddate);
                                $date2 = new DateTime($itemmember['enddate']);

                                $diff = $date1->diff($date2)->format("%a");
                                
                                if ($diff > 0) {
                                    $realenddate = $date2;
                                    
                                } else {
                                    $realenddate = $date1;
                                }
                                
                                $holidays += $realenddate->diff($realstartdate)->format("%a");
                                $date = $realstartdate->format("Y-m-d");
                                
                            	while (strtotime($date) <= strtotime($realenddate->format("Y-m-d"))) {
                            	    if (date("w", strtotime($date)) == 0 || date("w", strtotime($date)) == 6) {
                            	        $holidays--;
                            	    }
                            	    
                                    $date = date ("Y-m-d", strtotime("+1 day", strtotime($date)));
                            	}
                            	
                                if ($itemmember['enddate_half'] == 1) {
                                    $holidays += 0.5;
                                }
                                
                                if ($itemmember['startdate_half'] == 1) {
                                    $holidays += 0.5;
                                }
        				}
        					
        				$sql = "SELECT *
        						FROM {$_SESSION['DB_PREFIX']}absence A 
                                WHERE memberid = ?
                                AND startdate <= ? 
                                AND enddate >= ?";
        				
        				$stmt2 = SessionControllerClass::getDB()->prepare($sql);
        				$stmt2->bindValue(1, $memberid, PDO::PARAM_INT);
        				$stmt2->bindValue(2, $enddate, PDO::PARAM_STR);
        				$stmt2->bindValue(3, $startdate, PDO::PARAM_STR);
        				$stmt2->execute();
        				
        				while (($itemmember = $stmt2->fetch(PDO::FETCH_ASSOC))) {
        					    $date1 = new DateTime($startdate);
                                $date2 = new DateTime($itemmember['startdate']);

                                $diff = $date2->diff($date1)->format("%a");

                                if ($diff > 0) {
                                    $realstartdate = $date2;
                                    
                                } else {
                                    $realstartdate = $date1;
                                }
                                
        					    $date1 = new DateTime($enddate);
                                $date2 = new DateTime($itemmember['enddate']);

                                $diff = $date1->diff($date2)->format("%a");
                                
                                if ($diff > 0) {
                                    $realenddate = $date2;
                                    
                                } else {
                                    $realenddate = $date1;
                                }
                                
                                $absences += $realenddate->diff($realstartdate)->format("%a");
                                $date = $realstartdate->format("Y-m-d");
                                
                            	while (strtotime($date) <= strtotime($realenddate->format("Y-m-d"))) {
                            	    if (date("w", strtotime($date)) == 0 || date("w", strtotime($date)) == 6) {
                            	        $absences--;
                            	    }
                            	    
                                    $date = date ("Y-m-d", strtotime("+1 day", strtotime($date)));
                            	}
                            	
                                if ($itemmember['enddate_half'] == 1) {
                                    $absences += 0.5;
                                }
                                
                                if ($itemmember['startdate_half'] == 1) {
                                    $absences += 0.5;
                                }
        				}
					    
						$line=array(
								"Staff Member"  => $row['customername'],
            					"Holidays"  => " " . number_format($holidays, 1),
            					"Absences"  => " " . number_format($absences, 1),
								"Hours Worked"  => number_format($row['hours'] / 60, 2)
							);
							
							
						if ($this->GetY() > 260) {
							$this->AddPage();
						}
						
						$this->addLine( $this->GetY(), $line, 5.5);
						$this->Line( 10, $this->GetY() - 0.5, 200, $this->GetY() - 0.5);
					}
				
			} catch (Exception $e) {
				logError($e->getMessage());
			}
		}
	}
	
	$pdf = new HoursWorkedReport( 'P', 'mm', 'A4', $_POST['year'], $_POST['month']);
	$pdf->Output();
?>