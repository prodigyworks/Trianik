</div>

<?php
if (SessionControllerClass::getUser()->isAuthenticated()) {
	?>
		<div id="footer2">
			<div>
				<a href='http://www.prodigy-global.com'>Powered by <img title="Prodigy Global" alt="Prodigy Global" src='images/prodigyworks.png' /></a><br />
			</div>
		</div>
<?php 
	}
?>	
	</DIV>
	<div id="appwarning">
	</div>
	<div id="appwarningclose">
	</div>

	<div class="modal" id="alertdialog">
		<table>
			<tr>
				<td width=40><img src="images/alert.png" /></td>
				<td><p class='alertdialogbody'></p></td>
			</tr>
		</table>
	</div>
</body>
</html>
