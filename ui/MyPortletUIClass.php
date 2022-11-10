<?php
	require_once(__DIR__ . "/../ui/AbstractBaseDataUIClass.php");
	require_once(__DIR__ . "/../businessobjects/MyPortletClass.php");

	class MyPortletUIClass extends AbstractBaseDataUIClass {

		/**
		 * Insert portlet.
		 * @param array $properties
		 */
		public function insert($properties) {
			$portlet = new MyPortletClass();
		
			$this->mapUIToBO($properties, $portlet);
			
			$portlet->setMemberid(SessionControllerClass::getUser()->getMemberid());
			$portlet->setSequence($portlet->getNextSequence());
			$portlet->insertRecord();
				
			return $this->getPortletHTML($portlet);
		}
		
		private function getPortletHTML($portlet) {
			$html = "<div id='portlet_{$portlet->getId()}' portletid='{$portlet->getId()}' class='portlet' data-refresh='{$portlet->getPortlet()->getRefreshRate()}'>";
			$html .= "<div class='portletheader'>{$portlet->getPortlet()->getHeader()}<span class='portletaction'>";
			$html .= "<img class='openclose' src='images/portlet_down.png' width='16' />&nbsp;";
			$html .= "<img class='closeportlet' src='images/portlet_close.png' width=16 /></span></div>";
			$html .= "<div class='portletcontainer'>";
			
			ob_start();
			
			include(__DIR__ . "/../portlets/{$portlet->getPortlet()->getFilename()}");
				
			$html .= ob_get_clean();
			$html .= "</div></div>";
				
			return $html;
		}
		
		/**
		 * Delete.
		 * 
		 * @param int $id
		 */
		public function delete($id) {
			$portlet = new MyPortletClass();
			$portlet->loadRecord($id);
			$portlet->deleteRecord();

			return $portlet->toJSON();
		}
		
		/**
		 * Update portlet.
		 * @param int $id
		 * @param array $properties
		 */
		public function update($id, $properties) {
			$portlet = new MyPortletClass();
			$portlet->loadRecord($id);
				
			$this->mapUIToBO($properties, $portlet);
			
			$portlet->updateRecord();

			return $portlet->toJSON();
		}

		/**
		 * Load portlet.
		 * @param int $id
		 */
		public function load($id) {
			$portlet = new MyPortletClass();
			$portlet->loadRecord($id);
			
			return $this->getPortletHTML($portlet);
		}
	}
?>