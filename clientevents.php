<?php 
	include "system-db.php";
	
	start_db();
	
	$startdate = ($_GET['from']);
	$enddatetime = ($_GET['to']);
	$enddate = ($_GET['to']);
	$json = array();
	
	if ($_GET['mode'] == "S") {
		$sectionid = "memberid";

	} else if ($_GET['mode'] == "C") {
		$sectionid = "clientid";
		
	} else {
		$sectionid = null;
		exit();
	}
	
	logError("START:$startdate AND $enddate", false);
	
	$sql = "SELECT id, name FROM {$_SESSION['DB_PREFIX']}client WHERE status = 'L' ORDER BY name";
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
					
					$sql = "SELECT A.* 
							FROM {$_SESSION['DB_PREFIX']}diary A 
							WHERE clientid = $clientid
							AND starttime >= '$date' 
							AND endtime <= '$date 23:59:59'";
					$found = false;
					$itemresult = mysql_query($sql);
					
					logError($sql, false);
					
					//Check whether the query was successful or not
					if($itemresult) {
						while (($itemmember = mysql_fetch_assoc($itemresult))) {
							$found = true;
						}
						
					} else {
						logError($sql . " - " . mysql_error());
					}
				
					if (! $found) {
						$sql = "SELECT A.* 
								FROM {$_SESSION['DB_PREFIX']}clientschedule A 
								WHERE A.clientid = $clientid
								AND A.weekday = $weekday";
						$itemresult = mysql_query($sql);
						
						//Check whether the query was successful or not
						if ($itemresult) {
							while (($itemmember = mysql_fetch_assoc($itemresult))) {
								$memberid = $itemmember['memberid'];
								$status = "U";
								
								$starttime = $date . " " . $itemmember['starttime'];
								$endtime = $date . " " . $itemmember['endtime'];
								
								$sql = "INSERT INTO {$_SESSION['DB_PREFIX']}diary
										(
											clientid, memberid, status, starttime, endtime
										)
										VALUES
										(
											$clientid, $memberid, '$status', '$starttime', '$endtime'
										)";
								/* Add record from template */
								$insertresult = mysql_query($sql);

								if (! $insertresult) {
									logError($sql . " - " . mysql_error());
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
					WHERE A.clientid = $clientid
					AND A.starttime < '$enddate' 
					AND A.endtime >= '$startdate'";
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
					
					array_push(
							$json, 
							array(
									"id" => $itemmember['id'],
									"color" => $color,
									"textColor" => "black",
									"start_date" => ($itemmember['starttime']),
									"end_date" => ($itemmember['endtime']),
									"text" => ($sectionid == "clientid" ? $itemmember['fullname'] : $itemmember['name']),
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
	
	mysql_query("COMMIT");
	
	echo json_encode($json);
?>