<?php
    require("pgcore-db.php");
    
    function onetoone_import($name) {
        if (isset($_POST[$name]) && $_POST[$name] != "") {
            $capitalized = strtoupper(substr($_POST[$name], 0, 1)) . substr($_POST[$name], 1);
?>
require_once(__DIR__ . "/../businessobjects/<?php echo $capitalized; ?>Class.php");
<?php
        }
    }
    
    function onetoone_declare($name) {
        if (isset($_POST[$name]) && $_POST[$name] != "") {
?>
        private $<?php echo $_POST[$name]; ?> = null; 
<?php
        }
    }
    
    function onetoone_create($name) {
        if (isset($_POST[$name]) && $_POST[$name] != "") {
            $capitalized = strtoupper(substr($_POST[$name], 0, 1)) . substr($_POST[$name], 1);
?>
	/**
	 * @onetoone
	 * <?php echo $_POST[$name]; ?> 
	 * @return <?php echo $capitalized; ?>Class
	 */
	public function get<?php echo $capitalized; ?>($load = true){
		if ($this-><?php echo $_POST[$name]; ?> == null && $load) {
			$this-><?php echo $_POST[$name]; ?> = new <?php echo $capitalized; ?>Class();

			if ($this->get<?php echo $capitalized; ?>id() != null) {
				$this-><?php echo $_POST[$name]; ?>->loadRecord($this->get<?php echo $capitalized; ?>id());
			}
		}
	
		return $this-><?php echo $_POST[$name]; ?>;
	}

<?php
        }
    }
?>
<BUTTON onclick="myFunction()">Click to copy</BUTTON>
<br />

