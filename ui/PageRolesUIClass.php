<?php
	require_once(__DIR__ . "/../ui/AbstractBaseDataUIClass.php");
	require_once(__DIR__ . "/../businessobjects/PagerolesClass.php");
	require_once(__DIR__ . "/../businessobjects/PageRolesCollectionClass.php");
	
	class PageRolesUIClass extends AbstractBaseDataUIClass {

		/**
		 * Load by page ID
		 * @param int $pageid
		 */
		public function loadByPageID($pageid) {
			$pageRoles = new PageRolesCollectionClass();
			$pageRoles->loadByPageID($pageid);
			
			foreach ($pageRoles->getRecords() AS $record) {
				$this->addComboOption($record->getRoleid(), $record->getRoleid());
			}

			return $this->getComboOptions();
		}
	}
?>