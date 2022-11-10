<?php
	require_once(__DIR__ . "/../ui/AbstractBaseDataUIClass.php");
	require_once(__DIR__ . "/../businessobjects/DocumentClass.php");
	require_once(__DIR__ . "/../businessobjects/DocumentCollectionClass.php");
	
	class DocumentUIClass extends AbstractBaseDataUIClass {

		/**
		 * Clear session documents.
		 */
		public function clearSessionDocuments() {
			$documents = new DocumentCollectionClass();
			$documents->clearSessionDocuments();
			
			return json_encode(array("complete" => "yes"));
		}
		
		/**
		 * Upload
		 * @param string $title
		 * @param string $filename
		 * @param DateTime $expiry
		 * @param int $roleid
		 * @param string $image
		 * @param string $tablename
		 * @param int $id
		 * @param string $primaryidname
		 * @param string $sessionid
		 */
		public function upload($title, $filename, $expiry, $roleid, $image, $tablename, $id, $primaryidname, $sessionid) {
			$document = new DocumentClass();
				
			if ($expiry != "") {
				$document->setExpiryDate($expiry);
			}
		
			$document->setCompressed(1);
			$document->setFilename($filename);
			$document->setImage($image);
			$document->setName($title);
			$document->setRoleID($roleid);
				
			if ($id) {
				$document->setSubtablename(pgDecrypt($tablename));
				$document->setSubtablepkname(pgDecrypt($primaryidname));
				$document->setSubtablepkvalue($id);
		
			} elseif ($sessionid) {
				$document->setSessionid($sessionid);
			}
				
			$document->insertRecord();
		
			return $document->toJSON();
		}
		
		/**
		 * Remove document.
		 * @param int $id
		 */
		public function remove($id) {
			$document = new DocumentClass();
			$document->loadRecord($id);
			$document->deleteRecord();

			return $document->toJSON();
		}

		/**
		 * Search documents.
		 * @param string $match
		 * @return string 
		 */
		public function search($match) {
			$documents = new DocumentCollectionClass();
			$documents->search($match);
				
			return $this->getRows($documents);
		}
		
		/**
		 * Load by session ID
		 * @param string $sessionid
		 * @return string 
		 */
		public function loadBySession($sessionid) {
			$documents = new DocumentCollectionClass();
			$documents->loadBySession($sessionid);
			
			return $this->getRows($documents);
		}
		
		/**
		 * Load by sub table.
		 * @param string $table
		 * @param string $key
		 * @param int $id
		 * @return string 
		 */
		public function loadBySubtable($table, $key, $id) {
			$documents = new DocumentCollectionClass();
			$documents->loadBySubtable($table, $key, $id);
				
			return $this->getRows($documents);
		}
		
		/**
		 * Get row.
		 * @param DocumentCollectionClass $documents
		 * @return string
		 */
		private function getRows($documents) {
			ob_start();
?>
			<table cellpadding=12 class='grid list' id="documentlist" maxrows=18 width=100% cellspacing=0 cellpadding=0>
				<thead>
					<tr>
						<td width='20px'></td>
						<td width='30%'>Name</td>
						<td width='32%'>File Name</td>
						<td width='7%'>Size</td>
						<td width='8%'>Created</td>
						<td width='15%'>Created By</td>
						<td width='8%'>Expires</td>
					</tr>
				</thead>
				<tbody>

<?php 			
			foreach ($documents->getRecords() AS $document) {
				if (! $document->isPermitted()) {
					continue;
				}
			
?>
					<tr class='<?php echo $document->isExpired() ? "expireddocument" : ""; ?>'>
						<td width='20px' title='Delete'>
							<img src='images/delete.png' docid='<?php echo $document->getId(); ?>' class='deletebutton' />
						</td>
<?php					
				if ($document->isExpired()) {
?>
						<td><?php echo $document->getName(); ?></td>
<?php					
				} else {
?>
						<td><a target='_new' href='viewdocuments.php?id=<?php echo $document->getId(); ?>'><?php echo $document->getName(); ?></a></td>
<?php					
				}
?>
						<td><?php echo $document->getFilename(); ?></td>
						<td><?php echo $document->getDisplaySize(); ?></td>
						<td><?php echo $document->dateToDMY($document->getCreateddate()); ?></td>
						<td><?php echo $document->getCreator()->getFullname(); ?></td>
						<td><?php echo $document->dateToDMY($document->getExpiryDate()); ?></td>
					</tr>
<?php				
			}
?>
				</tbody>
			</table>
<?php			

			return ob_get_clean();
		}
	}
?>