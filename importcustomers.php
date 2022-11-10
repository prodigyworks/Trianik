<?php
	include("system-header.php"); 
	
	$substringstart = 0;
	
	function startsWith($Haystack, $Needle){
	    // Recommended version, using strpos
	    return strpos($Haystack, $Needle) === 0;
	}
	
	class PriceItem {
	    // property declaration
	    public $from = 0;
	    public $to = 0;
	}
 
	class ProductLength {
	    // property declaration
	    public $length = 0;
	    public $longline = 0;
	}

	if (isset($_FILES['customerfile']) && $_FILES['customerfile']['tmp_name'] != "") {
		if ($_FILES["customerfile"]["error"] > 0) {
			echo "Error: " . $_FILES["customerfile"]["error"] . "<br />";
			
		} else {
		  	echo "Upload: " . $_FILES["customerfile"]["name"] . "<br />";
		  	echo "Type: " . $_FILES["customerfile"]["type"] . "<br />";
		  	echo "Size: " . ($_FILES["customerfile"]["size"] / 1024) . " Kb<br />";
		  	echo "Stored in: " . $_FILES["customerfile"]["tmp_name"] . "<br>";
		}
		
		$subcat1 = "";
		$row = 1;
		
		if (($handle = fopen($_FILES['customerfile']['tmp_name'], "r")) !== FALSE) {
		    while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {
		        if ($row++ == 1) {
		        	continue;
		        }
		        
		        $num = count($data);
		        $index = 0;
		        
		        $customerteam = trim($data[$index++]);
		        $owner = trim($data[$index++]);
		        $accountnumber = trim($data[$index++]);
		        $name = trim($data[$index++]);
		        $firstname = trim($data[$index++]);
                $lastname = trim($data[$index++]);
		        $invoiceaddress1 = trim($data[$index++]);
		        $invoiceaddress2 = trim($data[$index++]);
		        $invoiceaddress3 = trim($data[$index++]);
		        $invoicecity = trim($data[$index++]);
		        $invoicecounty = trim($data[$index++]);
		        $invoicepostcode = trim($data[$index++]);
		        $invoicecountry = trim($data[$index++]);
		        $email1 = trim($data[$index++]);
		        $telephone1 = trim($data[$index++]);
		        $fax1 = trim($data[$index++]);
		        $deliverymethod = trim($data[$index++]);
		        $deliveryaddress1 = trim($data[$index++]);
		        $deliveryaddress2 = trim($data[$index++]);
		        $deliveryaddress3 = trim($data[$index++]);
		        $deliverycity = trim($data[$index++]);
		        $deliverycounty = trim($data[$index++]);
		        $deliverypostcode = trim($data[$index++]);
		        $deliverycountry = trim($data[$index++]);
		        $email2 = trim($data[$index++]);
		        $telephone2 = trim($data[$index++]);
		        		        
		        if ($data[3] != "") {
		        	echo "<div>Customer: $name</div>";
		        	
					$qry = "INSERT INTO {$_SESSION['DB_PREFIX']}customerteam " .
							"(name) " .
							"VALUES " .
							"('$customerteam')";
							
					$result = mysql_query($qry);
		        	$teamid =  mysql_insert_id();
        	
					if (mysql_errno() == 1062) {
						$qry = "SELECT id " .
								"FROM {$_SESSION['DB_PREFIX']}customerteam " .
								"WHERE name = '$customerteam'";
						$result = mysql_query($qry);
						
						//Check whether the query was successful or not
						if ($result) {
							while (($member = mysql_fetch_assoc($result))) {
								$teamid = $member['id'];
							}
						}
					}
					
					$qry = "INSERT INTO {$_SESSION['DB_PREFIX']}deliverymethod " .
							"(name) " .
							"VALUES " .
							"('$deliverymethod')";
							
					$result = mysql_query($qry);
		        	$deliverymethodid =  mysql_insert_id();
        	
					if (mysql_errno() == 1062) {
						$qry = "SELECT id " .
								"FROM {$_SESSION['DB_PREFIX']}customerteam " .
								"WHERE name = '$deliverymethod'";
						$result = mysql_query($qry);
						
						//Check whether the query was successful or not
						if ($result) {
							while (($member = mysql_fetch_assoc($result))) {
								$deliverymethodid = $member['id'];
							}
						}
					}
		        
					$qry = "INSERT INTO {$_SESSION['DB_PREFIX']}customer 
							(
							owner, customerteamid, accountnumber, name, firstname, lastname, 
							invoiceaddress1, invoiceaddress2, invoiceaddress3, invoicecity, 
							invoicepostcode, email1, telephone1, fax1,
							deliverymethodid, deliveryaddress1, deliveryaddress2, 
							deliveryaddress3, deliverycity, deliverypostcode, email2, telephone2
							)  
							VALUES  
							(
							'$owner', $teamid, '$accountnumber', '$name', '$firstname', '$lastname', 
							'$invoiceaddress1', '$invoiceaddress2', '$invoiceaddress3', '$invoicecity', 
							'$invoicepostcode', '$email1', '$telephone1', '$fax1', 
							$deliverymethodid, '$deliveryaddress1', '$deliveryaddress2', 
							'$deliveryaddress3', '$deliverycity', '$deliverypostcode', '$email2', '$telephone2'
							)";
							
					$result = mysql_query($qry);
        	
					if (mysql_errno() != 1062 && mysql_errno() != 0 ) {
						logError(mysql_error() . " : " .  $qry);
					}
		        }
		    }
		    
		    fclose($handle);
			echo "<h1>" . $row . " downloaded</h1>";
		}
	}
	
	if (! isset($_FILES['customerfile'])) {
?>	
		
<form class="contentform" method="post" enctype="multipart/form-data" onsubmit="return askPassword()">
	<label>Upload customer CSV file </label>
	<input type="file" name="customerfile" id="customerfile" /> 
	
	<br />
	 	
	<div id="submit" class="show">
		<input type="submit" value="Upload" />
	</div>
</form>
<?php
	}
	
	include("system-footer.php"); 
?>