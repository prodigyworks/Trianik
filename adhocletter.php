<?php
	require_once("system-header.php");
?>
<h2>Adhoc Letter</h2>
<br>
<form id="reportform" class="reportform" name="reportform" method="POST" action="adhocletterlib.php" target="_new">
	<table>
		<tr>
			<td>
				Text
			</td>
			<td>
				<textarea id='adhoctext' name='adhoctext' cols="80" rows="15"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;
			</td>
			<td>
				<a class="link1" href="javascript: runreport();"><em><b>Run Report</b></em></a>
			</td>
		</tr>
	</table>
</form>
<script>
	function runreport(e) {
		$('#reportform').submit();

		try {
			e.preventDefault();

		} catch (e) {

		}
	}
</script>
<?php
	require_once("system-footer.php");
?>
