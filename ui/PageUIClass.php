<?php
require_once(__DIR__ . "/../businessobjects/PageClass.php");
require_once(__DIR__ . "/../businessobjects/PageNavigationClass.php");
require_once(__DIR__ . "/../cache/Cache.php");
require_once(__DIR__ . "/../businessobjects/UseragentClass.php");

class PageUIClass {

	/**
	 * Load page.
	 * @param int $pageid
	 * @return string
	 */
	public function load($pageid) {
		$page = new PageClass();
		$page->loadRecord($pageid);
			
		return $page->toJSON();
	}

	/**
	 * Load home page menu
	 * @return string
	 */
	public static function loadHomePageMenu() {
		$cache = new Cache(array(
				'name'      => 'page-cache',
				'path'      => __DIR__ . "/../tmp/",
				'extension' => '.cache'
		));

		if ($cache->isCached("page/menu/" . SessionControllerClass::getUser()->getMemberid())) {
			return $cache->retrieve("page/menu/" . SessionControllerClass::getUser()->getMemberid());
		}
			
		$page = new PageClass();
		$page->loadRecord(PageClass::PAGE_HOMEPAGE);
			
		$menuHTML = "<div class='red'><ul class='mega-menu'>\n";

		foreach ($page->getChildPages() AS $navigation) {
			$menuHTML .= "<li onclick='window.location.href = \"{$navigation->getChildPage()->getPageName()}\"'>";
			$target = "";
				
			if ($navigation->getTarget() != null) {
				$target = " target='{$navigation->getTarget()}' ";
			}
				
			$menuHTML .= "<a $target href='{$navigation->getChildPage()->getPageName()}'><em><b>{$navigation->getChildPage()->getLabel()}</b></em></a>\n";

			/* Check for child sub pages. */
			if (count($navigation->getChildPage()->getChildMenuItems()) > 0) {
				$menuHTML .= "<ul>\n";
				$titleUsed = false;

				/* Iterate through child sub pages. */
				foreach ($navigation->getChildPage()->getChildMenuItems() AS $child) {

					/* Show children. */
					if ($child->getTitle() != null) {
						if ($titleUsed) {
							/* Close the tags. */
							$menuHTML .= "</ul></li>\n";
						}
							
						$titleUsed = true;
						$menuHTML .= "<li><a href='#'>{$child->getTitle()}</a><ul>";
					}
						
					$menuHTML .= "<li class='submenuitem'>";
						
					$target = "";
						
					if ($child->getTarget() != null) {
						$target = " target='{$child->getTarget()}' ";
					}
						
					$menuHTML .= "<a $target href='{$child->getChildPage()->getPageName()}'>{$child->getChildPage()->getLabel()}</a></li>\n";
				}
					
				if ($titleUsed) {
					$menuHTML .= "</ul></li>\n";
				}

				$menuHTML .= "</ul>\n";
			}

			$menuHTML .= "</li>\n";

			if ($navigation->getDivider() == 1) {
				$menuHTML .= "<div class='divider'>&nbsp;</div>\n";
			}
		}
			
		$menuHTML .= "</ul></div>\n";

		$cache->store("page/menu/" . SessionControllerClass::getUser()->getMemberid(), $menuHTML);

		return $menuHTML;
	}

	/**
	 * Show breadcrumb trail.
	 */
	public static function showBreadcrumbTrail() {
		$key = "";
		$cache = new Cache(array(
				'name'      => 'page-cache',
				'path'      => __DIR__ . "/../tmp/",
				'extension' => '.cache'
		));
			
		if (isset($_GET['callee'])) {
			$key = "breadcrumb/{$_GET['callee']}/" . SessionControllerClass::getPage()->getPageid();

			if ($cache->isCached($key)) {
				echo $cache->retrieve($key);
				return;
			}

			$pages = SessionControllerClass::getPage()->loadBreadcrumbTrail();
			$page = new PageClass(true);
			$page->loadByPageName(base64_decode($_GET['callee']));

			array_splice($pages, 1, 0, array($page));
				
		} else {
			$key = "breadcrumb/" . SessionControllerClass::getPage()->getPageid();

			if ($cache->isCached($key)) {
				echo $cache->retrieve($key);
				return;
			}

			$pages = SessionControllerClass::getPage()->loadBreadcrumbTrail();
		}

		$pages = array_reverse($pages);

		$first = true;
		$html = "<h4 class='breadcrumb'>";
			
		foreach ($pages AS $page) {
			if (! $first) {
				$html .= "<img src='" . SessionControllerClass::getSiteConfig()->getDomainurl() . "/images/chevron.png' />";
			}

			$first = false;

			if ($page->getPageid() == SessionControllerClass::getPage()->getPageid()) {
				$html .= "<a href='javascript: void(0)' class='lastchild'>";
					
			} else {
				$html .="<a href='{$page->getPagename()}'>";
			}
				
			$html .= str_replace("Manage ", "", $page->getLabel());
			$html .= "</a>";
		}
			
		$html .="</h4>";
			
		$cache->store($key, $html);
			
		echo $html;
	}

	/**
	 * Load landing page.
	 */
	public static function loadLandingPage() {
		if (! SessionControllerClass::getUser()->isAuthenticated() && ! endsWith($_SERVER['PHP_SELF'], "system-login.php")) {
			if (UseragentClass::isMobileDevice()) {
				header("location: m.system-login.php?session=" . urlencode(base64_encode($_SERVER['PHP_SELF'] . "?" . $_SERVER['QUERY_STRING'] )));
					
			} else {
				header("location: system-login.php?session=" . urlencode(base64_encode($_SERVER['PHP_SELF'] . "?" . $_SERVER['QUERY_STRING'] )));
			}

			exit();
		}
			
		$pageName = substr($_SERVER["PHP_SELF"], strripos($_SERVER["PHP_SELF"], "/") + 1);
			
		if ($pageName == "dynamicpage.php") {
			$pageName .= "?page=" . $_GET['page'];
		}
			
		$page = new PageClass(true);
		$page->loadByPageName($pageName);
			
		if ($page->getId() != null) {
			if ($page->getMobilepagename() != null && $page->getMobilepagename() != "") {
				if (UseragentClass::isMobileDevice()) {
					header("location: {$page->getMobilepagename()}");
					exit();
				}
			}
				
			SessionControllerClass::setPage($page);
				
		} else {
			header("location: system-access-denied.php");
			exit();
		}
	}
}
?>