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
         * @param string $startDate
         * @param string $endDate
         * @return int
         */
	    public static function weekDays(string $startDate, string $endDate): int {
            // do strtotime calculations just once
            $endDate = strtotime($endDate);
            $startDate = strtotime($startDate);

            //The total number of days between the two dates. We compute the no. of seconds and divide it to 60*60*24
            //We add one to inlude both dates in the interval.
            $days = ($endDate - $startDate) / 86400 + 1;

            $no_full_weeks = floor($days / 7);
            $no_remaining_days = fmod($days, 7);

            //It will return 1 if it's Monday,.. ,7 for Sunday
            $the_first_day_of_week = date("N", $startDate);
            $the_last_day_of_week = date("N", $endDate);

            //---->The two can be equal in leap years when february has 29 days, the equal sign is added here
            //In the first case the whole interval is within a week, in the second case the interval falls in two weeks.
            if ($the_first_day_of_week <= $the_last_day_of_week) {
                if ($the_first_day_of_week <= 6 && 6 <= $the_last_day_of_week) $no_remaining_days--;
                if ($the_first_day_of_week <= 7 && 7 <= $the_last_day_of_week) $no_remaining_days--;
            }
            else {
                // (edit by Tokes to fix an edge case where the start day was a Sunday
                // and the end day was NOT a Saturday)

                // the day of the week for start is later than the day of the week for end
                if ($the_first_day_of_week == 7) {
                    // if the start date is a Sunday, then we definitely subtract 1 day
                    $no_remaining_days--;

                    if ($the_last_day_of_week == 6) {
                        // if the end date is a Saturday, then we subtract another day
                        $no_remaining_days--;
                    }
                }
                else {
                    // the start date was a Saturday (or earlier), and the end date was (Mon..Fri)
                    // so we skip an entire weekend and subtract 2 days
                    $no_remaining_days -= 2;
                }
            }

            //The no. of business days is: (number of weeks between the two dates) * (5 working days) + the remainder
//---->february in none leap years gave a remainder of 0 but still calculated weekends between first and last day, this is one way to fix it
            $workingDays = $no_full_weeks * 5;
            if ($no_remaining_days > 0 )
            {
                $workingDays += $no_remaining_days;
            }

            return $workingDays;
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