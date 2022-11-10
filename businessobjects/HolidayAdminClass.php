<?php
	class HolidayAdminClass {
		
		/** @property @date **/
		protected  $start;
		/** @property @date **/
		protected  $end;
		
		/**
		 * Constructor 
		 */
	    public function __construct() {
			$year = date("Y");
			$month = sprintf("%02d", 1);
			$day = sprintf("%02d", 1);
			$currentYearMay = strtotime("$year-$month-$day");
			$strCurrentYearMay = date("Y-m-d", $currentYearMay);
			
			if ($currentYearMay > strtotime(date("Y-m-d"))) {
			    $dt = new DateTime($strCurrentYearMay);
			    $dt->modify('-1 year');
			    
			    $this->start = $dt->format('Y-m-d'); 
			    $this->end = $strCurrentYearMay; 
				
			} else {
			    $dt = new DateTime($strCurrentYearMay);
			    $dt->modify('+1 year');
			    $end = $dt->format('Y-m-d'); 
			    
			    $this->start = $strCurrentYearMay; 
			    $this->end = $dt->format('Y-m-d'); 
			}
	    }
	    
	    /**
	     * Get network days
	     * @param DateTime $s
	     * @param DateTime $e
	     * @param array $holidays
	     * @return int
	     */
	    public static function weekDays($from, $to) {
	    	$_from = strtotime(date('Y-m-d', strtotime($from)));
	    	$_to = strtotime(date('Y-m-d', strtotime($to)));
	    
	    	$all_days = @range($_from, $_to, 60 * 60 * 24);
	    
	    	if (empty($all_days)) return 0;
	    
	    	$week_days = array_filter(
	    			$all_days,
	    			create_function('$t', '$d = date("w", strtotime("+{$t} seconds", 0)); return !in_array($d, array(0,6));'));
	    
	    	return count($week_days);
	    }
	    
	    /**
	     * Get taken holidays
	     * @param int $userid
	     * @throws Exception
	     * @return int
	     */
	    public static function getHolidaysTaken($userid) {
	    	$holidayClass = new HolidayAdminClass();
	    	$taken = 0;
	    	$sql = "SELECT SUM(D.daystaken) AS taken
	    			FROM {$_SESSION['DB_PREFIX']}holiday D
	    			WHERE D.memberid =  ?
	    			AND D.startdate >= ?
	    			AND D.startdate <  ?
	    			AND D.acceptedby IS NOT NULL";
	    	

	    	$stmt = SessionControllerClass::getDB()->prepare($sql);
	    	$stmt->bindValue(1, $userid, PDO::PARAM_INT);
	    	$stmt->bindValue(2, $holidayClass->getStart(), PDO::PARAM_STR);
	    	$stmt->bindValue(3, $holidayClass->getEnd(), PDO::PARAM_STR);
    		$stmt->execute();
    		
	    	while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
    			$taken = $row['taken'];
    		}

    		if ($taken == "") {
    			return "0";
    		}
    		
    		return $taken;
		}
	     
		/**
		 * start
		 * @return DateTime
		 */
		public function getStart(){
			return $this->start;
		}
	
		/**
		 * start
		 * @param DateTime $start
		 * @return HolidayAdminClass
		 */
		public function setStart($start){
			$this->start = $start;
			return $this;
		}
	
		/**
		 * end
		 * @return DateTime
		 */
		public function getEnd(){
			return $this->end;
		}
	
		/**
		 * end
		 * @param DateTime $end
		 * @return HolidayAdminClass
		 */
		public function setEnd($end){
			$this->end = $end;
			return $this;
		}
	}
?>