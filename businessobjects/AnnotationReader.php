<?php

namespace DocBlockReader;

// $reader = new Reader ( new Kev (), 'myVar2', 'property' );
// $x = $reader->getParameter ( "x" );
// $y = $reader->getParameter ( "y" );
// echo "<div>Test 1:$y</div>";
// echo "<div>Test 2:$y</div>";
// $reader = new Reader ( new Kev () );
// $x = $reader->getParameter ( "string" );
// $y = $reader->getParameter ( "string2" );
// $reader = new Reader ( new Kev (), "getSomething", 'method' );
// $x = $reader->getParameter ( "primarykey1" );
// $y = $reader->getParameter ( "column" );
// echo "<div>Test 3:$x</div>";
// echo "<div>Test 4:$y</div>";


class ReaderException extends \Exception {
}
class Reader {
	private $rawDocBlock;
	private $parameters;
	private $keyPattern = "[A-z0-9\_\-]+";
	private $endPattern = "[ ]*(?:@|\r\n|\n)";
	private $parsedAll = FALSE;
	
	public function __construct() {
		$arguments = func_get_args ();
		$count = count ( $arguments );
		// get reflection from class or class/method
		// (depends on constructor arguments)
		if ($count === 0) {
			throw new \Exception ( "No zero argument constructor allowed" );
			
		} else if ($count === 1) {
			$reflection = new \ReflectionClass ( $arguments [0] );
			
		} else {
			$type = $count === 3 ? $arguments [2] : "method";
			
			if ($type === "method") {
				$reflection = new \ReflectionMethod ( $arguments [0], $arguments [1] );
				
			} else if ($type === "property") {
				$reflection = new \ReflectionProperty ( $arguments [0], $arguments [1] );
			}
		}
		
		$this->rawDocBlock = $reflection->getDocComment ();
		$this->parameters = array ();
	}
	
	private function parseSingle($key) {
		if (isset ( $this->parameters [$key] )) {
			return $this->parameters [$key];
			
		} else {
			if (preg_match ( "/@" . preg_quote ( $key ) . $this->endPattern . "/", $this->rawDocBlock, $match )) {
				return TRUE;
				
			} else {
				preg_match_all ( "/@" . preg_quote ( $key ) . " (.*)" . $this->endPattern . "/U", $this->rawDocBlock, $matches );
				$size = sizeof ( $matches [1] );
				
				// not found
				if ($size === 0) {
					return NULL;
				}				// found one, save as scalar
				elseif ($size === 1) {
					return $this->parseValue ( $matches [1] [0] );
				} 				// found many, save as array
				else {
					$this->parameters [$key] = array ();
					foreach ( $matches [1] as $elem ) {
						$this->parameters [$key] [] = $this->parseValue ( $elem );
					}
					return $this->parameters [$key];
				}
			}
		}
	}
	private function parse() {
		$pattern = "/@(?=(.*)" . $this->endPattern . ")/U";
		preg_match_all ( $pattern, $this->rawDocBlock, $matches );
		foreach ( $matches [1] as $rawParameter ) {
			if (preg_match ( "/^(" . $this->keyPattern . ") (.*)$/", $rawParameter, $match )) {
				$parsedValue = $this->parseValue ( $match [2] );
				if (isset ( $this->parameters [$match [1]] )) {
					$this->parameters [$match [1]] = array_merge ( ( array ) $this->parameters [$match [1]], ( array ) $parsedValue );
				} else {
					$this->parameters [$match [1]] = $parsedValue;
				}
			} else if (preg_match ( "/^" . $this->keyPattern . "$/", $rawParameter, $match )) {
				$this->parameters [$rawParameter] = TRUE;
			} else {
				$this->parameters [$rawParameter] = NULL;
			}
		}
	}
	
	public function getVariableDeclarations($name) {
		$declarations = ( array ) $this->getParameter ( $name );
		foreach ( $declarations as &$declaration ) {
			$declaration = $this->parseVariableDeclaration ( $declaration, $name );
		}
		return $declarations;
	}
	
	private function parseVariableDeclaration($declaration, $name) {
		$type = gettype ( $declaration );
		if ($type !== 'string') {
			throw new \InvalidArgumentException ( "Raw declaration must be string, $type given. Key='$name'." );
		}
		if (strlen ( $declaration ) === 0) {
			throw new \InvalidArgumentException ( "Raw declaration cannot have zero length. Key='$name'." );
		}
		$declaration = explode ( " ", $declaration );
		if (sizeof ( $declaration ) == 1) {
			// string is default type
			array_unshift ( $declaration, "string" );
		}
		// take first two as type and name
		$declaration = array (
				'type' => $declaration [0],
				'name' => $declaration [1] 
		);
		return $declaration;
	}
	
	private function parseValue($originalValue) {
		if ($originalValue && $originalValue !== 'null') {
			// try to json decode, if cannot then store as string
			if (($json = json_decode ( $originalValue, TRUE )) === NULL) {
				$value = $originalValue;
			} else {
				$value = $json;
			}
		} else {
			$value = NULL;
		}
		return $value;
	}
	
	public function getParameters() {
		if (! $this->parsedAll) {
			$this->parse ();
			$this->parsedAll = TRUE;
		}
		return $this->parameters;
	}

	public function getParameter($key) {
		return $this->parseSingle ( $key );
	}
}
?>
