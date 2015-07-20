<?php 
	include("system-header.php"); 
?>
<!--  Start of content -->
<link rel="stylesheet" href="css/fullcalendar.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/fullcalendar.print.css" type="text/css" media="all" />
<style>
	.ui-dialog {
		margin-top: 10px;
		min-height: 50px;
	}
</style>
<script type="text/javascript" src="js/gcal.js"></script>
<script type="text/javascript" src="js/fullcalendar.min.js"></script>


<div id='calendar'></div>
<div id="detaildialog" class="modal">
	<table>
		<tr>
			<td><b>Name : </b></td>
			<td>
				<div id="detail_name"></div>
			</td>
		</tr>
		<tr>
			<td><b>Staff Number : </b></td>
			<td>
				<div id="detail_staffnumber"></div>
			</td>
		</tr>
		<tr>
			<td><b>Contract Number : </b></td>
			<td>
				<div id="detail_contractnumber"></div>
			</td>
		</tr>
		<tr>
			<td><b>Works Number : </b></td>
			<td>
				<div id="detail_worksno"></div>
			</td>
		</tr>
		<tr>
			<td valign=top><b>Description : </b></td>
			<td>
				<div id="detail_description"></div>
			</td>
		</tr>
		
	</table>
</div>
<script>
	$(document).ready(function() {
		$("#detaildialog").dialog({
				modal: true,
				width: 800,
				autoOpen: false,
				title: "Details",
				buttons: {
					Ok: function() {
						$(this).dialog("close");
					}
				}
			});

		$('#calendar').fullCalendar({
			editable: true,
			aspectRatio: 2.1,
			allDayDefault: false, 
			
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},

			eventRender: function(event, element) {
			   element.attr('title', "Click to view " + event.title);
			},
			
			eventClick: function(calEvent, jsEvent, view) {
				if (calEvent.id != 0) {
					callAjax(
							"finddata.php", 
							{ 
								sql: "SELECT A.*, B.firstname, B.lastname, B.staffnumber " +
									 "FROM <?php echo $_SESSION['DB_PREFIX'];?>miscdiary A " + 
									 "INNER JOIN <?php echo $_SESSION['DB_PREFIX'];?>members B " + 
									 "ON B.member_id = A.memberid " +
									 "WHERE A.id = " + calEvent.id
							},
							function(data) {
								if (data.length > 0) {
									var node = data[0];
								
									$("#detail_name").html(node.firstname + " " + node.lastname);
									$("#detail_staffnumber").html(node.staffnumber);
									$("#detail_worksno").html(node.worksno);
									$("#detail_contractnumber").html(node.contractnumber);
									$("#detail_description").html(node.description);
									$("#detaildialog").dialog("open");
}
							}
						);
				
				}
		    },
			
		    dayClick: function(date, allDay, jsEvent, view) {
		
		        // change the day's background color just for fun
		
		    },
		    
		    events: function(start, end, callback) {
		    	var startYear = start.getYear();
		    	var endYear = end.getYear();
		    	
		    	if (startYear < 2000) {
		    	    startYear += 1900;
		    	}
		    	
		    	if (endYear < 2000) {
		    	    endYear += 1900;
		    	}
		    	
			    $.ajax({
	                type: 'POST',
	                url: 'welcomedata.php',
	                async: false,
	                dataType:'json',
			        data: {
			            start: startYear + "-" + padZero(start.getMonth() + 1) + "-" + padZero(start.getDate()),
	                    end: endYear + "-" + padZero(end.getMonth() + 1) + "-" + padZero(end.getDate()),      
			        },
			        error: function(error) {
			            alert('there was an error while fetching events');
			        },
			        success: function(msg) {
						var events = [];
						 
                        for(var c = 0; c < msg.length; c++){
                        	var item = msg[c];
                        	
                            events.push({
	                                id: item.id,                                
	                                title: item.title,
	                                allDay: item.allDay == "true" ? true : false,
	                                start: item.start,
	                                end: item.end,
	                                editable: true,
	                                className: item.className
	                            });
                        }
                        
                        callback(events);
			        }
			     });
		    }
		});
		
	});
	
	
	
</script>

<!--  End of content -->
<?php include("system-footer.php"); ?>