<?php
	require_once("crud.php");

	class MediaCrud extends Crud {
		
		public function postEditScriptEvent() {
?>
			if (node.html == "N") {
				$("#media_html").parent().parent().hide();
				$("#media").parent().parent().show();
				
			} else {
				$("#media").parent().parent().hide();
				$("#media_html").parent().parent().show();
				tinyMCE.get("media_html").setContent(node.media);
			}
<?php			
		}
		
		function preUpdateScriptEvent() {
?>
			if ($("#html").val() == "Y") {
				$("#media").val(tinyMCE.get("media_html").getContent());
			}
<?php
		}
		
		function postAddScriptEvent() {
?>
			$("#html").val("Y").trigger("change");
<?php
		}
		
		
		/* Post script event. */
		public function postScriptEvent() {
	?>
			
			$(document).ready(
					function() {
						$("#media").change(
								function() {
									tinyMCE.get("media_html").setContent($("#media").val());
								}
							);
							
						$("#html").change(
								function() {
									if ($(this).val() == "N") {
										$("#media_html").parent().parent().hide();
										$("#media").parent().parent().show();
										$("#media").val(tinyMCE.get("media_html").getContent());
										
									} else {
										$("#media").parent().parent().hide();
										$("#media_html").parent().parent().show();
										tinyMCE.get("media_html").setContent($("#media").val());
									}
								}
							);
					}
				);
	<?php
		}
	}
	
	$crud = new MediaCrud();
	$crud->title = "Media Templates";
	$crud->table = "{$_SESSION['DB_PREFIX']}mediatemplate";
	$crud->sql = "SELECT * FROM {$_SESSION['DB_PREFIX']}mediatemplate ORDER BY name";
	
	$crud->columns = array(
			array(
				'name'       => 'id',
				'length' 	 => 6,
				'showInView' => false,
				'bind' 	 	 => false,
				'editable' 	 => false,
				'pk'		 => true,
				'label' 	 => 'ID'
			),
			array(
				'name'       => 'code',
				'length' 	 => 30,
				'label' 	 => 'Code'
			),
			array(
				'name'       => 'name',
				'length' 	 => 60,
				'label' 	 => 'Name'
			),
			array(
				'name'       => 'html',
				'length' 	 => 20,
				'type'		 => 'COMBO',
				'options'    => array(
					array(
						'value'		=> 'Y',
						'text'		=> 'Yes'
					),
					array(
						'value'		=> 'N',
						'text'		=> 'No'
					)
				),
				'label' 	 => 'HTML'
			),
			array(
				'name'       => 'media_html',
				'bind'		 => false,
				'type'		 => 'TEXTAREA',
				'length' 	 => 140,
				'height'	 => 18,
				'showInView' => false,
				'label' 	 => 'Media Content'
			),
			array(
				'name'       => 'media',
				'type'		 => 'BASICTEXTAREA',
				'length' 	 => 140,
				'height'	 => 32,
				'showInView' => false,
				'label' 	 => 'Media Content'
			)
		);
		
	$crud->run();
?>