<?php    
    if (! isset($_POST['tablename'])) {
?>
<FORM method="POST">
    <TABLE>
        <TR>
            <TD>Table Name</TD>
            <TD>
                <INPUT type="text" id="tablename" name="tablename" />
            </TD>
        </TR>
        <TR>
            <TD>One to One (1)</TD>
            <TD>
                <INPUT type="text" id="onetoone1" name="onetoone1" />
            </TD>
        </TR>
        <TR>
            <TD>One to One (2)</TD>
            <TD>
                <INPUT type="text" id="onetoone2" name="onetoone2" />
            </TD>
        </TR>
        <TR>
            <TD>One to One (3)</TD>
            <TD>
                <INPUT type="text" id="onetoone3" name="onetoone3" />
            </TD>
        </TR>
        <TR>
            <TD>One to One (4)</TD>
            <TD>
                <INPUT type="text" id="onetoone4" name="onetoone4" />
            </TD>
        </TR>
        <TR>
            <TD>One to One (5)</TD>
            <TD>
                <INPUT type="text" id="onetoone5" name="onetoone5" />
            </TD>
        </TR>
        <TR>
            <TD>One to One (6)</TD>
            <TD>
                <INPUT type="text" id="onetoone6" name="onetoone6" />
            </TD>
        </TR>
        <TR>
            <TD>One to Many (1)</TD>
            <TD>
                <INPUT type="text" id="onetonmany1" name="onetonmany1" />
            </TD>
        </TR>
        <TR>
            <TD>One to Many (2)</TD>
            <TD>
                <INPUT type="text" id="onetonmany2" name="onetonmany2" />
            </TD>
        </TR>
        <TR>
            <TD>One to Many (3)</TD>
            <TD>
                <INPUT type="text" id="onetonmany3" name="onetonmany3" />
            </TD>
        </TR>
        <TR>
            <TD>One to Many (4)</TD>
            <TD>
                <INPUT type="text" id="onetonmany4" name="onetonmany4" />
            </TD>
        </TR>
        <TR>
            <TD>One to Many (5)</TD>
            <TD>
                <INPUT type="text" id="onetonmany5" name="onetonmany5" />
            </TD>
        </TR>
        <TR>
            <TD>One to Many (6)</TD>
            <TD>
                <INPUT type="text" id="onetonmany6" name="onetonmany6" />
            </TD>
        </TR>
        <TR>
            <TD>&nbsp;</TD>
            <TD>
                <INPUT type="submit" />
            </TD>
        </TR>
    </TABLE>
</FORM>
<?php
    } else {
        $tablename = $_POST['tablename'];
        $capitalized = strtoupper(substr($tablename, 0, 1)) . substr($tablename, 1);
        $sql = "SELECT DISTINCT COLUMN_NAME, DATA_TYPE, IS_NULLABLE, COLUMN_DEFAULT, COLUMN_KEY
                FROM INFORMATION_SCHEMA.COLUMNS 
                WHERE table_name = '{$_SESSION['DB_PREFIX']}$tablename'";

        $stmt = SessionControllerClass::getDB()->prepare($sql);
        $stmt->execute();
        
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<TEXTAREA id='pre'>
&lt;?php
require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");

<?php
    onetoone_import("onetoone1");
    onetoone_import("onetoone2");
    onetoone_import("onetoone3");
    onetoone_import("onetoone4");
    onetoone_import("onetoone5");
    onetoone_import("onetoone6");
?>
/** 
 * @table "<?php echo $tablename; ?>" 
 */
class <?php echo $capitalized; ?>Class extends AbstractBaseDataClass {
	
    /* Properties. */
<?php
        foreach ($rows AS $row) {
            $column = $row['COLUMN_NAME'];
            
            if (substr($column, 0, 4) == "meta") {
                continue;
            }
?>
    private $<?php echo $column; ?> = null;
<?php
        }
?>       
     /* One to ones */
<?php
        onetoone_declare("onetoone1");
        onetoone_declare("onetoone2");
        onetoone_declare("onetoone3");
        onetoone_declare("onetoone4");
        onetoone_declare("onetoone5");
        onetoone_declare("onetoone6");
?>

<?php
		$stmt = SessionControllerClass::getDB()->prepare($sql);
		$stmt->execute();
		
		$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

		foreach ($rows AS $row) {
			$column = $row['COLUMN_NAME'];
            $type = $row['DATA_TYPE'];

            if ($type == "varchar") {
            	$type = "string";
            }

            if ($type == "text") {
            	$type = "string";
            }
            
            if ($type == "char") {
            	$type = "string";
            }

            if ($type == "datetime") {
            	$type = "DateTime";
            }

            if ($type == "date") {
            	$type = "DateTime";
            }
            
            if ($type == "decimal") {
            	$type = "double";
            }

            if ($type == "mediumint") {
            	$type = "int";
            }
            
            if (substr($column, 0, 4) == "meta") {
                continue;
            }

            $capitalizedcol = strtoupper(substr($column, 0, 1)) . substr($column, 1);
?>
	/**
	 * <?php echo $column; ?> 
	 * @param <?php echo $type; ?> $<?php echo $column; ?> 
	 * @return <?php echo $type; ?>  
	 */
	public function set<?php echo $capitalizedcol; ?>($<?php echo $column; ?>){
		$this-><?php echo $column ?> = $<?php echo $column; ?>;
		return $this;
	}
	
	/**
<?php
    if ($row['COLUMN_KEY'] == "PRI") {
?>
	 * @primarykey true 
<?php
    }
?>
	 * @column "<?php echo $column ?>"
	 * @property
	 * <?php echo $column ?> 
	 * @return <?php echo $type; ?>  
	 */
	public function get<?php echo $capitalizedcol; ?>(){
		return $this-><?php echo $column ?>;
	}
		
<?php
        }
        
        onetoone_create("onetoone1");
        onetoone_create("onetoone2");
        onetoone_create("onetoone3");
        onetoone_create("onetoone4");
        onetoone_create("onetoone5");
        onetoone_create("onetoone6");
?>
}
?&gt;</TEXTAREA>
<?php
    }
?>
<STYLE>
	#pre {
		width:100%;
		height:700px;
	}
</STYLE>
<SCRIPT>
function myFunction() {
	  var copyText = document.getElementById("pre");
	  copyText.select();
	  document.execCommand("Copy");
	}
</SCRIPT>
