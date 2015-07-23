<?php 
	include "system-db.php";
	
	start_db();
	
	$startdate = ($_GET['from']);
	$enddate = ($_GET['to']);
	$json = array();
	
	if ($_GET['mode'] == "S") {
		$sectionid = "memberid";

	} else if ($_GET['mode'] == "C") {
		$sectionid = "clientid";
	}
	
	$sql = "SELECT id, name FROM {$_SESSION['DB_PREFIX']}client WHERE status = 'L' ORDER BY name";
	$result = mysql_query($sql);
	
	//Check whether the query was successful or not
	if($result) {
		while (($member = mysql_fetch_assoc($result))) {
			$clientid = $member['id'];
			$sql = "SELECT A.* 
					FROM {$_SESSION['DB_PREFIX']}diary A 
						WHERE clientid = $clientid
					AND starttime <= '$enddate' 
					AND endtime >= '$startdate'";
			$found = false;
			$itemresult = mysql_query($sql);
			
			//Check whether the query was successful or not
			if($itemresult) {
				while (($itemmember = mysql_fetch_assoc($itemresult))) {
					$found = true;
				}
				
			} else {
				logError($sql . " - " . mysql_error());
			}
			
			if (! $found) {
				$sql = "SELECT A.* FROM {$_SESSION['DB_PREFIX']}clientschedule A WHERE clientid = $clientid";
				$itemresult = mysql_query($sql);
				
				//Check whether the query was successful or not
				if($itemresult) {
					while (($itemmember = mysql_fetch_assoc($itemresult))) {
						$memberid = $itemmember['memberid'];
						$status = "U";
						
						$date = new DateTime($startdate);
						$date->add(new DateInterval("P" . $itemmember['weekday'] .  "D"));
						$starttime = $date->format('Y-m-d') . " " . $itemmember['starttime'];
						$endtime = $date->format('Y-m-d') . " " . $itemmember['endtime'];
						
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
			
			$sql = "SELECT A.*, B.name, C.fullname
					FROM {$_SESSION['DB_PREFIX']}diary A 
					INNER JOIN {$_SESSION['DB_PREFIX']}client B
					ON B.id = A.clientid 
					INNER JOIN {$_SESSION['DB_PREFIX']}members C
					ON C.member_id = A.memberid 
					WHERE A.clientid = $clientid
					AND A.starttime <= '$enddate' 
					AND A.endtime >= '$startdate'";
			$found = false;
			$itemresult = mysql_query($sql);
			
			//Check whether the query was successful or not
			if($itemresult) {
				while (($itemmember = mysql_fetch_assoc($itemresult))) {
					array_push(
							$json, 
							array(
									"id" => $itemmember['id'],
									"color" => "yellow",
									"textColor" => "black",
									"start_date" => substr($itemmember['starttime'], 0, 10),
									"end_date" => substr($itemmember['endtime'], 0, 10) . " 23:59",
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