<?php 
	require_once(__DIR__ . "/pgcore-db.php");
	require_once(__DIR__ . "/cache/Cache.php");
	
	$changeset = -1;
	
	try {
		try {
			$changeset = SessionControllerClass::getSiteConfig()->getChangeset();
			
		} catch (Exception $eee) {
			$changeset = -1;
		}
		
		SessionControllerClass::getDB()->beginTransaction();
		
		change(0, "UPDATE trianik_siteconfig set metacreateddate = '2010-01-01' where metacreateddate = 0;");
		change(1, "ALTER TABLE trianik_siteconfig ADD COLUMN changeset INT(11) NULL DEFAULT NULL;");
		change(2, "ALTER TABLE trianik_siteconfig ADD COLUMN id INT NOT NULL AUTO_INCREMENT, ADD PRIMARY KEY (id); ");
		
		change(40000, "ALTER TABLE trianik_pages ADD COLUMN type VARCHAR(1);");
		change(40001, "ALTER TABLE trianik_pages ADD COLUMN content TEXT;");
		
		change(40002, "ALTER TABLE trianik_siteconfig ADD COLUMN phpdateformat VARCHAR(14);");
		change(40003, "ALTER TABLE trianik_siteconfig ADD COLUMN jsdateformat VARCHAR(14);");
		change(40004, "ALTER TABLE trianik_siteconfig ADD COLUMN currencycode VARCHAR(5);");
		change(40005, "ALTER TABLE trianik_siteconfig ADD COLUMN isodialingcode VARCHAR(2);");
		change(40006, "ALTER TABLE trianik_siteconfig ADD COLUMN mobilepattern VARCHAR(7);");
		change(40007, "ALTER TABLE trianik_siteconfig ADD COLUMN smsapikey VARCHAR(60);");
		change(40008, "ALTER TABLE trianik_siteconfig ADD COLUMN smstestmode VARCHAR(1);");
		change(40009, "ALTER TABLE trianik_siteconfig ADD COLUMN smssendername VARCHAR(1);");
		change(40010, "ALTER TABLE trianik_siteconfig ADD COLUMN timezone VARCHAR(40);");
		change(40011, "ALTER TABLE trianik_siteconfig ADD COLUMN sslayer VARCHAR(1);");
		change(40012, "ALTER TABLE trianik_siteconfig ADD COLUMN isolanguage VARCHAR(2);");
		change(40013, "ALTER TABLE trianik_siteconfig ADD COLUMN timezoneoffset VARCHAR(10);");
		change(40014, "ALTER TABLE trianik_siteconfig ADD COLUMN sslencryption VARCHAR(1);");
		change(40015, "ALTER TABLE trianik_siteconfig ADD COLUMN logoimageid INTEGER;");
		change(40016, "ALTER TABLE trianik_siteconfig ADD COLUMN faviconimageid INTEGER;");
		change(40017, "ALTER TABLE trianik_siteconfig ADD COLUMN companyname VARCHAR(60);");
		change(40032, "ALTER TABLE trianik_siteconfig ADD COLUMN asciicurrency INTEGER;");
		change(40033, "ALTER TABLE trianik_images ADD COLUMN uuid VARCHAR(20);");
		change(40034, "ALTER TABLE trianik_images ADD COLUMN sessionid VARCHAR(50);");
		change(40035, "ALTER TABLE trianik_siteconfig ADD COLUMN emailfooter TEXT;");
		change(40036, "ALTER TABLE trianik_siteconfig CHANGE COLUMN smssendername smssendername VARCHAR(50) NULL DEFAULT NULL");
		
		change(40040, "CREATE TABLE trianik_mediatemplate (
							id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
							code VARCHAR(20) NOT NULL,
							name VARCHAR(60) NOT NULL,
							html VARCHAR(1) NOT NULL,
							media TEXT NULL,
							metacreateddate DATETIME NOT NULL,
							metacreateduserid INT(11) NOT NULL,
							metamodifieddate DATETIME NOT NULL,
							metamodifieduserid INT(11) NOT NULL,
							PRIMARY KEY (id)
						)
						COLLATE='latin1_swedish_ci'
						ENGINE=InnoDB
						ROW_FORMAT=DYNAMIC
						AUTO_INCREMENT=1");
		
		change(40041, "INSERT IGNORE INTO trianik_pages
						(pageid, pagename, label, mobilepagename, metacreateddate, metacreateduserid, metamodifieddate, metamodifieduserid, type, content)
						VALUES
						(2027, 'managemediatemplates.php', 'Manage Media Content', NULL, '2018-07-29 12:52:26', 1, '2018-07-29 12:52:26', 1, 'P', NULL)");
		change(40042, "INSERT IGNORE INTO trianik_pageroles
						(pageroleid, pageid, roleid, metacreateddate, metacreateduserid, metamodifieddate, metamodifieduserid)
						VALUES
						(145, 2027, 'ADMIN', NULL, NULL, NULL, NULL)");
		change(40043, "INSERT IGNORE INTO trianik_pagenavigation
						(pagenavigationid, pageid, childpageid, sequence, pagetype, divider, metacreateddate, metacreateduserid, metamodifieddate, metamodifieduserid, title, color, target)
						VALUES
						(55, 1, 2027, 301, 'M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)");
		
		change(40044, "INSERT IGNORE INTO trianik_mediatemplate (id, code, name, html, media, metacreateddate, metacreateduserid, metamodifieddate, metamodifieduserid) VALUES
						(46039, 'USERRESETPASSWORD', 'Reset Password', 'Y', '<p>\${data::config.emailHeader}</p>\r\n<h4>Dear \${firstname},</h4>\r\n<p>Your password has been reset to \${passwd}</p>\r\n<p>We suggest you change your email once connected to the system.</p>\r\n<p>Please contact your system administrator if you have any problems.</p>\r\n<p>\${data::config.emailFooter}</p>', '2017-05-15 17:40:05', 1, '2017-06-15 07:45:48', 1),
						(46040, 'USERREGISTRATION', 'User Registration', 'Y', '<p>\${data::config.emailHeader}</p>\r\n<h4>Welcome \${fullname}.</h4>\r\n<p>You have been invited to become a member of \'International Fashion Models\'.</p>\r\n<p>Please click on the <a title=\"Link\" href=\"\${loginLink}\">link</a> to log in to your account.</p>\r\n<h4>Login details</h4>\r\n<p>User ID : \${login}<br /> Password : \${passwd}</p>\r\n<p>\${data::config.emailFooter}</p>', '2017-05-15 18:25:52', 1, '2017-06-29 17:20:50', 1),
						(1, 'CANCELATIONAPPROVAL', 'Cancellation Approval', 'Y', '<h2>Cancellation approval required for the following job.</h2>\r\n<p>\${emailDetails}</p>\r\n<h2>Reason</h2>\r\n<p>\${notes}</p>\r\n<p>\${actionLink}</p>', '2018-07-29 13:19:38', 1, '2018-07-29 13:19:38', 1),
						(46041, 'DAILYTASKALERT', 'Daily Task Alert', 'Y', '<p>\${data::config.emailHeader}</p>\r\n<h3>Information Only:</h3>\r\n<p>The daily alerts task schedule was run at \${datestamp}</p>\r\n<p>\${data::config.emailFooter}</p>', '2017-05-15 18:54:45', 1, '2017-05-17 17:53:22', 1);");
		
		change(40051, "ALTER TABLE trianik_documents ADD expirydate DATE");
		change(40052, "ALTER TABLE trianik_documents ADD compressed INT");
		change(40053, "ALTER TABLE trianik_documents ADD roleid VARCHAR(50)");
		change(40054, "UPDATE trianik_documents SET compressed = 0 WHERE compressed IS NULL");
		
		change(40055, "ALTER TABLE trianik_roles ADD defaultpageid INT");
		change(40056, "UPDATE trianik_roles SET defaultpageid = 1 WHERE defaultpageid IS NULL");
		change(40057, "ALTER TABLE trianik_roles ADD priority INT");
		change(40058, "UPDATE trianik_roles SET priority = 1 WHERE priority IS NULL");
		change(40070, "ALTER TABLE trianik_siteconfig ADD COLUMN adminemail VARCHAR(200) NULL DEFAULT NULL;");
		change(40072, "ALTER TABLE trianik_roles ADD COLUMN description TEXT NULL DEFAULT NULL;");
		
		change(40091, "ALTER TABLE trianik_siteconfig ADD COLUMN reportlogo int DEFAULT NULL;");
		change(40092, "ALTER TABLE trianik_siteconfig ADD COLUMN reportfooter int DEFAULT NULL;");
		
		change(40095, "UPDATE trianik_siteconfig SET timezone = 'Europe/London' WHERE timezone IS NULL;");
		
		change(40096, "UPDATE trianik_pages set metamodifieddate = '2010-01-01', metacreateddate = '2010-01-01' where metacreateddate = 0;");
		change(40097, "UPDATE trianik_members set dateofbirth = '2010-01-01' where dateofbirth = 0;");
		
		change(50000, "CREATE TABLE IF NOT EXISTS trianik_useragent
					(
					  id int(11) NOT NULL AUTO_INCREMENT,
					  name varchar(40) DEFAULT NULL,
					  useragent varchar(250) DEFAULT NULL,
					  width int(11) DEFAULT NULL,
					  height int(11) DEFAULT NULL,
					  metacreateduserid int(11) DEFAULT NULL,
					  metamodifieduserid int(11) DEFAULT NULL,
					  metacreateddate datetime DEFAULT NULL,
					  metamodifieddate datetime DEFAULT NULL,
					  PRIMARY KEY (id),
					  UNIQUE KEY useragent (useragent)
					) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT");
		change(50001, "ALTER TABLE trianik_pages ADD COLUMN mobilepagename VARCHAR(50);");
		change(50003, "ALTER TABLE trianik_members ADD COLUMN deleted VARCHAR(1) DEFAULT 'N';");
		change(50004, "ALTER TABLE trianik_siteconfig ADD COLUMN emailheader TEXT NULL;");
		change(50043, "UPDATE trianik_holiday set accepteddate = '1900-01-01', rejecteddate = '1900-01-01' where accepteddate = 0 AND rejecteddate = 0;");
		change(50044, "UPDATE trianik_holiday set accepteddate = '1900-01-01' where accepteddate = 0;");
		change(50045, "UPDATE trianik_holiday set rejecteddate = '1900-01-01' where rejecteddate = 0;");
		change(50046, "ALTER TABLE trianik_holiday
							ALTER accepteddate DROP DEFAULT,
							ALTER rejecteddate DROP DEFAULT;");
		change(50047, "ALTER TABLE trianik_holiday
							CHANGE COLUMN accepteddate accepteddate DATE NULL,
							CHANGE COLUMN rejecteddate rejecteddate DATE NULL;");
		change(50048, "UPDATE trianik_holiday set accepteddate = null where accepteddate = '1900-01-01'");
		change(50049, "UPDATE trianik_holiday set rejecteddate = null where rejecteddate = '1900-01-01'");
		change(50050, "ALTER TABLE trianik_siteconfig ADD COLUMN companydetails TEXT NULL DEFAULT NULL;");
		change(50051, "UPDATE trianik_pagenavigation SET pagetype = 'L' where childpageid = 7326");
		change(50052, "UPDATE trianik_pagenavigation SET pagetype = 'M' where childpageid = 7326");
		
		if ($changeset != SessionControllerClass::getSiteConfig()->getChangeset()) {
			SessionControllerClass::getSiteConfig()->setChangeset($changeset);
			SessionControllerClass::getSiteConfig()->updateRecord();
				
			$cache = new Cache(array(
					'name'      => 'session-cache',
					'path'      => __DIR__ . "/tmp/",
					'extension' => '.cache'
			));
			
			$cache->eraseAll();
		}
		
		SessionControllerClass::getDB()->commit();
		
	} catch (Exception $e) {
		echo "EXCEPT:{$e->getMessage()}<br>";
		SessionControllerClass::getDB()->rollBack();
		
		logError($e->getMessage());
	}
	
	function change($sequence, $sql) {
		global $changeset;
		
		try {
			if ($sequence > $changeset) {
				echo "$sequence: $sql<br>";
				
				$stmt = SessionControllerClass::getDB()->prepare($sql);
				$stmt->execute();
				
				$changeset = $sequence;
			}
			
		} catch (Exception $e) {
			echo "<div>$sequence: Error [{$e->getMessage()}</div>";
		}
	}
?>