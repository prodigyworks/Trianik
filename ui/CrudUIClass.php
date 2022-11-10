<?php
	require_once(__DIR__ . "/../ui/AbstractBaseDataUIClass.php");
	require_once(__DIR__ . "/../php-sql-parser.php");
	require_once(__DIR__ . "/../php-sql-creator.php");
	
	class CrudUIClass extends AbstractBaseDataUIClass {

		/**
		 * Save column widths
		 * @param int $pageid
		 * @param int $memberid
		 * @param int $column
		 * @param int $width
		 * @param string $label
		 * @param int $headerid
		 * @param int $itemid
		 * @throws Exception
		 */
		public function columnSave($pageid, $memberid, $column, $width, $label, $headerid, $itemid) {
			try {
				$headerid = 0;
				$itemid = 0;
				
				$stmt = SessionControllerClass::getDB()->prepare(
						"SELECT A.id 
						 FROM {$_SESSION['DB_PREFIX']}applicationtables A 
						 WHERE A.pageid = ?
						 AND A.memberid = ?"
					);
				$stmt->bindValue(1, $pageid, PDO::PARAM_INT);
				$stmt->bindValue(2, $memberid, PDO::PARAM_INT);
				$stmt->execute();
				
				while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
					$headerid = $row['id'];
				}
				
				if ($headerid == 0) {
					$stmt = SessionControllerClass::getDB()->prepare(
						   "INSERT INTO {$_SESSION['DB_PREFIX']}applicationtables
							(
								pageid, memberid,
								metacreateddate, metacreateduserid,
								metamodifieddate, metamodifieduserid
							)
							VALUES
							(
								?, ?,
								NOW(), ?,
								NOW(), ?
							)"
						);
					$stmt->bindValue(1, $pageid, PDO::PARAM_INT);
					$stmt->bindValue(2, $memberid, PDO::PARAM_INT);
					$stmt->bindValue(3, $memberid, PDO::PARAM_INT);
					$stmt->bindValue(4, $memberid, PDO::PARAM_INT);
					$stmt->execute();
						
					$headerid = SessionControllerClass::getDB()->lastInsertId();
				}
				
				$stmt = SessionControllerClass::getDB()->prepare(
						"SELECT A.id
						 FROM {$_SESSION['DB_PREFIX']}applicationtablecolumns A
					 	 WHERE A.headerid = ?
						 AND A.columnindex = ?"
					);
				$stmt->bindValue(1, $headerid, PDO::PARAM_INT);
				$stmt->bindValue(2, $column, PDO::PARAM_INT);
				$stmt->execute();
				
				while($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
					$itemid = $row['id'];
				}
				
				if ($itemid == 0) {
					$stmt = SessionControllerClass::getDB()->prepare(
						"INSERT INTO {$_SESSION['DB_PREFIX']}applicationtablecolumns 
						 (
						 	headerid, columnindex, width, label, 
						 	metacreateddate, metacreateduserid, 
						 	metamodifieddate, metamodifieduserid
						 )
						 VALUES 
					 	 (
							?, ?, ?, ?, 
							NOW(), ?, 
							NOW(), ?
						 )"
					);
				
					$stmt->bindValue(1, $headerid, PDO::PARAM_INT);
					$stmt->bindValue(2, $column, PDO::PARAM_INT);
					$stmt->bindValue(3, $width, PDO::PARAM_INT);
					$stmt->bindValue(4, $label, PDO::PARAM_STR);
					$stmt->bindValue(5, $memberid, PDO::PARAM_INT);
					$stmt->bindValue(6, $memberid, PDO::PARAM_INT);
					$stmt->execute();
						
				} else {
					$stmt = SessionControllerClass::getDB()->prepare(
						"UPDATE {$_SESSION['DB_PREFIX']}applicationtablecolumns SET 
						 width = ?, 
						 label = ?, 
						 metamodifieddate = NOW(), 
						 metamodifieduserid = ?
						 WHERE id = ?"
			 		);

					$stmt->bindValue(1, $width, PDO::PARAM_INT);
					$stmt->bindValue(2, $label, PDO::PARAM_STR);
					$stmt->bindValue(3, $memberid, PDO::PARAM_INT);
					$stmt->bindValue(4, $itemid, PDO::PARAM_INT);
					$stmt->execute();
				}

				return json_encode(array("complete" => "yes"));
				
			} catch (Exception $e) {
				throw $e;
			}
		}
		
		/**
		 * Fetch row.
		 * @param int $id
		 * @param string $table
		 * @param string $pkname
		 * @param string $sql
		 */
		public function fetchRow($id, $pkname, $table, $sql) {
			$qry = "";
			
			if ($sql) {
				$qry = pgDecrypt($sql);
				$parser = new PHPSQLParser($qry);
				
				if ($parser->parsed['FROM'][0]['alias'] != "") {
					$pkname = $parser->parsed['FROM'][0]['alias']['name'] . "." . pgDecrypt($pkname);
				
				} else {
					$pkname = pgDecrypt($pkname);
				}
			
				if (! isset($parser->parsed['WHERE'])) {
					/* Create where clause. */
					$parser->parsed['WHERE'] = array();
			
				} else {
					/* Add to the where clause. */
					$parser->parsed['WHERE'][] =
					array(
							"expr_type" 		=> "operator",
							"base_expr"			=> "AND",
							"sub_tree"			=> ""
					);
				}
					
				$parser->parsed['WHERE'][] =
				array(
						"expr_type" 		=> "colref",
						"base_expr"			=> $pkname,
						"sub_tree"			=> ""
				);
					
				$parser->parsed['WHERE'][] =
				array(
						"expr_type" 		=> "operator",
						"base_expr"			=> "=",
						"sub_tree"			=> ""
				);
					
				$parser->parsed['WHERE'][] =
				array(
						"expr_type" 		=> "const",
						"base_expr"			=> "'$id'",
						"sub_tree"			=> ""
				);
					
				$creator = new PHPSQLCreator($parser->parsed);
				$created = $creator->created;
			
				$qry = $created;

			} else {
				$table = pgDecrypt($table);
				$pkname = pgDecrypt($pkname);
				$qry = "SELECT * FROM {$table} WHERE {$pkname} = $id";
			}
			
			return json_encode($this->fetchData($qry));
		}
		
		/**
		 * Filter.
		 * 
		 * @param int $id
		 */
		public function filter($id) {
			$sql =  "SELECT A.*, B.description 
					 FROM {$_SESSION['DB_PREFIX']}filterdata A  
					 INNER JOIN {$_SESSION['DB_PREFIX']}filter B 
					 ON B.id = A.filterid 
					 WHERE filterid = $id";
			
			return $this->fetch($sql, null, null, null, null);
		}
		
		/**
		 * Fetch.
		 * @param string $sql
		 * @param string $orderby
		 * @param string $direction
		 * @param int $from
		 * @param int $to
		 */
		public function fetch($sql, $orderby, $direction, $from, $to) {
			$qry = pgDecrypt($sql);

			if ($orderby) {
				$parser = new PHPSQLParser($qry);
				
				if (isset($parser->parsed['ORDER'])) {
					unset($parser->parsed['ORDER']);
				}
			
				if ($orderby) {
					$parser->parsed['ORDER'] = array();
					$parser->parsed['ORDER'][] =
					array(
							"expr_type" 		=> "colref",
							"base_expr"			=> $orderby,
							"sub_tree"			=> "",
							"direction"         => $direction
					);
						
					$creator = new PHPSQLCreator($parser->parsed);
					$qry = $creator->created;
				}
			}
			
			if ($to) {
				$qry .= " LIMIT $from, $to";
			}
			
			return json_encode($this->fetchData($qry));
		}
		
		/**
		 * Delete.
		 * @param array $table
		 * @param array $pkname
		 * @param array $id
		 */
		public function delete($table, $pkname, $id) {
			try {
				for ($i = 0; $i < count($table); $i++) {
					$tableA = pgDecrypt($table[$i]);
					$pknameA = pgDecrypt($pkname[$i]);
						
					$stmt = SessionControllerClass::getDB()->prepare(
							"DELETE FROM {$tableA} WHERE {$pknameA} = ?"
						);
						
					$stmt->execute(array($id));
				}

				return json_encode(array("complete" => "yes"));
				
			} catch (Exception $e) {
				throw $e;
			}
		}
		

		/**
		 * Fetch the SQL into a JSON array.
		 * @param string $qry
		 */
		public function fetchData($qry) {
			$itemarray = array();
			$property = null;
			$propertyarray = array();
			 
			$stmt = SessionControllerClass::getDB()->prepare($qry);
			$stmt->execute();
			 
			$rows = $stmt->fetchAll(PDO::FETCH_ASSOC);
			 
			try {
				foreach(range(0, $stmt->columnCount() - 1) as $columnIndex) {
					$propertyarray[] = $stmt->getColumnMeta($columnIndex);
				}
				 
				foreach ($rows AS $row) {
					$line = array();
					 
					foreach ($propertyarray as $property) {
						if ($property['native_type'] == "DATETIME") {
							if ($row[$property['name']] == null || $row[$property['name']] == 0) {
								$line[$property['name']] =  "";
								 
							} else {
								$date = new DateTime($row[$property['name']]);
								$line[$property['name']] =  $date->format(SessionControllerClass::getSiteConfig()->getPhpdateformat() . " H:i:s");
							}
								
						} else if ($property['native_type'] == "TIMESTAMP" || $property['native_type'] == "DATE") {
							if ($row[$property['name']] == null || $row[$property['name']] == 0) {
								$line[$property['name']] =  "";
								 
							} else {
								$date = new DateTime($row[$property['name']]);
								$line[$property['name']] =  $date->format(SessionControllerClass::getSiteConfig()->getPhpdateformat());
							}
								
						} else {
							$line[$property['name']] = $row[$property['name']];
						}
					}
						
						
					array_push($itemarray, $line);
				}
				 
			} catch (Exception $e) {
				logError($qry . " - " . $e->getMessage());
			}
			 
			return ($itemarray);
		}
	}
?>