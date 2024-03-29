<?php
function createConfirmDialog($name, $title, $scriptCallBack, $cancelCallBack = null) {
?>
	
<div class="modal" id="<?php echo $name; ?>">
	<table>
		<tr>
			<td width=40><img src="images/alert.png" /></td>
			<td><p class='confirmdialogbody'></p></td>
		</tr>
	</table>
</div>
<script>
	$(document).ready(function() {
			$("#<?php echo $name; ?>").dialog({
					modal: true,
					width: "auto",
					autoOpen: false,
					show:"fade",
					hide:"fade",
					title: "<?php echo $title; ?>",
					buttons: {
						"Yes": function() {
							<?php echo $scriptCallBack . "();\n"; ?>
						},
						"No": function() {
						    
							<?php if ($cancelCallBack != null) echo $cancelCallBack . "();\n"; ?>
							$(this).dialog("close");
						}
					}
				});
		});
</script>
<?php
}
?>
