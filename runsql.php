<?php
	require_once(__DIR__ . "/ui/CrudUIClass.php");
	require_once(__DIR__ . "/php-sql-parser.php");
	require_once(__DIR__ . "/php-sql-creator.php");
	require_once(__DIR__ . "/system-header.php");
	
	function run() {
		$sql = ($_POST['pk1']);
		echo str_replace("\n", " ", str_replace("\r", "", $sql));
		
		if (stripos($sql, "SELECT", 0) === 0) {
			$crud = new CrudUIClass()
	?>
	<script>
				$(document).ready(
						function() {
							$("#sqlresults").html("<?php echo str_replace("\"", "\\\"", str_replace("\n", "<br>", json_encode($crud->fetchData($sql), JSON_PRETTY_PRINT))); ?>");
						}
					);
	</script>
	<?php			
			
		} else {
			try {
				$stmt = SessionControllerClass::getDB()->prepare(mysql_real_escape_string(str_replace("\n", " ", str_replace("\r", "", $sql))));
				$stmt->execute();
			
			} catch (Exception $e) {
	?>
	<script>
				$(document).ready(
						function() {
							pwAlert("<?php echo str_replace("\n", "\\n", $e->getMessage()) . "\\n\\n" . str_replace("\n", " ", str_replace("\r", "", $sql)); ?>");
						}
					);
	</script>
	<?php
			}
		}
	}
?>
<script>
	function run() {
		call("run", {pk1: $("#sql").val()});
	}
</script>
<button onclick='run()'>Run</button><br><br>
<textarea id="sql" name="sql" style='width:100%; height:200px'><?php if (isset($_POST['pk1'])) echo $_POST['pk1']; ?></textarea>
<br><br>
<div id="sqlresults" name="sqlresults" style='width:100%; height:200px'></div>
<?php	
	require_once("system-footer.php");
?>
