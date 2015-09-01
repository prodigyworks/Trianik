<?php 
	include "system-db.php";
	
	function getTimeDifference($starttime, $endtime) {
		$startmins = (substr($starttime, 0, 2) * 60) + substr($starttime, 3, 2);
		$endmins = (substr($endtime, 0, 2) * 60) + substr($endtime, 3, 2);
		$diff = $endmins - $startmins;
		$time = "";
		
		$hours = number_format(($diff / 60), 1) . " hrs";
		
		return $hours;
	}
	
	start_db();
	
	$startdate = ($_GET['from']);
	$enddatetime = ($_GET['to']);
	$enddate = ($_GET['to']);
	$json = array();
	$memberarray = array();
	$emailarray = array();
	
	if ($_GET['mode'] == "S") {
		$sectionid = "memberid";

	} else if ($_GET['mode'] == "C") {
		$sectionid = "clientid";
		
	} else {
		$sectionid = null;
		exit();
	}
	
	$sql = "SELECT id, name FROM {$_SESSION['DB_PREFIX']}client WHERE status = 'L' ORDER BY name DESC";
	$result = mysql_query($sql);
	
	//Check whether the query was successful or not
	if($result) {
		while (($member = mysql_fetch_assoc($result))) {
			if ($sectionid != null) {
				$clientid = $member['id'];
				$date = $startdate;
				
				if (strtotime($date) < strtotime(date("Y-m-d"))) {
					$date = date("Y-m-d");
				}
				
				while (strtotime($date) < strtotime($enddate)) {
					$weekday = date("w", strtotime($date));
					$found = false;
					
//					$sql = "SELECT A.* 
//							FROM {$_SESSION['DB_PREFIX']}diary A 
//							WHERE clientid = $clientid
//							AND starttime >= '$date' 
//							AND endtime <= '$date 23:59:59'";
//					$itemresult = mysql_query($sql);
//					
//					//Check whether the query was successful or not
//					if($itemresult) {
//						while (($itemmember = mysql_fetch_assoc($itemresult))) {
//							$found = true;
//						}
//						
//					} else {
//						logError($sql . " - " . mysql_error());
//					}
				
					if (! $found) {
						$sql = "SELECT A.* 
								FROM {$_SESSION['DB_PREFIX']}clientschedule A 
								WHERE A.clientid = $clientid
								AND A.weekday = $weekday 
								AND A.id NOT IN 
							   	(
							   		SELECT B.scheduleid FROM {$_SESSION['DB_PREFIX']}diary B
							    	WHERE B.starttime >= '$date 00:00:00' 
									AND B.endtime <= '$date 23:59:59'
							    )";
						$itemresult = mysql_query($sql);
						
						//Check whether the query was successful or not
						if ($itemresult) {
							while (($itemmember = mysql_fetch_assoc($itemresult))) {
								$memberid = $itemmember['memberid'];
								$status = "U";
								$scheduleid = $itemmember['id'];
								$addToDiary = false;
								$found = true;
								
								if ($itemmember['mode'] == "W") {
									$addToDiary = true;
									
								} else if ($itemmember['mode'] == "T") {
									$date1 = new DateTime($itemmember['begindate']);
									$date2 = new DateTime($date);
 
									$diff = $date2->diff($date1)->format("%a");
									
									if (($diff % 14) == 0) {
										$addToDiary = true;
									}
									
								} else if ($itemmember['mode'] == "O") {
									if (strtotime($itemmember['begindate']) == strtotime($date)) {
										$addToDiary = true;
									}
									
								} else if ($itemmember['mode'] == "F") {
									$date1 = new DateTime($itemmember['begindate']);
									$date2 = new DateTime($date);
 
									$diff = $date2->diff($date1)->format("%a");
									
									if (($diff % 28) == 0) {
										$addToDiary = true;
									}
								}
								
								if ($addToDiary) {
									$starttime = $date . " " . $itemmember['starttime'];
									$endtime = $date . " " . $itemmember['endtime'];
									
									$sql = "INSERT INTO {$_SESSION['DB_PREFIX']}diary
											(
												clientid, memberid, status, starttime, endtime, scheduleid
											)
											VALUES
											(
												$clientid, $memberid, '$status', '$starttime', '$endtime', $scheduleid
											)";
									/* Add record from template */
									$insertresult = mysql_query($sql);
	
									if (! $insertresult) {
										logError($sql . " - " . mysql_error());
									}
									
									if (! in_array($memberid, $emailarray)) {
										array_push($memberarray, $key);
									}
								}
							}
							
						} else {
							logError($sql . " - " . mysql_error());
						}
					}
					
					$date = date ("Y-m-d", strtotime("+1 day", strtotime($date)));
				}
			}
			
			$sql = "SELECT A.*, B.name, C.fullname
					FROM {$_SESSION['DB_PREFIX']}diary A 
					INNER JOIN {$_SESSION['DB_PREFIX']}client B
					ON B.id = A.clientid 
					INNER JOIN {$_SESSION['DB_PREFIX']}members C
					ON C.member_id = A.memberid 
					AND C.member_id != 1
					WHERE A.deleted = 'N'
					AND A.clientid = $clientid
					AND A.starttime < '$enddate 23:59:59' 
					AND A.endtime >= '$startdate 00:00:00'
					ORDER BY A.starttime";
			$found = false;
			$itemresult = mysql_query($sql);
			
			//Check whether the query was successful or not
			if($itemresult) {
				while (($itemmember = mysql_fetch_assoc($itemresult))) {
					if ($itemmember['status'] == "U") {
						$color = "yellow";
						
					} else if ($itemmember['status'] == "I") {
						$color = "red";
						
					} else {
						$color = "green";
					}
					
					$sdate = $itemmember['starttime'];
					$edate = $itemmember['endtime'];
					
					$weekday = date("w", strtotime($sdate));
					$key = $itemmember['memberid'] . "_" . $weekday;
					
					if (! in_array($key, $memberarray)) {
						array_push($memberarray, $key);
					}
					
					array_push(
							$json, 
							array(
									"id" => $itemmember['id'],
									"color" => $color,
									"textColor" => "black",
    								"true_start_date" => "$sdate",
									"start_date" => substr($sdate, 0, 10) . " 00:00:00",
									"end_date" => substr($edate, 0, 10) . " 23:59:59",
									"text" => "<div class='entry'><span class='toleft'>" . ($sectionid == "clientid" ? $itemmember['fullname'] : $itemmember['name']) . "</span><span class='toright'>" . substr($sdate, 11, 5) . "-" . substr($edate, 11, 5) . " " . getTimeDifference(substr($sdate, 11), substr($edate, 11))  . "</span></div>",
									"section_id" => $itemmember[$sectionid]
								)
						);
				}
				
			} else {
				logError($sql . " - " . mysql_error());
			}
			
		}
				
	} else {
		logError($sql . " - " . mysql_error());
	}
	
	if ($_GET['mode'] == "S") {
		$date = $startdate;
	
		while (strtotime($date) < strtotime($enddate)) {
			$weekday = date("w", strtotime($date));
			
			$sql = "SELECT A.member_id 
					FROM {$_SESSION['DB_PREFIX']}members A 
					WHERE A.member_id != 1
					ORDER BY member_id";
			$found = false;
			$result = mysql_query($sql);
			
			//Check whether the query was successful or not
			if ($result) {
				while (($member = mysql_fetch_assoc($result))) {
					$memberid = $member['member_id'];
					$key = $member['member_id'] . "_" . $weekday;
						
					$found = false;
					$sql = "SELECT A.* 
							FROM {$_SESSION['DB_PREFIX']}memberrota A 
							WHERE memberid = $memberid
							AND weekday = $weekday";
					$itemresult = mysql_query($sql);
					
					//Check whether the query was successful or not
					if ($itemresult) {
						while (($itemmember = mysql_fetch_assoc($itemresult))) {
							$found = true;
						}
					}
					
					if (! $found && ! in_array($key, $memberarray)) {
						array_push(
								$json, 
								array(
										"id" => "MEM" . $memberid . " " . $weekday,
										"color" => "#F0F0F0",
										"textColor" => "black",
										"start_date" => "$date 00:00:00",
										"end_date" => "$date 23:59:59",
										"true_start_date" => "$date 00:00:00",
										"text" => "Not-working",
										"section_id" => $memberid
									)
							);
					}
				}
			}
			
			$date = date ("Y-m-d", strtotime("+1 day", strtotime($date)));
		}
		
		$sql = "SELECT A.* 
				FROM {$_SESSION['DB_PREFIX']}holiday A 
				WHERE startdate <= '$enddate' 
				AND enddate >= '$startdate' ";
		$result = mysql_query($sql);
		
		//Check whether the query was successful or not
		if ($result) {
			while (($member = mysql_fetch_assoc($result))) {
				$sdate = $member['startdate'];
				$edate = $member['enddate'];
				
				array_push(
						$json, 
						array(
								"id" => "HOL" . $member['id'],
								"color" => "blue",
								"textColor" => "white",
								"start_date" => "$sdate 00:00:00",
								"end_date" => "$edate 23:59:59",
								"true_start_date" => "$date 00:00:00",
								"text" => "Holiday",
								"section_id" => $member['memberid']
							)
					);
			}
		}
		
		$sql = "SELECT A.* 
				FROM {$_SESSION['DB_PREFIX']}absence A 
				WHERE startdate <= '$enddate' 
				AND enddate >= '$startdate' ";
		$result = mysql_query($sql);
		
		//Check whether the query was successful or not
		if ($result) {
			while (($member = mysql_fetch_assoc($result))) {
				$sdate = $member['startdate'];
				$edate = $member['enddate'];
				
				array_push(
						$json, 
						array(
								"id" => "ABS" . $member['id'],
								"color" => "purple",
								"textColor" => "white",
								"start_date" => "$sdate 00:00:00",
								"end_date" => "$edate 23:59:59",
								"true_start_date" => "$date 00:00:00",
								"text" => $member['absencetype'],
								"section_id" => $member['memberid']
							)
					);
			}
		}
	}

	mysql_query("COMMIT");
	
	echo json_encode($json);
?>