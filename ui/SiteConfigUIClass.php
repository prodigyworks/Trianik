<?php
	require_once(__DIR__ . "/../session/SessionControllerClass.php");
	require_once(__DIR__ . "/../ui/AbstractBaseDataUIClass.php");

	class SiteConfigUIClass extends AbstractBaseDataUIClass {

		/**
		 * Load
		 * @param ID $id
		 * @return string
		 */
		public function load($id) {
			$portlet = SessionControllerClass::getSiteConfig()->loadRecord();
				
			return $portlet->toJSON();
		}

		/**
		 * Update
		 * @param array $properties
		 */
		public function update($properties) {
			SessionControllerClass::getSiteConfig()->loadRecord();
			$this->mapUIToBO($properties, SessionControllerClass::getSiteConfig());
			SessionControllerClass::getSiteConfig()->updateRecord();

			return SessionControllerClass::getSiteConfig()->toJSON();
		}
	}
?>