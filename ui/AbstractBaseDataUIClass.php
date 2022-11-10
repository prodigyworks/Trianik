<?php
require_once(__DIR__ . "/../businessobjects/AbstractBaseDataClass.php");

abstract class AbstractBaseDataUIClass extends AbstractBaseDataClass {

	private $columnDefinitions = array();

	public function __construct() {
		foreach (get_class_methods($this) as $method) {
			$reader = new DocBlockReader\Reader($this, $method, "method");
				
			if ($reader->getParameter("role") == null) {
				$this->columnDefinitions[$method] = array("USER");

			} else {
				$this->columnDefinitions[$method] = explode(",", $reader->getParameter("role"));
			}
		}
	}

	/* Combo options. */
	private $comboOptions = array();

	public function role($method) {
		return $this->columnDefinitions[$method];
	}

	/**
	 * Get combo option
	 * @param string $id
	 * @param string $value
	 */
	public function addComboOption($id, $value) {
		$this->comboOptions[] = "<option value='$id'>$value</option>";
	}

	/**
	 * Add blank combo option.
	 */
	public function addBlankComboOption() {
		$this->comboOptions[] = "<option value='0'></option>";
	}

	/**
	 * Get combo options.
	 * @return string
	 */
	public function getComboOptions() {
		return implode($this->comboOptions);
	}

	/**
	 * Map UI object to Business object.
	 * @param array $properties
	 * @param AbstractBaseDataClass $instance
	 */
	public function mapUIToBO($properties, $instance) {
		/* Filter columns. */
		$filteredColumns = array_filter(
				$instance->getColumnDefinitions(),
				function ($column) {
					return
					$column['column'] != "" &&
					$column['setmethod'] != "";
				}
				);
			
		foreach ($filteredColumns AS $column) {
			if (isset($properties[$column['propertyname']])) {
				$instance->{$column['setmethod']}($properties[$column['propertyname']]);
			}
		}
	}
}
?>