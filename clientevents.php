<?php 
	require_once(__DIR__ . "/pgcore-db.php");
	require_once(__DIR__ . "/businessobjects/UserCollectionClass.php");
	require_once(__DIR__ . "/businessobjects/DiaryCollectionClass.php");
	require_once(__DIR__ . "/businessobjects/ClientCollectionClass.php");
	require_once(__DIR__ . "/businessobjects/HolidayCollectionClass.php");
	require_once(__DIR__ . "/businessobjects/AbsenceCollectionClass.php");
	require_once(__DIR__ . "/businessobjects/BankholidayCollectionClass.php");
	require_once(__DIR__ . "/businessobjects/ClientscheduleCollectionClass.php");
	require_once(__DIR__ . "/businessobjects/MemberrotaClass.php");
	
	function getTimeDifference($starttime, $endtime) {
		$startmins = (substr($starttime, 0, 2) * 60) + substr($starttime, 3, 2);
		$endmins = (substr($endtime, 0, 2) * 60) + substr($endtime, 3, 2);
		$diff = $endmins - $startmins;
		$time = "";
		
		$hours = number_format(($diff / 60), 1) . " hrs";
		
		return $hours;
	}
	
	$startdate = ($_GET['from']);
	$enddate = ($_GET['to']);
	$json = array();
	$memberarray = array();
	
	if ($_GET['mode'] != "S" && $_GET['mode'] != "C") {
		header('HTTP/1.0 403 Forbidden');
		exit();
	}
	
	try {
		SessionControllerClass::getDB()->beginTransaction();
		
		$clients = new ClientCollectionClass();
		$clients->loadLiveClients(function (ClientClass $client) use(&$startdate, &$enddate, &$memberarray, &$json, &$sectionid) {
			$date = $startdate;
			
			while (strtotime($date) < strtotime($enddate)) {
				$weekday = date("w", strtotime($date));
			
				$schedules = new ClientscheduleCollectionClass();
				$schedules->loadLiveClientSchedulesByWeekday($client->getId(), $weekday, $date, function (ClientscheduleClass $clientSchedule) use(&$date) {
					$addToDiary = false;
		
					if ($clientSchedule->getMode() == "W") {
						$addToDiary = true;
							
					} else if ($clientSchedule->getMode() == "T") {
						$date1 = new DateTime($clientSchedule->getBegindate());
						$date2 = new DateTime($date);
		
						$diff = $date2->diff($date1)->format("%a");
							
						if (($diff % 14) == 0) {
							$addToDiary = true;
						}
							
					} else if ($clientSchedule->getMode() == "O") {
						if (strtotime($clientSchedule->getBegindate()) == strtotime($date)) {
							$addToDiary = true;
						}
							
					} else if ($clientSchedule->getMode() == "F") {
						$date1 = new DateTime($clientSchedule->getBegindate());
						$date2 = new DateTime($date);
		
						$diff = $date2->diff($date1)->format("%a");
							
						if (($diff % 28) == 0) {
							$addToDiary = true;
						}
					}
		
					if ($addToDiary) {
						$diary = new DiaryClass();
						$diary->setClientid($clientSchedule->getClientid());
						$diary->setMemberid($clientSchedule->getMemberid());
						$diary->setStatus("U");
						$diary->setDeleted("N");
						$diary->setStarttime($date . " " . $clientSchedule->getStarttime());
						$diary->setEndtime($date . " " . $clientSchedule->getEndtime());
						$diary->setScheduleid($clientSchedule->getId());
						$diary->insertRecord();
					}
				});
					
				$date = date ("Y-m-d", strtotime("+1 day", strtotime($date)));
			}
			
			$diaries = new DiaryCollectionClass();
			$diaries->loadDiaryByClientInDateRange($client->getId(), $startdate, $enddate, function (DiaryClass $diary) use(&$memberarray, &$json) {
				if ($diary->getStatus() == "U") {
					$color = "yellow";
					
				} else if ($diary->getStatus() == "I") {
					$color = "red";
					
				} else {
					$color = "#55FF55";
				}
						
				$sdate = $diary->getStarttime();
				$edate = $diary->getEndtime();
				
				$weekday = date("w", strtotime($sdate));
				$key = "{$diary->getMemberid()}_{$weekday}";
				
				if (! in_array($key, $memberarray)) {
					array_push($memberarray, $key);
				}
				
				array_push(
						$json, 
						array(
							"id" => $diary->getId(),
							"color" => $color,
							"textColor" => "black",
	    					"true_start_date" => "$sdate",
							"start_date" => substr($sdate, 0, 10) . " 00:00:00",
							"end_date" => substr($edate, 0, 10) . " 23:59:59",
							"text" => "<div class='entry'><span class='toleft'>" . ($_GET['mode'] == "C" ? $diary->getCleaner()->getFullname() : $diary->getClient()->getName()) . "</span><span class='toright'>" . substr($sdate, 11, 5) . "-" . substr($edate, 11, 5) . " " . getTimeDifference(substr($sdate, 11), substr($edate, 11))  . "</span></div>",
							"section_id" => ($_GET['mode'] == "C" ? $diary->getClientid() : $diary->getMemberid())
						)
					);
			});
		});
			
		if ($_GET['mode'] == "S") {
			$date = $startdate;
			
			while (strtotime($date) < strtotime($enddate)) {
				$weekday = date("w", strtotime($date));
					
				$cleaners = new UserCollectionClass();
				$cleaners->loadAllButAdmin(function (UserClass $cleaner) use(&$json, &$weekday, &$memberarray, &$date) {
					$key = "{$cleaner->getMember_id()}_{$weekday}";
					
					$memberrota = new MemberrotaClass();
					$memberrota->loadByMemberAndWeekday($cleaner->getMember_id(), $weekday);
					
					if ($memberrota->getId() == null && ! in_array($key, $memberarray)) {
						array_push(
								$json, 
								array(
										"id" => "MEM{$key}",
										"color" => "#F0F0F0",
										"textColor" => "black",
										"start_date" => "$date 00:00:00",
										"end_date" => "$date 23:59:59",
										"true_start_date" => "$date 00:00:00",
										"text" => "Not-working",
										"section_id" => $cleaner->getMember_id()
									)
							);
					}
				});
				
				$date = date ("Y-m-d", strtotime("+1 day", strtotime($date)));
			}
			
			$holidays = new HolidayCollectionClass();
			$holidays->loadByDateRange($startdate, $enddate, function (HolidayClass $holiday) use(&$json) {
					array_push(
							$json, 
							array(
									"id" => "HOL{$holiday->getId()}",
									"color" => "blue",
									"textColor" => "white",
									"start_date" => "{$holiday->getStartdate()} 00:00:00",
									"end_date" => "{$holiday->getEnddate()} 23:59:59",
									"true_start_date" => "{$holiday->getStartdate()}  00:00:00",
									"text" => "Holiday",
									"section_id" => $holiday->getMemberid()
								)
						);
				});
				
			$bankholidays = new BankholidayCollectionClass();
			$bankholidays->loadByDateRange($startdate, $enddate, function (BankholidayClass $bankholiday) use(&$json) {
	
				$cleaners = new UserCollectionClass();
				$cleaners->loadAllButAdmin(function (UserClass $cleaner) use(&$json, $bankholiday) {
					
						array_push(
								$json,
								array(
										"id" => "BANK{$bankholiday->getId()}-{$cleaner->getMember_id()}",
										"color" => "orange",
										"textColor" => "black",
										"start_date" => "{$bankholiday->getStartdate()} 00:00:00",
										"end_date" => "{$bankholiday->getEnddate()} 23:59:59",
										"true_start_date" => "{$bankholiday->getStartdate()}  00:00:00",
										"text" => $bankholiday->getName(),
										"section_id" => $cleaner->getMember_id()
								)
							);
					});
			});
				
			$absences = new AbsenceCollectionClass();
			$absences->loadByDateRange($startdate, $enddate, function (AbsenceClass $absence) use(&$json) {
				array_push(
						$json,
						array(
								"id" => "ABS{$absence->getId()}",
								"color" => "purple",
								"textColor" => "white",
								"start_date" => "{$absence->getStartdate()} 00:00:00",
								"end_date" => "{$absence->getEnddate()} 23:59:59",
								"true_start_date" => "{$absence->getStartdate()}  00:00:00",
								"text" => $absence->getAbsencetype(),
								"section_id" => $absence->getMemberid()
						)
					);
			});
		}
		
		SessionControllerClass::getDB()->commit();
		
		echo json_encode($json);
		
	} catch (Exception $e) {
		SessionControllerClass::getDB()->rollBack();
		
		header('HTTP/1.0 400 Bad Request');
	}
?>