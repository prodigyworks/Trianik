DROP TABLE schokolat_event;

CREATE TABLE `schokolat_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imageid` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `shortname` varchar(10) DEFAULT NULL,
  `firstname` varchar(25) DEFAULT NULL,
  `lastname` varchar(25) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `town` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `county` varchar(50) DEFAULT NULL,
  `postcode` varchar(12) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `metacreateduserid` int(11) DEFAULT NULL,
  `metamodifieduserid` int(11) DEFAULT NULL,
  `metacreateddate` datetime DEFAULT NULL,
  `metamodifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `shortname` (`shortname`)
) ENGINE=InnoDB AUTO_INCREMENT=38351 DEFAULT CHARSET=latin1;

INSERT INTO schokolat_event VALUES("38340","0","Bath Christmas Market ","Bath","Stewart ","Maxwell","Bath High Street","Bath","Bath","Glous","BA1","colin@aperfectpocket.co.uk","02037736227","1","1","2015-09-24 10:39:53","2015-10-28 12:32:51");
INSERT INTO schokolat_event VALUES("38341","0","Cardiff Christmas Market","Cardiff","Stewart","Maxwell","Unit 1 Murrell Green Business Park","Hook","Hook","UK","RG27 9GR","colin@aperfectpocket.co.uk","02037736227","1","1","2015-09-25 07:32:35","2015-10-28 05:47:56");
INSERT INTO schokolat_event VALUES("38343","0","Cheltenham Christmas Market","Cheltenham","Stewart","Maxwell","Unit 1 Murrell Green Business Park","Hook","Hook","UK","RG27 9GR","colin@aperfectpocket.co.uk","02037736227","1","1","2015-09-25 07:33:43","2015-11-04 08:07:29");
INSERT INTO schokolat_event VALUES("38344","0","Chester Christmas Market","Chester","Stewart","Maxwell","Unit 1 Murrell Green Business Park","Hook","Hook","UK","RG27 9GR","colin@aperfectpocket.co.uk","02037736227","1","1","2015-09-25 07:34:28","2015-10-28 05:48:07");
INSERT INTO schokolat_event VALUES("38345","0","Edinburgh Christmas Market ","Edinburgh ","Stewart","Maxwell","Unit 1 Murrell Green Business Park","Hook","Hook","UK","RG27 9GR","colin@aperfectpocket.co.uk","02037736227","1","1","2015-09-25 07:37:01","2015-09-25 07:37:01");
INSERT INTO schokolat_event VALUES("38347","0","The Oracle Shopping Centre Reading","The Oracle","Stewart","Maxwell","Unit 1 Murrell Green Business Park","Hook","Hook","UK","RG27 9GR","colin@aperfectpocket.co.uk","02037736227","1","1","2015-09-25 07:37:56","2015-09-25 07:37:56");
INSERT INTO schokolat_event VALUES("38348","0","West Quays Shopping Centre Southampton","West Quays","Stewart","Maxwell","Unit 1 Murrell Green Business Park","Hook","Hook","UK","RG27 9GR","colin@aperfectpocket.co.uk","02037736227","1","1","2015-09-25 07:38:46","2015-11-04 10:12:47");
INSERT INTO schokolat_event VALUES("38349","0","Winchester Christmas Market","Winchester","Stewart","Maxwell","Unit 1 Murrell Green Business Park","Hook","Hook","UK","RG27 9GR","colin@aperfectpocket.co.uk","02037736227","1","1","2015-09-25 07:39:19","2015-09-25 07:39:19");
INSERT INTO schokolat_event VALUES("38350","0","Winter Wonderland London","WWL","Stewart","Maxwell","Unit 1 Murrell Green Business Park","Hook","Hook","UK","RG27 9GR","colin@aperfectpocket.co.uk","02037736227","1","1","2015-09-25 07:39:49","2015-10-28 05:48:27");



DROP TABLE schokolat_eventforecast;

CREATE TABLE `schokolat_eventforecast` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) DEFAULT NULL,
  `forecastdate` date DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `metacreateduserid` int(11) DEFAULT NULL,
  `metamodifieduserid` int(11) DEFAULT NULL,
  `metacreateddate` datetime DEFAULT NULL,
  `metamodifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eventid` (`eventid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

INSERT INTO schokolat_eventforecast VALUES("1","38340","2015-10-23","233.00","","","","");
INSERT INTO schokolat_eventforecast VALUES("2","38340","2015-10-24","1000.00","","","","");
INSERT INTO schokolat_eventforecast VALUES("3","38340","2015-10-28","900.00","","","","");
INSERT INTO schokolat_eventforecast VALUES("4","38341","2015-10-29","1200.00","","","","");
INSERT INTO schokolat_eventforecast VALUES("5","38341","2015-10-28","600.00","","","","");
INSERT INTO schokolat_eventforecast VALUES("6","38348","2015-11-05","750.00","","","","");
INSERT INTO schokolat_eventforecast VALUES("7","38348","2015-11-06","750.00","","","","");
INSERT INTO schokolat_eventforecast VALUES("8","38348","2015-11-07","1000.00","","","","");
INSERT INTO schokolat_eventforecast VALUES("9","38348","2015-11-08","1000.00","","","","");
INSERT INTO schokolat_eventforecast VALUES("10","38348","2015-11-09","1000.00","","","","");
INSERT INTO schokolat_eventforecast VALUES("11","38348","2015-11-10","1000.00","","","","");
INSERT INTO schokolat_eventforecast VALUES("12","38348","2015-11-11","1000.00","","","","");
INSERT INTO schokolat_eventforecast VALUES("13","38348","2015-11-12","1250.00","","","","");
INSERT INTO schokolat_eventforecast VALUES("14","38348","2015-11-12","1500.00","","","","");
INSERT INTO schokolat_eventforecast VALUES("15","38348","2015-11-14","1500.00","","","","");
INSERT INTO schokolat_eventforecast VALUES("16","38348","2015-11-15","1000.00","","","","");



DROP TABLE schokolat_eventproductmatrix;

CREATE TABLE `schokolat_eventproductmatrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `metacreateduserid` int(11) DEFAULT NULL,
  `metamodifieduserid` int(11) DEFAULT NULL,
  `metacreateddate` datetime DEFAULT NULL,
  `metamodifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `eventid, productid` (`productid`,`eventid`)
) ENGINE=InnoDB AUTO_INCREMENT=297 DEFAULT CHARSET=latin1;

INSERT INTO schokolat_eventproductmatrix VALUES("1","38340","38347","95","1","1","2015-10-01 13:42:12","2015-10-01 13:42:12");
INSERT INTO schokolat_eventproductmatrix VALUES("2","38340","38345","0","1","1","2015-10-01 13:42:18","2015-11-04 08:34:44");
INSERT INTO schokolat_eventproductmatrix VALUES("3","38340","38346","0","1","1","2015-10-22 11:34:29","2015-11-04 08:19:56");
INSERT INTO schokolat_eventproductmatrix VALUES("4","38340","38349","0","1","1","2015-10-27 12:50:55","2015-11-04 08:20:04");
INSERT INTO schokolat_eventproductmatrix VALUES("5","38340","38348","0","1","1","2015-10-28 09:42:00","2015-10-28 09:42:00");
INSERT INTO schokolat_eventproductmatrix VALUES("6","38340","38350","0","1","1","2015-10-28 09:42:30","2015-10-28 09:42:30");
INSERT INTO schokolat_eventproductmatrix VALUES("7","38340","38351","0","1","1","2015-10-28 12:33:27","2015-10-28 12:33:27");
INSERT INTO schokolat_eventproductmatrix VALUES("8","38340","38352","0","1","1","2015-10-28 12:33:36","2015-10-28 12:33:36");
INSERT INTO schokolat_eventproductmatrix VALUES("9","38340","38353","0","1","1","2015-10-28 12:33:50","2015-10-28 12:33:50");
INSERT INTO schokolat_eventproductmatrix VALUES("10","38340","38354","0","1","1","2015-10-28 12:33:58","2015-10-28 12:33:58");
INSERT INTO schokolat_eventproductmatrix VALUES("11","38340","38355","0","1","1","2015-10-28 12:34:07","2015-10-28 12:34:07");
INSERT INTO schokolat_eventproductmatrix VALUES("12","38340","38356","0","1","1","2015-10-28 12:34:16","2015-10-28 12:34:16");
INSERT INTO schokolat_eventproductmatrix VALUES("13","38340","38357","0","1","1","2015-10-28 12:34:24","2015-10-28 12:34:24");
INSERT INTO schokolat_eventproductmatrix VALUES("14","38340","38358","0","1","1","2015-10-28 12:34:32","2015-10-28 12:34:32");
INSERT INTO schokolat_eventproductmatrix VALUES("15","38340","38359","0","1","1","2015-10-28 12:34:40","2015-10-28 12:34:40");
INSERT INTO schokolat_eventproductmatrix VALUES("16","38340","38360","0","1","1","2015-10-28 12:34:49","2015-10-28 12:34:49");
INSERT INTO schokolat_eventproductmatrix VALUES("17","38340","38361","0","1","1","2015-10-28 12:34:57","2015-10-28 12:34:57");
INSERT INTO schokolat_eventproductmatrix VALUES("18","38340","38362","0","1","1","2015-10-28 12:35:05","2015-10-28 12:35:05");
INSERT INTO schokolat_eventproductmatrix VALUES("20","38340","38363","0","1","1","2015-10-28 12:35:27","2015-10-28 12:35:27");
INSERT INTO schokolat_eventproductmatrix VALUES("21","38340","38364","0","1","1","2015-10-28 12:35:38","2015-10-28 12:35:38");
INSERT INTO schokolat_eventproductmatrix VALUES("23","38340","38365","0","1","1","2015-10-28 12:36:47","2015-10-28 12:36:47");
INSERT INTO schokolat_eventproductmatrix VALUES("24","38340","38366","0","1","1","2015-10-28 12:36:58","2015-10-28 12:36:58");
INSERT INTO schokolat_eventproductmatrix VALUES("26","38340","38367","0","1","1","2015-10-28 12:37:26","2015-10-28 12:37:26");
INSERT INTO schokolat_eventproductmatrix VALUES("27","38340","38369","0","1","1","2015-10-28 12:37:40","2015-10-28 12:37:40");
INSERT INTO schokolat_eventproductmatrix VALUES("28","38340","38371","0","1","1","2015-10-28 12:37:50","2015-10-28 12:37:50");
INSERT INTO schokolat_eventproductmatrix VALUES("29","38340","38370","0","1","1","2015-10-28 12:38:02","2015-10-28 12:38:02");
INSERT INTO schokolat_eventproductmatrix VALUES("30","38340","38372","0","1","1","2015-10-28 12:38:13","2015-10-28 12:38:13");
INSERT INTO schokolat_eventproductmatrix VALUES("31","38340","38373","0","1","1","2015-10-28 12:38:22","2015-10-28 12:38:22");
INSERT INTO schokolat_eventproductmatrix VALUES("32","38340","38374","0","1","1","2015-10-28 12:38:32","2015-10-28 12:38:32");
INSERT INTO schokolat_eventproductmatrix VALUES("33","38340","38375","0","1","1","2015-10-28 12:38:42","2015-10-28 12:38:42");
INSERT INTO schokolat_eventproductmatrix VALUES("34","38340","38376","0","1","1","2015-10-28 12:38:52","2015-10-28 12:38:52");
INSERT INTO schokolat_eventproductmatrix VALUES("47","38347","38345","0","1","1","2015-10-28 12:56:14","2015-11-04 09:34:01");
INSERT INTO schokolat_eventproductmatrix VALUES("50","38348","38345","119","1","1","2015-10-28 13:00:33","2015-11-04 09:34:36");
INSERT INTO schokolat_eventproductmatrix VALUES("51","38348","38346","20","1","1","2015-10-28 13:00:43","2015-11-04 09:34:44");
INSERT INTO schokolat_eventproductmatrix VALUES("52","38348","38348","39","1","1","2015-10-28 13:00:51","2015-11-04 09:35:07");
INSERT INTO schokolat_eventproductmatrix VALUES("53","38348","38349","20","1","1","2015-10-28 13:01:01","2015-11-04 09:35:17");
INSERT INTO schokolat_eventproductmatrix VALUES("54","38348","38350","20","1","1","2015-10-28 13:01:11","2015-11-04 09:35:27");
INSERT INTO schokolat_eventproductmatrix VALUES("55","38348","38351","20","1","1","2015-11-03 11:19:10","2015-11-04 09:35:35");
INSERT INTO schokolat_eventproductmatrix VALUES("56","38348","38352","22","1","1","2015-11-03 11:19:24","2015-11-04 09:35:45");
INSERT INTO schokolat_eventproductmatrix VALUES("57","38348","38353","20","1","1","2015-11-03 11:19:32","2015-11-04 09:35:54");
INSERT INTO schokolat_eventproductmatrix VALUES("58","38348","38354","20","1","1","2015-11-03 11:19:41","2015-11-04 09:36:05");
INSERT INTO schokolat_eventproductmatrix VALUES("59","38348","38355","19","1","1","2015-11-03 11:19:50","2015-11-04 09:36:12");
INSERT INTO schokolat_eventproductmatrix VALUES("60","38348","38356","58","1","1","2015-11-03 11:20:00","2015-11-04 09:36:21");
INSERT INTO schokolat_eventproductmatrix VALUES("61","38348","38357","20","1","1","2015-11-03 11:20:10","2015-11-04 09:36:29");
INSERT INTO schokolat_eventproductmatrix VALUES("62","38348","38358","20","1","1","2015-11-03 11:20:19","2015-11-04 09:36:36");
INSERT INTO schokolat_eventproductmatrix VALUES("63","38348","38359","38","1","1","2015-11-03 11:20:26","2015-11-04 09:36:44");
INSERT INTO schokolat_eventproductmatrix VALUES("64","38348","38360","20","1","1","2015-11-03 11:20:34","2015-11-04 09:38:41");
INSERT INTO schokolat_eventproductmatrix VALUES("65","38348","38361","20","1","1","2015-11-03 11:20:43","2015-11-04 09:38:49");
INSERT INTO schokolat_eventproductmatrix VALUES("66","38348","38362","40","1","1","2015-11-03 11:20:51","2015-11-04 09:38:58");
INSERT INTO schokolat_eventproductmatrix VALUES("67","38348","38363","20","1","1","2015-11-03 11:21:03","2015-11-04 09:39:08");
INSERT INTO schokolat_eventproductmatrix VALUES("68","38348","38364","20","1","1","2015-11-03 11:21:15","2015-11-04 09:39:30");
INSERT INTO schokolat_eventproductmatrix VALUES("70","38348","38365","19","1","1","2015-11-03 11:21:40","2015-11-04 09:39:40");
INSERT INTO schokolat_eventproductmatrix VALUES("71","38348","38366","20","1","1","2015-11-03 11:21:51","2015-11-04 09:39:50");
INSERT INTO schokolat_eventproductmatrix VALUES("72","38348","38367","20","1","1","2015-11-03 11:22:03","2015-11-04 09:39:58");
INSERT INTO schokolat_eventproductmatrix VALUES("73","38348","38369","58","1","1","2015-11-03 11:22:13","2015-11-04 09:40:11");
INSERT INTO schokolat_eventproductmatrix VALUES("74","38348","38371","58","1","1","2015-11-03 11:22:24","2015-11-04 09:40:44");
INSERT INTO schokolat_eventproductmatrix VALUES("75","38348","38370","0","1","1","2015-11-03 11:22:33","2015-11-04 09:40:52");
INSERT INTO schokolat_eventproductmatrix VALUES("76","38348","38372","54","1","1","2015-11-03 11:22:43","2015-11-04 09:41:01");
INSERT INTO schokolat_eventproductmatrix VALUES("77","38348","38373","18","1","1","2015-11-03 11:22:55","2015-11-04 09:41:09");
INSERT INTO schokolat_eventproductmatrix VALUES("78","38348","38374","24","1","1","2015-11-03 11:23:05","2015-11-04 09:41:19");
INSERT INTO schokolat_eventproductmatrix VALUES("79","38348","38375","0","1","1","2015-11-03 11:23:15","2015-11-04 09:41:29");
INSERT INTO schokolat_eventproductmatrix VALUES("80","38348","38376","39","1","1","2015-11-03 11:23:33","2015-11-04 09:41:38");
INSERT INTO schokolat_eventproductmatrix VALUES("81","38341","38345","0","1","1","2015-11-04 07:48:14","2015-11-04 07:48:14");
INSERT INTO schokolat_eventproductmatrix VALUES("82","38341","38346","0","1","1","2015-11-04 07:48:23","2015-11-04 07:48:23");
INSERT INTO schokolat_eventproductmatrix VALUES("83","38341","38348","0","1","1","2015-11-04 07:48:32","2015-11-04 07:48:32");
INSERT INTO schokolat_eventproductmatrix VALUES("84","38341","38349","0","1","1","2015-11-04 07:48:40","2015-11-04 07:48:40");
INSERT INTO schokolat_eventproductmatrix VALUES("85","38341","38350","0","1","1","2015-11-04 07:48:47","2015-11-04 07:48:47");
INSERT INTO schokolat_eventproductmatrix VALUES("86","38341","38351","0","1","1","2015-11-04 07:48:56","2015-11-04 07:48:56");
INSERT INTO schokolat_eventproductmatrix VALUES("87","38341","38352","0","1","1","2015-11-04 07:49:05","2015-11-04 07:49:05");
INSERT INTO schokolat_eventproductmatrix VALUES("88","38341","38353","0","1","1","2015-11-04 07:49:13","2015-11-04 07:49:13");
INSERT INTO schokolat_eventproductmatrix VALUES("89","38341","38354","0","1","1","2015-11-04 07:57:13","2015-11-04 07:57:13");
INSERT INTO schokolat_eventproductmatrix VALUES("90","38341","38355","0","1","1","2015-11-04 07:57:22","2015-11-04 07:57:22");
INSERT INTO schokolat_eventproductmatrix VALUES("91","38341","38356","0","1","1","2015-11-04 07:57:32","2015-11-04 07:57:32");
INSERT INTO schokolat_eventproductmatrix VALUES("92","38341","38357","0","1","1","2015-11-04 07:57:41","2015-11-04 07:57:41");
INSERT INTO schokolat_eventproductmatrix VALUES("93","38341","38358","0","1","1","2015-11-04 07:57:50","2015-11-04 07:57:50");
INSERT INTO schokolat_eventproductmatrix VALUES("94","38341","38359","0","1","1","2015-11-04 07:57:59","2015-11-04 07:57:59");
INSERT INTO schokolat_eventproductmatrix VALUES("95","38341","38360","0","1","1","2015-11-04 07:58:08","2015-11-04 07:58:08");
INSERT INTO schokolat_eventproductmatrix VALUES("96","38341","38361","0","1","1","2015-11-04 07:58:16","2015-11-04 07:58:16");
INSERT INTO schokolat_eventproductmatrix VALUES("97","38341","38362","0","1","1","2015-11-04 07:58:25","2015-11-04 07:58:25");
INSERT INTO schokolat_eventproductmatrix VALUES("98","38341","38363","0","1","1","2015-11-04 07:58:39","2015-11-04 07:58:39");
INSERT INTO schokolat_eventproductmatrix VALUES("99","38341","38364","0","1","1","2015-11-04 07:58:52","2015-11-04 07:58:52");
INSERT INTO schokolat_eventproductmatrix VALUES("100","38341","38365","0","1","1","2015-11-04 07:59:09","2015-11-04 07:59:09");
INSERT INTO schokolat_eventproductmatrix VALUES("101","38341","38366","0","1","1","2015-11-04 08:00:18","2015-11-04 08:00:18");
INSERT INTO schokolat_eventproductmatrix VALUES("102","38341","38367","0","1","1","2015-11-04 08:00:29","2015-11-04 08:00:29");
INSERT INTO schokolat_eventproductmatrix VALUES("103","38341","38369","0","1","1","2015-11-04 08:00:40","2015-11-04 08:00:40");
INSERT INTO schokolat_eventproductmatrix VALUES("104","38341","38371","0","1","1","2015-11-04 08:00:50","2015-11-04 08:00:50");
INSERT INTO schokolat_eventproductmatrix VALUES("105","38341","38370","0","1","1","2015-11-04 08:01:03","2015-11-04 08:01:03");
INSERT INTO schokolat_eventproductmatrix VALUES("106","38341","38372","0","1","1","2015-11-04 08:01:12","2015-11-04 08:01:12");
INSERT INTO schokolat_eventproductmatrix VALUES("107","38341","38373","0","1","1","2015-11-04 08:01:23","2015-11-04 08:01:23");
INSERT INTO schokolat_eventproductmatrix VALUES("108","38341","38374","0","1","1","2015-11-04 08:01:33","2015-11-04 08:01:33");
INSERT INTO schokolat_eventproductmatrix VALUES("109","38341","38375","0","1","1","2015-11-04 08:01:44","2015-11-04 08:01:44");
INSERT INTO schokolat_eventproductmatrix VALUES("110","38341","38376","0","1","1","2015-11-04 08:01:52","2015-11-04 08:01:52");
INSERT INTO schokolat_eventproductmatrix VALUES("111","38343","38345","0","1","1","2015-11-04 08:07:45","2015-11-04 08:07:45");
INSERT INTO schokolat_eventproductmatrix VALUES("112","38343","38346","0","1","1","2015-11-04 08:07:51","2015-11-04 08:07:51");
INSERT INTO schokolat_eventproductmatrix VALUES("114","38343","38348","0","1","1","2015-11-04 08:08:02","2015-11-04 08:08:02");
INSERT INTO schokolat_eventproductmatrix VALUES("115","38343","38349","0","1","1","2015-11-04 08:08:10","2015-11-04 08:08:10");
INSERT INTO schokolat_eventproductmatrix VALUES("116","38343","38350","0","1","1","2015-11-04 08:08:18","2015-11-04 08:08:18");
INSERT INTO schokolat_eventproductmatrix VALUES("117","38343","38351","0","1","1","2015-11-04 08:08:25","2015-11-04 08:08:25");
INSERT INTO schokolat_eventproductmatrix VALUES("118","38343","38352","0","1","1","2015-11-04 08:08:32","2015-11-04 08:08:32");
INSERT INTO schokolat_eventproductmatrix VALUES("119","38343","38353","0","1","1","2015-11-04 08:08:46","2015-11-04 08:08:46");
INSERT INTO schokolat_eventproductmatrix VALUES("120","38343","38355","0","1","1","2015-11-04 08:08:55","2015-11-04 08:08:55");
INSERT INTO schokolat_eventproductmatrix VALUES("121","38343","38354","0","1","1","2015-11-04 08:09:07","2015-11-04 08:09:07");
INSERT INTO schokolat_eventproductmatrix VALUES("122","38343","38356","0","1","1","2015-11-04 08:09:15","2015-11-04 08:09:15");
INSERT INTO schokolat_eventproductmatrix VALUES("123","38343","38357","0","1","1","2015-11-04 08:09:27","2015-11-04 08:09:27");
INSERT INTO schokolat_eventproductmatrix VALUES("124","38343","38358","0","1","1","2015-11-04 08:09:36","2015-11-04 08:09:36");
INSERT INTO schokolat_eventproductmatrix VALUES("125","38343","38359","0","1","1","2015-11-04 08:09:44","2015-11-04 08:09:44");
INSERT INTO schokolat_eventproductmatrix VALUES("126","38343","38360","0","1","1","2015-11-04 08:09:52","2015-11-04 08:09:52");
INSERT INTO schokolat_eventproductmatrix VALUES("127","38343","38361","0","1","1","2015-11-04 08:10:04","2015-11-04 08:10:04");
INSERT INTO schokolat_eventproductmatrix VALUES("128","38343","38362","0","1","1","2015-11-04 08:10:16","2015-11-04 08:10:16");
INSERT INTO schokolat_eventproductmatrix VALUES("129","38343","38363","0","1","1","2015-11-04 08:10:25","2015-11-04 08:10:25");
INSERT INTO schokolat_eventproductmatrix VALUES("130","38343","38364","0","1","1","2015-11-04 08:10:34","2015-11-04 08:10:34");
INSERT INTO schokolat_eventproductmatrix VALUES("132","38343","38365","0","1","1","2015-11-04 08:11:04","2015-11-04 08:11:04");
INSERT INTO schokolat_eventproductmatrix VALUES("133","38343","38366","0","1","1","2015-11-04 08:11:14","2015-11-04 08:11:14");
INSERT INTO schokolat_eventproductmatrix VALUES("134","38343","38367","0","1","1","2015-11-04 08:11:23","2015-11-04 08:11:23");
INSERT INTO schokolat_eventproductmatrix VALUES("135","38343","38369","0","1","1","2015-11-04 08:11:32","2015-11-04 08:11:32");
INSERT INTO schokolat_eventproductmatrix VALUES("136","38343","38371","0","1","1","2015-11-04 08:11:44","2015-11-04 08:11:44");
INSERT INTO schokolat_eventproductmatrix VALUES("137","38343","38370","0","1","1","2015-11-04 08:11:52","2015-11-04 08:11:52");
INSERT INTO schokolat_eventproductmatrix VALUES("138","38343","38372","0","1","1","2015-11-04 08:12:01","2015-11-04 08:12:01");
INSERT INTO schokolat_eventproductmatrix VALUES("139","38343","38373","0","1","1","2015-11-04 08:12:12","2015-11-04 08:12:12");
INSERT INTO schokolat_eventproductmatrix VALUES("140","38343","38374","0","1","1","2015-11-04 08:12:22","2015-11-04 08:12:22");
INSERT INTO schokolat_eventproductmatrix VALUES("141","38343","38375","0","1","1","2015-11-04 08:12:32","2015-11-04 08:12:32");
INSERT INTO schokolat_eventproductmatrix VALUES("142","38343","38376","0","1","1","2015-11-04 08:12:54","2015-11-04 08:12:54");
INSERT INTO schokolat_eventproductmatrix VALUES("145","38344","38345","0","1","1","2015-11-04 08:21:41","2015-11-04 08:21:41");
INSERT INTO schokolat_eventproductmatrix VALUES("146","38344","38346","0","1","1","2015-11-04 08:21:49","2015-11-04 08:21:49");
INSERT INTO schokolat_eventproductmatrix VALUES("147","38344","38348","0","1","1","2015-11-04 08:21:58","2015-11-04 08:21:58");
INSERT INTO schokolat_eventproductmatrix VALUES("148","38344","38349","0","1","1","2015-11-04 08:22:06","2015-11-04 08:22:06");
INSERT INTO schokolat_eventproductmatrix VALUES("149","38344","38350","0","1","1","2015-11-04 08:22:14","2015-11-04 08:22:14");
INSERT INTO schokolat_eventproductmatrix VALUES("150","38344","38351","0","1","1","2015-11-04 08:22:22","2015-11-04 08:22:22");
INSERT INTO schokolat_eventproductmatrix VALUES("151","38344","38352","0","1","1","2015-11-04 08:22:30","2015-11-04 08:22:30");
INSERT INTO schokolat_eventproductmatrix VALUES("152","38344","38353","0","1","1","2015-11-04 08:22:39","2015-11-04 08:22:39");
INSERT INTO schokolat_eventproductmatrix VALUES("153","38344","38354","0","1","1","2015-11-04 08:22:46","2015-11-04 08:22:46");
INSERT INTO schokolat_eventproductmatrix VALUES("154","38344","38355","0","1","1","2015-11-04 08:22:54","2015-11-04 08:22:54");
INSERT INTO schokolat_eventproductmatrix VALUES("155","38344","38356","0","1","1","2015-11-04 08:23:02","2015-11-04 08:23:02");
INSERT INTO schokolat_eventproductmatrix VALUES("156","38344","38357","0","1","1","2015-11-04 08:23:10","2015-11-04 08:23:10");
INSERT INTO schokolat_eventproductmatrix VALUES("157","38344","38358","0","1","1","2015-11-04 08:23:18","2015-11-04 08:23:18");
INSERT INTO schokolat_eventproductmatrix VALUES("158","38344","38359","0","1","1","2015-11-04 08:23:24","2015-11-04 08:23:24");
INSERT INTO schokolat_eventproductmatrix VALUES("159","38344","38360","0","1","1","2015-11-04 08:23:32","2015-11-04 08:23:32");
INSERT INTO schokolat_eventproductmatrix VALUES("160","38344","38361","0","1","1","2015-11-04 08:23:40","2015-11-04 08:23:40");
INSERT INTO schokolat_eventproductmatrix VALUES("161","38344","38362","0","1","1","2015-11-04 08:23:49","2015-11-04 08:23:49");
INSERT INTO schokolat_eventproductmatrix VALUES("162","38344","38363","0","1","1","2015-11-04 08:23:55","2015-11-04 08:23:55");
INSERT INTO schokolat_eventproductmatrix VALUES("163","38344","38364","0","1","1","2015-11-04 08:24:05","2015-11-04 08:24:05");
INSERT INTO schokolat_eventproductmatrix VALUES("165","38344","38365","0","1","1","2015-11-04 08:24:32","2015-11-04 08:24:32");
INSERT INTO schokolat_eventproductmatrix VALUES("166","38344","38366","0","1","1","2015-11-04 08:24:44","2015-11-04 08:24:44");
INSERT INTO schokolat_eventproductmatrix VALUES("167","38344","38367","0","1","1","2015-11-04 08:24:54","2015-11-04 08:24:54");
INSERT INTO schokolat_eventproductmatrix VALUES("168","38344","38369","0","1","1","2015-11-04 08:25:04","2015-11-04 08:25:04");
INSERT INTO schokolat_eventproductmatrix VALUES("169","38344","38371","0","1","1","2015-11-04 08:25:13","2015-11-04 08:25:13");
INSERT INTO schokolat_eventproductmatrix VALUES("170","38344","38370","0","1","1","2015-11-04 08:25:24","2015-11-04 08:25:24");
INSERT INTO schokolat_eventproductmatrix VALUES("171","38344","38372","0","1","1","2015-11-04 08:25:32","2015-11-04 08:25:32");
INSERT INTO schokolat_eventproductmatrix VALUES("172","38344","38373","0","1","1","2015-11-04 08:25:41","2015-11-04 08:25:41");
INSERT INTO schokolat_eventproductmatrix VALUES("173","38344","38374","0","1","1","2015-11-04 08:25:52","2015-11-04 08:25:52");
INSERT INTO schokolat_eventproductmatrix VALUES("174","38344","38375","0","1","1","2015-11-04 08:26:01","2015-11-04 08:26:01");
INSERT INTO schokolat_eventproductmatrix VALUES("175","38344","38376","0","1","1","2015-11-04 08:26:10","2015-11-04 08:26:10");
INSERT INTO schokolat_eventproductmatrix VALUES("176","38345","38345","0","1","1","2015-11-04 08:26:32","2015-11-04 08:26:32");
INSERT INTO schokolat_eventproductmatrix VALUES("177","38345","38346","0","1","1","2015-11-04 08:26:40","2015-11-04 08:26:40");
INSERT INTO schokolat_eventproductmatrix VALUES("178","38345","38348","0","1","1","2015-11-04 08:26:48","2015-11-04 08:26:48");
INSERT INTO schokolat_eventproductmatrix VALUES("179","38345","38349","0","1","1","2015-11-04 08:26:55","2015-11-04 08:26:55");
INSERT INTO schokolat_eventproductmatrix VALUES("180","38345","38350","0","1","1","2015-11-04 08:27:03","2015-11-04 08:27:03");
INSERT INTO schokolat_eventproductmatrix VALUES("181","38345","38351","0","1","1","2015-11-04 08:27:13","2015-11-04 08:27:13");
INSERT INTO schokolat_eventproductmatrix VALUES("182","38345","38352","0","1","1","2015-11-04 08:27:19","2015-11-04 08:27:19");
INSERT INTO schokolat_eventproductmatrix VALUES("183","38345","38353","0","1","1","2015-11-04 08:27:25","2015-11-04 08:27:25");
INSERT INTO schokolat_eventproductmatrix VALUES("184","38345","38354","0","1","1","2015-11-04 08:27:32","2015-11-04 08:27:32");
INSERT INTO schokolat_eventproductmatrix VALUES("185","38345","38355","0","1","1","2015-11-04 08:27:39","2015-11-04 08:27:39");
INSERT INTO schokolat_eventproductmatrix VALUES("186","38345","38356","0","1","1","2015-11-04 08:27:46","2015-11-04 08:27:46");
INSERT INTO schokolat_eventproductmatrix VALUES("187","38345","38357","0","1","1","2015-11-04 08:27:54","2015-11-04 08:27:54");
INSERT INTO schokolat_eventproductmatrix VALUES("188","38345","38358","0","1","1","2015-11-04 08:28:01","2015-11-04 08:28:01");
INSERT INTO schokolat_eventproductmatrix VALUES("189","38345","38359","0","1","1","2015-11-04 08:28:09","2015-11-04 08:28:09");
INSERT INTO schokolat_eventproductmatrix VALUES("190","38345","38360","0","1","1","2015-11-04 08:28:18","2015-11-04 08:28:18");
INSERT INTO schokolat_eventproductmatrix VALUES("191","38345","38361","0","1","1","2015-11-04 08:28:26","2015-11-04 08:28:26");
INSERT INTO schokolat_eventproductmatrix VALUES("192","38345","38362","0","1","1","2015-11-04 08:28:35","2015-11-04 08:28:35");
INSERT INTO schokolat_eventproductmatrix VALUES("193","38345","38363","0","1","1","2015-11-04 08:28:43","2015-11-04 08:28:43");
INSERT INTO schokolat_eventproductmatrix VALUES("194","38345","38364","0","1","1","2015-11-04 08:28:53","2015-11-04 08:28:53");
INSERT INTO schokolat_eventproductmatrix VALUES("195","38345","38365","0","1","1","2015-11-04 08:29:05","2015-11-04 08:29:05");
INSERT INTO schokolat_eventproductmatrix VALUES("196","38345","38366","0","1","1","2015-11-04 08:29:19","2015-11-04 08:29:19");
INSERT INTO schokolat_eventproductmatrix VALUES("197","38345","38367","0","1","1","2015-11-04 08:29:37","2015-11-04 08:29:37");
INSERT INTO schokolat_eventproductmatrix VALUES("198","38345","38369","0","1","1","2015-11-04 08:29:49","2015-11-04 08:29:49");
INSERT INTO schokolat_eventproductmatrix VALUES("199","38345","38371","0","1","1","2015-11-04 08:30:00","2015-11-04 08:30:00");
INSERT INTO schokolat_eventproductmatrix VALUES("200","38345","38370","0","1","1","2015-11-04 08:30:08","2015-11-04 08:30:08");
INSERT INTO schokolat_eventproductmatrix VALUES("201","38345","38372","0","1","1","2015-11-04 08:30:16","2015-11-04 08:30:16");
INSERT INTO schokolat_eventproductmatrix VALUES("202","38345","38373","0","1","1","2015-11-04 08:30:26","2015-11-04 08:30:26");
INSERT INTO schokolat_eventproductmatrix VALUES("203","38345","38374","0","1","1","2015-11-04 08:30:34","2015-11-04 08:30:34");
INSERT INTO schokolat_eventproductmatrix VALUES("204","38345","38375","0","1","1","2015-11-04 08:30:44","2015-11-04 08:30:44");
INSERT INTO schokolat_eventproductmatrix VALUES("205","38345","38376","0","1","1","2015-11-04 08:30:55","2015-11-04 08:30:55");
INSERT INTO schokolat_eventproductmatrix VALUES("206","38347","38346","0","1","1","2015-11-04 08:32:23","2015-11-04 09:34:09");
INSERT INTO schokolat_eventproductmatrix VALUES("207","38347","38348","0","1","1","2015-11-04 08:32:31","2015-11-04 09:34:19");
INSERT INTO schokolat_eventproductmatrix VALUES("208","38347","38349","0","1","1","2015-11-04 08:32:38","2015-11-04 08:32:38");
INSERT INTO schokolat_eventproductmatrix VALUES("209","38347","38350","0","1","1","2015-11-04 08:32:45","2015-11-04 08:32:45");
INSERT INTO schokolat_eventproductmatrix VALUES("210","38347","38351","0","1","1","2015-11-04 08:32:53","2015-11-04 08:32:53");
INSERT INTO schokolat_eventproductmatrix VALUES("212","38347","38352","0","1","1","2015-11-04 08:35:15","2015-11-04 08:35:15");
INSERT INTO schokolat_eventproductmatrix VALUES("213","38347","38353","0","1","1","2015-11-04 08:35:23","2015-11-04 08:35:23");
INSERT INTO schokolat_eventproductmatrix VALUES("214","38347","38354","0","1","1","2015-11-04 08:35:30","2015-11-04 08:35:30");
INSERT INTO schokolat_eventproductmatrix VALUES("215","38347","38355","0","1","1","2015-11-04 08:35:38","2015-11-04 08:35:38");
INSERT INTO schokolat_eventproductmatrix VALUES("216","38347","38356","0","1","1","2015-11-04 08:35:46","2015-11-04 08:35:46");
INSERT INTO schokolat_eventproductmatrix VALUES("217","38347","38357","0","1","1","2015-11-04 08:35:53","2015-11-04 08:35:53");
INSERT INTO schokolat_eventproductmatrix VALUES("218","38347","38358","0","1","1","2015-11-04 08:36:01","2015-11-04 08:36:01");
INSERT INTO schokolat_eventproductmatrix VALUES("219","38347","38359","0","1","1","2015-11-04 08:36:09","2015-11-04 08:36:09");
INSERT INTO schokolat_eventproductmatrix VALUES("220","38347","38360","0","1","1","2015-11-04 08:36:18","2015-11-04 08:36:18");
INSERT INTO schokolat_eventproductmatrix VALUES("222","38347","38361","0","1","1","2015-11-04 08:36:57","2015-11-04 08:36:57");
INSERT INTO schokolat_eventproductmatrix VALUES("223","38347","38362","0","1","1","2015-11-04 08:37:09","2015-11-04 08:37:09");
INSERT INTO schokolat_eventproductmatrix VALUES("224","38347","38363","0","1","1","2015-11-04 08:37:18","2015-11-04 08:37:18");
INSERT INTO schokolat_eventproductmatrix VALUES("225","38347","38364","0","1","1","2015-11-04 08:37:27","2015-11-04 08:37:27");
INSERT INTO schokolat_eventproductmatrix VALUES("226","38347","38365","0","1","1","2015-11-04 08:37:35","2015-11-04 08:37:35");
INSERT INTO schokolat_eventproductmatrix VALUES("227","38347","38366","0","1","1","2015-11-04 08:37:45","2015-11-04 08:37:45");
INSERT INTO schokolat_eventproductmatrix VALUES("228","38347","38367","0","1","1","2015-11-04 08:37:56","2015-11-04 08:37:56");
INSERT INTO schokolat_eventproductmatrix VALUES("229","38347","38369","0","1","1","2015-11-04 08:38:05","2015-11-04 08:38:05");
INSERT INTO schokolat_eventproductmatrix VALUES("230","38347","38371","0","1","1","2015-11-04 08:38:13","2015-11-04 08:38:13");
INSERT INTO schokolat_eventproductmatrix VALUES("231","38347","38370","0","1","1","2015-11-04 08:38:19","2015-11-04 08:38:19");
INSERT INTO schokolat_eventproductmatrix VALUES("232","38347","38372","0","1","1","2015-11-04 08:38:27","2015-11-04 08:38:27");
INSERT INTO schokolat_eventproductmatrix VALUES("233","38347","38373","0","1","1","2015-11-04 08:38:37","2015-11-04 08:38:37");
INSERT INTO schokolat_eventproductmatrix VALUES("234","38347","38374","0","1","1","2015-11-04 08:38:46","2015-11-04 08:38:46");
INSERT INTO schokolat_eventproductmatrix VALUES("235","38347","38375","0","1","1","2015-11-04 08:38:53","2015-11-04 08:38:53");
INSERT INTO schokolat_eventproductmatrix VALUES("236","38347","38376","0","1","1","2015-11-04 08:39:02","2015-11-04 08:39:02");
INSERT INTO schokolat_eventproductmatrix VALUES("237","38349","38345","0","1","1","2015-11-04 08:40:07","2015-11-04 08:40:07");
INSERT INTO schokolat_eventproductmatrix VALUES("238","38349","38346","0","1","1","2015-11-04 08:40:14","2015-11-04 08:40:14");
INSERT INTO schokolat_eventproductmatrix VALUES("239","38349","38348","0","1","1","2015-11-04 08:40:20","2015-11-04 08:40:20");
INSERT INTO schokolat_eventproductmatrix VALUES("240","38349","38349","0","1","1","2015-11-04 08:40:27","2015-11-04 08:40:27");
INSERT INTO schokolat_eventproductmatrix VALUES("241","38349","38350","0","1","1","2015-11-04 08:40:34","2015-11-04 08:40:34");
INSERT INTO schokolat_eventproductmatrix VALUES("242","38349","38351","0","1","1","2015-11-04 08:40:41","2015-11-04 08:40:41");
INSERT INTO schokolat_eventproductmatrix VALUES("243","38349","38352","0","1","1","2015-11-04 08:40:49","2015-11-04 08:40:49");
INSERT INTO schokolat_eventproductmatrix VALUES("244","38349","38353","0","1","1","2015-11-04 08:40:57","2015-11-04 08:40:57");
INSERT INTO schokolat_eventproductmatrix VALUES("245","38349","38354","0","1","1","2015-11-04 08:41:03","2015-11-04 08:41:03");
INSERT INTO schokolat_eventproductmatrix VALUES("246","38349","38355","0","1","1","2015-11-04 08:41:10","2015-11-04 08:41:10");
INSERT INTO schokolat_eventproductmatrix VALUES("247","38349","38356","0","1","1","2015-11-04 08:41:17","2015-11-04 08:41:17");
INSERT INTO schokolat_eventproductmatrix VALUES("248","38349","38357","0","1","1","2015-11-04 08:41:26","2015-11-04 08:41:26");
INSERT INTO schokolat_eventproductmatrix VALUES("249","38349","38358","0","1","1","2015-11-04 08:41:33","2015-11-04 08:41:33");
INSERT INTO schokolat_eventproductmatrix VALUES("250","38349","38359","0","1","1","2015-11-04 08:41:39","2015-11-04 08:41:39");
INSERT INTO schokolat_eventproductmatrix VALUES("251","38349","38360","0","1","1","2015-11-04 08:41:46","2015-11-04 08:41:46");
INSERT INTO schokolat_eventproductmatrix VALUES("252","38349","38361","0","1","1","2015-11-04 08:41:54","2015-11-04 08:41:54");
INSERT INTO schokolat_eventproductmatrix VALUES("253","38349","38362","0","1","1","2015-11-04 08:42:02","2015-11-04 08:42:02");
INSERT INTO schokolat_eventproductmatrix VALUES("254","38349","38363","0","1","1","2015-11-04 08:42:09","2015-11-04 08:42:09");
INSERT INTO schokolat_eventproductmatrix VALUES("255","38349","38364","0","1","1","2015-11-04 08:42:19","2015-11-04 08:42:19");
INSERT INTO schokolat_eventproductmatrix VALUES("256","38349","38365","0","1","1","2015-11-04 08:42:28","2015-11-04 08:42:28");
INSERT INTO schokolat_eventproductmatrix VALUES("257","38349","38366","0","1","1","2015-11-04 08:42:41","2015-11-04 08:42:41");
INSERT INTO schokolat_eventproductmatrix VALUES("258","38349","38367","0","1","1","2015-11-04 08:43:08","2015-11-04 08:43:08");
INSERT INTO schokolat_eventproductmatrix VALUES("259","38349","38369","0","1","1","2015-11-04 08:43:18","2015-11-04 08:43:18");
INSERT INTO schokolat_eventproductmatrix VALUES("260","38349","38371","0","1","1","2015-11-04 08:43:26","2015-11-04 08:43:26");
INSERT INTO schokolat_eventproductmatrix VALUES("261","38349","38370","0","1","1","2015-11-04 08:43:34","2015-11-04 08:43:34");
INSERT INTO schokolat_eventproductmatrix VALUES("262","38349","38372","0","1","1","2015-11-04 08:43:44","2015-11-04 08:43:44");
INSERT INTO schokolat_eventproductmatrix VALUES("263","38349","38373","0","1","1","2015-11-04 08:43:52","2015-11-04 08:43:52");
INSERT INTO schokolat_eventproductmatrix VALUES("264","38349","38374","0","1","1","2015-11-04 08:44:01","2015-11-04 08:44:01");
INSERT INTO schokolat_eventproductmatrix VALUES("265","38349","38375","0","1","1","2015-11-04 08:44:12","2015-11-04 08:44:12");
INSERT INTO schokolat_eventproductmatrix VALUES("266","38349","38376","0","1","1","2015-11-04 08:44:22","2015-11-04 08:44:22");
INSERT INTO schokolat_eventproductmatrix VALUES("267","38350","38345","0","1","1","2015-11-04 08:44:42","2015-11-04 08:44:42");
INSERT INTO schokolat_eventproductmatrix VALUES("268","38350","38346","0","1","1","2015-11-04 08:44:49","2015-11-04 08:44:49");
INSERT INTO schokolat_eventproductmatrix VALUES("269","38350","38348","0","1","1","2015-11-04 08:44:56","2015-11-04 08:44:56");
INSERT INTO schokolat_eventproductmatrix VALUES("270","38350","38349","0","1","1","2015-11-04 08:45:03","2015-11-04 08:45:03");
INSERT INTO schokolat_eventproductmatrix VALUES("271","38350","38350","0","1","1","2015-11-04 08:45:14","2015-11-04 08:45:14");
INSERT INTO schokolat_eventproductmatrix VALUES("272","38350","38351","0","1","1","2015-11-04 08:45:21","2015-11-04 08:45:21");
INSERT INTO schokolat_eventproductmatrix VALUES("273","38350","38352","0","1","1","2015-11-04 08:45:27","2015-11-04 08:45:27");
INSERT INTO schokolat_eventproductmatrix VALUES("274","38350","38353","0","1","1","2015-11-04 08:45:33","2015-11-04 08:45:33");
INSERT INTO schokolat_eventproductmatrix VALUES("275","38350","38354","0","1","1","2015-11-04 08:45:40","2015-11-04 08:45:40");
INSERT INTO schokolat_eventproductmatrix VALUES("276","38350","38355","0","1","1","2015-11-04 08:45:46","2015-11-04 08:45:46");
INSERT INTO schokolat_eventproductmatrix VALUES("277","38350","38356","0","1","1","2015-11-04 08:45:54","2015-11-04 08:45:54");
INSERT INTO schokolat_eventproductmatrix VALUES("278","38350","38357","0","1","1","2015-11-04 08:46:03","2015-11-04 08:46:03");
INSERT INTO schokolat_eventproductmatrix VALUES("279","38350","38358","0","1","1","2015-11-04 08:46:09","2015-11-04 08:46:09");
INSERT INTO schokolat_eventproductmatrix VALUES("280","38350","38359","0","1","1","2015-11-04 08:46:17","2015-11-04 08:46:17");
INSERT INTO schokolat_eventproductmatrix VALUES("281","38350","38360","0","1","1","2015-11-04 08:46:26","2015-11-04 08:46:26");
INSERT INTO schokolat_eventproductmatrix VALUES("282","38350","38361","0","1","1","2015-11-04 08:46:33","2015-11-04 08:46:33");
INSERT INTO schokolat_eventproductmatrix VALUES("283","38350","38362","0","1","1","2015-11-04 08:46:45","2015-11-04 08:46:45");
INSERT INTO schokolat_eventproductmatrix VALUES("284","38350","38363","0","1","1","2015-11-04 08:46:52","2015-11-04 08:46:52");
INSERT INTO schokolat_eventproductmatrix VALUES("285","38350","38364","0","1","1","2015-11-04 08:47:00","2015-11-04 08:47:00");
INSERT INTO schokolat_eventproductmatrix VALUES("286","38350","38365","0","1","1","2015-11-04 08:47:14","2015-11-04 08:47:14");
INSERT INTO schokolat_eventproductmatrix VALUES("287","38350","38366","0","1","1","2015-11-04 08:47:22","2015-11-04 08:47:22");
INSERT INTO schokolat_eventproductmatrix VALUES("288","38350","38367","0","1","1","2015-11-04 08:47:31","2015-11-04 08:47:31");
INSERT INTO schokolat_eventproductmatrix VALUES("289","38350","38369","0","1","1","2015-11-04 08:47:39","2015-11-04 08:47:39");
INSERT INTO schokolat_eventproductmatrix VALUES("290","38350","38371","0","1","1","2015-11-04 08:47:47","2015-11-04 08:47:47");
INSERT INTO schokolat_eventproductmatrix VALUES("291","38350","38370","0","1","1","2015-11-04 08:47:57","2015-11-04 08:47:57");
INSERT INTO schokolat_eventproductmatrix VALUES("292","38350","38372","0","1","1","2015-11-04 08:48:07","2015-11-04 08:48:07");
INSERT INTO schokolat_eventproductmatrix VALUES("293","38350","38373","0","1","1","2015-11-04 08:48:16","2015-11-04 08:48:16");
INSERT INTO schokolat_eventproductmatrix VALUES("294","38350","38374","0","1","1","2015-11-04 08:48:24","2015-11-04 08:48:24");
INSERT INTO schokolat_eventproductmatrix VALUES("295","38350","38375","0","1","1","2015-11-04 08:48:33","2015-11-04 08:48:33");
INSERT INTO schokolat_eventproductmatrix VALUES("296","38350","38376","0","1","1","2015-11-04 08:48:42","2015-11-04 08:48:42");



DROP TABLE schokolat_eventtransaction;

CREATE TABLE `schokolat_eventtransaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `eventdate` date DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `metacreateduserid` int(11) DEFAULT NULL,
  `metamodifieduserid` int(11) DEFAULT NULL,
  `metacreateddate` datetime DEFAULT NULL,
  `metamodifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `eventid` (`eventid`),
  KEY `productid` (`productid`),
  KEY `eventid_2` (`eventid`,`productid`,`eventdate`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

INSERT INTO schokolat_eventtransaction VALUES("1","38348","38374","2015-11-05","S","1","","","","");
INSERT INTO schokolat_eventtransaction VALUES("2","38348","38374","2015-11-05","S","1","","","","");
INSERT INTO schokolat_eventtransaction VALUES("3","38348","38356","2015-11-05","S","1","","","","");
INSERT INTO schokolat_eventtransaction VALUES("4","38348","38355","2015-11-05","S","1","","","","");
INSERT INTO schokolat_eventtransaction VALUES("5","38348","38369","2015-11-05","S","1","","","","");
INSERT INTO schokolat_eventtransaction VALUES("6","38348","38369","2015-11-05","S","1","","","","");
INSERT INTO schokolat_eventtransaction VALUES("7","38348","38371","2015-11-05","S","1","","","","");
INSERT INTO schokolat_eventtransaction VALUES("8","38348","38374","2015-11-05","S","1","","","","");
INSERT INTO schokolat_eventtransaction VALUES("9","38348","38345","2015-11-05","S","1","","","","");
INSERT INTO schokolat_eventtransaction VALUES("10","38348","38372","2015-11-05","S","1","","","","");
INSERT INTO schokolat_eventtransaction VALUES("11","38348","38359","2015-11-05","S","1","","","","");
INSERT INTO schokolat_eventtransaction VALUES("12","38348","38374","2015-11-05","S","1","","","","");
INSERT INTO schokolat_eventtransaction VALUES("13","38348","38356","2015-11-05","S","1","","","","");
INSERT INTO schokolat_eventtransaction VALUES("14","38348","38371","2015-11-05","S","1","","","","");
INSERT INTO schokolat_eventtransaction VALUES("15","38348","38372","2015-11-05","S","1","","","","");
INSERT INTO schokolat_eventtransaction VALUES("16","38348","38348","2015-11-05","S","1","","","","");
INSERT INTO schokolat_eventtransaction VALUES("17","38348","38372","2015-11-05","S","1","","","","");
INSERT INTO schokolat_eventtransaction VALUES("18","38348","38376","2015-11-05","S","1","","","","");
INSERT INTO schokolat_eventtransaction VALUES("19","38348","38373","2015-11-05","S","1","","","","");
INSERT INTO schokolat_eventtransaction VALUES("20","38348","38352","2015-11-05","S","1","","","","");
INSERT INTO schokolat_eventtransaction VALUES("21","38348","38352","2015-11-05","S","-1","","","","");
INSERT INTO schokolat_eventtransaction VALUES("24","38348","38374","2015-11-05","S","1","","","","");
INSERT INTO schokolat_eventtransaction VALUES("25","38348","38374","2015-11-05","S","1","","","","");
INSERT INTO schokolat_eventtransaction VALUES("26","38348","38372","2015-11-05","S","1","","","","");
INSERT INTO schokolat_eventtransaction VALUES("27","38348","38372","2015-11-05","S","1","","","","");
INSERT INTO schokolat_eventtransaction VALUES("28","38348","38373","2015-11-05","S","1","","","","");
INSERT INTO schokolat_eventtransaction VALUES("29","38348","38372","2015-11-05","S","1","","","","");
INSERT INTO schokolat_eventtransaction VALUES("30","38348","38359","2015-11-05","S","1","","","","");
INSERT INTO schokolat_eventtransaction VALUES("31","38348","38365","2015-11-05","S","1","","","","");



DROP TABLE schokolat_members;

CREATE TABLE `schokolat_members` (
  `member_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `fullname` varchar(150) DEFAULT NULL,
  `login` varchar(100) NOT NULL DEFAULT '',
  `passwd` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(60) DEFAULT NULL,
  `title` varchar(60) DEFAULT NULL,
  `imageid` int(11) DEFAULT NULL,
  `holidayentitlement` int(11) DEFAULT NULL,
  `clientid` int(11) DEFAULT NULL,
  `description` text,
  `lastaccessdate` datetime DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `postcode` varchar(8) DEFAULT NULL,
  `systemuser` varchar(1) DEFAULT NULL,
  `accepted` varchar(1) DEFAULT NULL,
  `paymentmethod` varchar(1) DEFAULT NULL,
  `website` varchar(200) DEFAULT NULL,
  `guid` varchar(100) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `landline` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `dateofbirth` datetime NOT NULL,
  `notes` text NOT NULL,
  `address` text NOT NULL,
  `billingaddress` text NOT NULL,
  `paperfreebillingaddress` text NOT NULL,
  `loginauditid` int(11) NOT NULL,
  `postcode_lat` float NOT NULL,
  `postcode_lng` float NOT NULL,
  `metacreateddate` datetime NOT NULL,
  `metacreateduserid` int(11) NOT NULL,
  `metamodifieddate` datetime NOT NULL,
  `metamodifieduserid` int(11) NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=266 DEFAULT CHARSET=latin1;

INSERT INTO schokolat_members VALUES("256","Colin","Blackman","Colin Blackman","colin","87e2763c408e3dc4adc3e4177566b3b2","colin@aperfectpocket.co.uk","","","28","",0x,"","Y","","","Y","","","55dec08561350","07798753166","","","0000-00-00 00:00:00",0x,0x,0x,0x,"1214","0","0","2015-08-27 07:47:17","1","2015-10-23 12:06:43","1");
INSERT INTO schokolat_members VALUES("265","Stewart","Maxwell","Stewart Maxwell","stewart","e00cf25ad42683b3df678c61f42c6bda","smaxwell@schokolat.co.uk","","","","",0x,"","Y","","","Y","","","563a23b956ca9","admin","","","0000-00-00 00:00:00",0x,0x,0x,0x,"0","0","0","2015-11-04 10:26:49","1","2015-11-04 10:26:49","1");
INSERT INTO schokolat_members VALUES("264","Stewart","Maxwell","Stewart Maxwell","stewart","e00cf25ad42683b3df678c61f42c6bda","smaxwell@schokolat.co.uk","","","","",0x,"","Y","","","Y","","","563a23b67b2ac","admin","","","0000-00-00 00:00:00",0x,0x,0x,0x,"0","0","0","2015-11-04 10:26:46","1","2015-11-04 10:26:46","1");
INSERT INTO schokolat_members VALUES("1","System","Manager","System Manager","admin","21232f297a57a5a743894a0e4a801fc3","kevin.hilton@prodigyworks.co.uk","","","28","",0x,"2015-11-05 12:42:44","Y","","","Y","","","55debe838f30f","07913901614","","","0000-00-00 00:00:00",0x,0x,0x,0x,"1464","0","0","2015-08-27 07:38:43","1","2015-11-05 12:42:44","1");
INSERT INTO schokolat_members VALUES("261","Schokolat","Mobile","Schokolat Mobile","schokolat","adc4fe35ee7d59fbcb8d3f409468d2f0","colin@aperfectpocket.co.uk","","","1","",0x,"2015-10-28 09:30:46","Y","","","Y","","","5630cd70db716","1","","","0000-00-00 00:00:00",0x,0x,0x,0x,"1431","0","0","2015-10-28 09:28:16","1","2015-11-05 04:46:08","261");
INSERT INTO schokolat_members VALUES("263","Ian","Glover","Ian Glover","ian","c84258e9c39059a89ab77d846ddab909","iglover@schokolat.co.uk","","","","",0x,"","Y","","","Y","","","563a234c3ebe1","admin","","","0000-00-00 00:00:00",0x,0x,0x,0x,"0","0","0","2015-11-04 10:25:00","1","2015-11-04 10:25:00","1");



DROP TABLE schokolat_pagenavigation;

CREATE TABLE `schokolat_pagenavigation` (
  `pagenavigationid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pageid` int(11) NOT NULL,
  `childpageid` int(11) NOT NULL,
  `sequence` int(11) NOT NULL,
  `pagetype` varchar(1) DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `divider` int(11) DEFAULT NULL,
  `target` varchar(50) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `metacreateddate` datetime NOT NULL,
  `metacreateduserid` int(11) NOT NULL,
  `metamodifieddate` datetime NOT NULL,
  `metamodifieduserid` int(11) NOT NULL,
  PRIMARY KEY (`pagenavigationid`),
  UNIQUE KEY `ix_pagenav` (`pageid`,`childpageid`,`sequence`)
) ENGINE=MyISAM AUTO_INCREMENT=283 DEFAULT CHARSET=latin1;

INSERT INTO schokolat_pagenavigation VALUES("1","1","1","1","P","","","","red","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("2","1","8","600","M","Administration","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("3","1","11","321","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("118","1","7167","2700","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("9","1","1271","2000","M","Configuration","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("151","7195","7201","300","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("119","1","7168","2500","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("19","1","3000","11","P","","","","blue","0000-00-00 00:00:00","0","2014-05-13 17:27:27","1");
INSERT INTO schokolat_pagenavigation VALUES("150","7196","7200","200","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("149","7196","7199","100","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("22","1","130","2","M","Data Management","","","","0000-00-00 00:00:00","0","2014-05-13 17:27:27","1");
INSERT INTO schokolat_pagenavigation VALUES("148","7195","7198","200","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("147","7195","7197","100","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("132","7180","7182","200","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("133","3000","7183","1600","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("134","3000","7184","300","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("135","7174","7185","300","M","Graphs","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("136","7174","7186","500","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("137","7174","7187","400","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("138","7174","7188","600","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("139","3000","7189","800","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("140","3000","7190","1700","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("141","1","7191","3400","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("142","1","7192","3500","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("143","1","7193","200","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("144","1","7194","3600","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("145","1","7195","3700","P","","","","brown","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("146","1","7196","3800","P","","","","cyan","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("61","1","4","2100","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("62","1","7105","500","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("63","1","7107","500","H","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("131","7180","7181","100","M","Members","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("130","1","7180","3300","P","Members","","","pink","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("129","1","7179","3100","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("128","3000","7178","1500","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("127","7174","7177","200","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("110","3000","7159","500","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("111","7213","7160","300","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("112","3000","7161","600","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("113","1","7162","2200","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("114","1","7163","2300","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("115","1","7164","2400","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("116","7213","7165","400","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("117","3000","7166","700","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("109","3000","7158","100","M","Data Management","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("125","1","7174","3200","P","","","","orange","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("126","7174","7176","100","M","Bookings","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("124","1","7173","3000","P","","","","yellow","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("123","1","7172","2600","P","","","","green","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("122","3000","7171","1200","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("121","3000","7170","1000","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("120","3000","7169","900","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("152","1","7202","3900","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("153","1","7203","4100","L","","","","","0000-00-00 00:00:00","0","2014-02-17 10:03:42","1");
INSERT INTO schokolat_pagenavigation VALUES("154","1","7204","4200","L","","","","","0000-00-00 00:00:00","0","2014-02-17 10:03:38","1");
INSERT INTO schokolat_pagenavigation VALUES("155","1","7205","4300","L","","","","","0000-00-00 00:00:00","0","2014-02-17 10:03:35","1");
INSERT INTO schokolat_pagenavigation VALUES("156","1","7206","4500","L","","","","","0000-00-00 00:00:00","0","2014-02-17 10:03:27","1");
INSERT INTO schokolat_pagenavigation VALUES("157","3000","7207","2200","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("158","3000","7208","2300","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("159","1","7209","4400","P","","","","","0000-00-00 00:00:00","0","2014-02-17 10:03:30","1");
INSERT INTO schokolat_pagenavigation VALUES("160","3000","7210","1400","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("161","3000","7211","1800","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("162","7174","7212","700","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("163","1","7213","4600","P","","","","","0000-00-00 00:00:00","0","2014-02-17 10:03:25","1");
INSERT INTO schokolat_pagenavigation VALUES("164","7213","7214","200","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("165","7213","7215","200","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("166","7213","7216","400","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("167","7213","7217","100","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("168","3000","7218","2400","M","Reports","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("169","3000","7219","2000","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("170","3000","7220","2500","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("171","3000","7221","1900","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("172","1","7222","4700","P","","","","","0000-00-00 00:00:00","0","2014-02-17 10:03:18","1");
INSERT INTO schokolat_pagenavigation VALUES("173","7222","7223","100","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("174","3000","7224","2600","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("175","3000","7225","2100","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("176","1","7226","4800","P","","","","","0000-00-00 00:00:00","0","2014-02-17 10:03:15","1");
INSERT INTO schokolat_pagenavigation VALUES("177","3000","7227","2700","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("178","3000","7228","2800","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("179","1","7229","4900","P","","","","","0000-00-00 00:00:00","0","2014-02-17 10:03:11","1");
INSERT INTO schokolat_pagenavigation VALUES("180","7229","7230","100","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("181","3000","7231","1300","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("182","3000","7232","1100","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pagenavigation VALUES("183","1","7233","4000","M","","","","","2014-02-17 10:03:08","1","2014-02-17 10:03:42","1");
INSERT INTO schokolat_pagenavigation VALUES("184","1","7234","5000","M","","","","","2014-02-20 15:20:59","1","2014-02-20 15:20:59","1");
INSERT INTO schokolat_pagenavigation VALUES("185","3000","7235","2900","M","","","","","2014-02-20 18:19:22","1","2014-02-20 18:19:22","1");
INSERT INTO schokolat_pagenavigation VALUES("186","7174","7236","800","M","","","","","2014-03-02 11:04:46","1","2014-03-02 11:04:46","1");
INSERT INTO schokolat_pagenavigation VALUES("187","7174","7237","900","M","","","","","2014-03-13 15:43:57","1","2014-03-13 15:43:57","1");
INSERT INTO schokolat_pagenavigation VALUES("188","3000","7238","3000","L","","","","","2014-03-24 10:24:22","1","2014-03-24 10:24:22","1");
INSERT INTO schokolat_pagenavigation VALUES("189","7174","7239","1000","M","","","","","2014-09-03 12:48:15","1","2014-09-03 12:48:15","1");
INSERT INTO schokolat_pagenavigation VALUES("190","1","7240","5100","P","","","","","2014-10-09 19:35:09","1","2014-10-09 19:35:09","1");
INSERT INTO schokolat_pagenavigation VALUES("191","1","7241","5200","P","","","","","2014-10-09 19:38:01","1","2014-10-09 19:38:01","1");
INSERT INTO schokolat_pagenavigation VALUES("192","7240","7242","100","M","Holidays","","","","2014-10-09 19:42:05","1","2014-10-09 19:42:05","1");
INSERT INTO schokolat_pagenavigation VALUES("193","7240","7243","200","M","","","","","2014-10-09 19:46:32","1","2014-10-09 19:46:32","1");
INSERT INTO schokolat_pagenavigation VALUES("194","7240","7244","300","M","","","","","2014-10-09 19:48:06","1","2014-10-09 19:48:06","1");
INSERT INTO schokolat_pagenavigation VALUES("195","7240","7245","400","M","Reports","","","","2014-10-09 19:49:14","1","2014-10-09 19:49:14","1");
INSERT INTO schokolat_pagenavigation VALUES("196","7240","7246","500","M","","","","","2014-10-09 19:50:11","1","2014-10-09 19:50:11","1");
INSERT INTO schokolat_pagenavigation VALUES("197","7240","7247","600","M","","","","","2014-10-09 19:50:51","1","2014-10-09 19:50:51","1");
INSERT INTO schokolat_pagenavigation VALUES("198","7240","7248","700","M","","","","","2014-10-09 19:51:43","1","2014-10-09 19:51:43","1");
INSERT INTO schokolat_pagenavigation VALUES("199","7240","7249","800","M","Calendar","","","","2014-10-09 19:52:46","1","2014-10-09 19:52:46","1");
INSERT INTO schokolat_pagenavigation VALUES("200","7240","7250","900","M","","","","","2014-10-09 19:53:34","1","2014-10-09 19:53:34","1");
INSERT INTO schokolat_pagenavigation VALUES("201","7240","7251","1000","L","","","","","2014-10-10 22:34:36","1","2014-10-10 22:34:36","1");
INSERT INTO schokolat_pagenavigation VALUES("202","7241","7252","100","M","Absence","","","","2014-10-11 13:20:04","1","2014-10-11 13:20:04","1");
INSERT INTO schokolat_pagenavigation VALUES("203","7241","7253","200","M","","","","","2014-10-11 13:22:06","1","2014-10-11 13:22:06","1");
INSERT INTO schokolat_pagenavigation VALUES("204","7241","7254","300","M","Reports","","","","2014-10-11 13:22:35","1","2014-10-11 13:22:35","1");
INSERT INTO schokolat_pagenavigation VALUES("205","7241","7255","400","M","","","","","2014-10-11 13:23:27","1","2014-10-11 13:23:27","1");
INSERT INTO schokolat_pagenavigation VALUES("206","7241","7256","500","M","Calendar","","","","2014-10-11 13:24:38","1","2014-10-11 13:24:38","1");
INSERT INTO schokolat_pagenavigation VALUES("207","7241","7257","600","M","","","","","2014-10-11 13:25:28","1","2014-10-11 13:25:28","1");
INSERT INTO schokolat_pagenavigation VALUES("208","7241","7258","700","L","","","","","2014-10-11 13:26:16","1","2014-10-11 13:26:16","1");
INSERT INTO schokolat_pagenavigation VALUES("209","7174","7259","1300","M","Workflow","","","","2014-10-11 14:22:02","1","2014-12-21 20:42:59","1");
INSERT INTO schokolat_pagenavigation VALUES("210","7174","7260","1100","L","","","","","2014-10-26 21:29:58","1","2014-12-19 12:10:02","1");
INSERT INTO schokolat_pagenavigation VALUES("211","3000","7261","3100","M","Booking Administration","","","","2014-11-30 15:22:04","1","2014-11-30 15:22:04","1");
INSERT INTO schokolat_pagenavigation VALUES("212","3000","7262","3200","M","","","","","2014-12-07 18:44:25","1","2014-12-07 18:44:25","1");
INSERT INTO schokolat_pagenavigation VALUES("213","3000","7263","3300","M","","","","","2014-12-07 19:04:33","1","2014-12-07 19:04:33","1");
INSERT INTO schokolat_pagenavigation VALUES("214","3000","7264","3400","M","","","","","2014-12-07 19:13:02","1","2014-12-07 19:13:02","1");
INSERT INTO schokolat_pagenavigation VALUES("215","3000","7265","3500","M","","","","","2014-12-09 20:13:19","1","2014-12-09 20:13:19","1");
INSERT INTO schokolat_pagenavigation VALUES("216","3000","7266","3600","M","","","","","2014-12-18 14:12:18","1","2014-12-18 14:12:18","1");
INSERT INTO schokolat_pagenavigation VALUES("217","7174","7267","1400","M","","","","","2014-12-18 15:42:25","1","2014-12-21 20:42:56","1");
INSERT INTO schokolat_pagenavigation VALUES("218","7174","7268","1500","M","","","","","2014-12-19 12:13:51","1","2014-12-21 20:42:53","1");
INSERT INTO schokolat_pagenavigation VALUES("219","7174","7269","1600","M","","","","","2014-12-19 12:14:29","1","2014-12-21 20:42:49","1");
INSERT INTO schokolat_pagenavigation VALUES("220","7174","7270","1700","M","Completed","","","","2014-12-19 12:17:00","1","2014-12-21 20:42:47","1");
INSERT INTO schokolat_pagenavigation VALUES("221","7174","7271","1800","M","","","","","2014-12-19 12:19:12","1","2014-12-21 20:42:45","1");
INSERT INTO schokolat_pagenavigation VALUES("222","7174","7272","1200","M","","","","","2014-12-19 12:19:30","1","2014-12-21 20:42:59","1");
INSERT INTO schokolat_pagenavigation VALUES("223","3000","7273","3700","M","","","","","2014-12-21 13:20:56","1","2014-12-21 13:20:56","1");
INSERT INTO schokolat_pagenavigation VALUES("224","3000","7274","3800","M","","","","","2014-12-21 20:55:13","1","2014-12-21 20:55:13","1");
INSERT INTO schokolat_pagenavigation VALUES("225","3000","7275","3900","M","","","","","2014-12-21 20:55:42","1","2014-12-21 20:55:42","1");
INSERT INTO schokolat_pagenavigation VALUES("226","1","7276","5300","P","","","","","2014-12-21 21:36:55","1","2014-12-21 21:36:55","1");
INSERT INTO schokolat_pagenavigation VALUES("227","7276","7277","100","M","Data","","","","2014-12-21 21:39:17","1","2014-12-21 21:39:17","1");
INSERT INTO schokolat_pagenavigation VALUES("228","7276","7278","200","M","","","","","2014-12-21 21:39:46","1","2014-12-21 21:39:46","1");
INSERT INTO schokolat_pagenavigation VALUES("229","1","7279","5400","P","","","","","2014-12-22 22:08:35","1","2014-12-22 22:08:35","1");
INSERT INTO schokolat_pagenavigation VALUES("230","1","7280","5500","P","","","","","2014-12-22 22:08:51","1","2014-12-22 22:08:51","1");
INSERT INTO schokolat_pagenavigation VALUES("231","7279","7281","100","M","","","","","2014-12-22 22:14:49","1","2014-12-22 22:14:49","1");
INSERT INTO schokolat_pagenavigation VALUES("232","7279","7282","200","M","","","","","2014-12-22 22:15:02","1","2014-12-22 22:15:02","1");
INSERT INTO schokolat_pagenavigation VALUES("233","7279","7283","300","M","","","","","2014-12-22 22:15:30","1","2014-12-22 22:15:30","1");
INSERT INTO schokolat_pagenavigation VALUES("234","7280","7284","100","M","","","","","2014-12-22 22:19:19","1","2014-12-22 22:19:19","1");
INSERT INTO schokolat_pagenavigation VALUES("235","7280","7285","200","M","","","","","2014-12-22 22:20:53","1","2014-12-22 22:20:53","1");
INSERT INTO schokolat_pagenavigation VALUES("236","7280","7286","300","M","","","","","2014-12-22 22:21:41","1","2014-12-22 22:21:41","1");
INSERT INTO schokolat_pagenavigation VALUES("237","7280","7287","400","M","","","","","2014-12-22 22:22:37","1","2014-12-22 22:22:37","1");
INSERT INTO schokolat_pagenavigation VALUES("238","1","7288","6100","P","","","","","2014-12-23 19:46:42","1","2015-09-22 17:01:30","1");
INSERT INTO schokolat_pagenavigation VALUES("239","7279","7289","400","M","","","","","2015-01-02 12:57:48","1","2015-01-02 12:57:48","1");
INSERT INTO schokolat_pagenavigation VALUES("240","7279","7290","500","L","","","","","2015-01-02 12:58:00","1","2015-01-02 12:58:00","1");
INSERT INTO schokolat_pagenavigation VALUES("241","7280","7291","500","M","","","","","2015-01-10 21:56:37","1","2015-01-10 21:56:37","1");
INSERT INTO schokolat_pagenavigation VALUES("242","7288","7292","600","M","Reports","","","","2015-01-11 00:09:58","1","2015-01-11 00:09:58","1");
INSERT INTO schokolat_pagenavigation VALUES("243","7288","7293","700","M","","","","","2015-01-22 19:05:10","1","2015-01-22 19:05:10","1");
INSERT INTO schokolat_pagenavigation VALUES("244","7288","7294","800","M","","","","","2015-06-09 21:11:50","1","2015-06-09 21:11:50","1");
INSERT INTO schokolat_pagenavigation VALUES("245","7288","7295","900","L","","","","","2015-06-11 18:33:01","1","2015-06-11 18:33:01","1");
INSERT INTO schokolat_pagenavigation VALUES("246","7288","7296","1000","L","","","","","2015-06-12 16:26:13","1","2015-06-12 16:26:13","1");
INSERT INTO schokolat_pagenavigation VALUES("247","1","7297","5600","L","","","","","2015-06-12 18:37:09","1","2015-08-09 20:10:39","1");
INSERT INTO schokolat_pagenavigation VALUES("248","7288","7298","1100","M","","","","","2015-06-13 16:05:20","1","2015-06-13 16:05:20","1");
INSERT INTO schokolat_pagenavigation VALUES("249","7280","7299","600","L","","","","","2015-06-15 19:31:40","1","2015-06-15 19:31:40","1");
INSERT INTO schokolat_pagenavigation VALUES("250","7280","7300","700","L","","","","","2015-06-15 19:31:59","1","2015-06-15 19:31:59","1");
INSERT INTO schokolat_pagenavigation VALUES("251","1","7301","5700","L","","","","","2015-06-15 21:25:51","1","2015-08-09 20:10:40","1");
INSERT INTO schokolat_pagenavigation VALUES("252","1","7302","5800","L","","","","","2015-06-15 21:26:08","1","2015-09-22 17:01:26","1");
INSERT INTO schokolat_pagenavigation VALUES("253","7280","7303","800","L","","","","","2015-06-28 16:00:14","1","2015-06-28 16:00:14","1");
INSERT INTO schokolat_pagenavigation VALUES("263","7288","7312","1700","L","","","","","2015-07-13 10:10:15","1","2015-07-20 17:34:10","1");
INSERT INTO schokolat_pagenavigation VALUES("255","1","7304","600","P","Reports","","","","2015-01-11 00:09:58","1","2015-01-11 00:09:58","1");
INSERT INTO schokolat_pagenavigation VALUES("256","1","7305","6400","P","","","","","2015-07-02 21:26:32","1","2015-09-22 17:01:32","1");
INSERT INTO schokolat_pagenavigation VALUES("257","7305","7306","100","M","","","","","2015-07-03 19:45:00","1","2015-07-03 19:45:00","1");
INSERT INTO schokolat_pagenavigation VALUES("258","7288","7307","1200","L","","","","","2015-07-03 19:45:35","1","2015-07-03 19:45:35","1");
INSERT INTO schokolat_pagenavigation VALUES("259","7288","7308","1600","L","","","","","2015-07-03 20:12:35","1","2015-07-20 17:34:12","1");
INSERT INTO schokolat_pagenavigation VALUES("260","7288","7309","1300","M","","","","","2015-07-06 18:25:32","1","2015-07-06 18:25:36","1");
INSERT INTO schokolat_pagenavigation VALUES("261","7305","7310","200","M","","","","","2015-07-06 18:27:17","1","2015-07-06 18:27:17","1");
INSERT INTO schokolat_pagenavigation VALUES("262","7305","7311","300","M","","","","","2015-07-06 18:27:46","1","2015-07-06 18:27:46","1");
INSERT INTO schokolat_pagenavigation VALUES("264","7288","7313","1500","M","","","","","2015-07-20 17:33:14","1","2015-07-20 17:34:14","1");
INSERT INTO schokolat_pagenavigation VALUES("265","7288","7314","1400","M","","","","","2015-07-20 17:34:05","1","2015-07-20 17:34:14","1");
INSERT INTO schokolat_pagenavigation VALUES("266","1","7315","6500","L","","","","","2015-08-04 20:37:20","1","2015-09-22 17:01:24","1");
INSERT INTO schokolat_pagenavigation VALUES("267","1","7316","6200","L","","","","","2015-08-09 20:09:23","1","2015-09-22 17:01:30","1");
INSERT INTO schokolat_pagenavigation VALUES("268","1","7317","6600","P","","","","","2015-08-24 15:51:19","1","2015-09-22 17:01:21","1");
INSERT INTO schokolat_pagenavigation VALUES("269","7317","7318","100","M","","","","","2015-08-24 15:53:18","1","2015-08-24 15:53:18","1");
INSERT INTO schokolat_pagenavigation VALUES("270","7317","7319","200","L","","","","","2015-08-24 15:53:41","1","2015-08-24 15:53:41","1");
INSERT INTO schokolat_pagenavigation VALUES("271","1","7320","5900","P","","","","","2015-08-27 15:14:30","1","2015-09-22 17:01:28","1");
INSERT INTO schokolat_pagenavigation VALUES("272","7288","7321","1800","M","","","","","2015-09-01 17:38:55","1","2015-09-01 17:38:55","1");
INSERT INTO schokolat_pagenavigation VALUES("273","1","7322","5800","P","","","","","2015-09-22 17:00:52","1","2015-09-22 17:01:32","1");
INSERT INTO schokolat_pagenavigation VALUES("274","7322","7323","100","L","","","","","2015-09-22 17:39:40","1","2015-09-22 17:39:40","1");
INSERT INTO schokolat_pagenavigation VALUES("275","1","7324","6700","P","","","","","2015-09-25 12:44:26","1","2015-09-25 12:44:26","1");
INSERT INTO schokolat_pagenavigation VALUES("276","7324","7325","100","M","","","","","2015-09-25 12:45:38","1","2015-09-25 12:45:38","1");
INSERT INTO schokolat_pagenavigation VALUES("277","7280","7326","900","L","","","","","2015-10-01 13:18:44","1","2015-10-01 13:18:44","1");
INSERT INTO schokolat_pagenavigation VALUES("278","7324","7327","200","M","","","","","2015-10-05 14:44:22","1","2015-10-05 14:44:22","1");
INSERT INTO schokolat_pagenavigation VALUES("279","7324","7328","300","M","","","","","2015-10-05 14:44:34","1","2015-10-05 14:44:34","1");
INSERT INTO schokolat_pagenavigation VALUES("280","7324","7329","400","M","","","","","2015-10-05 14:44:43","1","2015-10-05 14:44:43","1");
INSERT INTO schokolat_pagenavigation VALUES("281","7280","7330","1000","L","","","","","2015-10-23 11:06:29","1","2015-10-23 11:06:29","1");
INSERT INTO schokolat_pagenavigation VALUES("282","7324","7331","500","M","","","","","2015-10-23 11:07:00","1","2015-10-23 11:07:00","1");



DROP TABLE schokolat_pageroles;

CREATE TABLE `schokolat_pageroles` (
  `pageroleid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pageid` int(11) NOT NULL,
  `roleid` varchar(20) NOT NULL,
  `metacreateddate` datetime NOT NULL,
  `metacreateduserid` int(11) NOT NULL,
  `metamodifieddate` datetime NOT NULL,
  `metamodifieduserid` int(11) NOT NULL,
  PRIMARY KEY (`pageroleid`),
  UNIQUE KEY `ix_pageroles` (`pageid`,`roleid`)
) ENGINE=MyISAM AUTO_INCREMENT=1274 DEFAULT CHARSET=latin1;

INSERT INTO schokolat_pageroles VALUES("3","3","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("665","11","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("9","13","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("667","100","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1095","7183","USER","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1082","7182","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("21","1509","USER","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1080","7180","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("174","7106","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("161","2000","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("160","14","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("159","10","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1063","7172","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("157","6","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("156","5","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("155","2","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1079","7179","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1064","7173","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1062","7171","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1061","7170","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1110","7202","COMPANY","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1070","7167","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1071","7168","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1073","7169","INSTRUCTOR","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1076","7158","INSTRUCTOR","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1072","7169","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1136","7174","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1067","7175","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1078","7178","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1068","7176","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1069","7177","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("963","4","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("654","7107","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1147","7213","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("669","100","USER","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1084","7184","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("670","130","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("676","1271","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("678","7105","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("656","7107","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1081","7181","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1074","7160","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1050","7161","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1053","7162","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1054","7163","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1055","7164","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1097","7165","USER","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1057","7166","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1085","7185","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("982","7125","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1116","7206","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1115","7205","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1114","7204","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1124","8","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1111","7203","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1107","7201","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1106","7200","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1105","7199","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1104","7198","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1029","7143","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1103","7197","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1102","7196","SCHOOL","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1101","7195","COMPANY","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1033","7147","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1094","7194","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1096","7193","USER","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1092","7192","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1091","7191","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1090","7190","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1089","7189","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1088","7188","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1087","7187","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1086","7186","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1048","7159","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1075","7158","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1129","3000","USER","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1118","7207","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1119","7208","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1120","7209","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1121","7210","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1122","7211","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1123","7212","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1128","1","USER","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1132","7214","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1133","7215","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1134","7216","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1135","7217","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1137","7174","STATEMENTS","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1138","7218","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1139","3010","USER","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1140","7219","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1141","7220","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1142","7221","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1145","7222","TYPIST","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1144","7223","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1146","7222","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1148","7213","STATEMENTS","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1149","7224","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1150","7225","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1151","7226","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1152","7227","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1153","7228","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1154","7229","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1155","7230","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1156","7231","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1157","7232","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pageroles VALUES("1248","7233","ADMIN","2015-07-06 19:10:05","1","2015-07-06 19:10:05","1");
INSERT INTO schokolat_pageroles VALUES("1247","7234","ADMIN","2015-07-06 18:31:46","1","2015-07-06 18:31:46","1");
INSERT INTO schokolat_pageroles VALUES("1160","7235","PUBLIC","2014-02-20 18:19:22","1","2014-02-20 18:19:22","1");
INSERT INTO schokolat_pageroles VALUES("1161","7236","PUBLIC","2014-03-02 11:04:46","1","2014-03-02 11:04:46","1");
INSERT INTO schokolat_pageroles VALUES("1162","7237","PUBLIC","2014-03-13 15:43:57","1","2014-03-13 15:43:57","1");
INSERT INTO schokolat_pageroles VALUES("1163","7238","PUBLIC","2014-03-24 10:24:22","1","2014-03-24 10:24:22","1");
INSERT INTO schokolat_pageroles VALUES("1164","7239","PUBLIC","2014-09-03 12:48:15","1","2014-09-03 12:48:15","1");
INSERT INTO schokolat_pageroles VALUES("1165","7240","PUBLIC","2014-10-09 19:35:09","1","2014-10-09 19:35:09","1");
INSERT INTO schokolat_pageroles VALUES("1166","7241","PUBLIC","2014-10-09 19:38:01","1","2014-10-09 19:38:01","1");
INSERT INTO schokolat_pageroles VALUES("1167","7242","PUBLIC","2014-10-09 19:42:05","1","2014-10-09 19:42:05","1");
INSERT INTO schokolat_pageroles VALUES("1168","7243","PUBLIC","2014-10-09 19:46:32","1","2014-10-09 19:46:32","1");
INSERT INTO schokolat_pageroles VALUES("1169","7244","PUBLIC","2014-10-09 19:48:06","1","2014-10-09 19:48:06","1");
INSERT INTO schokolat_pageroles VALUES("1170","7245","PUBLIC","2014-10-09 19:49:14","1","2014-10-09 19:49:14","1");
INSERT INTO schokolat_pageroles VALUES("1171","7246","PUBLIC","2014-10-09 19:50:11","1","2014-10-09 19:50:11","1");
INSERT INTO schokolat_pageroles VALUES("1172","7247","PUBLIC","2014-10-09 19:50:51","1","2014-10-09 19:50:51","1");
INSERT INTO schokolat_pageroles VALUES("1173","7248","PUBLIC","2014-10-09 19:51:43","1","2014-10-09 19:51:43","1");
INSERT INTO schokolat_pageroles VALUES("1174","7249","PUBLIC","2014-10-09 19:52:46","1","2014-10-09 19:52:46","1");
INSERT INTO schokolat_pageroles VALUES("1175","7250","PUBLIC","2014-10-09 19:53:34","1","2014-10-09 19:53:34","1");
INSERT INTO schokolat_pageroles VALUES("1176","7251","PUBLIC","2014-10-10 22:34:36","1","2014-10-10 22:34:36","1");
INSERT INTO schokolat_pageroles VALUES("1177","7252","PUBLIC","2014-10-11 13:20:04","1","2014-10-11 13:20:04","1");
INSERT INTO schokolat_pageroles VALUES("1178","7253","PUBLIC","2014-10-11 13:22:06","1","2014-10-11 13:22:06","1");
INSERT INTO schokolat_pageroles VALUES("1179","7254","PUBLIC","2014-10-11 13:22:35","1","2014-10-11 13:22:35","1");
INSERT INTO schokolat_pageroles VALUES("1180","7255","PUBLIC","2014-10-11 13:23:27","1","2014-10-11 13:23:27","1");
INSERT INTO schokolat_pageroles VALUES("1181","7256","PUBLIC","2014-10-11 13:24:38","1","2014-10-11 13:24:38","1");
INSERT INTO schokolat_pageroles VALUES("1182","7257","PUBLIC","2014-10-11 13:25:28","1","2014-10-11 13:25:28","1");
INSERT INTO schokolat_pageroles VALUES("1183","7258","PUBLIC","2014-10-11 13:26:16","1","2014-10-11 13:26:16","1");
INSERT INTO schokolat_pageroles VALUES("1184","7259","PUBLIC","2014-10-11 14:22:02","1","2014-10-11 14:22:02","1");
INSERT INTO schokolat_pageroles VALUES("1185","7260","PUBLIC","2014-10-26 21:29:58","1","2014-10-26 21:29:58","1");
INSERT INTO schokolat_pageroles VALUES("1186","7261","PUBLIC","2014-11-30 15:22:04","1","2014-11-30 15:22:04","1");
INSERT INTO schokolat_pageroles VALUES("1187","7262","PUBLIC","2014-12-07 18:44:25","1","2014-12-07 18:44:25","1");
INSERT INTO schokolat_pageroles VALUES("1188","7263","PUBLIC","2014-12-07 19:04:33","1","2014-12-07 19:04:33","1");
INSERT INTO schokolat_pageroles VALUES("1189","7264","PUBLIC","2014-12-07 19:13:02","1","2014-12-07 19:13:02","1");
INSERT INTO schokolat_pageroles VALUES("1190","7265","PUBLIC","2014-12-09 20:13:19","1","2014-12-09 20:13:19","1");
INSERT INTO schokolat_pageroles VALUES("1191","7266","PUBLIC","2014-12-18 14:12:18","1","2014-12-18 14:12:18","1");
INSERT INTO schokolat_pageroles VALUES("1192","7267","PUBLIC","2014-12-18 15:42:25","1","2014-12-18 15:42:25","1");
INSERT INTO schokolat_pageroles VALUES("1193","7268","PUBLIC","2014-12-19 12:13:51","1","2014-12-19 12:13:51","1");
INSERT INTO schokolat_pageroles VALUES("1194","7269","PUBLIC","2014-12-19 12:14:29","1","2014-12-19 12:14:29","1");
INSERT INTO schokolat_pageroles VALUES("1195","7270","PUBLIC","2014-12-19 12:17:00","1","2014-12-19 12:17:00","1");
INSERT INTO schokolat_pageroles VALUES("1196","7271","PUBLIC","2014-12-19 12:19:12","1","2014-12-19 12:19:12","1");
INSERT INTO schokolat_pageroles VALUES("1197","7272","PUBLIC","2014-12-19 12:19:30","1","2014-12-19 12:19:30","1");
INSERT INTO schokolat_pageroles VALUES("1198","7273","PUBLIC","2014-12-21 13:20:56","1","2014-12-21 13:20:56","1");
INSERT INTO schokolat_pageroles VALUES("1199","7274","PUBLIC","2014-12-21 20:55:13","1","2014-12-21 20:55:13","1");
INSERT INTO schokolat_pageroles VALUES("1200","7275","PUBLIC","2014-12-21 20:55:42","1","2014-12-21 20:55:42","1");
INSERT INTO schokolat_pageroles VALUES("1201","7276","PUBLIC","2014-12-21 21:36:55","1","2014-12-21 21:36:55","1");
INSERT INTO schokolat_pageroles VALUES("1202","7277","PUBLIC","2014-12-21 21:39:17","1","2014-12-21 21:39:17","1");
INSERT INTO schokolat_pageroles VALUES("1203","7278","PUBLIC","2014-12-21 21:39:46","1","2014-12-21 21:39:46","1");
INSERT INTO schokolat_pageroles VALUES("1204","7279","PUBLIC","2014-12-22 22:08:35","1","2014-12-22 22:08:35","1");
INSERT INTO schokolat_pageroles VALUES("1232","7280","ADMIN","2015-07-02 19:27:54","1","2015-07-02 19:27:54","1");
INSERT INTO schokolat_pageroles VALUES("1206","7281","PUBLIC","2014-12-22 22:14:49","1","2014-12-22 22:14:49","1");
INSERT INTO schokolat_pageroles VALUES("1207","7282","PUBLIC","2014-12-22 22:15:02","1","2014-12-22 22:15:02","1");
INSERT INTO schokolat_pageroles VALUES("1208","7283","PUBLIC","2014-12-22 22:15:30","1","2014-12-22 22:15:30","1");
INSERT INTO schokolat_pageroles VALUES("1209","7284","PUBLIC","2014-12-22 22:19:19","1","2014-12-22 22:19:19","1");
INSERT INTO schokolat_pageroles VALUES("1210","7285","PUBLIC","2014-12-22 22:20:53","1","2014-12-22 22:20:53","1");
INSERT INTO schokolat_pageroles VALUES("1211","7286","PUBLIC","2014-12-22 22:21:41","1","2014-12-22 22:21:41","1");
INSERT INTO schokolat_pageroles VALUES("1212","7287","PUBLIC","2014-12-22 22:22:37","1","2014-12-22 22:22:37","1");
INSERT INTO schokolat_pageroles VALUES("1213","7288","PUBLIC","2014-12-23 19:46:42","1","2014-12-23 19:46:42","1");
INSERT INTO schokolat_pageroles VALUES("1214","7289","PUBLIC","2015-01-02 12:57:48","1","2015-01-02 12:57:48","1");
INSERT INTO schokolat_pageroles VALUES("1215","7290","PUBLIC","2015-01-02 12:58:00","1","2015-01-02 12:58:00","1");
INSERT INTO schokolat_pageroles VALUES("1216","7291","PUBLIC","2015-01-10 21:56:37","1","2015-01-10 21:56:37","1");
INSERT INTO schokolat_pageroles VALUES("1217","7292","PUBLIC","2015-01-11 00:09:58","1","2015-01-11 00:09:58","1");
INSERT INTO schokolat_pageroles VALUES("1218","7293","PUBLIC","2015-01-22 19:05:10","1","2015-01-22 19:05:10","1");
INSERT INTO schokolat_pageroles VALUES("1219","7294","PUBLIC","2015-06-09 21:11:50","1","2015-06-09 21:11:50","1");
INSERT INTO schokolat_pageroles VALUES("1220","7295","PUBLIC","2015-06-11 18:33:01","1","2015-06-11 18:33:01","1");
INSERT INTO schokolat_pageroles VALUES("1221","7296","PUBLIC","2015-06-12 16:26:13","1","2015-06-12 16:26:13","1");
INSERT INTO schokolat_pageroles VALUES("1222","7297","PUBLIC","2015-06-12 18:37:09","1","2015-06-12 18:37:09","1");
INSERT INTO schokolat_pageroles VALUES("1223","7298","PUBLIC","2015-06-13 16:05:20","1","2015-06-13 16:05:20","1");
INSERT INTO schokolat_pageroles VALUES("1224","7299","PUBLIC","2015-06-15 19:31:40","1","2015-06-15 19:31:40","1");
INSERT INTO schokolat_pageroles VALUES("1225","7300","PUBLIC","2015-06-15 19:31:59","1","2015-06-15 19:31:59","1");
INSERT INTO schokolat_pageroles VALUES("1226","7301","PUBLIC","2015-06-15 21:25:51","1","2015-06-15 21:25:51","1");
INSERT INTO schokolat_pageroles VALUES("1227","7302","PUBLIC","2015-06-15 21:26:08","1","2015-06-15 21:26:08","1");
INSERT INTO schokolat_pageroles VALUES("1228","7303","PUBLIC","2015-06-28 16:00:14","1","2015-06-28 16:00:14","1");
INSERT INTO schokolat_pageroles VALUES("1246","7305","ADMIN","2015-07-06 18:29:42","1","2015-07-06 18:29:42","1");
INSERT INTO schokolat_pageroles VALUES("1233","7304","TEAM","2015-07-02 19:28:31","1","2015-07-02 19:28:31","1");
INSERT INTO schokolat_pageroles VALUES("1242","7306","ADMIN","2015-07-06 18:27:24","1","2015-07-06 18:27:24","1");
INSERT INTO schokolat_pageroles VALUES("1236","7307","PUBLIC","2015-07-03 19:45:35","1","2015-07-03 19:45:35","1");
INSERT INTO schokolat_pageroles VALUES("1249","7308","ADMIN","2015-07-12 18:54:10","1","2015-07-12 18:54:10","1");
INSERT INTO schokolat_pageroles VALUES("1239","7309","TEAM","2015-07-06 18:25:51","1","2015-07-06 18:25:51","1");
INSERT INTO schokolat_pageroles VALUES("1244","7310","ADMIN","2015-07-06 18:27:57","1","2015-07-06 18:27:57","1");
INSERT INTO schokolat_pageroles VALUES("1245","7311","ADMIN","2015-07-06 18:28:05","1","2015-07-06 18:28:05","1");
INSERT INTO schokolat_pageroles VALUES("1250","7308","TEAM","2015-07-12 18:54:10","1","2015-07-12 18:54:10","1");
INSERT INTO schokolat_pageroles VALUES("1251","7312","PUBLIC","2015-07-13 10:10:15","1","2015-07-13 10:10:15","1");
INSERT INTO schokolat_pageroles VALUES("1252","7313","PUBLIC","2015-07-20 17:33:14","1","2015-07-20 17:33:14","1");
INSERT INTO schokolat_pageroles VALUES("1253","7314","PUBLIC","2015-07-20 17:34:05","1","2015-07-20 17:34:05","1");
INSERT INTO schokolat_pageroles VALUES("1254","7315","PUBLIC","2015-08-04 20:37:20","1","2015-08-04 20:37:20","1");
INSERT INTO schokolat_pageroles VALUES("1255","7316","PUBLIC","2015-08-09 20:09:23","1","2015-08-09 20:09:23","1");
INSERT INTO schokolat_pageroles VALUES("1256","7317","PUBLIC","2015-08-24 15:51:19","1","2015-08-24 15:51:19","1");
INSERT INTO schokolat_pageroles VALUES("1257","7318","PUBLIC","2015-08-24 15:53:18","1","2015-08-24 15:53:18","1");
INSERT INTO schokolat_pageroles VALUES("1258","7319","PUBLIC","2015-08-24 15:53:41","1","2015-08-24 15:53:41","1");
INSERT INTO schokolat_pageroles VALUES("1259","7320","PUBLIC","2015-08-27 15:14:30","1","2015-08-27 15:14:30","1");
INSERT INTO schokolat_pageroles VALUES("1261","7321","ADMIN","2015-09-01 17:39:02","1","2015-09-01 17:39:02","1");
INSERT INTO schokolat_pageroles VALUES("1272","7322","ADMIN","2015-10-28 09:30:03","1","2015-10-28 09:30:03","1");
INSERT INTO schokolat_pageroles VALUES("1263","7323","PUBLIC","2015-09-22 17:39:40","1","2015-09-22 17:39:40","1");
INSERT INTO schokolat_pageroles VALUES("1273","7324","ADMIN","2015-10-28 09:30:21","1","2015-10-28 09:30:21","1");
INSERT INTO schokolat_pageroles VALUES("1265","7325","PUBLIC","2015-09-25 12:45:38","1","2015-09-25 12:45:38","1");
INSERT INTO schokolat_pageroles VALUES("1266","7326","PUBLIC","2015-10-01 13:18:44","1","2015-10-01 13:18:44","1");
INSERT INTO schokolat_pageroles VALUES("1267","7327","PUBLIC","2015-10-05 14:44:22","1","2015-10-05 14:44:22","1");
INSERT INTO schokolat_pageroles VALUES("1268","7328","PUBLIC","2015-10-05 14:44:34","1","2015-10-05 14:44:34","1");
INSERT INTO schokolat_pageroles VALUES("1269","7329","PUBLIC","2015-10-05 14:44:43","1","2015-10-05 14:44:43","1");
INSERT INTO schokolat_pageroles VALUES("1270","7330","PUBLIC","2015-10-23 11:06:29","1","2015-10-23 11:06:29","1");
INSERT INTO schokolat_pageroles VALUES("1271","7331","PUBLIC","2015-10-23 11:07:00","1","2015-10-23 11:07:00","1");



DROP TABLE schokolat_pages;

CREATE TABLE `schokolat_pages` (
  `pageid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pagename` varchar(50) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  `content` text,
  `metacreateddate` datetime NOT NULL,
  `metacreateduserid` int(11) NOT NULL,
  `metamodifieddate` datetime NOT NULL,
  `metamodifieduserid` int(11) NOT NULL,
  PRIMARY KEY (`pageid`),
  UNIQUE KEY `ix_page` (`pagename`)
) ENGINE=MyISAM AUTO_INCREMENT=7332 DEFAULT CHARSET=latin1;

INSERT INTO schokolat_pages VALUES("1","index.php","Home","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("2","system-access-denied.php","Access Denied","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("3","system-admin.php","Admin","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("5","system-login-timeout.php","Session Timeout","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("6","system-login-failed.php","Login Failed","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("8","system-register.php","Register","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("10","system-register-success.php","Register Success","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("11","system-admin-roles.php","Manage Roles","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("13","system-register-exec.php","Register Save","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("14","system-imageviewer.php","Image Viewer","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("100","profile.php","Edit Profile","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("130","users.php","Manage Users","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("2000","system-login.php","Account log in","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("1271","siteconfig.php","Site Configuration","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("1508","passwordchanged.php","Changed Password","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("1509","system-register-amend.php","User Amendment","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("7105","managepages.php","Manage Pages","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("3010","documents.php","Documents","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("7106","manageactions.php","Manage Actions","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("4","manageerrors.php","System Errors","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("7125","messages.php","Messages","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("7143","managegrids.php","Manage Grids","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("7165","manageterms.php","Manage Terms","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("7147","runalerts.php","Alert Schedule","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("7239","reportbookings.php","Report Bookings","P",0x,"2014-09-03 12:48:15","1","2014-09-03 12:48:15","1");
INSERT INTO schokolat_pages VALUES("7302","system-client-exec.php","Select Client Exel","P",0x,"2015-06-15 21:26:08","1","2015-06-15 21:26:08","1");
INSERT INTO schokolat_pages VALUES("7158","managevehicles.php","Manage Vehicles","P",0x,"0000-00-00 00:00:00","0","2014-05-13 17:27:50","1");
INSERT INTO schokolat_pages VALUES("7181","instructors.php","Instructors","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("7182","students.php","Students","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("7216","recalculateconfirm.php","Recalculate Price","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("7215","recalculateprice.php","Recalculate Price","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("7214","manageinvoiceitemtemplates.php","Invoice Items","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("7210","managedrivers.php","Manage Drivers","P",0x,"0000-00-00 00:00:00","0","2014-05-13 17:28:43","1");
INSERT INTO schokolat_pages VALUES("7197","companymembers.php","Company Members","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("7199","schoolmembers.php","School Members","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("7200","schoolsubgroups.php","School Sub Groups","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("7201","managecompanysubgroups.php","Manage Sub Groups","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("7204","messageview.php","Message View","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("7205","messagecompose.php","Message Compose","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("7206","messageforward.php","MessageForward","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("7176","managebookings.php","All Bookings","P",0x,"0000-00-00 00:00:00","0","2014-12-21 11:35:18","1");
INSERT INTO schokolat_pages VALUES("7217","editinvoices.php","View / Edit Invoices","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("7223","invoiceupload.php","Invoice Upload","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("7230","trackingreport.php","Tracking Report","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_pages VALUES("7232","managetrailers.php","Manage Trailers","P",0x,"0000-00-00 00:00:00","0","2014-05-13 17:28:10","1");
INSERT INTO schokolat_pages VALUES("7324","reports.php","Reports","P",0x,"2015-09-25 12:44:26","1","2015-09-25 12:44:26","1");
INSERT INTO schokolat_pages VALUES("7234","runsql.php","Run SQL","P",0x,"2014-02-20 15:20:59","1","2014-02-20 15:20:59","1");
INSERT INTO schokolat_pages VALUES("7282","manageproducts.php","Manage Products","P",0x,"2014-12-22 22:15:02","1","2014-12-22 22:15:02","1");
INSERT INTO schokolat_pages VALUES("7242","raiseholidayrequest.php","Raise Holiday Requests","P",0x,"2014-10-09 19:42:05","1","2014-10-09 19:42:05","1");
INSERT INTO schokolat_pages VALUES("7243","pendingholidays.php","Pending Holiday Requests","P",0x,"2014-10-09 19:46:32","1","2014-10-09 19:46:32","1");
INSERT INTO schokolat_pages VALUES("7244","managebankholidays.php","Manage Bank Holidays","P",0x,"2014-10-09 19:48:06","1","2014-10-09 19:48:06","1");
INSERT INTO schokolat_pages VALUES("7245","holidayexceptionreport.php","Holiday Exception Report","P",0x,"2014-10-09 19:49:14","1","2014-10-09 19:49:14","1");
INSERT INTO schokolat_pages VALUES("7246","viewallholidays.php","View All Holidays","P",0x,"2014-10-09 19:50:11","1","2014-10-09 19:50:11","1");
INSERT INTO schokolat_pages VALUES("7247","viewallholidaystaken.php","View All Holidays Taken","P",0x,"2014-10-09 19:50:51","1","2014-10-09 19:50:51","1");
INSERT INTO schokolat_pages VALUES("7248","rejectedholidays.php","View All Rejected Holidays","P",0x,"2014-10-09 19:51:43","1","2014-10-09 19:51:43","1");
INSERT INTO schokolat_pages VALUES("7249","pendingholidayscalendar.php","Pending Holidays Calendar","P",0x,"2014-10-09 19:52:46","1","2014-10-09 19:53:40","1");
INSERT INTO schokolat_pages VALUES("7250","acceptedholidayscalendar.php","Accepted Holidays Calendar","P",0x,"2014-10-09 19:53:34","1","2014-10-09 19:53:34","1");
INSERT INTO schokolat_pages VALUES("7251","holidayconfirm.php","Raise Holiday Requests","P",0x,"2014-10-10 22:34:36","1","2014-10-10 22:39:57","1");
INSERT INTO schokolat_pages VALUES("7252","raiseabsencerequest.php","Raise Absence Request","P",0x,"2014-10-11 13:20:04","1","2014-10-11 13:20:04","1");
INSERT INTO schokolat_pages VALUES("7253","pendingabsences.php","Pending Absences","P",0x,"2014-10-11 13:22:06","1","2014-10-11 13:22:06","1");
INSERT INTO schokolat_pages VALUES("7254","viewabsences.php","View Absences","P",0x,"2014-10-11 13:22:35","1","2014-10-11 13:22:35","1");
INSERT INTO schokolat_pages VALUES("7255","viewsickness.php","View Sickness","P",0x,"2014-10-11 13:23:27","1","2014-10-11 13:23:27","1");
INSERT INTO schokolat_pages VALUES("7256","pendingabsencescalendar.php","Pending Absences Calendar","P",0x,"2014-10-11 13:24:38","1","2014-10-11 13:24:38","1");
INSERT INTO schokolat_pages VALUES("7257","acceptedabsencescalendar.php","Accepted Absences Calendar","P",0x,"2014-10-11 13:25:28","1","2014-10-11 13:25:28","1");
INSERT INTO schokolat_pages VALUES("7258","absenceconfirm.php","Raise Absence Request","P",0x,"2014-10-11 13:26:16","1","2014-10-11 13:26:16","1");
INSERT INTO schokolat_pages VALUES("7259","allocatejobs.php","Jobs Awaiting Allocation","P",0x,"2014-10-11 14:22:02","1","2014-12-18 15:41:44","1");
INSERT INTO schokolat_pages VALUES("7260","managebookinglegs.php","Manage Booking Legs","P",0x,"2014-10-26 21:29:58","1","2014-10-26 21:29:58","1");
INSERT INTO schokolat_pages VALUES("7261","managevehicletypes.php","Manage Vehicle Types","P",0x,"2014-11-30 15:22:04","1","2014-11-30 15:22:04","1");
INSERT INTO schokolat_pages VALUES("7262","managetaxcodes.php","Manage Tax Codes","P",0x,"2014-12-07 18:44:25","1","2014-12-07 18:44:25","1");
INSERT INTO schokolat_pages VALUES("7263","manageaccountstatus.php","Manage Account Status","P",0x,"2014-12-07 19:04:33","1","2014-12-07 19:04:33","1");
INSERT INTO schokolat_pages VALUES("7264","manageratecodes.php","Manage Rate Codes","P",0x,"2014-12-07 19:13:02","1","2014-12-07 19:13:02","1");
INSERT INTO schokolat_pages VALUES("7265","manageloadtypes.php","Manage Load Types","P",0x,"2014-12-09 20:13:19","1","2014-12-09 20:13:19","1");
INSERT INTO schokolat_pages VALUES("7266","managebookingstatus.php","Manage Booking Status","P",0x,"2014-12-18 14:12:18","1","2014-12-18 14:12:18","1");
INSERT INTO schokolat_pages VALUES("7267","jobsawaitingdrivernotification.php","Jobs Awaiting Driver Notification","P",0x,"2014-12-18 15:42:25","1","2014-12-18 15:42:25","1");
INSERT INTO schokolat_pages VALUES("7268","jobsawaitingdriverconfirmation.php","Jobs Awaiting Progress Confirmation","P",0x,"2014-12-19 12:13:51","1","2014-12-19 12:13:51","1");
INSERT INTO schokolat_pages VALUES("7269","jobsawaitingcompletion.php","Jobs In Progress","P",0x,"2014-12-19 12:14:29","1","2014-12-19 12:18:14","1");
INSERT INTO schokolat_pages VALUES("7270","completedjobs.php","Completed Jobs","P",0x,"2014-12-19 12:17:00","1","2014-12-19 12:17:00","1");
INSERT INTO schokolat_pages VALUES("7271","invoicedjobs.php","Invoiced Jobs","P",0x,"2014-12-19 12:19:12","1","2014-12-19 12:25:41","1");
INSERT INTO schokolat_pages VALUES("7272","failedjobs.php","Failed Jobs","P",0x,"2014-12-19 12:19:30","1","2014-12-19 12:19:30","1");
INSERT INTO schokolat_pages VALUES("7273","manageworktypes.php","Manage Work Types","P",0x,"2014-12-21 13:20:56","1","2014-12-21 13:20:56","1");
INSERT INTO schokolat_pages VALUES("7274","managevehicleunavailabilitycode.php","Manage Vehicle Unavailability Codes","P",0x,"2014-12-21 20:55:13","1","2014-12-21 20:55:13","1");
INSERT INTO schokolat_pages VALUES("7275","managetrailerunavailabilitycode.php","Manage Trailer Unavailability Codes","P",0x,"2014-12-21 20:55:42","1","2014-12-21 20:55:42","1");
INSERT INTO schokolat_pages VALUES("7281","importproducts.php","Import Products","P",0x,"2014-12-22 22:14:49","1","2014-12-22 22:14:49","1");
INSERT INTO schokolat_pages VALUES("7277","vehicleunavailability.php","Vehicle Unavailability","P",0x,"2014-12-21 21:39:17","1","2014-12-21 21:39:17","1");
INSERT INTO schokolat_pages VALUES("7278","trailerunavailability.php","Trailer Unavailability","P",0x,"2014-12-21 21:39:46","1","2014-12-21 21:39:46","1");
INSERT INTO schokolat_pages VALUES("7280","events.php","Events","P",0x,"2014-12-22 22:08:51","1","2015-09-21 17:39:59","1");
INSERT INTO schokolat_pages VALUES("7316","sales.php","Sales","P",0x,"2015-08-09 20:09:23","1","2015-09-21 17:44:04","1");
INSERT INTO schokolat_pages VALUES("7323","epos.php","EPOS","P",0x,"2015-09-22 17:39:40","1","2015-09-22 17:39:40","1");
INSERT INTO schokolat_pages VALUES("7301","system-client.php","Select Client","P",0x,"2015-06-15 21:25:51","1","2015-06-15 21:25:51","1");
INSERT INTO schokolat_pages VALUES("7299","clientschedule.php","Client Schedule","P",0x,"2015-06-15 19:31:40","1","2015-07-20 18:16:45","1");
INSERT INTO schokolat_pages VALUES("7314","clientplanner.php","Client Planner","P",0x,"2015-07-20 17:34:05","1","2015-07-20 17:34:05","1");
INSERT INTO schokolat_pages VALUES("7297","m.system-login.php","System Login (Mobile)","P",0x,"2015-06-12 18:37:09","1","2015-06-12 18:37:09","1");
INSERT INTO schokolat_pages VALUES("7306","refereereport.php","Referee Average Report","P",0x,"2015-07-03 19:45:00","1","2015-07-03 19:45:00","1");
INSERT INTO schokolat_pages VALUES("7315","userrota.php","Manage User Rota","P",0x,"2015-08-04 20:37:20","1","2015-08-04 20:37:20","1");
INSERT INTO schokolat_pages VALUES("7308","clientplannerdetails.php","Client Planner Print","P",0x,"2015-07-03 20:12:35","1","2015-08-16 21:54:42","1");
INSERT INTO schokolat_pages VALUES("7313","myplanner.php","My Planner","P",0x,"2015-07-20 17:33:14","1","2015-07-20 17:33:14","1");
INSERT INTO schokolat_pages VALUES("7310","importreferees.php","Import Referees","P",0x,"2015-07-06 18:27:17","1","2015-07-06 18:27:17","1");
INSERT INTO schokolat_pages VALUES("7311","referees.php","Manage Referees","P",0x,"2015-07-06 18:27:46","1","2015-07-06 18:27:46","1");
INSERT INTO schokolat_pages VALUES("7322","products.php","Products","P",0x,"2015-09-22 17:00:52","1","2015-09-22 17:00:52","1");
INSERT INTO schokolat_pages VALUES("7318","reporthoursworked.php","Report Hours Worked - Monthly","P",0x,"2015-08-24 15:53:18","1","2015-08-24 15:53:18","1");
INSERT INTO schokolat_pages VALUES("7319","reporthoursworkedlib.php","Report Hours Worked - Monthly (Lib)","P",0x,"2015-08-24 15:53:41","1","2015-08-24 15:53:41","1");
INSERT INTO schokolat_pages VALUES("7321","diaryevents.php","Diary Events","P",0x,"2015-09-01 17:38:55","1","2015-09-01 17:38:55","1");
INSERT INTO schokolat_pages VALUES("7326","eventproducts.php","Event Products Matrix","P",0x,"2015-10-01 13:18:44","1","2015-10-01 13:18:44","1");
INSERT INTO schokolat_pages VALUES("7327","reporsoldunitsbysite.php","Report Sold Units By Site","P",0x,"2015-10-05 14:44:22","1","2015-10-05 14:44:22","1");
INSERT INTO schokolat_pages VALUES("7328","reportrevenuebysite.php","Report Revenue By Site","P",0x,"2015-10-05 14:44:34","1","2015-10-05 14:44:34","1");
INSERT INTO schokolat_pages VALUES("7329","reportsummarybysite.php","Report Summary by Site","P",0x,"2015-10-05 14:44:43","1","2015-10-05 14:44:43","1");
INSERT INTO schokolat_pages VALUES("7330","eventforecast.php","Event Forecast Calendar","P",0x,"2015-10-23 11:06:29","1","2015-10-23 11:06:29","1");
INSERT INTO schokolat_pages VALUES("7331","reportdailycosts.php","Report Daily Takings","P",0x,"2015-10-23 11:07:00","1","2015-10-23 11:07:00","1");



DROP TABLE schokolat_product;

CREATE TABLE `schokolat_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productid` varchar(32) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `retailprice` decimal(10,2) DEFAULT NULL,
  `metacreateduserid` int(11) DEFAULT NULL,
  `metamodifieduserid` int(11) DEFAULT NULL,
  `metacreateddate` datetime DEFAULT NULL,
  `metamodifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`productid`)
) ENGINE=InnoDB AUTO_INCREMENT=38377 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

INSERT INTO schokolat_product VALUES("38345","5060407770000","Adjustable Spanner","10.95","1","1","2015-09-24 09:50:42","2015-10-28 09:35:03");
INSERT INTO schokolat_product VALUES("38346","5060407770017","Bottle Opener & Cap","9.95","1","1","2015-09-24 09:52:47","2015-10-28 09:35:19");
INSERT INTO schokolat_product VALUES("38348","5060407770031","Club Hammer","14.95","1","1","2015-09-24 09:54:24","2015-10-28 09:36:12");
INSERT INTO schokolat_product VALUES("38349","5060407770291","Cosmetic Set","17.95","1","1","2015-09-24 09:55:03","2015-10-28 09:36:29");
INSERT INTO schokolat_product VALUES("38350","5060407770048","Fabric Scissors","10.95","1","1","2015-09-24 09:55:31","2015-10-28 09:36:42");
INSERT INTO schokolat_product VALUES("38351","5060407770055","Golf Iron & Ball","14.95","1","1","2015-09-24 09:55:58","2015-10-28 09:36:54");
INSERT INTO schokolat_product VALUES("38352","5060407770062","Grater","9.95","1","1","2015-09-24 09:56:30","2015-10-28 09:37:08");
INSERT INTO schokolat_product VALUES("38353","5060407770079","Hammer","9.95","1","1","2015-09-24 09:57:00","2015-10-28 09:37:17");
INSERT INTO schokolat_product VALUES("38354","5060407770086","Hammer & Chisel","16.95","1","1","2015-09-24 09:57:24","2015-10-28 09:37:28");
INSERT INTO schokolat_product VALUES("38355","5060407770307","Handcuffs","15.95","1","1","2015-09-24 09:57:48","2015-10-28 09:37:39");
INSERT INTO schokolat_product VALUES("38356","5060407770093","Horse Shoe","10.95","1","1","2015-09-24 09:58:19","2015-10-28 09:37:53");
INSERT INTO schokolat_product VALUES("38357","5060407770109","Key","12.95","1","1","2015-09-24 09:58:42","2015-10-28 09:38:03");
INSERT INTO schokolat_product VALUES("38358","5060407770116","Key & Escutcheon","12.95","1","1","2015-09-24 09:59:11","2015-10-28 09:38:12");
INSERT INTO schokolat_product VALUES("38359","5060407770123","Nut & Bolt","11.95","1","1","2015-09-24 09:59:36","2015-10-28 09:38:20");
INSERT INTO schokolat_product VALUES("38360","5060407770130","Nut Cracker","9.95","1","1","2015-09-24 10:00:04","2015-10-28 09:38:28");
INSERT INTO schokolat_product VALUES("38361","5060407770147","Padlock","11.95","1","1","2015-09-24 10:00:29","2015-10-28 09:38:37");
INSERT INTO schokolat_product VALUES("38362","5060407770024","Paint Brush","9.95","1","1","2015-09-24 10:00:54","2015-10-28 09:35:55");
INSERT INTO schokolat_product VALUES("38363","5060407770154","Paint Brush & Paint","14.95","1","1","2015-09-24 10:01:22","2015-10-28 09:38:47");
INSERT INTO schokolat_product VALUES("38364","5060407770161","Pliers","9.95","1","1","2015-09-24 10:01:46","2015-10-28 09:39:01");
INSERT INTO schokolat_product VALUES("38365","5060407770178","Pocket Knife","10.95","1","1","2015-09-24 10:02:28","2015-10-28 09:39:10");
INSERT INTO schokolat_product VALUES("38366","5060407770192","Secateurs","11.95","1","1","2015-09-24 10:02:53","2015-10-28 09:39:19");
INSERT INTO schokolat_product VALUES("38367","5060407770208","Shears","12.95","1","1","2015-09-24 10:03:16","2015-10-28 09:39:30");
INSERT INTO schokolat_product VALUES("38368","5060407770314","Shotgun Cartridge Set","17.95","1","1","2015-09-24 10:03:47","2015-10-28 09:39:39");
INSERT INTO schokolat_product VALUES("38369","5060407770215","Spanner","10.95","1","1","2015-09-24 10:04:13","2015-10-28 09:39:50");
INSERT INTO schokolat_product VALUES("38370","5060407770222","Spanner and Nut (Small)","11.95","1","1","2015-09-24 10:04:39","2015-10-28 09:40:21");
INSERT INTO schokolat_product VALUES("38371","5060407770239","Spanner and Nut (Large)","13.95","1","1","2015-09-24 10:05:11","2015-10-28 09:40:12");
INSERT INTO schokolat_product VALUES("38372","5060407770246","Stilsons","14.95","1","1","2015-09-24 10:05:36","2015-10-28 09:40:31");
INSERT INTO schokolat_product VALUES("38373","5060407770321","Tap","12.95","1","1","2015-09-24 10:06:02","2015-10-28 09:40:43");
INSERT INTO schokolat_product VALUES("38374","5060407770338","Teapot","24.95","1","1","2015-09-24 10:06:27","2015-10-02 10:18:08");
INSERT INTO schokolat_product VALUES("38375","5060407770253","Twist Corkscrew","13.95","1","1","2015-09-24 10:07:02","2015-10-28 09:40:54");
INSERT INTO schokolat_product VALUES("38376","5060407770260","Wing Corkscrew","15.95","1","1","2015-09-24 10:07:26","2015-10-28 09:41:04");



DROP TABLE schokolat_roles;

CREATE TABLE `schokolat_roles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `roleid` varchar(20) DEFAULT '',
  `systemrole` varchar(1) DEFAULT NULL,
  `metacreateddate` datetime NOT NULL,
  `metacreateduserid` int(11) NOT NULL,
  `metamodifieddate` datetime NOT NULL,
  `metamodifieduserid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

INSERT INTO schokolat_roles VALUES("1","PUBLIC","Y","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_roles VALUES("2","ADMIN","N","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_roles VALUES("3","USER","Y","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_roles VALUES("48","UNAUTHENTICATED","N","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_roles VALUES("52","TEAM","N","2015-07-02 19:27:17","1","2015-07-02 19:27:17","1");
INSERT INTO schokolat_roles VALUES("53","FORECASTALERT","N","2015-10-23 11:10:47","1","2015-10-23 11:10:47","1");



DROP TABLE schokolat_userroles;

CREATE TABLE `schokolat_userroles` (
  `userroleid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` varchar(20) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `metacreateddate` datetime NOT NULL,
  `metacreateduserid` int(11) NOT NULL,
  `metamodifieddate` datetime NOT NULL,
  `metamodifieduserid` int(11) NOT NULL,
  PRIMARY KEY (`userroleid`),
  UNIQUE KEY `ix_userroles` (`roleid`,`memberid`)
) ENGINE=MyISAM AUTO_INCREMENT=1751 DEFAULT CHARSET=latin1;

INSERT INTO schokolat_userroles VALUES("1","PUBLIC","1","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1623","USER","228","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1624","INSTRUCTOR","228","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1622","PUBLIC","228","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1594","USER","219","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1619","PUBLIC","227","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1620","USER","227","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1596","USER","220","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1600","INSTRUCTOR","220","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1601","INSTRUCTOR","216","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1602","INSTRUCTOR","1","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1603","STUDENT","216","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1604","PUBLIC","221","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1605","USER","221","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1606","INSTRUCTOR","221","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1607","PUBLIC","222","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1608","USER","222","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1609","INSTRUCTOR","222","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1610","PUBLIC","223","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1611","USER","223","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1612","INSTRUCTOR","223","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1613","PUBLIC","224","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1614","USER","224","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1615","PUBLIC","225","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1616","USER","225","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1617","PUBLIC","226","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1618","USER","226","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("345","ADMIN","1","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1625","SCHOOL","220","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1627","COMPANY","220","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1628","COMPANY","1","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1629","PUBLIC","229","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1630","USER","229","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1631","COMPANY","229","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1632","INSTRUCTOR","229","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1633","PUBLIC","230","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1634","USER","230","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1635","COMPANY","230","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1636","INSTRUCTOR","230","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1637","PUBLIC","231","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1638","USER","231","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1639","COMPANY","231","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1640","INSTRUCTOR","231","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1641","PUBLIC","232","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1642","USER","232","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1643","COMPANY","232","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1644","INSTRUCTOR","232","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1645","PUBLIC","233","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1646","USER","233","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1647","COMPANY","233","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1648","INSTRUCTOR","233","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1592","PUBLIC","216","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1593","PUBLIC","219","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1595","PUBLIC","220","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1621","INSTRUCTOR","227","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1480","USER","1","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1590","USER","216","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1651","PUBLIC","234","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1657","TYPIST","234","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1656","TYPIST","225","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1655","TYPIST","220","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1658","TYPIST","1","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1677","OFFICE","221","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1665","TYPIST","235","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1664","PUBLIC","235","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1676","OFFICE","224","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1678","OFFICE","231","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1679","OFFICE","232","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1680","OFFICE","220","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1681","OFFICE","1","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO schokolat_userroles VALUES("1682","PUBLIC","236","2015-06-09 18:12:56","1","2015-06-09 18:12:56","1");
INSERT INTO schokolat_userroles VALUES("1683","USER","236","2015-06-09 18:12:56","1","2015-06-09 18:12:56","1");
INSERT INTO schokolat_userroles VALUES("1684","A","236","2015-06-09 18:12:56","1","2015-06-09 18:12:56","1");
INSERT INTO schokolat_userroles VALUES("1685","PUBLIC","237","2015-06-09 18:17:39","1","2015-06-09 18:17:39","1");
INSERT INTO schokolat_userroles VALUES("1686","USER","237","2015-06-09 18:17:39","1","2015-06-09 18:17:39","1");
INSERT INTO schokolat_userroles VALUES("1687","PUBLIC","238","2015-07-02 19:33:14","1","2015-07-02 19:33:14","1");
INSERT INTO schokolat_userroles VALUES("1688","USER","238","2015-07-02 19:33:14","1","2015-07-02 19:33:14","1");
INSERT INTO schokolat_userroles VALUES("1689","TEAM","238","2015-07-02 19:33:14","1","2015-07-02 19:33:14","1");
INSERT INTO schokolat_userroles VALUES("1690","PUBLIC","239","2015-07-20 19:35:51","1","2015-07-20 19:35:51","1");
INSERT INTO schokolat_userroles VALUES("1691","USER","239","2015-07-20 19:35:51","1","2015-07-20 19:35:51","1");
INSERT INTO schokolat_userroles VALUES("1692","PUBLIC","240","2015-07-20 19:36:24","1","2015-07-20 19:36:24","1");
INSERT INTO schokolat_userroles VALUES("1693","USER","240","2015-07-20 19:36:24","1","2015-07-20 19:36:24","1");
INSERT INTO schokolat_userroles VALUES("1694","PUBLIC","241","2015-07-20 19:37:07","1","2015-07-20 19:37:07","1");
INSERT INTO schokolat_userroles VALUES("1695","USER","241","2015-07-20 19:37:07","1","2015-07-20 19:37:07","1");
INSERT INTO schokolat_userroles VALUES("1696","PUBLIC","242","2015-08-21 14:54:50","1","2015-08-21 14:54:50","1");
INSERT INTO schokolat_userroles VALUES("1697","USER","242","2015-08-21 14:54:50","1","2015-08-21 14:54:50","1");
INSERT INTO schokolat_userroles VALUES("1698","PUBLIC","243","2015-08-21 15:03:05","1","2015-08-21 15:03:05","1");
INSERT INTO schokolat_userroles VALUES("1699","USER","243","2015-08-21 15:03:05","1","2015-08-21 15:03:05","1");
INSERT INTO schokolat_userroles VALUES("1700","PUBLIC","244","2015-08-21 18:23:20","1","2015-08-21 18:23:20","1");
INSERT INTO schokolat_userroles VALUES("1701","USER","244","2015-08-21 18:23:20","1","2015-08-21 18:23:20","1");
INSERT INTO schokolat_userroles VALUES("1702","PUBLIC","245","2015-08-26 10:40:39","1","2015-08-26 10:40:39","1");
INSERT INTO schokolat_userroles VALUES("1703","USER","245","2015-08-26 10:40:39","1","2015-08-26 10:40:39","1");
INSERT INTO schokolat_userroles VALUES("1704","PUBLIC","246","2015-08-26 10:43:43","1","2015-08-26 10:43:43","1");
INSERT INTO schokolat_userroles VALUES("1705","USER","246","2015-08-26 10:43:43","1","2015-08-26 10:43:43","1");
INSERT INTO schokolat_userroles VALUES("1706","PUBLIC","247","2015-08-27 07:31:44","1","2015-08-27 07:31:44","1");
INSERT INTO schokolat_userroles VALUES("1707","USER","247","2015-08-27 07:31:44","1","2015-08-27 07:31:44","1");
INSERT INTO schokolat_userroles VALUES("1708","PUBLIC","248","2015-08-27 07:36:31","1","2015-08-27 07:36:31","1");
INSERT INTO schokolat_userroles VALUES("1709","USER","248","2015-08-27 07:36:31","1","2015-08-27 07:36:31","1");
INSERT INTO schokolat_userroles VALUES("1710","PUBLIC","249","2015-08-27 07:38:43","1","2015-08-27 07:38:43","1");
INSERT INTO schokolat_userroles VALUES("1711","USER","249","2015-08-27 07:38:43","1","2015-08-27 07:38:43","1");
INSERT INTO schokolat_userroles VALUES("1712","PUBLIC","250","2015-08-27 07:40:07","1","2015-08-27 07:40:07","1");
INSERT INTO schokolat_userroles VALUES("1713","USER","250","2015-08-27 07:40:07","1","2015-08-27 07:40:07","1");
INSERT INTO schokolat_userroles VALUES("1714","PUBLIC","251","2015-08-27 07:41:04","1","2015-08-27 07:41:04","1");
INSERT INTO schokolat_userroles VALUES("1715","USER","251","2015-08-27 07:41:04","1","2015-08-27 07:41:04","1");
INSERT INTO schokolat_userroles VALUES("1716","PUBLIC","252","2015-08-27 07:42:10","1","2015-08-27 07:42:10","1");
INSERT INTO schokolat_userroles VALUES("1717","USER","252","2015-08-27 07:42:10","1","2015-08-27 07:42:10","1");
INSERT INTO schokolat_userroles VALUES("1718","PUBLIC","253","2015-08-27 07:44:06","1","2015-08-27 07:44:06","1");
INSERT INTO schokolat_userroles VALUES("1719","USER","253","2015-08-27 07:44:06","1","2015-08-27 07:44:06","1");
INSERT INTO schokolat_userroles VALUES("1720","PUBLIC","254","2015-08-27 07:45:13","1","2015-08-27 07:45:13","1");
INSERT INTO schokolat_userroles VALUES("1721","USER","254","2015-08-27 07:45:13","1","2015-08-27 07:45:13","1");
INSERT INTO schokolat_userroles VALUES("1722","PUBLIC","255","2015-08-27 07:46:17","1","2015-08-27 07:46:17","1");
INSERT INTO schokolat_userroles VALUES("1723","USER","255","2015-08-27 07:46:17","1","2015-08-27 07:46:17","1");
INSERT INTO schokolat_userroles VALUES("1724","PUBLIC","256","2015-08-27 07:47:17","1","2015-08-27 07:47:17","1");
INSERT INTO schokolat_userroles VALUES("1725","USER","256","2015-08-27 07:47:17","1","2015-08-27 07:47:17","1");
INSERT INTO schokolat_userroles VALUES("1726","PUBLIC","257","2015-08-27 07:48:43","1","2015-08-27 07:48:43","1");
INSERT INTO schokolat_userroles VALUES("1727","USER","257","2015-08-27 07:48:43","1","2015-08-27 07:48:43","1");
INSERT INTO schokolat_userroles VALUES("1728","PUBLIC","258","2015-08-27 07:50:00","1","2015-08-27 07:50:00","1");
INSERT INTO schokolat_userroles VALUES("1729","USER","258","2015-08-27 07:50:00","1","2015-08-27 07:50:00","1");
INSERT INTO schokolat_userroles VALUES("1730","PUBLIC","259","2015-08-27 07:52:01","1","2015-08-27 07:52:01","1");
INSERT INTO schokolat_userroles VALUES("1731","USER","259","2015-08-27 07:52:01","1","2015-08-27 07:52:01","1");
INSERT INTO schokolat_userroles VALUES("1732","PUBLIC","260","2015-08-27 07:53:29","1","2015-08-27 07:53:29","1");
INSERT INTO schokolat_userroles VALUES("1733","USER","260","2015-08-27 07:53:29","1","2015-08-27 07:53:29","1");
INSERT INTO schokolat_userroles VALUES("1740","PUBLIC","262","2015-11-02 08:06:00","1","2015-11-02 08:06:00","1");
INSERT INTO schokolat_userroles VALUES("1748","FORECASTALERT","256","2015-11-04 10:27:24","1","2015-11-04 10:27:24","1");
INSERT INTO schokolat_userroles VALUES("1737","PUBLIC","261","2015-10-28 09:28:16","1","2015-10-28 09:28:16","1");
INSERT INTO schokolat_userroles VALUES("1738","USER","261","2015-10-28 09:28:16","1","2015-10-28 09:28:16","1");
INSERT INTO schokolat_userroles VALUES("1741","USER","262","2015-11-02 08:06:00","1","2015-11-02 08:06:00","1");
INSERT INTO schokolat_userroles VALUES("1742","PUBLIC","263","2015-11-04 10:25:00","1","2015-11-04 10:25:00","1");
INSERT INTO schokolat_userroles VALUES("1743","USER","263","2015-11-04 10:25:00","1","2015-11-04 10:25:00","1");
INSERT INTO schokolat_userroles VALUES("1744","PUBLIC","264","2015-11-04 10:26:47","1","2015-11-04 10:26:47","1");
INSERT INTO schokolat_userroles VALUES("1745","USER","264","2015-11-04 10:26:47","1","2015-11-04 10:26:47","1");
INSERT INTO schokolat_userroles VALUES("1746","PUBLIC","265","2015-11-04 10:26:49","1","2015-11-04 10:26:49","1");
INSERT INTO schokolat_userroles VALUES("1747","USER","265","2015-11-04 10:26:49","1","2015-11-04 10:26:49","1");
INSERT INTO schokolat_userroles VALUES("1749","FORECASTALERT","265","2015-11-04 10:27:24","1","2015-11-04 10:27:24","1");
INSERT INTO schokolat_userroles VALUES("1750","FORECASTALERT","263","2015-11-04 10:27:24","1","2015-11-04 10:27:24","1");



DROP TABLE trianik_absence;

CREATE TABLE `trianik_absence` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `absencetype` varchar(20) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `startdate` date NOT NULL,
  `requesteddate` date NOT NULL,
  `enddate` date NOT NULL,
  `daystaken` float DEFAULT NULL,
  `reason` text,
  `enddate_half` int(11) DEFAULT NULL,
  `startdate_half` int(11) DEFAULT NULL,
  `metacreateddate` date DEFAULT NULL,
  `metamodifieddate` date DEFAULT NULL,
  `metacreateduserid` int(11) DEFAULT NULL,
  `metamodifieduserid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;




DROP TABLE trianik_applicationactionroles;

CREATE TABLE `trianik_applicationactionroles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `actionid` int(11) DEFAULT NULL,
  `roleid` varchar(20) NOT NULL,
  `metacreateddate` datetime NOT NULL,
  `metacreateduserid` int(11) NOT NULL,
  `metamodifieddate` datetime NOT NULL,
  `metamodifieduserid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1069 DEFAULT CHARSET=latin1;

INSERT INTO trianik_applicationactionroles VALUES("699","510","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("698","509","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("697","508","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("696","507","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("695","506","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("694","505","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("693","504","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("692","503","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("691","502","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("690","501","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("689","500","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("688","499","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("687","498","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("686","497","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("685","496","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("684","495","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("683","494","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("682","493","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("681","492","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("680","491","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("679","490","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("678","489","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("677","488","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("676","487","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("675","486","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("674","485","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("673","484","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("672","483","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("671","482","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("670","481","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("669","480","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("668","479","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("667","478","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("666","477","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("665","476","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("664","475","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("663","474","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("662","473","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("661","472","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("660","471","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("659","470","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("658","469","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("657","468","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("656","467","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("655","466","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("654","465","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("653","464","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("652","463","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("651","462","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("650","461","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("649","460","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("648","459","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("647","458","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("646","457","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("645","456","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("644","455","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("643","454","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("642","453","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("641","452","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("640","451","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("639","450","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("638","449","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("637","448","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("636","447","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("635","446","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("634","445","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("633","444","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("632","443","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("631","442","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("630","441","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("629","440","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("628","439","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("627","438","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("626","437","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("625","436","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("624","435","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("623","434","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("622","433","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("700","511","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("701","512","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("702","513","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("703","514","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("704","515","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("705","516","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("706","517","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("707","518","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("708","519","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("709","520","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("710","521","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("711","522","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("712","523","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("713","524","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("714","525","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("715","526","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("716","527","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("717","528","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("718","529","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("719","530","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("720","531","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("721","532","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("722","533","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("723","534","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("724","535","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("725","536","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("726","537","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("727","538","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("728","539","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("729","540","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("730","541","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("731","542","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("732","543","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("733","544","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("734","545","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("735","546","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("736","547","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("737","548","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("738","549","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("739","550","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("740","551","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("741","552","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("742","553","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("743","554","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("744","555","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("745","556","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("746","557","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("747","558","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("748","559","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("749","560","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("750","561","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("751","562","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("752","563","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("753","564","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("754","565","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("755","566","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("756","567","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("757","568","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("758","569","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("759","570","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("760","571","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("761","572","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("762","573","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("763","574","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("764","575","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("765","576","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("766","577","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("767","578","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("768","579","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("769","580","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("770","581","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("771","582","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("772","583","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactionroles VALUES("773","584","PUBLIC","2014-02-17 10:04:39","1","2014-02-17 10:04:39","1");
INSERT INTO trianik_applicationactionroles VALUES("774","585","PUBLIC","2014-02-17 10:04:39","1","2014-02-17 10:04:39","1");
INSERT INTO trianik_applicationactionroles VALUES("775","586","PUBLIC","2014-02-17 10:04:39","1","2014-02-17 10:04:39","1");
INSERT INTO trianik_applicationactionroles VALUES("776","587","PUBLIC","2014-02-20 18:19:35","1","2014-02-20 18:19:35","1");
INSERT INTO trianik_applicationactionroles VALUES("777","588","PUBLIC","2014-02-20 18:19:35","1","2014-02-20 18:19:35","1");
INSERT INTO trianik_applicationactionroles VALUES("778","589","PUBLIC","2014-02-20 18:19:35","1","2014-02-20 18:19:35","1");
INSERT INTO trianik_applicationactionroles VALUES("779","590","PUBLIC","2014-02-20 18:19:35","1","2014-02-20 18:19:35","1");
INSERT INTO trianik_applicationactionroles VALUES("780","591","PUBLIC","2014-02-20 18:19:35","1","2014-02-20 18:19:35","1");
INSERT INTO trianik_applicationactionroles VALUES("781","592","PUBLIC","2014-02-20 18:19:35","1","2014-02-20 18:19:35","1");
INSERT INTO trianik_applicationactionroles VALUES("782","593","PUBLIC","2014-02-20 18:19:35","1","2014-02-20 18:19:35","1");
INSERT INTO trianik_applicationactionroles VALUES("783","594","PUBLIC","2014-02-20 18:19:35","1","2014-02-20 18:19:35","1");
INSERT INTO trianik_applicationactionroles VALUES("784","595","PUBLIC","2014-02-20 18:19:35","1","2014-02-20 18:19:35","1");
INSERT INTO trianik_applicationactionroles VALUES("785","596","PUBLIC","2014-03-24 10:52:42","1","2014-03-24 10:52:42","1");
INSERT INTO trianik_applicationactionroles VALUES("786","597","PUBLIC","2014-03-24 10:52:42","1","2014-03-24 10:52:42","1");
INSERT INTO trianik_applicationactionroles VALUES("787","598","PUBLIC","2014-03-24 10:52:42","1","2014-03-24 10:52:42","1");
INSERT INTO trianik_applicationactionroles VALUES("788","599","PUBLIC","2014-03-24 10:52:42","1","2014-03-24 10:52:42","1");
INSERT INTO trianik_applicationactionroles VALUES("789","600","PUBLIC","2014-03-24 10:52:42","1","2014-03-24 10:52:42","1");
INSERT INTO trianik_applicationactionroles VALUES("790","601","PUBLIC","2014-03-31 14:14:13","1","2014-03-31 14:14:13","1");
INSERT INTO trianik_applicationactionroles VALUES("791","602","PUBLIC","2014-04-04 15:46:57","1","2014-04-04 15:46:57","1");
INSERT INTO trianik_applicationactionroles VALUES("792","603","PUBLIC","2014-05-13 17:42:51","1","2014-05-13 17:42:51","1");
INSERT INTO trianik_applicationactionroles VALUES("793","604","PUBLIC","2014-05-14 13:37:14","1","2014-05-14 13:37:14","1");
INSERT INTO trianik_applicationactionroles VALUES("794","605","PUBLIC","2014-05-14 13:37:14","1","2014-05-14 13:37:14","1");
INSERT INTO trianik_applicationactionroles VALUES("795","606","PUBLIC","2014-05-14 13:37:14","1","2014-05-14 13:37:14","1");
INSERT INTO trianik_applicationactionroles VALUES("796","607","PUBLIC","2014-05-14 13:37:14","1","2014-05-14 13:37:14","1");
INSERT INTO trianik_applicationactionroles VALUES("797","608","PUBLIC","2014-05-14 13:37:14","1","2014-05-14 13:37:14","1");
INSERT INTO trianik_applicationactionroles VALUES("798","609","PUBLIC","2014-05-19 12:49:43","1","2014-05-19 12:49:43","1");
INSERT INTO trianik_applicationactionroles VALUES("799","610","PUBLIC","2014-09-04 10:08:59","1","2014-09-04 10:08:59","1");
INSERT INTO trianik_applicationactionroles VALUES("800","611","PUBLIC","2014-10-09 19:56:41","1","2014-10-09 19:56:41","1");
INSERT INTO trianik_applicationactionroles VALUES("801","612","PUBLIC","2014-10-09 19:56:41","1","2014-10-09 19:56:41","1");
INSERT INTO trianik_applicationactionroles VALUES("802","613","PUBLIC","2014-10-09 19:56:41","1","2014-10-09 19:56:41","1");
INSERT INTO trianik_applicationactionroles VALUES("803","614","PUBLIC","2014-10-09 19:56:41","1","2014-10-09 19:56:41","1");
INSERT INTO trianik_applicationactionroles VALUES("804","615","PUBLIC","2014-10-09 19:56:41","1","2014-10-09 19:56:41","1");
INSERT INTO trianik_applicationactionroles VALUES("805","616","PUBLIC","2014-10-09 19:56:41","1","2014-10-09 19:56:41","1");
INSERT INTO trianik_applicationactionroles VALUES("806","617","PUBLIC","2014-10-09 19:56:41","1","2014-10-09 19:56:41","1");
INSERT INTO trianik_applicationactionroles VALUES("807","618","PUBLIC","2014-10-09 20:11:08","1","2014-10-09 20:11:08","1");
INSERT INTO trianik_applicationactionroles VALUES("808","619","PUBLIC","2014-10-09 20:11:08","1","2014-10-09 20:11:08","1");
INSERT INTO trianik_applicationactionroles VALUES("809","620","PUBLIC","2014-10-09 20:11:08","1","2014-10-09 20:11:08","1");
INSERT INTO trianik_applicationactionroles VALUES("810","621","PUBLIC","2014-10-09 20:11:08","1","2014-10-09 20:11:08","1");
INSERT INTO trianik_applicationactionroles VALUES("811","622","PUBLIC","2014-10-09 20:11:08","1","2014-10-09 20:11:08","1");
INSERT INTO trianik_applicationactionroles VALUES("812","623","PUBLIC","2014-10-10 22:40:08","1","2014-10-10 22:40:08","1");
INSERT INTO trianik_applicationactionroles VALUES("813","624","PUBLIC","2014-10-10 22:40:08","1","2014-10-10 22:40:08","1");
INSERT INTO trianik_applicationactionroles VALUES("814","625","PUBLIC","2014-10-10 22:40:08","1","2014-10-10 22:40:08","1");
INSERT INTO trianik_applicationactionroles VALUES("815","626","PUBLIC","2014-10-10 22:40:08","1","2014-10-10 22:40:08","1");
INSERT INTO trianik_applicationactionroles VALUES("816","627","PUBLIC","2014-10-10 22:40:08","1","2014-10-10 22:40:08","1");
INSERT INTO trianik_applicationactionroles VALUES("817","628","PUBLIC","2014-10-10 22:40:08","1","2014-10-10 22:40:08","1");
INSERT INTO trianik_applicationactionroles VALUES("818","629","PUBLIC","2014-10-10 22:40:08","1","2014-10-10 22:40:08","1");
INSERT INTO trianik_applicationactionroles VALUES("819","630","PUBLIC","2014-10-10 22:52:43","1","2014-10-10 22:52:43","1");
INSERT INTO trianik_applicationactionroles VALUES("820","631","PUBLIC","2014-10-10 22:52:43","1","2014-10-10 22:52:43","1");
INSERT INTO trianik_applicationactionroles VALUES("821","632","PUBLIC","2014-10-10 22:52:43","1","2014-10-10 22:52:43","1");
INSERT INTO trianik_applicationactionroles VALUES("822","633","PUBLIC","2014-10-10 22:53:13","1","2014-10-10 22:53:13","1");
INSERT INTO trianik_applicationactionroles VALUES("823","634","PUBLIC","2014-10-10 22:53:13","1","2014-10-10 22:53:13","1");
INSERT INTO trianik_applicationactionroles VALUES("824","635","PUBLIC","2014-10-10 22:53:13","1","2014-10-10 22:53:13","1");
INSERT INTO trianik_applicationactionroles VALUES("825","636","PUBLIC","2014-10-10 22:53:13","1","2014-10-10 22:53:13","1");
INSERT INTO trianik_applicationactionroles VALUES("826","637","PUBLIC","2014-10-11 13:29:36","1","2014-10-11 13:29:36","1");
INSERT INTO trianik_applicationactionroles VALUES("827","638","PUBLIC","2014-10-11 13:29:36","1","2014-10-11 13:29:36","1");
INSERT INTO trianik_applicationactionroles VALUES("828","639","PUBLIC","2014-10-11 13:29:36","1","2014-10-11 13:29:36","1");
INSERT INTO trianik_applicationactionroles VALUES("829","640","PUBLIC","2014-10-11 13:29:36","1","2014-10-11 13:29:36","1");
INSERT INTO trianik_applicationactionroles VALUES("830","641","PUBLIC","2014-10-11 13:29:36","1","2014-10-11 13:29:36","1");
INSERT INTO trianik_applicationactionroles VALUES("831","642","PUBLIC","2014-10-11 13:29:36","1","2014-10-11 13:29:36","1");
INSERT INTO trianik_applicationactionroles VALUES("832","643","PUBLIC","2014-10-11 13:29:36","1","2014-10-11 13:29:36","1");
INSERT INTO trianik_applicationactionroles VALUES("833","644","PUBLIC","2014-10-11 13:32:00","1","2014-10-11 13:32:00","1");
INSERT INTO trianik_applicationactionroles VALUES("834","645","PUBLIC","2014-10-11 13:32:00","1","2014-10-11 13:32:00","1");
INSERT INTO trianik_applicationactionroles VALUES("835","646","PUBLIC","2014-10-11 13:32:00","1","2014-10-11 13:32:00","1");
INSERT INTO trianik_applicationactionroles VALUES("836","647","PUBLIC","2014-10-11 13:32:00","1","2014-10-11 13:32:00","1");
INSERT INTO trianik_applicationactionroles VALUES("837","648","PUBLIC","2014-10-11 13:32:00","1","2014-10-11 13:32:00","1");
INSERT INTO trianik_applicationactionroles VALUES("838","649","PUBLIC","2014-10-11 13:32:00","1","2014-10-11 13:32:00","1");
INSERT INTO trianik_applicationactionroles VALUES("839","650","PUBLIC","2014-10-11 14:04:23","1","2014-10-11 14:04:23","1");
INSERT INTO trianik_applicationactionroles VALUES("840","651","PUBLIC","2014-10-11 14:04:23","1","2014-10-11 14:04:23","1");
INSERT INTO trianik_applicationactionroles VALUES("841","652","PUBLIC","2014-10-11 14:04:23","1","2014-10-11 14:04:23","1");
INSERT INTO trianik_applicationactionroles VALUES("842","653","PUBLIC","2014-10-11 14:04:23","1","2014-10-11 14:04:23","1");
INSERT INTO trianik_applicationactionroles VALUES("843","654","PUBLIC","2014-10-11 14:04:23","1","2014-10-11 14:04:23","1");
INSERT INTO trianik_applicationactionroles VALUES("844","655","PUBLIC","2014-10-11 14:04:23","1","2014-10-11 14:04:23","1");
INSERT INTO trianik_applicationactionroles VALUES("845","656","PUBLIC","2014-10-11 14:06:14","1","2014-10-11 14:06:14","1");
INSERT INTO trianik_applicationactionroles VALUES("846","657","PUBLIC","2014-10-11 14:06:14","1","2014-10-11 14:06:14","1");
INSERT INTO trianik_applicationactionroles VALUES("847","658","PUBLIC","2014-10-11 14:06:14","1","2014-10-11 14:06:14","1");
INSERT INTO trianik_applicationactionroles VALUES("848","659","PUBLIC","2014-10-11 14:06:14","1","2014-10-11 14:06:14","1");
INSERT INTO trianik_applicationactionroles VALUES("849","660","PUBLIC","2014-10-11 14:06:14","1","2014-10-11 14:06:14","1");
INSERT INTO trianik_applicationactionroles VALUES("850","661","PUBLIC","2014-10-13 20:52:27","1","2014-10-13 20:52:27","1");
INSERT INTO trianik_applicationactionroles VALUES("851","662","PUBLIC","2014-10-26 21:38:04","1","2014-10-26 21:38:04","1");
INSERT INTO trianik_applicationactionroles VALUES("852","663","PUBLIC","2014-10-26 21:38:04","1","2014-10-26 21:38:04","1");
INSERT INTO trianik_applicationactionroles VALUES("853","664","PUBLIC","2014-10-26 21:38:04","1","2014-10-26 21:38:04","1");
INSERT INTO trianik_applicationactionroles VALUES("854","665","PUBLIC","2014-10-26 21:38:04","1","2014-10-26 21:38:04","1");
INSERT INTO trianik_applicationactionroles VALUES("855","666","PUBLIC","2014-10-26 21:38:04","1","2014-10-26 21:38:04","1");
INSERT INTO trianik_applicationactionroles VALUES("856","667","PUBLIC","2014-10-26 21:38:04","1","2014-10-26 21:38:04","1");
INSERT INTO trianik_applicationactionroles VALUES("857","668","PUBLIC","2014-11-29 17:07:31","1","2014-11-29 17:07:31","1");
INSERT INTO trianik_applicationactionroles VALUES("858","669","PUBLIC","2014-11-29 17:07:31","1","2014-11-29 17:07:31","1");
INSERT INTO trianik_applicationactionroles VALUES("859","670","PUBLIC","2014-11-29 17:07:31","1","2014-11-29 17:07:31","1");
INSERT INTO trianik_applicationactionroles VALUES("860","671","PUBLIC","2014-11-29 17:07:31","1","2014-11-29 17:07:31","1");
INSERT INTO trianik_applicationactionroles VALUES("861","672","PUBLIC","2014-11-29 17:07:31","1","2014-11-29 17:07:31","1");
INSERT INTO trianik_applicationactionroles VALUES("862","673","PUBLIC","2014-11-29 17:07:31","1","2014-11-29 17:07:31","1");
INSERT INTO trianik_applicationactionroles VALUES("863","674","PUBLIC","2014-11-29 17:10:44","1","2014-11-29 17:10:44","1");
INSERT INTO trianik_applicationactionroles VALUES("864","675","PUBLIC","2014-11-30 15:42:41","1","2014-11-30 15:42:41","1");
INSERT INTO trianik_applicationactionroles VALUES("865","676","PUBLIC","2014-11-30 15:42:41","1","2014-11-30 15:42:41","1");
INSERT INTO trianik_applicationactionroles VALUES("866","677","PUBLIC","2014-11-30 15:42:41","1","2014-11-30 15:42:41","1");
INSERT INTO trianik_applicationactionroles VALUES("867","678","PUBLIC","2014-11-30 15:42:41","1","2014-11-30 15:42:41","1");
INSERT INTO trianik_applicationactionroles VALUES("868","679","PUBLIC","2014-11-30 15:42:41","1","2014-11-30 15:42:41","1");
INSERT INTO trianik_applicationactionroles VALUES("869","680","PUBLIC","2014-11-30 21:37:50","1","2014-11-30 21:37:50","1");
INSERT INTO trianik_applicationactionroles VALUES("870","681","PUBLIC","2014-11-30 22:08:03","1","2014-11-30 22:08:03","1");
INSERT INTO trianik_applicationactionroles VALUES("871","682","PUBLIC","2014-12-07 18:49:21","1","2014-12-07 18:49:21","1");
INSERT INTO trianik_applicationactionroles VALUES("872","683","PUBLIC","2014-12-07 18:49:21","1","2014-12-07 18:49:21","1");
INSERT INTO trianik_applicationactionroles VALUES("873","684","PUBLIC","2014-12-07 18:49:21","1","2014-12-07 18:49:21","1");
INSERT INTO trianik_applicationactionroles VALUES("874","685","PUBLIC","2014-12-07 18:49:21","1","2014-12-07 18:49:21","1");
INSERT INTO trianik_applicationactionroles VALUES("875","686","PUBLIC","2014-12-07 18:49:21","1","2014-12-07 18:49:21","1");
INSERT INTO trianik_applicationactionroles VALUES("876","687","PUBLIC","2014-12-07 19:05:23","1","2014-12-07 19:05:23","1");
INSERT INTO trianik_applicationactionroles VALUES("877","688","PUBLIC","2014-12-07 19:05:23","1","2014-12-07 19:05:23","1");
INSERT INTO trianik_applicationactionroles VALUES("878","689","PUBLIC","2014-12-07 19:05:23","1","2014-12-07 19:05:23","1");
INSERT INTO trianik_applicationactionroles VALUES("879","690","PUBLIC","2014-12-07 19:05:23","1","2014-12-07 19:05:23","1");
INSERT INTO trianik_applicationactionroles VALUES("880","691","PUBLIC","2014-12-07 19:05:23","1","2014-12-07 19:05:23","1");
INSERT INTO trianik_applicationactionroles VALUES("881","692","PUBLIC","2014-12-07 19:14:20","1","2014-12-07 19:14:20","1");
INSERT INTO trianik_applicationactionroles VALUES("882","693","PUBLIC","2014-12-07 19:14:20","1","2014-12-07 19:14:20","1");
INSERT INTO trianik_applicationactionroles VALUES("883","694","PUBLIC","2014-12-07 19:14:20","1","2014-12-07 19:14:20","1");
INSERT INTO trianik_applicationactionroles VALUES("884","695","PUBLIC","2014-12-07 19:14:20","1","2014-12-07 19:14:20","1");
INSERT INTO trianik_applicationactionroles VALUES("885","696","PUBLIC","2014-12-07 19:14:20","1","2014-12-07 19:14:20","1");
INSERT INTO trianik_applicationactionroles VALUES("886","697","PUBLIC","2014-12-09 20:15:21","1","2014-12-09 20:15:21","1");
INSERT INTO trianik_applicationactionroles VALUES("887","698","PUBLIC","2014-12-09 20:15:21","1","2014-12-09 20:15:21","1");
INSERT INTO trianik_applicationactionroles VALUES("888","699","PUBLIC","2014-12-09 20:15:21","1","2014-12-09 20:15:21","1");
INSERT INTO trianik_applicationactionroles VALUES("889","700","PUBLIC","2014-12-09 20:15:21","1","2014-12-09 20:15:21","1");
INSERT INTO trianik_applicationactionroles VALUES("890","701","PUBLIC","2014-12-09 20:15:21","1","2014-12-09 20:15:21","1");
INSERT INTO trianik_applicationactionroles VALUES("891","702","PUBLIC","2014-12-18 14:13:35","1","2014-12-18 14:13:35","1");
INSERT INTO trianik_applicationactionroles VALUES("892","703","PUBLIC","2014-12-18 14:13:35","1","2014-12-18 14:13:35","1");
INSERT INTO trianik_applicationactionroles VALUES("893","704","PUBLIC","2014-12-18 14:13:35","1","2014-12-18 14:13:35","1");
INSERT INTO trianik_applicationactionroles VALUES("894","705","PUBLIC","2014-12-18 14:13:35","1","2014-12-18 14:13:35","1");
INSERT INTO trianik_applicationactionroles VALUES("895","706","PUBLIC","2014-12-18 14:13:35","1","2014-12-18 14:13:35","1");
INSERT INTO trianik_applicationactionroles VALUES("896","707","PUBLIC","2014-12-18 15:44:56","1","2014-12-18 15:44:56","1");
INSERT INTO trianik_applicationactionroles VALUES("897","708","PUBLIC","2014-12-18 15:44:56","1","2014-12-18 15:44:56","1");
INSERT INTO trianik_applicationactionroles VALUES("898","709","PUBLIC","2014-12-18 15:44:56","1","2014-12-18 15:44:56","1");
INSERT INTO trianik_applicationactionroles VALUES("899","710","PUBLIC","2014-12-18 15:44:56","1","2014-12-18 15:44:56","1");
INSERT INTO trianik_applicationactionroles VALUES("900","711","PUBLIC","2014-12-18 15:44:56","1","2014-12-18 15:44:56","1");
INSERT INTO trianik_applicationactionroles VALUES("901","712","PUBLIC","2014-12-19 12:26:09","1","2014-12-19 12:26:09","1");
INSERT INTO trianik_applicationactionroles VALUES("902","713","PUBLIC","2014-12-19 12:26:09","1","2014-12-19 12:26:09","1");
INSERT INTO trianik_applicationactionroles VALUES("903","714","PUBLIC","2014-12-19 12:26:09","1","2014-12-19 12:26:09","1");
INSERT INTO trianik_applicationactionroles VALUES("904","715","PUBLIC","2014-12-19 12:26:09","1","2014-12-19 12:26:09","1");
INSERT INTO trianik_applicationactionroles VALUES("905","716","PUBLIC","2014-12-19 12:26:09","1","2014-12-19 12:26:09","1");
INSERT INTO trianik_applicationactionroles VALUES("906","717","PUBLIC","2014-12-19 15:12:39","1","2014-12-19 15:12:39","1");
INSERT INTO trianik_applicationactionroles VALUES("907","718","PUBLIC","2014-12-19 15:12:39","1","2014-12-19 15:12:39","1");
INSERT INTO trianik_applicationactionroles VALUES("908","719","PUBLIC","2014-12-19 15:12:39","1","2014-12-19 15:12:39","1");
INSERT INTO trianik_applicationactionroles VALUES("909","720","PUBLIC","2014-12-19 15:12:39","1","2014-12-19 15:12:39","1");
INSERT INTO trianik_applicationactionroles VALUES("910","721","PUBLIC","2014-12-19 15:12:39","1","2014-12-19 15:12:39","1");
INSERT INTO trianik_applicationactionroles VALUES("911","722","PUBLIC","2014-12-19 15:13:34","1","2014-12-19 15:13:34","1");
INSERT INTO trianik_applicationactionroles VALUES("912","723","PUBLIC","2014-12-19 15:13:34","1","2014-12-19 15:13:34","1");
INSERT INTO trianik_applicationactionroles VALUES("913","724","PUBLIC","2014-12-19 15:13:34","1","2014-12-19 15:13:34","1");
INSERT INTO trianik_applicationactionroles VALUES("914","725","PUBLIC","2014-12-19 15:13:34","1","2014-12-19 15:13:34","1");
INSERT INTO trianik_applicationactionroles VALUES("915","726","PUBLIC","2014-12-19 15:13:34","1","2014-12-19 15:13:34","1");
INSERT INTO trianik_applicationactionroles VALUES("916","727","PUBLIC","2014-12-21 13:23:44","1","2014-12-21 13:23:44","1");
INSERT INTO trianik_applicationactionroles VALUES("917","728","PUBLIC","2014-12-21 13:23:44","1","2014-12-21 13:23:44","1");
INSERT INTO trianik_applicationactionroles VALUES("918","729","PUBLIC","2014-12-21 13:23:44","1","2014-12-21 13:23:44","1");
INSERT INTO trianik_applicationactionroles VALUES("919","730","PUBLIC","2014-12-21 13:23:44","1","2014-12-21 13:23:44","1");
INSERT INTO trianik_applicationactionroles VALUES("920","731","PUBLIC","2014-12-21 13:23:44","1","2014-12-21 13:23:44","1");
INSERT INTO trianik_applicationactionroles VALUES("921","732","PUBLIC","2014-12-21 21:00:52","1","2014-12-21 21:00:52","1");
INSERT INTO trianik_applicationactionroles VALUES("922","733","PUBLIC","2014-12-21 21:00:52","1","2014-12-21 21:00:52","1");
INSERT INTO trianik_applicationactionroles VALUES("923","734","PUBLIC","2014-12-21 21:00:52","1","2014-12-21 21:00:52","1");
INSERT INTO trianik_applicationactionroles VALUES("924","735","PUBLIC","2014-12-21 21:00:52","1","2014-12-21 21:00:52","1");
INSERT INTO trianik_applicationactionroles VALUES("925","736","PUBLIC","2014-12-21 21:00:52","1","2014-12-21 21:00:52","1");
INSERT INTO trianik_applicationactionroles VALUES("926","737","PUBLIC","2014-12-21 21:01:54","1","2014-12-21 21:01:54","1");
INSERT INTO trianik_applicationactionroles VALUES("927","738","PUBLIC","2014-12-21 21:01:54","1","2014-12-21 21:01:54","1");
INSERT INTO trianik_applicationactionroles VALUES("928","739","PUBLIC","2014-12-21 21:01:54","1","2014-12-21 21:01:54","1");
INSERT INTO trianik_applicationactionroles VALUES("929","740","PUBLIC","2014-12-21 21:01:54","1","2014-12-21 21:01:54","1");
INSERT INTO trianik_applicationactionroles VALUES("930","741","PUBLIC","2014-12-21 21:01:54","1","2014-12-21 21:01:54","1");
INSERT INTO trianik_applicationactionroles VALUES("931","742","PUBLIC","2014-12-21 22:20:41","1","2014-12-21 22:20:41","1");
INSERT INTO trianik_applicationactionroles VALUES("932","743","PUBLIC","2014-12-21 22:20:41","1","2014-12-21 22:20:41","1");
INSERT INTO trianik_applicationactionroles VALUES("933","744","PUBLIC","2014-12-21 22:20:41","1","2014-12-21 22:20:41","1");
INSERT INTO trianik_applicationactionroles VALUES("934","745","PUBLIC","2014-12-21 22:20:41","1","2014-12-21 22:20:41","1");
INSERT INTO trianik_applicationactionroles VALUES("935","746","PUBLIC","2014-12-21 22:20:41","1","2014-12-21 22:20:41","1");
INSERT INTO trianik_applicationactionroles VALUES("936","747","PUBLIC","2014-12-21 22:30:08","1","2014-12-21 22:30:08","1");
INSERT INTO trianik_applicationactionroles VALUES("937","748","PUBLIC","2014-12-21 22:30:08","1","2014-12-21 22:30:08","1");
INSERT INTO trianik_applicationactionroles VALUES("938","749","PUBLIC","2014-12-21 22:30:08","1","2014-12-21 22:30:08","1");
INSERT INTO trianik_applicationactionroles VALUES("939","750","PUBLIC","2014-12-21 22:30:08","1","2014-12-21 22:30:08","1");
INSERT INTO trianik_applicationactionroles VALUES("940","751","PUBLIC","2014-12-21 22:30:08","1","2014-12-21 22:30:08","1");
INSERT INTO trianik_applicationactionroles VALUES("941","752","PUBLIC","2014-12-22 13:30:40","1","2014-12-22 13:30:40","1");
INSERT INTO trianik_applicationactionroles VALUES("942","753","PUBLIC","2014-12-23 22:35:38","1","2014-12-23 22:35:38","1");
INSERT INTO trianik_applicationactionroles VALUES("943","754","PUBLIC","2014-12-23 22:35:38","1","2014-12-23 22:35:38","1");
INSERT INTO trianik_applicationactionroles VALUES("944","755","PUBLIC","2014-12-23 22:35:38","1","2014-12-23 22:35:38","1");
INSERT INTO trianik_applicationactionroles VALUES("945","756","PUBLIC","2014-12-23 22:35:38","1","2014-12-23 22:35:38","1");
INSERT INTO trianik_applicationactionroles VALUES("946","757","PUBLIC","2014-12-23 22:35:38","1","2014-12-23 22:35:38","1");
INSERT INTO trianik_applicationactionroles VALUES("947","758","PUBLIC","2014-12-23 22:37:02","1","2014-12-23 22:37:02","1");
INSERT INTO trianik_applicationactionroles VALUES("948","759","PUBLIC","2014-12-23 22:37:02","1","2014-12-23 22:37:02","1");
INSERT INTO trianik_applicationactionroles VALUES("949","760","PUBLIC","2014-12-23 22:37:02","1","2014-12-23 22:37:02","1");
INSERT INTO trianik_applicationactionroles VALUES("950","761","PUBLIC","2014-12-23 22:37:02","1","2014-12-23 22:37:02","1");
INSERT INTO trianik_applicationactionroles VALUES("951","762","PUBLIC","2014-12-23 22:37:02","1","2014-12-23 22:37:02","1");
INSERT INTO trianik_applicationactionroles VALUES("952","763","PUBLIC","2014-12-23 23:04:29","1","2014-12-23 23:04:29","1");
INSERT INTO trianik_applicationactionroles VALUES("953","764","PUBLIC","2014-12-23 23:04:29","1","2014-12-23 23:04:29","1");
INSERT INTO trianik_applicationactionroles VALUES("954","765","PUBLIC","2014-12-23 23:04:29","1","2014-12-23 23:04:29","1");
INSERT INTO trianik_applicationactionroles VALUES("955","766","PUBLIC","2014-12-23 23:04:29","1","2014-12-23 23:04:29","1");
INSERT INTO trianik_applicationactionroles VALUES("956","767","PUBLIC","2014-12-23 23:04:29","1","2014-12-23 23:04:29","1");
INSERT INTO trianik_applicationactionroles VALUES("957","768","PUBLIC","2014-12-23 23:04:29","1","2014-12-23 23:04:29","1");
INSERT INTO trianik_applicationactionroles VALUES("958","769","PUBLIC","2014-12-24 12:07:13","1","2014-12-24 12:07:13","1");
INSERT INTO trianik_applicationactionroles VALUES("959","770","PUBLIC","2014-12-24 12:07:13","1","2014-12-24 12:07:13","1");
INSERT INTO trianik_applicationactionroles VALUES("960","771","PUBLIC","2014-12-24 12:07:13","1","2014-12-24 12:07:13","1");
INSERT INTO trianik_applicationactionroles VALUES("961","772","PUBLIC","2014-12-24 12:07:13","1","2014-12-24 12:07:13","1");
INSERT INTO trianik_applicationactionroles VALUES("962","773","PUBLIC","2014-12-24 12:07:13","1","2014-12-24 12:07:13","1");
INSERT INTO trianik_applicationactionroles VALUES("963","774","PUBLIC","2014-12-24 12:07:13","1","2014-12-24 12:07:13","1");
INSERT INTO trianik_applicationactionroles VALUES("964","775","PUBLIC","2014-12-28 11:44:58","1","2014-12-28 11:44:58","1");
INSERT INTO trianik_applicationactionroles VALUES("965","776","PUBLIC","2014-12-28 11:44:58","1","2014-12-28 11:44:58","1");
INSERT INTO trianik_applicationactionroles VALUES("966","777","PUBLIC","2014-12-28 11:44:58","1","2014-12-28 11:44:58","1");
INSERT INTO trianik_applicationactionroles VALUES("967","778","PUBLIC","2014-12-28 11:44:58","1","2014-12-28 11:44:58","1");
INSERT INTO trianik_applicationactionroles VALUES("968","779","PUBLIC","2014-12-28 11:44:58","1","2014-12-28 11:44:58","1");
INSERT INTO trianik_applicationactionroles VALUES("969","780","PUBLIC","2014-12-28 11:44:58","1","2014-12-28 11:44:58","1");
INSERT INTO trianik_applicationactionroles VALUES("970","781","PUBLIC","2014-12-28 11:57:55","1","2014-12-28 11:57:55","1");
INSERT INTO trianik_applicationactionroles VALUES("971","782","PUBLIC","2015-01-02 13:06:35","1","2015-01-02 13:06:35","1");
INSERT INTO trianik_applicationactionroles VALUES("972","783","PUBLIC","2015-01-02 13:06:35","1","2015-01-02 13:06:35","1");
INSERT INTO trianik_applicationactionroles VALUES("973","784","PUBLIC","2015-01-02 13:06:35","1","2015-01-02 13:06:35","1");
INSERT INTO trianik_applicationactionroles VALUES("974","785","PUBLIC","2015-01-02 13:06:35","1","2015-01-02 13:06:35","1");
INSERT INTO trianik_applicationactionroles VALUES("975","786","PUBLIC","2015-01-02 13:06:35","1","2015-01-02 13:06:35","1");
INSERT INTO trianik_applicationactionroles VALUES("976","787","PUBLIC","2015-01-06 20:31:32","1","2015-01-06 20:31:32","1");
INSERT INTO trianik_applicationactionroles VALUES("977","788","PUBLIC","2015-01-10 21:56:44","1","2015-01-10 21:56:44","1");
INSERT INTO trianik_applicationactionroles VALUES("978","789","PUBLIC","2015-01-10 21:56:44","1","2015-01-10 21:56:44","1");
INSERT INTO trianik_applicationactionroles VALUES("979","790","PUBLIC","2015-01-10 21:56:44","1","2015-01-10 21:56:44","1");
INSERT INTO trianik_applicationactionroles VALUES("980","791","PUBLIC","2015-01-10 21:56:44","1","2015-01-10 21:56:44","1");
INSERT INTO trianik_applicationactionroles VALUES("981","792","PUBLIC","2015-01-10 21:56:44","1","2015-01-10 21:56:44","1");
INSERT INTO trianik_applicationactionroles VALUES("982","793","PUBLIC","2015-01-22 18:54:08","1","2015-01-22 18:54:08","1");
INSERT INTO trianik_applicationactionroles VALUES("983","794","PUBLIC","2015-06-13 16:08:48","1","2015-06-13 16:08:48","1");
INSERT INTO trianik_applicationactionroles VALUES("984","795","PUBLIC","2015-06-13 16:08:48","1","2015-06-13 16:08:48","1");
INSERT INTO trianik_applicationactionroles VALUES("985","796","PUBLIC","2015-06-13 16:08:48","1","2015-06-13 16:08:48","1");
INSERT INTO trianik_applicationactionroles VALUES("986","797","PUBLIC","2015-06-13 16:08:48","1","2015-06-13 16:08:48","1");
INSERT INTO trianik_applicationactionroles VALUES("987","798","PUBLIC","2015-06-13 16:08:48","1","2015-06-13 16:08:48","1");
INSERT INTO trianik_applicationactionroles VALUES("988","799","PUBLIC","2015-06-13 16:08:48","1","2015-06-13 16:08:48","1");
INSERT INTO trianik_applicationactionroles VALUES("989","800","PUBLIC","2015-06-13 16:08:48","1","2015-06-13 16:08:48","1");
INSERT INTO trianik_applicationactionroles VALUES("990","801","PUBLIC","2015-06-13 16:08:48","1","2015-06-13 16:08:48","1");
INSERT INTO trianik_applicationactionroles VALUES("991","802","PUBLIC","2015-06-13 16:08:48","1","2015-06-13 16:08:48","1");
INSERT INTO trianik_applicationactionroles VALUES("992","803","PUBLIC","2015-06-15 11:15:06","1","2015-06-15 11:15:06","1");
INSERT INTO trianik_applicationactionroles VALUES("993","804","PUBLIC","2015-06-15 11:59:42","1","2015-06-15 11:59:42","1");
INSERT INTO trianik_applicationactionroles VALUES("994","805","PUBLIC","2015-06-15 19:32:05","1","2015-06-15 19:32:05","1");
INSERT INTO trianik_applicationactionroles VALUES("995","806","PUBLIC","2015-06-15 19:32:05","1","2015-06-15 19:32:05","1");
INSERT INTO trianik_applicationactionroles VALUES("996","807","PUBLIC","2015-06-15 19:32:05","1","2015-06-15 19:32:05","1");
INSERT INTO trianik_applicationactionroles VALUES("997","808","PUBLIC","2015-06-15 19:32:05","1","2015-06-15 19:32:05","1");
INSERT INTO trianik_applicationactionroles VALUES("998","809","PUBLIC","2015-06-15 19:32:05","1","2015-06-15 19:32:05","1");
INSERT INTO trianik_applicationactionroles VALUES("999","810","PUBLIC","2015-06-15 19:32:05","1","2015-06-15 19:32:05","1");
INSERT INTO trianik_applicationactionroles VALUES("1000","811","PUBLIC","2015-06-15 19:36:54","1","2015-06-15 19:36:54","1");
INSERT INTO trianik_applicationactionroles VALUES("1001","812","PUBLIC","2015-06-15 19:36:54","1","2015-06-15 19:36:54","1");
INSERT INTO trianik_applicationactionroles VALUES("1002","813","PUBLIC","2015-06-15 19:36:54","1","2015-06-15 19:36:54","1");
INSERT INTO trianik_applicationactionroles VALUES("1003","814","PUBLIC","2015-06-15 19:36:54","1","2015-06-15 19:36:54","1");
INSERT INTO trianik_applicationactionroles VALUES("1004","815","PUBLIC","2015-06-15 19:36:54","1","2015-06-15 19:36:54","1");
INSERT INTO trianik_applicationactionroles VALUES("1005","816","PUBLIC","2015-06-15 19:36:54","1","2015-06-15 19:36:54","1");
INSERT INTO trianik_applicationactionroles VALUES("1006","817","PUBLIC","2015-06-18 18:56:14","1","2015-06-18 18:56:14","1");
INSERT INTO trianik_applicationactionroles VALUES("1007","818","PUBLIC","2015-06-28 16:11:16","1","2015-06-28 16:11:16","1");
INSERT INTO trianik_applicationactionroles VALUES("1008","819","PUBLIC","2015-06-28 16:11:16","1","2015-06-28 16:11:16","1");
INSERT INTO trianik_applicationactionroles VALUES("1009","820","PUBLIC","2015-06-28 16:11:16","1","2015-06-28 16:11:16","1");
INSERT INTO trianik_applicationactionroles VALUES("1010","821","PUBLIC","2015-06-28 16:11:16","1","2015-06-28 16:11:16","1");
INSERT INTO trianik_applicationactionroles VALUES("1011","822","PUBLIC","2015-06-28 16:11:16","1","2015-06-28 16:11:16","1");
INSERT INTO trianik_applicationactionroles VALUES("1012","823","PUBLIC","2015-06-28 16:11:16","1","2015-06-28 16:11:16","1");
INSERT INTO trianik_applicationactionroles VALUES("1013","824","PUBLIC","2015-06-28 16:31:16","1","2015-06-28 16:31:16","1");
INSERT INTO trianik_applicationactionroles VALUES("1014","825","PUBLIC","2015-06-28 16:31:16","1","2015-06-28 16:31:16","1");
INSERT INTO trianik_applicationactionroles VALUES("1015","826","PUBLIC","2015-06-28 16:31:16","1","2015-06-28 16:31:16","1");
INSERT INTO trianik_applicationactionroles VALUES("1016","827","PUBLIC","2015-06-28 16:31:16","1","2015-06-28 16:31:16","1");
INSERT INTO trianik_applicationactionroles VALUES("1017","828","PUBLIC","2015-06-28 16:31:16","1","2015-06-28 16:31:16","1");
INSERT INTO trianik_applicationactionroles VALUES("1018","829","PUBLIC","2015-06-28 16:31:16","1","2015-06-28 16:31:16","1");
INSERT INTO trianik_applicationactionroles VALUES("1019","830","PUBLIC","2015-07-02 19:26:19","1","2015-07-02 19:26:19","1");
INSERT INTO trianik_applicationactionroles VALUES("1020","831","PUBLIC","2015-07-02 19:26:19","1","2015-07-02 19:26:19","1");
INSERT INTO trianik_applicationactionroles VALUES("1021","832","PUBLIC","2015-07-02 19:26:19","1","2015-07-02 19:26:19","1");
INSERT INTO trianik_applicationactionroles VALUES("1022","833","PUBLIC","2015-07-02 19:26:19","1","2015-07-02 19:26:19","1");
INSERT INTO trianik_applicationactionroles VALUES("1023","834","PUBLIC","2015-07-02 19:26:19","1","2015-07-02 19:26:19","1");
INSERT INTO trianik_applicationactionroles VALUES("1024","835","PUBLIC","2015-07-02 21:33:20","1","2015-07-02 21:33:20","1");
INSERT INTO trianik_applicationactionroles VALUES("1025","836","PUBLIC","2015-07-02 21:33:20","1","2015-07-02 21:33:20","1");
INSERT INTO trianik_applicationactionroles VALUES("1026","837","PUBLIC","2015-07-02 21:33:20","1","2015-07-02 21:33:20","1");
INSERT INTO trianik_applicationactionroles VALUES("1027","838","PUBLIC","2015-07-02 21:33:20","1","2015-07-02 21:33:20","1");
INSERT INTO trianik_applicationactionroles VALUES("1028","839","PUBLIC","2015-07-02 21:33:20","1","2015-07-02 21:33:20","1");
INSERT INTO trianik_applicationactionroles VALUES("1029","840","PUBLIC","2015-07-03 20:24:18","1","2015-07-03 20:24:18","1");
INSERT INTO trianik_applicationactionroles VALUES("1030","841","PUBLIC","2015-07-03 20:24:18","1","2015-07-03 20:24:18","1");
INSERT INTO trianik_applicationactionroles VALUES("1031","842","PUBLIC","2015-07-03 20:24:18","1","2015-07-03 20:24:18","1");
INSERT INTO trianik_applicationactionroles VALUES("1032","843","PUBLIC","2015-07-03 20:24:18","1","2015-07-03 20:24:18","1");
INSERT INTO trianik_applicationactionroles VALUES("1033","844","PUBLIC","2015-07-03 20:24:18","1","2015-07-03 20:24:18","1");
INSERT INTO trianik_applicationactionroles VALUES("1034","845","PUBLIC","2015-07-03 20:24:18","1","2015-07-03 20:24:18","1");
INSERT INTO trianik_applicationactionroles VALUES("1035","846","PUBLIC","2015-07-05 10:52:39","1","2015-07-05 10:52:39","1");
INSERT INTO trianik_applicationactionroles VALUES("1036","847","PUBLIC","2015-07-06 18:44:41","1","2015-07-06 18:44:41","1");
INSERT INTO trianik_applicationactionroles VALUES("1037","848","PUBLIC","2015-07-06 18:44:41","1","2015-07-06 18:44:41","1");
INSERT INTO trianik_applicationactionroles VALUES("1038","849","PUBLIC","2015-07-06 18:44:41","1","2015-07-06 18:44:41","1");
INSERT INTO trianik_applicationactionroles VALUES("1039","850","PUBLIC","2015-07-06 18:44:41","1","2015-07-06 18:44:41","1");
INSERT INTO trianik_applicationactionroles VALUES("1040","851","PUBLIC","2015-07-06 18:44:41","1","2015-07-06 18:44:41","1");
INSERT INTO trianik_applicationactionroles VALUES("1041","852","PUBLIC","2015-08-04 20:36:53","1","2015-08-04 20:36:53","1");
INSERT INTO trianik_applicationactionroles VALUES("1042","853","PUBLIC","2015-08-04 20:36:57","1","2015-08-04 20:36:57","1");
INSERT INTO trianik_applicationactionroles VALUES("1043","854","PUBLIC","2015-08-04 20:37:29","1","2015-08-04 20:37:29","1");
INSERT INTO trianik_applicationactionroles VALUES("1044","855","PUBLIC","2015-08-04 20:37:29","1","2015-08-04 20:37:29","1");
INSERT INTO trianik_applicationactionroles VALUES("1045","856","PUBLIC","2015-08-04 20:37:29","1","2015-08-04 20:37:29","1");
INSERT INTO trianik_applicationactionroles VALUES("1046","857","PUBLIC","2015-08-04 20:37:29","1","2015-08-04 20:37:29","1");
INSERT INTO trianik_applicationactionroles VALUES("1047","858","PUBLIC","2015-08-04 20:37:29","1","2015-08-04 20:37:29","1");
INSERT INTO trianik_applicationactionroles VALUES("1048","859","PUBLIC","2015-08-09 20:13:45","1","2015-08-09 20:13:45","1");
INSERT INTO trianik_applicationactionroles VALUES("1049","860","PUBLIC","2015-08-09 20:13:45","1","2015-08-09 20:13:45","1");
INSERT INTO trianik_applicationactionroles VALUES("1050","861","PUBLIC","2015-08-09 20:13:45","1","2015-08-09 20:13:45","1");
INSERT INTO trianik_applicationactionroles VALUES("1051","862","PUBLIC","2015-08-09 20:13:45","1","2015-08-09 20:13:45","1");
INSERT INTO trianik_applicationactionroles VALUES("1052","863","PUBLIC","2015-08-09 20:13:45","1","2015-08-09 20:13:45","1");
INSERT INTO trianik_applicationactionroles VALUES("1053","864","PUBLIC","2015-08-09 20:13:45","1","2015-08-09 20:13:45","1");
INSERT INTO trianik_applicationactionroles VALUES("1054","865","PUBLIC","2015-08-09 20:13:45","1","2015-08-09 20:13:45","1");
INSERT INTO trianik_applicationactionroles VALUES("1055","866","PUBLIC","2015-08-16 14:07:36","1","2015-08-16 14:07:36","1");
INSERT INTO trianik_applicationactionroles VALUES("1056","867","PUBLIC","2015-08-28 11:54:21","1","2015-08-28 11:54:21","1");
INSERT INTO trianik_applicationactionroles VALUES("1057","868","PUBLIC","2015-08-28 11:54:21","1","2015-08-28 11:54:21","1");
INSERT INTO trianik_applicationactionroles VALUES("1058","869","PUBLIC","2015-08-28 11:54:21","1","2015-08-28 11:54:21","1");
INSERT INTO trianik_applicationactionroles VALUES("1059","870","PUBLIC","2015-08-28 11:54:21","1","2015-08-28 11:54:21","1");
INSERT INTO trianik_applicationactionroles VALUES("1060","871","PUBLIC","2015-08-28 11:54:21","1","2015-08-28 11:54:21","1");
INSERT INTO trianik_applicationactionroles VALUES("1061","872","PUBLIC","2015-09-01 17:46:29","1","2015-09-01 17:46:29","1");
INSERT INTO trianik_applicationactionroles VALUES("1062","873","PUBLIC","2015-09-01 17:46:29","1","2015-09-01 17:46:29","1");
INSERT INTO trianik_applicationactionroles VALUES("1063","874","PUBLIC","2015-09-01 17:46:29","1","2015-09-01 17:46:29","1");
INSERT INTO trianik_applicationactionroles VALUES("1064","875","PUBLIC","2015-11-05 17:28:10","1","2015-11-05 17:28:10","1");
INSERT INTO trianik_applicationactionroles VALUES("1065","876","PUBLIC","2015-11-05 17:28:10","1","2015-11-05 17:28:10","1");
INSERT INTO trianik_applicationactionroles VALUES("1066","877","PUBLIC","2015-11-05 17:28:10","1","2015-11-05 17:28:10","1");
INSERT INTO trianik_applicationactionroles VALUES("1067","878","PUBLIC","2015-11-05 17:28:10","1","2015-11-05 17:28:10","1");
INSERT INTO trianik_applicationactionroles VALUES("1068","879","PUBLIC","2015-11-05 17:28:10","1","2015-11-05 17:28:10","1");



DROP TABLE trianik_applicationactions;

CREATE TABLE `trianik_applicationactions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pageid` int(11) DEFAULT NULL,
  `description` varchar(40) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `metacreateddate` datetime NOT NULL,
  `metacreateduserid` int(11) NOT NULL,
  `metamodifieddate` datetime NOT NULL,
  `metamodifieduserid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=880 DEFAULT CHARSET=latin1;

INSERT INTO trianik_applicationactions VALUES("505","7218","Filter","Filter","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("504","7207","Print","printInvoiceReport","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("503","7207","Invoice Items","redirectEdit","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("502","7207","Invoice Items","editInvoice","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("501","7158","Invoice","editInvoice","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("500","7214","Remove item","RemoveItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("499","7214","Edit item","EditItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("498","7214","View item","ViewItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("497","7214","Add item","AddItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("496","7214","Filter","Filter","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("495","4","Remove item","RemoveItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("494","4","View item","ViewItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("493","4","Filter","Filter","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("492","11","User Roles","userRoles","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("491","11","Remove item","RemoveItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("490","11","Edit item","EditItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("489","11","View item","ViewItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("488","11","Add item","AddItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("487","11","Filter","Filter","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("486","130","Live","live","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("485","130","Expire","expire","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("484","130","User Roles","userRoles","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("483","130","Remove item","RemoveItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("482","130","Edit item","EditItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("481","130","View item","ViewItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("480","130","Filter","Filter","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("479","7211","Add item","AddItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("478","7211","Remove item","RemoveItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("477","7211","Edit item","EditItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("476","7211","View item","ViewItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("475","7211","Filter","Filter","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("474","7210","Remove item","RemoveItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("473","7210","Edit item","EditItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("472","7210","View item","ViewItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("471","7210","Filter","Filter","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("470","7207","Print","printinvoice","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("469","7208","Add item","AddItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("468","7208","Filter","Filter","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("467","7208","Remove item","RemoveItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("466","7208","Edit item","EditItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("465","7208","View item","ViewItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("464","7165","Remove item","RemoveItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("463","7165","Edit item","EditItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("462","7165","View item","ViewItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("461","7165","Add item","AddItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("460","7165","Filter","Filter","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("459","7160","Remove item","RemoveItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("458","7160","Edit item","EditItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("457","7160","View item","ViewItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("456","7160","Add item","AddItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("455","7160","Filter","Filter","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("454","7207","Remove","removeSelectedRow","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("453","7207","Edit","editSelectedRow","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("452","7207","View","viewSelectedRow","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("451","7207","Remove item","RemoveItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("450","7207","Edit item","EditItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("449","7207","View item","ViewItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("448","7207","Add item","AddItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("447","7207","Filter","Filter","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("446","7105","Move Down","sequenceDown","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("445","7105","Move Up","sequenceUp","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("444","7105","Content","editContent","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("443","7105","Roles","pageRoles","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("442","7105","Remove item","RemoveItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("441","7105","Edit item","EditItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("440","7105","View item","ViewItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("439","7105","Add item","AddItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("438","7105","Filter","Filter","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("437","7158","Remove item","RemoveItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("436","7158","Edit item","EditItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("435","7158","View item","ViewItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("434","7158","Add item","AddItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("433","7158","Filter","Filter","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("506","7218","Add item","AddItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("507","7218","View item","ViewItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("508","7218","Edit item","EditItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("509","7218","Remove item","RemoveItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("510","7218","Invoice","editInvoice","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("511","7158","Documents","viewDocument","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("512","7158","Documents","editDocuments","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("513","7219","Filter","Filter","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("514","7219","Add item","AddItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("515","7219","View item","ViewItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("516","7219","Edit item","EditItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("517","7219","Remove item","RemoveItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("518","7158","Typists","editTypists","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("519","7220","Filter","Filter","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("520","7220","Add item","AddItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("521","7220","View item","ViewItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("522","7220","Edit item","EditItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("523","7220","Remove item","RemoveItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("524","7220","Invoice","editInvoice","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("525","7220","Documents","editDocuments","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("526","7221","Filter","Filter","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("527","7221","Add item","AddItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("528","7221","View item","ViewItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("529","7221","Edit item","EditItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("530","7221","Remove item","RemoveItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("531","7223","Filter","Filter","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("532","7223","Add item","AddItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("533","7223","View item","ViewItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("534","7223","Edit item","EditItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("535","7223","Remove item","RemoveItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("536","7223","Invoice","editInvoice","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("537","7223","Documents","editDocuments","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("538","7223","Invoice","addCrud","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("539","7223","Invoice","editCrudItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("540","7223","Invoice","edit","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("541","7225","Filter","Filter","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("542","7225","Add item","AddItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("543","7225","View item","ViewItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("544","7225","Edit item","EditItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("545","7225","Remove item","RemoveItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("546","7158","Quote","editQuote","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("547","7226","Filter","Filter","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("548","7226","Remove item","RemoveItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("549","7226","View / Edit Quote","redirectEdit","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("550","7226","Print","printQuoteReport","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("551","7218","Quote","editQuote","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("552","7218","Transcripts","editDocuments","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("553","7229","Filter","Filter","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("554","7229","Add item","AddItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("555","7229","View item","ViewItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("556","7229","Edit item","EditItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("557","7229","Remove item","RemoveItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("558","7230","Filter","Filter","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("559","7230","Add item","AddItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("560","7230","View item","ViewItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("561","7230","Edit item","EditItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("562","7230","Remove item","RemoveItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("563","7232","Filter","Filter","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("564","7232","Add item","AddItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("565","7232","View item","ViewItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("566","7232","Edit item","EditItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("567","7232","Remove item","RemoveItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("568","7232","Invoice","editInvoice","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("569","7232","Quote","editQuote","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("570","7232","Documents","editDocuments","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("571","7231","Filter","Filter","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("572","7231","Add item","AddItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("573","7231","View item","ViewItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("574","7231","Edit item","EditItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("575","7231","Remove item","RemoveItem","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("576","7231","Invoice","editInvoice","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("577","7231","Quote","editQuote","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("578","7231","Documents","editDocuments","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("579","7158","Running","running","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("580","7231","Running","running","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("581","7223","Running","running","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("582","7223","Invoice","invoice","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("583","7223","View Case Information","viewCase","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_applicationactions VALUES("584","7233","Filter","Filter","2014-02-17 10:04:39","1","2014-02-17 10:04:39","1");
INSERT INTO trianik_applicationactions VALUES("585","7233","View item","ViewItem","2014-02-17 10:04:39","1","2014-02-17 10:04:39","1");
INSERT INTO trianik_applicationactions VALUES("586","7233","Remove item","RemoveItem","2014-02-17 10:04:39","1","2014-02-17 10:04:39","1");
INSERT INTO trianik_applicationactions VALUES("587","7235","Filter","Filter","2014-02-20 18:19:35","1","2014-02-20 18:19:35","1");
INSERT INTO trianik_applicationactions VALUES("588","7235","Add item","AddItem","2014-02-20 18:19:35","1","2014-02-20 18:19:35","1");
INSERT INTO trianik_applicationactions VALUES("589","7235","View item","ViewItem","2014-02-20 18:19:35","1","2014-02-20 18:19:35","1");
INSERT INTO trianik_applicationactions VALUES("590","7235","Edit item","EditItem","2014-02-20 18:19:35","1","2014-02-20 18:19:35","1");
INSERT INTO trianik_applicationactions VALUES("591","7235","Remove item","RemoveItem","2014-02-20 18:19:35","1","2014-02-20 18:19:35","1");
INSERT INTO trianik_applicationactions VALUES("592","7235","Invoice","editInvoice","2014-02-20 18:19:35","1","2014-02-20 18:19:35","1");
INSERT INTO trianik_applicationactions VALUES("593","7235","Quote","editQuote","2014-02-20 18:19:35","1","2014-02-20 18:19:35","1");
INSERT INTO trianik_applicationactions VALUES("594","7235","Running","running","2014-02-20 18:19:35","1","2014-02-20 18:19:35","1");
INSERT INTO trianik_applicationactions VALUES("595","7235","Documents","editDocuments","2014-02-20 18:19:35","1","2014-02-20 18:19:35","1");
INSERT INTO trianik_applicationactions VALUES("596","7238","Filter","Filter","2014-03-24 10:52:42","1","2014-03-24 10:52:42","1");
INSERT INTO trianik_applicationactions VALUES("597","7238","Add item","AddItem","2014-03-24 10:52:42","1","2014-03-24 10:52:42","1");
INSERT INTO trianik_applicationactions VALUES("598","7238","View item","ViewItem","2014-03-24 10:52:42","1","2014-03-24 10:52:42","1");
INSERT INTO trianik_applicationactions VALUES("599","7238","Edit item","EditItem","2014-03-24 10:52:42","1","2014-03-24 10:52:42","1");
INSERT INTO trianik_applicationactions VALUES("600","7238","Remove item","RemoveItem","2014-03-24 10:52:42","1","2014-03-24 10:52:42","1");
INSERT INTO trianik_applicationactions VALUES("601","7158","Contacts","editContact","2014-03-31 14:14:13","1","2014-03-31 14:14:13","1");
INSERT INTO trianik_applicationactions VALUES("602","7231","Contacts","editContact","2014-04-04 15:46:57","1","2014-04-04 15:46:57","1");
INSERT INTO trianik_applicationactions VALUES("603","7210","Add item","AddItem","2014-05-13 17:42:51","1","2014-05-13 17:42:51","1");
INSERT INTO trianik_applicationactions VALUES("604","7176","Filter","Filter","2014-05-14 13:37:14","1","2014-05-14 13:37:14","1");
INSERT INTO trianik_applicationactions VALUES("605","7176","Add item","AddItem","2014-05-14 13:37:14","1","2014-05-14 13:37:14","1");
INSERT INTO trianik_applicationactions VALUES("606","7176","View item","ViewItem","2014-05-14 13:37:14","1","2014-05-14 13:37:14","1");
INSERT INTO trianik_applicationactions VALUES("607","7176","Edit item","EditItem","2014-05-14 13:37:14","1","2014-05-14 13:37:14","1");
INSERT INTO trianik_applicationactions VALUES("608","7176","Remove item","RemoveItem","2014-05-14 13:37:14","1","2014-05-14 13:37:14","1");
INSERT INTO trianik_applicationactions VALUES("609","7176","Map","showMap","2014-05-19 12:49:43","1","2014-05-19 12:49:43","1");
INSERT INTO trianik_applicationactions VALUES("610","7176","Delivery Note","printDeliveryNote","2014-09-04 10:08:59","1","2014-09-04 10:08:59","1");
INSERT INTO trianik_applicationactions VALUES("611","7243","Filter","Filter","2014-10-09 19:56:41","1","2014-10-09 19:56:41","1");
INSERT INTO trianik_applicationactions VALUES("612","7243","Add item","AddItem","2014-10-09 19:56:41","1","2014-10-09 19:56:41","1");
INSERT INTO trianik_applicationactions VALUES("613","7243","View item","ViewItem","2014-10-09 19:56:41","1","2014-10-09 19:56:41","1");
INSERT INTO trianik_applicationactions VALUES("614","7243","Edit item","EditItem","2014-10-09 19:56:41","1","2014-10-09 19:56:41","1");
INSERT INTO trianik_applicationactions VALUES("615","7243","Remove item","RemoveItem","2014-10-09 19:56:41","1","2014-10-09 19:56:41","1");
INSERT INTO trianik_applicationactions VALUES("616","7243","Approve","approveHoliday","2014-10-09 19:56:41","1","2014-10-09 19:56:41","1");
INSERT INTO trianik_applicationactions VALUES("617","7243","Reject","rejectHoliday","2014-10-09 19:56:41","1","2014-10-09 19:56:41","1");
INSERT INTO trianik_applicationactions VALUES("618","7244","Filter","Filter","2014-10-09 20:11:08","1","2014-10-09 20:11:08","1");
INSERT INTO trianik_applicationactions VALUES("619","7244","Add item","AddItem","2014-10-09 20:11:08","1","2014-10-09 20:11:08","1");
INSERT INTO trianik_applicationactions VALUES("620","7244","View item","ViewItem","2014-10-09 20:11:08","1","2014-10-09 20:11:08","1");
INSERT INTO trianik_applicationactions VALUES("621","7244","Edit item","EditItem","2014-10-09 20:11:08","1","2014-10-09 20:11:08","1");
INSERT INTO trianik_applicationactions VALUES("622","7244","Remove item","RemoveItem","2014-10-09 20:11:08","1","2014-10-09 20:11:08","1");
INSERT INTO trianik_applicationactions VALUES("623","7240","Filter","Filter","2014-10-10 22:40:08","1","2014-10-10 22:40:08","1");
INSERT INTO trianik_applicationactions VALUES("624","7240","Add item","AddItem","2014-10-10 22:40:08","1","2014-10-10 22:40:08","1");
INSERT INTO trianik_applicationactions VALUES("625","7240","View item","ViewItem","2014-10-10 22:40:08","1","2014-10-10 22:40:08","1");
INSERT INTO trianik_applicationactions VALUES("626","7240","Edit item","EditItem","2014-10-10 22:40:08","1","2014-10-10 22:40:08","1");
INSERT INTO trianik_applicationactions VALUES("627","7240","Remove item","RemoveItem","2014-10-10 22:40:08","1","2014-10-10 22:40:08","1");
INSERT INTO trianik_applicationactions VALUES("628","7240","Approve","approveHoliday","2014-10-10 22:40:08","1","2014-10-10 22:40:08","1");
INSERT INTO trianik_applicationactions VALUES("629","7240","Reject","rejectHoliday","2014-10-10 22:40:08","1","2014-10-10 22:40:08","1");
INSERT INTO trianik_applicationactions VALUES("630","7247","Filter","Filter","2014-10-10 22:52:43","1","2014-10-10 22:52:43","1");
INSERT INTO trianik_applicationactions VALUES("631","7247","View item","ViewItem","2014-10-10 22:52:43","1","2014-10-10 22:52:43","1");
INSERT INTO trianik_applicationactions VALUES("632","7247","Remove item","RemoveItem","2014-10-10 22:52:43","1","2014-10-10 22:52:43","1");
INSERT INTO trianik_applicationactions VALUES("633","7248","Filter","Filter","2014-10-10 22:53:13","1","2014-10-10 22:53:13","1");
INSERT INTO trianik_applicationactions VALUES("634","7248","View item","ViewItem","2014-10-10 22:53:13","1","2014-10-10 22:53:13","1");
INSERT INTO trianik_applicationactions VALUES("635","7248","Remove item","RemoveItem","2014-10-10 22:53:13","1","2014-10-10 22:53:13","1");
INSERT INTO trianik_applicationactions VALUES("636","7248","Approve","approveHoliday","2014-10-10 22:53:13","1","2014-10-10 22:53:13","1");
INSERT INTO trianik_applicationactions VALUES("637","7241","Filter","Filter","2014-10-11 13:29:36","1","2014-10-11 13:29:36","1");
INSERT INTO trianik_applicationactions VALUES("638","7241","Add item","AddItem","2014-10-11 13:29:36","1","2014-10-11 13:29:36","1");
INSERT INTO trianik_applicationactions VALUES("639","7241","View item","ViewItem","2014-10-11 13:29:36","1","2014-10-11 13:29:36","1");
INSERT INTO trianik_applicationactions VALUES("640","7241","Edit item","EditItem","2014-10-11 13:29:36","1","2014-10-11 13:29:36","1");
INSERT INTO trianik_applicationactions VALUES("641","7241","Remove item","RemoveItem","2014-10-11 13:29:36","1","2014-10-11 13:29:36","1");
INSERT INTO trianik_applicationactions VALUES("642","7241","Approve","approveAbsence","2014-10-11 13:29:36","1","2014-10-11 13:29:36","1");
INSERT INTO trianik_applicationactions VALUES("643","7241","Reject","rejectAbsence","2014-10-11 13:29:36","1","2014-10-11 13:29:36","1");
INSERT INTO trianik_applicationactions VALUES("644","7254","Filter","Filter","2014-10-11 13:32:00","1","2014-10-11 13:32:00","1");
INSERT INTO trianik_applicationactions VALUES("645","7254","View item","ViewItem","2014-10-11 13:32:00","1","2014-10-11 13:32:00","1");
INSERT INTO trianik_applicationactions VALUES("646","7254","Edit item","EditItem","2014-10-11 13:32:00","1","2014-10-11 13:32:00","1");
INSERT INTO trianik_applicationactions VALUES("647","7254","Remove item","RemoveItem","2014-10-11 13:32:00","1","2014-10-11 13:32:00","1");
INSERT INTO trianik_applicationactions VALUES("648","7254","Approve","approveAbsence","2014-10-11 13:32:00","1","2014-10-11 13:32:00","1");
INSERT INTO trianik_applicationactions VALUES("649","7254","Reject","rejectAbsence","2014-10-11 13:32:00","1","2014-10-11 13:32:00","1");
INSERT INTO trianik_applicationactions VALUES("650","7253","Filter","Filter","2014-10-11 14:04:23","1","2014-10-11 14:04:23","1");
INSERT INTO trianik_applicationactions VALUES("651","7253","View item","ViewItem","2014-10-11 14:04:23","1","2014-10-11 14:04:23","1");
INSERT INTO trianik_applicationactions VALUES("652","7253","Edit item","EditItem","2014-10-11 14:04:23","1","2014-10-11 14:04:23","1");
INSERT INTO trianik_applicationactions VALUES("653","7253","Remove item","RemoveItem","2014-10-11 14:04:23","1","2014-10-11 14:04:23","1");
INSERT INTO trianik_applicationactions VALUES("654","7253","Approve","approveAbsence","2014-10-11 14:04:23","1","2014-10-11 14:04:23","1");
INSERT INTO trianik_applicationactions VALUES("655","7253","Reject","rejectAbsence","2014-10-11 14:04:23","1","2014-10-11 14:04:23","1");
INSERT INTO trianik_applicationactions VALUES("656","7255","Filter","Filter","2014-10-11 14:06:14","1","2014-10-11 14:06:14","1");
INSERT INTO trianik_applicationactions VALUES("657","7255","View item","ViewItem","2014-10-11 14:06:14","1","2014-10-11 14:06:14","1");
INSERT INTO trianik_applicationactions VALUES("658","7255","Remove item","RemoveItem","2014-10-11 14:06:14","1","2014-10-11 14:06:14","1");
INSERT INTO trianik_applicationactions VALUES("659","7255","Approve","approveAbsence","2014-10-11 14:06:14","1","2014-10-11 14:06:14","1");
INSERT INTO trianik_applicationactions VALUES("660","7255","Reject","rejectAbsence","2014-10-11 14:06:14","1","2014-10-11 14:06:14","1");
INSERT INTO trianik_applicationactions VALUES("661","7176","Route","route","2014-10-13 20:52:27","1","2014-10-13 20:52:27","1");
INSERT INTO trianik_applicationactions VALUES("662","7260","Filter","Filter","2014-10-26 21:38:04","1","2014-10-26 21:38:04","1");
INSERT INTO trianik_applicationactions VALUES("663","7260","Add item","AddItem","2014-10-26 21:38:04","1","2014-10-26 21:38:04","1");
INSERT INTO trianik_applicationactions VALUES("664","7260","View item","ViewItem","2014-10-26 21:38:04","1","2014-10-26 21:38:04","1");
INSERT INTO trianik_applicationactions VALUES("665","7260","Edit item","EditItem","2014-10-26 21:38:04","1","2014-10-26 21:38:04","1");
INSERT INTO trianik_applicationactions VALUES("666","7260","Remove item","RemoveItem","2014-10-26 21:38:04","1","2014-10-26 21:38:04","1");
INSERT INTO trianik_applicationactions VALUES("667","7260","Documents","editDocuments","2014-10-26 21:38:04","1","2014-10-26 21:38:04","1");
INSERT INTO trianik_applicationactions VALUES("668","7259","Filter","Filter","2014-11-29 17:07:31","1","2014-11-29 17:07:31","1");
INSERT INTO trianik_applicationactions VALUES("669","7259","Add item","AddItem","2014-11-29 17:07:31","1","2014-11-29 17:07:31","1");
INSERT INTO trianik_applicationactions VALUES("670","7259","Edit item","EditItem","2014-11-29 17:07:31","1","2014-11-29 17:07:31","1");
INSERT INTO trianik_applicationactions VALUES("671","7259","Remove item","RemoveItem","2014-11-29 17:07:31","1","2014-11-29 17:07:31","1");
INSERT INTO trianik_applicationactions VALUES("672","7259","Map","showMap","2014-11-29 17:07:31","1","2014-11-29 17:07:31","1");
INSERT INTO trianik_applicationactions VALUES("673","7259","Delivery Note","printDeliveryNote","2014-11-29 17:07:31","1","2014-11-29 17:07:31","1");
INSERT INTO trianik_applicationactions VALUES("674","7259","Allocate","edit","2014-11-29 17:10:44","1","2014-11-29 17:10:44","1");
INSERT INTO trianik_applicationactions VALUES("675","7261","Filter","Filter","2014-11-30 15:42:41","1","2014-11-30 15:42:41","1");
INSERT INTO trianik_applicationactions VALUES("676","7261","Add item","AddItem","2014-11-30 15:42:41","1","2014-11-30 15:42:41","1");
INSERT INTO trianik_applicationactions VALUES("677","7261","View item","ViewItem","2014-11-30 15:42:41","1","2014-11-30 15:42:41","1");
INSERT INTO trianik_applicationactions VALUES("678","7261","Edit item","EditItem","2014-11-30 15:42:41","1","2014-11-30 15:42:41","1");
INSERT INTO trianik_applicationactions VALUES("679","7261","Remove item","RemoveItem","2014-11-30 15:42:41","1","2014-11-30 15:42:41","1");
INSERT INTO trianik_applicationactions VALUES("680","7176","Documents","editDocuments","2014-11-30 21:37:50","1","2014-11-30 21:37:50","1");
INSERT INTO trianik_applicationactions VALUES("681","7210","Documents","editDocuments","2014-11-30 22:08:03","1","2014-11-30 22:08:03","1");
INSERT INTO trianik_applicationactions VALUES("682","7262","Filter","Filter","2014-12-07 18:49:21","1","2014-12-07 18:49:21","1");
INSERT INTO trianik_applicationactions VALUES("683","7262","Add item","AddItem","2014-12-07 18:49:21","1","2014-12-07 18:49:21","1");
INSERT INTO trianik_applicationactions VALUES("684","7262","View item","ViewItem","2014-12-07 18:49:21","1","2014-12-07 18:49:21","1");
INSERT INTO trianik_applicationactions VALUES("685","7262","Edit item","EditItem","2014-12-07 18:49:21","1","2014-12-07 18:49:21","1");
INSERT INTO trianik_applicationactions VALUES("686","7262","Remove item","RemoveItem","2014-12-07 18:49:21","1","2014-12-07 18:49:21","1");
INSERT INTO trianik_applicationactions VALUES("687","7263","Filter","Filter","2014-12-07 19:05:23","1","2014-12-07 19:05:23","1");
INSERT INTO trianik_applicationactions VALUES("688","7263","Add item","AddItem","2014-12-07 19:05:23","1","2014-12-07 19:05:23","1");
INSERT INTO trianik_applicationactions VALUES("689","7263","View item","ViewItem","2014-12-07 19:05:23","1","2014-12-07 19:05:23","1");
INSERT INTO trianik_applicationactions VALUES("690","7263","Edit item","EditItem","2014-12-07 19:05:23","1","2014-12-07 19:05:23","1");
INSERT INTO trianik_applicationactions VALUES("691","7263","Remove item","RemoveItem","2014-12-07 19:05:23","1","2014-12-07 19:05:23","1");
INSERT INTO trianik_applicationactions VALUES("692","7264","Filter","Filter","2014-12-07 19:14:20","1","2014-12-07 19:14:20","1");
INSERT INTO trianik_applicationactions VALUES("693","7264","Add item","AddItem","2014-12-07 19:14:20","1","2014-12-07 19:14:20","1");
INSERT INTO trianik_applicationactions VALUES("694","7264","View item","ViewItem","2014-12-07 19:14:20","1","2014-12-07 19:14:20","1");
INSERT INTO trianik_applicationactions VALUES("695","7264","Edit item","EditItem","2014-12-07 19:14:20","1","2014-12-07 19:14:20","1");
INSERT INTO trianik_applicationactions VALUES("696","7264","Remove item","RemoveItem","2014-12-07 19:14:20","1","2014-12-07 19:14:20","1");
INSERT INTO trianik_applicationactions VALUES("697","7265","Filter","Filter","2014-12-09 20:15:21","1","2014-12-09 20:15:21","1");
INSERT INTO trianik_applicationactions VALUES("698","7265","Add item","AddItem","2014-12-09 20:15:21","1","2014-12-09 20:15:21","1");
INSERT INTO trianik_applicationactions VALUES("699","7265","View item","ViewItem","2014-12-09 20:15:21","1","2014-12-09 20:15:21","1");
INSERT INTO trianik_applicationactions VALUES("700","7265","Edit item","EditItem","2014-12-09 20:15:21","1","2014-12-09 20:15:21","1");
INSERT INTO trianik_applicationactions VALUES("701","7265","Remove item","RemoveItem","2014-12-09 20:15:21","1","2014-12-09 20:15:21","1");
INSERT INTO trianik_applicationactions VALUES("702","7266","Filter","Filter","2014-12-18 14:13:35","1","2014-12-18 14:13:35","1");
INSERT INTO trianik_applicationactions VALUES("703","7266","Add item","AddItem","2014-12-18 14:13:35","1","2014-12-18 14:13:35","1");
INSERT INTO trianik_applicationactions VALUES("704","7266","View item","ViewItem","2014-12-18 14:13:35","1","2014-12-18 14:13:35","1");
INSERT INTO trianik_applicationactions VALUES("705","7266","Edit item","EditItem","2014-12-18 14:13:35","1","2014-12-18 14:13:35","1");
INSERT INTO trianik_applicationactions VALUES("706","7266","Remove item","RemoveItem","2014-12-18 14:13:35","1","2014-12-18 14:13:35","1");
INSERT INTO trianik_applicationactions VALUES("707","7267","Filter","Filter","2014-12-18 15:44:56","1","2014-12-18 15:44:56","1");
INSERT INTO trianik_applicationactions VALUES("708","7267","Remove item","RemoveItem","2014-12-18 15:44:56","1","2014-12-18 15:44:56","1");
INSERT INTO trianik_applicationactions VALUES("709","7267","Notify","edit","2014-12-18 15:44:56","1","2014-12-18 15:44:56","1");
INSERT INTO trianik_applicationactions VALUES("710","7267","Map","showMap","2014-12-18 15:44:56","1","2014-12-18 15:44:56","1");
INSERT INTO trianik_applicationactions VALUES("711","7267","Delivery Note","printDeliveryNote","2014-12-18 15:44:56","1","2014-12-18 15:44:56","1");
INSERT INTO trianik_applicationactions VALUES("712","7268","Filter","Filter","2014-12-19 12:26:09","1","2014-12-19 12:26:09","1");
INSERT INTO trianik_applicationactions VALUES("713","7268","Remove item","RemoveItem","2014-12-19 12:26:09","1","2014-12-19 12:26:09","1");
INSERT INTO trianik_applicationactions VALUES("714","7268","Notify","edit","2014-12-19 12:26:09","1","2014-12-19 12:26:09","1");
INSERT INTO trianik_applicationactions VALUES("715","7268","Map","showMap","2014-12-19 12:26:09","1","2014-12-19 12:26:09","1");
INSERT INTO trianik_applicationactions VALUES("716","7268","Delivery Note","printDeliveryNote","2014-12-19 12:26:09","1","2014-12-19 12:26:09","1");
INSERT INTO trianik_applicationactions VALUES("717","7269","Filter","Filter","2014-12-19 15:12:39","1","2014-12-19 15:12:39","1");
INSERT INTO trianik_applicationactions VALUES("718","7269","Remove item","RemoveItem","2014-12-19 15:12:39","1","2014-12-19 15:12:39","1");
INSERT INTO trianik_applicationactions VALUES("719","7269","Notify","edit","2014-12-19 15:12:39","1","2014-12-19 15:12:39","1");
INSERT INTO trianik_applicationactions VALUES("720","7269","Map","showMap","2014-12-19 15:12:39","1","2014-12-19 15:12:39","1");
INSERT INTO trianik_applicationactions VALUES("721","7269","Delivery Note","printDeliveryNote","2014-12-19 15:12:39","1","2014-12-19 15:12:39","1");
INSERT INTO trianik_applicationactions VALUES("722","7270","Filter","Filter","2014-12-19 15:13:34","1","2014-12-19 15:13:34","1");
INSERT INTO trianik_applicationactions VALUES("723","7270","Remove item","RemoveItem","2014-12-19 15:13:34","1","2014-12-19 15:13:34","1");
INSERT INTO trianik_applicationactions VALUES("724","7270","Notify","edit","2014-12-19 15:13:34","1","2014-12-19 15:13:34","1");
INSERT INTO trianik_applicationactions VALUES("725","7270","Map","showMap","2014-12-19 15:13:34","1","2014-12-19 15:13:34","1");
INSERT INTO trianik_applicationactions VALUES("726","7270","Delivery Note","printDeliveryNote","2014-12-19 15:13:34","1","2014-12-19 15:13:34","1");
INSERT INTO trianik_applicationactions VALUES("727","7273","Filter","Filter","2014-12-21 13:23:44","1","2014-12-21 13:23:44","1");
INSERT INTO trianik_applicationactions VALUES("728","7273","Add item","AddItem","2014-12-21 13:23:44","1","2014-12-21 13:23:44","1");
INSERT INTO trianik_applicationactions VALUES("729","7273","View item","ViewItem","2014-12-21 13:23:44","1","2014-12-21 13:23:44","1");
INSERT INTO trianik_applicationactions VALUES("730","7273","Edit item","EditItem","2014-12-21 13:23:44","1","2014-12-21 13:23:44","1");
INSERT INTO trianik_applicationactions VALUES("731","7273","Remove item","RemoveItem","2014-12-21 13:23:44","1","2014-12-21 13:23:44","1");
INSERT INTO trianik_applicationactions VALUES("732","7274","Filter","Filter","2014-12-21 21:00:52","1","2014-12-21 21:00:52","1");
INSERT INTO trianik_applicationactions VALUES("733","7274","Add item","AddItem","2014-12-21 21:00:52","1","2014-12-21 21:00:52","1");
INSERT INTO trianik_applicationactions VALUES("734","7274","View item","ViewItem","2014-12-21 21:00:52","1","2014-12-21 21:00:52","1");
INSERT INTO trianik_applicationactions VALUES("735","7274","Edit item","EditItem","2014-12-21 21:00:52","1","2014-12-21 21:00:52","1");
INSERT INTO trianik_applicationactions VALUES("736","7274","Remove item","RemoveItem","2014-12-21 21:00:52","1","2014-12-21 21:00:52","1");
INSERT INTO trianik_applicationactions VALUES("737","7275","Filter","Filter","2014-12-21 21:01:54","1","2014-12-21 21:01:54","1");
INSERT INTO trianik_applicationactions VALUES("738","7275","Add item","AddItem","2014-12-21 21:01:54","1","2014-12-21 21:01:54","1");
INSERT INTO trianik_applicationactions VALUES("739","7275","View item","ViewItem","2014-12-21 21:01:54","1","2014-12-21 21:01:54","1");
INSERT INTO trianik_applicationactions VALUES("740","7275","Edit item","EditItem","2014-12-21 21:01:54","1","2014-12-21 21:01:54","1");
INSERT INTO trianik_applicationactions VALUES("741","7275","Remove item","RemoveItem","2014-12-21 21:01:54","1","2014-12-21 21:01:54","1");
INSERT INTO trianik_applicationactions VALUES("742","7277","Filter","Filter","2014-12-21 22:20:41","1","2014-12-21 22:20:41","1");
INSERT INTO trianik_applicationactions VALUES("743","7277","Add item","AddItem","2014-12-21 22:20:41","1","2014-12-21 22:20:41","1");
INSERT INTO trianik_applicationactions VALUES("744","7277","View item","ViewItem","2014-12-21 22:20:41","1","2014-12-21 22:20:41","1");
INSERT INTO trianik_applicationactions VALUES("745","7277","Edit item","EditItem","2014-12-21 22:20:41","1","2014-12-21 22:20:41","1");
INSERT INTO trianik_applicationactions VALUES("746","7277","Remove item","RemoveItem","2014-12-21 22:20:41","1","2014-12-21 22:20:41","1");
INSERT INTO trianik_applicationactions VALUES("747","7278","Filter","Filter","2014-12-21 22:30:08","1","2014-12-21 22:30:08","1");
INSERT INTO trianik_applicationactions VALUES("748","7278","Add item","AddItem","2014-12-21 22:30:08","1","2014-12-21 22:30:08","1");
INSERT INTO trianik_applicationactions VALUES("749","7278","View item","ViewItem","2014-12-21 22:30:08","1","2014-12-21 22:30:08","1");
INSERT INTO trianik_applicationactions VALUES("750","7278","Edit item","EditItem","2014-12-21 22:30:08","1","2014-12-21 22:30:08","1");
INSERT INTO trianik_applicationactions VALUES("751","7278","Remove item","RemoveItem","2014-12-21 22:30:08","1","2014-12-21 22:30:08","1");
INSERT INTO trianik_applicationactions VALUES("752","7267","Notify","notify","2014-12-22 13:30:40","1","2014-12-22 13:30:40","1");
INSERT INTO trianik_applicationactions VALUES("753","7286","Filter","Filter","2014-12-23 22:35:38","1","2014-12-23 22:35:38","1");
INSERT INTO trianik_applicationactions VALUES("754","7286","Add item","AddItem","2014-12-23 22:35:38","1","2014-12-23 22:35:38","1");
INSERT INTO trianik_applicationactions VALUES("755","7286","View item","ViewItem","2014-12-23 22:35:38","1","2014-12-23 22:35:38","1");
INSERT INTO trianik_applicationactions VALUES("756","7286","Edit item","EditItem","2014-12-23 22:35:38","1","2014-12-23 22:35:38","1");
INSERT INTO trianik_applicationactions VALUES("757","7286","Remove item","RemoveItem","2014-12-23 22:35:38","1","2014-12-23 22:35:38","1");
INSERT INTO trianik_applicationactions VALUES("758","7287","Filter","Filter","2014-12-23 22:37:02","1","2014-12-23 22:37:02","1");
INSERT INTO trianik_applicationactions VALUES("759","7287","Add item","AddItem","2014-12-23 22:37:02","1","2014-12-23 22:37:02","1");
INSERT INTO trianik_applicationactions VALUES("760","7287","View item","ViewItem","2014-12-23 22:37:02","1","2014-12-23 22:37:02","1");
INSERT INTO trianik_applicationactions VALUES("761","7287","Edit item","EditItem","2014-12-23 22:37:02","1","2014-12-23 22:37:02","1");
INSERT INTO trianik_applicationactions VALUES("762","7287","Remove item","RemoveItem","2014-12-23 22:37:02","1","2014-12-23 22:37:02","1");
INSERT INTO trianik_applicationactions VALUES("763","7285","Filter","Filter","2014-12-23 23:04:29","1","2014-12-23 23:04:29","1");
INSERT INTO trianik_applicationactions VALUES("764","7285","Add item","AddItem","2014-12-23 23:04:29","1","2014-12-23 23:04:29","1");
INSERT INTO trianik_applicationactions VALUES("765","7285","View item","ViewItem","2014-12-23 23:04:29","1","2014-12-23 23:04:29","1");
INSERT INTO trianik_applicationactions VALUES("766","7285","Edit item","EditItem","2014-12-23 23:04:29","1","2014-12-23 23:04:29","1");
INSERT INTO trianik_applicationactions VALUES("767","7285","Remove item","RemoveItem","2014-12-23 23:04:29","1","2014-12-23 23:04:29","1");
INSERT INTO trianik_applicationactions VALUES("768","7285","Documents","editDocuments","2014-12-23 23:04:29","1","2014-12-23 23:04:29","1");
INSERT INTO trianik_applicationactions VALUES("769","7282","Filter","Filter","2014-12-24 12:07:13","1","2014-12-24 12:07:13","1");
INSERT INTO trianik_applicationactions VALUES("770","7282","Add item","AddItem","2014-12-24 12:07:13","1","2014-12-24 12:07:13","1");
INSERT INTO trianik_applicationactions VALUES("771","7282","View item","ViewItem","2014-12-24 12:07:13","1","2014-12-24 12:07:13","1");
INSERT INTO trianik_applicationactions VALUES("772","7282","Edit item","EditItem","2014-12-24 12:07:13","1","2014-12-24 12:07:13","1");
INSERT INTO trianik_applicationactions VALUES("773","7282","Remove item","RemoveItem","2014-12-24 12:07:13","1","2014-12-24 12:07:13","1");
INSERT INTO trianik_applicationactions VALUES("774","7282","Documents","editDocuments","2014-12-24 12:07:13","1","2014-12-24 12:07:13","1");
INSERT INTO trianik_applicationactions VALUES("775","7288","Filter","Filter","2014-12-28 11:44:58","1","2014-12-28 11:44:58","1");
INSERT INTO trianik_applicationactions VALUES("776","7288","Add item","AddItem","2014-12-28 11:44:58","1","2014-12-28 11:44:58","1");
INSERT INTO trianik_applicationactions VALUES("777","7288","View item","ViewItem","2014-12-28 11:44:58","1","2014-12-28 11:44:58","1");
INSERT INTO trianik_applicationactions VALUES("778","7288","Edit item","EditItem","2014-12-28 11:44:58","1","2014-12-28 11:44:58","1");
INSERT INTO trianik_applicationactions VALUES("779","7288","Remove item","RemoveItem","2014-12-28 11:44:58","1","2014-12-28 11:44:58","1");
INSERT INTO trianik_applicationactions VALUES("780","7288","Documents","editDocuments","2014-12-28 11:44:58","1","2014-12-28 11:44:58","1");
INSERT INTO trianik_applicationactions VALUES("781","7288","Print","printQuote","2014-12-28 11:57:55","1","2014-12-28 11:57:55","1");
INSERT INTO trianik_applicationactions VALUES("782","7290","Filter","Filter","2015-01-02 13:06:35","1","2015-01-02 13:06:35","1");
INSERT INTO trianik_applicationactions VALUES("783","7290","Add item","AddItem","2015-01-02 13:06:35","1","2015-01-02 13:06:35","1");
INSERT INTO trianik_applicationactions VALUES("784","7290","View item","ViewItem","2015-01-02 13:06:35","1","2015-01-02 13:06:35","1");
INSERT INTO trianik_applicationactions VALUES("785","7290","Edit item","EditItem","2015-01-02 13:06:35","1","2015-01-02 13:06:35","1");
INSERT INTO trianik_applicationactions VALUES("786","7290","Remove item","RemoveItem","2015-01-02 13:06:35","1","2015-01-02 13:06:35","1");
INSERT INTO trianik_applicationactions VALUES("787","7288","Convert","accept","2015-01-06 20:31:32","1","2015-01-06 20:31:32","1");
INSERT INTO trianik_applicationactions VALUES("788","7291","Filter","Filter","2015-01-10 21:56:44","1","2015-01-10 21:56:44","1");
INSERT INTO trianik_applicationactions VALUES("789","7291","Add item","AddItem","2015-01-10 21:56:44","1","2015-01-10 21:56:44","1");
INSERT INTO trianik_applicationactions VALUES("790","7291","View item","ViewItem","2015-01-10 21:56:44","1","2015-01-10 21:56:44","1");
INSERT INTO trianik_applicationactions VALUES("791","7291","Edit item","EditItem","2015-01-10 21:56:44","1","2015-01-10 21:56:44","1");
INSERT INTO trianik_applicationactions VALUES("792","7291","Remove item","RemoveItem","2015-01-10 21:56:44","1","2015-01-10 21:56:44","1");
INSERT INTO trianik_applicationactions VALUES("793","7288","Undo","undo","2015-01-22 18:54:08","1","2015-01-22 18:54:08","1");
INSERT INTO trianik_applicationactions VALUES("794","7298","Filter","Filter","2015-06-13 16:08:48","1","2015-06-13 16:08:48","1");
INSERT INTO trianik_applicationactions VALUES("795","7298","Add item","AddItem","2015-06-13 16:08:48","1","2015-06-13 16:08:48","1");
INSERT INTO trianik_applicationactions VALUES("796","7298","View item","ViewItem","2015-06-13 16:08:48","1","2015-06-13 16:08:48","1");
INSERT INTO trianik_applicationactions VALUES("797","7298","Edit item","EditItem","2015-06-13 16:08:48","1","2015-06-13 16:08:48","1");
INSERT INTO trianik_applicationactions VALUES("798","7298","Remove item","RemoveItem","2015-06-13 16:08:48","1","2015-06-13 16:08:48","1");
INSERT INTO trianik_applicationactions VALUES("799","7298","Documents","editDocuments","2015-06-13 16:08:48","1","2015-06-13 16:08:48","1");
INSERT INTO trianik_applicationactions VALUES("800","7298","Invoice","accept","2015-06-13 16:08:48","1","2015-06-13 16:08:48","1");
INSERT INTO trianik_applicationactions VALUES("801","7298","Undo","undo","2015-06-13 16:08:48","1","2015-06-13 16:08:48","1");
INSERT INTO trianik_applicationactions VALUES("802","7298","Print","printQuote","2015-06-13 16:08:48","1","2015-06-13 16:08:48","1");
INSERT INTO trianik_applicationactions VALUES("803","7288","Print","printOrder","2015-06-15 11:15:06","1","2015-06-15 11:15:06","1");
INSERT INTO trianik_applicationactions VALUES("804","7298","Print","printInvoice","2015-06-15 11:59:42","1","2015-06-15 11:59:42","1");
INSERT INTO trianik_applicationactions VALUES("805","7299","Filter","Filter","2015-06-15 19:32:05","1","2015-06-15 19:32:05","1");
INSERT INTO trianik_applicationactions VALUES("806","7299","Add item","AddItem","2015-06-15 19:32:05","1","2015-06-15 19:32:05","1");
INSERT INTO trianik_applicationactions VALUES("807","7299","View item","ViewItem","2015-06-15 19:32:05","1","2015-06-15 19:32:05","1");
INSERT INTO trianik_applicationactions VALUES("808","7299","Edit item","EditItem","2015-06-15 19:32:05","1","2015-06-15 19:32:05","1");
INSERT INTO trianik_applicationactions VALUES("809","7299","Remove item","RemoveItem","2015-06-15 19:32:05","1","2015-06-15 19:32:05","1");
INSERT INTO trianik_applicationactions VALUES("810","7299","Documents","editDocuments","2015-06-15 19:32:05","1","2015-06-15 19:32:05","1");
INSERT INTO trianik_applicationactions VALUES("811","7300","Filter","Filter","2015-06-15 19:36:54","1","2015-06-15 19:36:54","1");
INSERT INTO trianik_applicationactions VALUES("812","7300","Add item","AddItem","2015-06-15 19:36:54","1","2015-06-15 19:36:54","1");
INSERT INTO trianik_applicationactions VALUES("813","7300","View item","ViewItem","2015-06-15 19:36:54","1","2015-06-15 19:36:54","1");
INSERT INTO trianik_applicationactions VALUES("814","7300","Edit item","EditItem","2015-06-15 19:36:54","1","2015-06-15 19:36:54","1");
INSERT INTO trianik_applicationactions VALUES("815","7300","Remove item","RemoveItem","2015-06-15 19:36:54","1","2015-06-15 19:36:54","1");
INSERT INTO trianik_applicationactions VALUES("816","7300","Documents","editDocuments","2015-06-15 19:36:54","1","2015-06-15 19:36:54","1");
INSERT INTO trianik_applicationactions VALUES("817","7288","Delivery Note","printDelivery","2015-06-18 18:56:14","1","2015-06-18 18:56:14","1");
INSERT INTO trianik_applicationactions VALUES("818","7280","Filter","Filter","2015-06-28 16:11:16","1","2015-06-28 16:11:16","1");
INSERT INTO trianik_applicationactions VALUES("819","7280","Add item","AddItem","2015-06-28 16:11:16","1","2015-06-28 16:11:16","1");
INSERT INTO trianik_applicationactions VALUES("820","7280","View item","ViewItem","2015-06-28 16:11:16","1","2015-06-28 16:11:16","1");
INSERT INTO trianik_applicationactions VALUES("821","7280","Edit item","EditItem","2015-06-28 16:11:16","1","2015-06-28 16:11:16","1");
INSERT INTO trianik_applicationactions VALUES("822","7280","Remove item","RemoveItem","2015-06-28 16:11:16","1","2015-06-28 16:11:16","1");
INSERT INTO trianik_applicationactions VALUES("823","7280","Documents","editDocuments","2015-06-28 16:11:16","1","2015-06-28 16:11:16","1");
INSERT INTO trianik_applicationactions VALUES("824","7303","Filter","Filter","2015-06-28 16:31:16","1","2015-06-28 16:31:16","1");
INSERT INTO trianik_applicationactions VALUES("825","7303","Add item","AddItem","2015-06-28 16:31:16","1","2015-06-28 16:31:16","1");
INSERT INTO trianik_applicationactions VALUES("826","7303","View item","ViewItem","2015-06-28 16:31:16","1","2015-06-28 16:31:16","1");
INSERT INTO trianik_applicationactions VALUES("827","7303","Edit item","EditItem","2015-06-28 16:31:16","1","2015-06-28 16:31:16","1");
INSERT INTO trianik_applicationactions VALUES("828","7303","Remove item","RemoveItem","2015-06-28 16:31:16","1","2015-06-28 16:31:16","1");
INSERT INTO trianik_applicationactions VALUES("829","7303","Documents","editDocuments","2015-06-28 16:31:16","1","2015-06-28 16:31:16","1");
INSERT INTO trianik_applicationactions VALUES("830","7106","Filter","Filter","2015-07-02 19:26:19","1","2015-07-02 19:26:19","1");
INSERT INTO trianik_applicationactions VALUES("831","7106","View item","ViewItem","2015-07-02 19:26:19","1","2015-07-02 19:26:19","1");
INSERT INTO trianik_applicationactions VALUES("832","7106","Edit item","EditItem","2015-07-02 19:26:19","1","2015-07-02 19:26:19","1");
INSERT INTO trianik_applicationactions VALUES("833","7106","Remove item","RemoveItem","2015-07-02 19:26:19","1","2015-07-02 19:26:19","1");
INSERT INTO trianik_applicationactions VALUES("834","7106","User Roles","actionRoles","2015-07-02 19:26:19","1","2015-07-02 19:26:19","1");
INSERT INTO trianik_applicationactions VALUES("835","7305","Filter","Filter","2015-07-02 21:33:20","1","2015-07-02 21:33:20","1");
INSERT INTO trianik_applicationactions VALUES("836","7305","Add item","AddItem","2015-07-02 21:33:20","1","2015-07-02 21:33:20","1");
INSERT INTO trianik_applicationactions VALUES("837","7305","View item","ViewItem","2015-07-02 21:33:20","1","2015-07-02 21:33:20","1");
INSERT INTO trianik_applicationactions VALUES("838","7305","Edit item","EditItem","2015-07-02 21:33:20","1","2015-07-02 21:33:20","1");
INSERT INTO trianik_applicationactions VALUES("839","7305","Remove item","RemoveItem","2015-07-02 21:33:20","1","2015-07-02 21:33:20","1");
INSERT INTO trianik_applicationactions VALUES("840","7308","Filter","Filter","2015-07-03 20:24:18","1","2015-07-03 20:24:18","1");
INSERT INTO trianik_applicationactions VALUES("841","7308","Add item","AddItem","2015-07-03 20:24:18","1","2015-07-03 20:24:18","1");
INSERT INTO trianik_applicationactions VALUES("842","7308","View item","ViewItem","2015-07-03 20:24:18","1","2015-07-03 20:24:18","1");
INSERT INTO trianik_applicationactions VALUES("843","7308","Edit item","EditItem","2015-07-03 20:24:18","1","2015-07-03 20:24:18","1");
INSERT INTO trianik_applicationactions VALUES("844","7308","Remove item","RemoveItem","2015-07-03 20:24:18","1","2015-07-03 20:24:18","1");
INSERT INTO trianik_applicationactions VALUES("845","7308","Documents","editDocuments","2015-07-03 20:24:18","1","2015-07-03 20:24:18","1");
INSERT INTO trianik_applicationactions VALUES("846","7308","Match Card","reportCard","2015-07-05 10:52:39","1","2015-07-05 10:52:39","1");
INSERT INTO trianik_applicationactions VALUES("847","7311","Filter","Filter","2015-07-06 18:44:41","1","2015-07-06 18:44:41","1");
INSERT INTO trianik_applicationactions VALUES("848","7311","Add item","AddItem","2015-07-06 18:44:41","1","2015-07-06 18:44:41","1");
INSERT INTO trianik_applicationactions VALUES("849","7311","View item","ViewItem","2015-07-06 18:44:41","1","2015-07-06 18:44:41","1");
INSERT INTO trianik_applicationactions VALUES("850","7311","Edit item","EditItem","2015-07-06 18:44:41","1","2015-07-06 18:44:41","1");
INSERT INTO trianik_applicationactions VALUES("851","7311","Remove item","RemoveItem","2015-07-06 18:44:41","1","2015-07-06 18:44:41","1");
INSERT INTO trianik_applicationactions VALUES("852","130","Documents","editDocuments","2015-08-04 20:36:53","1","2015-08-04 20:36:53","1");
INSERT INTO trianik_applicationactions VALUES("853","130","Add item","AddItem","2015-08-04 20:36:57","1","2015-08-04 20:36:57","1");
INSERT INTO trianik_applicationactions VALUES("854","7315","Filter","Filter","2015-08-04 20:37:29","1","2015-08-04 20:37:29","1");
INSERT INTO trianik_applicationactions VALUES("855","7315","Add item","AddItem","2015-08-04 20:37:29","1","2015-08-04 20:37:29","1");
INSERT INTO trianik_applicationactions VALUES("856","7315","View item","ViewItem","2015-08-04 20:37:29","1","2015-08-04 20:37:29","1");
INSERT INTO trianik_applicationactions VALUES("857","7315","Edit item","EditItem","2015-08-04 20:37:29","1","2015-08-04 20:37:29","1");
INSERT INTO trianik_applicationactions VALUES("858","7315","Remove item","RemoveItem","2015-08-04 20:37:29","1","2015-08-04 20:37:29","1");
INSERT INTO trianik_applicationactions VALUES("859","7316","Filter","Filter","2015-08-09 20:13:45","1","2015-08-09 20:13:45","1");
INSERT INTO trianik_applicationactions VALUES("860","7316","Add item","AddItem","2015-08-09 20:13:45","1","2015-08-09 20:13:45","1");
INSERT INTO trianik_applicationactions VALUES("861","7316","View item","ViewItem","2015-08-09 20:13:45","1","2015-08-09 20:13:45","1");
INSERT INTO trianik_applicationactions VALUES("862","7316","Edit item","EditItem","2015-08-09 20:13:45","1","2015-08-09 20:13:45","1");
INSERT INTO trianik_applicationactions VALUES("863","7316","Remove item","RemoveItem","2015-08-09 20:13:45","1","2015-08-09 20:13:45","1");
INSERT INTO trianik_applicationactions VALUES("864","7316","Approve","approveHoliday","2015-08-09 20:13:45","1","2015-08-09 20:13:45","1");
INSERT INTO trianik_applicationactions VALUES("865","7316","Reject","rejectHoliday","2015-08-09 20:13:45","1","2015-08-09 20:13:45","1");
INSERT INTO trianik_applicationactions VALUES("866","7280","New Starter Form","newStarterForm","2015-08-16 14:07:36","1","2015-08-16 14:07:36","1");
INSERT INTO trianik_applicationactions VALUES("867","7320","Filter","Filter","2015-08-28 11:54:21","1","2015-08-28 11:54:21","1");
INSERT INTO trianik_applicationactions VALUES("868","7320","Add item","AddItem","2015-08-28 11:54:21","1","2015-08-28 11:54:21","1");
INSERT INTO trianik_applicationactions VALUES("869","7320","View item","ViewItem","2015-08-28 11:54:21","1","2015-08-28 11:54:21","1");
INSERT INTO trianik_applicationactions VALUES("870","7320","Edit item","EditItem","2015-08-28 11:54:21","1","2015-08-28 11:54:21","1");
INSERT INTO trianik_applicationactions VALUES("871","7320","Remove item","RemoveItem","2015-08-28 11:54:21","1","2015-08-28 11:54:21","1");
INSERT INTO trianik_applicationactions VALUES("872","7321","Filter","Filter","2015-09-01 17:46:29","1","2015-09-01 17:46:29","1");
INSERT INTO trianik_applicationactions VALUES("873","7321","View item","ViewItem","2015-09-01 17:46:29","1","2015-09-01 17:46:29","1");
INSERT INTO trianik_applicationactions VALUES("874","7321","Remove item","RemoveItem","2015-09-01 17:46:29","1","2015-09-01 17:46:29","1");
INSERT INTO trianik_applicationactions VALUES("875","7323","Filter","Filter","2015-11-05 17:28:10","1","2015-11-05 17:28:10","1");
INSERT INTO trianik_applicationactions VALUES("876","7323","Add item","AddItem","2015-11-05 17:28:10","1","2015-11-05 17:28:10","1");
INSERT INTO trianik_applicationactions VALUES("877","7323","View item","ViewItem","2015-11-05 17:28:10","1","2015-11-05 17:28:10","1");
INSERT INTO trianik_applicationactions VALUES("878","7323","Edit item","EditItem","2015-11-05 17:28:10","1","2015-11-05 17:28:10","1");
INSERT INTO trianik_applicationactions VALUES("879","7323","Remove item","RemoveItem","2015-11-05 17:28:10","1","2015-11-05 17:28:10","1");



DROP TABLE trianik_applicationtablecolumns;

CREATE TABLE `trianik_applicationtablecolumns` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `headerid` int(10) NOT NULL,
  `columnindex` int(10) NOT NULL,
  `width` int(10) NOT NULL,
  `hidecolumn` int(10) NOT NULL DEFAULT '0',
  `label` varchar(60) NOT NULL,
  `metacreateddate` datetime NOT NULL,
  `metacreateduserid` int(11) NOT NULL,
  `metamodifieddate` datetime NOT NULL,
  `metamodifieduserid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `headerid_column` (`headerid`,`columnindex`)
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=latin1;




DROP TABLE trianik_applicationtables;

CREATE TABLE `trianik_applicationtables` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pageid` int(10) NOT NULL,
  `memberid` int(10) NOT NULL,
  `metacreateddate` datetime NOT NULL,
  `metacreateduserid` int(11) NOT NULL,
  `metamodifieddate` datetime NOT NULL,
  `metamodifieduserid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;




DROP TABLE trianik_bankholiday;

CREATE TABLE `trianik_bankholiday` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `daystaken` float DEFAULT NULL,
  `enddate_half` int(11) DEFAULT NULL,
  `startdate_half` int(11) DEFAULT NULL,
  `metacreateddate` date DEFAULT NULL,
  `metamodifieddate` date DEFAULT NULL,
  `metacreateduserid` int(11) DEFAULT NULL,
  `metamodifieduserid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=latin1;

INSERT INTO trianik_bankholiday VALUES("98","Christmass","2015-12-25","2015-12-28","2","1","1","2015-11-05","2015-11-05","1","1");



DROP TABLE trianik_client;

CREATE TABLE `trianik_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imageid` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `firstname` varchar(25) DEFAULT NULL,
  `lastname` varchar(25) DEFAULT NULL,
  `address` text,
  `billingaddress` text,
  `paperfreebillingaddress` text,
  `specificrequirements` text,
  `valuablestoberemoved` text,
  `email` varchar(60) DEFAULT NULL,
  `numberofbedrooms` int(11) DEFAULT NULL,
  `numberofbathrooms` int(11) DEFAULT NULL,
  `numberofkeysgiven` int(11) DEFAULT NULL,
  `alarmfobgiven` varchar(1) DEFAULT NULL,
  `alarmcodes` varchar(5) DEFAULT NULL,
  `keycodes` varchar(20) DEFAULT NULL,
  `accessinstructions` varchar(60) DEFAULT NULL,
  `hoursrequired` decimal(10,2) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `workphone` varchar(15) DEFAULT NULL,
  `paymentmethod` varchar(1) DEFAULT NULL,
  `ironingrequired` varchar(1) DEFAULT NULL,
  `vacuum` varchar(1) DEFAULT NULL,
  `frequency` varchar(1) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `preferreddaytime` varchar(60) DEFAULT NULL,
  `fax` varchar(15) DEFAULT NULL,
  `metacreateduserid` int(11) DEFAULT NULL,
  `metamodifieduserid` int(11) DEFAULT NULL,
  `metacreateddate` datetime DEFAULT NULL,
  `metamodifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=38344 DEFAULT CHARSET=latin1;

INSERT INTO trianik_client VALUES("38245","","Smith","L","Denise","Smith",0x436875726368204c616e6520486f757365200d0a436875726368204c616e650d0a576573746c65792057617465726c6573730d0a4342382030524c,0x436875726368204c616e6520486f757365200d0a436875726368204c616e650d0a576573746c65792057617465726c6573730d0a4342382030524c,0x64646d7232343638407961686f6f2e636f2e756b,0x42652076657279206361726566756c20616e642067656e746c65207769746820616e74697175652072756720696e207468652073697474696e6720726f6f6d2e0d0a0d0a76616375756d20696e206c696e656e20637570626f6172642075707374616972730d0a0d0a4a4f425320464f522045564552592056495349540d0a0d0a73697474696e6720726f6f6d202d206475737420616e64207661630d0a636f6e7365727661746f72792061726561202d206475737420616e642076616320616e64206d6f700d0a706c6179726f6f6d202d206475737420616e64207661630d0a7374756479202d206475737420616e6420766163202d20776f726b2061726f756e64207374756666206f6e206465736b206574630d0a5468657261707920726f6f6d202d206475737420616e64207661630d0a5743202d2067656e6572616c20636c65616e696e670d0a73746f6e6520666c6f6f7273207468726f7567686f757420746f206265206d6f707065640d0a7574696c69747920726f6f6d202d2067656e6572616c20636c65616e20696e636c7564696e6720666c6f6f72730d0a6b69746368656e202d2067656e6572616c20636c65616e0d0a6d617374657220626564726f6f6d206475737420616e6420766163202b20656e737569746520636c65616e0d0a6472657373696e6720726f6f6d0d0a626564726f6f6d73202d206c65617665206465736b730d0a66616d696c792062617468726f6f6d0d0a0d0a4f43434153494f4e414c20524551554952454d454e54530d0a6576657279206d6f6e74682f36207765656b73207769706520646f776e20776f6f64776f726b20616e642077696e646f77206c65646765730d0a677572737420726f6f6d206f6e63652061206d6f6e74680d0a77696e646f777320746f20626520726f746174656420616e6420646f6e65206d6f6e74686c790d0a0d0a4a4f425320544f20424520444f4e45204f4e4c59205748454e2041534b45440d0a0d0a6d6f7070696e67206f662073697474696e6720726f6f6d20666c6f6f722c20706c6179726f6f6d20666c6f6f720d0a626f6f6b7320696e207468657261707920726f6f6d0d0a0d0a4d617374657220626564726f6f6d20656e2d7375697465202d207468652073686f7765722068656164206f6e207468652062617468206973206e6f7420776f726b696e67202d20646f206e6f74207573652e200d0a,0x,"ddmr2468@yahoo.co.uk","4","2","1","Y","","","Front door key has been given (main door to utility room)wav","4.00","07900281975","07900281975","07900281975","B","N","Y","W","2015-08-24","Mondays 8.30am","","1","1","2015-08-27 08:15:14","2015-08-27 08:15:14");
INSERT INTO trianik_client VALUES("38246","","Savage","L","Kevin & Bernadette","Savage",0x43686170656c20436f74746167650d0a33332048696768205374726565740d0a4368697070656e68616d0d0a456c790d0a434237203550520d0a,0x43686170656c20436f74746167650d0a33332048696768205374726565740d0a4368697070656e68616d0d0a456c790d0a43423720355052,0x62616e646b73617661676540676d61696c2e636f6d,0x4a4f425320464f52204556455259205745454b0d0a0d0a6b69746368656e0d0a62617468726f6f6d0d0a73747564790d0a67656e6572616c20636c65616e696e67207468726f7567686f75742c20657370656369616c6c7920646f672061726561732e200d0a73697474696e6720726f6f6d2064696e696e6720617265610d0a76616375756d20616e64206d6f702074686520666c6f6f72730d0a0d0a616c7465726e61746520737061726520726f6f6d732065616368207765656b0d0a6f76656e20636c65616e206f63636173696f6e616c6c790d0a646f2061206665772077696e646f77732065616368207765656b20736f20746861742077697468696e2061206d696e746820746865792061726520616c6c20646f6e650d0a0d0a796f752077696c6c206e656564206c65617468657220706f6c69736820666f722074686520736f666173,0x,"bandksavage@gmail.com","2","1","1","N","","","conservatory door key","2.00","07769250050","07769250050","07769250050","B","","Y","W","2015-08-24","mondays 1.30","","1","1","2015-08-27 08:23:01","2015-08-27 08:23:01");
INSERT INTO trianik_client VALUES("38247","","Cheffins","L","Rebecca","Golding",0x4368656666696e73205265736964656e7469616c204c657474696e670d0a426c61636b204265617220436f7572740d0a48496768205374726565740d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820394146,0x4368656666696e73205265736964656e7469616c204c657474696e670d0a426c61636b204265617220436f7572740d0a48496768205374726565740d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820394146,0x726562656363612e676f6c64696e67406368656666696e732e636f2e756b,0x47656e6572616c204f666669636520636c65616e696e670d0a0d0a55736520677265656e207369646520646f6f722e200d0a0d0a456d7074792062696e732c20776173682075702e0d0a0d0a4475737462696e206f757473696465206261636b20646f6f7220696e206b69746368656e2067656e6572616c20636c65616e696e672e0d0a0d0a4966206c656176696e67206265666f726520382e333020616d2e2053657420616c72616d206279207072657373696e6420e2809c534554e2809d207468656e206e756d62657220e2809c31e2809d2e0d0a0d0a0d0a506c656173652066696e6420656d657267656e637920636f6e74616374206e756d626572732062656c6f772028686f706566756c6c79206f6e65206f662075732073686f756c6420626520617661696c61626c6521293a0d0a0d0a4e65696c202d203037383831203931323430300d0a52696368617264202d203037373935203536383138300d0a52656265636361202d203037353135203134333039330d0a,0x30,"rebecca.golding@cheffins.co.uk","0","0","1","N","1825","","The code is 1825 which you need to enter on arrival into the","5.00","01638663228","01638663228","01638663228","B","N","N","W","2015-08-24","1 hour a day","","1","1","2015-08-27 08:27:40","2015-08-27 08:27:40");
INSERT INTO trianik_client VALUES("38248","","Caps Cases","L","Sarah ","Burch",0x537475646c616e6473205061726b20496e647573747269616c204573746174650d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820374155,0x537475646c616e6473205061726b20496e647573747269616c204573746174650d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820374155,0x7361726168406361707363617365732e636f2e756b,0x,0x,"sarah@capscases.co.uk","0","0","5","N","","","","17.50","01638 672841","01638 672841","01638 672841","B","N","N","W","2015-08-24","3.5 hrs daily","","1","1","2015-08-27 08:35:17","2015-08-27 08:35:17");
INSERT INTO trianik_client VALUES("38249","","Hardy","L","Emma ","Hardy",0x456d6d612048617264790d0a4361727368657265720d0a5468652044726966740d0a45786e696e670d0a537566666f6c6b0d0a4342382037455a0d0a,0x456d6d612048617264790d0a4361727368657265720d0a5468652044726966740d0a45786e696e670d0a537566666f6c6b0d0a4342382037455a0d0a,0x656d6d61686172647931353040676d61696c2e636f6d,0x0d0a47656e6572616c20636c65616e696e67207468726f7567686f75742e0d0a746f20696e636c75646520696e736964652077696e646f777320616e6420646f6f72730d0a0d0a4f76656e20746f20626520636c65616e6564206f6e2066697273742076697369742e0d0a0d0a555345204847204d4f554c4420414e44204d494c4445572052454d4f564552204f4e20464952535420564953495420494e20454e53554954452053484f57455220524f4f4d2028534545204d45290d0a0d0a56616375756d20756e646572207374616972730d0a0d0a4f63636173696f6e616c6c7920612066657720736869727473206d6179206e6565642069726f6e696e670d0a0d0a4e6f2070726f6475637473206f6e20746865205456,0x,"emmahardy150@gmail.com","0","0","0","N","","","","2.00","01638577561","07713243580","","B","N","Y","W","2015-08-24","tuesdays","","1","1","2015-08-27 08:41:55","2015-08-27 08:41:55");
INSERT INTO trianik_client VALUES("38250","","Richards D","L","David","Richards",0x446f6c6c796e20436f74746167650d0a31392d3231205365746368776f72746820526f61640d0a44756c6c696e6768616d0d0a4342382039554a,0x446f6c6c796e20436f74746167650d0a31392d3231205365746368776f72746820526f61640d0a44756c6c696e6768616d0d0a4342382039554a,0x64617669642e722e7269636861726473406b636c2e61632e756b,0x6966207468657920617265206f757420646f206e6f74206c6574207468652063617473206f75742e200d0a0d0a0d0a436c65616e20616c6c206f662075707374616972732c2062617468726f6f6d732c20686f6f76657220616e64206475737420616e6420636c65616e2077696e646f777320696e2064617567687465727320626564726f6f6d2c206d617374657220626564726f6f6d2c2068616c6c7761797320617265617320616e64202020202020206f66666963652e0d0a436c65616e206b69746368656e2c20696e636c7564696e672073757266616365732c20686f6f76657220616e64206d6f7020616e642077696e646f77732e0d0a4d727320526963686172647320757375616c6c792074656c6c73207768617420656c73652073686520776f756c64206c696b6520646f696e672e0d0a4966207368652773206e6f742074686572652c206920757375616c6c7920636c65616e207468652066726f6e7420726f6f6d2c2064696e696e6720726f6f6d20616e642073747564792e0d0a486f6f766572206c6f636174656420696e20746865207574696c69747920726f6f6d20617420746865206261636b206f66207468652073747564792e0d0a,0x,"david.r.richards@kcl.ac.uk","0","0","1","N","","","","2.00","07960 980747","07960 980747","07960 980747","B","","Y","T","2015-08-24","tues","","1","1","2015-08-27 08:47:02","2015-08-27 09:13:43");
INSERT INTO trianik_client VALUES("38251","","George","L","Catherine","George",0x57696e646d696c6c20436f74746167650d0a3334204d696c6c2048696c6c0d0a537761666668616d205072696f720d0a4342323520304a5a,0x57696e646d696c6c20436f74746167650d0a3334204d696c6c2048696c6c0d0a537761666668616d205072696f720d0a4342323520304a5a,0x637367656f7267653237406274696e7465726e65742e636f6d,0x47656e6572616c20636c65616e696e67207468726f7567686f75742e0d0a42617468726f6f6d7320746f20626520646f6e6520657665727920766973697420616e6420726f746174652061726f756e64207468652072657374206f662074686520686f757365206173206d75636820617320796f752063616e20656163682074696d650d0a0d0a4672656e63682077696e646f777320746f20626520636c65616e65642065766572792076697369740d0a0d0a70617920617474656e74696f6e20746f20736b697274696e6720626f617264732c20626c6561636820746865206b69746368656e2073696e6b20617320736865206c696b657320746f20736565207368696e7920706c7567686f6c6573206574632e20776f6f64656e20636f76696e6720696e204b69746368656e2061626f76652074686520616761206e6565647320646f696e672e20446f204e4f5420636c65616e204167610d0a0d0a776f726b2061726f756e64207468652061727420726f6f6d20616e6420646f206e6f742067657420737072617973206f6e2061727420776f726b20736f206265206361726566756c0d0a0d0a426f6f7420726f6f6d202d2020646f2074686520737572666163657320616e6420666c6f6f720d0a68616c6c77617920616e6420636c6f616b20726f6f6d20746f20626520647574656420616e642076616375756d65640d0a0d0a626564726f6f6d7320616e6420656e7375697465732d2067656e6572616c20636c65616e696e67207468726f7567686f75740d0a0d0a4a7573742076616375756d2061726f756e642074686520756e66696e697368656420726f6f6d0d0a0d0a436c65616e206c696768742066697474696e677320616e642070696374757265206672616d65730d0a0d0a5468657265206973206120776f6f64656e206172656120756e6465726e6561746820746865207374616972732077686963682069732076697361626c6520616e642061636365737361626c652c20706c6561736520636c65616e20756e6465722074686572652e0d0a,0x,"csgeorge27@btinternet.com","0","0","0","N","","","","2.50","01638743828"," 07776054329","","B","N","Y","T","2015-09-08","tuesd","","1","1","2015-08-27 08:52:14","2015-08-27 08:52:14");
INSERT INTO trianik_client VALUES("38252","","Viljoen","L","Therese","Viljoen",0x34352053746174696f6e20526f61640d0a44756c6c696e6768616d0d0a537566666f6c6b0d0a43423820395550,0x34352053746174696f6e20526f61640d0a44756c6c696e6768616d0d0a537566666f6c6b0d0a43423820395550,0x76696c6c696573406274696e7465726e65742e636f6d,0x204d61696e20726571756972656d656e74732061726520746865206b69746368656e20616e642062617468726f6f6d732074686572652077696c6c20746f206265206c61756e64727920746f20626520646f6e65206f6e20656163682076697369742c2068616e6720776574206c61756e64727920656974686572206f6e207261696c20696e207468652062617468726f6f6d2c206f7220696e206d61696e20626564726f6f6d20776865726520746865726520617265204169726572732e20546f77656c7320616e642042656464696e672070757420696e2054756d626c652044727965722e2020466f6c64206f722069726f6e204c61756e6472792074686174206973206472792c207468657265206d617920626520736f6d6520616c72656164792064727920696e2074756d626c652064727965722e2046726964617973204920757375616c6c7920646f207468652069726f6e696e672c20736f6d65206f6620746865204368696c6472656e277320636c6f7468657320646f206e6f7420616c77617973206e65656420746f2062652069726f6e65642e20546865726520697320616c776179732077617368696e6720757020746f20626520646f6e6520616e642070757420617761792e0d0a476c617373205461626c6520696e206b69746368656e2077696c6c206e656564206120676f6f6420636c65616e2e20416c6c207375726661636573206e65656420776970696e6720637570626f61726473206e65656420776970696e6720646f776e206f6e20657665727920766973697420617320746865792061726520776869746520616e642073686f772066696e676572206d61726b732e20546869732069732061206c61726765204b69746368656e2c206265206177617265206f6620636f627765627320617320746865726520617265206265616d732e20486f6f76657220616e64207761736820666c6f6f72732e20446f776e73746169727320746865726520697320612042617468726f6f6d20776974682073686f7765722e204c61726765206c6f756e676520636c65616e20616c6c204675726e69747572652e205468657265206172652074776f2073657473206f6620737461697273206f6e6520776f6f64656e20696e206c6f756e676520616e6420746865206f7468657220617420656e64206f6620686f75736520776865726520746865726520697320616c736f206120736d616c6c206c6f756e676520746861742077696c6c206e65656420636c65616e696e6720616761696e20776f6f64656e206265616d732e2055707374616972732067656e6572616c20636c65616e696e6720706179696e6720617474656e74696f6e20746f207468652042617468726f6f6d7320616e6420426564726f6f6d732e200d0a646f6e2774206c656176652077617368696e67206d616368696e65206f6e206f722074756d626c65206472796572207768656e20796f75206c656176652e204173202074686520686f75736520686173206120746861746368656420726f6f6620616e64205468657265736520697320636f6e6365726e65642061626f757420666972650d0a0d0a4b69746368656e3a200d0a53746f766520746f70202d2073686f756c646e277420757365206162726173697665206d6174657269616c7320617320616e20696e64756374696f6e20676c61737320746f702e200d0a4772616e697465207375666163657320696e206b69746368656e207468657265666f7265206772616e69746520737065636966696320636c65616e696e67206167656e7473206c696b6520224d6574686f64206772616e6974652220776f726b7320626573740d0a486173206120225a6970222074617020666f7220626f696c696e6720776174657220616e642066696c746572656420636f6c6420776174657220696e206b69746368656e2e2028466f7220636f6c642077617465722074686520626c7565206c6576657220617265207072657373656420646f776e7761726473292054686520626f696c696e672077617465722068617320676f7420612073616665747920627574746f6e20736f2074686520726564206c657665722068617320746f2062652070757368656420646f776e207768696c6520616c736f207072657373696e67207468652070696e6b2073616665747920627574746f6e2e20496620746865207761746572206b656570732072756e6e696e67206d616b65207375726520746865206c6576657220617265207072657373656420616761696e20746f2073746f7020666c6f772e0d0a5468657265206973206120646f6720666c617020746f20746865206261636b2067617264656e206f7574206f6620746865206b69746368656e20736f20706c65617365206d616b65207375726520746861742063686169727320617265206e6f74206c65667420746f6f20636c6f736520736f20746861742074686520646f6720437573746f2063616e277420676574206f7574206f7220696e2e0d0a200d0a446f776e7374616972732062617468726f6f6d3a0d0a446f776e7374616972732073686f7765723a20546865207461707320616e64206672616d65776f726b2061726f756e6720676c6173732069736e277420737461696e6c65737320737465656c20736f206265737420746f207573652061206e6f726d616c206e6f6e20626c65616368206167656e74206c696b65206120224d6574686f642220616c6c20707572706f7365200d0a426967206c6976696e6720726f6f6d20616e64204d617374657220626564726f6f6d3a0d0a54686572652061726520646f75626c652073776974636865736e65787420746f2065766572792077696e646f7720696e20626967206c6976696e6720726f6f6d2028206c6f6f6b73206c696b65207768697465206c696768742073776974636865732920616e64206d617374657220626564726f6f6d20282073696c76657220636f6c6f7572656429205468657365206f6e657320697320666f722074686520656c65637472696320626c696e647320736f2073686f756c646e277420626520636f6e66757365642077697468206c69676874207377697463686573207768696368206c6f6f6b732073696d696c617220616e642069732061626f766520697420696e206c6976696e6720726f6f6d2e2049742069742069732070726573736564206279206163636964656e742069742063616e2062652073746f70706564206279207072657373696e67206f6e65206f6620746865203220737769746368657320616761696e2e20496e2061206c6f74206f662074686520726f6f6d7320746865206c696768742073776974636865732061726520666c617420626c61636b2073776974636865732e200d0a0d0a5468652075707374616972732062617468726f6f6d206f70706f7369746520746865206d617374657220626564726f6f6d3a0d0a54686973206973207768657265207468652077617368696e67206d616368696e6520616e642074756d626c6520647279657220617265206b6570742e0d0a5468652074756d626c65206472796572206e6565647320746f20626520656d7074696564206f6666207761746572206166746572206576657279206379636c652e205468697320706c617374696320647261776572206973206c65667420746f7020636f726e65722e2028736f6d6574696d6573207468657265206d69676874206e6f74206265206d75636820776174657220696e206974290d0a5468652064726177657220696e2074686520646f6f72206f662074756d626c65206472796572206e6565647320746f20626520656d7074696564206f662022666c756666220d0a5468652069726f6e206973206b657074206f6e20746865207375726661636520746f207468652072696768742073696465206f662077617368696e67206d616368696e6520616e64206e6565647320746f2062652066696c6c656420776974682077617465722e20287468657265206973206120636c65617220706c617374696320736d616c6c2066696c6c696e67206a7567290d0a5468652069726f6e696e6720626f617264206973206b65707420696e20746865207761726d20637570626f617264206f6e20746865206c616e64696e672e20287374726169676874206168656164207768656e20796f7520636c696d6220757020746f206f70656e20776f6f64656e207374616972732e20287468652073746169722067617465206e6565647320746f20626520636c6f73656420696e206f7264657220746f206f70656e20746865207761726d20637570626f61726420646f6f722e0d0a0d0a546865206761746520746f207468652064726976657761792073686f756c6420616c77617973206265206b65707420636c6f73656420736f20746861742074686520646f6720646f65736e277420676f206f757420746f20746865207374726565742e2054686520646f672063616e20676f20696e20616e64206f7574206f6620686f757365207468726f7567682074686520646f6720666c617020616e6420686173207468657265666f72652066726565646f6d206f6620746865206261636b2067617264656e2e2028686520646f65732074656e6420746f207374617920696e2074686520686f757365206d6f7374206f66207468652074696d65290d0a,0x,"villies@btinternet.com","4","3","1","","","","","12.00","01638 508876","07799532081","","B","Y","Y","W","2015-08-24","mon wed fri","","1","1","2015-08-27 09:02:04","2015-08-27 09:02:04");
INSERT INTO trianik_client VALUES("38253","","Osbaldeston","L","Chantal","Osbaldeston",0x32204261646c696e6768616d204661726d0d0a4261646c696e6768616d0d0a456173742043616d62730d0a434237203551510d0a,0x32204261646c696e6768616d204661726d0d0a4261646c696e6768616d0d0a456173742043616d62730d0a43423720355151,0x6368616e74616c2e66696e636840676f6f676c656d61696c2e636f6d,0x4e656172206368697070656e68616d2c2061742074686520656e64206f66206e6577207374726565742074686520686f757365206973206f6e207468652062656e64206f6e20796f75722072696768742068616e6420736964652e200d0a0d0a76616375756d20697320696e207468652068616c6c7761790d0a0d0a4d6f6e64617973202d200d0a4b69746368656e0d0a64757374696e670d0a706f6c697368696e670d0a76616320616e64206d6f7020666c6f6f72730d0a74696479206b69647320706c617920617265610d0a0d0a5468757273646179730d0a42617468726f6f6d0d0a67656e6572616c2074696479696e670d0a626564726f6f6d730d0a77696e646f77730d0a76616375756d0d0a0d0a6368616e6765206265647320657665727920666f72746e696768740d0a49726f6e696e67206d6179206f63636173696f6e616c6c79206265207265717565737465640d0a0d0a6d6972726f7220696e2073697474696e6720726f6f6d206973206a7573742062616c616e63656420736f2062652076657279206361726566756c0d0a73686f776572206865616420636c697020697320616c736f206c6f6f73650d0a6d6972726f7220696e2062617468726f6f6d206973206e74207365637572650d0a0d0a67656e6572616c2068656c7020697320726571756972656420686572652064756520746f206368616e74616c20686176696e67206d616a6f6972206261636b20737572676572792073686520697320756e61626c6520746f20646f20616e797468696e670d0a0d0a444f204e4f542053454e44204c4f525241494e4520464f5220434f56455220434c45414e494e4720415320544845592041524520504552534f4e414c20465249454e44530d0a,0x,"chantal.finch@googlemail.com","2","1","1","N","","","back door key given","2.00","07545884295","07545884295","07545884295","B","Y","Y","W","2015-08-25","mon and thurs","","1","1","2015-08-27 09:08:11","2015-08-27 09:08:11");
INSERT INTO trianik_client VALUES("38255","","Richards M","L","Mary","Richards",0x31372062616b65686f7573652068696c6c0d0a44756c6c696e6768616d0d0a4342382039584a,0x31372062616b65686f7573652068696c6c0d0a44756c6c696e6768616d0d0a4342382039584a,0x6e6f6e65,0x5368652077696c6c20626520746865726520746f206c657420796f7520696e20616e642077696c6c206769766520696e737472756374696f6e73206f6e2074686520646179,0x,"none","0","0","0","N","","","","1.50","01638 507 218","01638 507 218","01638 507 218","Q","N","Y","T","2015-09-02","wed","","1","1","2015-08-27 09:13:35","2015-08-27 09:13:35");
INSERT INTO trianik_client VALUES("38256","","Cuney","L","sandrine","Cuney",0x36312048696e746f6e204176656e75650d0a43616d6272696467650d0a43616d62726964676573686972650d0a43423120374152,0x36312048696e746f6e204176656e75650d0a43616d6272696467650d0a43616d62726964676573686972650d0a43423120374152,0x73616e6472696e656574636872697340676f6f676c656d61696c2e636f6d,0x42656e6a616d696e2d206261627920626f792030390d0a0d0a42696e7320696e206261636b2067617264656e2c20477265656e20426f7820666f722072656379636c696e670d0a537061726520726f6f6d20686f6f7665722026206475737420656163682076697369742e2c20546f70206f662077617264726f626520746f20626520646f6e650d0a4d61696e20726f6f6d206576657279207765656b2e20202052756773206172652076616c7561626c6520736f206265206361726566756c206f6e206672617920656e64732e0d0a486f6f76657220696e20637570626f617264206265666f72652062617468726f6f6d2e436f6e63656e7472617465206f6e20636c65616e696e672e20557375616c2e0d0a49726f6e696e6720e28093203173742069726f6e20616e792073686972747320616e6420616e792072656d61696e696e67206173206d75636820617320706f737369626c652c69726f6e20626f61726420696e20737061726520726f6f6d2c20746f20646f2069726f6e696e6720696e207468697320726f6f6d0d0a,0x,"sandrineetchris@googlemail.com","0","0","1","N","","","","2.50","07932 948 536","07932 948 536","","B","Y","Y","W","2015-08-24","mon","","1","1","2015-08-27 09:21:11","2015-08-27 09:21:11");
INSERT INTO trianik_client VALUES("38257","","Baston-Pit","L","Jon","Baston-Pit",0x3138205045454c20484f5553450d0a4f4c442053544154494f4e20524f41440d0a4e45574d41524b45540d0a535546464f4c4b,0x5669612056616c20466567616e61204e2e32360d0a466f726e6f6c690d0a35353032320d0a4c550d0a4974616c79,0x6a2e626173746f6e2d7069747440667567726f2e636f6d,0x5456275320415245204e4f5420544f20424520434c45414e45440d0a0d0a4556455259205649534954202d20434c45414e2053555246414345532c20544f494c4554532c2053494e4b532c2053484f574552532c204d4952524f5253202620474c4144442e2056414355554d20414c4c20434152504554532c20434c45414e2042415448524f4f4d20414e44204b49544348454e20464c4f4f522054494c45530d0a0d0a4556455259204f54484552205649534954202d2057494e444f57530d0a0d0a4f43434153494f4e414c20524551554952454d454e5453202d20434c45414e2057414c4c532c204455535420434f4257454253204f4646204345494c494e47532c20434c454120494e53494445204d4943524f5741564520414e44204f56454e0d0a0d0a4a4f425320544f204f4e4c5920424520444f4e45205748454e2041534b4544202d2044555354204f555420525547530d0a0d0a444f204e4f5420444f202d20434c45414e204f5554534944452057494e444f57532c2048414c4c20434152504554204f5554534944452046524f4e5420444f4f522c20545627532e0d0a0d0a596f752063616e207265616368207468652074776f2074656e616e7473207468726f7567682074686520666f6c6c6f77696e6720726f7574657320746f206d6f7665206d61747465727320616c6f6e672e0d0a0d0a4672616e6b2054726f69616e6f0d0a453a206674726f69616e6f3839407961686f6f2e636f6d0d0a4d3a203037343537353434373637360d0a0d0a436f6479204d7563686f770d0a453a20436f64792e6d7563686f77303540676d61696c2e636f6d2e20200d0a4d3a2030373435343334393139340d0a0d0a4b696e6420726567617264732c200d0a4a6f6e20426173746f6e2d50697474200d0a204f776e6572204170742031382c205065656c20486f7573652c204e65776d61726b65740d0a54656c6570686f6e653a202b3339203037393935203736353433202f20204d6f62696c653a202b34342028302920373836302035302038302035300d0a452d6d61696c3a206a2e626173746f6e2d7069747440667567726f2e636f6d20200d0a,0x,"j.baston-pitt@fugro.com","2","1","2","N","","","press trade button to access main gate","2.00","+390799576543","+447860508050","","D","N","Y","W","2015-08-24","mon","","1","1","2015-08-27 09:25:18","2015-08-27 09:25:18");
INSERT INTO trianik_client VALUES("38258","","McGurk","L","John","McGurk",0x37207768697465206c6f6467650d0a686561736d616e20636c6f73650d0a6e65776d61726b65740d0a43423820305353,0x37207768697465206c6f6467650d0a686561736d616e20636c6f73650d0a6e65776d61726b65740d0a43423820305353,0x636572694063666a656e6b696e732e6e6574,0x45564552592056495349540d0a647573742f706f6c697368206675726e69747572652c2077696e646f7773696c6c732c20736b697274696e6720626f617264730d0a76616375756d20616c6c20636172706574730d0a77617368206b69746368656e20666c6f6f720d0a636c65616e2062617468726f6f6d2026204b69746368656e20616e6420656d7074792062696e730d0a0d0a4556455259204f544845522056495349540d0a0d0a77696e646f777320696e736964650d0a0d0a4f43434153494f4e414c20524551554952454d454e54530d0a0d0a776173682066726f6e7420646f6f72206578746572696f720d0a6f76656e0d0a6672696467650d0a6d6963726f776176650d0a0d0a4a4f4253204f4e4c59205748454e2041534b45440d0a2062726173732f73696c7665720d0a,0x444f204e4f5420444f0d0a0d0a6469737475726220746865206d616e79206c6561647320616e6420636f6e6e656374696f6e7320746f20746865206d757369632073797374656d2f747620616e6420636f6d7075746572207768656e6576657220706f737369626c65210d0a,"jmg146@hotmail.co.uk","2","1","2","N","","","park in bay marked 7 in heasman close walk through pedestria","2.00","01638602095","07802697684","","D","N","Y","T","2015-09-01","tues","","1","1","2015-08-27 09:32:06","2015-08-27 09:32:06");
INSERT INTO trianik_client VALUES("38259","","Richer","L","Vicki & Joe","Richer",0x313920526f757320526f61640d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820384448,0x313920526f757320526f61640d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820384448,0x7269636865722e62726f776e406e746c776f726c642e636f6d,0x47656e6572616c20636c65616e207468726f7567686f75742c2075736520696e69746961746976652e20,0x,"richer.brown@ntlworld.com","4","1","1","N","","","","2.00","01638 664793","07961 854013","","D","N","Y","W","2015-08-25","tues","","1","1","2015-08-27 09:35:19","2015-08-27 09:35:19");
INSERT INTO trianik_client VALUES("38260","","Anderton S","L","Sue","Anderton",0x313620546865205374726565740d0a5361786f6e205374726565740d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820395255,0x313620546865205374726565740d0a5361786f6e205374726565740d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820395255,0x732e616e646572746f6e4069636c6f75642e636f6d,0x47656e6572616c20636c65616e696e67207468726f7567686f75742c207468652056616375756d20697320696e7465726e616c6c79206275696c7420696e2077697468206f75746c65747320757073746169727320616e6420646f776e73746169727320746f20636f6e6e6563742074686520686f736520746f2e,0x,"s.anderton@icloud.com","0","0","1","N","","","","2.00","01638 730157","01638 730157","01638 730157","B","Y","Y","W","2015-08-26","wed","","1","1","2015-08-27 09:38:10","2015-08-27 09:38:10");
INSERT INTO trianik_client VALUES("38261","","Anderton 16a","L","Sue","Anderton",0x31366120546865205374726565740d0a5361786f6e205374726565740d0a4e65776d61726b65740d0a537566666f6c6b0d0a434238203952550d0a,0x31366120546865205374726565740d0a5361786f6e205374726565740d0a4e65776d61726b65740d0a537566666f6c6b0d0a434238203952550d0a,0x732e616e646572746f6e4069636c6f75642e636f6d,0x0d0a47656e6572616c20636c65616e696e67207468726f7567686f75742c207468652056616375756d20697320696e7465726e616c6c79206275696c7420696e2077697468206f75746c65747320757073746169727320616e6420646f776e73746169727320746f20636f6e6e6563742074686520686f736520746f2e,0x,"s.anderton@icloud.com","0","0","1","N","","","","2.00","01638 730157","01638 730157","01638 730157","B","N","Y","W","2015-08-26","wed","","1","1","2015-08-27 09:40:07","2015-08-27 09:40:07");
INSERT INTO trianik_client VALUES("38262","","Duffield","L","Gill","Duffield",0x31204865617468636f75727420506c6163650d0a4f6c642053746174696f6e20526f61640d0a4e65776d61726b65740d0a43423820384742,0x31204865617468636f75727420506c6163650d0a4f6c642053746174696f6e20526f61640d0a4e65776d61726b65740d0a43423820384742,0x67696c6c69616e5f6475666669656c64407961686f6f2e636f2e756b,0x6f6e7365727661746f72792067656e6572616c20636c65616e696e670d0a6b69746368656e202d2067656e6572616c20636c65616e2c20696e6320637570626f617264732c20666c6f6f727320616e6420647573740d0a5743202d67656e6572616c20636c65616e0d0a44696e696e6720726f6f6d202d2067656e6572616c20636c65616e0d0a477565737420726f6f6d202620656e7375697465202d20617320616e64207768656e2072657175697265640d0a73697474696e6720726f6f6d202d67656e6572616c20636c65616e0d0a4d617374657220426564726f6f6d202620656e7375697465202d2047656e6572616c20636c65616e0d0a496e736964652077696e646f777320616e6420736b697274696e6720202d207570737461697273206f6e6365206120666f72746e69676874202c20646f776e73746169727320746865206e6578742e0d0a0d0a5061726b20726f756e6420746865206261636b206f6620746865206275696c64696e67207573696e672073656375726974792067617465206265747765656e20686f75736520382f390d0a434f444520353133370d0a445249564520544f2054484520454e442c0d0a0d0a0d0a76616320697320696e20616972696e6720637570626f617264206f6e206669727374206c616e64696e670d0a0d0a6d6f702026206275636b65747320696e206b69746368656e20637570626f617264,0x,"gillian_duffield@yahoo.co.uk","0","0","0","N","5137","","Gill will either be home or key will be under the hosepipe","3.00","01638661200","07775564080 ","","B","N","Y","T","2015-09-03","mornings only","","1","1","2015-08-27 09:43:09","2015-08-27 09:43:09");
INSERT INTO trianik_client VALUES("38263","","Misson","L","Ana & Michael","Misson",0x3420436875726368204c616e650d0a44756c6c696e6768616d0d0a43616d62726964676573686972650d0a43423820395844,0x3420436875726368204c616e650d0a44756c6c696e6768616d0d0a43616d62726964676573686972650d0a43423820395844,0x616e612e63657264656e6f40676d61696c2e636f6d,0x506c656173652072696e67207768656e20796f752067657420746f206761746520617320416e6e612077696c6c206861766520746f206c657420796f7520696e,0x,"ana.cerdeno@gmail.com","0","0","1","N","","","","2.00","01638 507572","07876640692","01638 507572","B","N","Y","W","2015-08-27","thurs or fri","","1","1","2015-08-27 09:45:44","2015-08-27 09:45:44");
INSERT INTO trianik_client VALUES("38264","","Bush","L","Sue","Bush",0x3136204d696c6c20436c6f73650d0a42757277656c6c0d0a434232352030484c,0x3136204d696c6c20436c6f73650d0a42757277656c6c0d0a434232352030484c,0x7375652e62757368406e746c776f726c642e636f6d,0x626f696c657220726f6f6d2f7574696c69747920726f6f6d202d20666c6f6f72732c2073757266616365730d0a6b69746368656e202d2061732061626f7665202d206772616e69746520776f726b746f70732c20737461696e6c65737320737465656c20667269646765206574632e0d0a627265616b6661737420726f6f6d202d20666c6f6f72732c2073757266616365730d0a64696e696e672d726f6f6d202d206472792064757374206675726e69747572652c20666c6f6f7273206574630d0a646f776e737461697273207763202d20757375616c0d0a73697474696e6720726f6f6d202d20686f6f7665722c20647573740d0a737461697273202d20686f6f7665720d0a0d0a55707374616972730d0a4461756768746572732073747564792f6f6666696365202d20686f6f76657220647573740d0a44617567687465727320626564726f6f6d202d2061732061626f76650d0a537061726520626564726f6f6d202d20717569636b20686f6f7665722c20647573740d0a66616d696c792062617468726f6f6d202d20757375616c20616c6c2061726f756e64287573656420616c6c207468652074696d65290d0a426564726f6f6d202d20686f6f7665722c20647573740d0a4472657373696e6720726f6f6d202d2061732061626f76650d0a4d61696e20626564726f6f6d202d2061732061626f76652020456e7375697465202d20757375616c2028207573656420616c6c207468652074696d65290d0a0d0a46726f6e7420646f6f722077697065642f706f6c69736865640d0a416c7761797320636865636b20666f7220636f6277656273206574632e0d0a496e736964652077696e646f7720617320616e64207768656e202f636865636b20666f722068616e64207072696e74732f646f67206d61726b730d0a53756520686173203320736d616c6c20646f6773,0x,"sue.bush@ntlworld.com","0","0","0","","","","","4.50","01638 741570","01638 741570","","B","N","Y","W","2015-08-28","fri","","1","1","2015-08-27 09:47:55","2015-08-27 09:47:55");
INSERT INTO trianik_client VALUES("38265","","Kreitzman","L","Steve","Kreitzman",0x54697020546f66740d0a35342048696768205374726565740d0a42757277656c6c0d0a43616d6272696467650d0a43423520304844,0x0d0a436f6e746163742053617261682d4a616e65205065636b203037393030343337303336,0x74696d654074696d656c6d2e636f6d,0x53746576652773206f6666696365206e756d62657220202d203031323233203831323831320d0a0d0a0d0a486f7573656b656570696e6720647574696573204d6f6e64617920e280934672696461792030393a3030616d20e280932031313a3030616d0d0a0d0a4461696c79206475746965730d0a0d0a2d20436c65616e696e67206b69746368656e20616e6420646972747920636f66666565206d75677320616e6420636f6666656520706f7420286966206d6f72652063726f636b65727920757365207468652064697368776173686572292067657420636f6666656520726561647920666f72206d6f726e696e672c20626967206d75672c2073776565746e6572730d0a2d2056616375756d206d61696e206c6976696e6720617265617320726f746174696e6720726f6f6d732028636f6e63656e7472617465206f6e206d61696e206172656173206265696e6720616c6c2061706172742066726f6d207468652066726f6e742064696e696e6720726f6f6d2c20757073746169727320677565737420626564726f6f6d20616e6420537565e2809973206261636b20626564726f6f6d0d0a2d2044757374206d61696e20617265617320617320616e64207768656e2072657175697265640d0a2d204d616b65206265640d0a2d20436c65616e20646f776e7374616972732062617468726f6f6d2028626173696e202620572f43206f6e6c79292c20636c65616e20666c6f6f72206f6e63652061207765656b0d0a2d20436c65616e20656e2d7375697465202873686f7765722c20626173696e20616e6420572f43292c20636c65616e20666c6f6f72206f6e652061207765656b0d0a0d0a54776963652061207765656b206475746965730d0a0d0a2d20446f20616c6c207468652077617368696e6720696e636c7564696e6720746f77656c7320616e6420542d746f77656c730d0a2d2044727920616c6c207468652077617368696e6720696e207468652074756d626c652064727965722028746869732063616e206265206c656674206f7665726e6967687420756e74696c20746865206e65787420646179290d0a2d2049726f6e20616c6c207468652073686972747320616e642062656464696e670d0a2d20436c65616e20616c6c206d6972726f72730d0a2d2050757420636c65616e20746f77656c73206f6e20746865207368656c76657320696e2074686520656e2d73756974650d0a0d0a2a2044697274792074726f75736572732077696c6c206265206c656674206f6e20746865206265640d0a2a20446972747920636c6f746865732077696c6c206265206c65667420696e2074686520626f74746f6d20647261776572206f6620746865206368657374206f662064726177657273206c65667420746f20746865206265640d0a2a20506c65617365206e6f7465206e6f7420746f2074756d626c6520647279207468652074726f75736572732068616e6720746865736520757020696e20537565e28099732062617468726f6f6d200d0a2a20436c65616e2062656464696e6720697320696e2074686520426c756520637570626f617264206f6e20746865206c616e64696e670d0a0d0a4f6e63652061207765656b206475746965730d0a0d0a2d204368616e6765207468652062656420202d20557375616c6c79204d6f6e646179730d0a2d20436865636b20737570706c6965732028746f696c657420726f6c6c2c2077617368696e67207570206c69717569642c2076616375756d20626167732920616e64206c656176652061206e6f7420666f7220534a0d0a2d205075742072756262697368206f7574206f6e205765646e657364617920666f722074686520546875727364617920636f6c6c656374696f6e2c20707574206279207468652069726f6e2067617465200d0a2d20537765657020746865206261636b20796172640d0a0d0a41642d686f630d0a0d0a2d20446f6ee280997420616e73776572207468652070686f6e652074686520616e73776572696e67206d616368696e652077696c6c206765742069740d0a2d20436865636b206c696768742062756c627320626c6f776e20616e642074656c6c20534a0d0a0d0a4e6f7465730d0a0d0a2d20506c65617365206265206361726566756c207768656e206d6f76696e672061726f756e6420746865206f726e616d656e747320616e642064757374696e670d0a2d20506c6561736520646f206e6f7420636c65616e20616e797468696e67206f6e20746865206f6666696365206465736b2075707374616972730d0a2d20506c6561736520646f206e6f742070757420616e792074726f757365727320696e2074686520647279657220617320746865792077696c6c206d656c74210d0a2d20506c65617365207761736820616e792074726f757365727320796f7520736565206f6e20746865206265640d0a2d20416e79206e6f74657320617265206c65667420696e2074686520636c65616e696e6720726f6f6d200d0a0d0a4d6f6e6461790d0a0d0a2d204368616e676520616c6c20746865206265647320e28093206d61696e20726f6f6d2c20677565737420726f6f6d2026204d72732e204b726569747a6d616ee28099732e205761736820616e642074756d626c65206472792e2052656d61726b3a204d61696e20646f75626c65206265642028636c65616e2062656464696e67206f6e20636861697220696e206f6666696365292e0d0a2d20436c65616e20656e2d73756974652062617468726f6f6d2e0d0a2d2047656e6572616c20436c65616e20e2809320446f776e7374616972732062617468726f6f6d2c206b69746368656e20616e64206d61696e20626564726f6f6d2e0d0a2d20486f6f76657220616e642077617368206b69746368656e20616e642062617468726f6f6d2020666c6f6f720d0a2d20576173682044722e204b726569747a6d616ee280997320636c6f746865732028696e20626f74746f6d2064726177657220746f20746865206c6566742073696465206f66206d61696e2062656420e2809320636865636b206576657279206461792021290d0a0d0a547565736461790d0a0d0a2d20456d7074792062696e20e28093207075742061742072696768742068616e642073696465206f662067617261676520e2809320626c61636b2062696e2062616720756e6465722073696e6b0d0a2d204d616b65206265647320696e206d61696e20726f6f6d20616e6420636c65616e20656e2d73756974650d0a2d2047656e6572616c20636c65616e20e28093204475737420616e6420686f76657220616c6c206f7665720d0a2d20446f2069726f6e696e6720616e642070757420617761790d0a2d20456d707479206b69746368656e2062696e0d0a2d205761736820666c6f6f727320e2809320696e636c7564696e6720686f742074756220726f6f6d0d0a0d0a5765646e65736461790d0a0d0a2d204d616b652062656420616e6420656e2d73756974650d0a2d205075742072756262697368206f757420e2809320726561647920666f7220546875727364617920636f6c6c656374696f6e0d0a2d20446f20616e792077617368696e6720616e642069726f6e696e670d0a2d20486f6f7665722c206475737420616e64207761736820666c6f6f72730d0a2d20456d7074792062696e0d0a0d0a54687572736461790d0a0d0a2d204d616b65206265647320616e6420656e2d73756974650d0a2d2047656e6572616c20636c65616e0d0a2d20486f6f76657220616e6420647573740d0a2d20446f20616e792077617368696e6720616e642069726f6e696e670d0a0d0a4672696461790d0a0d0a2d2047656e6572616c20636c65616e200d0a2d20486f6f76657220616e6420647573740d0a2d20456d7074792062696e730d0a2d204d616b65206265647320e2809320656e2d73756974650d0a2d205761736820666c6f6f72730d0a0d0a416e792077617368696e672075702074686174206e65656420646f696e672c2070757420696e746f2064697368776173686572206461696c79202d207265676172646c657373206f6620616d6f756e742e0d0a4469736877616873657220706f7764657220756e6465722073696e6b2e0d0a0d0a446f20636c6f746865732077617368696e6720617320616e64207768656e207265676172646c657373206f6620616d6f756e742e204974206973206f6b20746f206c65617665206974656d7320696e2074756d626c65206472796572206f7665726e696768742c20627574206e6f7420696e2077617368696e67206d616368696e652e204966204d722e204b726569747a6d616e206861732074726f75736572732074686174206e6565642077617368696e6720646f206e6f742074756d626c656472792e2048616e6720757020696e204d7273204b726569747a6d616ee28099732062617468726f6f6d2e0d0a0d0a4966207468652077617465722070656f706c652063616c6c20746f207265706c61636520776174657220626f74746c6573202d20746865206e6577206f6e65206765742070757420756e64657220746865206d6963726f776176652e20456d70747920626f74746c657320696e207574696c69747920726f6f6d20756e646572207461626c652e0d0a0d0a506c65617365206d616b6520737572652074686174206265666f726520796f75206c656176652074686174204d722e204b726569747a6d616ee280997320637570202862726f776e206f6e6529206973206f6e20746865206b69746368656e207461626c652077697468207377656574656e65727320696e20616e642073706f6f6e2e20416e642074686520636166657465726965206861732068616c662073636f6f70206f6620636f6666656520696e2e0d0a0d0a4f6e6c79206e65656420746f20636c65616e207468652074776f20726f6f6d7320746f20746865206c65667420616e64207269676874206f662066726f6e7420646f6f722074776963652061207765656b2e0d0a0d0a,0x,"time@timelm.com","0","0","1","N","","","","10.00","07900437036","07900437036","07900437036","B","Y","Y","W","2015-08-26","2 hours daily","","1","1","2015-08-27 09:51:19","2015-08-27 09:51:19");
INSERT INTO trianik_client VALUES("38266","","Fryers House","L","Gaynor & Tom","Fryers",0x4368616c6b204261726e0d0a48617265205061726b0d0a536978204d696c6520426f74746f6d0d0a4e65776d61726b65740d0a43423820305555,0x4368616c6b204261726e0d0a48617265205061726b0d0a536978204d696c6520426f74746f6d0d0a4e65776d61726b65740d0a43423820305555,0x746f6d406e696368657468696e6b696e672e636f6d,0x20646f672028546f62792920322063617473202874696d6d792026204c6f74746965290d0a0d0a31737420636c65616e696e67206f6e20546875727364617920367468204175677573742028646175676874657220696e20686f73706974616c206f6e2046726964617929207468657265616674657220467269646179730d0a0d0a5072696f7269746965733a0d0a2d2046616d696c7920526f6f6d20696e636c2e206b69746368656e202d2067656e6572616c20636c65616e696e670d0a2d2042617468726f6f6d73202d2067656e6572616c20636c65616e696e670d0a2d20426564726f6f6d73202d2067656e6572616c20636c65616e696e670d0a2d2052657374206f662074686520686f757365202d20686f7665722c2064757374696e6720616e6420706f6c6973206675726e69747572650d0a2d20436865636b206f6e20636f62776562730d0a0d0a4f63636173696f6e616c6c793a0d0a2d20636c65616e20626568696e64206675726e69747572650d0a2d20536b697274696e6720626f617264730d0a2d2057696e646f77207365616c730d0a0d0a4f6e65206c61647920697320616c72656164792068656c70696e67204d7273204672796572732077697468206c61756e6472792c2069726f6e696e672c2077616c6b696e6720646f672c207069636b696e672075702050657465722e2057696e646f7720636c65616e696e6720636f6d70616e7920697320636c65616e696e672077696e646f77732e0d0a0d0a486f75736520686173206120776174657220736f6674656e6572206d616368696e65202d206c657373206c696d65207363616c650d0a0d0a4675727468657220696e666f726d6174696f6e3a0d0a5374756479202d20686f6f766572206966206f7468657220636c65616e696e6720726571756972656420696e737472756374696f6e2077696c6c20626520676976656e0d0a50657465727320726f6f6d202d2067656e6572616c20636c65616e696e6720286c65617665206d6f64656c206275696c64696e672061726561290d0a0d0a0d0a446972656374696f6e733a0d0a46726f6d204e65776d61726b6574202d3e20536978204d696c657320426f74746f6d2e204265747765656e20486f72736520526f756e6461626f757420616e6420536978204d696c657320426f74746f6d20726f61642077696c6c2073706c69742075702e205475726e20726967687420617320736f6f6e2061732074686520726f616420636f6d657320746f67657468657220616761696e2e204974e28099732061207072697661746520726f61642063616c6c656420e2809c48617265205061726be2809d2e0d0a,0x,"tom@nichethinking.com","0","0","0","N","","","","3.00","01638 570471","01638 570471","","B","N","Y","W","2015-08-24","mon","","1","1","2015-08-27 09:55:36","2015-08-27 09:55:36");
INSERT INTO trianik_client VALUES("38267","","Fryers Cottage","L","Gaynor & Tom","Fryers",0x362054686520417263680d0a38312048696768205374726565740d0a426f7474697368616d0d0a43616d62730d0a4342323520394241,0x4368616c6b204261726e0d0a48617265205061726b0d0a536978204d696c6520426f74746f6d0d0a4e65776d61726b65740d0a43423820305555,0x746f6d406e696368657468696e6b696e672e636f6d,0x6974206973207468652070696e6b20636f747461676520627920746865206368757263682e200d0a0d0a74686973206973206120686f6c6964617920636f747461676520736f207468657265666f7265206e65656473206265647320616e6420746f77656c73206368616e67696e67206576657279207765656b200d0a67656e6572616c20636c65616e696e67207468726f7567686f757420726561647920666f7220746865206e657874206775657374732e200d0a42696e7320746f20626520656d707469656420616e642065766572797468696e6720636c65616e65642e200d0a0d0a4761796e6f722077696c6c206c657420796f7520696e20616e6420617272697665207769746820612076616375756d20616e6420636c65616e206c61756e6472792e200d0a0d0a0d0a4172636820436f7474616765202d20436c65616e696e6720496e737472756374696f6e732e20204d61792032303135200d0a0d0a54686973206973206120736d616c6c20686f6c6964617920636f747461676520616e64206e6565647320746f20626520636c65616e656420636f6d706c6574656c7920746f7020746f20626f74746f6d206576657279207765656b206265666f7265206e65772076697369746f7273206172726976652e20205468652061696d20697320746f206d616b65206974206a75737420617320796f7520776f756c642077616e7420746f2066696e64206120686f6c6964617920636f7474616765206f7220666c6174207468617420796f752077657265207669736974696e672e200d0a47656e6572616c0d0a22095061636b20757020616c6c2075736564206c696e656e2c2062656464696e672c20746f77656c7320616e64206b69746368656e20636c6f7468732c207374726970207468652062656473206966206e65636573736172792e0d0a220952656d6f766520616e7920727562626973682066726f6d207468652062696e7320616e642074696520757020696e206f6e652062616720666f722072656d6f76616c200d0a2209436865636b207468617420746865206c6173742076697369746f72732068617665206e6f74206c65667420616e792062656c6f6e67696e677320626568696e642e204c6f6f6b20696e20616c6c206472617765727320616e642077617264726f62657320657463200d0a2209436f62776562732067617468657220696e2074686520776f6f64656e20666c6f6f72732c20646f6f72732020616e64206365696c696e677320736f20706c6561736520636865636b20616e642072656d6f7665206173206e6563657373617279200d0a55707374616972730d0a220952656d616b6520626564732077697468206672657368206c696e656e0d0a220942617468726f6f6d2d20636c65616e206261746820616e642073686f7765722c20706179696e6720706172746963756c617220617474656e74696f6e20746f2074686520676c61737320616e642074617073206574632e20436c65616e20626173696e20616e64206c6f6f2e205769706520616e6420636c65616e20616c6c20737572666163657320696e636c7564696e6720746f77656c207261696c20616e64206d6972726f7273200d0a22094475737420616c6c20746865206675726e6974757265207570737461697273200d0a2209486f6f766572206c616e64696e672072756720616e6420666c6f6f7220696e636c7564696e6720756e6465722074686520626564730d0a22095377656570207374616972732e200d0a446f776e737461697273200d0a220953697474696e6720726f6f6d202d6475737420616e6420636c65616e20616c6c2073757266616365732c20686f6f7665722063617270657420616e6420756e6465722063686169727320616e64207365747465652e20436865636b20756e6465722063757368696f6e73206f6e2073657474656520616e64206368616972732e2054696479207275677320616e642063757368696f6e732e2020436865636b207468617420706963747572657320616e642077696e646f77732061726520636c65616e2e200d0a220948616c6c202d20686f6f76657220616e642064757374202c207769706520616e79206d61726b73206f66662074686520666c6f6f72200d0a2209427265616b6661737420726f6f6d20207469647920616e642064757374207468726f7567686f7574202c2072656d6f766520616e79206d61726b73206f6e2074686520666c6f6f72202c20706f6c697368207461626c65200d0a22094b69746368656e2e202820776f726b696e672066726f6d20726967687420746f206c656674290d0a6f09436c65616e2066726964676520696e7369646520616e6420636865636b2074686174206465657020667265657a6520697320656d707479200d0a6f09436865636b2074616c6c20637570626f617264206973207469647920616e64207574656e73696c732061726520636c65616e200d0a6f09436c65616e2062726561642062696e20616e6420746f61737465722e200d0a6f095769706520646f776e20737572666163657320616e64207368656c7665732028616e642074696c6573206966207265717569726564292e200d0a6f09436c65616e20686f6220616e642077697065206f7574206f76656e2069662064697274792e20436865636b206772696c6c207472617920616e64207761736820616e6420636c65616e2e2055736520676c61737320636c65616e6572206f6e2073757266616365732e205769706520636f6f6b657220686f6f642e2057697065207261636b7320656163682073696465206f6620686f62200d0a6f09436865636b2064726177657273206f66206375746c65727920617265207469647920616e6420636c65616e0d0a6f09436c65616e20616e642077697065206d6963726f776176652c20696e7369646520616e64206f757420200d0a6f0957697065207368656c76657320616e642073757266616365732e20436865636b2074686174206b6574746c652c20746561706f7420616e6420636f6666656520706f742061726520636c65616e2c205769706520646f776e2074696c65732069662072657175697265642e200d0a6f09436865636b2077617368696e67206d616368696e6520697320636c65616e0d0a6f09436c65616e2073696e6b2074686f726f7567686c7920776974682064657363616c65722e204d616b6520737572652077617368696e672d20757020626f776c20697320636c65616e20616e642064727920200d0a6f095769706520646f776e20647261696e696e672020626f61726420616e64207261636b20776974682064657363616c6572202f20706f6c697368200d0a6f09556e6465722073696e6b202c2077697065206f757420637570626f61726420616e6420636c65616e2020727562626973682062696e0d0a6f09436865636b20666c6f6f7220666f72206d61726b7320616e6420686f6f766572207468726f7567686f75742e20200d0a2d0d0a5468616e6b20796f752076657279206d7563682e20492077696c6c2070726f6261626c792062652061742074686520636f7474616765206576657279207765656b206275742069662074686572652061726520616e79207175657374696f6e73206f7220796f752077616e7420746f20636865636b20616e797468696e6720706c656173652063616c6c206d65206f6e20303136333820353730343731206f72203037373731203932303037372e200d0a,0x,"tom@nichethinking.com","0","0","0","N","","","","2.00","01638 570471","07771920077","","B","Y","Y","W","2015-08-28","fri","","1","1","2015-08-27 09:58:36","2015-08-27 09:58:36");
INSERT INTO trianik_client VALUES("38268","","Whelehan K","L","Kathleen","Whelehan",0x392048616e6f76657220436c6f73650d0a537475646c616e64730d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820374247,0x392048616e6f76657220436c6f73650d0a537475646c616e64730d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820374247,0x54616d7a696e2e7768656c6568616e40686f746d61696c2e636f2e756b,0x6b657920686173206265656e20676976656e2c206275742073686520697320757375616c6c7920696e206a757374206b6e6f636b20616e6420656e7465720d0a6e6f20616c61726d20636f6465730d0a0d0a0d0a4b69746368656e2026206c6976696e6720726f6f6d206f6e65207765656b2e0d0a0d0a42617468726f6f6d202620626564726f6f6d206f6e206e6578742076697369742e0d0a0d0a4d7273205768656c6568616e206c696b657320697420746f20626520686f6f766572656420756e6465722062656420616e6420756e64657220736f66612e0d0a0d0a446972656374696f6e733a0d0a5475726e207269676874206f6e746f204e696d6275732057617920616e6420666f6c6c6f7720726f61642c20617420656e64206f6620726f6164207475726e206c6566742e205475726e207269676874206f6e746f205061726b6572732057616c6b2e205468656e207475726e20726967687420696e746f2077686174206c6f6f6b206c696b652061207065646573747269616e206f6e6c7920706174682e20596f752077696c6c20736565206120747269616e676c652062697420696e20726f616420676f20726967687420616e64207061726b206f6e206772617373206f6e2072696768742e20596f752077696c6c2073656520612062726f776e2067617465206f6e20796f7572206c65667420676f207468726f75676820616e64206974206973203173742062756e67616c6f77206f6e206c6566742e0d0a0d0a446f20626564726f6f6d20666972737420617320736865206c696b657320746f206c696520646f776e207768696c6520796f7520636c65616e207468652072657374206f66207468652070726f70657274790d0a0d0a4c696b657320746f2062652063616c6c6564204b617468790d0a0d0a31356d696e7320696e206561636820726f6f6d2c20656d7074792062696e732c2077697065206f7574206d6963726f776176652076616375756d206561636820726f6f6d20617320796f7520676f2e0d0a0d0a6c617374206a6f622c2077617368206b69746368656e20616e642068616c6c20666c6f6f72,0x,"none","0","0","1","","","","","1.00","01638 664042","01638 664042","","D","N","Y","T","2015-08-31","mon","","1","1","2015-08-27 10:01:04","2015-08-27 10:01:04");
INSERT INTO trianik_client VALUES("38269","","Dawson","L","Alex","Dawson",0x3133342048696768205374726565740d0a426f7474697368616d0d0a43616d627269646773686972650d0a4342323520394241,0x3133342048696768205374726565740d0a426f7474697368616d0d0a43616d627269646773686972650d0a4342323520394241,0x616c65786a646177736f6e40676d61696c2e636f6d,0x47656e6572616c20436c65616e696e67207468726f7567686f75742e0d0a0d0a546f20696e636c7564653a0d0a0d0a4f76656e20636c65616e0d0a44757374696e6720616e642076616375756d696e672074686f726f7567686c790d0a0d0a66616d696c792062617468726f6f6d2c2064657363616c652073686f77657220626c6561636820696e20746f696c65742c2067656e6572616c20636c65616e2c20656d7074792062696e7320616e64207769706520646f6f72206672616d65730d0a656e7375697465202620626564726f6f6d2c2064657363616c652073686f77657220626c6561636820746f696c65742c2076616375756d20626568696e64206c61756e647279206261736b65742c2074696479206265642c20737461636b2070617065727320616e64206d6167617a696e6573207769706520646f776e20646f6f72206672616d65730d0a737061726520726f6f6d2c206d616b65206265642c20717569636b2076616320616e6420647573740d0a76616375756d20736b697274696e6720626f6172647320657370656369616c6c79206f6e20746865207374616972730d0a7769706520646f776e20646f6f7220667272616d65730d0a0d0a6c6f756e67652c207469647920746f797320617761792c207469647920736f66612c20646f6f726672616d65732076616320706f6c69736820616e642077696e646f770d0a0d0a68616c6c206d6972726f72200d0a0d0a646f776e7374616972732077630d0a0d0a6b69637468656e2c2064657363616c652073696e6b732c2067632c207769706520637570626f617264206672696e74732c20616e6420627566662c20636c65616e20746f70206f76656e2c207461626c652c200d0a0d0a6b657920666f7220746865206672656e636820646f6f727320697320757375616c6c792062792074686520747620696e206b69746368656e2e2062696e732061726520726f756e642074686520736964652c20707574206b6579206261636b207768656e2066696e69736865642c207761736820616c6c20666c6f6f72732e,0x,"alexjdawson@gmail.com","0","0","1","","2010","","key has been given - front door alarm codes 2010 to unset to","3.00"," 01223 812617","07941787662","","B","N","Y","W","2015-08-25","tues","","1","1","2015-08-27 10:04:22","2015-08-27 10:04:22");
INSERT INTO trianik_client VALUES("38270","","Kempin","L","Charlotte","Kempin",0x3138204261726b776179730d0a42757277656c6c0d0a43616d62730d0a43423235203052470d0a,0x3138204261726b776179730d0a42757277656c6c0d0a43616d62730d0a43423235203052470d0a,0x632e6b656d70696e406e746c776f726c642e636f6d,0x6e2046697273742076697369747320796f752077696c6c206e65656420746f207573652070726f66657373696f6e616c204c696d657363616c652072656d6f76657220616e64204d6f756c642072656d6f7665722048472070726f64756374732e0d0a0d0a6f6e636520796f752068617665207461636b6c6520746865206d6f756c6420616e64204c696d657363616c6520757365206f6e6c792045636f2070726f647563747320616e64204e4f204145524f534f4c207370726179732e0d0a0d0a796f75206d6179206e65656420746f207461636b6c65207468652062617468726f6f6d206f6e207468652066697273742076697369742c20616e64204b69746368656e206f6e20746865207365636f6e6420696e206f7264657220746f20646f206120766572792074686f726f756768206a6f6220746f206d616b65207468696e67732065617369657220666f722073756273657175656e74207669736974732e0d0a0d0a546865726561667465723a0d0a0d0a4b69746368656e20616e642062617468726f6f6d20697320746865206d61696e207072696f726974790d0a0d0a4b69746368656e202d207769706520696e73696465206f76656e202f6772696c6c2f6d6963726f776176652065616368207765656b0d0a737572666163657320262066726f6e7473206f6620637570626f617264732c20746f70206f6620626f696c657220616e6420746f70206f662063757062616f726473207468617420796f752063616e2067657420746f2e0d0a666c6f6f72730d0a0d0a48616e647761736820616e79206469727479206974656d7320746861742061726520626573696465207468652073696e6b0d0a0d0a6576657279776865726520656c7365206120676f6f64207468726f756768206475737420616e642076616375756d2c20696e636c7564696e672073746169727320616e64206c616e64696e672c20636f66666565207461626c650d0a0d0a72656d6f766520636f62776562730d0a0d0a446f206e6f7420646f20686572207374756479206172656120696e2073697474696e6720726f6f6d0d0a0d0a446f2077696e646f7773206576657279206d6f6e74682c0d0a0d0a4f63636173696f6e616c6c79206d617920726571756972652069726f6e696e6720746f20626520646f6e652e0d0a0d0a436861726c6f7474652077696c6c2073747269702074686520626564207768656e206e656365737361727920616e64206c65617665206f75742074686520636c65616e2073686565747320666f7220796f7520746f20707574206f6e2e0d0a0d0a444f204e4f54205448524f5720414e595448494e4720415741592c204556454e2057484154204d4159205345454d204c494b4520525542424953482c20434841524c4f54544520484153204d2e452e20534f205448455920415245204f4654454e204c454654204f555420544f2052454d494e442048455220534845204e4545445320544f20425559204d4f524520,0x,"c.kempin@ntlworld.com","0","0","0","","","","","2.00","01638610305","01638610305","","B","N","Y","T","2015-09-09","","","1","1","2015-08-27 10:07:26","2015-08-27 10:07:26");
INSERT INTO trianik_client VALUES("38271","","Telford","L","Amber","Telford",0x32204372616d70746f6e20436f7474616765730d0a5061726b204c616e650d0a4e65776d61726b65740d0a43423820384158,0x32204372616d70746f6e20436f7474616765730d0a5061726b204c616e650d0a4e65776d61726b65740d0a43423820384158,0x616c6c616e2e63616d7062656c6c406d6f74746d61632e636f6d,0x6c6c20666c6f6f727320686f6f76657265642f6d6f707065640d0a4b69746368656e20737572666163657320646f6e652074686f726f7567686c792e204f76656e2c204d6963726f776176652c20686f622077697065206f7665722e0d0a4d61696e20656e737569746520746f20626520646f6e652074686f726f7567686c792e204f746865722062617468726f6f6d206672657368656e6564207570206f7220636c65616e65642074686f726f7567686c7920617320616e64207768656e207265712e202057696e646f777320646f6e65207768656e2072657175697265642e2020416d6265722077696c6c2061647669736520696e697469616c6c792e0d0a0d0a506c656e7479206f66205669616b616c206e6565646564206f6e20656e2d73756974652073686f77657220616e64206f6e2073686f77657220646f6f7220696e206f746865722062617468726f6f6d2e0d0a0d0a0d0a75707374616972732e0d0a626564726f6f6d20616e6420656e73756974652c2067632c2077696e646f7773206f6e2065766572792076697369742c2064657363616c652073686f7765722c20656d7074792062696e732c2076616375756d2c2076616320626568696e6420746f696c657420616e6420756e646572206265642e20706f6c69736820616e6420636f62776562730d0a0d0a737061726520726f6f6d2c20717569636b2076616375756d206475737420656d7074792062696e732077696e646f77730d0a0d0a626564726f6f6d2c20706f6c6973682c2077696e646f77732c2076616375756d2c206d616b65206265642c20656d7074792062696e732e0d0a0d0a66616d696c792062617468726f6f6d2c2067632c2064657363616c652073686f77657220676c6173732c20636f62776562730d0a0d0a646f776e7374616972730d0a0d0a6c6976696e6720726f6f6d2c2077696e646f777320616e642073696c6c732c20636f6e776562732c2067632c2076616320616e6420706f6c6973682c20656d7074792062696e730d0a0d0a746f696c65742c2067632c206d6972726f720d0a0d0a6b69746368656e2c20626f74746f6d206f66206f76656e2c20746f6f206f66206672696467652c2067632c20627566662074696c65732c20646f206e6f7420656d707479206b69746368656e2062696e732c206d6963726f776176652c207761736820666c6f6f72732e200d0a446972656374696f6e730d0a46726f6d204e696b6b697320686f757365207475726e206c65667420746f206d696e6920726f756e6461626f75742e2054616b65206c65667420285669636172616765205264292e205475726e206c65667420676f20757020726f61642028617070726f78203130306d292e2054616b65207269676874206f6e746f205061726b204c616e652e20466f6c6c6f7720726f616420646f776e2e204b656570206c6f6f6b696e6720666f7220676f6c6420636f6c6f726564207369676e206f6e2073696465206f6620686f75736520616e64207475726e20696e746f20736d616c6c2064726976657761792e20486f75736520696e2066726f6e74206f6620796f752077697468206461726b20636f6c6f72656420646f6f7220616e6420612062656e6368206f7574736964652e200d0a,0x,"Amber.Telford@mottmac.com","0","0","1","","","","front door kley","2.00","01638 662812","07887 682055","","B","N","Y","T","2015-08-26","wed","","1","1","2015-08-27 10:11:52","2015-08-27 10:11:52");
INSERT INTO trianik_client VALUES("38272","","Bullen","L","Maya","Bullen",0x33392056414c4c455920574159200d0a4e45574d41524b45540d0a435546464f4c4b0d0a43423820305148,0x33392056414c4c455920574159200d0a4e45574d41524b45540d0a435546464f4c4b0d0a43423820305148,0x6d617961406d616e746c652e636f2e756b,0x76616375756d20756e64657220746865207374616972730d0a6f63636173696f6e616c2069726f6e696e67206d6179206265207265717565737465640d0a0d0a55736520696e69746961746976650d0a0d0a466c6f6f7273206172652061207072696f7269747920616e642064757374696e6720616c6c207468726f7567682074686520686f7573650d0a67656e6572616c20636c65616e206f6620616c6c2061726561732e0d0a0d0a4f63636173696f6e616c6c7920646f20746865202077696e646f77732028696e636c7564696e6720636f6e7365727661746f7279292c20646f20612066657720617420612074696d652e,0x0d0a646f206e6f7420646f2074686520737061726520726f6f6d2061732069742069732066756c6c206f6620626f786573206574632e,"maya@mantle.co.uk","3","1","1","N","","","front door key","2.00","01638601830","07939206837","","D","Y","Y","T","2015-08-27","thurs or fri","","1","1","2015-08-27 10:14:46","2015-08-27 10:14:46");
INSERT INTO trianik_client VALUES("38273","","Dodds","L","Daphne","Dodds",0x31204172636865727320436c6f73650d0a537761666668616d2042756c6265636b0d0a43616d62726964676573686972650d0a4342323520304847,0x31204172636865727320436c6f73650d0a537761666668616d2042756c6265636b0d0a43616d62726964676573686972650d0a4342323520304847,0x646170686e652e646f646473406274696e7465726e65742e636f6d,0x47656e6572616c20636c65616e2c2070617920706172746963756c617220617474656e74696f6e20746f204c616d707368616465732c20736f66612c207368656c7665732045766572797468696e6721,0x,"daphne.dodds@btinternet.com","0","0","1","N","","","","3.00","01223 811251","01223 811251","","B","N","Y","T","2015-08-25","tues","","1","1","2015-08-27 10:17:46","2015-08-27 10:17:46");
INSERT INTO trianik_client VALUES("38274","","Woodborne","L","Sarah","Woodborne",0x39204865617468636f746520506c6163650d0a4f6c642053746174696f6e20526f61640d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820384742,0x39204865617468636f746520506c6163650d0a4f6c642053746174696f6e20526f61640d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820384742,0x73617261687740646972636f6e2e636f2e756b,0x5061726b20726f756e6420746865206261636b206f6620746865206275696c64696e67207573696e672073656375726974792067617465206265747765656e20686f75736520382f390d0a434f444520353133370d0a445249564520544f2054484520454e442c0d0a0d0a0d0a47656e6572616c20436c65616e696e67,0x,"sarahw@dircon.co.uk","0","0","0","","5137","","","3.00","01638 669322"," 07747 786502","","Q","N","Y","T","2015-08-27","thurs or fri","","1","1","2015-08-27 10:20:30","2015-08-27 10:20:30");
INSERT INTO trianik_client VALUES("38275","","Hoskins","L","Hoskins","Rosemary",0x3920506f756e647320506173747572650d0a427261646c657920526f61640d0a4b6972746c696e670d0a43423820394a42,0x3920506f756e647320506173747572650d0a427261646c657920526f61640d0a4b6972746c696e670d0a43423820394a42,0x726f73656d617279686f736b696e7340616f6c2e636f6d,0x332042617468726f6f6d730d0a466c6f6f7273207468726f7567686f75740d0a7574696c6974792061726561200d0a7374616972730d0a47656e6572616c20636c65616e696e67207468726f7567686f75742e0d0a0d0a4920776173207468696e6b696e67207468617420697420776f756c6420626520776f7274687768696c6520656e737572696e67206d7920636f76657220636c6561726e657273206861766520626f7468206d792070686f6e65206e756d6265727320696e2063617365207468657920676574206c6f737420747279696e6720746f2066696e642074686520686f75736520286974206861732068617070656e65642129200d0a6d6f62696c652030373736372032353035323520206c616e646c696e652030313434302037383337313320286c65742069742072696e672061207768696c65206f72204920776f6e27742067657420746865726520696e2074696d65292e0d0a0d0a444952454354494f4e530d0a66726f6d204b6972746c696e67207475726e20646f776e20427261646c657920526f61640d0a6f6e20796f75727269676874206974732074686520686f75736520616674657220736173636f6d62652076696e657961726473,0x,"rosemaryhoskins@aol.com","0","0","1","","","","key for door on the side of the house","2.00","07767250825","07767250825","","B","N","Y","W","2015-08-27","","","1","1","2015-08-27 10:23:01","2015-08-27 10:23:01");
INSERT INTO trianik_client VALUES("38276","","Madichie","L","Elizabeth","Madichie",0x4c616e6774727920486f7573650d0a4275727920526f61640d0a4b656e74666f72640d0a537566666f6c6b0d0a43423820375052,0x4c616e6774727920486f7573650d0a4275727920526f61640d0a4b656e74666f72640d0a537566666f6c6b0d0a43423820375052,0x656c697a61626574682e6d6164696368696540707064692e636f6d,0x50555420544845204b455920494e205455524e204954205448454e2050555348205448452048414e444c4520444f574e20414e44205455524e20414741494e20544f2047455420494e2e20544f20534855542054484520444f4f52204c494654205448452048414e444c452055500d0a414c41524d202d200d0a0d0a464f42204b4559205553454420544f20444541435449564154452054484520414c41524d2e0d0a0d0a544f2041435449564154452050524553532054484520424c41434b20484f55534520425554544f4e205448454e20504c4143452054484520464f4220555020544f2054484520414c41524d2e20594f552048415645203435205345434f4e445320544f204c454156450d0a0d0a3368727320636c65616e696e67203168722049726f6e696e672e0d0a7072696f726974696573206172652c2062617468726f6f6d73206b69746368656e2c2064757374696e6720616e642076616375756d696e672e0d0a0d0a65766572797468696e6720617320757375616c0d0a737061726520726f6f6d206f6e6c7920617320616e64207768656e2072657175697265640d0a0d0a49726f6e696e673a0d0a49726f6e696e6720696e207574696c69747920726f6f6d20286f6666206b69746368656e290d0a5661706f72697a657320666f722069726f6e20616e642068616e6765727320756e6465722073696e6b20696e207574696c69747920726f6f6d0d0a486973207368697274733a2068616e67206f6e20646f6f7220616e6420626f74746f6e20666972737420626f74746f6e200d0a0d0a557365206e6f7420506c656467652f4d7220536865656e20706f6c697368202d20557365204265652057617820506f6c69736820284c6f7264205368657261746f6e73290d0a0d0a446972656374696f6e730d0a4c65617665204e65776d61726b65742074616b696e67204275727920526f61642061742074726166666963206c696768747320676f20726967687420746f7761726473204b656e74666f72642e20496e204b656e74666f726420676f20706173742074686520436f636b20507562206f6e2072696768742e2041742047617a656c6579207369676e706f73742070756c6c20696e746f20746865206c61737420686f757365206265666f72652074686973207475726e696e67206f6e207468652072696768742e2047656f726769616e206c6f6f6b696e6720686f7573652e,0x,"liz@madichie.com","0","0","1","Y","","","","4.00","07799 062692","","07783 684195","B","Y","Y","W","2015-08-28","fri","","1","1","2015-08-27 10:27:35","2015-08-27 10:27:35");
INSERT INTO trianik_client VALUES("38277","","Wright","L","Kirsty ","Wright",0x44696f6d656420537461626c65730d0a48616d696c746f6e20526f61640d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820305044,0x44696f6d656420537461626c65730d0a48616d696c746f6e20526f61640d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820305044,0x7374756172744073747561727477696c6c69616d73726163696e672e636f2e756b,0x76616375756d20697320696e2074686520737061726520726f6f6d0d0a0d0a6576657279207765656b3a0d0a47656e6572616c20636c65616e696e67207468726f756768742074686520656e7469726520686f7573652c2074686f726f7567682064657363616c65206f662074617073206574632e200d0a696e207468652073697474696e6720726f6f6d2c2074616b652063757368696f6e73206f666620616e642076616375756d20616e6420706c756d70206574632e20,0x,"stuart@stuartwilliamsracing.co.uk","2","1","1","","","","","4.00","01638560143","07780452858","01638560143","B","N","Y","W","2015-08-25","tues and thu","","1","1","2015-08-27 10:31:40","2015-08-27 10:31:40");
INSERT INTO trianik_client VALUES("38278","","Downes","L","Rose Marie","Downes",0x343520446974746f6e20486f7573650d0a576f6f64646974746f6e20526f61640d0a4e65776d61726b65740d0a43423820394251,0x343520446974746f6e20486f7573650d0a576f6f64646974746f6e20526f61640d0a4e65776d61726b65740d0a43423820394251,0x6d6f756e747374726565746d677440616f6c2e636f6d,0x6b69746368656e20262064757374696e670d0a0d0a646f206e6f7420646f2073747564790d0a67656e6572616c20636c65616e696e67207468726f7567686f75742c20706f6c697368206d6f6e74686c79202d206f616b20706f6c69736820697320756e646572207468652073696e6b0d0a677565737420726f6f6d7320726f7461746520736f20746865792067657420646f6e65206f6e63652061206d6f6e74680d0a6d61696e2062617468726f6f6d207765656b6c790d0a0d0a766163206973206f6e206c616e64696e670d0a,0x,"mountstreetmgt@aol.com","0","0","0","N","","","","4.00","07711147097","07711147097","","B","N","Y","W","2015-08-25","tues and fri","","1","1","2015-08-27 10:34:48","2015-08-27 10:34:54");
INSERT INTO trianik_client VALUES("38279","","Mckerrell","L","Joanne","Mckerrell",0x486f6c6c79205472656520436f74746167650d0a323120537072696e6720546572726163650d0a5765737465726e20436f6c76696c6c650d0a43616d62726964676573686972650d0a4342323120355042,0x486f6c6c79205472656520436f74746167650d0a323120537072696e6720546572726163650d0a5765737465726e20436f6c76696c6c650d0a43616d62726964676573686972650d0a4342323120355042,0x6a6f2e6d636b657272656c6c40676d61696c2e636f6d,0x537072696e672054657272616365206973206120726f77206f6620636f74746167657320697473206f6e2043687572636820456e642c20636f6d6520696e2066726f6d204272696e6b6c657920526f616420616e642074686174207475726e7320696e746f2043687572636820656e642c20616e642074686520726f77206f6620776869746520766963746f7269616e2074657272616365732e0d0a0d0a76616375756d20756e6465722073746169727320637570626f61726420696e2073747564790d0a0d0a67656e6572616c20636c65616e696e672064757374696e672c207661632c206d6f70207468726f7567686f75740d0a0d0a6b69746368656e20666c6f6f72206d6f700d0a0d0a62617468726f6f6d73206d6f70207765656b6c790d0a0d0a72656d6f7665206173682066726f6d2066697265706c61636520616e642074616b65206f75742062696e730d0a0d0a6d6f70206c6976696e6720726f6f6d20666c6f720d0a0d0a77696e646f7773206f63636173696f6e616c6c79,0x,"jo.mckerrell@gmail.com","3","2","1","N","","","","2.00","01223290018","07772297230","","B","N","Y","W","2015-08-25","tues","","1","1","2015-08-27 10:39:03","2015-08-27 10:39:03");
INSERT INTO trianik_client VALUES("38280","","Weatherup","L","Amy","Weathrup",0x332047726f766520436f7474616765730d0a48696768205374726565740d0a537761666668616d2042756c6265636b0d0a4342323520304850,0x332047726f766520436f7474616765730d0a48696768205374726565740d0a537761666668616d2042756c6265636b0d0a4342323520304850,0x,0x6f6e20746865206869676820737472656574206e65617220486f7573652031313020206f70706f7369746520746865207363686f6f6c206973206120736d616c6c2064726976657761792074686174206c6561647320796f7520757020746f2047726f766520436f7474616765732e206974206973204e4f5420332068696768207374726565742c20736174206e61762077696c6c2074616b6520796f75206f7574736964652074686520707562206275742074686973206973207468652077726f6e6720656e64206f66207468652068696768207374726565742c20697420697320332047726f766520636f7474616765732e200d0a0d0a446f206e6f742075736520616e792070726f6475637473206f6e207069616e6f7320616e642073746174756573200d0a0d0a45636f2070726f6475637473206f6e20666c6f6f7273202d2050726f766964656420696e20637570626f61726420756e646572207468652073696e6b0d0a0d0a54727920746f20676f206f76657220657665727977686572652062757420636f6e63656e7472617465206f6e2031206f72203220726f6f6d2074686f726f7567686c792065616368207765656b0d0a0d0a4974e280997320612062696720686f75736520736f206e6f742065787065637465642066756c6c7920646f6e650d0a0d0a436c65616e2064696e696e6720636861697273207573696e6720612064616d7020636c6f74680d0a0d0a576f726b2061726f756e64207374756666206f6e206465736b73202d20646f6ee2809974206d6f7665207468696e67730d0a0d0a4d6972726f72730d0a0d0a436c65616e696e672067756964656c696e657320666f7220332047726f766520436f7474616765730d0a0d0a57656c636f6d65210d0a0d0a596f7572206b657920697320666f7220746865206b69746368656e20646f6f722028617420746865206261636b206f662074686520686f757365292e20596f752063616e20656974686572207061726b206f6e2074686520647269766520696e2066726f6e74206f662074686520686f7573652c206f7220696e2074686520486967682053747265657420616e642077616c6b20757020746865206472697665202d207468657265206973206e6f207475726e696e6720726f6f6d2061742074686520746f70206f66207468652064726976652e20200d0a0d0a5468697320697320612062696720686f7573652c20776869636820676574732077656c6c2d757365642062792074776f20736d616c6c206769726c732c206120646f6720616e64203420636174732c20736f206973206f6674656e20646972747920616e6420616c7761797320756e746964792e20497420697320616c736f20766572792070726f6e6520746f20636f62776562732e200d0a0d0a436c65616e696e67206974207365656d7320746f20776f726b206265737420696620796f7520646f3a0d0a0d0a4576657279205765656b3a0d0a22094b69746368656e0d0a220942617468726f6f6d732028646f776e73746169727320746f696c65742c20656e73756974652062617468726f6f6d2c20757073746169727320746f696c65742c2075707374616972732073686f77657220726f6f6d2c20616e642073696e6b7320696e2074776f20626564726f6f6d73290d0a2209416c6c20666c6f6f72732c20696e636c7564696e67206d6f7070696e6720616c6c20746865206861726420666c6f6f72730d0a0d0a4f6e206120726f746174696f6e3a0d0a22094d6f72652074686f726f75676820636c65616e206f66206561636820726f6f6d206f662074686520686f7573652c20696e636c7564696e672064757374696e672c20636f6277656262696e672c206d6972726f7273206574632e0d0a0d0a0d0a536f6d65207370656369666963207468696e677320746f206265206177617265206f663a0d0a0d0a22094e6f20636c65616e696e672070726f647563747320746f2062652075736564206f6e207069616e6f20616e6420646f6c7068696e2073746174756573202d206a757374206120736f667420647279206475737465720d0a22094e6f20636c65616e696e672070726f647563747320746f2062652075736564206f6e207468652073686f77657220676c61737320646f6f7220616e642074686520676c6173732073637265656e206f6e207468652062617468202d206a75737420776174657220286275742074696c65732c206261746820616e642073686f7765722074726179206574632063616e20626520636c65616e6564206173206e6f726d616c290d0a22094e6f20706f6c697368206f6e2064696e696e6720726f6f6d207461626c65202873696e6365206974206973206f696c656429202d206a75737420776174657220616e642067656e746c6520736f61702065672077617368696e67207570206c6971756964206966206e65636573736172790d0a2209506c6561736520646f6e277420636c65616e20286576656e207769746820776174657229207468652074696c6573207769746820646f6c7068696e73207061696e746564206f6e207468656d20696e206d79206461756768746572277320726f6f6d202d2074686520646f6c7068696e732077696c6c20727562206f66660d0a0d0a0d0a546f79733a0d0a220957652068617665206c6f7473206f6620746f797320616e64206c6f7473206f66207468656d2077696c6c20616c77617973206265206f6e2074686520666c6f6f722e200d0a2209506c6561736520646f207069636b20757020616c6c2074686520746f797320696e2074686520545620726f6f6d2c20616e6420707574207468656d206f6e2074686520636f66666565207461626c65207368656c662e200d0a2209496e20746865206d757369632f64696e696e6720726f6f6d20616e6420696e20746865206769726c732720626564726f6f6d732c20706c65617365206a757374206d6f76652074686520746f797320746f207468652073696465206f662074686520726f6f6d20616e64207075742074686520626f6f6b7320696e2061206e6561742070696c6520736f207468617420796f752063616e20686f6f766572206173206d756368206f662074686520666c6f6f7220617320706f737369626c652e200d0a22095761746368206f757420666f7220736d616c6c20746f7973207768656e20686f6f766572696e67202d20736f6d65206f66207468652062697473206f66206c65676f20616e6420706c61796d6f62696c206172652076657279207665727920736d616c6c2e200d0a2209536f6d6574696d65732077652077696c6c2061736b207370656369666963616c6c792074686174206365727461696e20746f7973206e6f74206265206d6f7665642e200d0a0d0a0d0a527562626973682062696e733a0d0a22095468657265206172652062696e7320696e206d6f737420726f6f6d73206f662074686520686f7573652c20736f6d6574696d6573207475636b656420696e20636f726e657273206f7220756e646572207461626c65732e2054686520726f6f6d732077697468204e4f2062696e7320617265206d7920626564726f6f6d2c2048616e6e6168277320626564726f6f6d2028746865206669727374206f6e6520617320796f7520676f20646f776e2074686520636f727269646f72292c20616e642074686520646f776e737461697273206f66666963652e20506c656173652063616e207468652062696e7320626520656d70746965642065616368207765656b0d0a220947656e6572616c207275626269736820676f657320696e2074686520626c61636b206475737462696e732062792074686520646f67206b656e6e656c0d0a220952656379636c696e6720676f657320696e2074686520626c756520616e6420677265656e20776865656c69652062696e73206f75747369646520746865206b69746368656e2077696e646f770d0a0d0a0d0a56616375756d20636c65616e6572733a0d0a22095468657265206973206120626967204479736f6e2076616375756d20636c65616e657220696e2074686520637570626f61726420756e64657220746865207374616972732028696e2074686520636f726e6572206f6e20746865206c656674207768656e20796f7520676f2066726f6d206b69746368656e20746f20646f776e737461697273206f6666696365290d0a220920546865726520697320612068616e6468656c64204479736f6e206f6e20746865206b69746368656e2077616c6c202d2074686973206f6e6c792072756e7320666f722061626f7574203135206d696e75746573206f6e206f6e652063686172676520616e6420646f65732066696c6c207570207665727920717569636b6c790d0a2209506c65617365206d616b65207375726520746f20656d70747920626f74682076616375756d20636c65616e6572732065766572792074696d6520796f7520757365207468656d2073696e6365207468657920646f20636c6f6720757020656173696c79202d207468657920616c736f20776f726b2062657374207768656e20746865792061726520656d7074790d0a22095468652062726f6f6d20616e64206475737470616e20616e64206272757368206c69766520696e20746865207574696c69747920726f6f6d20286e65787420746f20746865206b69746368656e290d0a,0x,"amy@weatherup.org","0","0","1","","","","","4.00","01223 811417","07795 975075","","B","N","Y","W","2015-08-27","any","","1","1","2015-08-27 10:42:09","2015-08-27 10:42:09");
INSERT INTO trianik_client VALUES("38281","","Subraminium","L","Gaya","Subraminium",0x313520506574696e676f20436c6f73650d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820384751,0x313520506574696e676f20436c6f73650d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820384751,0x73676179613340686f746d61696c2e636f6d,0x444f204e4f542057484552452053484f455320494e2054484520484f5553450d0a0d0a76616375756d206973206b65707420696e207468652073746f726520726f6f6d0d0a0d0a69726f6e696e67206d617920626520726571756573746564206f63636173696f6e616c6c790d0a0d0a0d0a4a4f425320464f522045564552592056495349540d0a47656e6572616c20636c65616e696e67207468726f7567686f75742e0d0a0d0a6368616e67652074686520706170657220756e6465726e6561746820746865206b69746368656e2062696e207768656e20656d70746965642e0d0a0d0a636c65616e2074686520686f622065766572792076697369740d0a666c6f6f727320616e64206d6f7020746865206b69746368656e206576657279207765656b2e0d0a0d0a0d0a4f43434153494f4e414c20524551554952454d454e54530d0a0d0a77696e646f777320616e64206672616d65732c20776f6f64776f726b,0x6e6f2076616c7561626c65206974656d7320646973636c6f736564,"sgaya3@hotmail.com","0","0","1","N","","","","2.00","07528720078","07528720078","","B","Y","Y","T","2015-09-04","any","","1","1","2015-08-27 10:45:03","2015-08-27 10:45:03");
INSERT INTO trianik_client VALUES("38282","","Hood","L","Angela","Hood",0x33632053756e6e7920536964650d0a5061726b204c616e65200d0a4e65776d61726b6574200d0a537566666f6c6b0d0a43423820384158,0x33632053756e6e7920536964650d0a5061726b204c616e65200d0a4e65776d61726b6574200d0a537566666f6c6b0d0a43423820384158,0x616e67656c614074686973776179676c6f62616c2e636f6d,0x,0x,"angela@thiswayglobal.com","0","0","0","","","","","2.00","07580686431","07580686431","","B","N","Y","W","2015-08-28","","","1","1","2015-08-27 10:48:57","2015-08-27 10:48:57");
INSERT INTO trianik_client VALUES("38283","","Moules","L","Ian","Moules",0x49616e204d6f756c6573204c74640d0a313620486f6c6c616e64205061726b0d0a43686576656c65790d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820394c44,0x49616e204d6f756c6573204c74640d0a313620486f6c6c616e64205061726b0d0a43686576656c65790d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820394c44,0x6e69636b796d6f756c6573407961686f6f2e636f2e756b,0x636c65616e2062617468726f6f6d20696e636c7564696e6720666c6f6f7273200d0a77697065206f76657220776f6f6420616e6420736b697274696e670d0a4475737420616e642076616375756d207468726f7567686f75740d0a4b69746368656e2076616375756d20616e64206d6f702074686520666c6f6f72730d0a0d0a696620796f75206861766520616e792065787472612074696d65206d6179626520676f206f76657220646f6f727320646f20616e79206a6f62732074686174206e65656420646f696e672e0d0a0d0a4c65617468657220736f6661733a20557365204c6561746865722073707261793b204a75737420647573742074686520726564206c656174686572206f6e657320696e207468652066726f6e7420726f6f6d2c206e6f2070726f6475637420746f20626520757365642e0d0a200d0a0d0a5275677320696e20626564726f6f6d206e6565642070726f70657220676f696e67206f766572206576657279207765656b2e0d0a0d0a496620616e792065787472612074696d6520692074727920746f20636c65616e207468652076656e657469616e20626c696e64732e0d0a,0x,"nickymoules@yahoo.co.uk","0","0","0","N","","","","2.00","01638732654","07714750148","","B","N","Y","W","2015-08-27","thurs","","1","1","2015-08-27 11:21:43","2015-08-27 11:21:43");
INSERT INTO trianik_client VALUES("38284","","Walton","L","Michael","Walton",0x4f616b204661726d204261726e0d0a576f6f64646974746f6e20526f61640d0a4b6972746c696e670d0a537566666f6c6b0d0a43423820395047,0x4f616b204661726d204261726e0d0a576f6f64646974746f6e20526f61640d0a4b6972746c696e670d0a537566666f6c6b0d0a43423820395047,0x63616c64657277616c746f6e40686f746d61696c2e636f6d3b20616c617364616972406d616367696c6c69767261792e696e666f3b206d77616c746f6e617263686974656374407961686f6f2e636f2e756b,0x486f75736520636c65616e656420746f20612068696768207374616e646172642c20696e636c7564696e6720636c65616e696e672073757266616365732c2064757374696e672c2076616375756d696e6720616e64206d6f7070696e672e0d0a0d0a456e7375726520626f74682073657473206f66207374616972732061726520636c65616e65640d0a0d0a56616320696e20637570626f61726420696e204b69746368656e0d0a436c65616e2066697265706c616365207768656e2072657175697265642c206c61756e64727920656163682076697369740d0a0d0a4d6f6e646179730d0a557073746169727320626564726f6f6d7320262042617468726f6f6d73204d69636865616c73204f66666963650d0a54686f726f75676820636c65616e206f662057432c2053686f7765722f776574726f6f6d0d0a54726173680d0a0d0a467269646179730d0a0d0a416c6c206f6620646f776e73746169727320696e636c7564696e6720776574726f6f6d2074686f726f75676820647573742f706f6c6973682f636c65616e202f7661632f6d6f70200d0a0d0a0d0a0d0a444f204e4f5420434c45414e202d204d69636865616c2062656473696465207461626c6520616e64206265642e200d0a0d0ae280a20957617368696e672c20647279696e6720616e642069726f6e696e6720636c6f746865732f6c696e656e2f746f77656c73206574632e200d0a0d0ae280a209436c65616e20757020616674657220746865206361742c20696e636c7564696e6720636c65616e696e67206c697474657220747261797320616e6420666565642f776174657220626f776c732f617265612e0d0a0d0ae280a2094272696e6720696e206669726520776f6f642066726f6d206869732067617261676520746f2074686520686f7573652028746f206b656570206c6576656c732073746f636b65642075702c20657370656369616c6c7920696d706f7274616e7420647572696e672074686520636f6c646572206461797329202d206f6e63652061207765656b0d0a0d0ae280a20954616b65206f757420746865207275626269736820616e642072656379636c696e672066726f6d2073746f7261676520696e20746865206761726167652c20616e6420707574206f75747369646520666f7220636f6c6c656374696f6e2062792074686520636f756e63696c202d206f6e63652061207765656b2028636f6c6c656374696f6e7320617265206f6e205475657364617973290d0a0d0ae280a20947656e6572616c6c79202768656c70206f7574272061726f756e642074686520686f7573652c20652e672e2c206b656570696e67207468652064726976652d77617920616e642067617264656e7320636c65617220616e64206c69747465722d667265652e,0x,"calderwalton@hotmail.com; alasdair@macgillivray.info; mwalto","3","3","1","N","","","","7.00","01638730007","07729260377","","B","Y","Y","W","2015-08-25","tues and thurs","","1","1","2015-08-27 11:27:31","2015-08-27 11:27:31");
INSERT INTO trianik_client VALUES("38285","","Schwabe","L","Alison","Schwabe",0x31207061726b20766965770d0a68617265207061726b0d0a736978206d696c6520626f74746f6d0d0a63623820306179,0x31207061726b20766965770d0a68617265207061726b0d0a736978206d696c6520626f74746f6d0d0a63623820306179,0x6165734063616d2e61632e756b,0x0d0a6576657279207765656b202d200d0a0d0a76616375756d200d0a647573740d0a7468726f75676820636c65616e206f66206b69746368656e20616e642062617468726f6f6d0d0a0d0a6f63636173696f6e616c6c7920736372756220616e6420706f6c69736820746865206b69746368656e20666c6f6f72,0x,"aes@cam.ac.uk","3","1","0","N","","","","2.00","07990576978","07990576978","","D","N","Y","W","2015-08-26","any","","1","1","2015-08-27 11:30:16","2015-08-27 11:30:16");
INSERT INTO trianik_client VALUES("38286","","Button","L","Tracey","Button",0x4120616e642054204571756573747261696e2053657276696365730d0a54686520426f6f740d0a576f6f64697474696f6e20526f61640d0a4b6972746c696e670d0a434238203950470d0a,0x4120616e642054204571756573747261696e2053657276696365730d0a54686520426f6f740d0a576f6f64697474696f6e20526f61640d0a4b6972746c696e670d0a434238203950470d0a,0x746c627574746f6e406274696e7465726e65742e636f6d,0x0d0a42617468726f6f6d732d2067656e6572616c20636c65616e200d0a0d0a4d617374657220426564726f6f6d20616e6420656e2073756974650d0a0d0a4b69746368656e202d206d6f7020666c6f6f7220636c65616e2073757266616365730d0a0d0a53697474696e6720726f6f6d202d206475737420616e6420686f6f7665720d0a0d0a44696e696e6720726f6f6d2d206475737420616e6420686f6f7665720d0a0d0a426f6f7420526f6f6d20616e642057632d20666c6f6f72730d0a0d0a537765657020616e642077697065207374616972730d0a0d0a4c616e64696e67202d206475737420616e6420686f6f766572,0x,"tlbutton@btinternet.com","0","0","0","N","","","","2.00","01638 730275","01638 730275","","B","N","Y","W","2015-08-27","any","","1","1","2015-08-27 11:32:34","2015-08-27 11:32:34");
INSERT INTO trianik_client VALUES("38287","","Snushall","L","Julie","Snushall",0x3537204d6561646f77204c616e650d0a4e65776d61726b65740d0a537566666f6c6b0d0a4342382038465a,0x3537204d6561646f77204c616e650d0a4e65776d61726b65740d0a537566666f6c6b0d0a4342382038465a,0x6a756c69652e736e757368616c6c407773632e61632e756b,0x47656e6572616c20636c65616e696e6720696e2074686520666f6c6c6f77696e672061726561733a0d0a0d0a4b69746368656e2026204c6976696e6720726f6f6d2061726520612068696768207072696f726974790d0a57430d0a5374616972730d0a6d617374657220626564726f6f6d0d0a456e7375697465202d2048696768207072696f726974790d0a4f66666963650d0a4c61756e64727920726f6f6d0d0a4d61696e2042617468726f6f6d0d0a0d0a0d0a47796d20262047616d657320726f6f6d2d206a75737420206475737420616e6420646f20666c6f6f72730d0a0d0a57696e646f777320617320796f752063616e20666974207468656d20696e2d2074727920646f696e6720612066657720656163682076697369740d0a0d0a426f6f6b20636162696e657473206f757473696465206f6e6c790d0a0d0a537061726520726f6f6d206f6e63652061206d6f6e74680d0a0d0a0d0a5461726765742067657474696e6720726964206f66207468652063617420666c756666202d20736f6661730d0a0d0a20677565737420626564726f6f6d20746f20626520686f6f766572656420616e6420647573746564206672657175656e746c7920616e642074686520656e7375697465207768656e207265717565737465640d0a0d0a546865206e6577206b697474656e206973207265737472696374656420746f2074686520706f6f6c20726f6f6d202867616d657320726f6f6d2920696620697420697320656173696572206e6f7420746f20676f20696e207468657265207468656e20706c65617365206665656c206672656520746f206d697373206974202d20776520646f6e742077616e74206865722072756e6e696e672072696f74207768656e207765277265206e6f74207468657265206f72206d616b696e6720612062696420666f722066726565646f6d20796574210d0a0d0a54686520686f6f7665722c2062726f6f6d20616e64206475737470616e2061726520696e2074686520756e64657273746169727320637570626f6172642028696e20746865206b69746368656e29202e0d0a,0x,"julie.snushall@wsc.ac.uk","0","0","1","Y","","","Alarm - press open lock when entering, press closed lock whe","3.50","07971895615","07971895615","","B","N","Y","T","2015-09-04","fri","","1","1","2015-08-27 11:36:10","2015-08-27 11:36:10");
INSERT INTO trianik_client VALUES("38288","","Nelissen","L","Pieter","Nelissen",0x506965746572204e656c697373656e0d0a477261706520436f74746167650d0a3741204661697220477265656e0d0a52656163680d0a4342323520304a44,0x506965746572204e656c697373656e0d0a477261706520436f74746167650d0a3741204661697220477265656e0d0a52656163680d0a4342323520304a44,0x504e406469636b7768697465726566657272616c732e636f6d,0x3320686f75727320636c65616e696e67206f6e6520686f75722069726f6e696e672e200d0a0d0a0d0a656d61696c20696e766f6963657320666f72746e696768746c792d207061796d656e742062792062616e6b207472616e736665720d0a0d0a444f574e535441495253206475737420616e642076616375756d2f6d6f70207468726f7567686f75740d0a0d0a4b49544348454e202d2066756c6c20636c65616e20696e636c7564696e672d200d0a202020656d70747920646973687761736865720d0a202020636c65616e206f76656e0d0a202020636c65616e206d6963726f776176650d0a20202048616e64207761736820616e7920706f747320616e642070616e73207468617420617265206c656674206f740d0a0d0a444f574e5354414952532042415448524f4f4d2c200d0a202020746f696c657420262073696e6b202620666c6f6f72730d0a0d0a44494e494e472f5354554459202d206f7267616e69736520626f6f6b73206e6561746c79206f6e206465736b0d0a0d0a4c4956494e4720524f4f4d202d20647573740d0a0d0a616c6c20617265617320746f2062652076616375756d656420616e64207761736820666c6f6f727320646f776e7374616972730d0a0d0a656d70747920616c6c2062696e730d0a0d0a5550535441495253206475737420616e642076616375756d2f6d6f70207468726f7567686f75740d0a0d0a42415448524f4f4d202d2066756c6c20636c65616e20696e636c7564696e672073696e6b206261746820746f696c65740d0a0d0a686f6f7665720d0a0d0a65766572792032207765656b73206368616e676520626564206c696e656e20696e20626f746820726f6f6d73202d20746865792077696c6c206265206c656674206f7574206f6e20746865206265647320746f20646f0d0a0d0a424544524f4f4d53202d200d0a202020636c65616e20757020636c6f746865730d0a2020206d616b6520757020626564730d0a,0x,"PN@dickwhitereferrals.com","0","0","1","N","","","","4.00","07783660345","07783660345","","B","Y","Y","T","2015-08-28","fri","","1","1","2015-08-27 11:38:14","2015-08-27 11:38:14");
INSERT INTO trianik_client VALUES("38289","","Biggs","L","Mary Jane","Biggs",0x546865204f6c6420526563746f72790d0a33302043687572636820526f61640d0a54657665727368616d0d0a43616d62726964676573686972650d0a4342312039415a,0x546865204f6c6420526563746f72790d0a33302043687572636820526f61640d0a54657665727368616d0d0a43616d62726964676573686972650d0a4342312039415a,0x4d4a406475426f756c617942696767732e636f6d,0x54756573646179e280997320766973697420283320686f757273290d0a0d0a47656e6572616c20636c65616e202d207570737461697273202d20757375616c6c7920646f20696e2074686520666f6c6c6f77696e67206f726465723a0d0a312e205374616972730d0a322e204c616e64696e670d0a332e2042617468726f6f6d0d0a342e2057696c6c69616de280997320626564726f6f6d0d0a352e205477696ee280997320626564726f6f6d0d0a362e20456e73756974650d0a372e204d617374657220626564726f6f6d0d0a382e204f6c69766572e280997320626564726f6f6d0d0a392e20477565737420626564726f6f6d202d204f6e6c79207768656e207265717569726564206f72206174206c65617374206f6e63652061206d6f6e74680d0a0d0a416c736f20636c65616e20746865203220746f696c65747320646f776e737461697273202d20557375616c6c79206a75737420636c65616e2074686520746f696c65742c2073696e6b2026206d6972726f722e0d0a0d0a4e6f74653a204d616b652062656473202d204d617279204a616e652077696c6c2073747269702074686520626564732026206c656176652074686520636c65616e207368656574732069662073686520726571756972657320746865206c696e656e20746f206265206368616e6765642e204f6c69766572206d6179626520686176696e67206869732061667465726e6f6f6e206e617020736f206a75737420646f20616c6c2074686520636c65616e696e6720616e64206c656176652076616375756d696e672026204f6c69766572e280997320626564726f6f6d20756e74696c206c617374206f7220756e74696c2068652077616b65732075702e0d0a0d0a467269646179e280997320766973697420283320686f757273290d0a0d0a47656e6572616c20636c65616e202d20646f776e737461697273202d20757375616c6c7920646f20696e2074686520666f6c6c6f77696e67206f726465723a0d0a312e205574696c6974792f53686f77657220726f6f6d0d0a322e2047617264656e20726f6f6d0d0a332e204b69746368656e0d0a342e204d61696e2048616c6c7761790d0a352e20536d616c6c65722048616c6c7761792028776f6f64656e20666c6f6f72290d0a362e20546f696c65740d0a372e204c6f756e67650d0a382e2044696e696e6720726f6f6d0d0a0d0a4e6f74653a20496e205574696c6974792f53686f77657220726f6f6d202d2074696479202620636c65616e20666c6f6f72732c2053686f77657220726f6f6d20636c65616e20746f696c65742c2073696e6b2026206d6972726f72202d2053686f776572207768656e2072657175697265642e205374756479206e6f7420726571756972656420746f20626520636c65616e65642e0d0a0d0a,0x,"MJ@duBoulayBiggs.com","0","0","0","","","","","3.00","01223 292220","07881922844","","B","N","Y","W","2015-08-24","mon thur","","1","1","2015-08-27 11:40:42","2015-08-27 11:40:42");
INSERT INTO trianik_client VALUES("38290","","Morgenstern","L","Jenny","Morgenstern",0x342048496c6c736964650d0a53617773746f6e0d0a434232322033424c0d0a,0x342048496c6c736964650d0a53617773746f6e0d0a434232322033424c0d0a,0x67696e676572626972643240686f746d61696c2e636f6d,0x0d0a47726f756e6420666c6f6f7220697320746865206d61696e207072696f726974792c206a75737420646f207768617420796f752063616e20696e207468652074696d652e0d0a0d0a6f6e6c7920646f20757073746169727320696620726571756573746564206f7220686176652065787472612074696d652028756e6c696b656c79290d0a0d0a646f206e6f7420737072617920616e797468696e67206e656172207468652066726f672074616e6b20617320746865792063616e206162736f726220697420696e746f20746865697220736b696e2e0d0a0d0a796f7520617265206e6f7420657870656374656420746f20636c65616e20757020726f64656e74206d65737320696e2042656e7320726f6f6d2e20,0x,"gingerbird2@hotmail.com","0","0","2","","","","","3.00","01223836551","07976832424","","D","N","Y","W","2015-08-24","mon","","1","1","2015-08-27 11:43:42","2015-08-27 11:43:42");
INSERT INTO trianik_client VALUES("38291","","Jarvis","L","David","Jarvis",0x363720447563686573732044726976650d0a4e65776d61726b65740d0a537566666f6c6b0d0a4342382038414a,0x363720447563686573732044726976650d0a4e65776d61726b65740d0a537566666f6c6b0d0a4342382038414a,0x6d656d626572406a617276697334372e66736e65742e636f2e756b,0x56616375756d20697320696e2074686520637570626f61726420696e2074686520656e7472616e63652068616c6c2028776865726520616c61726d2070616e656c206973206c6f63617465642920616c736f203220706f727461626c657320696e2073697474696e6720726f6f6d2e200d0a0d0a6a6f627320666f722065766572792076697369743a0d0a73697474696e6720726f6f6d2026206b69746368656e2061726520746865206172656173206d61696e6c79207573656420736f20676f6f642074686f726f75676820636c65616e20696e20686572652065616368207765656b202d205461626c6520696e2073697474696e6720726f6f6d206f6e6c7920647573743b20646f206e6f742075736520616e7920636c65616e696e672070726f6475637473206f6e2069742e200d0a4261636b2048616c6c62617468726f6f6d6d617374657220626564726f6f6d0d0a64617669647320636c6f616b726f6f6d2f73686f77657220726f6f6d0d0a656e7472616e63652068616c6c0d0a636f62776562732f6265616d730d0a0d0a4a6f627320666f72206576657279206f746865722076697369740d0a446176696473206472657373696e6720726f6f6d0d0a677565737420726f6f6d20262042617468726f6f6d0d0a0d0a4f63636173696f6e616c20526571756972656d656e74733a0d0a4461766964732073747564790d0a636c6f616b726f6f6d20696e2068616c6c0d0a6c617267652064696e696e6720726f6f6d20616e642073697474696e6720726f6f6d,0x56414c5541424c45204954454d53204e4f5420544f20424520434c45414e45443a205072696e6365737320416e6e652062726f6e7a6520737461747565,"member@jarvis47.fsnet.co.uk","0","0","2","N","2544","","","3.00","01638664909","07836203406","","D","N","Y","W","2015-08-25","tues","","1","1","2015-08-27 11:46:26","2015-08-27 11:46:26");
INSERT INTO trianik_client VALUES("38292","","Mitchell","L","Simon","Mitchell",0x546865204f6c64205363686f6f6c0d0a546865205374726565740d0a48657272696e677377656c6c0d0a4950323820365354,0x436f6e7369676e6174757265204c74640d0a3139205275746c616e64204368616d626572730d0a4d65776d61726b65740d0a537566666f6c6b0d0a43423820384c58,0x73696d6f6e40696d7067726170686963732e636f2e756b,0x47656e6572616c20636c65616e696e67207468726f7567686f75742074686520686f7573652c2077632c20656e7472616e63652068616c6c2c20322073697474696e6720726f6f6d732c2064696e696e6720726f6f6d206b69746368656e2c20707566662063757368696f6e7320616e64207468726f77732c206e75727365727920616e6420626564726f6f6d732c20656e73756974652c2062617468726f6f6d2c207574696c69747920726f6f6d0d0a666c6f6f7273207468726f7567686f75740d0a0d0a0d0a666f726e696768746c7920636c65616e2074686520677565737420726f6f6d0d0a6f63617373696f6e616c6c7920696e636c756465206f76656e20636c65616e20616e6420696e736964652077696e646f777320617320616e64207768656e0d0a0d0a7768656e2074686520646f67732061726520686f6d65206c6574207468656d20696e746f207468652067617264656e2e20,0x,"simon@impgraphics.co.uk","0","0","1","","","","","4.00","01638551479 ","07786624464","","D","Y","Y","W","2015-08-25","any","","1","1","2015-08-27 11:49:41","2015-08-27 11:49:41");
INSERT INTO trianik_client VALUES("38293","","Greenall","L","Rebecca","Greenall",0x35332048696768205374726565740d0a537465746368776f7274680d0a4e65776d61726b65740d0a43423820395448,0x35332048696768205374726565740d0a537465746368776f7274680d0a4e65776d61726b65740d0a43423820395448,0x726562656363612e677265656e616c6c40686f746d61696c2e636f2e756b,0x414c5541424c45204954454d530d0a62652076657279206361726566756c207769746820626f74746c65732061732076657920657870656e736976650d0a6265206361726566756c207769746820746865206c617661206c616d7020617320697420636f6d657320617061727420616e6420636f756c6420656e64207570206d65737379206966207370696c6c65640d0a0d0a76616375756d20697320696e2074686520637570626f73726420756e64657220746865207374616972730d0a0d0a69726f6e696e6720726571756972656420666f72746e696768746c792d206a7573742062656464696e6720746f2062652069746f6e6564207072696f7220746f206368616e67696e67200d0a0d0a4a4f425320464f522045564552592056495349540d0a0d0a6d617374657220626564726f6f6d2067656e6572616c20636c65616e696e670d0a656e73756974652c2067656e6572616c20636c65616e696e672c207468652073686f77657220646f65736e7420676574207573656420736f2077696c6c206f6e6c79206e6565642061206672657368656e207570206d6f6e74686c790d0a6d61696e2062617468726f6f6d2067656e6572616c20636c65616e696e670d0a6e7572736572790d0a616c6c20666c6f6f7273207468726f7567686f757420746f2062652076616375756d656420616e64206d6f707065640d0a68616c6c7761797320746f206265206475737465640d0a64696e696e6720726f6f6d20696e636c7564696e67207069616e6f0d0a73697474696e6720726f6f6d2c20696e636c7564696e67207468652066697265706c616365206865617274680d0a77632f636c6f616b726f6f6d0d0a6b69746368656e20657370656369616c6c7920637570626f6172642066726f6e74730d0a0d0a4a4f425320464f52204556455259204f544845522056495349540d0a6368616e67652062656464696e6720696e206d617374657220626564726f6f6d0d0a677565737420626564726f6f6d730d0a7574696c69747920726f6f6d0d0a0d0a4f43434153494f4e414c20524551554952454d454e54530d0a656e73756974652073686f776572206f6e63652061206d6f6e74680d0a667269646765206f6e63652061206d6f6e74680d0a0d0a4a4f425320544f20424520444f4e45204f4e4c59205748454e2041534b45440d0a73747564790d0a6f76656e20636c65616e0d0a0d0a444f204e4f5420444f0d0a646f206e6f7420706f6c69736820746865207374616972732f666c6f6f72730d0a646f206e6f7420636c65616e2f746f75636820746865204a6f686e204261726c6579636f726e206865616420626f74746c65206f6e20746f70206f6620746865207069616e6f0d0a0d0a6361726566756c207768656e20706f6c697368696e67206e6f7420746f2067657420616e79206f6e2074686520776f6f6465656e20666c6f6f72730d0a70757420616e792077617368696e6720757020696e207468652064697368207761736865720d0a656d70747920686f6f766572206261677320617320616e64207768656e206e6563657373617279,0x,"rebecca.greenall@hotmail.co.uk","0","0","1","N","","","","3.00","01638","01638","","D","N","Y","W","2015-08-26","any","","1","1","2015-08-27 11:52:24","2015-08-27 11:52:24");
INSERT INTO trianik_client VALUES("38294","","Courteney-Barrow","L","Tiffany","Courteney-Barrow",0x54696666616e7920436f757274656e61792d426172726f77090d0a447269667420436f7474616765090d0a456c6d7320526f6164090d0a467265636b656e68616d090d0a537566666f6c6b090d0a4950323820384a4709,0x486172726965747320436166652054656120526f6f6d730d0a353720436f726e68696c6c73204275696c64696e670d0a427572792053742045646d756e64730d0a537566666f6c6b0d0a49503333203142540d0a,0x6163636f756e747340686172726965747363616665746561726f6f6d732e636f2e756b,0x49742773206d6f726520676f696e67207468726f756768206561636820726f6f6d20627574206966207520636f756c64206d656e74696f6e20746861742074686520696e736964652077696e646f777320696e206f6e6520726f6f6d2061207765656b206e65656420646f696e672c2074686520636f6e7365727661746f727920616e6420677565737420626564726f6f6d2f656e73756974652061726561206f6e6c79206e6565647320646f696e67206f63636173696f6e616c6c7920616e6420746f20616c7465726e617465207468652064696e696e6720726f6f6d20616e642064726177696e6720726f6f6d20286c6172676572206c6f756e67652920206173207468657920646f6e2774206e65656420646f696e67206576657279207765656b2c2062656464696e67206f6e6c79206e65656473206368616e67696e6720696e2049206c6561766520736865657473206f6e20746865206e6563657373617279206265647320616e6420746f206d616b6520737572652073686520697320686f6c64696e67207468652073686f776572206174746163686d656e7420696e206d792062617468726f6f6d206265666f7265207475726e696e67206f6e2c20656c73652069742077696c6c20666c79206f66662077616c6c20616e6420737072617920657665727977686572652e2049276c6c20676f207468726f756768207468652073696c7665727761726520636c65616e696e67206f6e20342070726f647563747320696e206b69746368656e207768656e204920676574206261636b2061732077656c6c2061732074686520486f6f766572206174746163686d656e747320666f7220617070726f70726961746520617265617320286965207374616972732c2063686169727320616e6420736b697274696e672920616e6420616e797468696e6720656c736520746861742049206861766520666f72676f7474656e2e205468782e205469666620780d0a0d0a0d0a0d0a416c7465726e61746520737472697070696e67206265647320616e642070757474696e67207468656d20696e20746865206d616368696e65206f6e65207765656b20616e6420636c65616e696e672074686520667269646765206f6e20746865206f746865722e0d0a0d0a4d61696e7461696e207468652077696e646f777320612066657720656163682076697369742c20736f2074686174207468657920616c6c2067657420646f6e652077697468696e2061206d6f6e74686c79206379636c652e0d0a0d0a47656e6572616c20636c65616e696e6720696e20616c6c20726f6f6d730d0a47656e6572616c2074696479207570206f6666206b69647320746f79732f73686f65730d0a576f726b2061726f756e64207768617420796f752063616e20696e207468652073747564790d0a477565737420726f6f6d20616e6420656e7375697465206f6e6c7920617320616e64207768656e20726571756573746564206173207573656420696e6672657175656e746c790d0a0d0a0d0a656e7375726520736b697274696e6720626f617264732061726520646f6e6520726567756c61726c790d0a0d0a5768656e2077617368696e672074686520626564206c696e656e20706c656173652072656d6f76652063757368696f6e20636f76657273206f6e20746865206b69746368656e2062656e636820616e642077617368207468656d20616c736f2e0d0a0d0a72656d6f76652063617420686169727320776865726520706f737369626c652d204d61696e6c79206b69746368656e2062656e636820616e6420636861697220696e20746865206261636b2068616c6c2e0d0a0d0a496e2074686520626f6f7420726f6f6d206368616e676520746865206e65777370617065722c2054696666616e792077696c6c206c6561766520796f75206f757420736f6d6520636c65616e206f6e65732e0d0a0d0a7769706520616e79206d61726b73206f6666207468652077616c6c732077697468202064616d7020636c6f7468207768656e2076697369626c652e0d0a,0x,"accounts@harrietscafetearooms.co.uk","0","0","1","","","","","4.00","01638 723144","07770966522","","B","N","Y","W","2015-08-27","any","","1","1","2015-08-27 11:55:30","2015-08-27 11:55:30");
INSERT INTO trianik_client VALUES("38295","","Nixon","L","Richard","Nixon",0x3833204f78204d6561646f770d0a426f7474697368616d0d0a43616d62726964676573686972650d0a434232352039464c,0x3833204f78204d6561646f770d0a426f7474697368616d0d0a43616d62726964676573686972650d0a434232352039464c,0x7468652e646561642e7072657340676d61696c2e636f6d,0x6261636b20646f6f72206b65792069732068616e67696e67206f6e207468652077616c6c2062792074686520646f6f722069747320746865206f6e6520776974682074686520707572706c65206b657972696e670d0a0d0a47656e6572616c20436c65616e2e0d0a0d0a427573792066616d696c7920736f20646f6ee280997420676574206368616e636520746f20646f206d75636820686f757365776f726b2c2067656e6572616c2074696479696e6720726f756e642c206272696e67696e6720686f757365206261636b20757020746f207374616e646172642065616368207765656b2e0d0a0d0a6a6f627320666f722065766572792076697369743a0d0a0d0a6b69746368656e0d0a7574696c69747920726f6f6d0d0a646f776e7374616972732077630d0a75707374616972732062617468726f6f6d0d0a757073746169727320656e2d73756974650d0a656d7074792062696e73202820626c61636b2062696e20697320696e206261636b2067617264656e290d0a76616375756d207468726f7567686f7574200d0a0d0a0d0a4a6f627320666f72206576657279206f746865722076697369743a0d0a0d0a64757374696e672073697474696e6720726f6f6d20616e642064696e696e6720726f6f6d20616c7465726e6174652074686520726f6f6d73207765656b6c790d0a0d0a4f63636173696f6e616c20726571756972656d656e74733a0d0a0d0a4f76656e20636c65616e0d0a64757374696e6720626564726f6f6d730d0a0d0a4a6f627320746f20626520646f6e65206f6e2c79207768656e2061736b65640d0a506c6179726f6f6d0d0a0d0a,0x446f206e6f7420706f6c6973682074686520776f6f64656e206675726e69747572652061732074686579207265717569726520697420746f2062652077617865642e20,"the.dead.pres@gmail.com","4","2","2","N","0408","","ALARM CODE  0408 to enter 0408 YES to exit","2.00","07941723187","07941723187","","B","N","Y","W","2015-08-28","fri","","1","1","2015-08-27 11:58:38","2015-08-27 11:58:38");
INSERT INTO trianik_client VALUES("38296","","Fletcher","L","Debra","Fletcher",0x48617265766965770d0a323320466f7820477265656e0d0a477420427261646c65790d0a43423820394e52,0x48617265766965770d0a323320466f7820477265656e0d0a477420427261646c65790d0a43423820394e52,0x6d6f72656d6f6574406d61632e636f6d,0x76616375756d20697320696e207468652063757062616f726420696e2057430d0a0d0a45564552592056495349540d0a436f6277656273207468726f7567686f75740d0a73697474696e6720726f6f6d2c20696e636c7564696e6720626c696e64732c20736b697274696e6720626f6172647320626568696e6420736f6661730d0a7374756479202d20666c6f6f72206f6e6c790d0a656e7472616e63652068616c6c0d0a574320286475737420626175626c6573290d0a64696e696e6720726f6f6d202d20696e636c7564696e67206c69676874206669747474696e67730d0a4b69746368656e202873637275622073696e6b2074686f726f7567686c792d2064657363616c65290d0a7574696c69747920726f6f6d20737572666163657320616e6420666c6f6f720d0a62616e6e69737465727320746f206265206475737465640d0a7368656c66206f6e207374616972730d0a6472657373696e6720726f6f6d202d206475737420616e64207661630d0a6d617374657220626564726f6f6d0d0a656e73756974650d0a0d0a4f43434153494f4e414c20524551554952454d454e54530d0a677565737420726f6f6d732031202620320d0a62656464696e672077696c6c206265206f6e2074686520626564206966206974206e65656473206368616e67696e670d0a62617468726f6f6d2069662074686520646f6f72206973206f70656e0d0a0d0a4946204120524f4f4d204953204e4f5420524551554952454420544f20424520434c45414e45442054484520444f4f522057494c4c204245204b45505420534855540d0a,0x0d0a444f204e4f5420444f20544845205354554459,"moremoet@mac.com","4","2","1","N","","","front door key given","3.00","01440783437","07590567718","","D","N","Y","W","2015-08-28","fri","","1","1","2015-08-27 12:01:31","2015-08-27 12:01:31");
INSERT INTO trianik_client VALUES("38297","","Macdonald","L","Alison","Macdonald",0x3336204d616e64657273746f6e20526f61640d0a4e65776d61726b65740d0a537566666f6c6b,0x3336204d616e64657273746f6e20526f61640d0a4e65776d61726b65740d0a537566666f6c6b,0x616c69776f6f6431393733407961686f6f2e636f2e756b,0x67656e6572616c20636c65616e696e67,0x,"aliwood1973@yahoo.co.uk","4","1","1","N","","","","2.00","01638661007","07808001230","","","N","Y","W","2015-08-25","","","1","1","2015-08-27 12:05:01","2015-08-27 12:05:01");
INSERT INTO trianik_client VALUES("38298","","Ehall","L","Lisanne","Ehall",0x36312043656e7472652044726976650d0a4e65776d61726b65740d0a537566666f6c6b0d0a434238203841570d0a,0x36312043656e7472652044726976650d0a4e65776d61726b65740d0a537566666f6c6b0d0a434238203841570d0a,0x,0x5072696f72697469657320617265207468652064757374696e6720616e642076616375756d696e670d0a67656e6572616c20636c65616e696e67206f662062617468726f6f6d732c206b69746368656e2c2073747564792c2077632c2070696374757265207261696c730d0a0d0a6d6f7020666c6f6f7220696e206b69746368656e206576657279207765656b0d0a0d0a57696e646f7773206173207265717565737465640d0a646f776e7374616972732062617468726f6f6d20746f20626520636c65616e656420627574206f6e6c7920646f207468652073686f776572207768656e207265717565737465640d0a0d0a4c4541564520544845205441424c4520494e205448452044454e2c20544845204a4150414e4553452053435245454e5320414e442053574f52442c20414c4f4e4520415320544845592041524520564552592046524147494c450d0a0d0a7468652076616375756d206973206e65787420746f20746865207374616972730d0a,0x,"theehalls@yahoo.com.au","0","0","1","","","","FRONT PORCH DOOR OPEN, KEY IS FOR 2ND DOOR","3.00","01638 603597","01638 603597","","B","N","Y","W","2015-08-24","any","","1","1","2015-08-27 12:08:39","2015-08-27 12:08:39");
INSERT INTO trianik_client VALUES("38299","","Langstaff","L","Nicole","Langstaff",0x32205068616e746f6d20436f74746167650d0a5061726b204661726d0d0a4368697070656e68616d0d0a43423720355142,0x32205068616e746f6d20436f74746167650d0a5061726b204661726d0d0a4368697070656e68616d0d0a43423720355142,0x6e6c616e6773746166664077616974726f73652e636f6d,0x494620434f4d494e472046524f4d20534e41494c57454c4c20495453204245545745454e20534e41494c57454c4c20414e44204348495050454e48414d2c205041524b204641524d204953204f4e20544845204c454654204f4e2041205245414c4c592054494748542042454e442c20445249564520444f574e2054484520545241434b20414e4420544845592041524520544845205345434f4e4420434f5454414745204f4e205448452052494748540d0a63616c6c206e69636f6c65206f6e20303739333034343039343320696620796f75206861766520616e792070726f626c656d732077697468206163636573732f74686520676174650d0a6e6f206b657920676976656e2c20617272616e67656d656e74732077696c6c206265206d61646520696620657665722074686579206172656e277420686f6d652e0d0a0d0a0d0a76616375756d20697320696e20746865206f7574206275696c64696e67206174207468652066726f6e74206f662074686520686f7573650d0a0d0a3120686f75722069726f6e696e6720666f72207368697274732065766572792076697369740d0a0d0a4a4f425320464f522045564552592056495349540d0a6b69746368656e0d0a64696e696e6720726f6f6d0d0a73697474696e6720726f6f6d0d0a772e630d0a62617468726f6f6d0d0a626564726f6f6d2f6f66666963650d0a6472657373696e6720726f6f6d0d0a0d0a4e49434f4c45204c696b6573205448452053494e4b5320414e44205441505320544f20424520504f4c495348454420414e44205348494e590d0a0d0a69732061207665727920647573747920686f7573652064756520746f207468652068617276657374696e672c206275742077696c6c20626520656173696572206e6f77207468657920686176652066696e69736865640d0a0d0a6475737420616e7920706963747572657320746861742068617665206265656e20676c617a65642062757420646f6e277420646f20616e79207468617420646f6e2774206861766520676c6173730d0a616c6c2070696374757265732061726520766572792076616c7561626c650d0a0d0a,0x56414c5541424c45204954454d53204e4f5420544f20424520434c45414e45440d0a6669736820616e6420626c756520686f727365206f726e616d656e74730d0a616e7920756e676c617a65642070696374757265730d0a444f204e4f5420444f0d0a41676120696e2064696e696e6720726f6f6d0d0a756e676c617a6564207061696e74696e6773,"nlangstaff@waitrose.com","3","2","0","","","","","2.00","07930440943","07930440943","","","","","T","2015-09-03","","","1","1","2015-08-27 12:12:14","2015-08-27 12:12:14");
INSERT INTO trianik_client VALUES("38300","","Andrews D","L","Doreen","Andrews",0x3320446f776e696e6720436f7572740d0a537761666668616d2042756c6265636b0d0a43616d6272696467650d0a4342323520304e45,0x3320446f776e696e6720436f7572740d0a537761666668616d2042756c6265636b0d0a43616d6272696467650d0a4342323520304e45,0x70617472696369616672616e6b6c616e6440676f6f676c656d61696c2e636f6d,0x65766572792076697369743a0d0a0d0a776173682062617468726f6f6d20616e64206b69746863656e20666c6f6f72730d0a76616375756d207468726f7567686f75740d0a636c65616e206f6e6520726f6f6d207065722076697369742e200d0a0d0a626564206368616e67696e67206f63636173696f6e616c6c792072657175697265642e20,0x,"patriciafrankland@googlemail.com","1","1","0","N","","","no key given, ring doorbell she is always home","2.00","01223811587","","01223812360","D","N","Y","W","2015-08-28","any","","1","1","2015-08-27 12:14:44","2015-08-27 12:14:44");
INSERT INTO trianik_client VALUES("38301","","England","L","Jill","England",0x322043686576656c657920526f61640d0a4e65776d61726b6574200d0a537566666f6c6b0d0a434238203841440d0a,0x322043686576656c657920526f61640d0a4e65776d61726b6574200d0a537566666f6c6b0d0a434238203841440d0a,0x,0x67656e6572616c20636c65616e696e67207468726f7567686f75742c0d0a0d0a776f726b2061726f756e6420636f6e7365727661746f72792061732069742069736e742075736564206d7563682e0d0a0d0a446f206e6f7420646f20737061726520646f75626c6520726f6f6d0d0a0d0a446f206e6f7420736875742074686520616972696e6720637570626f61726420646f6f722061732074686520636174206c6976657320696e207468657265210d0a0d0a69726f6e696e67206173207265717569726564,0x,"none","0","0","0","N","","","","2.00","01638664962","01638664962","","Q","Y","Y","W","2015-08-24","","","1","1","2015-08-27 12:16:38","2015-08-27 12:16:38");
INSERT INTO trianik_client VALUES("38302","","Lazar","L","Claudine","Lazar",0x33332054686520477265656e0d0a4173686c65790d0a4e65776d61726b65740d0a537566666f6c6b0d0a434238203945420d0a,0x33332054686520477265656e0d0a4173686c65790d0a4e65776d61726b65740d0a537566666f6c6b0d0a434238203945420d0a,0x636c617564696e656c617a617240676d61696c2e636f6d,0x76616375756d20697320696e2074686520637570626f61726420756e64657220746865207374616972730d0a0d0a4a6f627320666f722065766572792076697369743a0d0a0d0a73697474696e6720726f6f6d2f64696e696e6720726f6f6d202067656e6572616c20636c65616e2e20706c6561736520656e7375726520616c6c2077696e646f772073696c6c732061726520636c65616e6564207468726f7567686f75742e0d0a7374726169676874656e2075702074686520736f66612063757368696f6e730d0a6b69746368656e20202d20616c6c20737572666163657320616e6420666c6f6f722e200d0a7374616972730d0a62617468726f6f6d0d0a6d617374657220626564726f6f6d0d0a0d0a6f63636173696f6e616c20726571756972656d656e74730d0a696e736964652077696e646f77730d0a3220737061726520726f6f6d7320746f20626520646f6e6520617320616e64207768656e20746865792068617665206265656e20757365642e200d0a0d0a496620636c617564696e65206973206e6f7420686f6d6520706c6561736520646f206e6f74206c65742074686520636174206f75742e200d0a54686520636174206c696b657320746f20706c61792066696768742061742074686520746f70206f662074686520737461697273206265747765656e207468652062616e6e69737465727320736f207761746368206f757420696e636173652073686520747269657320746f20737769706520796f7521,0x,"claudinelazar@gmail.com","3","1","1","N","","","Front door is not in use please access the property via the ","2.00","01638730702"," 07973641727","","","","","T","2015-08-31","","","1","1","2015-08-27 12:18:50","2015-08-27 12:18:50");
INSERT INTO trianik_client VALUES("38303","","Terrett","L","Peter","Terrett",0x436c6576656c616e647320486f757365230d0a4f6c642053746174696f6e20726f61640d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820385145,0x436c6576656c616e647320486f757365230d0a4f6c642053746174696f6e20726f61640d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820385145,0x70657465724061626370726f64756374732e636f2e756b,0x,0x,"peter@abcproducts.co.uk","0","0","0","","","","","2.00","01638662889","07786 076362","","D","N","N","W","2015-08-24","tues and thu","","1","1","2015-08-27 12:21:26","2015-08-27 12:21:26");
INSERT INTO trianik_client VALUES("38304","","Brandl","L","Maria","Brandl",0x3320436f7572746c616e64204176656e75650d0a43616d6272696467650d0a43423120374154,0x3320436f7572746c616e64204176656e75650d0a43616d6272696467650d0a43423120374154,0x6d2e6272616e646c406274696e7465726e65742e636f6d,0x76616375756d20697320696e2074686520637570626f617264206e65787420746f206c6f6262790d0a0d0a45564552592056495349540d0a666c6f6f7273200d0a62617468726f6f6d730d0a736b697274696e670d0a64757374696e67200d0a77696e646f7773696c6c0d0a6d6f756c64207370726179206f6e2077696e646f7773207768656e206e65636573736172790d0a67656e6572616c20636c65616e207468726f7567686f75740d0a0d0a4f43434153494f4e414c0d0a636c65616e207368656574732077696c6c206265206f6e20626564207768656e207468657920617265206e656564656420746f206265206368616e6765640d0a0d0a444f204e4f542055534520414e595448494e472054484154204953204e4f542045434f20465249454e444c5920455843455054204d4f554c44205350524159205748454e205245515549524544204153204e45434553534152590d0a0d0a616e792064697274792077617368696e6720746f2062652070757420696e20746865206261736b657420666f72206d6172696120746f206f7267616e6973650d0a666f637573206f6e20636c65616e696e6720616e6420646f6e7420776f72727920746f6f206d7563682061626f75742074696479696e672e200d0a,0x,"m.brandl@btinternet.com","2","1","1","","","","","2.50","01223","01223","","D","N","Y","W","2015-08-26","any","","1","1","2015-08-27 12:24:33","2015-08-27 12:24:33");
INSERT INTO trianik_client VALUES("38305","","Drury","L","Eleanor","Drury",0x32326120506f756e64204c616e650d0a4973656c68616d0d0a456c790d0a43616d62726964676573686972650d0a434237203553460d0a,0x32326120506f756e64204c616e650d0a4973656c68616d0d0a456c790d0a43616d62726964676573686972650d0a434237203553460d0a,0x656c6c6965686f77617264373840676d61696c2e636f6d,0x4b69746368656e2042617468726f6f6d202620666c6f6f72732061207072696f726974792c0d0a0d0a55736520696e697469617469766520736f20616c6c6f636174652074696d6520616e6420646f207768617473206e65656465642e0d0a0d0a56616375756d20697320696e20746865207574696c69747920726f6f6d0d0a,0x,"elliehoward78@gmail.com","0","0","1","N","","","","2.00","01638 780005 ","07908989687","","B","N","Y","W","2015-08-26","any","","1","1","2015-08-27 12:28:37","2015-08-27 12:28:37");
INSERT INTO trianik_client VALUES("38306","","McAllister","L","Lesley","McAllister",0x,0x,0x6c65736c65796d6163363140676d61696c2e636f6d,0x56616375756d73202d20626967206f6e6520756e646572207468652073746169727320666f7220646f696e672075707374616972732c206c6974746c65206f6e6520696e207574696c69747920726f6f6d206f6e207468652077616c6c20666f7220646f776e7374616972730d0a0d0a446f67206269736375697420637570626f617264206e65787420746f206261636b20646f6f722c207075742074686520646f677320696e20746865206261636b2067617264656e2069662074686579206172652061206e756973616e63652e200d0a0d0a55707374616972733a0d0a6d617374657220626564726f6f6d202d20647573742026207661630d0a636c65616e20656e7375697465207761736820666c6f6f720d0a766163206c616e64696e672f737461697273202d2062696720686f6f7665720d0a0d0a446f776e7374616972733a0d0a636c65616e20636c6f616b726f6f6d2026207761736820666c6f6f720d0a766163202d206c6974746c652076616375756d2c206c6f756e67652c2068616c6c2c206b69746368656e2c207574696c6974790d0a64757374206c6f756e67650d0a68616c6c0d0a636c65616e206b69746368656e202620207574696c697479202d20737572666163652c20646f6f72732c20636f6f6b65720d0a7761736820666c6f6f72730d0a636c65616e2077696e646f772f6672656e636820646f6f72730d0a0d0a6475737420616c6c20736b697274696e6720626f61726473,0x444f204e4f5420444f2054484520574849534b455920434142494e455420494e2053495454494e4720524f4f4d,"lesleymac61@gmail.com","0","0","0","","","","","0.00","07860438752","07860438752","","","","","","0000-00-00","","","1","1","2015-08-27 12:34:38","2015-08-27 12:34:38");
INSERT INTO trianik_client VALUES("38307","","Horton","L","James","Horton",0x436f726e6669656c64730d0a5061726b204661726d204261726e730d0a4368697070656e68616d0d0a43423720355142,0x436f726e6669656c64730d0a5061726b204661726d204261726e730d0a4368697070656e68616d0d0a43423720355142,0x68616d6573686f72746f6e35362e6a6840676d61696c2e636f6d,0x0d0a76616375756d20696e20746865206c617264657220696e206b69746863656e0d0a0d0a69726f6e696e672077696c6c206265206c656674206f6e207468652069726f6e696e6720626f6172642069662072657175697265642e200d0a0d0a67656e6572616c20636c65616e696e67207468726f7567686f75742074686520686f7573652c20646f2074686520677565737420726f6f6d7320666f72746e696768746c790d0a69662062656464696e67206973206c656674206f7574206f6e2074686520626564207468656e20706c65617365206368616e676520746865207368656574732e20,0x,"hameshorton56.jh@gmail.com","3","1","1","N","","","top lock","2.00","01638482041","07810872778","","D","N","Y","W","2015-08-28","any","","1","1","2015-08-27 12:38:30","2015-08-27 12:38:30");
INSERT INTO trianik_client VALUES("38308","","O\'Meara","L","Dave","O\'Meara",0x322042756e74696e677320506174682c200d0a42757277656c6c2c200d0a43423235203045470d0a,0x322042756e74696e677320506174682c200d0a42757277656c6c2c200d0a43423235203045470d0a,0x646176656f6d6561726140686f746d61696c2e636f6d,0x4c6f756e67650d0a22095461626c6573206475737465642f706f6c69736865642e0d0a2209416c6c206f74686572207375726661636573206475737465642f706f6c69736865642028545620636162696e65742f77696e646f7773696c6c292e0d0a2209466c6f6f722076616375756d656420616e64207761736865642f737465616d206d6f707065642e0d0a220952756720262063686169722076616375756d65642e090d0a22095456206475737465642e0d0a220946697265706c6163652064757374656420286e6f7420696e20757365292e0d0a22094c65617468657220736f6661206475737465642f636c65616e65642e0d0a0d0a42617468726f6f6d0d0a2209546f696c65742c2077617368626173696e20616e64206261746820636c65616e65642028696e636c7564696e6720706564657374616c73290d0a2209466c6f6f722076616375756d656420616e6420737465616d206d6f707065642e0d0a2209436c65616e2074696c65732069662064697274792f6d61726b65642e0d0a2209416c6c20737572666163656420636c65616e6564202877696e646f7773696c6c2f7368656c7665732f6d6972726f72206574632e290d0a0d0a4b69746368656e0d0a2209416c6c2073757266616365732f7368656c76657320636c65616e65642e0d0a2209466c6f6f722076616375756d656420616e6420737465616d206d6f707065642e0d0a2209437570626f6172642066726f6e74732028696e636c7564696e67206672696467652c2077617368696e67206d616368696e6520616e6420646973687761736865722066726f6e746167652920636c65616e65642069662064697274792e0d0a2209436c65616e2074696c65732069662064697274792f6d61726b65642e0d0a220953696e6b20636c65616e65642e0d0a2209486f6220636c65616e65642069662064697274792e0d0a220942696e20636c65616e65642e0d0a2209416c6c206f74686572207375726661636573206475737465642f706f6c69736865642028647265737365722f77696e646f7773696c6c20657463292e0d0a0d0a48616c6c7761792f5374616972730d0a2209436f727269646f7220666c6f6f722076616375756d656420616e6420737465616d206d6f707065642e0d0a22095374616972732076616375756d65642e0d0a0d0a4d61696e20626564726f6f6d0d0a2209416c6c207375726661636573206475737465642f706f6c6973686564202877696e646f7773696c6c2f636162696e657473292e0d0a22094665656c206672656520746f206d6f766520616e797468696e6720286d6f73746c792053617261682773207468696e677321292e0d0a22094361727065742076616375756d65642e0d0a0d0a537061726520626564726f6f6d0d0a2209416c6c20737572666163657320647573746564202877696e646f7773696c6c2f626f6f6b63617365206574632e29090d0a22094361727065742076616375756d65642e0d0a0d0a47656e6572616c0d0a2209416c6c20736b697274696e6720626f61726473206475737465642e0d0a2209416c6c207069637475726573206475737465642e0d0a2209416c6c206d6972726f727320636c65616e65642e0d0a2209496e73696465206f662077696e646f777320636c65616e6564206f63636173696f6e616c6c792e0d0a22094665656c206672656520746f206d6f7665206f626a6563747320286f726e616d656e7473206574632e2920746f206761696e2070726f706572206163636573732e0d0a2209436174206973206672656520746f20636f6d652026206c6561766520286e6f7420746f206265206665642074686f75676821290d0a,0x,"daveomeara@hotmail.com","0","0","1","","","","","2.00","01638","01638","","D","N","Y","W","2015-08-28","any","","1","1","2015-08-27 12:41:37","2015-08-27 12:41:37");
INSERT INTO trianik_client VALUES("38309","","Wilson","L","Maggie","Wilson",0x3131392043656e7472652044726976650d0a4e65776d61726b65740d0a537566666f6c6b0d0a434238203841500d0a,0x3131392043656e7472652044726976650d0a4e65776d61726b65740d0a537566666f6c6b0d0a434238203841500d0a,0x6d616767696531313977696c736f6e406274696e7465726e65742e636f6d,0x47656e6572616c20636c65616e696e672e0d0a4368616e67652062656420736865657473207768656e207265717569726564204d61676769652077696c6c206c6561766520636c65616e20736865657473206f6e206265640d0a446f67206973206f63636173696f6e616c6c79206c65667420627574206973207665727920667269656e646c790d0a0d0a4f6e6c7920646f20737061726520726f6f6d207768656e2072657175697265642e0d0a0d0a4b69746368656e20262062617468726f6f6d2074686f726f7567686c792e0d0a0d0a4c6f7473206f6620646f6720686169720d0a0d0a4d61676769652077696c6c206c656176652062656464696e67206f7574206f6e207468652062656420696620736865207265717569726573207468656d20746f206265206368616e6765640d0a,0x,"maggie119wilson@btinternet.com","0","0","1","N","","","Directions: House is the one with a big boat on drive.","1.50","01638 668860","","","B","N","Y","W","2015-08-24","","","1","1","2015-08-27 12:44:08","2015-08-27 12:44:08");
INSERT INTO trianik_client VALUES("38310","","Chapman","L","John","Chapman",0x4d45594e454c4c20484f5553450d0a534e41494c57454c4c20524f41440d0a4e45574d41524b45540d0a43423820374450,0x4d45594e454c4c20484f5553450d0a534e41494c57454c4c20524f41440d0a4e45574d41524b45540d0a43423820374450,0x6a636a6f6e6368617040676d61696c2e636f6d,0x76616375756d202d206c6974746c65206f6e6520696e2074686520637570626f61726420756e64657220746865207374616972732c206c61726765206f6e65206b6570742075707374616972730d0a49726f6e696e672d206f63636173696f6e616c6c792072657175697265642075706f6e20726571756573740d0a0d0a4a4f425320464f522045564552592056495349543a0d0a0d0a76616375756d206d6f726e696e6720726f6f6d20616e6420636c6f616b726f6f6d0d0a0d0a34205745454b4c59204359434c453a0d0a0d0a5745454b20312020616c6c206f662074686520646f776e73746169727320617265612c20696e636c7564696e672064696e696e6720726f6f6d2c2064726177696e6720726f6f6d2c2077696e646f777320616e642077696e646f77206272617373657320696e2074686573652061726561730d0a0d0a5745454b2032206f6e65206f662074686520626564726f6f6d7320616e6420312062617468726f6f6d2c206c616e64696e6720616e64207374616972732c2077696e646f777320616e642077696e646f77206272617373657320696e2074686573652061726561730d0a0d0a5745454b203320616c6c206f662074686520646f776e73746169727320617265612c20696e636c7564696e672064696e696e6720726f6f6d2c2064726177696e6720726f6f6d2c2077696e646f777320616e642077696e646f77206272617373657320696e2074686573652061726561730d0a0d0a5745454b203420746865206f7468657220626564726f6f6d20616e64202062617468726f6f6d2c206c616e64696e6720616e64207374616972732c2077696e646f777320616e642077696e646f77206272617373657320696e2074686573652061726561730d0a0d0a4f43434153494f4e414c20524551554952454d454e54530d0a56616375756d20737475647920616e64206361727065747320696e20746865206f7468657220626564726f6f6d732c2077696e646f777320616e6420627261737365732c2073756e20726f6f6d0d0a0d0a4a4f425320544f20424520444f4e45204f4e4c59205748454e2041534b45443a0d0a4b69746368656e0d0a,0x444f204e4f5420444f3a0d0a0d0a646f206e6f74206472617720746865206375727461696e732061732074686579206172652076657279206f6c6420616e6420766572792066726167696c652e20,"jcjonchap@gmail.com","5","2","0","N","","","","3.00","01638661747","","","B","Y","Y","W","2015-08-31","any","","1","1","2015-08-27 12:47:23","2015-08-27 12:47:23");
INSERT INTO trianik_client VALUES("38311","","Tudor-Price","L","James","Tudor-price",0x3138204d696c6c2048696c6c0d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820304a42,0x3138204d696c6c2048696c6c0d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820304a42,0x6a616d65736567616e323340686f746d61696c2e636f6d,0x67656e6572616c20686f757365776f726b2c2077617368696e6720757020616e642074696479696e6720726571756972656420746f2068656c70206f75740d0a0d0a444f204e4f5420444f3a0d0a747620696e20746865206c6976696e6720726f6f6d0d0a0d0a4556455259205745454b3a0d0a4b69746368656e2c2062617468726f6f6d2c20666c6f6f727320616e642064757374696e670d0a0d0a6576657279206f74686572207765656b20646f2074686520626564726f6f6d73,0x,"jamesegan23@hotmail.com","2","1","0","N","","","they will be home to let you in","2.00","01638","J07856217375/C0","","D","N","Y","W","2015-08-31","any","","1","1","2015-08-27 12:50:02","2015-08-27 12:50:02");
INSERT INTO trianik_client VALUES("38312","","Holt","L","Ruth","Holt",0x3120526f62696e2048617463680d0a43726f636b666f726420526f6164200d0a4e65776d61726b65740d0a43423820394247,0x43616d62726964676520536b696e2026204c6173657220436c696e69630d0a372042726f6f6b6c616e6473204176656e75650d0a43616d6272696467650d0a43616d627269646773686972650d0a434232203242420d0a,0x72757468686c74407961686f6f2e636f2e756b,0x,0x,"ruthhlt@yahoo.co.uk","0","0","0","","","","","4.00","01223 362226"," 07746 030442","","B","N","Y","T","2015-08-28","any","","1","1","2015-08-27 12:59:07","2015-08-27 12:59:07");
INSERT INTO trianik_client VALUES("38313","","Patel","L","Nimisha","Patel",0x527567627920436f74746167650d0a4772616e6279207374726565740d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820384845,0x527567627920436f74746167650d0a4772616e6279207374726565740d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820384845,0x6e696d7a5f726f6d6131323340686f746d61696c2e636f6d,0x67656e6572616c20636c65616e696e67207468726f7567686f75742e200d0a76616375756d206973756e6465722074686520737461697273202d20756e686f6f6b206375727461696e20,0x,"nimz_roma123@hotmail.com","2","1","1","","","","#its in between 23-25 granby street ","2.00","01638815612","07716934022","","D","N","Y","T","2015-09-04","","","1","1","2015-08-27 13:01:31","2015-08-27 13:01:31");
INSERT INTO trianik_client VALUES("38314","","Whelehan T","L","Tamzin","Whelehan",0x0d0a34303220417572656f6c652057616c6b0d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820374242,0x0d0a34303220417572656f6c652057616c6b0d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820374242,0x74616d7a696e2e7768656c6568616e40686f746d61696c2e636f2e756b,0x566163756d20756e64657220746865207374616972730d0a0d0a0d0a646f6720697320757375616c6c79206b65707420696e2074686520636f6e7365727661746f727920657863657074206f6e207265616c6c7920686f7420646179732c206c65742068696d206f757420616e642061726f756e642074686520686f7573652e0d0a0d0a45564552592056495349543a0d0a0d0a62617468726f6f6d0d0a636c6f616b726f6f6d0d0a6b69746368656e0d0a666c6f72732076616320616e64206d6f700d0a6368616e67652062656473207768656e207468652062656464696e67206973206c656674206f75740d0a64757374696e6720646f776e7374616972730d0a746f2074616b652074686520636f76657273206f66662074686520736f66617320616e6420686f6f76657220756e646572207468652063757368696f6e730d0a0d0a444f204e4f5420444f3a0d0a6e6f7420746f20647573742074686520626564726f6f6d73,0x,"tamzin.whelehan@hotmail.co.uk","0","0","0","N","","","","3.00","01638 669076","01638 669076","","D","N","Y","W","2015-08-28","","","1","1","2015-08-27 13:04:24","2015-08-27 13:04:24");
INSERT INTO trianik_client VALUES("38315","","Barber","L","Tamlyn","Barber",0x3130392048696768205374726565740d0a537761666668616d2042756c6265636b0d0a63616d6272696467657368697265,0x3130392048696768205374726565740d0a537761666668616d2042756c6265636b0d0a63616d6272696467657368697265,0x74616d76616e756b407961686f6f2e636f2e756b,0x0d0a47656e6572616c20636c65616e696e672c2064757374696e672c20766163756d696e67207468726f7567686f75742c0d0a0d0a706c656173652070617920706172746963756c617220617474656e74696f6e20746f2073686f7765722073637265656e20616e64207365616c732e0d0a6d6f7020746865206b69746368656e20616e6420656e7472616e63652068616c6c206576657279207765656b0d0a0d0a5468652077696e646f7773206765742064616d7020616e642077696c6c206275696c64206d6f756c6420736f20706c6561736520636c65616e207468652077696e646f777320616e64206672616d65732065616368207765656b,0x,"tamvanuk@yahoo.co.uk","3","1","1","N","","","","2.00","07769267681","07769267681","","Q","N","Y","W","2015-08-27","any","","1","1","2015-08-27 13:06:37","2015-08-27 13:06:37");
INSERT INTO trianik_client VALUES("38316","","Williams","L","Tracy","Williams",0x343120476f6c64656e204d696c6c657220434c6f73650d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820375254,0x343120476f6c64656e204d696c6c657220434c6f73650d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820375254,0x7472616379736368696c646d696e64696e67407961686f6f2e636f2e756b,0x54554553444159533a0d0a0d0a53545544592028444f4e5420544f554348204445534b530d0a55505354414952532042415448524f4f4d0d0a4749524c5320424544524f4f4d202620454e53554954450d0a53544149525320414e44204c4f554e47450d0a0d0a465249444159533a0d0a46524f4e542053494e474c4520424544524f4f4d0d0a55505354414952532042415448524f4f4d0d0a4d415354455220424544524f4f4d0d0a53544149525320414e44204c4f554e47450d0a0d0a444f204e4f5420444f3a0d0a646f776e7374616972732062617468726f6f6d0d0a6b69746368656e0d0a64696e696e6720726f6f6d0d0a,0x646f206e6f7420746f756368207468652067697261666665207069637475726573,"tracyschildminding@yahoo.co.uk","4","1","0","N","","","","2.00","01638 668672"," 07894707547","","D","N","Y","W","2015-08-24","tues and frid","","1","1","2015-08-27 13:10:00","2015-08-27 13:10:00");
INSERT INTO trianik_client VALUES("38317","","Winfield","L","Stephen","Winfield",0x382045786e696e6720526f61640d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820304142,0x382045786e696e6720526f61640d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820304142,0x73746576656e2e77696e6669656c644063616e7461622e6e6574,0x56414355554d202d2020757073746169727320626564726f6f6d0d0a0d0a4a4f425320464f522045564552592056495349540d0a6b69746368656e0d0a7769706520646f776e2064696e696e67207461626c65200d0a68616c6c2c2073746169727320616e64206c616e64696e670d0a62617468726f6f6d0d0a77630d0a62696e730d0a0d0a4a4f425320464f52204556455259204f544845522056495349540d0a7574696c69747920726f6f6d0d0a64696e696e6720726f6f6d0d0a6d617374657220626564726f6f6d0d0a6e7572736572790d0a0d0a4f43434153494f4e414c20524551554952454d454e54530d0a76616375756d20737061726520726f6f6d730d0a686f622d206c696674696e6720746865207261636b7320616e6420636c65616e696e672072696e6773206574632e200d0a0d0a4a4f425320544f20424520444f4e45204f4e4c59205748454e2041534b45440d0a737061726520726f6f6d730d0a0d0a4144444954494f4e414c20494e464f0d0a0d0a54686520686f742077617465722074617020696e20746865206b69746368656e206973206f6e20746865206c65667420616e64206973205645525920484f54202d2043415554494f4e0d0a,0x444f204e4f54206c6574207468652063617473206f757420746865792061726520696e646f6f7220636174732c20696620796f75206e65656420746f206f70656e20612077696e646f7720656e737572652074686520636174206973206e6f7420696e2074686520726f6f6d20616e64206b6565702074686520646f6f7220736875742e200d0a0d0a56414c5541424c45532d206e6f6e6520646973636c6f7365640d0a0d0a444f204e4f542075736520616e7920646574746f6c206f72207374726f6e67206368656d6963616c73206f6e2074686520666c6f6f72732061732069742063616e20706f69736f6e207468652063617473,"steven.winfield@cantab.net","0","0","1","","","","","2.00","01638601469 "," 07814872128","","D","N","Y","W","2015-08-25","any","","1","1","2015-08-27 13:13:15","2015-08-27 13:13:15");
INSERT INTO trianik_client VALUES("38318","","Lebish","L","Greg","Lebish",0x,0x,0x677265672e6c656269736840676d61696c2e636f6d,0x0d0a0d0a4a4f425320464f522045564552592056495349540d0a6e6c696e647320696e2073697474696e6720726f6f6d0d0a73697474696e6720726f6f6d202d20706f6c69736820616e64207661632c20666c6f6f7220746f206265206d6f707065640d0a4b69746368656e2067656e6572616c20636c65616e20696e636c7564696e672076616320616e64206d6f700d0a64696e696e6720726f6f6d2067656e6572616c20636c65616e207468726f7567686f75740d0a62617468726f6f6d2074686f726f75676820636c65616e2c20706f6c6973682074686520746f77656c207261696c20616e64206d6972726f72730d0a73747564792f677565737420726f6f6d0d0a73746169727320746f2062652076616375756d6564206576657279207765656b0d0a4d6169617320626564726f6f6d0d0a6d617374657220626564726f6f6d20616e6420656e73756974650d0a0d0a4a4f425320464f52204556455259204f544845522056495349540d0a477565737420726f6f6d0d0a44696e696e6720726f6f6d20626c696e64730d0a0d0a4f43434153494f4e414c20524551554952454d454e54530d0a77696e646f77730d0a646f6f72730d0a626c696e647320696e20626564726f6f6d730d0a7368656c76657320696e206d617374657220626564726f6f6d0d0a0d0a444f204e4f5420544f554348205448452054560d0a0d0a796f752077696c6c206e65656420746f2075736520746865206d6f756c6420737072617920696e207468652062617468726f6f6d20646f776e7374616972730d0a,0x,"greg.lebish@gmail.com","4","2","1","","","","","3.00","07799706155","07799706155","","B","N","Y","W","2015-08-26","any","","1","1","2015-08-27 13:15:33","2015-08-27 13:15:33");
INSERT INTO trianik_client VALUES("38319","","Simms","L","Dudley","Simms",0x576f6f646c616e64730d0a427261646c657920526f61640d0a436f776c696e67652c204e65776d61726b65740d0a537566666f6c6b0d0a434238203948550d0a,0x576f6f646c616e64730d0a427261646c657920526f61640d0a436f776c696e67652c204e65776d61726b65740d0a537566666f6c6b0d0a434238203948550d0a,0x6473696d6d73406361702d65717569702e636f2e756b,0x546f20646f20616c6c2074686520666c6f6f72732069742074616b657320617070726f782e20326872730d0a416c6c20666c6f6f72732076616375756d656420616e64207761736865642074686520626c65616368656420776f6f64656e20666c6f6f727320746f20626520776869746520736f617065642f72696e7365642d204d696e6e612077696c6c2064656d6f6e73747261746520686f772e0d0a5574696c69747920726f6f6d2026206b69746368656e20737572666163657320616e6420666c6f6f720d0a44696e696e6720726f6f6d202620666c6f6f72730d0a572e4320e280932067656e6572616c20636c65616e0d0a3220677565737420726f6f6d7320636c65616e206f6e20317374207669736974207468656e20617320616e64207768656e2072657175697265640d0a42617468726f6f6d2f7361756e612067656e6572616c20636c65616e0d0a53686f77657220726f6f6d2c20656e2d73756974652c206d61696e20626564726f6f6d2c207570737461697273206f70656e20706c616e20617265612c206f666669636520616e6420746f696c657420616c6c2067656e6572616c20636c65616e696e672e0d0a53746169727320746f206265207761736865642e204d41494e4c5920434f4e43454e5452415445204f4e20464c4f4f525320414e442044555354494e470d0a324e4420555053544149525320464c41542054414b455320415050524f5820324852532d204f4e4c5920415320524551554553544544,0x,"dsimms@cap-equip.co.uk","0","0","0","","","","","4.00","01440 821675/67","01440 821675/67","","B","N","Y","W","2015-08-27","any","","1","1","2015-08-27 13:17:36","2015-08-27 13:17:36");
INSERT INTO trianik_client VALUES("38320","","Platt","L","Jane","Platt",0x3536204973616163736f6e20526f61640d0a42757277656c6c0d0a4342323520304146,0x3536204973616163736f6e20526f61640d0a42757277656c6c0d0a4342323520304146,0x6a616e652e706c61747435406274696e7465726e65742e636f6d3b206164616d706c617474406274696e7465726e65742e636f6d,0x76616375756d20696e2073686f6520637570626f6172640d0a0d0a0d0a4a4f425320464f522045564552592056495349540d0a0d0a73697474696e6720726f6f6d0d0a77630d0a656e7472616e63652068616c6c0d0a6b69746368656e0d0a7574696c69747920726f6f6d0d0a616e6e617320726f6f6d0d0a656e737569746520696e20626564726f6f6d2032200d0a6d617374657220626564726f6f6d0d0a0d0a4a4f425320464f52204556455259204f544845522056495349540d0a6d6f702073697474696e6720726f6f6d20666c6f6f720d0a706c6179726f6f6d0d0a6f66666963650d0a616e6e61732062617468726f6f6d0d0a6a616e65732062617468726f6f6d20286d617374657220656e7375697465290d0a0d0a6f63636173696f6e616c20726571756972656d656e74730d0a0d0a626564726f6f6d203220616e6420340d0a0d0a,0x444f204e4f5420444f0d0a0d0a747620616e642073746572656f2073797374656d20696e2073697474696e6720726f6f6d0d0a64696e696e6720726f6f6d0d0a616e7920756e676c617a6564207069637475726573,"jane.platt5@btinternet.com; adamplatt@btinternet.com","4","3","0","","","","","3.00","01638 743311","07970293855","","B","N","Y","W","2015-08-27","any","","1","1","2015-08-27 13:20:29","2015-08-27 13:20:29");
INSERT INTO trianik_client VALUES("38321","","Bambrough","L","Bryony","Bambrough",0x546865204f6c64205374756420486f7573650d0a4275727920526f61640d0a4b656e74666f72640d0a434238203750540d0a,0x546865204f6c64205374756420486f7573650d0a4275727920526f61640d0a4b656e74666f72640d0a434238203750540d0a,0x6272796f6e7962616d62726f75676840676d61696c2e636f6d,0x7468652069726f6e696e6720697320746865207072696f7269747920686572652c20757365207468652069726f6e696e672077617465722070726f766964656420666f72207468652069726f6e2c206e6f74207461702077617465722e200d0a0d0a76616375756d206973206b65707420756e64657220746865207374616972730d0a0d0a65766572792076697369743a0d0a69726f6e696e67206b69746368656e20616e6420656e73756974652062617468726f6f6d20616e642077630d0a0d0a6576657279206f746865722076697369743a0d0a726f746174653a0d0a6d61696e20626564726f6d6f2c203220726563657074696f6e20726f6f6d7320617320616e64207768656e2074696d6520616c6c6f77730d0a0d0a6f63636173696f6e616c20726571756972656d656e74733a0d0a6d61696e2062617468726f6f6d20616e642067756573742061726561732e207574696c69747920726f6f6d0d0a0d0a444f206e6f7420646f3a0d0a0d0a47617261676520617265612e,0x,"bryonybambrough@gmail.com","0","0","1","","","","","3.00","07855066424","07855066424","","","","","T","2015-08-10","","","1","1","2015-08-27 13:29:39","2015-08-27 13:29:39");
INSERT INTO trianik_client VALUES("38322","","Moggridge","L","Virginia","Moggridge",0x4d616e6f72204661726d686f7573650d0a333020546865207374726565740d0a536e61696c77656c6c0d0a43423820374c580d0a,0x4d616e6f72204661726d686f7573650d0a333020546865207374726565740d0a536e61696c77656c6c0d0a43423820374c580d0a,0x766d6f6767726964676540676d61696c2e636f6d,0x70696e6b20686f757365206f70706f73697465207468652047656f72676520616e6420447261676f6e207075620d0a0d0a56616375756d20697320696e20746865207574696c69747920726f6f6d20757365206974206f6e206361727065742073657474696e67206f6e20616c6c20666c6f6f72730d0a0d0a547279206e6f7420746f206c6561766520616e797468696e67206f6e2074686520666c6f6f722028696e20706172746963756c61722076616375756d20746f6f6c73292061732074686520646f676769657320646f206c696b6520746f2063686577207468696e6773210d0a0d0a49726f6e696e67206f63636173696f6e616c6c7920726571756573746564202d20656e7375726520796f75206f6e6c79207573652064652d696f6e6973656420776174657220696e207468652069726f6e2e0d0a4265647320746f206265206368616e6765642065616368207765656b0d0a616c6c20546f77656c7320746f206265206368616e67656420616e64206c61756e64657265642065616368207765656b2028696e636c7564696e672074656120746f77656c7320616e642057432068616e6420746f77656c7329204c696e656e2063757062616f726420697320696e20746865206472657373696e6720726f6f6d0d0a0d0a322077617368696e67206d616368696e65732d204c656674206d616368696e6520666f72206c61756e6472792c205269676874206d616368696e6520666f7220646f676779207468696e67730d0a0d0a446f206e6f7420776f7272792061626f757420636c65616e696e672074686520646f6f727320756e74696c20746865792068617665206265656e2066696e69736865640d0a0d0a42696e20436f6c6c656374696f6e206973206f6e207765646e6573646179732c207468657265206973206120626c61636b2062696e20666f7220686f757365686f756c6420776173746520696e2074686520796172642e20477265656e2062696e20666f722067617264656e20776173746520616e6420426c75652062696e20666f722072656379636c61626c65730d0a0d0a56697267696e6961206973206c696b656c7920746f206c6561766520796f752061206c697374206f66207468696e677320746861742077696c6c2062652072657175697265642065616368207765656b2062757420617320612072756c653a0d0a0d0a4b69746368656e732026205574696c69747920726f6f6d202d2073757266616365732c2020637570626f6172642066726f6e74732073696e6b73206574632e2e2067656e6572616c20636c65616e207468726f7567686f75742e20656d70747920616e6420636c65616e2062696e7320696e7369646520616e64206f75742e200d0a444f204e4f5420434c45414e20544845204c41524745204d4952524f5220494e204b49544348454e0d0a76616320616e64206d6f7020666c6f6f7273202d206f6e6c79206c696768746c792064616d70206d6f70206f6e2074686520776f6f64656e20666c6f6f7273206166746572206d6f7070696e6720706f757220736f6d65206f66207468652042656e746f6e732050726f746563746f7220436f6174206f6e2074686520666c6f6f7220616e6420737072656164206f766572207468652072656420616e6420626c61636b2074696c656420666c6f6f727320756e74696c20697420697320636c6561722e200d0a0d0a426f6f7420526f6f6d2d20656e7375726520796f752070756c6c206f75742074686520626f6f74207261636b20616e6420636c65616e20616c6c2061726f756e64207468617420617265612e200d0a444f204e4f5420434c45414e205448452057494e444f5720554e54494c20495420484153204245454e2046554c4c5920524553544f5245440d0a0d0a576f726b6d616e73205743202d206672657368656e207570206368616e676520746f77656c0d0a0d0a53697474696e6720726f6f6d202d204743202d206475737420616e64207661632c20706c756d702063757368696f6e73206f6e2074686520736f666120616e642076616375756d207573696e6720746865207570686f6c737465727920746f6f6c20737570706c696564207768656e2072657175697265640d0a0d0a53686f77657220726f6f6d202d2073696e6b20616e6420746f696c6574206e65656420636c65616e696e672065766572797765656b2c206f6e6c7920646f207468652073686f77657220617320616e64207768656e206974206973207265717569726564206173206974206973206e6f742075736564206f6674656e2e200d0a0d0a4f6666696365206f6e6c79207768656e20726571756573746564202d20446f206e6f7420636c65616e2074686520636162696e6574730d0a0d0a5570737461697273202d20446f6f7220696e204b69746368656e206c6561647320796f752075707374616972730d0a4e65772062617468726f6f6d206e656564732074686f726f75676820636c65616e696e67206576657279207765656b202d2062617468206f6e6c79206f63636173696f6e616c6c79207265717569726564206173206e6f7420696e20636f6e7374616e74207573650d0a0d0a426564726f6f6d202d2047432c204475737420616e64205661632c2076616375756d2068656164626f6172642061732069742063616e206765742064757374792e200d0a0d0a53746f70206174207468652068616c6c20646f776e7374616972732c206e6f20636c65616e696e6720726571756972656420696e2074686520776f726b696e672061726561206f6e77617264732e200d0a0d0a0d0a0d0a,0x,"vmoggridge@gmail.com","0","0","0","","","","","3.00"," v07963515777","p07787111331","01638577995","B","N","Y","W","2015-08-27","any","","1","1","2015-08-27 13:44:28","2015-08-27 13:44:28");
INSERT INTO trianik_client VALUES("38323","","Hausler","L","Elke","Hausler",0x352042616c61746f6e20506c6163650d0a536e61696c77656c6c20526f61640d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820375950,0x352042616c61746f6e20506c6163650d0a536e61696c77656c6c20526f61640d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820375950,0x656c6b652e686175736c6572406d652e636f6d,0x56616375756d20697320696e2074686520637570626f61726420756e646572207374616972730d0a0d0a4a6f627320666f722065766572792076697369743a0d0a0d0a4b69746368656e2c2062617468726f6f6d7320616e6420616c6c20626564726f6f6d730d0a73747566792f74726561746d656e7420726f6f6d0d0a4c6976696e6720726f6f6d0d0a742e7620726f6f6d0d0a636f6277656273207468726f7567686f75740d0a7574696c69747920726f6f6d0d0a0d0a74686520746f7073206f6620746865207461626c657320696e2073697474696e6720726f6f6d20617265207665727920686561767920616e64206e6f7420617474616368656420746f20746865206261736520746f206265206361726566656c206e6f7420746f2062617368207468656d2e200d0a0d0a4a6f6273206f6e6c7920746f20626520646f6e65207768656e2061736b65643a0d0a0d0a54686520746865726561707920726f6f6d206f7574736964652077696c6c206265206e656564656420746f20626520636c65616e656420617320616e64207768656e20456c6b652061736b732e206d616b65207375726520796f7520636c65616e20616c6c20756e646572207468652062656420617320746861742069732077686572652074686520636c69656e747320617265206c6f6f6b696e6721,0x,"elke.hausler@me.com","4","3","0","N","","","","4.00","01638560467","07814089272","","B","N","Y","W","2015-08-24","mon","","1","1","2015-08-27 13:47:07","2015-08-27 13:47:07");
INSERT INTO trianik_client VALUES("38324","","Cawston","L","Ruth","Cawston",0x3137204c657920726f61640d0a737465746368776f7274680d0a6e65776d61726b65740d0a737566666f6c6b0d0a63623820397473,0x3137204c657920726f61640d0a737465746368776f7274680d0a6e65776d61726b65740d0a737566666f6c6b0d0a63623820397473,0x727574684063617773746f6e732e636f6d,0x76616375756d20697320696e2074686520646f776e73746169727320776320637570626f6172640d0a0d0a69726f6e696e67206e6f74207370656369666965640d0a0d0a7069637475726573206f6e207468652077616c6c7320617265206e6f742073656372756520736f20646f206e6f7420636c65616e207468656d0d0a0d0a4a4f425320464f5220455645525920464f52544e494748543a0d0a6b69746368656e0d0a64696e696e6720726f6f6d0d0a666c6f6f7273207468726f7567686f75740d0a73697474696e6720726f6f6d0d0a77630d0a68616c6c776179732f6c616e64696e670d0a0d0a4a4f4253204d4f4e54484c593a0d0a6f76656e0d0a76616320677565737420726f6f6d730d0a,0x,"ruth@cawstons.com","4","1","1","N","","","","3.00","01638508114","07775607565","","D","N","Y","W","2015-08-23","any","","1","1","2015-08-27 13:49:57","2015-08-27 13:49:57");
INSERT INTO trianik_client VALUES("38325","","Bibbey","L","Andrew & Val","Bibbey",0x3220427261646c657920526f61640d0a427572726f75676820477265656e0d0a434238394e47,0x3220427261646c657920526f61640d0a427572726f75676820477265656e0d0a434238394e47,0x616e647265772e62696262657940657665726573742e636f2e756b,0x627261646c657920726f616420697320746865206d61696e20726f6164207468726f75676820627572726f75676820477265656e20616e642074686520686f757365206973206f6e20746865206c6566742061742074686520656e64206f662074686520726f6164206265666f7265206c656176696e6720627572726f75676820677265656e290d0a0d0a666f72746e696768746c7920636c65616e696e67206f66203220686f7572730d0a0d0a76616375756d206973206c6f636174656420756e64657220746865207374616972730d0a69726f6e696e67206f63636173696f6e616c6c790d0a0d0a45564552592056495349540d0a0d0a636c65616e206b69746368656e20696e636c7564696e6720666c6f6f720d0a646f776e7374616972732077630d0a75707374616972732073686f77657220726f6f6d0d0a0d0a4f4e204120524f544154494e4720424153495320444f3a0d0a0d0a312e636c65616e20616e64207661632073697474696e6720726f6f6d20616e642064696e696e6720726f6f6d0d0a0d0a4f520d0a0d0a322e20636c65616e20616e64207661632068616c6c7761797320616e64206d617374657220626564726f6f6d0d0a0d0a4f520d0a0d0a332e20636c65616e206672696467650d0a0d0a4f520d0a0d0a342e203330206d696e757465732069726f6e696e670d0a,0x,"andrew.bibbey@everest.co.uk","4","2","0","","",""," Key will not be given as Andrew will be home to let you in.","0.00","01638508503","07940386902","","D","Y","Y","","0000-00-00","","","1","1","2015-08-27 13:53:46","2015-08-27 13:53:46");
INSERT INTO trianik_client VALUES("38326","","Lumby","L","Nathan","Lumby",0x3434204d496c6c2048696c6c0d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820304a42,0x,0x6e6a6c756d627940676d61696c2e636f6d,0x54656e616e74202d20456d696c7920426f7272656c6c2030373935313736343838330d0a0d0a5468697320697320612072656e74616c2070726f706572747920776865726520746865206c616e646c6f726420697320706179696e6720746f206b656570207468652070726f7065727479206d61696e7461696e65642e200d0a0d0a436c65616e696e67206f6620616c6c2074686520636f6d6d756e616c2061726561732069732072657175697265640d0a0d0a2249206861766520616772656564207769746820456d696c7920616e6420526f62207468617420492077696c6c2070617920666f72206120636c65616e657220626563617573652049206b6e6f772069742063616e20626520646966666963756c74206d616e6167696e672074686573652064757469657320696e20612073686172656420686f75736520657370656369616c6c79207768656e2065766572796f6e6520697320776f726b696e67206c6f6e6720686f7572732e202049207374696c6c20657870656374207468656d20626f746820746f206b6565702074686520686f75736520696e20676f6f64206f7264657220616e64206e6f7420746f206c657420697420676574206f7574206f662068616e642e20492077696c6c2074616c6b20746f20526f6220616e6420456d696c7920746f206d616b65207468697320636c65617220627574204920646f20657870656374207468656d20746f206d616b6520737572652074686520686f757365206974207469647920616e6420696e206120726561736f6e61626c6520737461746520736f2074686520636c65616e65722063616e20636f6d6520696e20616e6420646f207468656972206a6f622070726f7065726c792e204920646f206e6f742077616e7420746f20626520706179696e67206120636c65616e657220746f2074696479207570206166746572207468656d2e204920657870656374207468656d20746f206d616b652073757265207468652077617368696e6720757020697320646f6e652e204920616c736f20657870656374207468656d20746f206b656570206f6e20746f70206f6620746865207275626269736820616e642072656379636c696e672e20546f20656d7074792062696e7320616e642072656379636c6520656d7074792073686f7765722067656c20636f6e7461696e65727320657463206574632e0d0a0d0a526f6220616e6420456d696c79206172652061637475616c6c7920776f6e64657266756c2074656e616e7473206275742070726576696f757320657870657269656e6365732068617665206e6f74206265656e2067726561742e0d0a0d0a506c6561736520636f756c6420492061736b20746861742069662074686520686f7573652069732065766572206c65667420696e20612073746174652077686572652074686520636c65616e65722063616e6e6f7420717569636b6c7920676574206f6e207468656e2063616e20796f7520696e666f726d206d6520736f20492063616e206861766520612067656e746c6520776f72642077697468206d792074656e616e747320746f206d616b65206d6f7265206f6620616e206566666f72742e22,0x,"njlumby@gmail.com","2","1","1","","","","","2.00","NL 07891064763","EB07951764883","","B","N","Y","T","2015-08-28","","","1","1","2015-08-27 13:56:24","2015-08-27 13:56:24");
INSERT INTO trianik_client VALUES("38327","","Barnes Thomson","L","Barnes","Thomson",0x4261726e65732054686f6d736f6e0d0a4b696e6773746f6e2056696c6c610d0a53756e206c616e650d0a4e65776d61726b65740d0a434238203845570d0a0d0a0d0a546865206f66666963657320617265206c6f63617465642061626f76652047796d6f70686f6265732c20656e74657220696e20616e6420676f20757020746865206c69667420746f2074686520746f7020666c6f6f722e20746865726520617265207468726f756768742074686520646f6f72206f6e20746865206c6566742e20,0x4261726e65732054686f6d736f6e0d0a4b696e6773746f6e2056696c6c610d0a53756e206c616e650d0a4e65776d61726b65740d0a43423820384557,0x,0x6865206f66666963657320617265206c6f63617465642061626f76652047796d6f70686f6265732c20656e74657220696e20616e6420676f20757020746865206c69667420746f2074686520746f7020666c6f6f722e20746865726520617265207468726f756768742074686520646f6f72206f6e20746865206c6566742e200d0a0d0a76616375756d20697320696e20746865206375706f62616f7264206f6620746865206d61696e206163636f756e74206f66666963652028757020746865206c6974746c6520737461697273290d0a0d0a45564552592056495349543a0d0a42617468726f6f6d20636c65616e0d0a706f6c697368206465736b730d0a6b69746368656e20636c65616e0d0a4d61696e206163636f756e74206f66666963650d0a77617465722074686520706c616e74730d0a6475737420616e6420766163207468726f7567686f757420696e636c7564696e672073746169727320616e642068616c6c776179730d0a656d707479207468652062696e7320286c617267652062696e2061726561206f75747369646520636f6666656520616e6420636f290d0a0d0a,0x444f204e4f5420544f55434820434f4d50555445522053435245454e5320414e44204b4559424f41524453,"accounts@barnesthompson.com","0","0","0","","","","2 keys will be given, 1 main door and 1 for the office door.","1.00","01638561296","","","","","","W","2015-08-27","thurs or fri","","1","1","2015-08-27 14:01:28","2015-08-27 14:01:28");
INSERT INTO trianik_client VALUES("38328","","Sime","L","Andrew","Sime",0x353120576f6f64697474696f6e20526f61640d0a4e65776d61726b65740d0a537566666f6c6b0d0a43423820394251,0x,0x,0x4b657920676976656e206f6e20666972737420766973740d0a0d0a332e3520686f7572730d0a0d0a34207765656b73206f6e6c79202d20636f76657220636c65616e0d0a0d0a47656e6572616c20636c65616e696e670d0a0d0a49726f6e696e6720616e64206368616e676520626564,0x,"andrew.sime@virgin.net","0","0","0","","","","","3.00","07770337373 ","01638 663514","","","","","O","2015-09-29","tues","","1","1","2015-08-27 14:09:08","2015-08-27 14:09:08");
INSERT INTO trianik_client VALUES("38329","","Ashburner","L","Fancesca","Ashburner",0x323620434f6d6d65726369616c20456e640d0a537761666668616d2042756c6265636b0d0a4342323520304e45,0x323620434f6d6d65726369616c20456e640d0a537761666668616d2042756c6265636b0d0a4342323520304e45,0x662e6173686275726e6572406d652e636f6d,0x76616375756d20697320696e207468652073746f7261676520637570626f617264206279207468652066726f6e7420646f6f720d0a0d0a45564552592056495349543a0d0a0d0a76616375756d207468726f7567686f75740d0a636c65616e20626f74682062617468726f6f6d7320616e64206b69746368656e20616e642057430d0a636f6e7365727661746f727920666c6f6f7220616e642072756e207468652076616375756d206f76657220746865206c656467657320696e2074686520636f6e7365727661746f727920746f2067657420726964206f662074686520666c696573206574632e200d0a0d0a626564206368616e67696e672077696c6c2062652072657175697265640d0a0d0a6f6e6c7920646f2074686520737061726520726f6f6d73207768656e207265717565737465642e20,0x,"f.ashburner@me.com","3","2","0","N","","","","2.00","01223812451","07720896148","","B","N","Y","W","2015-08-31","any ","","1","1","2015-08-27 14:13:01","2015-08-27 14:13:01");
INSERT INTO trianik_client VALUES("38330","","Jeavons","L","Craig & Laura ","Jeavons",0x3131204e657720526976657220477265656e0d0a45786e696e670d0a434238203748530d0a,0x3131204e657720526976657220477265656e0d0a45786e696e670d0a434238203748530d0a,0x63726169672e6a6561766f6e7340676d61696c2e636f6d,0x766572792076697369743a0d0a73697474696e6720726f6f6d202d2064757374696e67202d206c65617468657220706f6c69736820736f66610d0a656e7472616e63652068616c6c202d2064757374696e6720616e64206d6972726f72730d0a7763202d2067656e6572616c20636c65616e0d0a64696e696e6720726f6f6d202d2064757374696e670d0a6b69746368656e202d20626c696e64732c20737465616d20636c65616e20666c6f6f722c20637570626f6172642066726f6e747320616e642073757266616365730d0a62617468726f6f6d202d2067656e6572616c20636c65616e0d0a6d617374657220626564726f6f6d202d2064757374696e67202d20626c696e64730d0a626f797320726f6f6d202d2064757374696e672c206265647320616e642077696e646f77730d0a677565737420726f6f6d202d2064757374696e67616e642077696e646f77730d0a0d0a646f206e6f7420646f3a0d0a706c6179726f6f6d0d0a6e6f2076616375756d696e672072657175697265640d0a0d0a737465616d20636c65616e2074686520666c6f6f7273207570737461697273206d6f6e74686c79,0x,"craig.jeavons@gmail.com","0","0","0","N","","","","2.00","01638577904","07463233321","","D","N","Y","T","2015-09-14","","","1","1","2015-08-27 14:15:30","2015-08-27 14:15:30");
INSERT INTO trianik_client VALUES("38331","","Chalmers","L","Terry & Pat","Chalmers",0x3730204e6f727468205374726565740d0a42757277656c6c0d0a43616d62726964676573686972650d0a4342323520304242,0x3730204e6f727468205374726565740d0a42757277656c6c0d0a43616d62726964676573686972650d0a4342323520304242,0x6d61696c4074657272796368616c6d6572732e636f2e756b,0x6b657920686173206265656e20676976656e2062757420746865792061726520757375616c6c792074686572650d0a6e6f20616c61726d20636f64650d0a0d0a7061742077696c6c206e6f726d616c6c792074656c6c20796f75207768617420697320726571756972656420656163682076697369740d0a0d0a757375616c6c793a0d0a0d0a6b69746368656e2c2067632c20696e636c7564696e67206120717569636b20636c65616e206f6620636f6e7365727661746f72790d0a0d0a6c6976696e6720726f6f6d2c2067632c20706f6c697368696e672076616375756d696e672c20656d7074792062696e2c206c6f6f6b20756e64657220746865206675726e697475726520666f722063617420746f797320617377656c6c2e0d0a62617468726f6f6d2c2064657363616c652c20656d7074792062696e2c2067632e0d0a64696e696e6720726f6f6d2c206475737420616e64207661630d0a646f776e73746169727320626564726f6f6d2c206475737420616e64207661632c0d0a7574696c69747920726f6f6d2c207769706520646f776e20737572666163657320616e642076616375756d0d0a686f6f766572206f666669636520666c6f6f72206f6e6c790d0a6f63636173696f6e616c6c792075707374616972732062617468726f6f6d20696620796f7520686176652074696d652e200d0a0d0a446972656374696f6e733a0d0a5475726e206c65667420696e746f20546f797365204c616e650d0a5475726e20726967687420696e746f2073696c766572207374726565740d0a417420656e64206f6620726f6164207475726e206c6566742e0d0a486f757365206973206120636f75706c65206f6620686f75736573207570206f6e206c6566742e0d0a49742068617320647269766520616e642067617261676520616e6420627269636b2077616c6c206569746865722073696465206f6620656e7472616e6365,0x,"mail@terrychalmers.co.uk","0","0","1","N","","","","0.00","01638742006","07798643136","","B","N","Y","T","2015-08-26","","","1","1","2015-08-27 14:18:43","2015-08-27 14:18:43");
INSERT INTO trianik_client VALUES("38332","","Dickenson","L","Sue","Dickenson",0x54686520736d6f636b20746f776572204d696c6c0d0a4d696c6c2048696c6c0d0a537761666668616d205072696f720d0a4342323520304a5a,0x54686520736d6f636b20746f776572204d696c6c0d0a4d696c6c2048696c6c0d0a537761666668616d205072696f720d0a4342323520304a5a,0x7375652e6469636b696e736f6e40676d61696c2e636f6d,0x6974206973206f6e20746865206c65667420617320796f7520656e74657220737761666668616d2066726f6d2062757277656c6c2c2074686572652069732061206c6974746c6520747261636b206f6e20746865206c6566742068616e642073696465206265666f7265206e756d626572203332206d696c6c2068696c6c0d0a0d0a65766572792076697369743a0d0a0d0a6c6f756e67652c206b69746368656e2c20656e7472616e636520202d2064757374696e6720616e6420666c6f6f72732061207072696f726974790d0a0d0a616c7465726e6174652065616368207765656b3a0d0a0d0a626564726f6f6d732026207574696c6974790d0a42617468726f6f6d730d0a0d0a74686520686f6220696e20746865206b69746368656e206f6e6c79206e6565647320612067656e746c6520776970652c206265206361726566756c206e6f7420746f207363726174682074686520686f622e20697420676574732070726f66657373696f6e616c6c7920646f6e6520726567756c61726c7920736f20697420646f65736e2774206e65656420696e74656e7369766520636c65616e696e672e0d0a0d0a484f54205741544552202d20697420697320616e2045636f2073797374656d20736f2069742074616b65732061206c6f6e672074696d6520746f2067657420686f742077617465722c20746f2066696c6c2075702061206275636b65742075736520746865207461707320696e20746865207574696c69747920726f6f6d206173207468697320697320776865726520697420636f6d6573206f757420686f747465737420666972737420616e64206d756368206d75636820717569636b657221,0x,"sue.dickinson@gmail.com","2","1","0","","","","the key will be left under gilbert the gorilla, this key is ","2.00","01638743537"," 07904931366","","B","N","Y","W","2015-09-08","","","1","1","2015-08-27 14:22:27","2015-08-27 14:22:27");
INSERT INTO trianik_client VALUES("38333","","Toynbee","L","Chris","Toynbee",0x313620436172646967616e205374726565740d0a4e65776d61726b65740d0a537566666f6c6b0d0a4342382038485a,0x313620436172646967616e205374726565740d0a4e65776d61726b65740d0a537566666f6c6b0d0a4342382038485a,0x6368726973746f796e626565406d652e636f6d,0x,0x,"christoynbee@me.com","0","0","0","","","","","2.00","07738614641","","","B","N","Y","W","2015-08-28","","","1","1","2015-08-27 15:28:51","2015-08-27 15:28:51");
INSERT INTO trianik_client VALUES("38334","","1. Client meeting","L","TBC","TBC",0x544243,0x544243,0x,0x,0x,"TBC","0","0","0","","","","","0.00","TBC","","","","","","","0000-00-00","","","1","1","2015-08-27 15:35:31","2015-08-27 15:35:31");
INSERT INTO trianik_client VALUES("38336","","00098888","L","DDD","dd",0x,0x,0x,0x,0x,"dave@aperfectpocket.co.uk","0","0","0","","","23433","","0.00","447730619195","","","","","","","0000-00-00","","","1","1","2016-01-11 14:59:01","2016-03-21 12:21:08");
INSERT INTO trianik_client VALUES("38343","","Biggs 2","L","Kevin","Hilton",0x,0x,0x,0x,0x,"kevin.hilton@prodigyworks.co.uk","0","0","0","","","","","0.00","447730619195","","","","","","","0000-00-00","","","1","1","2016-01-11 15:09:08","2016-01-11 15:09:08");



DROP TABLE trianik_clientdocs;

CREATE TABLE `trianik_clientdocs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clientid` int(11) DEFAULT NULL,
  `documentid` int(11) DEFAULT NULL,
  `createddate` datetime NOT NULL,
  `metacreateddate` datetime NOT NULL,
  `metacreateduserid` int(11) NOT NULL,
  `metamodifieddate` datetime NOT NULL,
  `metamodifieduserid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=latin1 ROW_FORMAT=FIXED;




DROP TABLE trianik_clientschedule;

CREATE TABLE `trianik_clientschedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `weekday` int(11) DEFAULT NULL,
  `begindate` date DEFAULT NULL,
  `canceldate` date DEFAULT NULL,
  `starttime` varchar(5) DEFAULT NULL,
  `endtime` varchar(5) DEFAULT NULL,
  `mode` varchar(1) DEFAULT NULL,
  `metacreateduserid` int(11) DEFAULT NULL,
  `metamodifieduserid` int(11) DEFAULT NULL,
  `metacreateddate` datetime DEFAULT NULL,
  `metamodifieddate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `memberid` (`memberid`)
) ENGINE=InnoDB AUTO_INCREMENT=38383 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

INSERT INTO trianik_clientschedule VALUES("38241","37288","240","1","2015-08-03","","08:25","11:25","T","1","1","2015-07-20 18:45:41","2015-08-04 19:01:01");
INSERT INTO trianik_clientschedule VALUES("38242","37288","240","3","","","08:00","10:00","W","1","1","2015-07-20 18:50:30","2015-07-20 19:37:27");
INSERT INTO trianik_clientschedule VALUES("38243","37288","240","5","","","13:30","17:30","W","1","1","2015-07-20 19:24:53","2015-07-20 19:37:31");
INSERT INTO trianik_clientschedule VALUES("38244","38239","238","2","","","09:00","11:00","W","1","1","2015-07-20 19:25:56","2015-07-20 19:29:11");
INSERT INTO trianik_clientschedule VALUES("38245","38239","1","3","","","09:00","11:00","W","1","1","2015-07-20 19:32:00","2015-07-20 19:32:00");
INSERT INTO trianik_clientschedule VALUES("38246","38239","238","4","","","09:00","11:00","W","1","1","2015-07-20 19:32:16","2015-07-20 19:32:16");
INSERT INTO trianik_clientschedule VALUES("38247","38239","1","5","2015-04-07","","09:00","11:00","W","1","1","2015-07-20 19:32:44","2015-08-04 22:02:55");
INSERT INTO trianik_clientschedule VALUES("38248","38239","238","3","","","09:00","11:00","W","1","1","2015-07-20 19:32:53","2015-07-20 19:32:53");
INSERT INTO trianik_clientschedule VALUES("38249","38240","241","2","","","08:00","12:30","W","1","1","2015-07-20 19:37:59","2015-07-20 19:37:59");
INSERT INTO trianik_clientschedule VALUES("38250","38240","241","3","","","08:00","12:30","W","1","1","2015-07-20 19:38:26","2015-07-20 19:38:26");
INSERT INTO trianik_clientschedule VALUES("38251","38243","1","1","","","08:00","09:30","W","1","1","2015-07-24 22:25:20","2015-08-03 20:45:43");
INSERT INTO trianik_clientschedule VALUES("38252","38243","239","2","","","08:00","12:30","W","1","1","2015-07-24 22:25:36","2015-07-24 22:25:36");
INSERT INTO trianik_clientschedule VALUES("38253","38243","239","3","","","08:00","12:30","W","1","1","2015-07-24 22:25:55","2015-07-24 22:25:55");
INSERT INTO trianik_clientschedule VALUES("38254","38242","240","1","","","15:30","17:40","W","1","1","2015-08-03 20:30:38","2015-08-03 20:30:38");
INSERT INTO trianik_clientschedule VALUES("38255","38241","240","1","","","12:30","14:00","W","1","1","2015-08-03 20:31:30","2015-08-03 20:31:30");
INSERT INTO trianik_clientschedule VALUES("38257","38244","1","1","","","13:45","15:35","W","1","1","2015-08-03 20:46:21","2015-08-03 20:46:21");
INSERT INTO trianik_clientschedule VALUES("38258","37288","239","1","2015-08-03","","11:50","17:50","T","1","1","2015-08-03 20:52:14","2015-08-04 19:00:54");
INSERT INTO trianik_clientschedule VALUES("38259","38243","1","4","2015-07-16","","08:45","12:45","F","1","1","2015-08-04 18:46:21","2015-08-04 19:00:00");
INSERT INTO trianik_clientschedule VALUES("38260","38240","241","5","2015-08-21","","17:20","21:50","O","1","1","2015-08-21 15:09:20","2015-08-21 15:26:27");
INSERT INTO trianik_clientschedule VALUES("38261","38245","248","1","2015-08-24","","08.30","12.30","W","1","1","2015-08-27 08:15:44","2015-08-27 08:15:44");
INSERT INTO trianik_clientschedule VALUES("38262","38246","248","1","2015-08-24","","13:30","15:30","W","1","1","2015-08-27 08:23:31","2015-08-27 14:31:03");
INSERT INTO trianik_clientschedule VALUES("38263","38247","248","1","2015-08-24","","18.00","19.00","W","1","1","2015-08-27 08:28:14","2015-08-27 08:28:14");
INSERT INTO trianik_clientschedule VALUES("38266","38247","248","4","2015-08-24","","18.00","19.00","W","1","1","2015-08-27 08:29:29","2015-08-27 08:29:29");
INSERT INTO trianik_clientschedule VALUES("38267","38247","248","5","2015-08-24","","18.30","19.30","W","1","1","2015-08-27 08:29:50","2015-08-27 08:29:50");
INSERT INTO trianik_clientschedule VALUES("38268","38248","248","1","2015-08-24","","19.00","22.30","W","1","1","2015-08-27 08:35:51","2015-08-27 08:35:51");
INSERT INTO trianik_clientschedule VALUES("38269","38248","248","2","2015-08-24","","16.30","20.00","W","1","1","2015-08-27 08:36:30","2015-08-27 08:36:30");
INSERT INTO trianik_clientschedule VALUES("38270","38248","248","3","2015-08-24","","19.00","22.00","W","1","1","2015-08-27 08:36:56","2015-08-27 08:36:56");
INSERT INTO trianik_clientschedule VALUES("38271","38248","248","4","2015-08-24","","19.00","22.00","W","1","1","2015-08-27 08:37:14","2015-08-27 08:37:14");
INSERT INTO trianik_clientschedule VALUES("38272","38248","248","5","2015-08-24","","15:30","18:30","W","1","1","2015-08-27 08:37:43","2015-08-27 08:57:35");
INSERT INTO trianik_clientschedule VALUES("38273","38249","248","2","2015-08-24","","12.00","14.00","W","1","1","2015-08-27 08:42:23","2015-08-27 08:42:23");
INSERT INTO trianik_clientschedule VALUES("38274","38250","248","2","2015-09-15","","14.30","16.30","T","1","1","2015-08-27 08:47:43","2015-08-27 08:47:43");
INSERT INTO trianik_clientschedule VALUES("38276","38251","248","2","2015-09-08","","14.30","17.00","T","1","1","2015-08-27 08:53:37","2015-08-27 08:53:37");
INSERT INTO trianik_clientschedule VALUES("38277","38252","251","1","2015-08-24","","09.30","12.30","W","1","1","2015-08-27 09:02:36","2015-08-27 09:02:36");
INSERT INTO trianik_clientschedule VALUES("38278","38252","251","3","2015-08-26","","10:30","14:30","W","1","1","2015-08-27 09:03:35","2015-08-27 09:03:35");
INSERT INTO trianik_clientschedule VALUES("38279","38252","251","5","2015-08-28","","09:00","13:00","W","1","1","2015-08-27 09:04:00","2015-08-27 09:04:00");
INSERT INTO trianik_clientschedule VALUES("38280","38253","251","1","2015-08-24","","12:30","14:30","W","1","1","2015-08-27 09:08:38","2015-08-27 09:08:38");
INSERT INTO trianik_clientschedule VALUES("38281","38253","251","4","2015-08-27","","11:30","13:30","W","1","1","2015-08-27 09:09:00","2015-08-27 09:09:00");
INSERT INTO trianik_clientschedule VALUES("38282","38255","251","3","2015-09-02","","09:00","10:30","T","1","1","2015-08-27 09:14:23","2015-08-27 09:14:23");
INSERT INTO trianik_clientschedule VALUES("38283","38256","250","1","2015-08-24","","09:30","12.00","W","1","1","2015-08-27 09:21:38","2015-08-27 09:21:38");
INSERT INTO trianik_clientschedule VALUES("38284","38257","257","1","2015-08-24","","09:00","11:00","W","1","1","2015-08-27 09:25:57","2015-08-27 09:25:57");
INSERT INTO trianik_clientschedule VALUES("38285","38258","250","2","2015-09-01","","09:00","11:00","T","1","1","2015-08-27 09:32:38","2015-08-27 09:32:38");
INSERT INTO trianik_clientschedule VALUES("38286","38259","250","2","2015-08-25","","09:00","11:00","W","1","1","2015-08-27 09:35:48","2015-08-27 09:35:48");
INSERT INTO trianik_clientschedule VALUES("38287","38260","250","3","2015-08-26","","09:00","11:00","W","1","1","2015-08-27 09:38:37","2015-08-27 09:38:37");
INSERT INTO trianik_clientschedule VALUES("38289","38262","250","4","2015-09-03","","09:00","12:00","T","1","1","2015-08-27 09:43:37","2015-08-27 09:43:37");
INSERT INTO trianik_clientschedule VALUES("38290","38263","250","4","2015-08-27","","12:30","14:30","W","1","1","2015-08-27 09:46:08","2015-08-27 09:46:08");
INSERT INTO trianik_clientschedule VALUES("38291","38264","250","5","2015-08-28","","11:30","15:30","W","1","1","2015-08-27 09:48:25","2015-08-27 09:48:25");
INSERT INTO trianik_clientschedule VALUES("38292","38265","249","1","2015-08-24","","09:00","11:00","W","1","1","2015-08-27 09:51:44","2015-08-27 09:52:52");
INSERT INTO trianik_clientschedule VALUES("38293","38265","249","2","2015-08-25","","09:00","11:00","W","1","1","2015-08-27 09:52:02","2015-08-27 09:52:02");
INSERT INTO trianik_clientschedule VALUES("38294","38265","249","3","2015-08-26","","09:00","11:00","W","1","1","2015-08-27 09:52:19","2015-08-27 09:52:19");
INSERT INTO trianik_clientschedule VALUES("38295","38265","249","4","2015-08-27","","09:00","11:00","W","1","1","2015-08-27 09:52:39","2015-08-27 09:52:39");
INSERT INTO trianik_clientschedule VALUES("38296","38265","249","5","2015-08-28","","09:00","11:00","W","1","1","2015-08-27 09:53:08","2015-08-27 09:53:08");
INSERT INTO trianik_clientschedule VALUES("38297","38266","249","1","2015-08-24","","11:30","13:30","W","1","1","2015-08-27 09:56:04","2015-08-27 09:56:04");
INSERT INTO trianik_clientschedule VALUES("38298","38267","255","5","2015-08-28","","11:30","13:30","W","1","1","2015-08-27 09:59:02","2015-08-27 09:59:02");
INSERT INTO trianik_clientschedule VALUES("38299","38268","249","1","2015-08-31","","15:00","16:00","T","1","1","2015-08-27 10:01:50","2015-08-27 10:01:50");
INSERT INTO trianik_clientschedule VALUES("38300","38269","249","2","2015-08-25","","11:30","14:30","W","1","1","2015-08-27 10:05:01","2015-08-27 10:05:01");
INSERT INTO trianik_clientschedule VALUES("38301","38270","249","3","2015-09-09","","11:30","13:30","T","1","1","2015-08-27 10:08:02","2015-08-27 10:08:02");
INSERT INTO trianik_clientschedule VALUES("38302","38271","249","3","2015-08-26","","14:00","16:00","T","1","1","2015-08-27 10:12:20","2015-08-27 10:12:20");
INSERT INTO trianik_clientschedule VALUES("38303","38272","249","4","2015-09-03","","11:30","13:30","T","1","1","2015-08-27 10:15:34","2015-08-27 10:15:34");
INSERT INTO trianik_clientschedule VALUES("38304","38273","250","2","2015-08-25","","09:00","12:00","T","1","1","2015-08-27 10:18:15","2015-08-27 10:18:15");
INSERT INTO trianik_clientschedule VALUES("38305","38274","250","4","2015-08-27","","09:00","12:00","T","1","1","2015-08-27 10:20:57","2015-08-27 10:20:57");
INSERT INTO trianik_clientschedule VALUES("38306","38275","249","4","2015-08-27","","13:00","15:00","W","1","1","2015-08-27 10:23:26","2015-08-27 10:23:47");
INSERT INTO trianik_clientschedule VALUES("38307","38276","249","5","2015-08-28","","11:30","15:30","W","1","1","2015-08-27 10:28:11","2015-08-27 10:28:11");
INSERT INTO trianik_clientschedule VALUES("38308","38277","252","2","2015-08-25","","09:30","11:30","W","1","1","2015-08-27 10:32:08","2015-08-27 10:32:08");
INSERT INTO trianik_clientschedule VALUES("38309","38277","252","4","2015-08-27","","09:30","11:30","W","1","1","2015-08-27 10:32:28","2015-08-27 10:32:28");
INSERT INTO trianik_clientschedule VALUES("38310","38278","252","2","2015-08-25","","12:00","14:00","W","1","1","2015-08-27 10:35:30","2015-08-27 10:35:30");
INSERT INTO trianik_clientschedule VALUES("38311","38278","252","5","2015-08-28","","09:30","11:30","W","1","1","2015-08-27 10:35:55","2015-08-27 10:35:55");
INSERT INTO trianik_clientschedule VALUES("38312","38279","252","2","2015-08-25","","14:30","16:30","W","1","1","2015-08-27 10:39:30","2015-08-27 10:39:30");
INSERT INTO trianik_clientschedule VALUES("38313","38280","252","4","2015-08-27","","12:00","16:00","W","1","1","2015-08-27 10:42:40","2015-08-27 10:42:40");
INSERT INTO trianik_clientschedule VALUES("38314","38281","252","5","2015-09-04","","12:00","14:00","T","1","1","2015-08-27 10:45:47","2015-08-27 10:47:16");
INSERT INTO trianik_clientschedule VALUES("38315","38282","252","5","2015-08-28","","14:00","16:00","W","1","1","2015-08-27 10:49:34","2015-08-27 10:49:34");
INSERT INTO trianik_clientschedule VALUES("38316","38283","251","4","2015-08-27","","09:00","11:00","W","1","1","2015-08-27 11:22:34","2015-08-27 11:22:34");
INSERT INTO trianik_clientschedule VALUES("38317","38284","253","2","2015-08-25","","09:30","14:30","W","1","1","2015-08-27 11:28:00","2015-08-27 11:28:00");
INSERT INTO trianik_clientschedule VALUES("38318","38284","253","4","2015-08-27","","11:30","13:30","W","1","1","2015-08-27 11:28:20","2015-08-27 11:28:20");
INSERT INTO trianik_clientschedule VALUES("38319","38285","253","3","2015-08-26","","12:30","14:30","W","1","1","2015-08-27 11:30:49","2015-08-27 11:30:49");
INSERT INTO trianik_clientschedule VALUES("38320","38286","253","4","2015-08-27","","09:30","12:30","W","1","1","2015-08-27 11:33:03","2015-08-27 11:33:03");
INSERT INTO trianik_clientschedule VALUES("38321","38287","253","5","2015-09-04","","09:30","13:00","T","1","1","2015-08-27 11:36:39","2015-08-27 11:36:39");
INSERT INTO trianik_clientschedule VALUES("38322","38288","253","5","2015-08-28","","09:30","13:30","T","1","1","2015-08-27 11:38:43","2015-08-27 11:38:43");
INSERT INTO trianik_clientschedule VALUES("38323","38289","256","1","2015-08-24","","09:00","12:00","W","1","1","2015-08-27 11:41:16","2015-08-27 11:41:16");
INSERT INTO trianik_clientschedule VALUES("38324","38289","256","4","2015-08-27","","09:00","12:00","W","1","1","2015-08-27 11:41:33","2015-08-27 11:41:33");
INSERT INTO trianik_clientschedule VALUES("38325","38290","256","1","2015-08-24","","12:30","15:30","W","1","1","2015-08-27 11:44:07","2015-08-27 11:44:07");
INSERT INTO trianik_clientschedule VALUES("38326","38291","248","2","2015-08-25","","09:00","11:00","W","1","1","2015-08-27 11:46:55","2015-09-01 19:19:29");
INSERT INTO trianik_clientschedule VALUES("38327","38292","256","2","2015-08-25","","12:30","16:30","W","1","1","2015-08-27 11:50:09","2015-08-27 11:50:09");
INSERT INTO trianik_clientschedule VALUES("38328","38293","256","3","2015-08-26","","12:30","15:30","W","1","1","2015-08-27 11:52:47","2015-08-27 11:52:47");
INSERT INTO trianik_clientschedule VALUES("38329","38294","256","4","2015-08-27","","12:30","16:30","W","1","1","2015-08-27 11:55:59","2015-08-27 11:55:59");
INSERT INTO trianik_clientschedule VALUES("38330","38295","256","5","2015-08-28","","09:00","11:00","W","1","1","2015-08-27 11:59:14","2015-08-27 11:59:14");
INSERT INTO trianik_clientschedule VALUES("38331","38296","256","5","2015-08-28","","11:30","13:30","W","1","1","2015-08-27 12:01:57","2015-08-27 12:01:57");
INSERT INTO trianik_clientschedule VALUES("38332","38297","254","2","2015-08-25","","12:30","14:30","W","1","1","2015-08-27 12:05:37","2015-08-27 12:05:37");
INSERT INTO trianik_clientschedule VALUES("38333","38298","254","1","2015-08-24","","12:30","15:30","W","1","1","2015-08-27 12:09:03","2015-08-27 12:09:03");
INSERT INTO trianik_clientschedule VALUES("38334","38299","254","4","2015-09-03","","12:30","14:30","T","1","1","2015-08-27 12:12:45","2015-08-27 12:12:45");
INSERT INTO trianik_clientschedule VALUES("38335","38300","254","5","2015-08-28","","12:30","14:30","W","1","1","2015-08-27 12:15:08","2015-08-27 12:15:08");
INSERT INTO trianik_clientschedule VALUES("38336","38301","255","1","2015-08-24","","13:30","15:30","W","1","1","2015-08-27 12:17:00","2015-08-27 12:17:00");
INSERT INTO trianik_clientschedule VALUES("38337","38302","255","1","2015-08-31","","15:30","17:30","T","1","1","2015-08-27 12:19:23","2015-08-27 12:19:23");
INSERT INTO trianik_clientschedule VALUES("38338","38303","255","2","2015-08-25","","09:00","11:00","W","1","1","2015-08-27 12:21:55","2015-08-27 12:21:55");
INSERT INTO trianik_clientschedule VALUES("38339","38303","255","4","2015-08-27","","15:00","17:00","W","1","1","2015-08-27 12:22:17","2015-08-27 12:22:17");
INSERT INTO trianik_clientschedule VALUES("38340","38304","255","3","2015-08-26","","09:00","11:30","W","1","1","2015-08-27 12:25:05","2015-08-27 12:25:05");
INSERT INTO trianik_clientschedule VALUES("38341","38305","255","3","2015-08-26","","12:30","14:30","W","1","1","2015-08-27 12:29:01","2015-08-27 12:29:01");
INSERT INTO trianik_clientschedule VALUES("38342","38306","255","3","2015-08-26","","14:30","16:30","W","1","1","2015-08-27 12:35:28","2015-08-27 12:35:28");
INSERT INTO trianik_clientschedule VALUES("38343","38307","255","5","2015-08-28","","09:00","11:00","W","1","1","2015-08-27 12:39:03","2015-08-27 12:39:03");
INSERT INTO trianik_clientschedule VALUES("38344","38308","255","5","2015-08-28","","14:00","16:00","W","1","1","2015-08-27 12:42:16","2015-08-27 12:42:16");
INSERT INTO trianik_clientschedule VALUES("38345","38309","258","1","2015-08-31","","09:00","10:30","W","1","1","2015-08-27 12:44:53","2015-08-27 12:44:53");
INSERT INTO trianik_clientschedule VALUES("38346","38309","258","5","2015-08-28","","11:30","13:00","W","1","1","2015-08-27 12:45:19","2015-08-27 12:45:19");
INSERT INTO trianik_clientschedule VALUES("38347","38310","258","1","2015-08-31","","11:30","14:30","W","1","1","2015-08-27 12:47:46","2015-08-27 12:47:46");
INSERT INTO trianik_clientschedule VALUES("38348","38311","257","1","2015-08-31","","15:30","17:30","W","1","1","2015-08-27 12:50:46","2015-08-27 12:50:46");
INSERT INTO trianik_clientschedule VALUES("38349","38312","257","5","2015-09-04","","09:00","13:00","T","1","1","2015-08-27 12:59:39","2015-08-27 13:02:28");
INSERT INTO trianik_clientschedule VALUES("38350","38313","255","5","2015-09-04","","16:00","18:00","T","1","1","2015-08-27 13:02:07","2015-08-27 13:02:07");
INSERT INTO trianik_clientschedule VALUES("38351","38314","257","5","2015-08-28","","12:30","15:30","W","1","1","2015-08-27 13:04:52","2015-08-27 13:04:52");
INSERT INTO trianik_clientschedule VALUES("38352","38315","255","4","2015-08-27","","09:00","11:00","W","1","1","2015-08-27 13:07:09","2015-08-27 13:07:09");
INSERT INTO trianik_clientschedule VALUES("38353","38316","258","2","2015-08-25","","09:00","11:00","W","1","1","2015-08-27 13:10:37","2015-08-27 13:10:37");
INSERT INTO trianik_clientschedule VALUES("38354","38316","258","5","2015-08-28","","09:00","11:00","W","1","1","2015-08-27 13:10:57","2015-08-27 13:10:57");
INSERT INTO trianik_clientschedule VALUES("38355","38317","258","2","2015-08-25","","11:30","13:30","W","1","1","2015-08-27 13:13:49","2015-08-27 13:13:49");
INSERT INTO trianik_clientschedule VALUES("38356","38318","258","3","2015-08-26","","11:30","14:30","W","1","1","2015-08-27 13:16:04","2015-08-27 13:16:04");
INSERT INTO trianik_clientschedule VALUES("38357","38319","258","4","2015-08-27","","09:00","13:00","W","1","1","2015-08-27 13:18:14","2015-08-27 13:21:44");
INSERT INTO trianik_clientschedule VALUES("38358","38320","258","4","2015-08-27","","13:30","16:30","W","1","1","2015-08-27 13:21:12","2015-08-27 13:21:12");
INSERT INTO trianik_clientschedule VALUES("38359","38321","254","4","2015-08-13","","12:30","15:30","T","1","1","2015-08-27 13:30:29","2015-08-27 13:30:29");
INSERT INTO trianik_clientschedule VALUES("38360","38322","255","4","2015-08-27","","11:30","14:30","W","1","1","2015-08-27 13:44:59","2015-08-27 13:44:59");
INSERT INTO trianik_clientschedule VALUES("38361","38323","255","1","2015-08-31","","09:00","13:00","W","1","1","2015-08-27 13:47:46","2015-08-27 13:47:46");
INSERT INTO trianik_clientschedule VALUES("38362","38324","257","1","2015-09-07","","08:00","11:00","T","1","1","2015-08-27 13:50:39","2015-08-27 13:50:39");
INSERT INTO trianik_clientschedule VALUES("38363","38325","257","5","2015-08-28","","08:00","10:00","T","1","1","2015-08-27 13:54:23","2015-08-27 13:54:23");
INSERT INTO trianik_clientschedule VALUES("38364","38326","257","5","2015-08-28","","10:15","11:45","T","1","1","2015-08-27 13:57:09","2015-08-27 13:57:09");
INSERT INTO trianik_clientschedule VALUES("38365","38327","255","4","2015-08-27","","18:00","19:00","W","1","1","2015-08-27 14:01:51","2015-08-27 14:01:51");
INSERT INTO trianik_clientschedule VALUES("38366","38328","255","2","2015-09-29","","11:30","14:30","O","1","1","2015-08-27 14:09:41","2015-08-27 14:09:41");
INSERT INTO trianik_clientschedule VALUES("38367","38328","255","2","2015-10-06","","11:30","14:30","O","1","1","2015-08-27 14:10:06","2015-08-27 14:10:06");
INSERT INTO trianik_clientschedule VALUES("38368","38328","255","2","2015-10-13","","11:30","14:30","O","1","1","2015-08-27 14:10:28","2015-08-27 14:10:28");
INSERT INTO trianik_clientschedule VALUES("38369","38328","255","2","2015-10-20","","11:30","14:30","O","1","1","2015-08-27 14:10:49","2015-08-27 14:10:49");
INSERT INTO trianik_clientschedule VALUES("38370","38329","257","1","2015-08-24","","13:30","15:30","W","1","1","2015-08-27 14:13:28","2015-08-27 14:13:28");
INSERT INTO trianik_clientschedule VALUES("38371","38330","257","1","2015-09-14","","11:15","13:45","T","1","1","2015-08-27 14:16:12","2015-08-27 14:16:12");
INSERT INTO trianik_clientschedule VALUES("38372","38331","249","3","2015-09-09","","14:00","16:00","T","1","1","2015-08-27 14:19:26","2015-08-27 14:19:26");
INSERT INTO trianik_clientschedule VALUES("38373","38332","259","2","2015-09-08","","09:00","11:00","T","1","1","2015-08-27 14:23:10","2015-08-27 14:23:10");
INSERT INTO trianik_clientschedule VALUES("38374","38329","248","2","2015-09-01","","14:30","16:30","O","1","1","2015-08-27 14:36:14","2015-08-27 14:36:14");
INSERT INTO trianik_clientschedule VALUES("38375","38333","251","5","2015-08-28","","13:30","15:30","W","1","1","2015-08-27 15:29:39","2015-08-27 15:29:39");
INSERT INTO trianik_clientschedule VALUES("38377","38315","258","3","2015-09-02","","09:00","11:00","O","1","1","2015-08-27 15:49:04","2015-08-28 12:50:51");
INSERT INTO trianik_clientschedule VALUES("38380","38261","250","4","2015-08-06","2015-11-04","08:25","13:20","W","1","1","2015-09-01 19:35:52","2015-09-04 12:31:27");
INSERT INTO trianik_clientschedule VALUES("38381","38261","256","5","2015-09-04","2015-09-18","08:20","20:30","W","1","1","2015-09-01 20:45:52","2015-09-01 20:49:16");
INSERT INTO trianik_clientschedule VALUES("38382","38261","248","5","2015-09-25","0000-00-00","08:35","15:35","W","1","1","2015-09-01 20:55:12","2015-09-01 20:55:12");



DROP TABLE trianik_diary;

CREATE TABLE `trianik_diary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `deleted` varchar(1) DEFAULT 'N',
  `starttime` datetime DEFAULT NULL,
  `actualstarttime` datetime DEFAULT NULL,
  `actualendtime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `metacreateduserid` int(11) DEFAULT NULL,
  `metamodifieduserid` int(11) DEFAULT NULL,
  `metacreateddate` datetime DEFAULT NULL,
  `metamodifieddate` datetime DEFAULT NULL,
  `scheduleid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clientid` (`clientid`),
  KEY `memberid` (`memberid`)
) ENGINE=InnoDB AUTO_INCREMENT=77049 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

INSERT INTO trianik_diary VALUES("75115","38277","252","U","N","2015-09-01 09:30:00","","","2015-09-01 11:30:00","","","","","38308");
INSERT INTO trianik_diary VALUES("75116","38277","252","U","N","2015-09-03 09:30:00","","","2015-09-03 11:30:00","","","","","38309");
INSERT INTO trianik_diary VALUES("75117","38317","258","U","N","2015-09-01 11:30:00","","","2015-09-01 13:30:00","","","","","38355");
INSERT INTO trianik_diary VALUES("75118","38309","258","U","N","2015-09-04 11:30:00","","","2015-09-04 13:00:00","","","","","38346");
INSERT INTO trianik_diary VALUES("75119","38316","258","U","N","2015-09-01 09:00:00","","","2015-09-01 11:00:00","","","","","38353");
INSERT INTO trianik_diary VALUES("75120","38316","258","U","N","2015-09-04 09:00:00","","","2015-09-04 11:00:00","","","","","38354");
INSERT INTO trianik_diary VALUES("75121","38314","257","U","N","2015-09-04 12:30:00","","","2015-09-04 15:30:00","","","","","38351");
INSERT INTO trianik_diary VALUES("75122","38280","252","U","N","2015-09-03 12:00:00","","","2015-09-03 16:00:00","","","","","38313");
INSERT INTO trianik_diary VALUES("75123","38284","253","U","N","2015-09-01 09:30:00","","","2015-09-01 14:30:00","","","","","38317");
INSERT INTO trianik_diary VALUES("75124","38284","253","U","N","2015-09-03 11:30:00","","","2015-09-03 13:30:00","","","","","38318");
INSERT INTO trianik_diary VALUES("75125","38252","251","U","N","2015-09-02 10:30:00","","","2015-09-02 14:30:00","","","","","38278");
INSERT INTO trianik_diary VALUES("75126","38252","251","U","N","2015-09-04 09:00:00","","","2015-09-04 13:00:00","","","","","38279");
INSERT INTO trianik_diary VALUES("75127","38333","251","U","N","2015-09-04 13:30:00","","","2015-09-04 15:30:00","","","","","38375");
INSERT INTO trianik_diary VALUES("75128","38303","255","U","N","2015-09-01 09:00:00","","","2015-09-01 11:00:00","","","","","38338");
INSERT INTO trianik_diary VALUES("75129","38303","255","U","N","2015-09-03 15:00:00","","","2015-09-03 18:00:00","","","","","38339");
INSERT INTO trianik_diary VALUES("75130","38281","252","U","N","2015-09-04 12:00:00","","","2015-09-04 14:00:00","","","","","38314");
INSERT INTO trianik_diary VALUES("75131","38287","253","U","N","2015-09-04 09:30:00","","","2015-09-04 13:00:00","","","","","38321");
INSERT INTO trianik_diary VALUES("75132","38319","258","U","N","2015-09-03 09:00:00","","","2015-09-03 13:00:00","","","","","38357");
INSERT INTO trianik_diary VALUES("75133","38285","253","U","N","2015-09-02 12:30:00","","","2015-09-02 14:30:00","","","","","38319");
INSERT INTO trianik_diary VALUES("75134","38259","250","U","N","2015-09-01 09:00:00","","","2015-09-01 11:00:00","","","","","38286");
INSERT INTO trianik_diary VALUES("75135","38255","251","U","N","2015-09-02 09:00:00","","","2015-09-02 10:30:00","","","","","38282");
INSERT INTO trianik_diary VALUES("75136","38320","258","U","N","2015-09-03 13:30:00","","","2015-09-03 16:30:00","","","","","38358");
INSERT INTO trianik_diary VALUES("75137","38313","255","U","N","2015-09-04 16:00:00","","","2015-09-04 18:00:00","","","","","38350");
INSERT INTO trianik_diary VALUES("75138","38253","251","U","N","2015-09-03 11:30:00","","","2015-09-03 13:30:00","","","","","38281");
INSERT INTO trianik_diary VALUES("75139","38308","255","U","N","2015-09-04 14:00:00","","","2015-09-04 16:00:00","","","","","38344");
INSERT INTO trianik_diary VALUES("75140","38295","256","U","N","2015-09-04 09:00:00","","","2015-09-04 11:00:00","","","","","38330");
INSERT INTO trianik_diary VALUES("75141","38283","251","U","N","2015-09-03 09:00:00","","","2015-09-03 11:00:00","","","","","38316");
INSERT INTO trianik_diary VALUES("75142","38322","255","U","N","2015-09-03 11:30:00","","","2015-09-03 14:30:00","","","","","38360");
INSERT INTO trianik_diary VALUES("75143","38292","256","I","N","2015-09-01 12:30:00","2015-09-01 21:01:00","","2015-09-01 19:30:00","","","","","38327");
INSERT INTO trianik_diary VALUES("75144","38263","250","U","N","2015-09-03 12:30:00","","","2015-09-03 14:30:00","","","","","38290");
INSERT INTO trianik_diary VALUES("75145","38279","252","U","N","2015-09-01 14:30:00","","","2015-09-01 16:30:00","","","","","38312");
INSERT INTO trianik_diary VALUES("75146","38258","250","U","N","2015-09-01 09:00:00","","","2015-09-01 11:00:00","","","","","38285");
INSERT INTO trianik_diary VALUES("75147","38306","255","U","N","2015-09-02 14:30:00","","","2015-09-02 16:30:00","","","","","38342");
INSERT INTO trianik_diary VALUES("75148","38276","249","U","N","2015-09-04 11:30:00","","","2015-09-04 15:30:00","","","","","38307");
INSERT INTO trianik_diary VALUES("75149","38297","254","U","N","2015-09-01 12:30:00","","","2015-09-01 14:30:00","","","","","38332");
INSERT INTO trianik_diary VALUES("75150","38318","258","U","N","2015-09-02 11:30:00","","","2015-09-02 14:30:00","","","","","38356");
INSERT INTO trianik_diary VALUES("75151","38299","254","U","N","2015-09-03 12:30:00","","","2015-09-03 14:30:00","","","","","38334");
INSERT INTO trianik_diary VALUES("75152","38265","249","U","N","2015-09-01 09:00:00","","","2015-09-01 11:00:00","","","","","38293");
INSERT INTO trianik_diary VALUES("75153","38265","249","U","N","2015-09-02 09:00:00","","","2015-09-02 11:00:00","","","","","38294");
INSERT INTO trianik_diary VALUES("75154","38265","249","U","N","2015-09-03 09:00:00","","","2015-09-03 11:00:00","","","","","38295");
INSERT INTO trianik_diary VALUES("75155","38265","249","U","N","2015-09-04 09:00:00","","","2015-09-04 11:00:00","","","","","38296");
INSERT INTO trianik_diary VALUES("75156","38291","248","U","N","2015-08-31 09:00:00","","","2015-08-31 11:00:00","","","","","38326");
INSERT INTO trianik_diary VALUES("75157","38275","249","U","N","2015-09-03 13:00:00","","","2015-09-03 15:00:00","","","","","38306");
INSERT INTO trianik_diary VALUES("75158","38307","255","U","N","2015-09-04 09:00:00","","","2015-09-04 11:00:00","","","","","38343");
INSERT INTO trianik_diary VALUES("75159","38282","252","U","N","2015-09-04 14:00:00","","","2015-09-04 16:00:00","","","","","38315");
INSERT INTO trianik_diary VALUES("75160","38312","257","U","N","2015-09-04 09:00:00","","","2015-09-04 13:00:00","","","","","38349");
INSERT INTO trianik_diary VALUES("75161","38249","248","U","N","2015-09-01 12:00:00","","","2015-09-01 14:00:00","","","","","38273");
INSERT INTO trianik_diary VALUES("75162","38293","256","U","N","2015-09-02 12:30:00","","","2015-09-02 15:30:00","","","","","38328");
INSERT INTO trianik_diary VALUES("75163","38267","255","U","N","2015-09-04 11:30:00","","","2015-09-04 13:30:00","","","","","38298");
INSERT INTO trianik_diary VALUES("75164","38296","256","U","N","2015-09-04 11:30:00","","","2015-09-04 13:30:00","","","","","38331");
INSERT INTO trianik_diary VALUES("75165","38262","250","U","N","2015-09-03 09:00:00","","","2015-09-03 12:00:00","","","","","38289");
INSERT INTO trianik_diary VALUES("75166","38305","255","U","N","2015-09-02 12:30:00","","","2015-09-02 14:30:00","","","","","38341");
INSERT INTO trianik_diary VALUES("75167","38278","252","U","N","2015-09-01 12:00:00","","","2015-09-01 14:00:00","","","","","38310");
INSERT INTO trianik_diary VALUES("75168","38278","252","U","N","2015-09-04 09:30:00","","","2015-09-04 11:30:00","","","","","38311");
INSERT INTO trianik_diary VALUES("75169","38269","249","U","N","2015-09-01 11:30:00","","","2015-09-01 14:30:00","","","","","38300");
INSERT INTO trianik_diary VALUES("75170","38294","256","U","N","2015-09-03 12:30:00","","","2015-09-03 16:30:00","","","","","38329");
INSERT INTO trianik_diary VALUES("75173","38247","248","U","N","2015-09-03 18:00:00","","","2015-09-03 19:00:00","","","","","38266");
INSERT INTO trianik_diary VALUES("75174","38247","248","U","N","2015-09-04 18:30:00","","","2015-09-04 19:30:00","","","","","38267");
INSERT INTO trianik_diary VALUES("75175","38248","248","U","N","2015-09-01 16:30:00","","","2015-09-01 20:00:00","","","","","38269");
INSERT INTO trianik_diary VALUES("75176","38248","248","U","N","2015-09-02 19:00:00","","","2015-09-02 22:00:00","","","","","38270");
INSERT INTO trianik_diary VALUES("75177","38248","248","U","N","2015-09-03 19:00:00","","","2015-09-03 22:00:00","","","","","38271");
INSERT INTO trianik_diary VALUES("75178","38248","248","U","N","2015-09-04 15:30:00","","","2015-09-04 18:30:00","","","","","38272");
INSERT INTO trianik_diary VALUES("75179","38286","253","U","N","2015-09-03 09:30:00","","","2015-09-03 12:30:00","","","","","38320");
INSERT INTO trianik_diary VALUES("75180","38264","250","U","N","2015-09-04 11:30:00","","","2015-09-04 15:30:00","","","","","38291");
INSERT INTO trianik_diary VALUES("75181","38272","249","U","N","2015-09-03 11:30:00","","","2015-09-03 13:30:00","","","","","38303");
INSERT INTO trianik_diary VALUES("75182","38304","255","U","N","2015-09-02 09:00:00","","","2015-09-02 11:30:00","","","","","38340");
INSERT INTO trianik_diary VALUES("75183","38289","256","U","N","2015-09-03 09:00:00","","","2015-09-03 12:00:00","","","","","38324");
INSERT INTO trianik_diary VALUES("75184","38327","255","U","N","2015-09-03 18:00:00","","","2015-09-03 19:00:00","","","","","38365");
INSERT INTO trianik_diary VALUES("75185","38315","258","U","N","2015-09-02 09:00:00","","","2015-09-02 11:00:00","","","","","38377");
INSERT INTO trianik_diary VALUES("75186","38315","255","U","N","2015-09-03 09:00:00","","","2015-09-03 11:00:00","","","","","38352");
INSERT INTO trianik_diary VALUES("75187","38329","248","U","N","2015-09-01 14:30:00","","","2015-09-01 16:30:00","","","","","38374");
INSERT INTO trianik_diary VALUES("75188","38300","254","U","N","2015-09-04 12:30:00","","","2015-09-04 14:30:00","","","","","38335");
INSERT INTO trianik_diary VALUES("75189","38260","250","U","N","2015-09-02 09:00:00","","","2015-09-02 11:00:00","","","","","38287");
INSERT INTO trianik_diary VALUES("75190","38261","256","C","N","2015-09-01 08:25:00","2015-09-01 21:01:30","2015-09-01 21:01:32","2015-09-01 13:20:00","","","","","38380");
INSERT INTO trianik_diary VALUES("75193","38277","252","U","N","2015-09-08 09:30:00","","","2015-09-08 11:30:00","","","","","38308");
INSERT INTO trianik_diary VALUES("75194","38277","252","U","N","2015-09-10 09:30:00","","","2015-09-10 11:30:00","","","","","38309");
INSERT INTO trianik_diary VALUES("75195","38274","250","U","N","2015-09-10 09:00:00","","","2015-09-10 12:00:00","","","","","38305");
INSERT INTO trianik_diary VALUES("75196","38317","258","U","N","2015-09-08 11:30:00","","","2015-09-08 13:30:00","","","","","38355");
INSERT INTO trianik_diary VALUES("75197","38309","258","U","N","2015-09-07 09:00:00","","","2015-09-07 10:30:00","","","","","38345");
INSERT INTO trianik_diary VALUES("75198","38309","258","U","N","2015-09-11 11:30:00","","","2015-09-11 13:00:00","","","","","38346");
INSERT INTO trianik_diary VALUES("75199","38316","258","U","N","2015-09-08 09:00:00","","","2015-09-08 11:00:00","","","","","38353");
INSERT INTO trianik_diary VALUES("75200","38316","258","U","N","2015-09-11 09:00:00","","","2015-09-11 11:00:00","","","","","38354");
INSERT INTO trianik_diary VALUES("75201","38314","257","U","N","2015-09-11 12:30:00","","","2015-09-11 15:30:00","","","","","38351");
INSERT INTO trianik_diary VALUES("75202","38280","252","U","N","2015-09-10 12:00:00","","","2015-09-10 16:00:00","","","","","38313");
INSERT INTO trianik_diary VALUES("75203","38284","253","U","N","2015-09-08 09:30:00","","","2015-09-08 14:30:00","","","","","38317");
INSERT INTO trianik_diary VALUES("75204","38284","253","U","N","2015-09-10 11:30:00","","","2015-09-10 13:30:00","","","","","38318");
INSERT INTO trianik_diary VALUES("75205","38252","251","U","N","2015-09-07 09:30:00","","","2015-09-07 12:30:00","","","","","38277");
INSERT INTO trianik_diary VALUES("75206","38252","251","U","N","2015-09-09 10:30:00","","","2015-09-09 14:30:00","","","","","38278");
INSERT INTO trianik_diary VALUES("75207","38252","251","U","N","2015-09-11 09:00:00","","","2015-09-11 13:00:00","","","","","38279");
INSERT INTO trianik_diary VALUES("75208","38311","257","U","N","2015-09-07 15:30:00","","","2015-09-07 17:30:00","","","","","38348");
INSERT INTO trianik_diary VALUES("75209","38333","251","U","N","2015-09-11 13:30:00","","","2015-09-11 15:30:00","","","","","38375");
INSERT INTO trianik_diary VALUES("75210","38303","255","U","N","2015-09-08 09:00:00","","","2015-09-08 11:00:00","","","","","38338");
INSERT INTO trianik_diary VALUES("75211","38303","255","U","N","2015-09-10 15:00:00","","","2015-09-10 17:00:00","","","","","38339");
INSERT INTO trianik_diary VALUES("75212","38271","249","U","N","2015-09-09 14:00:00","","","2015-09-09 16:00:00","","","","","38302");
INSERT INTO trianik_diary VALUES("75213","38245","248","U","N","2015-09-07 08:30:00","","","2015-09-07 12:30:00","","","","","38261");
INSERT INTO trianik_diary VALUES("75214","38319","258","U","N","2015-09-10 09:00:00","","","2015-09-10 13:00:00","","","","","38357");
INSERT INTO trianik_diary VALUES("75215","38285","253","U","N","2015-09-09 12:30:00","","","2015-09-09 14:30:00","","","","","38319");
INSERT INTO trianik_diary VALUES("75216","38246","248","U","N","2015-09-07 13:30:00","","","2015-09-07 15:30:00","","","","","38262");
INSERT INTO trianik_diary VALUES("75217","38259","250","U","N","2015-09-08 09:00:00","","","2015-09-08 11:00:00","","","","","38286");
INSERT INTO trianik_diary VALUES("75218","38320","258","U","N","2015-09-10 13:30:00","","","2015-09-10 16:30:00","","","","","38358");
INSERT INTO trianik_diary VALUES("75219","38253","251","U","N","2015-09-07 12:30:00","","","2015-09-07 14:30:00","","","","","38280");
INSERT INTO trianik_diary VALUES("75220","38253","251","U","N","2015-09-10 11:30:00","","","2015-09-10 13:30:00","","","","","38281");
INSERT INTO trianik_diary VALUES("75221","38308","255","U","N","2015-09-11 14:00:00","","","2015-09-11 16:00:00","","","","","38344");
INSERT INTO trianik_diary VALUES("75222","38295","256","U","N","2015-09-11 09:00:00","","","2015-09-11 11:00:00","","","","","38330");
INSERT INTO trianik_diary VALUES("75223","38288","253","U","N","2015-09-11 09:30:00","","","2015-09-11 13:30:00","","","","","38322");
INSERT INTO trianik_diary VALUES("75224","38283","251","U","N","2015-09-10 09:00:00","","","2015-09-10 11:00:00","","","","","38316");
INSERT INTO trianik_diary VALUES("75225","38290","256","U","N","2015-09-07 12:30:00","","","2015-09-07 15:30:00","","","","","38325");
INSERT INTO trianik_diary VALUES("75226","38322","255","U","N","2015-09-10 11:30:00","","","2015-09-10 14:30:00","","","","","38360");
INSERT INTO trianik_diary VALUES("75227","38292","256","U","N","2015-09-08 12:30:00","","","2015-09-08 16:30:00","","","","","38327");
INSERT INTO trianik_diary VALUES("75228","38263","250","U","N","2015-09-10 12:30:00","","","2015-09-10 14:30:00","","","","","38290");
INSERT INTO trianik_diary VALUES("75229","38279","252","U","N","2015-09-08 14:30:00","","","2015-09-08 16:30:00","","","","","38312");
INSERT INTO trianik_diary VALUES("75230","38306","255","U","N","2015-09-09 14:30:00","","","2015-09-09 16:30:00","","","","","38342");
INSERT INTO trianik_diary VALUES("75231","38276","249","U","N","2015-09-11 11:30:00","","","2015-09-11 15:30:00","","","","","38307");
INSERT INTO trianik_diary VALUES("75232","38297","254","U","N","2015-09-08 12:30:00","","","2015-09-08 14:30:00","","","","","38332");
INSERT INTO trianik_diary VALUES("75233","38326","257","U","N","2015-09-11 10:15:00","","","2015-09-11 11:45:00","","","","","38364");
INSERT INTO trianik_diary VALUES("75234","38318","258","U","N","2015-09-09 11:30:00","","","2015-09-09 14:30:00","","","","","38356");
INSERT INTO trianik_diary VALUES("75235","38265","249","U","N","2015-09-07 09:00:00","","","2015-09-07 11:00:00","","","","","38292");
INSERT INTO trianik_diary VALUES("75236","38265","249","U","N","2015-09-08 09:00:00","","","2015-09-08 11:00:00","","","","","38293");
INSERT INTO trianik_diary VALUES("75237","38265","249","U","N","2015-09-09 09:00:00","","","2015-09-09 11:00:00","","","","","38294");
INSERT INTO trianik_diary VALUES("75238","38265","249","U","N","2015-09-10 09:00:00","","","2015-09-10 11:00:00","","","","","38295");
INSERT INTO trianik_diary VALUES("75239","38265","249","U","N","2015-09-11 09:00:00","","","2015-09-11 11:00:00","","","","","38296");
INSERT INTO trianik_diary VALUES("75240","38270","249","U","N","2015-09-09 11:30:00","","","2015-09-09 13:30:00","","","","","38301");
INSERT INTO trianik_diary VALUES("75241","38291","248","U","N","2015-09-08 09:00:00","","","2015-09-08 11:00:00","","","","","38326");
INSERT INTO trianik_diary VALUES("75242","38275","249","U","N","2015-09-10 13:00:00","","","2015-09-10 15:00:00","","","","","38306");
INSERT INTO trianik_diary VALUES("75243","38307","255","U","N","2015-09-11 09:00:00","","","2015-09-11 11:00:00","","","","","38343");
INSERT INTO trianik_diary VALUES("75244","38282","252","U","N","2015-09-11 14:00:00","","","2015-09-11 16:00:00","","","","","38315");
INSERT INTO trianik_diary VALUES("75245","38323","255","U","N","2015-09-07 09:00:00","","","2015-09-07 13:00:00","","","","","38361");
INSERT INTO trianik_diary VALUES("75246","38249","248","U","N","2015-09-08 12:00:00","","","2015-09-08 14:00:00","","","","","38273");
INSERT INTO trianik_diary VALUES("75247","38293","256","U","N","2015-09-09 12:30:00","","","2015-09-09 15:30:00","","","","","38328");
INSERT INTO trianik_diary VALUES("75248","38251","248","U","N","2015-09-08 14:30:00","","","2015-09-08 17:00:00","","","","","38276");
INSERT INTO trianik_diary VALUES("75249","38266","249","U","N","2015-09-07 11:30:00","","","2015-09-07 13:30:00","","","","","38297");
INSERT INTO trianik_diary VALUES("75250","38267","255","U","N","2015-09-11 11:30:00","","","2015-09-11 13:30:00","","","","","38298");
INSERT INTO trianik_diary VALUES("75251","38296","256","U","N","2015-09-11 11:30:00","","","2015-09-11 13:30:00","","","","","38331");
INSERT INTO trianik_diary VALUES("75252","38301","255","U","N","2015-09-07 13:30:00","","","2015-09-07 15:30:00","","","","","38336");
INSERT INTO trianik_diary VALUES("75253","38298","254","U","N","2015-09-07 12:30:00","","","2015-09-07 15:30:00","","","","","38333");
INSERT INTO trianik_diary VALUES("75254","38305","255","U","N","2015-09-09 12:30:00","","","2015-09-09 14:30:00","","","","","38341");
INSERT INTO trianik_diary VALUES("75255","38278","252","U","N","2015-09-08 12:00:00","","","2015-09-08 14:00:00","","","","","38310");
INSERT INTO trianik_diary VALUES("75256","38278","252","U","N","2015-09-11 09:30:00","","","2015-09-11 11:30:00","","","","","38311");
INSERT INTO trianik_diary VALUES("75257","38273","250","U","N","2015-09-08 09:00:00","","","2015-09-08 12:00:00","","","","","38304");
INSERT INTO trianik_diary VALUES("75258","38332","259","U","N","2015-09-08 09:00:00","","","2015-09-08 11:00:00","","","","","38373");
INSERT INTO trianik_diary VALUES("75259","38269","249","U","N","2015-09-08 11:30:00","","","2015-09-08 14:30:00","","","","","38300");
INSERT INTO trianik_diary VALUES("75260","38256","250","U","N","2015-09-07 09:30:00","","","2015-09-07 12:00:00","","","","","38283");
INSERT INTO trianik_diary VALUES("75261","38294","256","U","N","2015-09-10 12:30:00","","","2015-09-10 16:30:00","","","","","38329");
INSERT INTO trianik_diary VALUES("75262","38247","248","U","N","2015-09-07 18:00:00","","","2015-09-07 19:00:00","","","","","38263");
INSERT INTO trianik_diary VALUES("75265","38247","248","U","N","2015-09-10 18:00:00","","","2015-09-10 19:00:00","","","","","38266");
INSERT INTO trianik_diary VALUES("75266","38247","248","U","N","2015-09-11 18:30:00","","","2015-09-11 19:30:00","","","","","38267");
INSERT INTO trianik_diary VALUES("75267","38310","258","U","N","2015-09-07 11:30:00","","","2015-09-07 14:30:00","","","","","38347");
INSERT INTO trianik_diary VALUES("75268","38331","249","U","N","2015-09-09 14:00:00","","","2015-09-09 16:00:00","","","","","38372");
INSERT INTO trianik_diary VALUES("75269","38324","257","U","N","2015-09-07 08:00:00","","","2015-09-07 11:00:00","","","","","38362");
INSERT INTO trianik_diary VALUES("75270","38248","248","U","N","2015-09-07 19:00:00","","","2015-09-07 22:30:00","","","","","38268");
INSERT INTO trianik_diary VALUES("75271","38248","248","U","N","2015-09-08 16:30:00","","","2015-09-08 20:00:00","","","","","38269");
INSERT INTO trianik_diary VALUES("75272","38248","248","U","N","2015-09-09 19:00:00","","","2015-09-09 22:00:00","","","","","38270");
INSERT INTO trianik_diary VALUES("75273","38248","248","U","N","2015-09-10 19:00:00","","","2015-09-10 22:00:00","","","","","38271");
INSERT INTO trianik_diary VALUES("75274","38248","248","U","N","2015-09-11 15:30:00","","","2015-09-11 18:30:00","","","","","38272");
INSERT INTO trianik_diary VALUES("75275","38286","253","U","N","2015-09-10 09:30:00","","","2015-09-10 12:30:00","","","","","38320");
INSERT INTO trianik_diary VALUES("75276","38264","250","U","N","2015-09-11 11:30:00","","","2015-09-11 15:30:00","","","","","38291");
INSERT INTO trianik_diary VALUES("75277","38304","255","U","N","2015-09-09 09:00:00","","","2015-09-09 11:30:00","","","","","38340");
INSERT INTO trianik_diary VALUES("75278","38289","256","U","N","2015-09-07 09:00:00","","","2015-09-07 12:00:00","","","","","38323");
INSERT INTO trianik_diary VALUES("75279","38289","256","U","N","2015-09-10 09:00:00","","","2015-09-10 12:00:00","","","","","38324");
INSERT INTO trianik_diary VALUES("75280","38325","257","U","N","2015-09-11 08:00:00","","","2015-09-11 10:00:00","","","","","38363");
INSERT INTO trianik_diary VALUES("75281","38257","257","U","N","2015-09-07 09:00:00","","","2015-09-07 11:00:00","","","","","38284");
INSERT INTO trianik_diary VALUES("75282","38327","255","U","N","2015-09-10 18:00:00","","","2015-09-10 19:00:00","","","","","38365");
INSERT INTO trianik_diary VALUES("75283","38315","255","U","N","2015-09-10 09:00:00","","","2015-09-10 11:00:00","","","","","38352");
INSERT INTO trianik_diary VALUES("75284","38321","254","U","N","2015-09-10 12:30:00","","","2015-09-10 15:30:00","","","","","38359");
INSERT INTO trianik_diary VALUES("75285","38329","257","U","N","2015-09-07 13:30:00","","","2015-09-07 15:30:00","","","","","38370");
INSERT INTO trianik_diary VALUES("75286","38300","254","U","N","2015-09-11 12:30:00","","","2015-09-11 14:30:00","","","","","38335");
INSERT INTO trianik_diary VALUES("75287","38260","250","U","N","2015-09-09 09:00:00","","","2015-09-09 11:00:00","","","","","38287");
INSERT INTO trianik_diary VALUES("75291","38277","252","U","N","2015-09-15 09:30:00","","","2015-09-15 11:30:00","","","","","38308");
INSERT INTO trianik_diary VALUES("75292","38277","252","U","N","2015-09-17 09:30:00","","","2015-09-17 11:30:00","","","","","38309");
INSERT INTO trianik_diary VALUES("75293","38317","258","U","N","2015-09-15 11:30:00","","","2015-09-15 13:30:00","","","","","38355");
INSERT INTO trianik_diary VALUES("75294","38309","258","U","N","2015-09-14 09:00:00","","","2015-09-14 10:30:00","","","","","38345");
INSERT INTO trianik_diary VALUES("75295","38309","258","U","N","2015-09-18 11:30:00","","","2015-09-18 13:00:00","","","","","38346");
INSERT INTO trianik_diary VALUES("75296","38316","258","U","N","2015-09-15 09:00:00","","","2015-09-15 11:00:00","","","","","38353");
INSERT INTO trianik_diary VALUES("75297","38316","258","U","N","2015-09-18 09:00:00","","","2015-09-18 11:00:00","","","","","38354");
INSERT INTO trianik_diary VALUES("75298","38314","257","U","N","2015-09-18 12:30:00","","","2015-09-18 15:30:00","","","","","38351");
INSERT INTO trianik_diary VALUES("75299","38268","249","U","N","2015-09-14 15:00:00","","","2015-09-14 16:00:00","","","","","38299");
INSERT INTO trianik_diary VALUES("75300","38280","252","U","N","2015-09-17 12:00:00","","","2015-09-17 16:00:00","","","","","38313");
INSERT INTO trianik_diary VALUES("75301","38284","253","U","N","2015-09-15 09:30:00","","","2015-09-15 14:30:00","","","","","38317");
INSERT INTO trianik_diary VALUES("75302","38284","253","U","N","2015-09-17 11:30:00","","","2015-09-17 13:30:00","","","","","38318");
INSERT INTO trianik_diary VALUES("75303","38252","251","U","N","2015-09-14 09:30:00","","","2015-09-14 12:30:00","","","","","38277");
INSERT INTO trianik_diary VALUES("75304","38252","251","U","N","2015-09-16 10:30:00","","","2015-09-16 14:30:00","","","","","38278");
INSERT INTO trianik_diary VALUES("75305","38252","251","U","N","2015-09-18 09:00:00","","","2015-09-18 13:00:00","","","","","38279");
INSERT INTO trianik_diary VALUES("75306","38311","257","U","N","2015-09-14 15:30:00","","","2015-09-14 17:30:00","","","","","38348");
INSERT INTO trianik_diary VALUES("75307","38333","251","U","N","2015-09-18 13:30:00","","","2015-09-18 15:30:00","","","","","38375");
INSERT INTO trianik_diary VALUES("75308","38303","255","U","N","2015-09-15 09:00:00","","","2015-09-15 11:00:00","","","","","38338");
INSERT INTO trianik_diary VALUES("75309","38303","255","U","N","2015-09-17 15:00:00","","","2015-09-17 17:00:00","","","","","38339");
INSERT INTO trianik_diary VALUES("75310","38281","252","U","N","2015-09-18 12:00:00","","","2015-09-18 14:00:00","","","","","38314");
INSERT INTO trianik_diary VALUES("75311","38287","253","U","N","2015-09-18 09:30:00","","","2015-09-18 13:00:00","","","","","38321");
INSERT INTO trianik_diary VALUES("75312","38245","248","U","N","2015-09-14 08:30:00","","","2015-09-14 12:30:00","","","","","38261");
INSERT INTO trianik_diary VALUES("75313","38319","258","U","N","2015-09-17 09:00:00","","","2015-09-17 13:00:00","","","","","38357");
INSERT INTO trianik_diary VALUES("75314","38285","253","U","N","2015-09-16 12:30:00","","","2015-09-16 14:30:00","","","","","38319");
INSERT INTO trianik_diary VALUES("75315","38246","248","U","N","2015-09-14 13:30:00","","","2015-09-14 15:30:00","","","","","38262");
INSERT INTO trianik_diary VALUES("75316","38259","250","U","N","2015-09-15 09:00:00","","","2015-09-15 11:00:00","","","","","38286");
INSERT INTO trianik_diary VALUES("75317","38255","251","U","N","2015-09-16 09:00:00","","","2015-09-16 10:30:00","","","","","38282");
INSERT INTO trianik_diary VALUES("75318","38250","248","U","N","2015-09-15 14:30:00","","","2015-09-15 16:30:00","","","","","38274");
INSERT INTO trianik_diary VALUES("75319","38320","258","U","N","2015-09-17 13:30:00","","","2015-09-17 16:30:00","","","","","38358");
INSERT INTO trianik_diary VALUES("75320","38313","255","U","N","2015-09-18 16:00:00","","","2015-09-18 18:00:00","","","","","38350");
INSERT INTO trianik_diary VALUES("75321","38253","251","U","N","2015-09-14 12:30:00","","","2015-09-14 14:30:00","","","","","38280");
INSERT INTO trianik_diary VALUES("75322","38253","251","U","N","2015-09-17 11:30:00","","","2015-09-17 13:30:00","","","","","38281");
INSERT INTO trianik_diary VALUES("75323","38308","255","U","N","2015-09-18 14:00:00","","","2015-09-18 16:00:00","","","","","38344");
INSERT INTO trianik_diary VALUES("75324","38295","256","U","N","2015-09-18 09:00:00","","","2015-09-18 11:00:00","","","","","38330");
INSERT INTO trianik_diary VALUES("75325","38283","251","U","N","2015-09-17 09:00:00","","","2015-09-17 11:00:00","","","","","38316");
INSERT INTO trianik_diary VALUES("75326","38290","256","U","N","2015-09-14 12:30:00","","","2015-09-14 15:30:00","","","","","38325");
INSERT INTO trianik_diary VALUES("75327","38322","255","U","N","2015-09-17 11:30:00","","","2015-09-17 14:30:00","","","","","38360");
INSERT INTO trianik_diary VALUES("75328","38292","256","U","N","2015-09-15 12:30:00","","","2015-09-15 16:30:00","","","","","38327");
INSERT INTO trianik_diary VALUES("75329","38263","250","U","N","2015-09-17 12:30:00","","","2015-09-17 14:30:00","","","","","38290");
INSERT INTO trianik_diary VALUES("75330","38279","252","U","N","2015-09-15 14:30:00","","","2015-09-15 16:30:00","","","","","38312");
INSERT INTO trianik_diary VALUES("75331","38258","250","U","N","2015-09-15 09:00:00","","","2015-09-15 11:00:00","","","","","38285");
INSERT INTO trianik_diary VALUES("75332","38306","255","U","N","2015-09-16 14:30:00","","","2015-09-16 16:30:00","","","","","38342");
INSERT INTO trianik_diary VALUES("75333","38276","249","U","N","2015-09-18 11:30:00","","","2015-09-18 15:30:00","","","","","38307");
INSERT INTO trianik_diary VALUES("75334","38297","254","U","N","2015-09-15 12:30:00","","","2015-09-15 14:30:00","","","","","38332");
INSERT INTO trianik_diary VALUES("75335","38318","258","U","N","2015-09-16 11:30:00","","","2015-09-16 14:30:00","","","","","38356");
INSERT INTO trianik_diary VALUES("75336","38302","255","U","N","2015-09-14 15:30:00","","","2015-09-14 17:30:00","","","","","38337");
INSERT INTO trianik_diary VALUES("75337","38299","254","U","N","2015-09-17 12:30:00","","","2015-09-17 14:30:00","","","","","38334");
INSERT INTO trianik_diary VALUES("75338","38265","249","U","N","2015-09-14 09:00:00","","","2015-09-14 11:00:00","","","","","38292");
INSERT INTO trianik_diary VALUES("75339","38265","249","U","N","2015-09-15 09:00:00","","","2015-09-15 11:00:00","","","","","38293");
INSERT INTO trianik_diary VALUES("75340","38265","249","U","N","2015-09-16 09:00:00","","","2015-09-16 11:00:00","","","","","38294");
INSERT INTO trianik_diary VALUES("75341","38265","249","U","N","2015-09-17 09:00:00","","","2015-09-17 11:00:00","","","","","38295");
INSERT INTO trianik_diary VALUES("75342","38265","249","U","N","2015-09-18 09:00:00","","","2015-09-18 11:00:00","","","","","38296");
INSERT INTO trianik_diary VALUES("75343","38330","257","U","N","2015-09-14 11:15:00","","","2015-09-14 13:45:00","","","","","38371");
INSERT INTO trianik_diary VALUES("75344","38291","248","U","N","2015-09-15 09:00:00","","","2015-09-15 11:00:00","","","","","38326");
INSERT INTO trianik_diary VALUES("75345","38275","249","U","N","2015-09-17 13:00:00","","","2015-09-17 15:00:00","","","","","38306");
INSERT INTO trianik_diary VALUES("75346","38307","255","U","N","2015-09-18 09:00:00","","","2015-09-18 11:00:00","","","","","38343");
INSERT INTO trianik_diary VALUES("75347","38282","252","U","N","2015-09-18 14:00:00","","","2015-09-18 16:00:00","","","","","38315");
INSERT INTO trianik_diary VALUES("75348","38312","257","U","N","2015-09-18 09:00:00","","","2015-09-18 13:00:00","","","","","38349");
INSERT INTO trianik_diary VALUES("75349","38323","255","U","N","2015-09-14 09:00:00","","","2015-09-14 13:00:00","","","","","38361");
INSERT INTO trianik_diary VALUES("75350","38249","248","U","N","2015-09-15 12:00:00","","","2015-09-15 14:00:00","","","","","38273");
INSERT INTO trianik_diary VALUES("75351","38293","256","U","N","2015-09-16 12:30:00","","","2015-09-16 15:30:00","","","","","38328");
INSERT INTO trianik_diary VALUES("75352","38266","249","U","N","2015-09-14 11:30:00","","","2015-09-14 13:30:00","","","","","38297");
INSERT INTO trianik_diary VALUES("75353","38267","255","U","N","2015-09-18 11:30:00","","","2015-09-18 13:30:00","","","","","38298");
INSERT INTO trianik_diary VALUES("75354","38296","256","U","N","2015-09-18 11:30:00","","","2015-09-18 13:30:00","","","","","38331");
INSERT INTO trianik_diary VALUES("75355","38301","255","U","N","2015-09-14 13:30:00","","","2015-09-14 15:30:00","","","","","38336");
INSERT INTO trianik_diary VALUES("75356","38298","254","U","N","2015-09-14 12:30:00","","","2015-09-14 15:30:00","","","","","38333");
INSERT INTO trianik_diary VALUES("75357","38262","250","U","N","2015-09-17 09:00:00","","","2015-09-17 12:00:00","","","","","38289");
INSERT INTO trianik_diary VALUES("75358","38305","255","U","N","2015-09-16 12:30:00","","","2015-09-16 14:30:00","","","","","38341");
INSERT INTO trianik_diary VALUES("75359","38278","252","U","N","2015-09-15 12:00:00","","","2015-09-15 14:00:00","","","","","38310");
INSERT INTO trianik_diary VALUES("75360","38278","252","U","N","2015-09-18 09:30:00","","","2015-09-18 11:30:00","","","","","38311");
INSERT INTO trianik_diary VALUES("75361","38269","249","U","N","2015-09-15 11:30:00","","","2015-09-15 14:30:00","","","","","38300");
INSERT INTO trianik_diary VALUES("75362","38256","250","U","N","2015-09-14 09:30:00","","","2015-09-14 12:00:00","","","","","38283");
INSERT INTO trianik_diary VALUES("75363","38294","256","U","N","2015-09-17 12:30:00","","","2015-09-17 16:30:00","","","","","38329");
INSERT INTO trianik_diary VALUES("75364","38247","248","U","N","2015-09-14 18:00:00","","","2015-09-14 19:00:00","","","","","38263");
INSERT INTO trianik_diary VALUES("75367","38247","248","U","N","2015-09-17 18:00:00","","","2015-09-17 19:00:00","","","","","38266");
INSERT INTO trianik_diary VALUES("75368","38247","248","U","N","2015-09-18 18:30:00","","","2015-09-18 19:30:00","","","","","38267");
INSERT INTO trianik_diary VALUES("75369","38310","258","U","N","2015-09-14 11:30:00","","","2015-09-14 14:30:00","","","","","38347");
INSERT INTO trianik_diary VALUES("75370","38248","248","U","N","2015-09-14 19:00:00","","","2015-09-14 22:30:00","","","","","38268");
INSERT INTO trianik_diary VALUES("75371","38248","248","U","N","2015-09-15 16:30:00","","","2015-09-15 20:00:00","","","","","38269");
INSERT INTO trianik_diary VALUES("75372","38248","248","U","N","2015-09-16 19:00:00","","","2015-09-16 22:00:00","","","","","38270");
INSERT INTO trianik_diary VALUES("75373","38248","248","U","N","2015-09-17 19:00:00","","","2015-09-17 22:00:00","","","","","38271");
INSERT INTO trianik_diary VALUES("75374","38248","248","U","N","2015-09-18 15:30:00","","","2015-09-18 18:30:00","","","","","38272");
INSERT INTO trianik_diary VALUES("75375","38286","253","U","N","2015-09-17 09:30:00","","","2015-09-17 12:30:00","","","","","38320");
INSERT INTO trianik_diary VALUES("75376","38264","250","U","N","2015-09-18 11:30:00","","","2015-09-18 15:30:00","","","","","38291");
INSERT INTO trianik_diary VALUES("75377","38272","249","U","N","2015-09-17 11:30:00","","","2015-09-17 13:30:00","","","","","38303");
INSERT INTO trianik_diary VALUES("75378","38304","255","U","N","2015-09-16 09:00:00","","","2015-09-16 11:30:00","","","","","38340");
INSERT INTO trianik_diary VALUES("75379","38289","256","U","N","2015-09-14 09:00:00","","","2015-09-14 12:00:00","","","","","38323");
INSERT INTO trianik_diary VALUES("75380","38289","256","U","N","2015-09-17 09:00:00","","","2015-09-17 12:00:00","","","","","38324");
INSERT INTO trianik_diary VALUES("75381","38257","257","U","N","2015-09-14 09:00:00","","","2015-09-14 11:00:00","","","","","38284");
INSERT INTO trianik_diary VALUES("75382","38327","255","U","N","2015-09-17 18:00:00","","","2015-09-17 19:00:00","","","","","38365");
INSERT INTO trianik_diary VALUES("75383","38315","255","U","N","2015-09-17 09:00:00","","","2015-09-17 11:00:00","","","","","38352");
INSERT INTO trianik_diary VALUES("75384","38329","257","U","N","2015-09-14 13:30:00","","","2015-09-14 15:30:00","","","","","38370");
INSERT INTO trianik_diary VALUES("75385","38300","254","U","N","2015-09-18 12:30:00","","","2015-09-18 14:30:00","","","","","38335");
INSERT INTO trianik_diary VALUES("75386","38260","250","U","N","2015-09-16 09:00:00","","","2015-09-16 11:00:00","","","","","38287");
INSERT INTO trianik_diary VALUES("75390","38277","252","U","N","2015-09-22 09:30:00","","","2015-09-22 11:30:00","","","","","38308");
INSERT INTO trianik_diary VALUES("75391","38277","252","U","N","2015-09-24 09:30:00","","","2015-09-24 11:30:00","","","","","38309");
INSERT INTO trianik_diary VALUES("75392","38274","250","U","N","2015-09-24 09:00:00","","","2015-09-24 12:00:00","","","","","38305");
INSERT INTO trianik_diary VALUES("75393","38317","258","U","N","2015-09-22 11:30:00","","","2015-09-22 13:30:00","","","","","38355");
INSERT INTO trianik_diary VALUES("75394","38309","258","U","N","2015-09-21 09:00:00","","","2015-09-21 10:30:00","","","","","38345");
INSERT INTO trianik_diary VALUES("75395","38309","258","U","N","2015-09-25 11:30:00","","","2015-09-25 13:00:00","","","","","38346");
INSERT INTO trianik_diary VALUES("75396","38316","258","U","N","2015-09-22 09:00:00","","","2015-09-22 11:00:00","","","","","38353");
INSERT INTO trianik_diary VALUES("75397","38316","258","U","N","2015-09-25 09:00:00","","","2015-09-25 11:00:00","","","","","38354");
INSERT INTO trianik_diary VALUES("75398","38314","257","U","N","2015-09-25 12:30:00","","","2015-09-25 15:30:00","","","","","38351");
INSERT INTO trianik_diary VALUES("75399","38280","252","U","N","2015-09-24 12:00:00","","","2015-09-24 16:00:00","","","","","38313");
INSERT INTO trianik_diary VALUES("75400","38284","253","U","N","2015-09-22 09:30:00","","","2015-09-22 14:30:00","","","","","38317");
INSERT INTO trianik_diary VALUES("75401","38284","253","U","N","2015-09-24 11:30:00","","","2015-09-24 13:30:00","","","","","38318");
INSERT INTO trianik_diary VALUES("75402","38252","251","U","N","2015-09-21 09:30:00","","","2015-09-21 12:30:00","","","","","38277");
INSERT INTO trianik_diary VALUES("75403","38252","251","U","N","2015-09-23 10:30:00","","","2015-09-23 14:30:00","","","","","38278");
INSERT INTO trianik_diary VALUES("75404","38252","251","U","N","2015-09-25 09:00:00","","","2015-09-25 13:00:00","","","","","38279");
INSERT INTO trianik_diary VALUES("75405","38311","257","U","N","2015-09-21 15:30:00","","","2015-09-21 17:30:00","","","","","38348");
INSERT INTO trianik_diary VALUES("75406","38333","251","U","N","2015-09-25 13:30:00","","","2015-09-25 15:30:00","","","","","38375");
INSERT INTO trianik_diary VALUES("75407","38303","255","U","N","2015-09-22 09:00:00","","","2015-09-22 11:00:00","","","","","38338");
INSERT INTO trianik_diary VALUES("75408","38303","255","U","N","2015-09-24 15:00:00","","","2015-09-24 17:00:00","","","","","38339");
INSERT INTO trianik_diary VALUES("75409","38271","249","U","N","2015-09-23 14:00:00","","","2015-09-23 16:00:00","","","","","38302");
INSERT INTO trianik_diary VALUES("75410","38245","248","U","N","2015-09-21 08:30:00","","","2015-09-21 12:30:00","","","","","38261");
INSERT INTO trianik_diary VALUES("75411","38319","258","U","N","2015-09-24 09:00:00","","","2015-09-24 13:00:00","","","","","38357");
INSERT INTO trianik_diary VALUES("75412","38285","253","U","N","2015-09-23 12:30:00","","","2015-09-23 14:30:00","","","","","38319");
INSERT INTO trianik_diary VALUES("75413","38246","248","U","N","2015-09-21 13:30:00","","","2015-09-21 15:30:00","","","","","38262");
INSERT INTO trianik_diary VALUES("75414","38259","250","U","N","2015-09-22 09:00:00","","","2015-09-22 11:00:00","","","","","38286");
INSERT INTO trianik_diary VALUES("75415","38320","258","U","N","2015-09-24 13:30:00","","","2015-09-24 16:30:00","","","","","38358");
INSERT INTO trianik_diary VALUES("75416","38253","251","U","N","2015-09-21 12:30:00","","","2015-09-21 14:30:00","","","","","38280");
INSERT INTO trianik_diary VALUES("75417","38253","251","U","N","2015-09-24 11:30:00","","","2015-09-24 13:30:00","","","","","38281");
INSERT INTO trianik_diary VALUES("75418","38308","255","U","N","2015-09-25 14:00:00","","","2015-09-25 16:00:00","","","","","38344");
INSERT INTO trianik_diary VALUES("75419","38295","256","U","N","2015-09-25 09:00:00","","","2015-09-25 11:00:00","","","","","38330");
INSERT INTO trianik_diary VALUES("75420","38288","253","U","N","2015-09-25 09:30:00","","","2015-09-25 13:30:00","","","","","38322");
INSERT INTO trianik_diary VALUES("75421","38283","251","U","N","2015-09-24 09:00:00","","","2015-09-24 11:00:00","","","","","38316");
INSERT INTO trianik_diary VALUES("75422","38290","256","U","N","2015-09-21 12:30:00","","","2015-09-21 15:30:00","","","","","38325");
INSERT INTO trianik_diary VALUES("75423","38322","255","U","N","2015-09-24 11:30:00","","","2015-09-24 14:30:00","","","","","38360");
INSERT INTO trianik_diary VALUES("75424","38292","256","U","N","2015-09-22 12:30:00","","","2015-09-22 16:30:00","","","","","38327");
INSERT INTO trianik_diary VALUES("75425","38263","250","U","N","2015-09-24 12:30:00","","","2015-09-24 14:30:00","","","","","38290");
INSERT INTO trianik_diary VALUES("75426","38279","252","U","N","2015-09-22 14:30:00","","","2015-09-22 16:30:00","","","","","38312");
INSERT INTO trianik_diary VALUES("75427","38306","255","U","N","2015-09-23 14:30:00","","","2015-09-23 16:30:00","","","","","38342");
INSERT INTO trianik_diary VALUES("75428","38276","249","U","N","2015-09-25 11:30:00","","","2015-09-25 15:30:00","","","","","38307");
INSERT INTO trianik_diary VALUES("75429","38297","254","U","N","2015-09-22 12:30:00","","","2015-09-22 14:30:00","","","","","38332");
INSERT INTO trianik_diary VALUES("75430","38326","257","U","N","2015-09-25 10:15:00","","","2015-09-25 11:45:00","","","","","38364");
INSERT INTO trianik_diary VALUES("75431","38318","258","U","N","2015-09-23 11:30:00","","","2015-09-23 14:30:00","","","","","38356");
INSERT INTO trianik_diary VALUES("75432","38265","249","U","N","2015-09-21 09:00:00","","","2015-09-21 11:00:00","","","","","38292");
INSERT INTO trianik_diary VALUES("75433","38265","249","U","N","2015-09-22 09:00:00","","","2015-09-22 11:00:00","","","","","38293");
INSERT INTO trianik_diary VALUES("75434","38265","249","U","N","2015-09-23 09:00:00","","","2015-09-23 11:00:00","","","","","38294");
INSERT INTO trianik_diary VALUES("75435","38265","249","U","N","2015-09-24 09:00:00","","","2015-09-24 11:00:00","","","","","38295");
INSERT INTO trianik_diary VALUES("75436","38265","249","U","N","2015-09-25 09:00:00","","","2015-09-25 11:00:00","","","","","38296");
INSERT INTO trianik_diary VALUES("75437","38270","249","U","N","2015-09-23 11:30:00","","","2015-09-23 13:30:00","","","","","38301");
INSERT INTO trianik_diary VALUES("75438","38291","248","U","N","2015-09-22 09:00:00","","","2015-09-22 11:00:00","","","","","38326");
INSERT INTO trianik_diary VALUES("75439","38275","249","U","N","2015-09-24 13:00:00","","","2015-09-24 15:00:00","","","","","38306");
INSERT INTO trianik_diary VALUES("75440","38307","255","U","N","2015-09-25 09:00:00","","","2015-09-25 11:00:00","","","","","38343");
INSERT INTO trianik_diary VALUES("75441","38282","252","U","N","2015-09-25 14:00:00","","","2015-09-25 16:00:00","","","","","38315");
INSERT INTO trianik_diary VALUES("75442","38323","255","U","N","2015-09-21 09:00:00","","","2015-09-21 13:00:00","","","","","38361");
INSERT INTO trianik_diary VALUES("75443","38249","248","U","N","2015-09-22 12:00:00","","","2015-09-22 14:00:00","","","","","38273");
INSERT INTO trianik_diary VALUES("75444","38293","256","U","N","2015-09-23 12:30:00","","","2015-09-23 15:30:00","","","","","38328");
INSERT INTO trianik_diary VALUES("75445","38251","248","U","N","2015-09-22 14:30:00","","","2015-09-22 17:00:00","","","","","38276");
INSERT INTO trianik_diary VALUES("75446","38266","249","U","N","2015-09-21 11:30:00","","","2015-09-21 13:30:00","","","","","38297");
INSERT INTO trianik_diary VALUES("75447","38267","255","U","N","2015-09-25 11:30:00","","","2015-09-25 13:30:00","","","","","38298");
INSERT INTO trianik_diary VALUES("75448","38296","256","U","N","2015-09-25 11:30:00","","","2015-09-25 13:30:00","","","","","38331");
INSERT INTO trianik_diary VALUES("75449","38301","255","U","N","2015-09-21 13:30:00","","","2015-09-21 15:30:00","","","","","38336");
INSERT INTO trianik_diary VALUES("75450","38298","254","U","N","2015-09-21 12:30:00","","","2015-09-21 15:30:00","","","","","38333");
INSERT INTO trianik_diary VALUES("75451","38305","255","U","N","2015-09-23 12:30:00","","","2015-09-23 14:30:00","","","","","38341");
INSERT INTO trianik_diary VALUES("75452","38278","252","U","N","2015-09-22 12:00:00","","","2015-09-22 14:00:00","","","","","38310");
INSERT INTO trianik_diary VALUES("75453","38278","252","U","N","2015-09-25 09:30:00","","","2015-09-25 11:30:00","","","","","38311");
INSERT INTO trianik_diary VALUES("75454","38273","250","U","N","2015-09-22 09:00:00","","","2015-09-22 12:00:00","","","","","38304");
INSERT INTO trianik_diary VALUES("75455","38332","259","U","N","2015-09-22 09:00:00","","","2015-09-22 11:00:00","","","","","38373");
INSERT INTO trianik_diary VALUES("75456","38269","249","U","N","2015-09-22 11:30:00","","","2015-09-22 14:30:00","","","","","38300");
INSERT INTO trianik_diary VALUES("75457","38256","250","U","N","2015-09-21 09:30:00","","","2015-09-21 12:00:00","","","","","38283");
INSERT INTO trianik_diary VALUES("75458","38294","256","U","N","2015-09-24 12:30:00","","","2015-09-24 16:30:00","","","","","38329");
INSERT INTO trianik_diary VALUES("75459","38247","248","U","N","2015-09-21 18:00:00","","","2015-09-21 19:00:00","","","","","38263");
INSERT INTO trianik_diary VALUES("75462","38247","248","U","N","2015-09-24 18:00:00","","","2015-09-24 19:00:00","","","","","38266");
INSERT INTO trianik_diary VALUES("75463","38247","248","U","N","2015-09-25 18:30:00","","","2015-09-25 19:30:00","","","","","38267");
INSERT INTO trianik_diary VALUES("75464","38310","258","U","N","2015-09-21 11:30:00","","","2015-09-21 14:30:00","","","","","38347");
INSERT INTO trianik_diary VALUES("75465","38331","249","U","N","2015-09-23 14:00:00","","","2015-09-23 16:00:00","","","","","38372");
INSERT INTO trianik_diary VALUES("75466","38324","257","U","N","2015-09-21 08:00:00","","","2015-09-21 11:00:00","","","","","38362");
INSERT INTO trianik_diary VALUES("75467","38248","248","U","N","2015-09-21 19:00:00","","","2015-09-21 22:30:00","","","","","38268");
INSERT INTO trianik_diary VALUES("75468","38248","248","U","N","2015-09-22 16:30:00","","","2015-09-22 20:00:00","","","","","38269");
INSERT INTO trianik_diary VALUES("75469","38248","248","U","N","2015-09-23 19:00:00","","","2015-09-23 22:00:00","","","","","38270");
INSERT INTO trianik_diary VALUES("75470","38248","248","U","N","2015-09-24 19:00:00","","","2015-09-24 22:00:00","","","","","38271");
INSERT INTO trianik_diary VALUES("75471","38248","248","U","N","2015-09-25 15:30:00","","","2015-09-25 18:30:00","","","","","38272");
INSERT INTO trianik_diary VALUES("75472","38286","253","U","N","2015-09-24 09:30:00","","","2015-09-24 12:30:00","","","","","38320");
INSERT INTO trianik_diary VALUES("75473","38264","250","U","N","2015-09-25 11:30:00","","","2015-09-25 15:30:00","","","","","38291");
INSERT INTO trianik_diary VALUES("75474","38304","255","U","N","2015-09-23 09:00:00","","","2015-09-23 11:30:00","","","","","38340");
INSERT INTO trianik_diary VALUES("75475","38289","256","U","N","2015-09-21 09:00:00","","","2015-09-21 12:00:00","","","","","38323");
INSERT INTO trianik_diary VALUES("75476","38289","256","U","N","2015-09-24 09:00:00","","","2015-09-24 12:00:00","","","","","38324");
INSERT INTO trianik_diary VALUES("75477","38325","257","U","N","2015-09-25 08:00:00","","","2015-09-25 10:00:00","","","","","38363");
INSERT INTO trianik_diary VALUES("75478","38257","257","U","N","2015-09-21 09:00:00","","","2015-09-21 11:00:00","","","","","38284");
INSERT INTO trianik_diary VALUES("75479","38327","255","U","N","2015-09-24 18:00:00","","","2015-09-24 19:00:00","","","","","38365");
INSERT INTO trianik_diary VALUES("75480","38315","255","U","N","2015-09-24 09:00:00","","","2015-09-24 11:00:00","","","","","38352");
INSERT INTO trianik_diary VALUES("75481","38321","254","U","N","2015-09-24 12:30:00","","","2015-09-24 15:30:00","","","","","38359");
INSERT INTO trianik_diary VALUES("75482","38329","257","U","N","2015-09-21 13:30:00","","","2015-09-21 15:30:00","","","","","38370");
INSERT INTO trianik_diary VALUES("75483","38300","254","U","N","2015-09-25 12:30:00","","","2015-09-25 14:30:00","","","","","38335");
INSERT INTO trianik_diary VALUES("75484","38260","250","U","N","2015-09-23 09:00:00","","","2015-09-23 11:00:00","","","","","38287");
INSERT INTO trianik_diary VALUES("75488","38277","252","U","N","2015-09-29 09:30:00","","","2015-09-29 11:30:00","","","","","38308");
INSERT INTO trianik_diary VALUES("75489","38277","252","U","N","2015-10-01 09:30:00","","","2015-10-01 11:30:00","","","","","38309");
INSERT INTO trianik_diary VALUES("75490","38317","258","U","N","2015-09-29 11:30:00","","","2015-09-29 13:30:00","","","","","38355");
INSERT INTO trianik_diary VALUES("75491","38309","258","U","N","2015-09-28 09:00:00","","","2015-09-28 10:30:00","","","","","38345");
INSERT INTO trianik_diary VALUES("75492","38309","258","U","N","2015-10-02 11:30:00","","","2015-10-02 13:00:00","","","","","38346");
INSERT INTO trianik_diary VALUES("75493","38316","258","U","N","2015-09-29 09:00:00","","","2015-09-29 11:00:00","","","","","38353");
INSERT INTO trianik_diary VALUES("75494","38316","258","U","N","2015-10-02 09:00:00","","","2015-10-02 11:00:00","","","","","38354");
INSERT INTO trianik_diary VALUES("75495","38314","257","U","N","2015-10-02 12:30:00","","","2015-10-02 15:30:00","","","","","38351");
INSERT INTO trianik_diary VALUES("75496","38268","249","U","N","2015-09-28 15:00:00","","","2015-09-28 16:00:00","","","","","38299");
INSERT INTO trianik_diary VALUES("75497","38280","252","U","N","2015-10-01 12:00:00","","","2015-10-01 16:00:00","","","","","38313");
INSERT INTO trianik_diary VALUES("75498","38284","253","U","N","2015-09-29 09:30:00","","","2015-09-29 14:30:00","","","","","38317");
INSERT INTO trianik_diary VALUES("75499","38284","253","U","N","2015-10-01 11:30:00","","","2015-10-01 13:30:00","","","","","38318");
INSERT INTO trianik_diary VALUES("75500","38252","251","U","N","2015-09-28 09:30:00","","","2015-09-28 12:30:00","","","","","38277");
INSERT INTO trianik_diary VALUES("75501","38252","251","U","N","2015-09-30 10:30:00","","","2015-09-30 14:30:00","","","","","38278");
INSERT INTO trianik_diary VALUES("75502","38252","251","U","N","2015-10-02 09:00:00","","","2015-10-02 13:00:00","","","","","38279");
INSERT INTO trianik_diary VALUES("75503","38311","257","U","N","2015-09-28 15:30:00","","","2015-09-28 17:30:00","","","","","38348");
INSERT INTO trianik_diary VALUES("75504","38333","251","U","N","2015-10-02 13:30:00","","","2015-10-02 15:30:00","","","","","38375");
INSERT INTO trianik_diary VALUES("75505","38303","255","U","N","2015-09-29 09:00:00","","","2015-09-29 11:00:00","","","","","38338");
INSERT INTO trianik_diary VALUES("75506","38303","255","U","N","2015-10-01 15:00:00","","","2015-10-01 17:00:00","","","","","38339");
INSERT INTO trianik_diary VALUES("75507","38281","252","U","N","2015-10-02 12:00:00","","","2015-10-02 14:00:00","","","","","38314");
INSERT INTO trianik_diary VALUES("75508","38287","253","U","N","2015-10-02 09:30:00","","","2015-10-02 13:00:00","","","","","38321");
INSERT INTO trianik_diary VALUES("75509","38245","248","U","N","2015-09-28 08:30:00","","","2015-09-28 12:30:00","","","","","38261");
INSERT INTO trianik_diary VALUES("75510","38319","258","U","N","2015-10-01 09:00:00","","","2015-10-01 13:00:00","","","","","38357");
INSERT INTO trianik_diary VALUES("75511","38328","255","U","N","2015-09-29 11:30:00","","","2015-09-29 14:30:00","","","","","38366");
INSERT INTO trianik_diary VALUES("75512","38285","253","U","N","2015-09-30 12:30:00","","","2015-09-30 14:30:00","","","","","38319");
INSERT INTO trianik_diary VALUES("75513","38246","248","U","N","2015-09-28 13:30:00","","","2015-09-28 15:30:00","","","","","38262");
INSERT INTO trianik_diary VALUES("75514","38259","250","U","N","2015-09-29 09:00:00","","","2015-09-29 11:00:00","","","","","38286");
INSERT INTO trianik_diary VALUES("75515","38255","251","U","N","2015-09-30 09:00:00","","","2015-09-30 10:30:00","","","","","38282");
INSERT INTO trianik_diary VALUES("75516","38250","248","U","N","2015-09-29 14:30:00","","","2015-09-29 16:30:00","","","","","38274");
INSERT INTO trianik_diary VALUES("75517","38320","258","U","N","2015-10-01 13:30:00","","","2015-10-01 16:30:00","","","","","38358");
INSERT INTO trianik_diary VALUES("75518","38313","255","U","N","2015-10-02 16:00:00","","","2015-10-02 18:00:00","","","","","38350");
INSERT INTO trianik_diary VALUES("75519","38253","251","U","N","2015-09-28 12:30:00","","","2015-09-28 14:30:00","","","","","38280");
INSERT INTO trianik_diary VALUES("75520","38253","251","U","N","2015-10-01 11:30:00","","","2015-10-01 13:30:00","","","","","38281");
INSERT INTO trianik_diary VALUES("75521","38308","255","U","N","2015-10-02 14:00:00","","","2015-10-02 16:00:00","","","","","38344");
INSERT INTO trianik_diary VALUES("75522","38295","256","U","N","2015-10-02 09:00:00","","","2015-10-02 11:00:00","","","","","38330");
INSERT INTO trianik_diary VALUES("75523","38283","251","U","N","2015-10-01 09:00:00","","","2015-10-01 11:00:00","","","","","38316");
INSERT INTO trianik_diary VALUES("75524","38290","256","U","N","2015-09-28 12:30:00","","","2015-09-28 15:30:00","","","","","38325");
INSERT INTO trianik_diary VALUES("75525","38322","255","U","N","2015-10-01 11:30:00","","","2015-10-01 14:30:00","","","","","38360");
INSERT INTO trianik_diary VALUES("75526","38292","256","U","N","2015-09-29 12:30:00","","","2015-09-29 16:30:00","","","","","38327");
INSERT INTO trianik_diary VALUES("75527","38263","250","U","N","2015-10-01 12:30:00","","","2015-10-01 14:30:00","","","","","38290");
INSERT INTO trianik_diary VALUES("75528","38279","252","U","N","2015-09-29 14:30:00","","","2015-09-29 16:30:00","","","","","38312");
INSERT INTO trianik_diary VALUES("75529","38258","250","U","N","2015-09-29 09:00:00","","","2015-09-29 11:00:00","","","","","38285");
INSERT INTO trianik_diary VALUES("75530","38306","255","U","N","2015-09-30 14:30:00","","","2015-09-30 16:30:00","","","","","38342");
INSERT INTO trianik_diary VALUES("75531","38276","249","U","N","2015-10-02 11:30:00","","","2015-10-02 15:30:00","","","","","38307");
INSERT INTO trianik_diary VALUES("75532","38297","254","U","N","2015-09-29 12:30:00","","","2015-09-29 14:30:00","","","","","38332");
INSERT INTO trianik_diary VALUES("75533","38318","258","U","N","2015-09-30 11:30:00","","","2015-09-30 14:30:00","","","","","38356");
INSERT INTO trianik_diary VALUES("75534","38302","255","U","N","2015-09-28 15:30:00","","","2015-09-28 17:30:00","","","","","38337");
INSERT INTO trianik_diary VALUES("75535","38299","254","U","N","2015-10-01 12:30:00","","","2015-10-01 14:30:00","","","","","38334");
INSERT INTO trianik_diary VALUES("75536","38265","249","U","N","2015-09-28 09:00:00","","","2015-09-28 11:00:00","","","","","38292");
INSERT INTO trianik_diary VALUES("75537","38265","249","U","N","2015-09-29 09:00:00","","","2015-09-29 11:00:00","","","","","38293");
INSERT INTO trianik_diary VALUES("75538","38265","249","U","N","2015-09-30 09:00:00","","","2015-09-30 11:00:00","","","","","38294");
INSERT INTO trianik_diary VALUES("75539","38265","249","U","N","2015-10-01 09:00:00","","","2015-10-01 11:00:00","","","","","38295");
INSERT INTO trianik_diary VALUES("75540","38265","249","U","N","2015-10-02 09:00:00","","","2015-10-02 11:00:00","","","","","38296");
INSERT INTO trianik_diary VALUES("75541","38330","257","U","N","2015-09-28 11:15:00","","","2015-09-28 13:45:00","","","","","38371");
INSERT INTO trianik_diary VALUES("75542","38291","248","U","N","2015-09-29 09:00:00","","","2015-09-29 11:00:00","","","","","38326");
INSERT INTO trianik_diary VALUES("75543","38275","249","U","N","2015-10-01 13:00:00","","","2015-10-01 15:00:00","","","","","38306");
INSERT INTO trianik_diary VALUES("75544","38307","255","U","N","2015-10-02 09:00:00","","","2015-10-02 11:00:00","","","","","38343");
INSERT INTO trianik_diary VALUES("75545","38282","252","U","N","2015-10-02 14:00:00","","","2015-10-02 16:00:00","","","","","38315");
INSERT INTO trianik_diary VALUES("75546","38312","257","U","N","2015-10-02 09:00:00","","","2015-10-02 13:00:00","","","","","38349");
INSERT INTO trianik_diary VALUES("75547","38323","255","U","N","2015-09-28 09:00:00","","","2015-09-28 13:00:00","","","","","38361");
INSERT INTO trianik_diary VALUES("75548","38249","248","U","N","2015-09-29 12:00:00","","","2015-09-29 14:00:00","","","","","38273");
INSERT INTO trianik_diary VALUES("75549","38293","256","U","N","2015-09-30 12:30:00","","","2015-09-30 15:30:00","","","","","38328");
INSERT INTO trianik_diary VALUES("75550","38266","249","U","N","2015-09-28 11:30:00","","","2015-09-28 13:30:00","","","","","38297");
INSERT INTO trianik_diary VALUES("75551","38267","255","U","N","2015-10-02 11:30:00","","","2015-10-02 13:30:00","","","","","38298");
INSERT INTO trianik_diary VALUES("75552","38296","256","U","N","2015-10-02 11:30:00","","","2015-10-02 13:30:00","","","","","38331");
INSERT INTO trianik_diary VALUES("75553","38301","255","U","N","2015-09-28 13:30:00","","","2015-09-28 15:30:00","","","","","38336");
INSERT INTO trianik_diary VALUES("75554","38298","254","U","N","2015-09-28 12:30:00","","","2015-09-28 15:30:00","","","","","38333");
INSERT INTO trianik_diary VALUES("75555","38262","250","U","N","2015-10-01 09:00:00","","","2015-10-01 12:00:00","","","","","38289");
INSERT INTO trianik_diary VALUES("75556","38305","255","U","N","2015-09-30 12:30:00","","","2015-09-30 14:30:00","","","","","38341");
INSERT INTO trianik_diary VALUES("75557","38278","252","U","N","2015-09-29 12:00:00","","","2015-09-29 14:00:00","","","","","38310");
INSERT INTO trianik_diary VALUES("75558","38278","252","U","N","2015-10-02 09:30:00","","","2015-10-02 11:30:00","","","","","38311");
INSERT INTO trianik_diary VALUES("75559","38269","249","U","N","2015-09-29 11:30:00","","","2015-09-29 14:30:00","","","","","38300");
INSERT INTO trianik_diary VALUES("75560","38256","250","U","N","2015-09-28 09:30:00","","","2015-09-28 12:00:00","","","","","38283");
INSERT INTO trianik_diary VALUES("75561","38294","256","U","N","2015-10-01 12:30:00","","","2015-10-01 16:30:00","","","","","38329");
INSERT INTO trianik_diary VALUES("75562","38247","248","U","N","2015-09-28 18:00:00","","","2015-09-28 19:00:00","","","","","38263");
INSERT INTO trianik_diary VALUES("75565","38247","248","U","N","2015-10-01 18:00:00","","","2015-10-01 19:00:00","","","","","38266");
INSERT INTO trianik_diary VALUES("75566","38247","248","U","N","2015-10-02 18:30:00","","","2015-10-02 19:30:00","","","","","38267");
INSERT INTO trianik_diary VALUES("75567","38310","258","U","N","2015-09-28 11:30:00","","","2015-09-28 14:30:00","","","","","38347");
INSERT INTO trianik_diary VALUES("75568","38248","248","U","N","2015-09-28 19:00:00","","","2015-09-28 22:30:00","","","","","38268");
INSERT INTO trianik_diary VALUES("75569","38248","248","U","N","2015-09-29 16:30:00","","","2015-09-29 20:00:00","","","","","38269");
INSERT INTO trianik_diary VALUES("75570","38248","248","U","N","2015-09-30 19:00:00","","","2015-09-30 22:00:00","","","","","38270");
INSERT INTO trianik_diary VALUES("75571","38248","248","U","N","2015-10-01 19:00:00","","","2015-10-01 22:00:00","","","","","38271");
INSERT INTO trianik_diary VALUES("75572","38248","248","U","N","2015-10-02 15:30:00","","","2015-10-02 18:30:00","","","","","38272");
INSERT INTO trianik_diary VALUES("75573","38286","253","U","N","2015-10-01 09:30:00","","","2015-10-01 12:30:00","","","","","38320");
INSERT INTO trianik_diary VALUES("75574","38264","250","U","N","2015-10-02 11:30:00","","","2015-10-02 15:30:00","","","","","38291");
INSERT INTO trianik_diary VALUES("75575","38272","249","U","N","2015-10-01 11:30:00","","","2015-10-01 13:30:00","","","","","38303");
INSERT INTO trianik_diary VALUES("75576","38304","255","U","N","2015-09-30 09:00:00","","","2015-09-30 11:30:00","","","","","38340");
INSERT INTO trianik_diary VALUES("75577","38289","256","U","N","2015-09-28 09:00:00","","","2015-09-28 12:00:00","","","","","38323");
INSERT INTO trianik_diary VALUES("75578","38289","256","U","N","2015-10-01 09:00:00","","","2015-10-01 12:00:00","","","","","38324");
INSERT INTO trianik_diary VALUES("75579","38257","257","U","N","2015-09-28 09:00:00","","","2015-09-28 11:00:00","","","","","38284");
INSERT INTO trianik_diary VALUES("75580","38327","255","U","N","2015-10-01 18:00:00","","","2015-10-01 19:00:00","","","","","38365");
INSERT INTO trianik_diary VALUES("75581","38315","255","U","N","2015-10-01 09:00:00","","","2015-10-01 11:00:00","","","","","38352");
INSERT INTO trianik_diary VALUES("75582","38329","257","U","N","2015-09-28 13:30:00","","","2015-09-28 15:30:00","","","","","38370");
INSERT INTO trianik_diary VALUES("75583","38300","254","U","N","2015-10-02 12:30:00","","","2015-10-02 14:30:00","","","","","38335");
INSERT INTO trianik_diary VALUES("75584","38260","250","U","N","2015-09-30 09:00:00","","","2015-09-30 11:00:00","","","","","38287");
INSERT INTO trianik_diary VALUES("75588","38261","256","U","N","2015-09-04 08:20:00","","","2015-09-04 20:30:00","","","","","38381");
INSERT INTO trianik_diary VALUES("75589","38261","256","U","N","2015-09-11 08:20:00","","","2015-09-11 20:30:00","","","","","38381");
INSERT INTO trianik_diary VALUES("75590","38261","256","U","N","2015-09-18 08:20:00","","","2015-09-18 20:30:00","","","","","38381");
INSERT INTO trianik_diary VALUES("75591","38277","252","U","N","2015-10-06 09:30:00","","","2015-10-06 11:30:00","","","","","38308");
INSERT INTO trianik_diary VALUES("75592","38277","252","U","N","2015-10-08 09:30:00","","","2015-10-08 11:30:00","","","","","38309");
INSERT INTO trianik_diary VALUES("75593","38274","250","U","N","2015-10-08 09:00:00","","","2015-10-08 12:00:00","","","","","38305");
INSERT INTO trianik_diary VALUES("75594","38317","258","U","N","2015-10-06 11:30:00","","","2015-10-06 13:30:00","","","","","38355");
INSERT INTO trianik_diary VALUES("75595","38309","258","U","N","2015-10-05 09:00:00","","","2015-10-05 10:30:00","","","","","38345");
INSERT INTO trianik_diary VALUES("75596","38309","258","U","N","2015-10-09 11:30:00","","","2015-10-09 13:00:00","","","","","38346");
INSERT INTO trianik_diary VALUES("75597","38316","258","U","N","2015-10-06 09:00:00","","","2015-10-06 11:00:00","","","","","38353");
INSERT INTO trianik_diary VALUES("75598","38316","258","U","N","2015-10-09 09:00:00","","","2015-10-09 11:00:00","","","","","38354");
INSERT INTO trianik_diary VALUES("75599","38314","257","U","N","2015-10-09 12:30:00","","","2015-10-09 15:30:00","","","","","38351");
INSERT INTO trianik_diary VALUES("75600","38280","252","U","N","2015-10-08 12:00:00","","","2015-10-08 16:00:00","","","","","38313");
INSERT INTO trianik_diary VALUES("75601","38284","253","U","N","2015-10-06 09:30:00","","","2015-10-06 14:30:00","","","","","38317");
INSERT INTO trianik_diary VALUES("75602","38284","253","U","N","2015-10-08 11:30:00","","","2015-10-08 13:30:00","","","","","38318");
INSERT INTO trianik_diary VALUES("75603","38252","251","U","N","2015-10-05 09:30:00","","","2015-10-05 12:30:00","","","","","38277");
INSERT INTO trianik_diary VALUES("75604","38252","251","U","N","2015-10-07 10:30:00","","","2015-10-07 14:30:00","","","","","38278");
INSERT INTO trianik_diary VALUES("75605","38252","251","U","N","2015-10-09 09:00:00","","","2015-10-09 13:00:00","","","","","38279");
INSERT INTO trianik_diary VALUES("75606","38311","257","U","N","2015-10-05 15:30:00","","","2015-10-05 17:30:00","","","","","38348");
INSERT INTO trianik_diary VALUES("75607","38333","251","U","N","2015-10-09 13:30:00","","","2015-10-09 15:30:00","","","","","38375");
INSERT INTO trianik_diary VALUES("75608","38303","255","U","N","2015-10-06 09:00:00","","","2015-10-06 11:00:00","","","","","38338");
INSERT INTO trianik_diary VALUES("75609","38303","255","U","N","2015-10-08 15:00:00","","","2015-10-08 17:00:00","","","","","38339");
INSERT INTO trianik_diary VALUES("75610","38271","249","U","N","2015-10-07 14:00:00","","","2015-10-07 16:00:00","","","","","38302");
INSERT INTO trianik_diary VALUES("75611","38245","248","U","N","2015-10-05 08:30:00","","","2015-10-05 12:30:00","","","","","38261");
INSERT INTO trianik_diary VALUES("75612","38319","258","U","N","2015-10-08 09:00:00","","","2015-10-08 13:00:00","","","","","38357");
INSERT INTO trianik_diary VALUES("75613","38328","255","U","N","2015-10-06 11:30:00","","","2015-10-06 14:30:00","","","","","38367");
INSERT INTO trianik_diary VALUES("75614","38285","253","U","N","2015-10-07 12:30:00","","","2015-10-07 14:30:00","","","","","38319");
INSERT INTO trianik_diary VALUES("75615","38246","248","U","N","2015-10-05 13:30:00","","","2015-10-05 15:30:00","","","","","38262");
INSERT INTO trianik_diary VALUES("75616","38259","250","U","N","2015-10-06 09:00:00","","","2015-10-06 11:00:00","","","","","38286");
INSERT INTO trianik_diary VALUES("75617","38320","258","U","N","2015-10-08 13:30:00","","","2015-10-08 16:30:00","","","","","38358");
INSERT INTO trianik_diary VALUES("75618","38253","251","U","N","2015-10-05 12:30:00","","","2015-10-05 14:30:00","","","","","38280");
INSERT INTO trianik_diary VALUES("75619","38253","251","U","N","2015-10-08 11:30:00","","","2015-10-08 13:30:00","","","","","38281");
INSERT INTO trianik_diary VALUES("75620","38308","255","U","N","2015-10-09 14:00:00","","","2015-10-09 16:00:00","","","","","38344");
INSERT INTO trianik_diary VALUES("75621","38295","256","U","N","2015-10-09 09:00:00","","","2015-10-09 11:00:00","","","","","38330");
INSERT INTO trianik_diary VALUES("75622","38288","253","U","N","2015-10-09 09:30:00","","","2015-10-09 13:30:00","","","","","38322");
INSERT INTO trianik_diary VALUES("75623","38283","251","U","N","2015-10-08 09:00:00","","","2015-10-08 11:00:00","","","","","38316");
INSERT INTO trianik_diary VALUES("75624","38290","256","U","N","2015-10-05 12:30:00","","","2015-10-05 15:30:00","","","","","38325");
INSERT INTO trianik_diary VALUES("75625","38322","255","U","N","2015-10-08 11:30:00","","","2015-10-08 14:30:00","","","","","38360");
INSERT INTO trianik_diary VALUES("75626","38292","256","U","N","2015-10-06 12:30:00","","","2015-10-06 16:30:00","","","","","38327");
INSERT INTO trianik_diary VALUES("75627","38263","250","U","N","2015-10-08 12:30:00","","","2015-10-08 14:30:00","","","","","38290");
INSERT INTO trianik_diary VALUES("75628","38279","252","U","N","2015-10-06 14:30:00","","","2015-10-06 16:30:00","","","","","38312");
INSERT INTO trianik_diary VALUES("75629","38306","255","U","N","2015-10-07 14:30:00","","","2015-10-07 16:30:00","","","","","38342");
INSERT INTO trianik_diary VALUES("75630","38276","249","U","N","2015-10-09 11:30:00","","","2015-10-09 15:30:00","","","","","38307");
INSERT INTO trianik_diary VALUES("75631","38297","254","U","N","2015-10-06 12:30:00","","","2015-10-06 14:30:00","","","","","38332");
INSERT INTO trianik_diary VALUES("75632","38326","257","U","N","2015-10-09 10:15:00","","","2015-10-09 11:45:00","","","","","38364");
INSERT INTO trianik_diary VALUES("75633","38318","258","U","N","2015-10-07 11:30:00","","","2015-10-07 14:30:00","","","","","38356");
INSERT INTO trianik_diary VALUES("75634","38265","249","U","N","2015-10-05 09:00:00","","","2015-10-05 11:00:00","","","","","38292");
INSERT INTO trianik_diary VALUES("75635","38265","249","U","N","2015-10-06 09:00:00","","","2015-10-06 11:00:00","","","","","38293");
INSERT INTO trianik_diary VALUES("75636","38265","249","U","N","2015-10-07 09:00:00","","","2015-10-07 11:00:00","","","","","38294");
INSERT INTO trianik_diary VALUES("75637","38265","249","U","N","2015-10-08 09:00:00","","","2015-10-08 11:00:00","","","","","38295");
INSERT INTO trianik_diary VALUES("75638","38265","249","U","N","2015-10-09 09:00:00","","","2015-10-09 11:00:00","","","","","38296");
INSERT INTO trianik_diary VALUES("75639","38270","249","U","N","2015-10-07 11:30:00","","","2015-10-07 13:30:00","","","","","38301");
INSERT INTO trianik_diary VALUES("75640","38291","248","U","N","2015-10-06 09:00:00","","","2015-10-06 11:00:00","","","","","38326");
INSERT INTO trianik_diary VALUES("75641","38275","249","U","N","2015-10-08 13:00:00","","","2015-10-08 15:00:00","","","","","38306");
INSERT INTO trianik_diary VALUES("75642","38307","255","U","N","2015-10-09 09:00:00","","","2015-10-09 11:00:00","","","","","38343");
INSERT INTO trianik_diary VALUES("75643","38282","252","U","N","2015-10-09 14:00:00","","","2015-10-09 16:00:00","","","","","38315");
INSERT INTO trianik_diary VALUES("75644","38323","255","U","N","2015-10-05 09:00:00","","","2015-10-05 13:00:00","","","","","38361");
INSERT INTO trianik_diary VALUES("75645","38249","248","U","N","2015-10-06 12:00:00","","","2015-10-06 14:00:00","","","","","38273");
INSERT INTO trianik_diary VALUES("75646","38293","256","U","N","2015-10-07 12:30:00","","","2015-10-07 15:30:00","","","","","38328");
INSERT INTO trianik_diary VALUES("75647","38251","248","U","N","2015-10-06 14:30:00","","","2015-10-06 17:00:00","","","","","38276");
INSERT INTO trianik_diary VALUES("75648","38266","249","U","N","2015-10-05 11:30:00","","","2015-10-05 13:30:00","","","","","38297");
INSERT INTO trianik_diary VALUES("75649","38267","255","U","N","2015-10-09 11:30:00","","","2015-10-09 13:30:00","","","","","38298");
INSERT INTO trianik_diary VALUES("75650","38296","256","U","N","2015-10-09 11:30:00","","","2015-10-09 13:30:00","","","","","38331");
INSERT INTO trianik_diary VALUES("75651","38301","255","U","N","2015-10-05 13:30:00","","","2015-10-05 15:30:00","","","","","38336");
INSERT INTO trianik_diary VALUES("75652","38298","254","U","N","2015-10-05 12:30:00","","","2015-10-05 15:30:00","","","","","38333");
INSERT INTO trianik_diary VALUES("75653","38305","255","U","N","2015-10-07 12:30:00","","","2015-10-07 14:30:00","","","","","38341");
INSERT INTO trianik_diary VALUES("75654","38278","252","U","N","2015-10-06 12:00:00","","","2015-10-06 14:00:00","","","","","38310");
INSERT INTO trianik_diary VALUES("75655","38278","252","U","N","2015-10-09 09:30:00","","","2015-10-09 11:30:00","","","","","38311");
INSERT INTO trianik_diary VALUES("75656","38273","250","U","N","2015-10-06 09:00:00","","","2015-10-06 12:00:00","","","","","38304");
INSERT INTO trianik_diary VALUES("75657","38332","259","U","N","2015-10-06 09:00:00","","","2015-10-06 11:00:00","","","","","38373");
INSERT INTO trianik_diary VALUES("75658","38269","249","U","N","2015-10-06 11:30:00","","","2015-10-06 14:30:00","","","","","38300");
INSERT INTO trianik_diary VALUES("75659","38256","250","U","N","2015-10-05 09:30:00","","","2015-10-05 12:00:00","","","","","38283");
INSERT INTO trianik_diary VALUES("75660","38294","256","U","N","2015-10-08 12:30:00","","","2015-10-08 16:30:00","","","","","38329");
INSERT INTO trianik_diary VALUES("75661","38247","248","U","N","2015-10-05 18:00:00","","","2015-10-05 19:00:00","","","","","38263");
INSERT INTO trianik_diary VALUES("75664","38247","248","U","N","2015-10-08 18:00:00","","","2015-10-08 19:00:00","","","","","38266");
INSERT INTO trianik_diary VALUES("75665","38247","248","U","N","2015-10-09 18:30:00","","","2015-10-09 19:30:00","","","","","38267");
INSERT INTO trianik_diary VALUES("75666","38310","258","U","N","2015-10-05 11:30:00","","","2015-10-05 14:30:00","","","","","38347");
INSERT INTO trianik_diary VALUES("75667","38331","249","U","N","2015-10-07 14:00:00","","","2015-10-07 16:00:00","","","","","38372");
INSERT INTO trianik_diary VALUES("75668","38324","257","U","N","2015-10-05 08:00:00","","","2015-10-05 11:00:00","","","","","38362");
INSERT INTO trianik_diary VALUES("75669","38248","248","U","N","2015-10-05 19:00:00","","","2015-10-05 22:30:00","","","","","38268");
INSERT INTO trianik_diary VALUES("75670","38248","248","U","N","2015-10-06 16:30:00","","","2015-10-06 20:00:00","","","","","38269");
INSERT INTO trianik_diary VALUES("75671","38248","248","U","N","2015-10-07 19:00:00","","","2015-10-07 22:00:00","","","","","38270");
INSERT INTO trianik_diary VALUES("75672","38248","248","U","N","2015-10-08 19:00:00","","","2015-10-08 22:00:00","","","","","38271");
INSERT INTO trianik_diary VALUES("75673","38248","248","U","N","2015-10-09 15:30:00","","","2015-10-09 18:30:00","","","","","38272");
INSERT INTO trianik_diary VALUES("75674","38286","253","U","N","2015-10-08 09:30:00","","","2015-10-08 12:30:00","","","","","38320");
INSERT INTO trianik_diary VALUES("75675","38264","250","U","N","2015-10-09 11:30:00","","","2015-10-09 15:30:00","","","","","38291");
INSERT INTO trianik_diary VALUES("75676","38304","255","U","N","2015-10-07 09:00:00","","","2015-10-07 11:30:00","","","","","38340");
INSERT INTO trianik_diary VALUES("75677","38289","256","U","N","2015-10-05 09:00:00","","","2015-10-05 12:00:00","","","","","38323");
INSERT INTO trianik_diary VALUES("75678","38289","256","U","N","2015-10-08 09:00:00","","","2015-10-08 12:00:00","","","","","38324");
INSERT INTO trianik_diary VALUES("75679","38325","257","U","N","2015-10-09 08:00:00","","","2015-10-09 10:00:00","","","","","38363");
INSERT INTO trianik_diary VALUES("75680","38257","257","U","N","2015-10-05 09:00:00","","","2015-10-05 11:00:00","","","","","38284");
INSERT INTO trianik_diary VALUES("75681","38327","255","U","N","2015-10-08 18:00:00","","","2015-10-08 19:00:00","","","","","38365");
INSERT INTO trianik_diary VALUES("75682","38315","255","U","N","2015-10-08 09:00:00","","","2015-10-08 11:00:00","","","","","38352");
INSERT INTO trianik_diary VALUES("75683","38321","254","U","N","2015-10-08 12:30:00","","","2015-10-08 15:30:00","","","","","38359");
INSERT INTO trianik_diary VALUES("75684","38329","257","U","N","2015-10-05 13:30:00","","","2015-10-05 15:30:00","","","","","38370");
INSERT INTO trianik_diary VALUES("75685","38300","254","U","N","2015-10-09 12:30:00","","","2015-10-09 14:30:00","","","","","38335");
INSERT INTO trianik_diary VALUES("75686","38260","250","U","N","2015-10-07 09:00:00","","","2015-10-07 11:00:00","","","","","38287");
INSERT INTO trianik_diary VALUES("75689","38261","248","U","N","2015-09-25 08:35:00","","","2015-09-25 15:35:00","","","","","38382");
INSERT INTO trianik_diary VALUES("75690","38291","248","U","N","2015-09-01 09:00:00","","","2015-09-01 11:00:00","","","","","38326");
INSERT INTO trianik_diary VALUES("75691","38309","258","U","N","2015-08-31 09:00:00","","","2015-08-31 10:30:00","","","","","38345");
INSERT INTO trianik_diary VALUES("75692","38268","249","U","N","2015-08-31 15:00:00","","","2015-08-31 16:00:00","","","","","38299");
INSERT INTO trianik_diary VALUES("75693","38252","251","U","N","2015-08-31 09:30:00","","","2015-08-31 12:30:00","","","","","38277");
INSERT INTO trianik_diary VALUES("75694","38311","257","U","N","2015-08-31 15:30:00","","","2015-08-31 17:30:00","","","","","38348");
INSERT INTO trianik_diary VALUES("75695","38245","248","U","N","2015-08-31 08:30:00","","","2015-08-31 12:30:00","","","","","38261");
INSERT INTO trianik_diary VALUES("75696","38246","248","U","N","2015-08-31 13:30:00","","","2015-08-31 15:30:00","","","","","38262");
INSERT INTO trianik_diary VALUES("75697","38253","251","U","N","2015-08-31 12:30:00","","","2015-08-31 14:30:00","","","","","38280");
INSERT INTO trianik_diary VALUES("75698","38290","256","U","N","2015-08-31 12:30:00","","","2015-08-31 15:30:00","","","","","38325");
INSERT INTO trianik_diary VALUES("75699","38302","255","U","N","2015-08-31 15:30:00","","","2015-08-31 17:30:00","","","","","38337");
INSERT INTO trianik_diary VALUES("75700","38265","249","U","N","2015-08-31 09:00:00","","","2015-08-31 11:00:00","","","","","38292");
INSERT INTO trianik_diary VALUES("75701","38323","255","U","N","2015-08-31 09:00:00","","","2015-08-31 13:00:00","","","","","38361");
INSERT INTO trianik_diary VALUES("75702","38266","249","U","N","2015-08-31 11:30:00","","","2015-08-31 13:30:00","","","","","38297");
INSERT INTO trianik_diary VALUES("75703","38301","255","U","N","2015-08-31 13:30:00","","","2015-08-31 15:30:00","","","","","38336");
INSERT INTO trianik_diary VALUES("75704","38298","254","U","N","2015-08-31 12:30:00","","","2015-08-31 15:30:00","","","","","38333");
INSERT INTO trianik_diary VALUES("75705","38256","250","U","N","2015-08-31 09:30:00","","","2015-08-31 12:00:00","","","","","38283");
INSERT INTO trianik_diary VALUES("75706","38247","248","U","N","2015-08-31 18:00:00","","","2015-08-31 19:00:00","","","","","38263");
INSERT INTO trianik_diary VALUES("75707","38310","258","U","N","2015-08-31 11:30:00","","","2015-08-31 14:30:00","","","","","38347");
INSERT INTO trianik_diary VALUES("75708","38248","248","U","N","2015-08-31 19:00:00","","","2015-08-31 22:30:00","","","","","38268");
INSERT INTO trianik_diary VALUES("75709","38289","256","U","N","2015-08-31 09:00:00","","","2015-08-31 12:00:00","","","","","38323");
INSERT INTO trianik_diary VALUES("75710","38257","257","U","N","2015-08-31 09:00:00","","","2015-08-31 11:00:00","","","","","38284");
INSERT INTO trianik_diary VALUES("75711","38329","257","U","N","2015-08-31 13:30:00","","","2015-08-31 15:30:00","","","","","38370");
INSERT INTO trianik_diary VALUES("75712","38277","252","U","N","2015-08-25 09:30:00","","","2015-08-25 11:30:00","","","","","38308");
INSERT INTO trianik_diary VALUES("75713","38277","252","U","N","2015-08-27 09:30:00","","","2015-08-27 11:30:00","","","","","38309");
INSERT INTO trianik_diary VALUES("75714","38274","250","U","N","2015-08-27 09:00:00","","","2015-08-27 12:00:00","","","","","38305");
INSERT INTO trianik_diary VALUES("75715","38317","258","U","N","2015-08-25 11:30:00","","","2015-08-25 13:30:00","","","","","38355");
INSERT INTO trianik_diary VALUES("75716","38309","258","U","N","2015-08-28 11:30:00","","","2015-08-28 13:00:00","","","","","38346");
INSERT INTO trianik_diary VALUES("75717","38316","258","U","N","2015-08-25 09:00:00","","","2015-08-25 11:00:00","","","","","38353");
INSERT INTO trianik_diary VALUES("75718","38316","258","U","N","2015-08-28 09:00:00","","","2015-08-28 11:00:00","","","","","38354");
INSERT INTO trianik_diary VALUES("75719","38314","257","U","N","2015-08-28 12:30:00","","","2015-08-28 15:30:00","","","","","38351");
INSERT INTO trianik_diary VALUES("75720","38280","252","U","N","2015-08-27 12:00:00","","","2015-08-27 16:00:00","","","","","38313");
INSERT INTO trianik_diary VALUES("75721","38284","253","U","N","2015-08-25 09:30:00","","","2015-08-25 14:30:00","","","","","38317");
INSERT INTO trianik_diary VALUES("75722","38284","253","U","N","2015-08-27 11:30:00","","","2015-08-27 13:30:00","","","","","38318");
INSERT INTO trianik_diary VALUES("75723","38252","251","U","N","2015-08-24 09:30:00","","","2015-08-24 12:30:00","","","","","38277");
INSERT INTO trianik_diary VALUES("75724","38252","251","U","N","2015-08-26 10:30:00","","","2015-08-26 14:30:00","","","","","38278");
INSERT INTO trianik_diary VALUES("75725","38252","251","U","N","2015-08-28 09:00:00","","","2015-08-28 13:00:00","","","","","38279");
INSERT INTO trianik_diary VALUES("75726","38333","251","U","N","2015-08-28 13:30:00","","","2015-08-28 15:30:00","","","","","38375");
INSERT INTO trianik_diary VALUES("75727","38303","255","U","N","2015-08-25 09:00:00","","","2015-08-25 11:00:00","","","","","38338");
INSERT INTO trianik_diary VALUES("75728","38303","255","U","N","2015-08-27 15:00:00","","","2015-08-27 17:00:00","","","","","38339");
INSERT INTO trianik_diary VALUES("75729","38271","249","U","N","2015-08-26 14:00:00","","","2015-08-26 16:00:00","","","","","38302");
INSERT INTO trianik_diary VALUES("75730","38245","248","U","N","2015-08-24 08:30:00","","","2015-08-24 12:30:00","","","","","38261");
INSERT INTO trianik_diary VALUES("75731","38319","258","U","N","2015-08-27 09:00:00","","","2015-08-27 13:00:00","","","","","38357");
INSERT INTO trianik_diary VALUES("75732","38285","253","U","N","2015-08-26 12:30:00","","","2015-08-26 14:30:00","","","","","38319");
INSERT INTO trianik_diary VALUES("75733","38246","248","U","N","2015-08-24 13:30:00","","","2015-08-24 15:30:00","","","","","38262");
INSERT INTO trianik_diary VALUES("75734","38259","250","U","N","2015-08-25 09:00:00","","","2015-08-25 11:00:00","","","","","38286");
INSERT INTO trianik_diary VALUES("75735","38320","258","U","N","2015-08-27 13:30:00","","","2015-08-27 16:30:00","","","","","38358");
INSERT INTO trianik_diary VALUES("75736","38253","251","U","N","2015-08-24 12:30:00","","","2015-08-24 14:30:00","","","","","38280");
INSERT INTO trianik_diary VALUES("75737","38253","251","U","N","2015-08-27 11:30:00","","","2015-08-27 13:30:00","","","","","38281");
INSERT INTO trianik_diary VALUES("75738","38308","255","U","N","2015-08-28 14:00:00","","","2015-08-28 16:00:00","","","","","38344");
INSERT INTO trianik_diary VALUES("75739","38295","256","U","N","2015-08-28 09:00:00","","","2015-08-28 11:00:00","","","","","38330");
INSERT INTO trianik_diary VALUES("75740","38288","253","U","N","2015-08-28 09:30:00","","","2015-08-28 13:30:00","","","","","38322");
INSERT INTO trianik_diary VALUES("75741","38283","251","U","N","2015-08-27 09:00:00","","","2015-08-27 11:00:00","","","","","38316");
INSERT INTO trianik_diary VALUES("75742","38290","256","U","N","2015-08-24 12:30:00","","","2015-08-24 15:30:00","","","","","38325");
INSERT INTO trianik_diary VALUES("75743","38322","255","U","N","2015-08-27 11:30:00","","","2015-08-27 14:30:00","","","","","38360");
INSERT INTO trianik_diary VALUES("75744","38292","256","U","N","2015-08-25 12:30:00","","","2015-08-25 16:30:00","","","","","38327");
INSERT INTO trianik_diary VALUES("75745","38263","250","U","N","2015-08-27 12:30:00","","","2015-08-27 14:30:00","","","","","38290");
INSERT INTO trianik_diary VALUES("75746","38279","252","U","N","2015-08-25 14:30:00","","","2015-08-25 16:30:00","","","","","38312");
INSERT INTO trianik_diary VALUES("75747","38306","255","U","N","2015-08-26 14:30:00","","","2015-08-26 16:30:00","","","","","38342");
INSERT INTO trianik_diary VALUES("75748","38276","249","U","N","2015-08-28 11:30:00","","","2015-08-28 15:30:00","","","","","38307");
INSERT INTO trianik_diary VALUES("75749","38297","254","U","N","2015-08-25 12:30:00","","","2015-08-25 14:30:00","","","","","38332");
INSERT INTO trianik_diary VALUES("75750","38326","257","U","N","2015-08-28 10:15:00","","","2015-08-28 11:45:00","","","","","38364");
INSERT INTO trianik_diary VALUES("75751","38318","258","U","N","2015-08-26 11:30:00","","","2015-08-26 14:30:00","","","","","38356");
INSERT INTO trianik_diary VALUES("75752","38265","249","U","N","2015-08-24 09:00:00","","","2015-08-24 11:00:00","","","","","38292");
INSERT INTO trianik_diary VALUES("75753","38265","249","U","N","2015-08-25 09:00:00","","","2015-08-25 11:00:00","","","","","38293");
INSERT INTO trianik_diary VALUES("75754","38265","249","U","N","2015-08-26 09:00:00","","","2015-08-26 11:00:00","","","","","38294");
INSERT INTO trianik_diary VALUES("75755","38265","249","U","N","2015-08-27 09:00:00","","","2015-08-27 11:00:00","","","","","38295");
INSERT INTO trianik_diary VALUES("75756","38265","249","U","N","2015-08-28 09:00:00","","","2015-08-28 11:00:00","","","","","38296");
INSERT INTO trianik_diary VALUES("75757","38291","248","U","N","2015-08-25 09:00:00","","","2015-08-25 11:00:00","","","","","38326");
INSERT INTO trianik_diary VALUES("75758","38275","249","U","N","2015-08-27 13:00:00","","","2015-08-27 15:00:00","","","","","38306");
INSERT INTO trianik_diary VALUES("75759","38307","255","U","N","2015-08-28 09:00:00","","","2015-08-28 11:00:00","","","","","38343");
INSERT INTO trianik_diary VALUES("75760","38282","252","U","N","2015-08-28 14:00:00","","","2015-08-28 16:00:00","","","","","38315");
INSERT INTO trianik_diary VALUES("75761","38249","248","U","N","2015-08-25 12:00:00","","","2015-08-25 14:00:00","","","","","38273");
INSERT INTO trianik_diary VALUES("75762","38293","256","U","N","2015-08-26 12:30:00","","","2015-08-26 15:30:00","","","","","38328");
INSERT INTO trianik_diary VALUES("75763","38266","249","U","N","2015-08-24 11:30:00","","","2015-08-24 13:30:00","","","","","38297");
INSERT INTO trianik_diary VALUES("75764","38267","255","U","N","2015-08-28 11:30:00","","","2015-08-28 13:30:00","","","","","38298");
INSERT INTO trianik_diary VALUES("75765","38296","256","U","N","2015-08-28 11:30:00","","","2015-08-28 13:30:00","","","","","38331");
INSERT INTO trianik_diary VALUES("75766","38301","255","U","N","2015-08-24 13:30:00","","","2015-08-24 15:30:00","","","","","38336");
INSERT INTO trianik_diary VALUES("75767","38298","254","U","N","2015-08-24 12:30:00","","","2015-08-24 15:30:00","","","","","38333");
INSERT INTO trianik_diary VALUES("75768","38305","255","U","N","2015-08-26 12:30:00","","","2015-08-26 14:30:00","","","","","38341");
INSERT INTO trianik_diary VALUES("75769","38278","252","U","N","2015-08-25 12:00:00","","","2015-08-25 14:00:00","","","","","38310");
INSERT INTO trianik_diary VALUES("75770","38278","252","U","N","2015-08-28 09:30:00","","","2015-08-28 11:30:00","","","","","38311");
INSERT INTO trianik_diary VALUES("75771","38273","250","U","N","2015-08-25 09:00:00","","","2015-08-25 12:00:00","","","","","38304");
INSERT INTO trianik_diary VALUES("75772","38269","249","U","N","2015-08-25 11:30:00","","","2015-08-25 14:30:00","","","","","38300");
INSERT INTO trianik_diary VALUES("75773","38256","250","U","N","2015-08-24 09:30:00","","","2015-08-24 12:00:00","","","","","38283");
INSERT INTO trianik_diary VALUES("75774","38294","256","U","N","2015-08-27 12:30:00","","","2015-08-27 16:30:00","","","","","38329");
INSERT INTO trianik_diary VALUES("75775","38247","248","U","N","2015-08-24 18:00:00","","","2015-08-24 19:00:00","","","","","38263");
INSERT INTO trianik_diary VALUES("75778","38247","248","U","N","2015-08-27 18:00:00","","","2015-08-27 19:00:00","","","","","38266");
INSERT INTO trianik_diary VALUES("75779","38247","248","U","N","2015-08-28 18:30:00","","","2015-08-28 19:30:00","","","","","38267");
INSERT INTO trianik_diary VALUES("75780","38248","248","U","N","2015-08-24 19:00:00","","","2015-08-24 22:30:00","","","","","38268");
INSERT INTO trianik_diary VALUES("75781","38248","248","U","N","2015-08-25 16:30:00","","","2015-08-25 20:00:00","","","","","38269");
INSERT INTO trianik_diary VALUES("75782","38248","248","U","N","2015-08-26 19:00:00","","","2015-08-26 22:00:00","","","","","38270");
INSERT INTO trianik_diary VALUES("75783","38248","248","U","N","2015-08-27 19:00:00","","","2015-08-27 22:00:00","","","","","38271");
INSERT INTO trianik_diary VALUES("75784","38248","248","U","N","2015-08-28 15:30:00","","","2015-08-28 18:30:00","","","","","38272");
INSERT INTO trianik_diary VALUES("75785","38286","253","U","N","2015-08-27 09:30:00","","","2015-08-27 12:30:00","","","","","38320");
INSERT INTO trianik_diary VALUES("75786","38264","250","U","N","2015-08-28 11:30:00","","","2015-08-28 15:30:00","","","","","38291");
INSERT INTO trianik_diary VALUES("75787","38304","255","U","N","2015-08-26 09:00:00","","","2015-08-26 11:30:00","","","","","38340");
INSERT INTO trianik_diary VALUES("75788","38289","256","U","N","2015-08-24 09:00:00","","","2015-08-24 12:00:00","","","","","38323");
INSERT INTO trianik_diary VALUES("75789","38289","256","U","N","2015-08-27 09:00:00","","","2015-08-27 12:00:00","","","","","38324");
INSERT INTO trianik_diary VALUES("75790","38325","257","U","N","2015-08-28 08:00:00","","","2015-08-28 10:00:00","","","","","38363");
INSERT INTO trianik_diary VALUES("75791","38257","257","U","N","2015-08-24 09:00:00","","","2015-08-24 11:00:00","","","","","38284");
INSERT INTO trianik_diary VALUES("75792","38327","255","U","N","2015-08-27 18:00:00","","","2015-08-27 19:00:00","","","","","38365");
INSERT INTO trianik_diary VALUES("75793","38315","255","U","N","2015-08-27 09:00:00","","","2015-08-27 11:00:00","","","","","38352");
INSERT INTO trianik_diary VALUES("75794","38321","254","U","N","2015-08-27 12:30:00","","","2015-08-27 15:30:00","","","","","38359");
INSERT INTO trianik_diary VALUES("75795","38329","257","U","N","2015-08-24 13:30:00","","","2015-08-24 15:30:00","","","","","38370");
INSERT INTO trianik_diary VALUES("75796","38300","254","U","N","2015-08-28 12:30:00","","","2015-08-28 14:30:00","","","","","38335");
INSERT INTO trianik_diary VALUES("75797","38260","250","U","N","2015-08-26 09:00:00","","","2015-08-26 11:00:00","","","","","38287");
INSERT INTO trianik_diary VALUES("75800","38321","254","U","N","2015-08-13 12:30:00","","","2015-08-13 15:30:00","","","","","38359");
INSERT INTO trianik_diary VALUES("75805","38261","250","U","N","2015-09-03 08:25:00","","","2015-09-03 13:20:00","","","","","38380");
INSERT INTO trianik_diary VALUES("75808","38261","248","U","N","2015-09-02 10:00:00","","","2015-09-02 13:00:00","","","","","38288");
INSERT INTO trianik_diary VALUES("75809","38261","248","U","N","2015-09-30 09:00:00","","","2015-09-30 13:00:00","","","","","38288");
INSERT INTO trianik_diary VALUES("75810","38261","250","U","N","2015-10-01 08:25:00","","","2015-10-01 13:20:00","","","","","38380");
INSERT INTO trianik_diary VALUES("75811","38261","248","U","N","2015-10-02 08:35:00","","","2015-10-02 15:35:00","","","","","38382");
INSERT INTO trianik_diary VALUES("75812","38261","248","U","N","2015-10-07 09:00:00","","","2015-10-07 13:00:00","","","","","38288");
INSERT INTO trianik_diary VALUES("75813","38261","250","U","N","2015-10-08 08:25:00","","","2015-10-08 13:20:00","","","","","38380");
INSERT INTO trianik_diary VALUES("75814","38261","248","U","N","2015-10-09 08:35:00","","","2015-10-09 15:35:00","","","","","38382");
INSERT INTO trianik_diary VALUES("75815","38277","252","U","N","2015-10-13 09:30:00","","","2015-10-13 11:30:00","","","","","38308");
INSERT INTO trianik_diary VALUES("75816","38277","252","U","N","2015-10-15 09:30:00","","","2015-10-15 11:30:00","","","","","38309");
INSERT INTO trianik_diary VALUES("75817","38317","258","U","N","2015-10-13 11:30:00","","","2015-10-13 13:30:00","","","","","38355");
INSERT INTO trianik_diary VALUES("75818","38309","258","U","N","2015-10-12 09:00:00","","","2015-10-12 10:30:00","","","","","38345");
INSERT INTO trianik_diary VALUES("75819","38309","258","U","N","2015-10-16 11:30:00","","","2015-10-16 13:00:00","","","","","38346");
INSERT INTO trianik_diary VALUES("75820","38316","258","U","N","2015-10-13 09:00:00","","","2015-10-13 11:00:00","","","","","38353");
INSERT INTO trianik_diary VALUES("75821","38316","258","U","N","2015-10-16 09:00:00","","","2015-10-16 11:00:00","","","","","38354");
INSERT INTO trianik_diary VALUES("75822","38314","257","U","N","2015-10-16 12:30:00","","","2015-10-16 15:30:00","","","","","38351");
INSERT INTO trianik_diary VALUES("75823","38268","249","U","N","2015-10-12 15:00:00","","","2015-10-12 16:00:00","","","","","38299");
INSERT INTO trianik_diary VALUES("75824","38280","252","U","N","2015-10-15 12:00:00","","","2015-10-15 16:00:00","","","","","38313");
INSERT INTO trianik_diary VALUES("75825","38284","253","U","N","2015-10-13 09:30:00","","","2015-10-13 14:30:00","","","","","38317");
INSERT INTO trianik_diary VALUES("75826","38284","253","U","N","2015-10-15 11:30:00","","","2015-10-15 13:30:00","","","","","38318");
INSERT INTO trianik_diary VALUES("75827","38252","251","U","N","2015-10-12 09:30:00","","","2015-10-12 12:30:00","","","","","38277");
INSERT INTO trianik_diary VALUES("75828","38252","251","U","N","2015-10-14 10:30:00","","","2015-10-14 14:30:00","","","","","38278");
INSERT INTO trianik_diary VALUES("75829","38252","251","U","N","2015-10-16 09:00:00","","","2015-10-16 13:00:00","","","","","38279");
INSERT INTO trianik_diary VALUES("75830","38311","257","U","N","2015-10-12 15:30:00","","","2015-10-12 17:30:00","","","","","38348");
INSERT INTO trianik_diary VALUES("75831","38333","251","U","N","2015-10-16 13:30:00","","","2015-10-16 15:30:00","","","","","38375");
INSERT INTO trianik_diary VALUES("75832","38303","255","U","N","2015-10-13 09:00:00","","","2015-10-13 11:00:00","","","","","38338");
INSERT INTO trianik_diary VALUES("75833","38303","255","U","N","2015-10-15 15:00:00","","","2015-10-15 17:00:00","","","","","38339");
INSERT INTO trianik_diary VALUES("75834","38281","252","U","N","2015-10-16 12:00:00","","","2015-10-16 14:00:00","","","","","38314");
INSERT INTO trianik_diary VALUES("75835","38287","253","U","N","2015-10-16 09:30:00","","","2015-10-16 13:00:00","","","","","38321");
INSERT INTO trianik_diary VALUES("75836","38245","248","U","N","2015-10-12 08:30:00","","","2015-10-12 12:30:00","","","","","38261");
INSERT INTO trianik_diary VALUES("75837","38319","258","U","N","2015-10-15 09:00:00","","","2015-10-15 13:00:00","","","","","38357");
INSERT INTO trianik_diary VALUES("75838","38328","255","U","N","2015-10-13 11:30:00","","","2015-10-13 14:30:00","","","","","38368");
INSERT INTO trianik_diary VALUES("75839","38285","253","U","N","2015-10-14 12:30:00","","","2015-10-14 14:30:00","","","","","38319");
INSERT INTO trianik_diary VALUES("75840","38246","248","U","N","2015-10-12 13:30:00","","","2015-10-12 15:30:00","","","","","38262");
INSERT INTO trianik_diary VALUES("75841","38259","250","U","N","2015-10-13 09:00:00","","","2015-10-13 11:00:00","","","","","38286");
INSERT INTO trianik_diary VALUES("75842","38255","251","U","N","2015-10-14 09:00:00","","","2015-10-14 10:30:00","","","","","38282");
INSERT INTO trianik_diary VALUES("75843","38250","248","U","N","2015-10-13 14:30:00","","","2015-10-13 16:30:00","","","","","38274");
INSERT INTO trianik_diary VALUES("75844","38320","258","U","N","2015-10-15 13:30:00","","","2015-10-15 16:30:00","","","","","38358");
INSERT INTO trianik_diary VALUES("75845","38313","255","U","N","2015-10-16 16:00:00","","","2015-10-16 18:00:00","","","","","38350");
INSERT INTO trianik_diary VALUES("75846","38253","251","U","N","2015-10-12 12:30:00","","","2015-10-12 14:30:00","","","","","38280");
INSERT INTO trianik_diary VALUES("75847","38253","251","U","N","2015-10-15 11:30:00","","","2015-10-15 13:30:00","","","","","38281");
INSERT INTO trianik_diary VALUES("75848","38308","255","U","N","2015-10-16 14:00:00","","","2015-10-16 16:00:00","","","","","38344");
INSERT INTO trianik_diary VALUES("75849","38295","256","U","N","2015-10-16 09:00:00","","","2015-10-16 11:00:00","","","","","38330");
INSERT INTO trianik_diary VALUES("75850","38283","251","U","N","2015-10-15 09:00:00","","","2015-10-15 11:00:00","","","","","38316");
INSERT INTO trianik_diary VALUES("75851","38290","256","U","N","2015-10-12 12:30:00","","","2015-10-12 15:30:00","","","","","38325");
INSERT INTO trianik_diary VALUES("75852","38322","255","U","N","2015-10-15 11:30:00","","","2015-10-15 14:30:00","","","","","38360");
INSERT INTO trianik_diary VALUES("75853","38292","256","U","N","2015-10-13 12:30:00","","","2015-10-13 16:30:00","","","","","38327");
INSERT INTO trianik_diary VALUES("75854","38263","250","U","N","2015-10-15 12:30:00","","","2015-10-15 14:30:00","","","","","38290");
INSERT INTO trianik_diary VALUES("75855","38279","252","U","N","2015-10-13 14:30:00","","","2015-10-13 16:30:00","","","","","38312");
INSERT INTO trianik_diary VALUES("75856","38258","250","U","N","2015-10-13 09:00:00","","","2015-10-13 11:00:00","","","","","38285");
INSERT INTO trianik_diary VALUES("75857","38306","255","U","N","2015-10-14 14:30:00","","","2015-10-14 16:30:00","","","","","38342");
INSERT INTO trianik_diary VALUES("75858","38276","249","U","N","2015-10-16 11:30:00","","","2015-10-16 15:30:00","","","","","38307");
INSERT INTO trianik_diary VALUES("75859","38297","254","U","N","2015-10-13 12:30:00","","","2015-10-13 14:30:00","","","","","38332");
INSERT INTO trianik_diary VALUES("75860","38318","258","U","N","2015-10-14 11:30:00","","","2015-10-14 14:30:00","","","","","38356");
INSERT INTO trianik_diary VALUES("75861","38302","255","U","N","2015-10-12 15:30:00","","","2015-10-12 17:30:00","","","","","38337");
INSERT INTO trianik_diary VALUES("75862","38299","254","U","N","2015-10-15 12:30:00","","","2015-10-15 14:30:00","","","","","38334");
INSERT INTO trianik_diary VALUES("75863","38265","249","U","N","2015-10-12 09:00:00","","","2015-10-12 11:00:00","","","","","38292");
INSERT INTO trianik_diary VALUES("75864","38265","249","U","N","2015-10-13 09:00:00","","","2015-10-13 11:00:00","","","","","38293");
INSERT INTO trianik_diary VALUES("75865","38265","249","U","N","2015-10-14 09:00:00","","","2015-10-14 11:00:00","","","","","38294");
INSERT INTO trianik_diary VALUES("75866","38265","249","U","N","2015-10-15 09:00:00","","","2015-10-15 11:00:00","","","","","38295");
INSERT INTO trianik_diary VALUES("75867","38265","249","U","N","2015-10-16 09:00:00","","","2015-10-16 11:00:00","","","","","38296");
INSERT INTO trianik_diary VALUES("75868","38330","257","U","N","2015-10-12 11:15:00","","","2015-10-12 13:45:00","","","","","38371");
INSERT INTO trianik_diary VALUES("75869","38291","248","U","N","2015-10-13 09:00:00","","","2015-10-13 11:00:00","","","","","38326");
INSERT INTO trianik_diary VALUES("75870","38275","249","U","N","2015-10-15 13:00:00","","","2015-10-15 15:00:00","","","","","38306");
INSERT INTO trianik_diary VALUES("75871","38307","255","U","N","2015-10-16 09:00:00","","","2015-10-16 11:00:00","","","","","38343");
INSERT INTO trianik_diary VALUES("75872","38282","252","U","N","2015-10-16 14:00:00","","","2015-10-16 16:00:00","","","","","38315");
INSERT INTO trianik_diary VALUES("75873","38312","257","U","N","2015-10-16 09:00:00","","","2015-10-16 13:00:00","","","","","38349");
INSERT INTO trianik_diary VALUES("75874","38323","255","U","N","2015-10-12 09:00:00","","","2015-10-12 13:00:00","","","","","38361");
INSERT INTO trianik_diary VALUES("75875","38249","248","U","N","2015-10-13 12:00:00","","","2015-10-13 14:00:00","","","","","38273");
INSERT INTO trianik_diary VALUES("75876","38293","256","U","N","2015-10-14 12:30:00","","","2015-10-14 15:30:00","","","","","38328");
INSERT INTO trianik_diary VALUES("75877","38266","249","U","N","2015-10-12 11:30:00","","","2015-10-12 13:30:00","","","","","38297");
INSERT INTO trianik_diary VALUES("75878","38267","255","U","N","2015-10-16 11:30:00","","","2015-10-16 13:30:00","","","","","38298");
INSERT INTO trianik_diary VALUES("75879","38296","256","U","N","2015-10-16 11:30:00","","","2015-10-16 13:30:00","","","","","38331");
INSERT INTO trianik_diary VALUES("75880","38301","255","U","N","2015-10-12 13:30:00","","","2015-10-12 15:30:00","","","","","38336");
INSERT INTO trianik_diary VALUES("75881","38298","254","U","N","2015-10-12 12:30:00","","","2015-10-12 15:30:00","","","","","38333");
INSERT INTO trianik_diary VALUES("75882","38262","250","U","N","2015-10-15 09:00:00","","","2015-10-15 12:00:00","","","","","38289");
INSERT INTO trianik_diary VALUES("75883","38305","255","U","N","2015-10-14 12:30:00","","","2015-10-14 14:30:00","","","","","38341");
INSERT INTO trianik_diary VALUES("75884","38278","252","U","N","2015-10-13 12:00:00","","","2015-10-13 14:00:00","","","","","38310");
INSERT INTO trianik_diary VALUES("75885","38278","252","U","N","2015-10-16 09:30:00","","","2015-10-16 11:30:00","","","","","38311");
INSERT INTO trianik_diary VALUES("75886","38269","249","U","N","2015-10-13 11:30:00","","","2015-10-13 14:30:00","","","","","38300");
INSERT INTO trianik_diary VALUES("75887","38256","250","U","N","2015-10-12 09:30:00","","","2015-10-12 12:00:00","","","","","38283");
INSERT INTO trianik_diary VALUES("75888","38294","256","U","N","2015-10-15 12:30:00","","","2015-10-15 16:30:00","","","","","38329");
INSERT INTO trianik_diary VALUES("75889","38247","248","U","N","2015-10-12 18:00:00","","","2015-10-12 19:00:00","","","","","38263");
INSERT INTO trianik_diary VALUES("75892","38247","248","U","N","2015-10-15 18:00:00","","","2015-10-15 19:00:00","","","","","38266");
INSERT INTO trianik_diary VALUES("75893","38247","248","U","N","2015-10-16 18:30:00","","","2015-10-16 19:30:00","","","","","38267");
INSERT INTO trianik_diary VALUES("75894","38310","258","U","N","2015-10-12 11:30:00","","","2015-10-12 14:30:00","","","","","38347");
INSERT INTO trianik_diary VALUES("75895","38248","248","U","N","2015-10-12 19:00:00","","","2015-10-12 22:30:00","","","","","38268");
INSERT INTO trianik_diary VALUES("75896","38248","248","U","N","2015-10-13 16:30:00","","","2015-10-13 20:00:00","","","","","38269");
INSERT INTO trianik_diary VALUES("75897","38248","248","U","N","2015-10-14 19:00:00","","","2015-10-14 22:00:00","","","","","38270");
INSERT INTO trianik_diary VALUES("75898","38248","248","U","N","2015-10-15 19:00:00","","","2015-10-15 22:00:00","","","","","38271");
INSERT INTO trianik_diary VALUES("75899","38248","248","U","N","2015-10-16 15:30:00","","","2015-10-16 18:30:00","","","","","38272");
INSERT INTO trianik_diary VALUES("75900","38286","253","U","N","2015-10-15 09:30:00","","","2015-10-15 12:30:00","","","","","38320");
INSERT INTO trianik_diary VALUES("75901","38264","250","U","N","2015-10-16 11:30:00","","","2015-10-16 15:30:00","","","","","38291");
INSERT INTO trianik_diary VALUES("75902","38272","249","U","N","2015-10-15 11:30:00","","","2015-10-15 13:30:00","","","","","38303");
INSERT INTO trianik_diary VALUES("75903","38304","255","U","N","2015-10-14 09:00:00","","","2015-10-14 11:30:00","","","","","38340");
INSERT INTO trianik_diary VALUES("75904","38289","256","U","N","2015-10-12 09:00:00","","","2015-10-12 12:00:00","","","","","38323");
INSERT INTO trianik_diary VALUES("75905","38289","256","U","N","2015-10-15 09:00:00","","","2015-10-15 12:00:00","","","","","38324");
INSERT INTO trianik_diary VALUES("75906","38257","257","U","N","2015-10-12 09:00:00","","","2015-10-12 11:00:00","","","","","38284");
INSERT INTO trianik_diary VALUES("75907","38327","255","U","N","2015-10-15 18:00:00","","","2015-10-15 19:00:00","","","","","38365");
INSERT INTO trianik_diary VALUES("75908","38315","255","U","N","2015-10-15 09:00:00","","","2015-10-15 11:00:00","","","","","38352");
INSERT INTO trianik_diary VALUES("75909","38329","257","U","N","2015-10-12 13:30:00","","","2015-10-12 15:30:00","","","","","38370");
INSERT INTO trianik_diary VALUES("75910","38300","254","U","N","2015-10-16 12:30:00","","","2015-10-16 14:30:00","","","","","38335");
INSERT INTO trianik_diary VALUES("75911","38260","250","U","N","2015-10-14 09:00:00","","","2015-10-14 11:00:00","","","","","38287");
INSERT INTO trianik_diary VALUES("75912","38261","248","U","N","2015-10-14 09:00:00","","","2015-10-14 13:00:00","","","","","38288");
INSERT INTO trianik_diary VALUES("75913","38261","250","U","N","2015-10-15 08:25:00","","","2015-10-15 13:20:00","","","","","38380");
INSERT INTO trianik_diary VALUES("75914","38261","248","U","N","2015-10-16 08:35:00","","","2015-10-16 15:35:00","","","","","38382");
INSERT INTO trianik_diary VALUES("75915","38277","252","U","N","2015-11-03 09:30:00","","","2015-11-03 11:30:00","","","","","38308");
INSERT INTO trianik_diary VALUES("75916","38277","252","U","N","2015-11-05 09:30:00","","","2015-11-05 11:30:00","","","","","38309");
INSERT INTO trianik_diary VALUES("75917","38274","250","U","N","2015-11-05 09:00:00","","","2015-11-05 12:00:00","","","","","38305");
INSERT INTO trianik_diary VALUES("75918","38317","258","U","N","2015-11-03 11:30:00","","","2015-11-03 13:30:00","","","","","38355");
INSERT INTO trianik_diary VALUES("75919","38309","258","U","N","2015-11-02 09:00:00","","","2015-11-02 10:30:00","","","","","38345");
INSERT INTO trianik_diary VALUES("75920","38309","258","U","N","2015-11-06 11:30:00","","","2015-11-06 13:00:00","","","","","38346");
INSERT INTO trianik_diary VALUES("75921","38316","258","U","N","2015-11-03 09:00:00","","","2015-11-03 11:00:00","","","","","38353");
INSERT INTO trianik_diary VALUES("75922","38316","258","U","N","2015-11-06 09:00:00","","","2015-11-06 11:00:00","","","","","38354");
INSERT INTO trianik_diary VALUES("75923","38314","257","U","N","2015-11-06 12:30:00","","","2015-11-06 15:30:00","","","","","38351");
INSERT INTO trianik_diary VALUES("75924","38280","252","U","N","2015-11-05 12:00:00","","","2015-11-05 16:00:00","","","","","38313");
INSERT INTO trianik_diary VALUES("75925","38284","253","U","N","2015-11-03 09:30:00","","","2015-11-03 14:30:00","","","","","38317");
INSERT INTO trianik_diary VALUES("75926","38284","253","U","N","2015-11-05 11:30:00","","","2015-11-05 13:30:00","","","","","38318");
INSERT INTO trianik_diary VALUES("75927","38252","251","U","N","2015-11-02 09:30:00","","","2015-11-02 12:30:00","","","","","38277");
INSERT INTO trianik_diary VALUES("75928","38252","251","U","N","2015-11-04 10:30:00","","","2015-11-04 14:30:00","","","","","38278");
INSERT INTO trianik_diary VALUES("75929","38252","251","U","N","2015-11-06 09:00:00","","","2015-11-06 13:00:00","","","","","38279");
INSERT INTO trianik_diary VALUES("75930","38311","257","U","N","2015-11-02 15:30:00","","","2015-11-02 17:30:00","","","","","38348");
INSERT INTO trianik_diary VALUES("75931","38333","251","U","N","2015-11-06 13:30:00","","","2015-11-06 15:30:00","","","","","38375");
INSERT INTO trianik_diary VALUES("75932","38303","255","U","N","2015-11-03 09:00:00","","","2015-11-03 11:00:00","","","","","38338");
INSERT INTO trianik_diary VALUES("75933","38303","255","U","N","2015-11-05 15:00:00","","","2015-11-05 17:00:00","","","","","38339");
INSERT INTO trianik_diary VALUES("75934","38271","249","U","N","2015-11-04 14:00:00","","","2015-11-04 16:00:00","","","","","38302");
INSERT INTO trianik_diary VALUES("75935","38245","248","U","N","2015-11-02 08:30:00","","","2015-11-02 12:30:00","","","","","38261");
INSERT INTO trianik_diary VALUES("75936","38319","258","U","N","2015-11-05 09:00:00","","","2015-11-05 13:00:00","","","","","38357");
INSERT INTO trianik_diary VALUES("75937","38285","253","U","N","2015-11-04 12:30:00","","","2015-11-04 14:30:00","","","","","38319");
INSERT INTO trianik_diary VALUES("75938","38246","248","U","N","2015-11-02 13:30:00","","","2015-11-02 15:30:00","","","","","38262");
INSERT INTO trianik_diary VALUES("75939","38259","250","U","N","2015-11-03 09:00:00","","","2015-11-03 11:00:00","","","","","38286");
INSERT INTO trianik_diary VALUES("75940","38320","258","U","N","2015-11-05 13:30:00","","","2015-11-05 16:30:00","","","","","38358");
INSERT INTO trianik_diary VALUES("75941","38253","251","U","N","2015-11-02 12:30:00","","","2015-11-02 14:30:00","","","","","38280");
INSERT INTO trianik_diary VALUES("75942","38253","251","U","N","2015-11-05 11:30:00","","","2015-11-05 13:30:00","","","","","38281");
INSERT INTO trianik_diary VALUES("75943","38308","255","U","N","2015-11-06 14:00:00","","","2015-11-06 16:00:00","","","","","38344");
INSERT INTO trianik_diary VALUES("75944","38295","256","U","N","2015-11-06 09:00:00","","","2015-11-06 11:00:00","","","","","38330");
INSERT INTO trianik_diary VALUES("75945","38288","253","U","N","2015-11-06 09:30:00","","","2015-11-06 13:30:00","","","","","38322");
INSERT INTO trianik_diary VALUES("75946","38283","251","U","N","2015-11-05 09:00:00","","","2015-11-05 11:00:00","","","","","38316");
INSERT INTO trianik_diary VALUES("75947","38290","256","U","N","2015-11-02 12:30:00","","","2015-11-02 15:30:00","","","","","38325");
INSERT INTO trianik_diary VALUES("75948","38322","255","U","N","2015-11-05 11:30:00","","","2015-11-05 14:30:00","","","","","38360");
INSERT INTO trianik_diary VALUES("75949","38292","256","U","N","2015-11-03 12:30:00","","","2015-11-03 16:30:00","","","","","38327");
INSERT INTO trianik_diary VALUES("75950","38263","250","U","N","2015-11-05 12:30:00","","","2015-11-05 14:30:00","","","","","38290");
INSERT INTO trianik_diary VALUES("75951","38279","252","U","N","2015-11-03 14:30:00","","","2015-11-03 16:30:00","","","","","38312");
INSERT INTO trianik_diary VALUES("75952","38306","255","U","N","2015-11-04 14:30:00","","","2015-11-04 16:30:00","","","","","38342");
INSERT INTO trianik_diary VALUES("75953","38276","249","U","N","2015-11-06 11:30:00","","","2015-11-06 15:30:00","","","","","38307");
INSERT INTO trianik_diary VALUES("75954","38297","254","U","N","2015-11-03 12:30:00","","","2015-11-03 14:30:00","","","","","38332");
INSERT INTO trianik_diary VALUES("75955","38326","257","U","N","2015-11-06 10:15:00","","","2015-11-06 11:45:00","","","","","38364");
INSERT INTO trianik_diary VALUES("75956","38318","258","U","N","2015-11-04 11:30:00","","","2015-11-04 14:30:00","","","","","38356");
INSERT INTO trianik_diary VALUES("75957","38265","249","U","N","2015-11-02 09:00:00","","","2015-11-02 11:00:00","","","","","38292");
INSERT INTO trianik_diary VALUES("75958","38265","249","U","N","2015-11-03 09:00:00","","","2015-11-03 11:00:00","","","","","38293");
INSERT INTO trianik_diary VALUES("75959","38265","249","U","N","2015-11-04 09:00:00","","","2015-11-04 11:00:00","","","","","38294");
INSERT INTO trianik_diary VALUES("75960","38265","249","U","N","2015-11-05 09:00:00","","","2015-11-05 11:00:00","","","","","38295");
INSERT INTO trianik_diary VALUES("75961","38265","249","U","N","2015-11-06 09:00:00","","","2015-11-06 11:00:00","","","","","38296");
INSERT INTO trianik_diary VALUES("75962","38270","249","U","N","2015-11-04 11:30:00","","","2015-11-04 13:30:00","","","","","38301");
INSERT INTO trianik_diary VALUES("75963","38291","248","U","N","2015-11-03 09:00:00","","","2015-11-03 11:00:00","","","","","38326");
INSERT INTO trianik_diary VALUES("75964","38275","249","U","N","2015-11-05 13:00:00","","","2015-11-05 15:00:00","","","","","38306");
INSERT INTO trianik_diary VALUES("75965","38307","255","U","N","2015-11-06 09:00:00","","","2015-11-06 11:00:00","","","","","38343");
INSERT INTO trianik_diary VALUES("75966","38282","252","U","N","2015-11-06 14:00:00","","","2015-11-06 16:00:00","","","","","38315");
INSERT INTO trianik_diary VALUES("75967","38323","255","U","N","2015-11-02 09:00:00","","","2015-11-02 13:00:00","","","","","38361");
INSERT INTO trianik_diary VALUES("75968","38249","248","U","N","2015-11-03 12:00:00","","","2015-11-03 14:00:00","","","","","38273");
INSERT INTO trianik_diary VALUES("75969","38293","256","U","N","2015-11-04 12:30:00","","","2015-11-04 15:30:00","","","","","38328");
INSERT INTO trianik_diary VALUES("75970","38251","248","U","N","2015-11-03 14:30:00","","","2015-11-03 17:00:00","","","","","38276");
INSERT INTO trianik_diary VALUES("75971","38266","249","U","N","2015-11-02 11:30:00","","","2015-11-02 13:30:00","","","","","38297");
INSERT INTO trianik_diary VALUES("75972","38267","255","U","N","2015-11-06 11:30:00","","","2015-11-06 13:30:00","","","","","38298");
INSERT INTO trianik_diary VALUES("75973","38296","256","U","N","2015-11-06 11:30:00","","","2015-11-06 13:30:00","","","","","38331");
INSERT INTO trianik_diary VALUES("75974","38301","255","U","N","2015-11-02 13:30:00","","","2015-11-02 15:30:00","","","","","38336");
INSERT INTO trianik_diary VALUES("75975","38298","254","U","N","2015-11-02 12:30:00","","","2015-11-02 15:30:00","","","","","38333");
INSERT INTO trianik_diary VALUES("75976","38305","255","U","N","2015-11-04 12:30:00","","","2015-11-04 14:30:00","","","","","38341");
INSERT INTO trianik_diary VALUES("75977","38278","252","U","N","2015-11-03 12:00:00","","","2015-11-03 14:00:00","","","","","38310");
INSERT INTO trianik_diary VALUES("75978","38278","252","U","N","2015-11-06 09:30:00","","","2015-11-06 11:30:00","","","","","38311");
INSERT INTO trianik_diary VALUES("75979","38273","250","U","N","2015-11-03 09:00:00","","","2015-11-03 12:00:00","","","","","38304");
INSERT INTO trianik_diary VALUES("75980","38332","259","U","N","2015-11-03 09:00:00","","","2015-11-03 11:00:00","","","","","38373");
INSERT INTO trianik_diary VALUES("75981","38269","249","U","N","2015-11-03 11:30:00","","","2015-11-03 14:30:00","","","","","38300");
INSERT INTO trianik_diary VALUES("75982","38256","250","U","N","2015-11-02 09:30:00","","","2015-11-02 12:00:00","","","","","38283");
INSERT INTO trianik_diary VALUES("75983","38294","256","U","N","2015-11-05 12:30:00","","","2015-11-05 16:30:00","","","","","38329");
INSERT INTO trianik_diary VALUES("75984","38247","248","U","N","2015-11-02 18:00:00","","","2015-11-02 19:00:00","","","","","38263");
INSERT INTO trianik_diary VALUES("75985","38247","248","U","N","2015-11-05 18:00:00","","","2015-11-05 19:00:00","","","","","38266");
INSERT INTO trianik_diary VALUES("75986","38247","248","U","N","2015-11-06 18:30:00","","","2015-11-06 19:30:00","","","","","38267");
INSERT INTO trianik_diary VALUES("75987","38310","258","U","N","2015-11-02 11:30:00","","","2015-11-02 14:30:00","","","","","38347");
INSERT INTO trianik_diary VALUES("75988","38331","249","U","N","2015-11-04 14:00:00","","","2015-11-04 16:00:00","","","","","38372");
INSERT INTO trianik_diary VALUES("75989","38324","257","U","N","2015-11-02 08:00:00","","","2015-11-02 11:00:00","","","","","38362");
INSERT INTO trianik_diary VALUES("75990","38248","248","U","N","2015-11-02 19:00:00","","","2015-11-02 22:30:00","","","","","38268");
INSERT INTO trianik_diary VALUES("75991","38248","248","U","N","2015-11-03 16:30:00","","","2015-11-03 20:00:00","","","","","38269");
INSERT INTO trianik_diary VALUES("75992","38248","248","U","N","2015-11-04 19:00:00","","","2015-11-04 22:00:00","","","","","38270");
INSERT INTO trianik_diary VALUES("75993","38248","248","U","N","2015-11-05 19:00:00","","","2015-11-05 22:00:00","","","","","38271");
INSERT INTO trianik_diary VALUES("75994","38248","248","U","N","2015-11-06 15:30:00","","","2015-11-06 18:30:00","","","","","38272");
INSERT INTO trianik_diary VALUES("75995","38286","253","U","N","2015-11-05 09:30:00","","","2015-11-05 12:30:00","","","","","38320");
INSERT INTO trianik_diary VALUES("75996","38264","250","U","N","2015-11-06 11:30:00","","","2015-11-06 15:30:00","","","","","38291");
INSERT INTO trianik_diary VALUES("75997","38304","255","U","N","2015-11-04 09:00:00","","","2015-11-04 11:30:00","","","","","38340");
INSERT INTO trianik_diary VALUES("75998","38289","256","U","N","2015-11-02 09:00:00","","","2015-11-02 12:00:00","","","","","38323");
INSERT INTO trianik_diary VALUES("75999","38289","256","U","N","2015-11-05 09:00:00","","","2015-11-05 12:00:00","","","","","38324");
INSERT INTO trianik_diary VALUES("76000","38325","257","U","N","2015-11-06 08:00:00","","","2015-11-06 10:00:00","","","","","38363");
INSERT INTO trianik_diary VALUES("76001","38257","257","U","N","2015-11-02 09:00:00","","","2015-11-02 11:00:00","","","","","38284");
INSERT INTO trianik_diary VALUES("76002","38327","255","U","N","2015-11-05 18:00:00","","","2015-11-05 19:00:00","","","","","38365");
INSERT INTO trianik_diary VALUES("76003","38315","255","U","N","2015-11-05 09:00:00","","","2015-11-05 11:00:00","","","","","38352");
INSERT INTO trianik_diary VALUES("76004","38321","254","U","N","2015-11-05 12:30:00","","","2015-11-05 15:30:00","","","","","38359");
INSERT INTO trianik_diary VALUES("76005","38329","257","U","N","2015-11-02 13:30:00","","","2015-11-02 15:30:00","","","","","38370");
INSERT INTO trianik_diary VALUES("76006","38300","254","U","N","2015-11-06 12:30:00","","","2015-11-06 14:30:00","","","","","38335");
INSERT INTO trianik_diary VALUES("76007","38260","250","U","N","2015-11-04 09:00:00","","","2015-11-04 11:00:00","","","","","38287");
INSERT INTO trianik_diary VALUES("76008","38261","248","U","N","2015-11-06 08:35:00","","","2015-11-06 15:35:00","","","","","38382");
INSERT INTO trianik_diary VALUES("76009","38277","252","U","N","2015-11-10 09:30:00","","","2015-11-10 11:30:00","","","","","38308");
INSERT INTO trianik_diary VALUES("76010","38277","252","U","N","2015-11-12 09:30:00","","","2015-11-12 11:30:00","","","","","38309");
INSERT INTO trianik_diary VALUES("76011","38317","258","U","N","2015-11-10 11:30:00","","","2015-11-10 13:30:00","","","","","38355");
INSERT INTO trianik_diary VALUES("76012","38309","258","U","N","2015-11-09 09:00:00","","","2015-11-09 10:30:00","","","","","38345");
INSERT INTO trianik_diary VALUES("76013","38309","258","U","N","2015-11-13 11:30:00","","","2015-11-13 13:00:00","","","","","38346");
INSERT INTO trianik_diary VALUES("76014","38316","258","U","N","2015-11-10 09:00:00","","","2015-11-10 11:00:00","","","","","38353");
INSERT INTO trianik_diary VALUES("76015","38316","258","U","N","2015-11-13 09:00:00","","","2015-11-13 11:00:00","","","","","38354");
INSERT INTO trianik_diary VALUES("76016","38314","257","U","N","2015-11-13 12:30:00","","","2015-11-13 15:30:00","","","","","38351");
INSERT INTO trianik_diary VALUES("76017","38268","249","U","N","2015-11-09 15:00:00","","","2015-11-09 16:00:00","","","","","38299");
INSERT INTO trianik_diary VALUES("76018","38280","252","U","N","2015-11-12 12:00:00","","","2015-11-12 16:00:00","","","","","38313");
INSERT INTO trianik_diary VALUES("76019","38284","253","U","N","2015-11-10 09:30:00","","","2015-11-10 14:30:00","","","","","38317");
INSERT INTO trianik_diary VALUES("76020","38284","253","U","N","2015-11-12 11:30:00","","","2015-11-12 13:30:00","","","","","38318");
INSERT INTO trianik_diary VALUES("76021","38252","251","U","N","2015-11-09 09:30:00","","","2015-11-09 12:30:00","","","","","38277");
INSERT INTO trianik_diary VALUES("76022","38252","251","U","N","2015-11-11 10:30:00","","","2015-11-11 14:30:00","","","","","38278");
INSERT INTO trianik_diary VALUES("76023","38252","251","U","N","2015-11-13 09:00:00","","","2015-11-13 13:00:00","","","","","38279");
INSERT INTO trianik_diary VALUES("76024","38311","257","U","N","2015-11-09 15:30:00","","","2015-11-09 17:30:00","","","","","38348");
INSERT INTO trianik_diary VALUES("76025","38333","251","U","N","2015-11-13 13:30:00","","","2015-11-13 15:30:00","","","","","38375");
INSERT INTO trianik_diary VALUES("76026","38303","255","U","N","2015-11-10 09:00:00","","","2015-11-10 11:00:00","","","","","38338");
INSERT INTO trianik_diary VALUES("76027","38303","255","U","N","2015-11-12 15:00:00","","","2015-11-12 17:00:00","","","","","38339");
INSERT INTO trianik_diary VALUES("76028","38281","252","U","N","2015-11-13 12:00:00","","","2015-11-13 14:00:00","","","","","38314");
INSERT INTO trianik_diary VALUES("76029","38287","253","U","N","2015-11-13 09:30:00","","","2015-11-13 13:00:00","","","","","38321");
INSERT INTO trianik_diary VALUES("76030","38245","248","U","N","2015-11-09 08:30:00","","","2015-11-09 12:30:00","","","","","38261");
INSERT INTO trianik_diary VALUES("76031","38319","258","U","N","2015-11-12 09:00:00","","","2015-11-12 13:00:00","","","","","38357");
INSERT INTO trianik_diary VALUES("76032","38285","253","U","N","2015-11-11 12:30:00","","","2015-11-11 14:30:00","","","","","38319");
INSERT INTO trianik_diary VALUES("76033","38246","248","U","N","2015-11-09 13:30:00","","","2015-11-09 15:30:00","","","","","38262");
INSERT INTO trianik_diary VALUES("76034","38259","250","U","N","2015-11-10 09:00:00","","","2015-11-10 11:00:00","","","","","38286");
INSERT INTO trianik_diary VALUES("76035","38255","251","U","N","2015-11-11 09:00:00","","","2015-11-11 10:30:00","","","","","38282");
INSERT INTO trianik_diary VALUES("76036","38250","248","U","N","2015-11-10 14:30:00","","","2015-11-10 16:30:00","","","","","38274");
INSERT INTO trianik_diary VALUES("76037","38320","258","U","N","2015-11-12 13:30:00","","","2015-11-12 16:30:00","","","","","38358");
INSERT INTO trianik_diary VALUES("76038","38313","255","U","N","2015-11-13 16:00:00","","","2015-11-13 18:00:00","","","","","38350");
INSERT INTO trianik_diary VALUES("76039","38253","251","U","N","2015-11-09 12:30:00","","","2015-11-09 14:30:00","","","","","38280");
INSERT INTO trianik_diary VALUES("76040","38253","251","U","N","2015-11-12 11:30:00","","","2015-11-12 13:30:00","","","","","38281");
INSERT INTO trianik_diary VALUES("76041","38308","255","U","N","2015-11-13 14:00:00","","","2015-11-13 16:00:00","","","","","38344");
INSERT INTO trianik_diary VALUES("76042","38295","256","U","N","2015-11-13 09:00:00","","","2015-11-13 11:00:00","","","","","38330");
INSERT INTO trianik_diary VALUES("76043","38283","251","U","N","2015-11-12 09:00:00","","","2015-11-12 11:00:00","","","","","38316");
INSERT INTO trianik_diary VALUES("76044","38290","256","U","N","2015-11-09 12:30:00","","","2015-11-09 15:30:00","","","","","38325");
INSERT INTO trianik_diary VALUES("76045","38322","255","U","N","2015-11-12 11:30:00","","","2015-11-12 14:30:00","","","","","38360");
INSERT INTO trianik_diary VALUES("76046","38292","256","U","N","2015-11-10 12:30:00","","","2015-11-10 16:30:00","","","","","38327");
INSERT INTO trianik_diary VALUES("76047","38263","250","U","N","2015-11-12 12:30:00","","","2015-11-12 14:30:00","","","","","38290");
INSERT INTO trianik_diary VALUES("76048","38279","252","U","N","2015-11-10 14:30:00","","","2015-11-10 16:30:00","","","","","38312");
INSERT INTO trianik_diary VALUES("76049","38258","250","U","N","2015-11-10 09:00:00","","","2015-11-10 11:00:00","","","","","38285");
INSERT INTO trianik_diary VALUES("76050","38306","255","U","N","2015-11-11 14:30:00","","","2015-11-11 16:30:00","","","","","38342");
INSERT INTO trianik_diary VALUES("76051","38276","249","U","N","2015-11-13 11:30:00","","","2015-11-13 15:30:00","","","","","38307");
INSERT INTO trianik_diary VALUES("76052","38297","254","U","N","2015-11-10 12:30:00","","","2015-11-10 14:30:00","","","","","38332");
INSERT INTO trianik_diary VALUES("76053","38318","258","U","N","2015-11-11 11:30:00","","","2015-11-11 14:30:00","","","","","38356");
INSERT INTO trianik_diary VALUES("76054","38302","255","U","N","2015-11-09 15:30:00","","","2015-11-09 17:30:00","","","","","38337");
INSERT INTO trianik_diary VALUES("76055","38299","254","U","N","2015-11-12 12:30:00","","","2015-11-12 14:30:00","","","","","38334");
INSERT INTO trianik_diary VALUES("76056","38265","249","U","N","2015-11-09 09:00:00","","","2015-11-09 11:00:00","","","","","38292");
INSERT INTO trianik_diary VALUES("76057","38265","249","U","N","2015-11-10 09:00:00","","","2015-11-10 11:00:00","","","","","38293");
INSERT INTO trianik_diary VALUES("76058","38265","249","U","N","2015-11-11 09:00:00","","","2015-11-11 11:00:00","","","","","38294");
INSERT INTO trianik_diary VALUES("76059","38265","249","U","N","2015-11-12 09:00:00","","","2015-11-12 11:00:00","","","","","38295");
INSERT INTO trianik_diary VALUES("76060","38265","249","U","N","2015-11-13 09:00:00","","","2015-11-13 11:00:00","","","","","38296");
INSERT INTO trianik_diary VALUES("76061","38330","257","U","N","2015-11-09 11:15:00","","","2015-11-09 13:45:00","","","","","38371");
INSERT INTO trianik_diary VALUES("76062","38291","248","U","N","2015-11-10 09:00:00","","","2015-11-10 11:00:00","","","","","38326");
INSERT INTO trianik_diary VALUES("76063","38275","249","U","N","2015-11-12 13:00:00","","","2015-11-12 15:00:00","","","","","38306");
INSERT INTO trianik_diary VALUES("76064","38307","255","U","N","2015-11-13 09:00:00","","","2015-11-13 11:00:00","","","","","38343");
INSERT INTO trianik_diary VALUES("76065","38282","252","U","N","2015-11-13 14:00:00","","","2015-11-13 16:00:00","","","","","38315");
INSERT INTO trianik_diary VALUES("76066","38312","257","U","N","2015-11-13 09:00:00","","","2015-11-13 13:00:00","","","","","38349");
INSERT INTO trianik_diary VALUES("76067","38323","255","U","N","2015-11-09 09:00:00","","","2015-11-09 13:00:00","","","","","38361");
INSERT INTO trianik_diary VALUES("76068","38249","248","U","N","2015-11-10 12:00:00","","","2015-11-10 14:00:00","","","","","38273");
INSERT INTO trianik_diary VALUES("76069","38293","256","U","N","2015-11-11 12:30:00","","","2015-11-11 15:30:00","","","","","38328");
INSERT INTO trianik_diary VALUES("76070","38266","249","U","N","2015-11-09 11:30:00","","","2015-11-09 13:30:00","","","","","38297");
INSERT INTO trianik_diary VALUES("76071","38267","255","U","N","2015-11-13 11:30:00","","","2015-11-13 13:30:00","","","","","38298");
INSERT INTO trianik_diary VALUES("76072","38296","256","U","N","2015-11-13 11:30:00","","","2015-11-13 13:30:00","","","","","38331");
INSERT INTO trianik_diary VALUES("76073","38301","255","U","N","2015-11-09 13:30:00","","","2015-11-09 15:30:00","","","","","38336");
INSERT INTO trianik_diary VALUES("76074","38298","254","U","N","2015-11-09 12:30:00","","","2015-11-09 15:30:00","","","","","38333");
INSERT INTO trianik_diary VALUES("76075","38262","250","U","N","2015-11-12 09:00:00","","","2015-11-12 12:00:00","","","","","38289");
INSERT INTO trianik_diary VALUES("76076","38305","255","U","N","2015-11-11 12:30:00","","","2015-11-11 14:30:00","","","","","38341");
INSERT INTO trianik_diary VALUES("76077","38278","252","U","N","2015-11-10 12:00:00","","","2015-11-10 14:00:00","","","","","38310");
INSERT INTO trianik_diary VALUES("76078","38278","252","U","N","2015-11-13 09:30:00","","","2015-11-13 11:30:00","","","","","38311");
INSERT INTO trianik_diary VALUES("76079","38269","249","U","N","2015-11-10 11:30:00","","","2015-11-10 14:30:00","","","","","38300");
INSERT INTO trianik_diary VALUES("76080","38256","250","U","N","2015-11-09 09:30:00","","","2015-11-09 12:00:00","","","","","38283");
INSERT INTO trianik_diary VALUES("76081","38294","256","U","N","2015-11-12 12:30:00","","","2015-11-12 16:30:00","","","","","38329");
INSERT INTO trianik_diary VALUES("76082","38247","248","U","N","2015-11-09 18:00:00","","","2015-11-09 19:00:00","","","","","38263");
INSERT INTO trianik_diary VALUES("76083","38247","248","U","N","2015-11-12 18:00:00","","","2015-11-12 19:00:00","","","","","38266");
INSERT INTO trianik_diary VALUES("76084","38247","248","U","N","2015-11-13 18:30:00","","","2015-11-13 19:30:00","","","","","38267");
INSERT INTO trianik_diary VALUES("76085","38310","258","U","N","2015-11-09 11:30:00","","","2015-11-09 14:30:00","","","","","38347");
INSERT INTO trianik_diary VALUES("76086","38248","248","U","N","2015-11-09 19:00:00","","","2015-11-09 22:30:00","","","","","38268");
INSERT INTO trianik_diary VALUES("76087","38248","248","U","N","2015-11-10 16:30:00","","","2015-11-10 20:00:00","","","","","38269");
INSERT INTO trianik_diary VALUES("76088","38248","248","U","N","2015-11-11 19:00:00","","","2015-11-11 22:00:00","","","","","38270");
INSERT INTO trianik_diary VALUES("76089","38248","248","U","N","2015-11-12 19:00:00","","","2015-11-12 22:00:00","","","","","38271");
INSERT INTO trianik_diary VALUES("76090","38248","248","U","N","2015-11-13 15:30:00","","","2015-11-13 18:30:00","","","","","38272");
INSERT INTO trianik_diary VALUES("76091","38286","253","U","N","2015-11-12 09:30:00","","","2015-11-12 12:30:00","","","","","38320");
INSERT INTO trianik_diary VALUES("76092","38264","250","U","N","2015-11-13 11:30:00","","","2015-11-13 15:30:00","","","","","38291");
INSERT INTO trianik_diary VALUES("76093","38272","249","U","N","2015-11-12 11:30:00","","","2015-11-12 13:30:00","","","","","38303");
INSERT INTO trianik_diary VALUES("76094","38304","255","U","N","2015-11-11 09:00:00","","","2015-11-11 11:30:00","","","","","38340");
INSERT INTO trianik_diary VALUES("76095","38289","256","U","N","2015-11-09 09:00:00","","","2015-11-09 12:00:00","","","","","38323");
INSERT INTO trianik_diary VALUES("76096","38289","256","U","N","2015-11-12 09:00:00","","","2015-11-12 12:00:00","","","","","38324");
INSERT INTO trianik_diary VALUES("76097","38257","257","U","N","2015-11-09 09:00:00","","","2015-11-09 11:00:00","","","","","38284");
INSERT INTO trianik_diary VALUES("76098","38327","255","U","N","2015-11-12 18:00:00","","","2015-11-12 19:00:00","","","","","38365");
INSERT INTO trianik_diary VALUES("76099","38315","255","U","N","2015-11-12 09:00:00","","","2015-11-12 11:00:00","","","","","38352");
INSERT INTO trianik_diary VALUES("76100","38329","257","U","N","2015-11-09 13:30:00","","","2015-11-09 15:30:00","","","","","38370");
INSERT INTO trianik_diary VALUES("76101","38300","254","U","N","2015-11-13 12:30:00","","","2015-11-13 14:30:00","","","","","38335");
INSERT INTO trianik_diary VALUES("76102","38260","250","U","N","2015-11-11 09:00:00","","","2015-11-11 11:00:00","","","","","38287");
INSERT INTO trianik_diary VALUES("76103","38261","248","U","N","2015-11-13 08:35:00","","","2015-11-13 15:35:00","","","","","38382");
INSERT INTO trianik_diary VALUES("76104","38277","252","U","N","2015-11-17 09:30:00","","","2015-11-17 11:30:00","","","","","38308");
INSERT INTO trianik_diary VALUES("76105","38277","252","U","N","2015-11-19 09:30:00","","","2015-11-19 11:30:00","","","","","38309");
INSERT INTO trianik_diary VALUES("76106","38274","250","U","N","2015-11-19 09:00:00","","","2015-11-19 12:00:00","","","","","38305");
INSERT INTO trianik_diary VALUES("76107","38317","258","U","N","2015-11-17 11:30:00","","","2015-11-17 13:30:00","","","","","38355");
INSERT INTO trianik_diary VALUES("76108","38309","258","U","N","2015-11-16 09:00:00","","","2015-11-16 10:30:00","","","","","38345");
INSERT INTO trianik_diary VALUES("76109","38309","258","U","N","2015-11-20 11:30:00","","","2015-11-20 13:00:00","","","","","38346");
INSERT INTO trianik_diary VALUES("76110","38316","258","U","N","2015-11-17 09:00:00","","","2015-11-17 11:00:00","","","","","38353");
INSERT INTO trianik_diary VALUES("76111","38316","258","U","N","2015-11-20 09:00:00","","","2015-11-20 11:00:00","","","","","38354");
INSERT INTO trianik_diary VALUES("76112","38314","257","U","N","2015-11-20 12:30:00","","","2015-11-20 15:30:00","","","","","38351");
INSERT INTO trianik_diary VALUES("76113","38280","252","U","N","2015-11-19 12:00:00","","","2015-11-19 16:00:00","","","","","38313");
INSERT INTO trianik_diary VALUES("76114","38284","253","U","N","2015-11-17 09:30:00","","","2015-11-17 14:30:00","","","","","38317");
INSERT INTO trianik_diary VALUES("76115","38284","253","U","N","2015-11-19 11:30:00","","","2015-11-19 13:30:00","","","","","38318");
INSERT INTO trianik_diary VALUES("76116","38252","251","U","N","2015-11-16 09:30:00","","","2015-11-16 12:30:00","","","","","38277");
INSERT INTO trianik_diary VALUES("76117","38252","251","U","N","2015-11-18 10:30:00","","","2015-11-18 14:30:00","","","","","38278");
INSERT INTO trianik_diary VALUES("76118","38252","251","U","N","2015-11-20 09:00:00","","","2015-11-20 13:00:00","","","","","38279");
INSERT INTO trianik_diary VALUES("76119","38311","257","U","N","2015-11-16 15:30:00","","","2015-11-16 17:30:00","","","","","38348");
INSERT INTO trianik_diary VALUES("76120","38333","251","U","N","2015-11-20 13:30:00","","","2015-11-20 15:30:00","","","","","38375");
INSERT INTO trianik_diary VALUES("76121","38303","255","U","N","2015-11-17 09:00:00","","","2015-11-17 11:00:00","","","","","38338");
INSERT INTO trianik_diary VALUES("76122","38303","255","U","N","2015-11-19 15:00:00","","","2015-11-19 17:00:00","","","","","38339");
INSERT INTO trianik_diary VALUES("76123","38271","249","U","N","2015-11-18 14:00:00","","","2015-11-18 16:00:00","","","","","38302");
INSERT INTO trianik_diary VALUES("76124","38245","248","U","N","2015-11-16 08:30:00","","","2015-11-16 12:30:00","","","","","38261");
INSERT INTO trianik_diary VALUES("76125","38319","258","U","N","2015-11-19 09:00:00","","","2015-11-19 13:00:00","","","","","38357");
INSERT INTO trianik_diary VALUES("76126","38285","253","U","N","2015-11-18 12:30:00","","","2015-11-18 14:30:00","","","","","38319");
INSERT INTO trianik_diary VALUES("76127","38246","248","U","N","2015-11-16 13:30:00","","","2015-11-16 15:30:00","","","","","38262");
INSERT INTO trianik_diary VALUES("76128","38259","250","U","N","2015-11-17 09:00:00","","","2015-11-17 11:00:00","","","","","38286");
INSERT INTO trianik_diary VALUES("76129","38320","258","U","N","2015-11-19 13:30:00","","","2015-11-19 16:30:00","","","","","38358");
INSERT INTO trianik_diary VALUES("76130","38253","251","U","N","2015-11-16 12:30:00","","","2015-11-16 14:30:00","","","","","38280");
INSERT INTO trianik_diary VALUES("76131","38253","251","U","N","2015-11-19 11:30:00","","","2015-11-19 13:30:00","","","","","38281");
INSERT INTO trianik_diary VALUES("76132","38308","255","U","N","2015-11-20 14:00:00","","","2015-11-20 16:00:00","","","","","38344");
INSERT INTO trianik_diary VALUES("76133","38295","256","U","N","2015-11-20 09:00:00","","","2015-11-20 11:00:00","","","","","38330");
INSERT INTO trianik_diary VALUES("76134","38288","253","U","N","2015-11-20 09:30:00","","","2015-11-20 13:30:00","","","","","38322");
INSERT INTO trianik_diary VALUES("76135","38283","251","U","N","2015-11-19 09:00:00","","","2015-11-19 11:00:00","","","","","38316");
INSERT INTO trianik_diary VALUES("76136","38290","256","U","N","2015-11-16 12:30:00","","","2015-11-16 15:30:00","","","","","38325");
INSERT INTO trianik_diary VALUES("76137","38322","255","U","N","2015-11-19 11:30:00","","","2015-11-19 14:30:00","","","","","38360");
INSERT INTO trianik_diary VALUES("76138","38292","256","U","N","2015-11-17 12:30:00","","","2015-11-17 16:30:00","","","","","38327");
INSERT INTO trianik_diary VALUES("76139","38263","250","U","N","2015-11-19 12:30:00","","","2015-11-19 14:30:00","","","","","38290");
INSERT INTO trianik_diary VALUES("76140","38279","252","U","N","2015-11-17 14:30:00","","","2015-11-17 16:30:00","","","","","38312");
INSERT INTO trianik_diary VALUES("76141","38306","255","U","N","2015-11-18 14:30:00","","","2015-11-18 16:30:00","","","","","38342");
INSERT INTO trianik_diary VALUES("76142","38276","249","U","N","2015-11-20 11:30:00","","","2015-11-20 15:30:00","","","","","38307");
INSERT INTO trianik_diary VALUES("76143","38297","254","U","N","2015-11-17 12:30:00","","","2015-11-17 14:30:00","","","","","38332");
INSERT INTO trianik_diary VALUES("76144","38326","257","U","N","2015-11-20 10:15:00","","","2015-11-20 11:45:00","","","","","38364");
INSERT INTO trianik_diary VALUES("76145","38318","258","U","N","2015-11-18 11:30:00","","","2015-11-18 14:30:00","","","","","38356");
INSERT INTO trianik_diary VALUES("76146","38265","249","U","N","2015-11-16 09:00:00","","","2015-11-16 11:00:00","","","","","38292");
INSERT INTO trianik_diary VALUES("76147","38265","249","U","N","2015-11-17 09:00:00","","","2015-11-17 11:00:00","","","","","38293");
INSERT INTO trianik_diary VALUES("76148","38265","249","U","N","2015-11-18 09:00:00","","","2015-11-18 11:00:00","","","","","38294");
INSERT INTO trianik_diary VALUES("76149","38265","249","U","N","2015-11-19 09:00:00","","","2015-11-19 11:00:00","","","","","38295");
INSERT INTO trianik_diary VALUES("76150","38265","249","U","N","2015-11-20 09:00:00","","","2015-11-20 11:00:00","","","","","38296");
INSERT INTO trianik_diary VALUES("76151","38270","249","U","N","2015-11-18 11:30:00","","","2015-11-18 13:30:00","","","","","38301");
INSERT INTO trianik_diary VALUES("76152","38291","248","U","N","2015-11-17 09:00:00","","","2015-11-17 11:00:00","","","","","38326");
INSERT INTO trianik_diary VALUES("76153","38275","249","U","N","2015-11-19 13:00:00","","","2015-11-19 15:00:00","","","","","38306");
INSERT INTO trianik_diary VALUES("76154","38307","255","U","N","2015-11-20 09:00:00","","","2015-11-20 11:00:00","","","","","38343");
INSERT INTO trianik_diary VALUES("76155","38282","252","U","N","2015-11-20 14:00:00","","","2015-11-20 16:00:00","","","","","38315");
INSERT INTO trianik_diary VALUES("76156","38323","255","U","N","2015-11-16 09:00:00","","","2015-11-16 13:00:00","","","","","38361");
INSERT INTO trianik_diary VALUES("76157","38249","248","U","N","2015-11-17 12:00:00","","","2015-11-17 14:00:00","","","","","38273");
INSERT INTO trianik_diary VALUES("76158","38293","256","U","N","2015-11-18 12:30:00","","","2015-11-18 15:30:00","","","","","38328");
INSERT INTO trianik_diary VALUES("76159","38251","248","U","N","2015-11-17 14:30:00","","","2015-11-17 17:00:00","","","","","38276");
INSERT INTO trianik_diary VALUES("76160","38266","249","U","N","2015-11-16 11:30:00","","","2015-11-16 13:30:00","","","","","38297");
INSERT INTO trianik_diary VALUES("76161","38267","255","U","N","2015-11-20 11:30:00","","","2015-11-20 13:30:00","","","","","38298");
INSERT INTO trianik_diary VALUES("76162","38296","256","U","N","2015-11-20 11:30:00","","","2015-11-20 13:30:00","","","","","38331");
INSERT INTO trianik_diary VALUES("76163","38301","255","U","N","2015-11-16 13:30:00","","","2015-11-16 15:30:00","","","","","38336");
INSERT INTO trianik_diary VALUES("76164","38298","254","U","N","2015-11-16 12:30:00","","","2015-11-16 15:30:00","","","","","38333");
INSERT INTO trianik_diary VALUES("76165","38305","255","U","N","2015-11-18 12:30:00","","","2015-11-18 14:30:00","","","","","38341");
INSERT INTO trianik_diary VALUES("76166","38278","252","U","N","2015-11-17 12:00:00","","","2015-11-17 14:00:00","","","","","38310");
INSERT INTO trianik_diary VALUES("76167","38278","252","U","N","2015-11-20 09:30:00","","","2015-11-20 11:30:00","","","","","38311");
INSERT INTO trianik_diary VALUES("76168","38273","250","U","N","2015-11-17 09:00:00","","","2015-11-17 12:00:00","","","","","38304");
INSERT INTO trianik_diary VALUES("76169","38332","259","U","N","2015-11-17 09:00:00","","","2015-11-17 11:00:00","","","","","38373");
INSERT INTO trianik_diary VALUES("76170","38269","249","U","N","2015-11-17 11:30:00","","","2015-11-17 14:30:00","","","","","38300");
INSERT INTO trianik_diary VALUES("76171","38256","250","U","N","2015-11-16 09:30:00","","","2015-11-16 12:00:00","","","","","38283");
INSERT INTO trianik_diary VALUES("76172","38294","256","U","N","2015-11-19 12:30:00","","","2015-11-19 16:30:00","","","","","38329");
INSERT INTO trianik_diary VALUES("76173","38247","248","U","N","2015-11-16 18:00:00","","","2015-11-16 19:00:00","","","","","38263");
INSERT INTO trianik_diary VALUES("76174","38247","248","U","N","2015-11-19 18:00:00","","","2015-11-19 19:00:00","","","","","38266");
INSERT INTO trianik_diary VALUES("76175","38247","248","U","N","2015-11-20 18:30:00","","","2015-11-20 19:30:00","","","","","38267");
INSERT INTO trianik_diary VALUES("76176","38310","258","U","N","2015-11-16 11:30:00","","","2015-11-16 14:30:00","","","","","38347");
INSERT INTO trianik_diary VALUES("76177","38331","249","U","N","2015-11-18 14:00:00","","","2015-11-18 16:00:00","","","","","38372");
INSERT INTO trianik_diary VALUES("76178","38324","257","U","N","2015-11-16 08:00:00","","","2015-11-16 11:00:00","","","","","38362");
INSERT INTO trianik_diary VALUES("76179","38248","248","U","N","2015-11-16 19:00:00","","","2015-11-16 22:30:00","","","","","38268");
INSERT INTO trianik_diary VALUES("76180","38248","248","U","N","2015-11-17 16:30:00","","","2015-11-17 20:00:00","","","","","38269");
INSERT INTO trianik_diary VALUES("76181","38248","248","U","N","2015-11-18 19:00:00","","","2015-11-18 22:00:00","","","","","38270");
INSERT INTO trianik_diary VALUES("76182","38248","248","U","N","2015-11-19 19:00:00","","","2015-11-19 22:00:00","","","","","38271");
INSERT INTO trianik_diary VALUES("76183","38248","248","U","N","2015-11-20 15:30:00","","","2015-11-20 18:30:00","","","","","38272");
INSERT INTO trianik_diary VALUES("76184","38286","253","U","N","2015-11-19 09:30:00","","","2015-11-19 12:30:00","","","","","38320");
INSERT INTO trianik_diary VALUES("76185","38264","250","U","N","2015-11-20 11:30:00","","","2015-11-20 15:30:00","","","","","38291");
INSERT INTO trianik_diary VALUES("76186","38304","255","U","N","2015-11-18 09:00:00","","","2015-11-18 11:30:00","","","","","38340");
INSERT INTO trianik_diary VALUES("76187","38289","256","U","N","2015-11-16 09:00:00","","","2015-11-16 12:00:00","","","","","38323");
INSERT INTO trianik_diary VALUES("76188","38289","256","U","N","2015-11-19 09:00:00","","","2015-11-19 12:00:00","","","","","38324");
INSERT INTO trianik_diary VALUES("76189","38325","257","U","N","2015-11-20 08:00:00","","","2015-11-20 10:00:00","","","","","38363");
INSERT INTO trianik_diary VALUES("76190","38257","257","U","N","2015-11-16 09:00:00","","","2015-11-16 11:00:00","","","","","38284");
INSERT INTO trianik_diary VALUES("76191","38327","255","U","N","2015-11-19 18:00:00","","","2015-11-19 19:00:00","","","","","38365");
INSERT INTO trianik_diary VALUES("76192","38315","255","U","N","2015-11-19 09:00:00","","","2015-11-19 11:00:00","","","","","38352");
INSERT INTO trianik_diary VALUES("76193","38321","254","U","N","2015-11-19 12:30:00","","","2015-11-19 15:30:00","","","","","38359");
INSERT INTO trianik_diary VALUES("76194","38329","257","U","N","2015-11-16 13:30:00","","","2015-11-16 15:30:00","","","","","38370");
INSERT INTO trianik_diary VALUES("76195","38300","254","U","N","2015-11-20 12:30:00","","","2015-11-20 14:30:00","","","","","38335");
INSERT INTO trianik_diary VALUES("76196","38260","250","U","N","2015-11-18 09:00:00","","","2015-11-18 11:00:00","","","","","38287");
INSERT INTO trianik_diary VALUES("76197","38261","248","U","N","2015-11-20 08:35:00","","","2015-11-20 15:35:00","","","","","38382");
INSERT INTO trianik_diary VALUES("76198","38277","252","U","N","2015-11-24 09:30:00","","","2015-11-24 11:30:00","","","","","38308");
INSERT INTO trianik_diary VALUES("76199","38277","252","U","N","2015-11-26 09:30:00","","","2015-11-26 11:30:00","","","","","38309");
INSERT INTO trianik_diary VALUES("76200","38317","258","U","N","2015-11-24 11:30:00","","","2015-11-24 13:30:00","","","","","38355");
INSERT INTO trianik_diary VALUES("76201","38309","258","U","N","2015-11-23 09:00:00","","","2015-11-23 10:30:00","","","","","38345");
INSERT INTO trianik_diary VALUES("76202","38309","258","U","N","2015-11-27 11:30:00","","","2015-11-27 13:00:00","","","","","38346");
INSERT INTO trianik_diary VALUES("76203","38316","258","U","N","2015-11-24 09:00:00","","","2015-11-24 11:00:00","","","","","38353");
INSERT INTO trianik_diary VALUES("76204","38316","258","U","N","2015-11-27 09:00:00","","","2015-11-27 11:00:00","","","","","38354");
INSERT INTO trianik_diary VALUES("76205","38314","257","U","N","2015-11-27 12:30:00","","","2015-11-27 15:30:00","","","","","38351");
INSERT INTO trianik_diary VALUES("76206","38268","249","U","N","2015-11-23 15:00:00","","","2015-11-23 16:00:00","","","","","38299");
INSERT INTO trianik_diary VALUES("76207","38280","252","U","N","2015-11-26 12:00:00","","","2015-11-26 16:00:00","","","","","38313");
INSERT INTO trianik_diary VALUES("76208","38284","253","U","N","2015-11-24 09:30:00","","","2015-11-24 14:30:00","","","","","38317");
INSERT INTO trianik_diary VALUES("76209","38284","253","U","N","2015-11-26 11:30:00","","","2015-11-26 13:30:00","","","","","38318");
INSERT INTO trianik_diary VALUES("76210","38252","251","U","N","2015-11-23 09:30:00","","","2015-11-23 12:30:00","","","","","38277");
INSERT INTO trianik_diary VALUES("76211","38252","251","U","N","2015-11-25 10:30:00","","","2015-11-25 14:30:00","","","","","38278");
INSERT INTO trianik_diary VALUES("76212","38252","251","U","N","2015-11-27 09:00:00","","","2015-11-27 13:00:00","","","","","38279");
INSERT INTO trianik_diary VALUES("76213","38311","257","U","N","2015-11-23 15:30:00","","","2015-11-23 17:30:00","","","","","38348");
INSERT INTO trianik_diary VALUES("76214","38333","251","U","N","2015-11-27 13:30:00","","","2015-11-27 15:30:00","","","","","38375");
INSERT INTO trianik_diary VALUES("76215","38303","255","U","N","2015-11-24 09:00:00","","","2015-11-24 11:00:00","","","","","38338");
INSERT INTO trianik_diary VALUES("76216","38303","255","U","N","2015-11-26 15:00:00","","","2015-11-26 17:00:00","","","","","38339");
INSERT INTO trianik_diary VALUES("76217","38281","252","U","N","2015-11-27 12:00:00","","","2015-11-27 14:00:00","","","","","38314");
INSERT INTO trianik_diary VALUES("76218","38287","253","U","N","2015-11-27 09:30:00","","","2015-11-27 13:00:00","","","","","38321");
INSERT INTO trianik_diary VALUES("76219","38245","248","U","N","2015-11-23 08:30:00","","","2015-11-23 12:30:00","","","","","38261");
INSERT INTO trianik_diary VALUES("76220","38319","258","U","N","2015-11-26 09:00:00","","","2015-11-26 13:00:00","","","","","38357");
INSERT INTO trianik_diary VALUES("76221","38285","253","U","N","2015-11-25 12:30:00","","","2015-11-25 14:30:00","","","","","38319");
INSERT INTO trianik_diary VALUES("76222","38246","248","U","N","2015-11-23 13:30:00","","","2015-11-23 15:30:00","","","","","38262");
INSERT INTO trianik_diary VALUES("76223","38259","250","U","N","2015-11-24 09:00:00","","","2015-11-24 11:00:00","","","","","38286");
INSERT INTO trianik_diary VALUES("76224","38255","251","U","N","2015-11-25 09:00:00","","","2015-11-25 10:30:00","","","","","38282");
INSERT INTO trianik_diary VALUES("76225","38250","248","U","N","2015-11-24 14:30:00","","","2015-11-24 16:30:00","","","","","38274");
INSERT INTO trianik_diary VALUES("76226","38320","258","U","N","2015-11-26 13:30:00","","","2015-11-26 16:30:00","","","","","38358");
INSERT INTO trianik_diary VALUES("76227","38313","255","U","N","2015-11-27 16:00:00","","","2015-11-27 18:00:00","","","","","38350");
INSERT INTO trianik_diary VALUES("76228","38253","251","U","N","2015-11-23 12:30:00","","","2015-11-23 14:30:00","","","","","38280");
INSERT INTO trianik_diary VALUES("76229","38253","251","U","N","2015-11-26 11:30:00","","","2015-11-26 13:30:00","","","","","38281");
INSERT INTO trianik_diary VALUES("76230","38308","255","U","N","2015-11-27 14:00:00","","","2015-11-27 16:00:00","","","","","38344");
INSERT INTO trianik_diary VALUES("76231","38295","256","U","N","2015-11-27 09:00:00","","","2015-11-27 11:00:00","","","","","38330");
INSERT INTO trianik_diary VALUES("76232","38283","251","U","N","2015-11-26 09:00:00","","","2015-11-26 11:00:00","","","","","38316");
INSERT INTO trianik_diary VALUES("76233","38290","256","U","N","2015-11-23 12:30:00","","","2015-11-23 15:30:00","","","","","38325");
INSERT INTO trianik_diary VALUES("76234","38322","255","U","N","2015-11-26 11:30:00","","","2015-11-26 14:30:00","","","","","38360");
INSERT INTO trianik_diary VALUES("76235","38292","256","U","N","2015-11-24 12:30:00","","","2015-11-24 16:30:00","","","","","38327");
INSERT INTO trianik_diary VALUES("76236","38263","250","U","N","2015-11-26 12:30:00","","","2015-11-26 14:30:00","","","","","38290");
INSERT INTO trianik_diary VALUES("76237","38279","252","U","N","2015-11-24 14:30:00","","","2015-11-24 16:30:00","","","","","38312");
INSERT INTO trianik_diary VALUES("76238","38258","250","U","N","2015-11-24 09:00:00","","","2015-11-24 11:00:00","","","","","38285");
INSERT INTO trianik_diary VALUES("76239","38306","255","U","N","2015-11-25 14:30:00","","","2015-11-25 16:30:00","","","","","38342");
INSERT INTO trianik_diary VALUES("76240","38276","249","U","N","2015-11-27 11:30:00","","","2015-11-27 15:30:00","","","","","38307");
INSERT INTO trianik_diary VALUES("76241","38297","254","U","N","2015-11-24 12:30:00","","","2015-11-24 14:30:00","","","","","38332");
INSERT INTO trianik_diary VALUES("76242","38318","258","U","N","2015-11-25 11:30:00","","","2015-11-25 14:30:00","","","","","38356");
INSERT INTO trianik_diary VALUES("76243","38302","255","U","N","2015-11-23 15:30:00","","","2015-11-23 17:30:00","","","","","38337");
INSERT INTO trianik_diary VALUES("76244","38299","254","U","N","2015-11-26 12:30:00","","","2015-11-26 14:30:00","","","","","38334");
INSERT INTO trianik_diary VALUES("76245","38265","249","U","N","2015-11-23 09:00:00","","","2015-11-23 11:00:00","","","","","38292");
INSERT INTO trianik_diary VALUES("76246","38265","249","U","N","2015-11-24 09:00:00","","","2015-11-24 11:00:00","","","","","38293");
INSERT INTO trianik_diary VALUES("76247","38265","249","U","N","2015-11-25 09:00:00","","","2015-11-25 11:00:00","","","","","38294");
INSERT INTO trianik_diary VALUES("76248","38265","249","U","N","2015-11-26 09:00:00","","","2015-11-26 11:00:00","","","","","38295");
INSERT INTO trianik_diary VALUES("76249","38265","249","U","N","2015-11-27 09:00:00","","","2015-11-27 11:00:00","","","","","38296");
INSERT INTO trianik_diary VALUES("76250","38330","257","U","N","2015-11-23 11:15:00","","","2015-11-23 13:45:00","","","","","38371");
INSERT INTO trianik_diary VALUES("76251","38291","248","U","N","2015-11-24 09:00:00","","","2015-11-24 11:00:00","","","","","38326");
INSERT INTO trianik_diary VALUES("76252","38275","249","U","N","2015-11-26 13:00:00","","","2015-11-26 15:00:00","","","","","38306");
INSERT INTO trianik_diary VALUES("76253","38307","255","U","N","2015-11-27 09:00:00","","","2015-11-27 11:00:00","","","","","38343");
INSERT INTO trianik_diary VALUES("76254","38282","252","U","N","2015-11-27 14:00:00","","","2015-11-27 16:00:00","","","","","38315");
INSERT INTO trianik_diary VALUES("76255","38312","257","U","N","2015-11-27 09:00:00","","","2015-11-27 13:00:00","","","","","38349");
INSERT INTO trianik_diary VALUES("76256","38323","255","U","N","2015-11-23 09:00:00","","","2015-11-23 13:00:00","","","","","38361");
INSERT INTO trianik_diary VALUES("76257","38249","248","U","N","2015-11-24 12:00:00","","","2015-11-24 14:00:00","","","","","38273");
INSERT INTO trianik_diary VALUES("76258","38293","256","U","N","2015-11-25 12:30:00","","","2015-11-25 15:30:00","","","","","38328");
INSERT INTO trianik_diary VALUES("76259","38266","249","U","N","2015-11-23 11:30:00","","","2015-11-23 13:30:00","","","","","38297");
INSERT INTO trianik_diary VALUES("76260","38267","255","U","N","2015-11-27 11:30:00","","","2015-11-27 13:30:00","","","","","38298");
INSERT INTO trianik_diary VALUES("76261","38296","256","U","N","2015-11-27 11:30:00","","","2015-11-27 13:30:00","","","","","38331");
INSERT INTO trianik_diary VALUES("76262","38301","255","U","N","2015-11-23 13:30:00","","","2015-11-23 15:30:00","","","","","38336");
INSERT INTO trianik_diary VALUES("76263","38298","254","U","N","2015-11-23 12:30:00","","","2015-11-23 15:30:00","","","","","38333");
INSERT INTO trianik_diary VALUES("76264","38262","250","U","N","2015-11-26 09:00:00","","","2015-11-26 12:00:00","","","","","38289");
INSERT INTO trianik_diary VALUES("76265","38305","255","U","N","2015-11-25 12:30:00","","","2015-11-25 14:30:00","","","","","38341");
INSERT INTO trianik_diary VALUES("76266","38278","252","U","N","2015-11-24 12:00:00","","","2015-11-24 14:00:00","","","","","38310");
INSERT INTO trianik_diary VALUES("76267","38278","252","U","N","2015-11-27 09:30:00","","","2015-11-27 11:30:00","","","","","38311");
INSERT INTO trianik_diary VALUES("76268","38269","249","U","N","2015-11-24 11:30:00","","","2015-11-24 14:30:00","","","","","38300");
INSERT INTO trianik_diary VALUES("76269","38256","250","U","N","2015-11-23 09:30:00","","","2015-11-23 12:00:00","","","","","38283");
INSERT INTO trianik_diary VALUES("76270","38294","256","U","N","2015-11-26 12:30:00","","","2015-11-26 16:30:00","","","","","38329");
INSERT INTO trianik_diary VALUES("76271","38247","248","U","N","2015-11-23 18:00:00","","","2015-11-23 19:00:00","","","","","38263");
INSERT INTO trianik_diary VALUES("76272","38247","248","U","N","2015-11-26 18:00:00","","","2015-11-26 19:00:00","","","","","38266");
INSERT INTO trianik_diary VALUES("76273","38247","248","U","N","2015-11-27 18:30:00","","","2015-11-27 19:30:00","","","","","38267");
INSERT INTO trianik_diary VALUES("76274","38310","258","U","N","2015-11-23 11:30:00","","","2015-11-23 14:30:00","","","","","38347");
INSERT INTO trianik_diary VALUES("76275","38248","248","U","N","2015-11-23 19:00:00","","","2015-11-23 22:30:00","","","","","38268");
INSERT INTO trianik_diary VALUES("76276","38248","248","U","N","2015-11-24 16:30:00","","","2015-11-24 20:00:00","","","","","38269");
INSERT INTO trianik_diary VALUES("76277","38248","248","U","N","2015-11-25 19:00:00","","","2015-11-25 22:00:00","","","","","38270");
INSERT INTO trianik_diary VALUES("76278","38248","248","U","N","2015-11-26 19:00:00","","","2015-11-26 22:00:00","","","","","38271");
INSERT INTO trianik_diary VALUES("76279","38248","248","U","N","2015-11-27 15:30:00","","","2015-11-27 18:30:00","","","","","38272");
INSERT INTO trianik_diary VALUES("76280","38286","253","U","N","2015-11-26 09:30:00","","","2015-11-26 12:30:00","","","","","38320");
INSERT INTO trianik_diary VALUES("76281","38264","250","U","N","2015-11-27 11:30:00","","","2015-11-27 15:30:00","","","","","38291");
INSERT INTO trianik_diary VALUES("76282","38272","249","U","N","2015-11-26 11:30:00","","","2015-11-26 13:30:00","","","","","38303");
INSERT INTO trianik_diary VALUES("76283","38304","255","U","N","2015-11-25 09:00:00","","","2015-11-25 11:30:00","","","","","38340");
INSERT INTO trianik_diary VALUES("76284","38289","256","U","N","2015-11-23 09:00:00","","","2015-11-23 12:00:00","","","","","38323");
INSERT INTO trianik_diary VALUES("76285","38289","256","U","N","2015-11-26 09:00:00","","","2015-11-26 12:00:00","","","","","38324");
INSERT INTO trianik_diary VALUES("76286","38257","257","U","N","2015-11-23 09:00:00","","","2015-11-23 11:00:00","","","","","38284");
INSERT INTO trianik_diary VALUES("76287","38327","255","U","N","2015-11-26 18:00:00","","","2015-11-26 19:00:00","","","","","38365");
INSERT INTO trianik_diary VALUES("76288","38315","255","U","N","2015-11-26 09:00:00","","","2015-11-26 11:00:00","","","","","38352");
INSERT INTO trianik_diary VALUES("76289","38329","257","U","N","2015-11-23 13:30:00","","","2015-11-23 15:30:00","","","","","38370");
INSERT INTO trianik_diary VALUES("76290","38300","254","U","N","2015-11-27 12:30:00","","","2015-11-27 14:30:00","","","","","38335");
INSERT INTO trianik_diary VALUES("76291","38260","250","U","N","2015-11-25 09:00:00","","","2015-11-25 11:00:00","","","","","38287");
INSERT INTO trianik_diary VALUES("76292","38261","248","U","N","2015-11-27 08:35:00","","","2015-11-27 15:35:00","","","","","38382");
INSERT INTO trianik_diary VALUES("76293","38277","252","U","N","2015-12-01 09:30:00","","","2015-12-01 11:30:00","","","","","38308");
INSERT INTO trianik_diary VALUES("76294","38277","252","U","N","2015-12-03 09:30:00","","","2015-12-03 11:30:00","","","","","38309");
INSERT INTO trianik_diary VALUES("76295","38274","250","U","N","2015-12-03 09:00:00","","","2015-12-03 12:00:00","","","","","38305");
INSERT INTO trianik_diary VALUES("76296","38317","258","U","N","2015-12-01 11:30:00","","","2015-12-01 13:30:00","","","","","38355");
INSERT INTO trianik_diary VALUES("76297","38309","258","U","N","2015-11-30 09:00:00","","","2015-11-30 10:30:00","","","","","38345");
INSERT INTO trianik_diary VALUES("76298","38309","258","U","N","2015-12-04 11:30:00","","","2015-12-04 13:00:00","","","","","38346");
INSERT INTO trianik_diary VALUES("76299","38316","258","U","N","2015-12-01 09:00:00","","","2015-12-01 11:00:00","","","","","38353");
INSERT INTO trianik_diary VALUES("76300","38316","258","U","N","2015-12-04 09:00:00","","","2015-12-04 11:00:00","","","","","38354");
INSERT INTO trianik_diary VALUES("76301","38314","257","U","N","2015-12-04 12:30:00","","","2015-12-04 15:30:00","","","","","38351");
INSERT INTO trianik_diary VALUES("76302","38280","252","U","N","2015-12-03 12:00:00","","","2015-12-03 16:00:00","","","","","38313");
INSERT INTO trianik_diary VALUES("76303","38284","253","U","N","2015-12-01 09:30:00","","","2015-12-01 14:30:00","","","","","38317");
INSERT INTO trianik_diary VALUES("76304","38284","253","U","N","2015-12-03 11:30:00","","","2015-12-03 13:30:00","","","","","38318");
INSERT INTO trianik_diary VALUES("76305","38252","251","U","N","2015-11-30 09:30:00","","","2015-11-30 12:30:00","","","","","38277");
INSERT INTO trianik_diary VALUES("76306","38252","251","U","N","2015-12-02 10:30:00","","","2015-12-02 14:30:00","","","","","38278");
INSERT INTO trianik_diary VALUES("76307","38252","251","U","N","2015-12-04 09:00:00","","","2015-12-04 13:00:00","","","","","38279");
INSERT INTO trianik_diary VALUES("76308","38311","257","U","N","2015-11-30 15:30:00","","","2015-11-30 17:30:00","","","","","38348");
INSERT INTO trianik_diary VALUES("76309","38333","251","U","N","2015-12-04 13:30:00","","","2015-12-04 15:30:00","","","","","38375");
INSERT INTO trianik_diary VALUES("76310","38303","255","U","N","2015-12-01 09:00:00","","","2015-12-01 11:00:00","","","","","38338");
INSERT INTO trianik_diary VALUES("76311","38303","255","U","N","2015-12-03 15:00:00","","","2015-12-03 17:00:00","","","","","38339");
INSERT INTO trianik_diary VALUES("76312","38271","249","U","N","2015-12-02 14:00:00","","","2015-12-02 16:00:00","","","","","38302");
INSERT INTO trianik_diary VALUES("76313","38245","248","U","N","2015-11-30 08:30:00","","","2015-11-30 12:30:00","","","","","38261");
INSERT INTO trianik_diary VALUES("76314","38319","258","U","N","2015-12-03 09:00:00","","","2015-12-03 13:00:00","","","","","38357");
INSERT INTO trianik_diary VALUES("76315","38285","253","U","N","2015-12-02 12:30:00","","","2015-12-02 14:30:00","","","","","38319");
INSERT INTO trianik_diary VALUES("76316","38246","248","U","N","2015-11-30 13:30:00","","","2015-11-30 15:30:00","","","","","38262");
INSERT INTO trianik_diary VALUES("76317","38259","250","U","N","2015-12-01 09:00:00","","","2015-12-01 11:00:00","","","","","38286");
INSERT INTO trianik_diary VALUES("76318","38320","258","U","N","2015-12-03 13:30:00","","","2015-12-03 16:30:00","","","","","38358");
INSERT INTO trianik_diary VALUES("76319","38253","251","U","N","2015-11-30 12:30:00","","","2015-11-30 14:30:00","","","","","38280");
INSERT INTO trianik_diary VALUES("76320","38253","251","U","N","2015-12-03 11:30:00","","","2015-12-03 13:30:00","","","","","38281");
INSERT INTO trianik_diary VALUES("76321","38308","255","U","N","2015-12-04 14:00:00","","","2015-12-04 16:00:00","","","","","38344");
INSERT INTO trianik_diary VALUES("76322","38295","256","U","N","2015-12-04 09:00:00","","","2015-12-04 11:00:00","","","","","38330");
INSERT INTO trianik_diary VALUES("76323","38288","253","U","N","2015-12-04 09:30:00","","","2015-12-04 13:30:00","","","","","38322");
INSERT INTO trianik_diary VALUES("76324","38283","251","U","N","2015-12-03 09:00:00","","","2015-12-03 11:00:00","","","","","38316");
INSERT INTO trianik_diary VALUES("76325","38290","256","U","N","2015-11-30 12:30:00","","","2015-11-30 15:30:00","","","","","38325");
INSERT INTO trianik_diary VALUES("76326","38322","255","U","N","2015-12-03 11:30:00","","","2015-12-03 14:30:00","","","","","38360");
INSERT INTO trianik_diary VALUES("76327","38292","256","U","N","2015-12-01 12:30:00","","","2015-12-01 16:30:00","","","","","38327");
INSERT INTO trianik_diary VALUES("76328","38263","250","U","N","2015-12-03 12:30:00","","","2015-12-03 14:30:00","","","","","38290");
INSERT INTO trianik_diary VALUES("76329","38279","252","U","N","2015-12-01 14:30:00","","","2015-12-01 16:30:00","","","","","38312");
INSERT INTO trianik_diary VALUES("76330","38306","255","U","N","2015-12-02 14:30:00","","","2015-12-02 16:30:00","","","","","38342");
INSERT INTO trianik_diary VALUES("76331","38276","249","U","N","2015-12-04 11:30:00","","","2015-12-04 15:30:00","","","","","38307");
INSERT INTO trianik_diary VALUES("76332","38297","254","U","N","2015-12-01 12:30:00","","","2015-12-01 14:30:00","","","","","38332");
INSERT INTO trianik_diary VALUES("76333","38326","257","U","N","2015-12-04 10:15:00","","","2015-12-04 11:45:00","","","","","38364");
INSERT INTO trianik_diary VALUES("76334","38318","258","U","N","2015-12-02 11:30:00","","","2015-12-02 14:30:00","","","","","38356");
INSERT INTO trianik_diary VALUES("76335","38265","249","U","N","2015-11-30 09:00:00","","","2015-11-30 11:00:00","","","","","38292");
INSERT INTO trianik_diary VALUES("76336","38265","249","U","N","2015-12-01 09:00:00","","","2015-12-01 11:00:00","","","","","38293");
INSERT INTO trianik_diary VALUES("76337","38265","249","U","N","2015-12-02 09:00:00","","","2015-12-02 11:00:00","","","","","38294");
INSERT INTO trianik_diary VALUES("76338","38265","249","U","N","2015-12-03 09:00:00","","","2015-12-03 11:00:00","","","","","38295");
INSERT INTO trianik_diary VALUES("76339","38265","249","U","N","2015-12-04 09:00:00","","","2015-12-04 11:00:00","","","","","38296");
INSERT INTO trianik_diary VALUES("76340","38270","249","U","N","2015-12-02 11:30:00","","","2015-12-02 13:30:00","","","","","38301");
INSERT INTO trianik_diary VALUES("76341","38291","248","U","N","2015-12-01 09:00:00","","","2015-12-01 11:00:00","","","","","38326");
INSERT INTO trianik_diary VALUES("76342","38275","249","U","N","2015-12-03 13:00:00","","","2015-12-03 15:00:00","","","","","38306");
INSERT INTO trianik_diary VALUES("76343","38307","255","U","N","2015-12-04 09:00:00","","","2015-12-04 11:00:00","","","","","38343");
INSERT INTO trianik_diary VALUES("76344","38282","252","U","N","2015-12-04 14:00:00","","","2015-12-04 16:00:00","","","","","38315");
INSERT INTO trianik_diary VALUES("76345","38323","255","U","N","2015-11-30 09:00:00","","","2015-11-30 13:00:00","","","","","38361");
INSERT INTO trianik_diary VALUES("76346","38249","248","U","N","2015-12-01 12:00:00","","","2015-12-01 14:00:00","","","","","38273");
INSERT INTO trianik_diary VALUES("76347","38293","256","U","N","2015-12-02 12:30:00","","","2015-12-02 15:30:00","","","","","38328");
INSERT INTO trianik_diary VALUES("76348","38251","248","U","N","2015-12-01 14:30:00","","","2015-12-01 17:00:00","","","","","38276");
INSERT INTO trianik_diary VALUES("76349","38266","249","U","N","2015-11-30 11:30:00","","","2015-11-30 13:30:00","","","","","38297");
INSERT INTO trianik_diary VALUES("76350","38267","255","U","N","2015-12-04 11:30:00","","","2015-12-04 13:30:00","","","","","38298");
INSERT INTO trianik_diary VALUES("76351","38296","256","U","N","2015-12-04 11:30:00","","","2015-12-04 13:30:00","","","","","38331");
INSERT INTO trianik_diary VALUES("76352","38301","255","U","N","2015-11-30 13:30:00","","","2015-11-30 15:30:00","","","","","38336");
INSERT INTO trianik_diary VALUES("76353","38298","254","U","N","2015-11-30 12:30:00","","","2015-11-30 15:30:00","","","","","38333");
INSERT INTO trianik_diary VALUES("76354","38305","255","U","N","2015-12-02 12:30:00","","","2015-12-02 14:30:00","","","","","38341");
INSERT INTO trianik_diary VALUES("76355","38278","252","U","N","2015-12-01 12:00:00","","","2015-12-01 14:00:00","","","","","38310");
INSERT INTO trianik_diary VALUES("76356","38278","252","U","N","2015-12-04 09:30:00","","","2015-12-04 11:30:00","","","","","38311");
INSERT INTO trianik_diary VALUES("76357","38273","250","U","N","2015-12-01 09:00:00","","","2015-12-01 12:00:00","","","","","38304");
INSERT INTO trianik_diary VALUES("76358","38332","259","U","N","2015-12-01 09:00:00","","","2015-12-01 11:00:00","","","","","38373");
INSERT INTO trianik_diary VALUES("76359","38269","249","U","N","2015-12-01 11:30:00","","","2015-12-01 14:30:00","","","","","38300");
INSERT INTO trianik_diary VALUES("76360","38256","250","U","N","2015-11-30 09:30:00","","","2015-11-30 12:00:00","","","","","38283");
INSERT INTO trianik_diary VALUES("76361","38294","256","U","N","2015-12-03 12:30:00","","","2015-12-03 16:30:00","","","","","38329");
INSERT INTO trianik_diary VALUES("76362","38247","248","U","N","2015-11-30 18:00:00","","","2015-11-30 19:00:00","","","","","38263");
INSERT INTO trianik_diary VALUES("76363","38247","248","U","N","2015-12-03 18:00:00","","","2015-12-03 19:00:00","","","","","38266");
INSERT INTO trianik_diary VALUES("76364","38247","248","U","N","2015-12-04 18:30:00","","","2015-12-04 19:30:00","","","","","38267");
INSERT INTO trianik_diary VALUES("76365","38310","258","U","N","2015-11-30 11:30:00","","","2015-11-30 14:30:00","","","","","38347");
INSERT INTO trianik_diary VALUES("76366","38331","249","U","N","2015-12-02 14:00:00","","","2015-12-02 16:00:00","","","","","38372");
INSERT INTO trianik_diary VALUES("76367","38324","257","U","N","2015-11-30 08:00:00","","","2015-11-30 11:00:00","","","","","38362");
INSERT INTO trianik_diary VALUES("76368","38248","248","U","N","2015-11-30 19:00:00","","","2015-11-30 22:30:00","","","","","38268");
INSERT INTO trianik_diary VALUES("76369","38248","248","U","N","2015-12-01 16:30:00","","","2015-12-01 20:00:00","","","","","38269");
INSERT INTO trianik_diary VALUES("76370","38248","248","U","N","2015-12-02 19:00:00","","","2015-12-02 22:00:00","","","","","38270");
INSERT INTO trianik_diary VALUES("76371","38248","248","U","N","2015-12-03 19:00:00","","","2015-12-03 22:00:00","","","","","38271");
INSERT INTO trianik_diary VALUES("76372","38248","248","U","N","2015-12-04 15:30:00","","","2015-12-04 18:30:00","","","","","38272");
INSERT INTO trianik_diary VALUES("76373","38286","253","U","N","2015-12-03 09:30:00","","","2015-12-03 12:30:00","","","","","38320");
INSERT INTO trianik_diary VALUES("76374","38264","250","U","N","2015-12-04 11:30:00","","","2015-12-04 15:30:00","","","","","38291");
INSERT INTO trianik_diary VALUES("76375","38304","255","U","N","2015-12-02 09:00:00","","","2015-12-02 11:30:00","","","","","38340");
INSERT INTO trianik_diary VALUES("76376","38289","256","U","N","2015-11-30 09:00:00","","","2015-11-30 12:00:00","","","","","38323");
INSERT INTO trianik_diary VALUES("76377","38289","256","U","N","2015-12-03 09:00:00","","","2015-12-03 12:00:00","","","","","38324");
INSERT INTO trianik_diary VALUES("76378","38325","257","U","N","2015-12-04 08:00:00","","","2015-12-04 10:00:00","","","","","38363");
INSERT INTO trianik_diary VALUES("76379","38257","257","U","N","2015-11-30 09:00:00","","","2015-11-30 11:00:00","","","","","38284");
INSERT INTO trianik_diary VALUES("76380","38327","255","U","N","2015-12-03 18:00:00","","","2015-12-03 19:00:00","","","","","38365");
INSERT INTO trianik_diary VALUES("76381","38315","255","U","N","2015-12-03 09:00:00","","","2015-12-03 11:00:00","","","","","38352");
INSERT INTO trianik_diary VALUES("76382","38321","254","U","N","2015-12-03 12:30:00","","","2015-12-03 15:30:00","","","","","38359");
INSERT INTO trianik_diary VALUES("76383","38329","257","U","N","2015-11-30 13:30:00","","","2015-11-30 15:30:00","","","","","38370");
INSERT INTO trianik_diary VALUES("76384","38300","254","U","N","2015-12-04 12:30:00","","","2015-12-04 14:30:00","","","","","38335");
INSERT INTO trianik_diary VALUES("76385","38260","250","U","N","2015-12-02 09:00:00","","","2015-12-02 11:00:00","","","","","38287");
INSERT INTO trianik_diary VALUES("76386","38261","248","U","N","2015-12-04 08:35:00","","","2015-12-04 15:35:00","","","","","38382");
INSERT INTO trianik_diary VALUES("76387","38277","252","U","N","2015-12-08 09:30:00","","","2015-12-08 11:30:00","","","","","38308");
INSERT INTO trianik_diary VALUES("76388","38277","252","U","N","2015-12-10 09:30:00","","","2015-12-10 11:30:00","","","","","38309");
INSERT INTO trianik_diary VALUES("76389","38317","258","U","N","2015-12-08 11:30:00","","","2015-12-08 13:30:00","","","","","38355");
INSERT INTO trianik_diary VALUES("76390","38309","258","U","N","2015-12-07 09:00:00","","","2015-12-07 10:30:00","","","","","38345");
INSERT INTO trianik_diary VALUES("76391","38309","258","U","N","2015-12-11 11:30:00","","","2015-12-11 13:00:00","","","","","38346");
INSERT INTO trianik_diary VALUES("76392","38316","258","U","N","2015-12-08 09:00:00","","","2015-12-08 11:00:00","","","","","38353");
INSERT INTO trianik_diary VALUES("76393","38316","258","U","N","2015-12-11 09:00:00","","","2015-12-11 11:00:00","","","","","38354");
INSERT INTO trianik_diary VALUES("76394","38314","257","U","N","2015-12-11 12:30:00","","","2015-12-11 15:30:00","","","","","38351");
INSERT INTO trianik_diary VALUES("76395","38268","249","U","N","2015-12-07 15:00:00","","","2015-12-07 16:00:00","","","","","38299");
INSERT INTO trianik_diary VALUES("76396","38280","252","U","N","2015-12-10 12:00:00","","","2015-12-10 16:00:00","","","","","38313");
INSERT INTO trianik_diary VALUES("76397","38284","253","U","N","2015-12-08 09:30:00","","","2015-12-08 14:30:00","","","","","38317");
INSERT INTO trianik_diary VALUES("76398","38284","253","U","N","2015-12-10 11:30:00","","","2015-12-10 13:30:00","","","","","38318");
INSERT INTO trianik_diary VALUES("76399","38252","251","U","N","2015-12-07 09:30:00","","","2015-12-07 12:30:00","","","","","38277");
INSERT INTO trianik_diary VALUES("76400","38252","251","U","N","2015-12-09 10:30:00","","","2015-12-09 14:30:00","","","","","38278");
INSERT INTO trianik_diary VALUES("76401","38252","251","U","N","2015-12-11 09:00:00","","","2015-12-11 13:00:00","","","","","38279");
INSERT INTO trianik_diary VALUES("76402","38311","257","U","N","2015-12-07 15:30:00","","","2015-12-07 17:30:00","","","","","38348");
INSERT INTO trianik_diary VALUES("76403","38333","251","U","N","2015-12-11 13:30:00","","","2015-12-11 15:30:00","","","","","38375");
INSERT INTO trianik_diary VALUES("76404","38303","255","U","N","2015-12-08 09:00:00","","","2015-12-08 11:00:00","","","","","38338");
INSERT INTO trianik_diary VALUES("76405","38303","255","U","N","2015-12-10 15:00:00","","","2015-12-10 17:00:00","","","","","38339");
INSERT INTO trianik_diary VALUES("76406","38281","252","U","N","2015-12-11 12:00:00","","","2015-12-11 14:00:00","","","","","38314");
INSERT INTO trianik_diary VALUES("76407","38287","253","U","N","2015-12-11 09:30:00","","","2015-12-11 13:00:00","","","","","38321");
INSERT INTO trianik_diary VALUES("76408","38245","248","U","N","2015-12-07 08:30:00","","","2015-12-07 12:30:00","","","","","38261");
INSERT INTO trianik_diary VALUES("76409","38319","258","U","N","2015-12-10 09:00:00","","","2015-12-10 13:00:00","","","","","38357");
INSERT INTO trianik_diary VALUES("76410","38285","253","U","N","2015-12-09 12:30:00","","","2015-12-09 14:30:00","","","","","38319");
INSERT INTO trianik_diary VALUES("76411","38246","248","U","N","2015-12-07 13:30:00","","","2015-12-07 15:30:00","","","","","38262");
INSERT INTO trianik_diary VALUES("76412","38259","250","U","N","2015-12-08 09:00:00","","","2015-12-08 11:00:00","","","","","38286");
INSERT INTO trianik_diary VALUES("76413","38255","251","U","N","2015-12-09 09:00:00","","","2015-12-09 10:30:00","","","","","38282");
INSERT INTO trianik_diary VALUES("76414","38250","248","U","N","2015-12-08 14:30:00","","","2015-12-08 16:30:00","","","","","38274");
INSERT INTO trianik_diary VALUES("76415","38320","258","U","N","2015-12-10 13:30:00","","","2015-12-10 16:30:00","","","","","38358");
INSERT INTO trianik_diary VALUES("76416","38313","255","U","N","2015-12-11 16:00:00","","","2015-12-11 18:00:00","","","","","38350");
INSERT INTO trianik_diary VALUES("76417","38253","251","U","N","2015-12-07 12:30:00","","","2015-12-07 14:30:00","","","","","38280");
INSERT INTO trianik_diary VALUES("76418","38253","251","U","N","2015-12-10 11:30:00","","","2015-12-10 13:30:00","","","","","38281");
INSERT INTO trianik_diary VALUES("76419","38308","255","U","N","2015-12-11 14:00:00","","","2015-12-11 16:00:00","","","","","38344");
INSERT INTO trianik_diary VALUES("76420","38295","256","U","N","2015-12-11 09:00:00","","","2015-12-11 11:00:00","","","","","38330");
INSERT INTO trianik_diary VALUES("76421","38283","251","U","N","2015-12-10 09:00:00","","","2015-12-10 11:00:00","","","","","38316");
INSERT INTO trianik_diary VALUES("76422","38290","256","U","N","2015-12-07 12:30:00","","","2015-12-07 15:30:00","","","","","38325");
INSERT INTO trianik_diary VALUES("76423","38322","255","U","N","2015-12-10 11:30:00","","","2015-12-10 14:30:00","","","","","38360");
INSERT INTO trianik_diary VALUES("76424","38292","256","U","N","2015-12-08 12:30:00","","","2015-12-08 16:30:00","","","","","38327");
INSERT INTO trianik_diary VALUES("76425","38263","250","U","N","2015-12-10 12:30:00","","","2015-12-10 14:30:00","","","","","38290");
INSERT INTO trianik_diary VALUES("76426","38279","252","U","N","2015-12-08 14:30:00","","","2015-12-08 16:30:00","","","","","38312");
INSERT INTO trianik_diary VALUES("76427","38258","250","U","N","2015-12-08 09:00:00","","","2015-12-08 11:00:00","","","","","38285");
INSERT INTO trianik_diary VALUES("76428","38306","255","U","N","2015-12-09 14:30:00","","","2015-12-09 16:30:00","","","","","38342");
INSERT INTO trianik_diary VALUES("76429","38276","249","U","N","2015-12-11 11:30:00","","","2015-12-11 15:30:00","","","","","38307");
INSERT INTO trianik_diary VALUES("76430","38297","254","U","N","2015-12-08 12:30:00","","","2015-12-08 14:30:00","","","","","38332");
INSERT INTO trianik_diary VALUES("76431","38318","258","U","N","2015-12-09 11:30:00","","","2015-12-09 14:30:00","","","","","38356");
INSERT INTO trianik_diary VALUES("76432","38302","255","U","N","2015-12-07 15:30:00","","","2015-12-07 17:30:00","","","","","38337");
INSERT INTO trianik_diary VALUES("76433","38299","254","U","N","2015-12-10 12:30:00","","","2015-12-10 14:30:00","","","","","38334");
INSERT INTO trianik_diary VALUES("76434","38265","249","U","N","2015-12-07 09:00:00","","","2015-12-07 11:00:00","","","","","38292");
INSERT INTO trianik_diary VALUES("76435","38265","249","U","N","2015-12-08 09:00:00","","","2015-12-08 11:00:00","","","","","38293");
INSERT INTO trianik_diary VALUES("76436","38265","249","U","N","2015-12-09 09:00:00","","","2015-12-09 11:00:00","","","","","38294");
INSERT INTO trianik_diary VALUES("76437","38265","249","U","N","2015-12-10 09:00:00","","","2015-12-10 11:00:00","","","","","38295");
INSERT INTO trianik_diary VALUES("76438","38265","249","U","N","2015-12-11 09:00:00","","","2015-12-11 11:00:00","","","","","38296");
INSERT INTO trianik_diary VALUES("76439","38330","257","U","N","2015-12-07 11:15:00","","","2015-12-07 13:45:00","","","","","38371");
INSERT INTO trianik_diary VALUES("76440","38291","248","U","N","2015-12-08 09:00:00","","","2015-12-08 11:00:00","","","","","38326");
INSERT INTO trianik_diary VALUES("76441","38275","249","U","N","2015-12-10 13:00:00","","","2015-12-10 15:00:00","","","","","38306");
INSERT INTO trianik_diary VALUES("76442","38307","255","U","N","2015-12-11 09:00:00","","","2015-12-11 11:00:00","","","","","38343");
INSERT INTO trianik_diary VALUES("76443","38282","252","U","N","2015-12-11 14:00:00","","","2015-12-11 16:00:00","","","","","38315");
INSERT INTO trianik_diary VALUES("76444","38312","257","U","N","2015-12-11 09:00:00","","","2015-12-11 13:00:00","","","","","38349");
INSERT INTO trianik_diary VALUES("76445","38323","255","U","N","2015-12-07 09:00:00","","","2015-12-07 13:00:00","","","","","38361");
INSERT INTO trianik_diary VALUES("76446","38249","248","U","N","2015-12-08 12:00:00","","","2015-12-08 14:00:00","","","","","38273");
INSERT INTO trianik_diary VALUES("76447","38293","256","U","N","2015-12-09 12:30:00","","","2015-12-09 15:30:00","","","","","38328");
INSERT INTO trianik_diary VALUES("76448","38266","249","U","N","2015-12-07 11:30:00","","","2015-12-07 13:30:00","","","","","38297");
INSERT INTO trianik_diary VALUES("76449","38267","255","U","N","2015-12-11 11:30:00","","","2015-12-11 13:30:00","","","","","38298");
INSERT INTO trianik_diary VALUES("76450","38296","256","U","N","2015-12-11 11:30:00","","","2015-12-11 13:30:00","","","","","38331");
INSERT INTO trianik_diary VALUES("76451","38301","255","U","N","2015-12-07 13:30:00","","","2015-12-07 15:30:00","","","","","38336");
INSERT INTO trianik_diary VALUES("76452","38298","254","U","N","2015-12-07 12:30:00","","","2015-12-07 15:30:00","","","","","38333");
INSERT INTO trianik_diary VALUES("76453","38262","250","U","N","2015-12-10 09:00:00","","","2015-12-10 12:00:00","","","","","38289");
INSERT INTO trianik_diary VALUES("76454","38305","255","U","N","2015-12-09 12:30:00","","","2015-12-09 14:30:00","","","","","38341");
INSERT INTO trianik_diary VALUES("76455","38278","252","U","N","2015-12-08 12:00:00","","","2015-12-08 14:00:00","","","","","38310");
INSERT INTO trianik_diary VALUES("76456","38278","252","U","N","2015-12-11 09:30:00","","","2015-12-11 11:30:00","","","","","38311");
INSERT INTO trianik_diary VALUES("76457","38269","249","U","N","2015-12-08 11:30:00","","","2015-12-08 14:30:00","","","","","38300");
INSERT INTO trianik_diary VALUES("76458","38256","250","U","N","2015-12-07 09:30:00","","","2015-12-07 12:00:00","","","","","38283");
INSERT INTO trianik_diary VALUES("76459","38294","256","U","N","2015-12-10 12:30:00","","","2015-12-10 16:30:00","","","","","38329");
INSERT INTO trianik_diary VALUES("76460","38247","248","U","N","2015-12-07 18:00:00","","","2015-12-07 19:00:00","","","","","38263");
INSERT INTO trianik_diary VALUES("76461","38247","248","U","N","2015-12-10 18:00:00","","","2015-12-10 19:00:00","","","","","38266");
INSERT INTO trianik_diary VALUES("76462","38247","248","U","N","2015-12-11 18:30:00","","","2015-12-11 19:30:00","","","","","38267");
INSERT INTO trianik_diary VALUES("76463","38310","258","U","N","2015-12-07 11:30:00","","","2015-12-07 14:30:00","","","","","38347");
INSERT INTO trianik_diary VALUES("76464","38248","248","U","N","2015-12-07 19:00:00","","","2015-12-07 22:30:00","","","","","38268");
INSERT INTO trianik_diary VALUES("76465","38248","248","U","N","2015-12-08 16:30:00","","","2015-12-08 20:00:00","","","","","38269");
INSERT INTO trianik_diary VALUES("76466","38248","248","U","N","2015-12-09 19:00:00","","","2015-12-09 22:00:00","","","","","38270");
INSERT INTO trianik_diary VALUES("76467","38248","248","U","N","2015-12-10 19:00:00","","","2015-12-10 22:00:00","","","","","38271");
INSERT INTO trianik_diary VALUES("76468","38248","248","U","N","2015-12-11 15:30:00","","","2015-12-11 18:30:00","","","","","38272");
INSERT INTO trianik_diary VALUES("76469","38286","253","U","N","2015-12-10 09:30:00","","","2015-12-10 12:30:00","","","","","38320");
INSERT INTO trianik_diary VALUES("76470","38264","250","U","N","2015-12-11 11:30:00","","","2015-12-11 15:30:00","","","","","38291");
INSERT INTO trianik_diary VALUES("76471","38272","249","U","N","2015-12-10 11:30:00","","","2015-12-10 13:30:00","","","","","38303");
INSERT INTO trianik_diary VALUES("76472","38304","255","U","N","2015-12-09 09:00:00","","","2015-12-09 11:30:00","","","","","38340");
INSERT INTO trianik_diary VALUES("76473","38289","256","U","N","2015-12-07 09:00:00","","","2015-12-07 12:00:00","","","","","38323");
INSERT INTO trianik_diary VALUES("76474","38289","256","U","N","2015-12-10 09:00:00","","","2015-12-10 12:00:00","","","","","38324");
INSERT INTO trianik_diary VALUES("76475","38257","257","U","N","2015-12-07 09:00:00","","","2015-12-07 11:00:00","","","","","38284");
INSERT INTO trianik_diary VALUES("76476","38327","255","U","N","2015-12-10 18:00:00","","","2015-12-10 19:00:00","","","","","38365");
INSERT INTO trianik_diary VALUES("76477","38315","255","U","N","2015-12-10 09:00:00","","","2015-12-10 11:00:00","","","","","38352");
INSERT INTO trianik_diary VALUES("76478","38329","257","U","N","2015-12-07 13:30:00","","","2015-12-07 15:30:00","","","","","38370");
INSERT INTO trianik_diary VALUES("76479","38300","254","U","N","2015-12-11 12:30:00","","","2015-12-11 14:30:00","","","","","38335");
INSERT INTO trianik_diary VALUES("76480","38260","250","U","N","2015-12-09 09:00:00","","","2015-12-09 11:00:00","","","","","38287");
INSERT INTO trianik_diary VALUES("76481","38261","248","U","N","2015-12-11 08:35:00","","","2015-12-11 15:35:00","","","","","38382");
INSERT INTO trianik_diary VALUES("76482","38277","252","U","N","2015-12-15 09:30:00","","","2015-12-15 11:30:00","","","","","38308");
INSERT INTO trianik_diary VALUES("76483","38277","252","U","N","2015-12-17 09:30:00","","","2015-12-17 11:30:00","","","","","38309");
INSERT INTO trianik_diary VALUES("76484","38274","250","U","N","2015-12-17 09:00:00","","","2015-12-17 12:00:00","","","","","38305");
INSERT INTO trianik_diary VALUES("76485","38317","258","U","N","2015-12-15 11:30:00","","","2015-12-15 13:30:00","","","","","38355");
INSERT INTO trianik_diary VALUES("76486","38309","258","U","N","2015-12-14 09:00:00","","","2015-12-14 10:30:00","","","","","38345");
INSERT INTO trianik_diary VALUES("76487","38309","258","U","N","2015-12-18 11:30:00","","","2015-12-18 13:00:00","","","","","38346");
INSERT INTO trianik_diary VALUES("76488","38316","258","U","N","2015-12-15 09:00:00","","","2015-12-15 11:00:00","","","","","38353");
INSERT INTO trianik_diary VALUES("76489","38316","258","U","N","2015-12-18 09:00:00","","","2015-12-18 11:00:00","","","","","38354");
INSERT INTO trianik_diary VALUES("76490","38314","257","U","N","2015-12-18 12:30:00","","","2015-12-18 15:30:00","","","","","38351");
INSERT INTO trianik_diary VALUES("76491","38280","252","U","N","2015-12-17 12:00:00","","","2015-12-17 16:00:00","","","","","38313");
INSERT INTO trianik_diary VALUES("76492","38284","253","U","N","2015-12-15 09:30:00","","","2015-12-15 14:30:00","","","","","38317");
INSERT INTO trianik_diary VALUES("76493","38284","253","U","N","2015-12-17 11:30:00","","","2015-12-17 13:30:00","","","","","38318");
INSERT INTO trianik_diary VALUES("76494","38252","251","U","N","2015-12-14 09:30:00","","","2015-12-14 12:30:00","","","","","38277");
INSERT INTO trianik_diary VALUES("76495","38252","251","U","N","2015-12-16 10:30:00","","","2015-12-16 14:30:00","","","","","38278");
INSERT INTO trianik_diary VALUES("76496","38252","251","U","N","2015-12-18 09:00:00","","","2015-12-18 13:00:00","","","","","38279");
INSERT INTO trianik_diary VALUES("76497","38311","257","U","N","2015-12-14 15:30:00","","","2015-12-14 17:30:00","","","","","38348");
INSERT INTO trianik_diary VALUES("76498","38333","251","U","N","2015-12-18 13:30:00","","","2015-12-18 15:30:00","","","","","38375");
INSERT INTO trianik_diary VALUES("76499","38303","255","U","N","2015-12-15 09:00:00","","","2015-12-15 11:00:00","","","","","38338");
INSERT INTO trianik_diary VALUES("76500","38303","255","U","N","2015-12-17 15:00:00","","","2015-12-17 17:00:00","","","","","38339");
INSERT INTO trianik_diary VALUES("76501","38271","249","U","N","2015-12-16 14:00:00","","","2015-12-16 16:00:00","","","","","38302");
INSERT INTO trianik_diary VALUES("76502","38245","248","U","N","2015-12-14 08:30:00","","","2015-12-14 12:30:00","","","","","38261");
INSERT INTO trianik_diary VALUES("76503","38319","258","U","N","2015-12-17 09:00:00","","","2015-12-17 13:00:00","","","","","38357");
INSERT INTO trianik_diary VALUES("76504","38285","253","U","N","2015-12-16 12:30:00","","","2015-12-16 14:30:00","","","","","38319");
INSERT INTO trianik_diary VALUES("76505","38246","248","U","N","2015-12-14 13:30:00","","","2015-12-14 15:30:00","","","","","38262");
INSERT INTO trianik_diary VALUES("76506","38259","250","U","N","2015-12-15 09:00:00","","","2015-12-15 11:00:00","","","","","38286");
INSERT INTO trianik_diary VALUES("76507","38320","258","U","N","2015-12-17 13:30:00","","","2015-12-17 16:30:00","","","","","38358");
INSERT INTO trianik_diary VALUES("76508","38253","251","U","N","2015-12-14 12:30:00","","","2015-12-14 14:30:00","","","","","38280");
INSERT INTO trianik_diary VALUES("76509","38253","251","U","N","2015-12-17 11:30:00","","","2015-12-17 13:30:00","","","","","38281");
INSERT INTO trianik_diary VALUES("76510","38308","255","U","N","2015-12-18 14:00:00","","","2015-12-18 16:00:00","","","","","38344");
INSERT INTO trianik_diary VALUES("76511","38295","256","U","N","2015-12-18 09:00:00","","","2015-12-18 11:00:00","","","","","38330");
INSERT INTO trianik_diary VALUES("76512","38288","253","U","N","2015-12-18 09:30:00","","","2015-12-18 13:30:00","","","","","38322");
INSERT INTO trianik_diary VALUES("76513","38283","251","U","N","2015-12-17 09:00:00","","","2015-12-17 11:00:00","","","","","38316");
INSERT INTO trianik_diary VALUES("76514","38290","256","U","N","2015-12-14 12:30:00","","","2015-12-14 15:30:00","","","","","38325");
INSERT INTO trianik_diary VALUES("76515","38322","255","U","N","2015-12-17 11:30:00","","","2015-12-17 14:30:00","","","","","38360");
INSERT INTO trianik_diary VALUES("76516","38292","256","U","N","2015-12-15 12:30:00","","","2015-12-15 16:30:00","","","","","38327");
INSERT INTO trianik_diary VALUES("76517","38263","250","U","N","2015-12-17 12:30:00","","","2015-12-17 14:30:00","","","","","38290");
INSERT INTO trianik_diary VALUES("76518","38279","252","U","N","2015-12-15 14:30:00","","","2015-12-15 16:30:00","","","","","38312");
INSERT INTO trianik_diary VALUES("76519","38306","255","U","N","2015-12-16 14:30:00","","","2015-12-16 16:30:00","","","","","38342");
INSERT INTO trianik_diary VALUES("76520","38276","249","U","N","2015-12-18 11:30:00","","","2015-12-18 15:30:00","","","","","38307");
INSERT INTO trianik_diary VALUES("76521","38297","254","U","N","2015-12-15 12:30:00","","","2015-12-15 14:30:00","","","","","38332");
INSERT INTO trianik_diary VALUES("76522","38326","257","U","N","2015-12-18 10:15:00","","","2015-12-18 11:45:00","","","","","38364");
INSERT INTO trianik_diary VALUES("76523","38318","258","U","N","2015-12-16 11:30:00","","","2015-12-16 14:30:00","","","","","38356");
INSERT INTO trianik_diary VALUES("76524","38265","249","U","N","2015-12-14 09:00:00","","","2015-12-14 11:00:00","","","","","38292");
INSERT INTO trianik_diary VALUES("76525","38265","249","U","N","2015-12-15 09:00:00","","","2015-12-15 11:00:00","","","","","38293");
INSERT INTO trianik_diary VALUES("76526","38265","249","U","N","2015-12-16 09:00:00","","","2015-12-16 11:00:00","","","","","38294");
INSERT INTO trianik_diary VALUES("76527","38265","249","U","N","2015-12-17 09:00:00","","","2015-12-17 11:00:00","","","","","38295");
INSERT INTO trianik_diary VALUES("76528","38265","249","U","N","2015-12-18 09:00:00","","","2015-12-18 11:00:00","","","","","38296");
INSERT INTO trianik_diary VALUES("76529","38270","249","U","N","2015-12-16 11:30:00","","","2015-12-16 13:30:00","","","","","38301");
INSERT INTO trianik_diary VALUES("76530","38291","248","U","N","2015-12-15 09:00:00","","","2015-12-15 11:00:00","","","","","38326");
INSERT INTO trianik_diary VALUES("76531","38275","249","U","N","2015-12-17 13:00:00","","","2015-12-17 15:00:00","","","","","38306");
INSERT INTO trianik_diary VALUES("76532","38307","255","U","N","2015-12-18 09:00:00","","","2015-12-18 11:00:00","","","","","38343");
INSERT INTO trianik_diary VALUES("76533","38282","252","U","N","2015-12-18 14:00:00","","","2015-12-18 16:00:00","","","","","38315");
INSERT INTO trianik_diary VALUES("76534","38323","255","U","N","2015-12-14 09:00:00","","","2015-12-14 13:00:00","","","","","38361");
INSERT INTO trianik_diary VALUES("76535","38249","248","U","N","2015-12-15 12:00:00","","","2015-12-15 14:00:00","","","","","38273");
INSERT INTO trianik_diary VALUES("76536","38293","256","U","N","2015-12-16 12:30:00","","","2015-12-16 15:30:00","","","","","38328");
INSERT INTO trianik_diary VALUES("76537","38251","248","U","N","2015-12-15 14:30:00","","","2015-12-15 17:00:00","","","","","38276");
INSERT INTO trianik_diary VALUES("76538","38266","249","U","N","2015-12-14 11:30:00","","","2015-12-14 13:30:00","","","","","38297");
INSERT INTO trianik_diary VALUES("76539","38267","255","U","N","2015-12-18 11:30:00","","","2015-12-18 13:30:00","","","","","38298");
INSERT INTO trianik_diary VALUES("76540","38296","256","U","N","2015-12-18 11:30:00","","","2015-12-18 13:30:00","","","","","38331");
INSERT INTO trianik_diary VALUES("76541","38301","255","U","N","2015-12-14 13:30:00","","","2015-12-14 15:30:00","","","","","38336");
INSERT INTO trianik_diary VALUES("76542","38298","254","U","N","2015-12-14 12:30:00","","","2015-12-14 15:30:00","","","","","38333");
INSERT INTO trianik_diary VALUES("76543","38305","255","U","N","2015-12-16 12:30:00","","","2015-12-16 14:30:00","","","","","38341");
INSERT INTO trianik_diary VALUES("76544","38278","252","U","N","2015-12-15 12:00:00","","","2015-12-15 14:00:00","","","","","38310");
INSERT INTO trianik_diary VALUES("76545","38278","252","U","N","2015-12-18 09:30:00","","","2015-12-18 11:30:00","","","","","38311");
INSERT INTO trianik_diary VALUES("76546","38273","250","U","N","2015-12-15 09:00:00","","","2015-12-15 12:00:00","","","","","38304");
INSERT INTO trianik_diary VALUES("76547","38332","259","U","N","2015-12-15 09:00:00","","","2015-12-15 11:00:00","","","","","38373");
INSERT INTO trianik_diary VALUES("76548","38269","249","U","N","2015-12-15 11:30:00","","","2015-12-15 14:30:00","","","","","38300");
INSERT INTO trianik_diary VALUES("76549","38256","250","U","N","2015-12-14 09:30:00","","","2015-12-14 12:00:00","","","","","38283");
INSERT INTO trianik_diary VALUES("76550","38294","256","U","N","2015-12-17 12:30:00","","","2015-12-17 16:30:00","","","","","38329");
INSERT INTO trianik_diary VALUES("76551","38247","248","U","N","2015-12-14 18:00:00","","","2015-12-14 19:00:00","","","","","38263");
INSERT INTO trianik_diary VALUES("76552","38247","248","U","N","2015-12-17 18:00:00","","","2015-12-17 19:00:00","","","","","38266");
INSERT INTO trianik_diary VALUES("76553","38247","248","U","N","2015-12-18 18:30:00","","","2015-12-18 19:30:00","","","","","38267");
INSERT INTO trianik_diary VALUES("76554","38310","258","U","N","2015-12-14 11:30:00","","","2015-12-14 14:30:00","","","","","38347");
INSERT INTO trianik_diary VALUES("76555","38331","249","U","N","2015-12-16 14:00:00","","","2015-12-16 16:00:00","","","","","38372");
INSERT INTO trianik_diary VALUES("76556","38324","257","U","N","2015-12-14 08:00:00","","","2015-12-14 11:00:00","","","","","38362");
INSERT INTO trianik_diary VALUES("76557","38248","248","U","N","2015-12-14 19:00:00","","","2015-12-14 22:30:00","","","","","38268");
INSERT INTO trianik_diary VALUES("76558","38248","248","U","N","2015-12-15 16:30:00","","","2015-12-15 20:00:00","","","","","38269");
INSERT INTO trianik_diary VALUES("76559","38248","248","U","N","2015-12-16 19:00:00","","","2015-12-16 22:00:00","","","","","38270");
INSERT INTO trianik_diary VALUES("76560","38248","248","U","N","2015-12-17 19:00:00","","","2015-12-17 22:00:00","","","","","38271");
INSERT INTO trianik_diary VALUES("76561","38248","248","U","N","2015-12-18 15:30:00","","","2015-12-18 18:30:00","","","","","38272");
INSERT INTO trianik_diary VALUES("76562","38286","253","U","N","2015-12-17 09:30:00","","","2015-12-17 12:30:00","","","","","38320");
INSERT INTO trianik_diary VALUES("76563","38264","250","U","N","2015-12-18 11:30:00","","","2015-12-18 15:30:00","","","","","38291");
INSERT INTO trianik_diary VALUES("76564","38304","255","U","N","2015-12-16 09:00:00","","","2015-12-16 11:30:00","","","","","38340");
INSERT INTO trianik_diary VALUES("76565","38289","256","U","N","2015-12-14 09:00:00","","","2015-12-14 12:00:00","","","","","38323");
INSERT INTO trianik_diary VALUES("76566","38289","256","U","N","2015-12-17 09:00:00","","","2015-12-17 12:00:00","","","","","38324");
INSERT INTO trianik_diary VALUES("76567","38325","257","U","N","2015-12-18 08:00:00","","","2015-12-18 10:00:00","","","","","38363");
INSERT INTO trianik_diary VALUES("76568","38257","257","U","N","2015-12-14 09:00:00","","","2015-12-14 11:00:00","","","","","38284");
INSERT INTO trianik_diary VALUES("76569","38327","255","U","N","2015-12-17 18:00:00","","","2015-12-17 19:00:00","","","","","38365");
INSERT INTO trianik_diary VALUES("76570","38315","255","U","N","2015-12-17 09:00:00","","","2015-12-17 11:00:00","","","","","38352");
INSERT INTO trianik_diary VALUES("76571","38321","254","U","N","2015-12-17 12:30:00","","","2015-12-17 15:30:00","","","","","38359");
INSERT INTO trianik_diary VALUES("76572","38329","257","U","N","2015-12-14 13:30:00","","","2015-12-14 15:30:00","","","","","38370");
INSERT INTO trianik_diary VALUES("76573","38300","254","U","N","2015-12-18 12:30:00","","","2015-12-18 14:30:00","","","","","38335");
INSERT INTO trianik_diary VALUES("76574","38260","250","U","N","2015-12-16 09:00:00","","","2015-12-16 11:00:00","","","","","38287");
INSERT INTO trianik_diary VALUES("76575","38261","248","U","N","2015-12-18 08:35:00","","","2015-12-18 15:35:00","","","","","38382");
INSERT INTO trianik_diary VALUES("76576","38277","252","U","N","2015-12-22 09:30:00","","","2015-12-22 11:30:00","","","","","38308");
INSERT INTO trianik_diary VALUES("76577","38277","252","U","N","2015-12-24 09:30:00","","","2015-12-24 11:30:00","","","","","38309");
INSERT INTO trianik_diary VALUES("76578","38317","258","U","N","2015-12-22 11:30:00","","","2015-12-22 13:30:00","","","","","38355");
INSERT INTO trianik_diary VALUES("76579","38309","258","U","N","2015-12-21 09:00:00","","","2015-12-21 10:30:00","","","","","38345");
INSERT INTO trianik_diary VALUES("76580","38309","258","U","N","2015-12-25 11:30:00","","","2015-12-25 13:00:00","","","","","38346");
INSERT INTO trianik_diary VALUES("76581","38316","258","U","N","2015-12-22 09:00:00","","","2015-12-22 11:00:00","","","","","38353");
INSERT INTO trianik_diary VALUES("76582","38316","258","U","N","2015-12-25 09:00:00","","","2015-12-25 11:00:00","","","","","38354");
INSERT INTO trianik_diary VALUES("76583","38314","257","U","N","2015-12-25 12:30:00","","","2015-12-25 15:30:00","","","","","38351");
INSERT INTO trianik_diary VALUES("76584","38268","249","U","N","2015-12-21 15:00:00","","","2015-12-21 16:00:00","","","","","38299");
INSERT INTO trianik_diary VALUES("76585","38280","252","U","N","2015-12-24 12:00:00","","","2015-12-24 16:00:00","","","","","38313");
INSERT INTO trianik_diary VALUES("76586","38284","253","U","N","2015-12-22 09:30:00","","","2015-12-22 14:30:00","","","","","38317");
INSERT INTO trianik_diary VALUES("76587","38284","253","U","N","2015-12-24 11:30:00","","","2015-12-24 13:30:00","","","","","38318");
INSERT INTO trianik_diary VALUES("76588","38252","251","U","N","2015-12-21 09:30:00","","","2015-12-21 12:30:00","","","","","38277");
INSERT INTO trianik_diary VALUES("76589","38252","251","U","N","2015-12-23 10:30:00","","","2015-12-23 14:30:00","","","","","38278");
INSERT INTO trianik_diary VALUES("76590","38252","251","U","N","2015-12-25 09:00:00","","","2015-12-25 13:00:00","","","","","38279");
INSERT INTO trianik_diary VALUES("76591","38311","257","U","N","2015-12-21 15:30:00","","","2015-12-21 17:30:00","","","","","38348");
INSERT INTO trianik_diary VALUES("76592","38333","251","U","N","2015-12-25 13:30:00","","","2015-12-25 15:30:00","","","","","38375");
INSERT INTO trianik_diary VALUES("76593","38303","255","U","N","2015-12-22 09:00:00","","","2015-12-22 11:00:00","","","","","38338");
INSERT INTO trianik_diary VALUES("76594","38303","255","U","N","2015-12-24 15:00:00","","","2015-12-24 17:00:00","","","","","38339");
INSERT INTO trianik_diary VALUES("76595","38281","252","U","N","2015-12-25 12:00:00","","","2015-12-25 14:00:00","","","","","38314");
INSERT INTO trianik_diary VALUES("76596","38287","253","U","N","2015-12-25 09:30:00","","","2015-12-25 13:00:00","","","","","38321");
INSERT INTO trianik_diary VALUES("76597","38245","248","U","N","2015-12-21 08:30:00","","","2015-12-21 12:30:00","","","","","38261");
INSERT INTO trianik_diary VALUES("76598","38319","258","U","N","2015-12-24 09:00:00","","","2015-12-24 13:00:00","","","","","38357");
INSERT INTO trianik_diary VALUES("76599","38285","253","U","N","2015-12-23 12:30:00","","","2015-12-23 14:30:00","","","","","38319");
INSERT INTO trianik_diary VALUES("76600","38246","248","U","N","2015-12-21 13:30:00","","","2015-12-21 15:30:00","","","","","38262");
INSERT INTO trianik_diary VALUES("76601","38259","250","U","N","2015-12-22 09:00:00","","","2015-12-22 11:00:00","","","","","38286");
INSERT INTO trianik_diary VALUES("76602","38255","251","U","N","2015-12-23 09:00:00","","","2015-12-23 10:30:00","","","","","38282");
INSERT INTO trianik_diary VALUES("76603","38250","248","U","N","2015-12-22 14:30:00","","","2015-12-22 16:30:00","","","","","38274");
INSERT INTO trianik_diary VALUES("76604","38320","258","U","N","2015-12-24 13:30:00","","","2015-12-24 16:30:00","","","","","38358");
INSERT INTO trianik_diary VALUES("76605","38313","255","U","N","2015-12-25 16:00:00","","","2015-12-25 18:00:00","","","","","38350");
INSERT INTO trianik_diary VALUES("76606","38253","251","U","N","2015-12-21 12:30:00","","","2015-12-21 14:30:00","","","","","38280");
INSERT INTO trianik_diary VALUES("76607","38253","251","U","N","2015-12-24 11:30:00","","","2015-12-24 13:30:00","","","","","38281");
INSERT INTO trianik_diary VALUES("76608","38308","255","U","N","2015-12-25 14:00:00","","","2015-12-25 16:00:00","","","","","38344");
INSERT INTO trianik_diary VALUES("76609","38295","256","U","N","2015-12-25 09:00:00","","","2015-12-25 11:00:00","","","","","38330");
INSERT INTO trianik_diary VALUES("76610","38283","251","U","N","2015-12-24 09:00:00","","","2015-12-24 11:00:00","","","","","38316");
INSERT INTO trianik_diary VALUES("76611","38290","256","U","N","2015-12-21 12:30:00","","","2015-12-21 15:30:00","","","","","38325");
INSERT INTO trianik_diary VALUES("76612","38322","255","U","N","2015-12-24 11:30:00","","","2015-12-24 14:30:00","","","","","38360");
INSERT INTO trianik_diary VALUES("76613","38292","256","U","N","2015-12-22 12:30:00","","","2015-12-22 16:30:00","","","","","38327");
INSERT INTO trianik_diary VALUES("76614","38263","250","U","N","2015-12-24 12:30:00","","","2015-12-24 14:30:00","","","","","38290");
INSERT INTO trianik_diary VALUES("76615","38279","252","U","N","2015-12-22 14:30:00","","","2015-12-22 16:30:00","","","","","38312");
INSERT INTO trianik_diary VALUES("76616","38258","250","U","N","2015-12-22 09:00:00","","","2015-12-22 11:00:00","","","","","38285");
INSERT INTO trianik_diary VALUES("76617","38306","255","U","N","2015-12-23 14:30:00","","","2015-12-23 16:30:00","","","","","38342");
INSERT INTO trianik_diary VALUES("76618","38276","249","U","N","2015-12-25 11:30:00","","","2015-12-25 15:30:00","","","","","38307");
INSERT INTO trianik_diary VALUES("76619","38297","254","U","N","2015-12-22 12:30:00","","","2015-12-22 14:30:00","","","","","38332");
INSERT INTO trianik_diary VALUES("76620","38318","258","U","N","2015-12-23 11:30:00","","","2015-12-23 14:30:00","","","","","38356");
INSERT INTO trianik_diary VALUES("76621","38302","255","U","N","2015-12-21 15:30:00","","","2015-12-21 17:30:00","","","","","38337");
INSERT INTO trianik_diary VALUES("76622","38299","254","U","N","2015-12-24 12:30:00","","","2015-12-24 14:30:00","","","","","38334");
INSERT INTO trianik_diary VALUES("76623","38265","249","U","N","2015-12-21 09:00:00","","","2015-12-21 11:00:00","","","","","38292");
INSERT INTO trianik_diary VALUES("76624","38265","249","U","N","2015-12-22 09:00:00","","","2015-12-22 11:00:00","","","","","38293");
INSERT INTO trianik_diary VALUES("76625","38265","249","U","N","2015-12-23 09:00:00","","","2015-12-23 11:00:00","","","","","38294");
INSERT INTO trianik_diary VALUES("76626","38265","249","U","N","2015-12-24 09:00:00","","","2015-12-24 11:00:00","","","","","38295");
INSERT INTO trianik_diary VALUES("76627","38265","249","U","N","2015-12-25 09:00:00","","","2015-12-25 11:00:00","","","","","38296");
INSERT INTO trianik_diary VALUES("76628","38330","257","U","N","2015-12-21 11:15:00","","","2015-12-21 13:45:00","","","","","38371");
INSERT INTO trianik_diary VALUES("76629","38291","248","U","N","2015-12-22 09:00:00","","","2015-12-22 11:00:00","","","","","38326");
INSERT INTO trianik_diary VALUES("76630","38275","249","U","N","2015-12-24 13:00:00","","","2015-12-24 15:00:00","","","","","38306");
INSERT INTO trianik_diary VALUES("76631","38307","255","U","N","2015-12-25 09:00:00","","","2015-12-25 11:00:00","","","","","38343");
INSERT INTO trianik_diary VALUES("76632","38282","252","U","N","2015-12-25 14:00:00","","","2015-12-25 16:00:00","","","","","38315");
INSERT INTO trianik_diary VALUES("76633","38312","257","U","N","2015-12-25 09:00:00","","","2015-12-25 13:00:00","","","","","38349");
INSERT INTO trianik_diary VALUES("76634","38323","255","U","N","2015-12-21 09:00:00","","","2015-12-21 13:00:00","","","","","38361");
INSERT INTO trianik_diary VALUES("76635","38249","248","U","N","2015-12-22 12:00:00","","","2015-12-22 14:00:00","","","","","38273");
INSERT INTO trianik_diary VALUES("76636","38293","256","U","N","2015-12-23 12:30:00","","","2015-12-23 15:30:00","","","","","38328");
INSERT INTO trianik_diary VALUES("76637","38266","249","U","N","2015-12-21 11:30:00","","","2015-12-21 13:30:00","","","","","38297");
INSERT INTO trianik_diary VALUES("76638","38267","255","U","N","2015-12-25 11:30:00","","","2015-12-25 13:30:00","","","","","38298");
INSERT INTO trianik_diary VALUES("76639","38296","256","U","N","2015-12-25 11:30:00","","","2015-12-25 13:30:00","","","","","38331");
INSERT INTO trianik_diary VALUES("76640","38301","255","U","N","2015-12-21 13:30:00","","","2015-12-21 15:30:00","","","","","38336");
INSERT INTO trianik_diary VALUES("76641","38298","254","U","N","2015-12-21 12:30:00","","","2015-12-21 15:30:00","","","","","38333");
INSERT INTO trianik_diary VALUES("76642","38262","250","U","N","2015-12-24 09:00:00","","","2015-12-24 12:00:00","","","","","38289");
INSERT INTO trianik_diary VALUES("76643","38305","255","U","N","2015-12-23 12:30:00","","","2015-12-23 14:30:00","","","","","38341");
INSERT INTO trianik_diary VALUES("76644","38278","252","U","N","2015-12-22 12:00:00","","","2015-12-22 14:00:00","","","","","38310");
INSERT INTO trianik_diary VALUES("76645","38278","252","U","N","2015-12-25 09:30:00","","","2015-12-25 11:30:00","","","","","38311");
INSERT INTO trianik_diary VALUES("76646","38269","249","U","N","2015-12-22 11:30:00","","","2015-12-22 14:30:00","","","","","38300");
INSERT INTO trianik_diary VALUES("76647","38256","250","U","N","2015-12-21 09:30:00","","","2015-12-21 12:00:00","","","","","38283");
INSERT INTO trianik_diary VALUES("76648","38294","256","U","N","2015-12-24 12:30:00","","","2015-12-24 16:30:00","","","","","38329");
INSERT INTO trianik_diary VALUES("76649","38247","248","U","N","2015-12-21 18:00:00","","","2015-12-21 19:00:00","","","","","38263");
INSERT INTO trianik_diary VALUES("76650","38247","248","U","N","2015-12-24 18:00:00","","","2015-12-24 19:00:00","","","","","38266");
INSERT INTO trianik_diary VALUES("76651","38247","248","U","N","2015-12-25 18:30:00","","","2015-12-25 19:30:00","","","","","38267");
INSERT INTO trianik_diary VALUES("76652","38310","258","U","N","2015-12-21 11:30:00","","","2015-12-21 14:30:00","","","","","38347");
INSERT INTO trianik_diary VALUES("76653","38248","248","U","N","2015-12-21 19:00:00","","","2015-12-21 22:30:00","","","","","38268");
INSERT INTO trianik_diary VALUES("76654","38248","248","U","N","2015-12-22 16:30:00","","","2015-12-22 20:00:00","","","","","38269");
INSERT INTO trianik_diary VALUES("76655","38248","248","U","N","2015-12-23 19:00:00","","","2015-12-23 22:00:00","","","","","38270");
INSERT INTO trianik_diary VALUES("76656","38248","248","U","N","2015-12-24 19:00:00","","","2015-12-24 22:00:00","","","","","38271");
INSERT INTO trianik_diary VALUES("76657","38248","248","U","N","2015-12-25 15:30:00","","","2015-12-25 18:30:00","","","","","38272");
INSERT INTO trianik_diary VALUES("76658","38286","253","U","N","2015-12-24 09:30:00","","","2015-12-24 12:30:00","","","","","38320");
INSERT INTO trianik_diary VALUES("76659","38264","250","U","N","2015-12-25 11:30:00","","","2015-12-25 15:30:00","","","","","38291");
INSERT INTO trianik_diary VALUES("76660","38272","249","U","N","2015-12-24 11:30:00","","","2015-12-24 13:30:00","","","","","38303");
INSERT INTO trianik_diary VALUES("76661","38304","255","U","N","2015-12-23 09:00:00","","","2015-12-23 11:30:00","","","","","38340");
INSERT INTO trianik_diary VALUES("76662","38289","256","U","N","2015-12-21 09:00:00","","","2015-12-21 12:00:00","","","","","38323");
INSERT INTO trianik_diary VALUES("76663","38289","256","U","N","2015-12-24 09:00:00","","","2015-12-24 12:00:00","","","","","38324");
INSERT INTO trianik_diary VALUES("76664","38257","257","U","N","2015-12-21 09:00:00","","","2015-12-21 11:00:00","","","","","38284");
INSERT INTO trianik_diary VALUES("76665","38327","255","U","N","2015-12-24 18:00:00","","","2015-12-24 19:00:00","","","","","38365");
INSERT INTO trianik_diary VALUES("76666","38315","255","U","N","2015-12-24 09:00:00","","","2015-12-24 11:00:00","","","","","38352");
INSERT INTO trianik_diary VALUES("76667","38329","257","U","N","2015-12-21 13:30:00","","","2015-12-21 15:30:00","","","","","38370");
INSERT INTO trianik_diary VALUES("76668","38300","254","U","N","2015-12-25 12:30:00","","","2015-12-25 14:30:00","","","","","38335");
INSERT INTO trianik_diary VALUES("76669","38260","250","U","N","2015-12-23 09:00:00","","","2015-12-23 11:00:00","","","","","38287");
INSERT INTO trianik_diary VALUES("76670","38261","248","U","N","2015-12-25 08:35:00","","","2015-12-25 15:35:00","","","","","38382");
INSERT INTO trianik_diary VALUES("76671","38277","252","U","N","2016-01-05 09:30:00","","","2016-01-05 11:30:00","","","","","38308");
INSERT INTO trianik_diary VALUES("76672","38277","252","U","N","2016-01-07 09:30:00","","","2016-01-07 11:30:00","","","","","38309");
INSERT INTO trianik_diary VALUES("76673","38317","258","U","N","2016-01-05 11:30:00","","","2016-01-05 13:30:00","","","","","38355");
INSERT INTO trianik_diary VALUES("76674","38309","258","U","N","2016-01-04 09:00:00","","","2016-01-04 10:30:00","","","","","38345");
INSERT INTO trianik_diary VALUES("76675","38309","258","U","N","2016-01-08 11:30:00","","","2016-01-08 13:00:00","","","","","38346");
INSERT INTO trianik_diary VALUES("76676","38316","258","U","N","2016-01-05 09:00:00","","","2016-01-05 11:00:00","","","","","38353");
INSERT INTO trianik_diary VALUES("76677","38316","258","U","N","2016-01-08 09:00:00","","","2016-01-08 11:00:00","","","","","38354");
INSERT INTO trianik_diary VALUES("76678","38314","257","U","N","2016-01-08 12:30:00","","","2016-01-08 15:30:00","","","","","38351");
INSERT INTO trianik_diary VALUES("76679","38268","249","U","N","2016-01-04 15:00:00","","","2016-01-04 16:00:00","","","","","38299");
INSERT INTO trianik_diary VALUES("76680","38280","252","U","N","2016-01-07 12:00:00","","","2016-01-07 16:00:00","","","","","38313");
INSERT INTO trianik_diary VALUES("76681","38284","253","U","N","2016-01-05 09:30:00","","","2016-01-05 14:30:00","","","","","38317");
INSERT INTO trianik_diary VALUES("76682","38284","253","U","N","2016-01-07 11:30:00","","","2016-01-07 13:30:00","","","","","38318");
INSERT INTO trianik_diary VALUES("76683","38252","251","U","N","2016-01-04 09:30:00","","","2016-01-04 12:30:00","","","","","38277");
INSERT INTO trianik_diary VALUES("76684","38252","251","U","N","2016-01-06 10:30:00","","","2016-01-06 14:30:00","","","","","38278");
INSERT INTO trianik_diary VALUES("76685","38252","251","U","N","2016-01-08 09:00:00","","","2016-01-08 13:00:00","","","","","38279");
INSERT INTO trianik_diary VALUES("76686","38311","257","U","N","2016-01-04 15:30:00","","","2016-01-04 17:30:00","","","","","38348");
INSERT INTO trianik_diary VALUES("76687","38333","251","U","N","2016-01-08 13:30:00","","","2016-01-08 15:30:00","","","","","38375");
INSERT INTO trianik_diary VALUES("76688","38303","255","U","N","2016-01-05 09:00:00","","","2016-01-05 11:00:00","","","","","38338");
INSERT INTO trianik_diary VALUES("76689","38303","255","U","N","2016-01-07 15:00:00","","","2016-01-07 17:00:00","","","","","38339");
INSERT INTO trianik_diary VALUES("76690","38281","252","U","N","2016-01-08 12:00:00","","","2016-01-08 14:00:00","","","","","38314");
INSERT INTO trianik_diary VALUES("76691","38287","253","U","N","2016-01-08 09:30:00","","","2016-01-08 13:00:00","","","","","38321");
INSERT INTO trianik_diary VALUES("76692","38245","248","U","N","2016-01-04 08:30:00","","","2016-01-04 12:30:00","","","","","38261");
INSERT INTO trianik_diary VALUES("76693","38319","258","U","N","2016-01-07 09:00:00","","","2016-01-07 13:00:00","","","","","38357");
INSERT INTO trianik_diary VALUES("76694","38285","253","U","N","2016-01-06 12:30:00","","","2016-01-06 14:30:00","","","","","38319");
INSERT INTO trianik_diary VALUES("76695","38246","248","U","N","2016-01-04 13:30:00","","","2016-01-04 15:30:00","","","","","38262");
INSERT INTO trianik_diary VALUES("76696","38259","250","U","N","2016-01-05 09:00:00","","","2016-01-05 11:00:00","","","","","38286");
INSERT INTO trianik_diary VALUES("76697","38255","251","U","N","2016-01-06 09:00:00","","","2016-01-06 10:30:00","","","","","38282");
INSERT INTO trianik_diary VALUES("76698","38250","248","U","N","2016-01-05 14:30:00","","","2016-01-05 16:30:00","","","","","38274");
INSERT INTO trianik_diary VALUES("76699","38320","258","U","N","2016-01-07 13:30:00","","","2016-01-07 16:30:00","","","","","38358");
INSERT INTO trianik_diary VALUES("76700","38313","255","U","N","2016-01-08 16:00:00","","","2016-01-08 18:00:00","","","","","38350");
INSERT INTO trianik_diary VALUES("76701","38253","251","U","N","2016-01-04 12:30:00","","","2016-01-04 14:30:00","","","","","38280");
INSERT INTO trianik_diary VALUES("76702","38253","251","U","N","2016-01-07 11:30:00","","","2016-01-07 13:30:00","","","","","38281");
INSERT INTO trianik_diary VALUES("76703","38308","255","U","N","2016-01-08 14:00:00","","","2016-01-08 16:00:00","","","","","38344");
INSERT INTO trianik_diary VALUES("76704","38295","256","U","N","2016-01-08 09:00:00","","","2016-01-08 11:00:00","","","","","38330");
INSERT INTO trianik_diary VALUES("76705","38283","251","U","N","2016-01-07 09:00:00","","","2016-01-07 11:00:00","","","","","38316");
INSERT INTO trianik_diary VALUES("76706","38290","256","U","N","2016-01-04 12:30:00","","","2016-01-04 15:30:00","","","","","38325");
INSERT INTO trianik_diary VALUES("76707","38322","255","U","N","2016-01-07 11:30:00","","","2016-01-07 14:30:00","","","","","38360");
INSERT INTO trianik_diary VALUES("76708","38292","256","U","N","2016-01-05 12:30:00","","","2016-01-05 16:30:00","","","","","38327");
INSERT INTO trianik_diary VALUES("76709","38263","250","U","N","2016-01-07 12:30:00","","","2016-01-07 14:30:00","","","","","38290");
INSERT INTO trianik_diary VALUES("76710","38279","252","U","N","2016-01-05 14:30:00","","","2016-01-05 16:30:00","","","","","38312");
INSERT INTO trianik_diary VALUES("76711","38258","250","U","N","2016-01-05 09:00:00","","","2016-01-05 11:00:00","","","","","38285");
INSERT INTO trianik_diary VALUES("76712","38306","255","U","N","2016-01-06 14:30:00","","","2016-01-06 16:30:00","","","","","38342");
INSERT INTO trianik_diary VALUES("76713","38276","249","U","N","2016-01-08 11:30:00","","","2016-01-08 15:30:00","","","","","38307");
INSERT INTO trianik_diary VALUES("76714","38297","254","U","N","2016-01-05 12:30:00","","","2016-01-05 14:30:00","","","","","38332");
INSERT INTO trianik_diary VALUES("76715","38318","258","U","N","2016-01-06 11:30:00","","","2016-01-06 14:30:00","","","","","38356");
INSERT INTO trianik_diary VALUES("76716","38302","255","U","N","2016-01-04 15:30:00","","","2016-01-04 17:30:00","","","","","38337");
INSERT INTO trianik_diary VALUES("76717","38299","254","U","N","2016-01-07 12:30:00","","","2016-01-07 14:30:00","","","","","38334");
INSERT INTO trianik_diary VALUES("76718","38265","249","U","N","2016-01-04 09:00:00","","","2016-01-04 11:00:00","","","","","38292");
INSERT INTO trianik_diary VALUES("76719","38265","249","U","N","2016-01-05 09:00:00","","","2016-01-05 11:00:00","","","","","38293");
INSERT INTO trianik_diary VALUES("76720","38265","249","U","N","2016-01-06 09:00:00","","","2016-01-06 11:00:00","","","","","38294");
INSERT INTO trianik_diary VALUES("76721","38265","249","U","N","2016-01-07 09:00:00","","","2016-01-07 11:00:00","","","","","38295");
INSERT INTO trianik_diary VALUES("76722","38265","249","U","N","2016-01-08 09:00:00","","","2016-01-08 11:00:00","","","","","38296");
INSERT INTO trianik_diary VALUES("76723","38330","257","U","N","2016-01-04 11:15:00","","","2016-01-04 13:45:00","","","","","38371");
INSERT INTO trianik_diary VALUES("76724","38291","248","U","N","2016-01-05 09:00:00","","","2016-01-05 11:00:00","","","","","38326");
INSERT INTO trianik_diary VALUES("76725","38275","249","U","N","2016-01-07 13:00:00","","","2016-01-07 15:00:00","","","","","38306");
INSERT INTO trianik_diary VALUES("76726","38307","255","U","N","2016-01-08 09:00:00","","","2016-01-08 11:00:00","","","","","38343");
INSERT INTO trianik_diary VALUES("76727","38282","252","U","N","2016-01-08 14:00:00","","","2016-01-08 16:00:00","","","","","38315");
INSERT INTO trianik_diary VALUES("76728","38312","257","U","N","2016-01-08 09:00:00","","","2016-01-08 13:00:00","","","","","38349");
INSERT INTO trianik_diary VALUES("76729","38323","255","U","N","2016-01-04 09:00:00","","","2016-01-04 13:00:00","","","","","38361");
INSERT INTO trianik_diary VALUES("76730","38249","248","U","N","2016-01-05 12:00:00","","","2016-01-05 14:00:00","","","","","38273");
INSERT INTO trianik_diary VALUES("76731","38293","256","U","N","2016-01-06 12:30:00","","","2016-01-06 15:30:00","","","","","38328");
INSERT INTO trianik_diary VALUES("76732","38266","249","U","N","2016-01-04 11:30:00","","","2016-01-04 13:30:00","","","","","38297");
INSERT INTO trianik_diary VALUES("76733","38267","255","U","N","2016-01-08 11:30:00","","","2016-01-08 13:30:00","","","","","38298");
INSERT INTO trianik_diary VALUES("76734","38296","256","U","N","2016-01-08 11:30:00","","","2016-01-08 13:30:00","","","","","38331");
INSERT INTO trianik_diary VALUES("76735","38301","255","U","N","2016-01-04 13:30:00","","","2016-01-04 15:30:00","","","","","38336");
INSERT INTO trianik_diary VALUES("76736","38298","254","U","N","2016-01-04 12:30:00","","","2016-01-04 15:30:00","","","","","38333");
INSERT INTO trianik_diary VALUES("76737","38262","250","U","N","2016-01-07 09:00:00","","","2016-01-07 12:00:00","","","","","38289");
INSERT INTO trianik_diary VALUES("76738","38305","255","U","N","2016-01-06 12:30:00","","","2016-01-06 14:30:00","","","","","38341");
INSERT INTO trianik_diary VALUES("76739","38278","252","U","N","2016-01-05 12:00:00","","","2016-01-05 14:00:00","","","","","38310");
INSERT INTO trianik_diary VALUES("76740","38278","252","U","N","2016-01-08 09:30:00","","","2016-01-08 11:30:00","","","","","38311");
INSERT INTO trianik_diary VALUES("76741","38269","249","U","N","2016-01-05 11:30:00","","","2016-01-05 14:30:00","","","","","38300");
INSERT INTO trianik_diary VALUES("76742","38256","250","U","N","2016-01-04 09:30:00","","","2016-01-04 12:00:00","","","","","38283");
INSERT INTO trianik_diary VALUES("76743","38294","256","U","N","2016-01-07 12:30:00","","","2016-01-07 16:30:00","","","","","38329");
INSERT INTO trianik_diary VALUES("76744","38247","248","U","N","2016-01-04 18:00:00","","","2016-01-04 19:00:00","","","","","38263");
INSERT INTO trianik_diary VALUES("76745","38247","248","U","N","2016-01-07 18:00:00","","","2016-01-07 19:00:00","","","","","38266");
INSERT INTO trianik_diary VALUES("76746","38247","248","U","N","2016-01-08 18:30:00","","","2016-01-08 19:30:00","","","","","38267");
INSERT INTO trianik_diary VALUES("76747","38310","258","U","N","2016-01-04 11:30:00","","","2016-01-04 14:30:00","","","","","38347");
INSERT INTO trianik_diary VALUES("76748","38248","248","U","N","2016-01-04 19:00:00","","","2016-01-04 22:30:00","","","","","38268");
INSERT INTO trianik_diary VALUES("76749","38248","248","U","N","2016-01-05 16:30:00","","","2016-01-05 20:00:00","","","","","38269");
INSERT INTO trianik_diary VALUES("76750","38248","248","U","N","2016-01-06 19:00:00","","","2016-01-06 22:00:00","","","","","38270");
INSERT INTO trianik_diary VALUES("76751","38248","248","U","N","2016-01-07 19:00:00","","","2016-01-07 22:00:00","","","","","38271");
INSERT INTO trianik_diary VALUES("76752","38248","248","U","N","2016-01-08 15:30:00","","","2016-01-08 18:30:00","","","","","38272");
INSERT INTO trianik_diary VALUES("76753","38286","253","U","N","2016-01-07 09:30:00","","","2016-01-07 12:30:00","","","","","38320");
INSERT INTO trianik_diary VALUES("76754","38264","250","U","N","2016-01-08 11:30:00","","","2016-01-08 15:30:00","","","","","38291");
INSERT INTO trianik_diary VALUES("76755","38272","249","U","N","2016-01-07 11:30:00","","","2016-01-07 13:30:00","","","","","38303");
INSERT INTO trianik_diary VALUES("76756","38304","255","U","N","2016-01-06 09:00:00","","","2016-01-06 11:30:00","","","","","38340");
INSERT INTO trianik_diary VALUES("76757","38289","256","U","N","2016-01-04 09:00:00","","","2016-01-04 12:00:00","","","","","38323");
INSERT INTO trianik_diary VALUES("76758","38289","256","U","N","2016-01-07 09:00:00","","","2016-01-07 12:00:00","","","","","38324");
INSERT INTO trianik_diary VALUES("76759","38257","257","U","N","2016-01-04 09:00:00","","","2016-01-04 11:00:00","","","","","38284");
INSERT INTO trianik_diary VALUES("76760","38327","255","U","N","2016-01-07 18:00:00","","","2016-01-07 19:00:00","","","","","38365");
INSERT INTO trianik_diary VALUES("76761","38315","255","U","N","2016-01-07 09:00:00","","","2016-01-07 11:00:00","","","","","38352");
INSERT INTO trianik_diary VALUES("76762","38329","257","U","N","2016-01-04 13:30:00","","","2016-01-04 15:30:00","","","","","38370");
INSERT INTO trianik_diary VALUES("76763","38300","254","U","N","2016-01-08 12:30:00","","","2016-01-08 14:30:00","","","","","38335");
INSERT INTO trianik_diary VALUES("76764","38260","250","U","N","2016-01-06 09:00:00","","","2016-01-06 11:00:00","","","","","38287");
INSERT INTO trianik_diary VALUES("76765","38261","248","U","N","2016-01-08 08:35:00","","","2016-01-08 15:35:00","","","","","38382");
INSERT INTO trianik_diary VALUES("76766","38277","252","U","N","2016-01-12 09:30:00","","","2016-01-12 11:30:00","","","","","38308");
INSERT INTO trianik_diary VALUES("76767","38277","252","U","N","2016-01-14 09:30:00","","","2016-01-14 11:30:00","","","","","38309");
INSERT INTO trianik_diary VALUES("76768","38274","250","U","N","2016-01-14 09:00:00","","","2016-01-14 12:00:00","","","","","38305");
INSERT INTO trianik_diary VALUES("76769","38317","258","U","N","2016-01-12 11:30:00","","","2016-01-12 13:30:00","","","","","38355");
INSERT INTO trianik_diary VALUES("76770","38309","258","U","N","2016-01-11 09:00:00","","","2016-01-11 10:30:00","","","","","38345");
INSERT INTO trianik_diary VALUES("76771","38309","258","U","N","2016-01-15 11:30:00","","","2016-01-15 13:00:00","","","","","38346");
INSERT INTO trianik_diary VALUES("76772","38316","258","U","N","2016-01-12 09:00:00","","","2016-01-12 11:00:00","","","","","38353");
INSERT INTO trianik_diary VALUES("76773","38316","258","U","N","2016-01-15 09:00:00","","","2016-01-15 11:00:00","","","","","38354");
INSERT INTO trianik_diary VALUES("76774","38314","257","U","N","2016-01-15 12:30:00","","","2016-01-15 15:30:00","","","","","38351");
INSERT INTO trianik_diary VALUES("76775","38280","252","U","N","2016-01-14 12:00:00","","","2016-01-14 16:00:00","","","","","38313");
INSERT INTO trianik_diary VALUES("76776","38284","253","U","N","2016-01-12 09:30:00","","","2016-01-12 14:30:00","","","","","38317");
INSERT INTO trianik_diary VALUES("76777","38284","253","U","N","2016-01-14 11:30:00","","","2016-01-14 13:30:00","","","","","38318");
INSERT INTO trianik_diary VALUES("76778","38252","251","U","N","2016-01-11 09:30:00","","","2016-01-11 12:30:00","","","","","38277");
INSERT INTO trianik_diary VALUES("76779","38252","251","U","N","2016-01-13 10:30:00","","","2016-01-13 14:30:00","","","","","38278");
INSERT INTO trianik_diary VALUES("76780","38252","251","U","N","2016-01-15 09:00:00","","","2016-01-15 13:00:00","","","","","38279");
INSERT INTO trianik_diary VALUES("76781","38311","257","U","N","2016-01-11 15:30:00","","","2016-01-11 17:30:00","","","","","38348");
INSERT INTO trianik_diary VALUES("76782","38333","251","U","N","2016-01-15 13:30:00","","","2016-01-15 15:30:00","","","","","38375");
INSERT INTO trianik_diary VALUES("76783","38303","255","U","N","2016-01-12 09:00:00","","","2016-01-12 11:00:00","","","","","38338");
INSERT INTO trianik_diary VALUES("76784","38303","255","U","N","2016-01-14 15:00:00","","","2016-01-14 17:00:00","","","","","38339");
INSERT INTO trianik_diary VALUES("76785","38271","249","U","N","2016-01-13 14:00:00","","","2016-01-13 16:00:00","","","","","38302");
INSERT INTO trianik_diary VALUES("76786","38245","248","U","N","2016-01-11 08:30:00","","","2016-01-11 12:30:00","","","","","38261");
INSERT INTO trianik_diary VALUES("76787","38319","258","U","N","2016-01-14 09:00:00","","","2016-01-14 13:00:00","","","","","38357");
INSERT INTO trianik_diary VALUES("76788","38285","253","U","N","2016-01-13 12:30:00","","","2016-01-13 14:30:00","","","","","38319");
INSERT INTO trianik_diary VALUES("76789","38246","248","U","N","2016-01-11 13:30:00","","","2016-01-11 15:30:00","","","","","38262");
INSERT INTO trianik_diary VALUES("76790","38259","250","U","N","2016-01-12 09:00:00","","","2016-01-12 11:00:00","","","","","38286");
INSERT INTO trianik_diary VALUES("76791","38320","258","U","N","2016-01-14 13:30:00","","","2016-01-14 16:30:00","","","","","38358");
INSERT INTO trianik_diary VALUES("76792","38253","251","U","N","2016-01-11 12:30:00","","","2016-01-11 14:30:00","","","","","38280");
INSERT INTO trianik_diary VALUES("76793","38253","251","U","N","2016-01-14 11:30:00","","","2016-01-14 13:30:00","","","","","38281");
INSERT INTO trianik_diary VALUES("76794","38308","255","U","N","2016-01-15 14:00:00","","","2016-01-15 16:00:00","","","","","38344");
INSERT INTO trianik_diary VALUES("76795","38295","256","U","N","2016-01-15 09:00:00","","","2016-01-15 11:00:00","","","","","38330");
INSERT INTO trianik_diary VALUES("76796","38288","253","U","N","2016-01-15 09:30:00","","","2016-01-15 13:30:00","","","","","38322");
INSERT INTO trianik_diary VALUES("76797","38283","251","U","N","2016-01-14 09:00:00","","","2016-01-14 11:00:00","","","","","38316");
INSERT INTO trianik_diary VALUES("76798","38290","256","U","N","2016-01-11 12:30:00","","","2016-01-11 15:30:00","","","","","38325");
INSERT INTO trianik_diary VALUES("76799","38322","255","U","N","2016-01-14 11:30:00","","","2016-01-14 14:30:00","","","","","38360");
INSERT INTO trianik_diary VALUES("76800","38292","256","U","N","2016-01-12 12:30:00","","","2016-01-12 16:30:00","","","","","38327");
INSERT INTO trianik_diary VALUES("76801","38263","250","U","N","2016-01-14 12:30:00","","","2016-01-14 14:30:00","","","","","38290");
INSERT INTO trianik_diary VALUES("76802","38279","252","U","N","2016-01-12 14:30:00","","","2016-01-12 16:30:00","","","","","38312");
INSERT INTO trianik_diary VALUES("76803","38306","255","U","N","2016-01-13 14:30:00","","","2016-01-13 16:30:00","","","","","38342");
INSERT INTO trianik_diary VALUES("76804","38276","249","U","N","2016-01-15 11:30:00","","","2016-01-15 15:30:00","","","","","38307");
INSERT INTO trianik_diary VALUES("76805","38297","254","U","N","2016-01-12 12:30:00","","","2016-01-12 14:30:00","","","","","38332");
INSERT INTO trianik_diary VALUES("76806","38326","257","U","N","2016-01-15 10:15:00","","","2016-01-15 11:45:00","","","","","38364");
INSERT INTO trianik_diary VALUES("76807","38318","258","U","N","2016-01-13 11:30:00","","","2016-01-13 14:30:00","","","","","38356");
INSERT INTO trianik_diary VALUES("76808","38265","249","U","N","2016-01-11 09:00:00","","","2016-01-11 11:00:00","","","","","38292");
INSERT INTO trianik_diary VALUES("76809","38265","249","U","N","2016-01-12 09:00:00","","","2016-01-12 11:00:00","","","","","38293");
INSERT INTO trianik_diary VALUES("76810","38265","249","U","N","2016-01-13 09:00:00","","","2016-01-13 11:00:00","","","","","38294");
INSERT INTO trianik_diary VALUES("76811","38265","249","U","N","2016-01-14 09:00:00","","","2016-01-14 11:00:00","","","","","38295");
INSERT INTO trianik_diary VALUES("76812","38265","249","U","N","2016-01-15 09:00:00","","","2016-01-15 11:00:00","","","","","38296");
INSERT INTO trianik_diary VALUES("76813","38270","249","U","N","2016-01-13 11:30:00","","","2016-01-13 13:30:00","","","","","38301");
INSERT INTO trianik_diary VALUES("76814","38291","248","U","N","2016-01-12 09:00:00","","","2016-01-12 11:00:00","","","","","38326");
INSERT INTO trianik_diary VALUES("76815","38275","249","U","N","2016-01-14 13:00:00","","","2016-01-14 15:00:00","","","","","38306");
INSERT INTO trianik_diary VALUES("76816","38307","255","U","N","2016-01-15 09:00:00","","","2016-01-15 11:00:00","","","","","38343");
INSERT INTO trianik_diary VALUES("76817","38282","252","U","N","2016-01-15 14:00:00","","","2016-01-15 16:00:00","","","","","38315");
INSERT INTO trianik_diary VALUES("76818","38323","255","U","N","2016-01-11 09:00:00","","","2016-01-11 13:00:00","","","","","38361");
INSERT INTO trianik_diary VALUES("76819","38249","248","U","N","2016-01-12 12:00:00","","","2016-01-12 14:00:00","","","","","38273");
INSERT INTO trianik_diary VALUES("76820","38293","256","U","N","2016-01-13 12:30:00","","","2016-01-13 15:30:00","","","","","38328");
INSERT INTO trianik_diary VALUES("76821","38251","248","U","N","2016-01-12 14:30:00","","","2016-01-12 17:00:00","","","","","38276");
INSERT INTO trianik_diary VALUES("76822","38266","249","U","N","2016-01-11 11:30:00","","","2016-01-11 13:30:00","","","","","38297");
INSERT INTO trianik_diary VALUES("76823","38267","255","U","N","2016-01-15 11:30:00","","","2016-01-15 13:30:00","","","","","38298");
INSERT INTO trianik_diary VALUES("76824","38296","256","U","N","2016-01-15 11:30:00","","","2016-01-15 13:30:00","","","","","38331");
INSERT INTO trianik_diary VALUES("76825","38301","255","U","N","2016-01-11 13:30:00","","","2016-01-11 15:30:00","","","","","38336");
INSERT INTO trianik_diary VALUES("76826","38298","254","U","N","2016-01-11 12:30:00","","","2016-01-11 15:30:00","","","","","38333");
INSERT INTO trianik_diary VALUES("76827","38305","255","U","N","2016-01-13 12:30:00","","","2016-01-13 14:30:00","","","","","38341");
INSERT INTO trianik_diary VALUES("76828","38278","252","U","N","2016-01-12 12:00:00","","","2016-01-12 14:00:00","","","","","38310");
INSERT INTO trianik_diary VALUES("76829","38278","252","U","N","2016-01-15 09:30:00","","","2016-01-15 11:30:00","","","","","38311");
INSERT INTO trianik_diary VALUES("76830","38273","250","U","N","2016-01-12 09:00:00","","","2016-01-12 12:00:00","","","","","38304");
INSERT INTO trianik_diary VALUES("76831","38332","259","U","N","2016-01-12 09:00:00","","","2016-01-12 11:00:00","","","","","38373");
INSERT INTO trianik_diary VALUES("76832","38269","249","U","N","2016-01-12 11:30:00","","","2016-01-12 14:30:00","","","","","38300");
INSERT INTO trianik_diary VALUES("76833","38256","250","U","N","2016-01-11 09:30:00","","","2016-01-11 12:00:00","","","","","38283");
INSERT INTO trianik_diary VALUES("76834","38294","256","U","N","2016-01-14 12:30:00","","","2016-01-14 16:30:00","","","","","38329");
INSERT INTO trianik_diary VALUES("76835","38247","248","U","N","2016-01-11 18:00:00","","","2016-01-11 19:00:00","","","","","38263");
INSERT INTO trianik_diary VALUES("76836","38247","248","U","N","2016-01-14 18:00:00","","","2016-01-14 19:00:00","","","","","38266");
INSERT INTO trianik_diary VALUES("76837","38247","248","U","N","2016-01-15 18:30:00","","","2016-01-15 19:30:00","","","","","38267");
INSERT INTO trianik_diary VALUES("76838","38310","258","U","N","2016-01-11 11:30:00","","","2016-01-11 14:30:00","","","","","38347");
INSERT INTO trianik_diary VALUES("76839","38331","249","U","N","2016-01-13 14:00:00","","","2016-01-13 16:00:00","","","","","38372");
INSERT INTO trianik_diary VALUES("76840","38324","257","U","N","2016-01-11 08:00:00","","","2016-01-11 11:00:00","","","","","38362");
INSERT INTO trianik_diary VALUES("76841","38248","248","U","N","2016-01-11 19:00:00","","","2016-01-11 22:30:00","","","","","38268");
INSERT INTO trianik_diary VALUES("76842","38248","248","U","N","2016-01-12 16:30:00","","","2016-01-12 20:00:00","","","","","38269");
INSERT INTO trianik_diary VALUES("76843","38248","248","U","N","2016-01-13 19:00:00","","","2016-01-13 22:00:00","","","","","38270");
INSERT INTO trianik_diary VALUES("76844","38248","248","U","N","2016-01-14 19:00:00","","","2016-01-14 22:00:00","","","","","38271");
INSERT INTO trianik_diary VALUES("76845","38248","248","U","N","2016-01-15 15:30:00","","","2016-01-15 18:30:00","","","","","38272");
INSERT INTO trianik_diary VALUES("76846","38286","253","U","N","2016-01-14 09:30:00","","","2016-01-14 12:30:00","","","","","38320");
INSERT INTO trianik_diary VALUES("76847","38264","250","U","N","2016-01-15 11:30:00","","","2016-01-15 15:30:00","","","","","38291");
INSERT INTO trianik_diary VALUES("76848","38304","255","U","N","2016-01-13 09:00:00","","","2016-01-13 11:30:00","","","","","38340");
INSERT INTO trianik_diary VALUES("76849","38289","256","U","N","2016-01-11 09:00:00","","","2016-01-11 12:00:00","","","","","38323");
INSERT INTO trianik_diary VALUES("76850","38289","256","U","N","2016-01-14 09:00:00","","","2016-01-14 12:00:00","","","","","38324");
INSERT INTO trianik_diary VALUES("76851","38325","257","U","N","2016-01-15 08:00:00","","","2016-01-15 10:00:00","","","","","38363");
INSERT INTO trianik_diary VALUES("76852","38257","257","U","N","2016-01-11 09:00:00","","","2016-01-11 11:00:00","","","","","38284");
INSERT INTO trianik_diary VALUES("76853","38327","255","U","N","2016-01-14 18:00:00","","","2016-01-14 19:00:00","","","","","38365");
INSERT INTO trianik_diary VALUES("76854","38315","255","U","N","2016-01-14 09:00:00","","","2016-01-14 11:00:00","","","","","38352");
INSERT INTO trianik_diary VALUES("76855","38321","254","U","N","2016-01-14 12:30:00","","","2016-01-14 15:30:00","","","","","38359");
INSERT INTO trianik_diary VALUES("76856","38329","257","U","N","2016-01-11 13:30:00","","","2016-01-11 15:30:00","","","","","38370");
INSERT INTO trianik_diary VALUES("76857","38300","254","U","N","2016-01-15 12:30:00","","","2016-01-15 14:30:00","","","","","38335");
INSERT INTO trianik_diary VALUES("76858","38260","250","U","N","2016-01-13 09:00:00","","","2016-01-13 11:00:00","","","","","38287");
INSERT INTO trianik_diary VALUES("76859","38261","248","U","N","2016-01-15 08:35:00","","","2016-01-15 15:35:00","","","","","38382");
INSERT INTO trianik_diary VALUES("76860","38277","252","U","N","2016-03-22 09:30:00","","","2016-03-22 11:30:00","","","","","38308");
INSERT INTO trianik_diary VALUES("76861","38277","252","U","N","2016-03-24 09:30:00","","","2016-03-24 11:30:00","","","","","38309");
INSERT INTO trianik_diary VALUES("76862","38274","250","U","N","2016-03-24 09:00:00","","","2016-03-24 12:00:00","","","","","38305");
INSERT INTO trianik_diary VALUES("76863","38317","258","U","N","2016-03-22 11:30:00","","","2016-03-22 13:30:00","","","","","38355");
INSERT INTO trianik_diary VALUES("76864","38309","258","U","N","2016-03-21 09:00:00","","","2016-03-21 10:30:00","","","","","38345");
INSERT INTO trianik_diary VALUES("76865","38309","258","U","N","2016-03-25 11:30:00","","","2016-03-25 13:00:00","","","","","38346");
INSERT INTO trianik_diary VALUES("76866","38316","258","U","N","2016-03-22 09:00:00","","","2016-03-22 11:00:00","","","","","38353");
INSERT INTO trianik_diary VALUES("76867","38316","258","U","N","2016-03-25 09:00:00","","","2016-03-25 11:00:00","","","","","38354");
INSERT INTO trianik_diary VALUES("76868","38314","257","U","N","2016-03-25 12:30:00","","","2016-03-25 15:30:00","","","","","38351");
INSERT INTO trianik_diary VALUES("76869","38280","252","U","N","2016-03-24 12:00:00","","","2016-03-24 16:00:00","","","","","38313");
INSERT INTO trianik_diary VALUES("76870","38284","253","U","N","2016-03-22 09:30:00","","","2016-03-22 14:30:00","","","","","38317");
INSERT INTO trianik_diary VALUES("76871","38284","253","U","N","2016-03-24 11:30:00","","","2016-03-24 13:30:00","","","","","38318");
INSERT INTO trianik_diary VALUES("76872","38252","251","U","N","2016-03-21 09:30:00","","","2016-03-21 12:30:00","","","","","38277");
INSERT INTO trianik_diary VALUES("76873","38252","251","U","N","2016-03-23 10:30:00","","","2016-03-23 14:30:00","","","","","38278");
INSERT INTO trianik_diary VALUES("76874","38252","251","U","N","2016-03-25 09:00:00","","","2016-03-25 13:00:00","","","","","38279");
INSERT INTO trianik_diary VALUES("76875","38311","257","U","N","2016-03-21 15:30:00","","","2016-03-21 17:30:00","","","","","38348");
INSERT INTO trianik_diary VALUES("76876","38333","251","U","N","2016-03-25 13:30:00","","","2016-03-25 15:30:00","","","","","38375");
INSERT INTO trianik_diary VALUES("76877","38303","255","U","N","2016-03-22 09:00:00","","","2016-03-22 11:00:00","","","","","38338");
INSERT INTO trianik_diary VALUES("76878","38303","255","U","N","2016-03-24 15:00:00","","","2016-03-24 17:00:00","","","","","38339");
INSERT INTO trianik_diary VALUES("76879","38271","249","U","N","2016-03-23 14:00:00","","","2016-03-23 16:00:00","","","","","38302");
INSERT INTO trianik_diary VALUES("76880","38245","248","U","N","2016-03-21 08:30:00","","","2016-03-21 12:30:00","","","","","38261");
INSERT INTO trianik_diary VALUES("76881","38319","258","U","N","2016-03-24 09:00:00","","","2016-03-24 13:00:00","","","","","38357");
INSERT INTO trianik_diary VALUES("76882","38285","253","U","N","2016-03-23 12:30:00","","","2016-03-23 14:30:00","","","","","38319");
INSERT INTO trianik_diary VALUES("76883","38246","248","U","N","2016-03-21 13:30:00","","","2016-03-21 15:30:00","","","","","38262");
INSERT INTO trianik_diary VALUES("76884","38259","250","U","N","2016-03-22 09:00:00","","","2016-03-22 11:00:00","","","","","38286");
INSERT INTO trianik_diary VALUES("76885","38320","258","U","N","2016-03-24 13:30:00","","","2016-03-24 16:30:00","","","","","38358");
INSERT INTO trianik_diary VALUES("76886","38253","251","U","N","2016-03-21 12:30:00","","","2016-03-21 14:30:00","","","","","38280");
INSERT INTO trianik_diary VALUES("76887","38253","251","U","N","2016-03-24 11:30:00","","","2016-03-24 13:30:00","","","","","38281");
INSERT INTO trianik_diary VALUES("76888","38308","255","U","N","2016-03-25 14:00:00","","","2016-03-25 16:00:00","","","","","38344");
INSERT INTO trianik_diary VALUES("76889","38295","256","U","N","2016-03-25 09:00:00","","","2016-03-25 11:00:00","","","","","38330");
INSERT INTO trianik_diary VALUES("76890","38288","253","U","N","2016-03-25 09:30:00","","","2016-03-25 13:30:00","","","","","38322");
INSERT INTO trianik_diary VALUES("76891","38283","251","U","N","2016-03-24 09:00:00","","","2016-03-24 11:00:00","","","","","38316");
INSERT INTO trianik_diary VALUES("76892","38290","256","U","N","2016-03-21 12:30:00","","","2016-03-21 15:30:00","","","","","38325");
INSERT INTO trianik_diary VALUES("76893","38322","255","U","N","2016-03-24 11:30:00","","","2016-03-24 14:30:00","","","","","38360");
INSERT INTO trianik_diary VALUES("76894","38292","256","U","N","2016-03-22 12:30:00","","","2016-03-22 16:30:00","","","","","38327");
INSERT INTO trianik_diary VALUES("76895","38263","250","U","N","2016-03-24 12:30:00","","","2016-03-24 14:30:00","","","","","38290");
INSERT INTO trianik_diary VALUES("76896","38279","252","U","N","2016-03-22 14:30:00","","","2016-03-22 16:30:00","","","","","38312");
INSERT INTO trianik_diary VALUES("76897","38306","255","U","N","2016-03-23 14:30:00","","","2016-03-23 16:30:00","","","","","38342");
INSERT INTO trianik_diary VALUES("76898","38276","249","U","N","2016-03-25 11:30:00","","","2016-03-25 15:30:00","","","","","38307");
INSERT INTO trianik_diary VALUES("76899","38297","254","U","N","2016-03-22 12:30:00","","","2016-03-22 14:30:00","","","","","38332");
INSERT INTO trianik_diary VALUES("76900","38326","257","U","N","2016-03-25 10:15:00","","","2016-03-25 11:45:00","","","","","38364");
INSERT INTO trianik_diary VALUES("76901","38318","258","U","N","2016-03-23 11:30:00","","","2016-03-23 14:30:00","","","","","38356");
INSERT INTO trianik_diary VALUES("76902","38265","249","U","N","2016-03-21 09:00:00","","","2016-03-21 11:00:00","","","","","38292");
INSERT INTO trianik_diary VALUES("76903","38265","249","U","N","2016-03-22 09:00:00","","","2016-03-22 11:00:00","","","","","38293");
INSERT INTO trianik_diary VALUES("76904","38265","249","U","N","2016-03-23 09:00:00","","","2016-03-23 11:00:00","","","","","38294");
INSERT INTO trianik_diary VALUES("76905","38265","249","U","N","2016-03-24 09:00:00","","","2016-03-24 11:00:00","","","","","38295");
INSERT INTO trianik_diary VALUES("76906","38265","249","U","N","2016-03-25 09:00:00","","","2016-03-25 11:00:00","","","","","38296");
INSERT INTO trianik_diary VALUES("76907","38270","249","U","N","2016-03-23 11:30:00","","","2016-03-23 13:30:00","","","","","38301");
INSERT INTO trianik_diary VALUES("76908","38291","248","U","N","2016-03-22 09:00:00","","","2016-03-22 11:00:00","","","","","38326");
INSERT INTO trianik_diary VALUES("76909","38275","249","U","N","2016-03-24 13:00:00","","","2016-03-24 15:00:00","","","","","38306");
INSERT INTO trianik_diary VALUES("76910","38307","255","U","N","2016-03-25 09:00:00","","","2016-03-25 11:00:00","","","","","38343");
INSERT INTO trianik_diary VALUES("76911","38282","252","U","N","2016-03-25 14:00:00","","","2016-03-25 16:00:00","","","","","38315");
INSERT INTO trianik_diary VALUES("76912","38323","255","U","N","2016-03-21 09:00:00","","","2016-03-21 13:00:00","","","","","38361");
INSERT INTO trianik_diary VALUES("76913","38249","248","U","N","2016-03-22 12:00:00","","","2016-03-22 14:00:00","","","","","38273");
INSERT INTO trianik_diary VALUES("76914","38293","256","U","N","2016-03-23 12:30:00","","","2016-03-23 15:30:00","","","","","38328");
INSERT INTO trianik_diary VALUES("76915","38251","248","U","N","2016-03-22 14:30:00","","","2016-03-22 17:00:00","","","","","38276");
INSERT INTO trianik_diary VALUES("76916","38266","249","U","N","2016-03-21 11:30:00","","","2016-03-21 13:30:00","","","","","38297");
INSERT INTO trianik_diary VALUES("76917","38267","255","U","N","2016-03-25 11:30:00","","","2016-03-25 13:30:00","","","","","38298");
INSERT INTO trianik_diary VALUES("76918","38296","256","U","N","2016-03-25 11:30:00","","","2016-03-25 13:30:00","","","","","38331");
INSERT INTO trianik_diary VALUES("76919","38301","255","U","N","2016-03-21 13:30:00","","","2016-03-21 15:30:00","","","","","38336");
INSERT INTO trianik_diary VALUES("76920","38298","254","U","N","2016-03-21 12:30:00","","","2016-03-21 15:30:00","","","","","38333");
INSERT INTO trianik_diary VALUES("76921","38305","255","U","N","2016-03-23 12:30:00","","","2016-03-23 14:30:00","","","","","38341");
INSERT INTO trianik_diary VALUES("76922","38278","252","U","N","2016-03-22 12:00:00","","","2016-03-22 14:00:00","","","","","38310");
INSERT INTO trianik_diary VALUES("76923","38278","252","U","N","2016-03-25 09:30:00","","","2016-03-25 11:30:00","","","","","38311");
INSERT INTO trianik_diary VALUES("76924","38273","250","U","N","2016-03-22 09:00:00","","","2016-03-22 12:00:00","","","","","38304");
INSERT INTO trianik_diary VALUES("76925","38332","259","U","N","2016-03-22 09:00:00","","","2016-03-22 11:00:00","","","","","38373");
INSERT INTO trianik_diary VALUES("76926","38269","249","U","N","2016-03-22 11:30:00","","","2016-03-22 14:30:00","","","","","38300");
INSERT INTO trianik_diary VALUES("76927","38256","250","U","N","2016-03-21 09:30:00","","","2016-03-21 12:00:00","","","","","38283");
INSERT INTO trianik_diary VALUES("76928","38294","256","U","N","2016-03-24 12:30:00","","","2016-03-24 16:30:00","","","","","38329");
INSERT INTO trianik_diary VALUES("76929","38247","248","U","N","2016-03-21 18:00:00","","","2016-03-21 19:00:00","","","","","38263");
INSERT INTO trianik_diary VALUES("76930","38247","248","U","N","2016-03-24 18:00:00","","","2016-03-24 19:00:00","","","","","38266");
INSERT INTO trianik_diary VALUES("76931","38247","248","U","N","2016-03-25 18:30:00","","","2016-03-25 19:30:00","","","","","38267");
INSERT INTO trianik_diary VALUES("76932","38310","258","U","N","2016-03-21 11:30:00","","","2016-03-21 14:30:00","","","","","38347");
INSERT INTO trianik_diary VALUES("76933","38331","249","U","N","2016-03-23 14:00:00","","","2016-03-23 16:00:00","","","","","38372");
INSERT INTO trianik_diary VALUES("76934","38324","257","U","N","2016-03-21 08:00:00","","","2016-03-21 11:00:00","","","","","38362");
INSERT INTO trianik_diary VALUES("76935","38248","248","U","N","2016-03-21 19:00:00","","","2016-03-21 22:30:00","","","","","38268");
INSERT INTO trianik_diary VALUES("76936","38248","248","U","N","2016-03-22 16:30:00","","","2016-03-22 20:00:00","","","","","38269");
INSERT INTO trianik_diary VALUES("76937","38248","248","U","N","2016-03-23 19:00:00","","","2016-03-23 22:00:00","","","","","38270");
INSERT INTO trianik_diary VALUES("76938","38248","248","U","N","2016-03-24 19:00:00","","","2016-03-24 22:00:00","","","","","38271");
INSERT INTO trianik_diary VALUES("76939","38248","248","U","N","2016-03-25 15:30:00","","","2016-03-25 18:30:00","","","","","38272");
INSERT INTO trianik_diary VALUES("76940","38286","253","U","N","2016-03-24 09:30:00","","","2016-03-24 12:30:00","","","","","38320");
INSERT INTO trianik_diary VALUES("76941","38264","250","U","N","2016-03-25 11:30:00","","","2016-03-25 15:30:00","","","","","38291");
INSERT INTO trianik_diary VALUES("76942","38304","255","U","N","2016-03-23 09:00:00","","","2016-03-23 11:30:00","","","","","38340");
INSERT INTO trianik_diary VALUES("76943","38289","256","U","N","2016-03-21 09:00:00","","","2016-03-21 12:00:00","","","","","38323");
INSERT INTO trianik_diary VALUES("76944","38289","256","U","N","2016-03-24 09:00:00","","","2016-03-24 12:00:00","","","","","38324");
INSERT INTO trianik_diary VALUES("76945","38325","257","U","N","2016-03-25 08:00:00","","","2016-03-25 10:00:00","","","","","38363");
INSERT INTO trianik_diary VALUES("76946","38257","257","U","N","2016-03-21 09:00:00","","","2016-03-21 11:00:00","","","","","38284");
INSERT INTO trianik_diary VALUES("76947","38327","255","U","N","2016-03-24 18:00:00","","","2016-03-24 19:00:00","","","","","38365");
INSERT INTO trianik_diary VALUES("76948","38315","255","U","N","2016-03-24 09:00:00","","","2016-03-24 11:00:00","","","","","38352");
INSERT INTO trianik_diary VALUES("76949","38321","254","U","N","2016-03-24 12:30:00","","","2016-03-24 15:30:00","","","","","38359");
INSERT INTO trianik_diary VALUES("76950","38329","257","U","N","2016-03-21 13:30:00","","","2016-03-21 15:30:00","","","","","38370");
INSERT INTO trianik_diary VALUES("76951","38300","254","U","N","2016-03-25 12:30:00","","","2016-03-25 14:30:00","","","","","38335");
INSERT INTO trianik_diary VALUES("76952","38260","250","U","N","2016-03-23 09:00:00","","","2016-03-23 11:00:00","","","","","38287");
INSERT INTO trianik_diary VALUES("76953","38261","248","U","N","2016-03-25 08:35:00","","","2016-03-25 15:35:00","","","","","38382");
INSERT INTO trianik_diary VALUES("76954","38277","252","U","N","2016-07-26 09:30:00","","","2016-07-26 11:30:00","","","","","38308");
INSERT INTO trianik_diary VALUES("76955","38277","252","U","N","2016-07-28 09:30:00","","","2016-07-28 11:30:00","","","","","38309");
INSERT INTO trianik_diary VALUES("76956","38274","250","U","N","2016-07-28 09:00:00","","","2016-07-28 12:00:00","","","","","38305");
INSERT INTO trianik_diary VALUES("76957","38317","258","U","N","2016-07-26 11:30:00","","","2016-07-26 13:30:00","","","","","38355");
INSERT INTO trianik_diary VALUES("76958","38309","258","U","N","2016-07-25 09:00:00","","","2016-07-25 10:30:00","","","","","38345");
INSERT INTO trianik_diary VALUES("76959","38309","258","U","N","2016-07-29 11:30:00","","","2016-07-29 13:00:00","","","","","38346");
INSERT INTO trianik_diary VALUES("76960","38316","258","U","N","2016-07-26 09:00:00","","","2016-07-26 11:00:00","","","","","38353");
INSERT INTO trianik_diary VALUES("76961","38316","258","U","N","2016-07-29 09:00:00","","","2016-07-29 11:00:00","","","","","38354");
INSERT INTO trianik_diary VALUES("76962","38314","257","U","N","2016-07-29 12:30:00","","","2016-07-29 15:30:00","","","","","38351");
INSERT INTO trianik_diary VALUES("76963","38280","252","U","N","2016-07-28 12:00:00","","","2016-07-28 16:00:00","","","","","38313");
INSERT INTO trianik_diary VALUES("76964","38284","253","U","N","2016-07-26 09:30:00","","","2016-07-26 14:30:00","","","","","38317");
INSERT INTO trianik_diary VALUES("76965","38284","253","U","N","2016-07-28 11:30:00","","","2016-07-28 13:30:00","","","","","38318");
INSERT INTO trianik_diary VALUES("76966","38252","251","U","N","2016-07-25 09:30:00","","","2016-07-25 12:30:00","","","","","38277");
INSERT INTO trianik_diary VALUES("76967","38252","251","U","N","2016-07-27 10:30:00","","","2016-07-27 14:30:00","","","","","38278");
INSERT INTO trianik_diary VALUES("76968","38252","251","U","N","2016-07-29 09:00:00","","","2016-07-29 13:00:00","","","","","38279");
INSERT INTO trianik_diary VALUES("76969","38311","257","U","N","2016-07-25 15:30:00","","","2016-07-25 17:30:00","","","","","38348");
INSERT INTO trianik_diary VALUES("76970","38333","251","U","N","2016-07-29 13:30:00","","","2016-07-29 15:30:00","","","","","38375");
INSERT INTO trianik_diary VALUES("76971","38303","255","U","N","2016-07-26 09:00:00","","","2016-07-26 11:00:00","","","","","38338");
INSERT INTO trianik_diary VALUES("76972","38303","255","U","N","2016-07-28 15:00:00","","","2016-07-28 17:00:00","","","","","38339");
INSERT INTO trianik_diary VALUES("76973","38271","249","U","N","2016-07-27 14:00:00","","","2016-07-27 16:00:00","","","","","38302");
INSERT INTO trianik_diary VALUES("76974","38245","248","U","N","2016-07-25 08:30:00","","","2016-07-25 12:30:00","","","","","38261");
INSERT INTO trianik_diary VALUES("76975","38319","258","U","N","2016-07-28 09:00:00","","","2016-07-28 13:00:00","","","","","38357");
INSERT INTO trianik_diary VALUES("76976","38285","253","U","N","2016-07-27 12:30:00","","","2016-07-27 14:30:00","","","","","38319");
INSERT INTO trianik_diary VALUES("76977","38246","248","U","N","2016-07-25 13:30:00","","","2016-07-25 15:30:00","","","","","38262");
INSERT INTO trianik_diary VALUES("76978","38259","250","U","N","2016-07-26 09:00:00","","","2016-07-26 11:00:00","","","","","38286");
INSERT INTO trianik_diary VALUES("76979","38320","258","U","N","2016-07-28 13:30:00","","","2016-07-28 16:30:00","","","","","38358");
INSERT INTO trianik_diary VALUES("76980","38253","251","U","N","2016-07-25 12:30:00","","","2016-07-25 14:30:00","","","","","38280");
INSERT INTO trianik_diary VALUES("76981","38253","251","U","N","2016-07-28 11:30:00","","","2016-07-28 13:30:00","","","","","38281");
INSERT INTO trianik_diary VALUES("76982","38308","255","U","N","2016-07-29 14:00:00","","","2016-07-29 16:00:00","","","","","38344");
INSERT INTO trianik_diary VALUES("76983","38295","256","U","N","2016-07-29 09:00:00","","","2016-07-29 11:00:00","","","","","38330");
INSERT INTO trianik_diary VALUES("76984","38288","253","U","N","2016-07-29 09:30:00","","","2016-07-29 13:30:00","","","","","38322");
INSERT INTO trianik_diary VALUES("76985","38283","251","U","N","2016-07-28 09:00:00","","","2016-07-28 11:00:00","","","","","38316");
INSERT INTO trianik_diary VALUES("76986","38290","256","U","N","2016-07-25 12:30:00","","","2016-07-25 15:30:00","","","","","38325");
INSERT INTO trianik_diary VALUES("76987","38322","255","U","N","2016-07-28 11:30:00","","","2016-07-28 14:30:00","","","","","38360");
INSERT INTO trianik_diary VALUES("76988","38292","256","U","N","2016-07-26 12:30:00","","","2016-07-26 16:30:00","","","","","38327");
INSERT INTO trianik_diary VALUES("76989","38263","250","U","N","2016-07-28 12:30:00","","","2016-07-28 14:30:00","","","","","38290");
INSERT INTO trianik_diary VALUES("76990","38279","252","U","N","2016-07-26 14:30:00","","","2016-07-26 16:30:00","","","","","38312");
INSERT INTO trianik_diary VALUES("76991","38306","255","U","N","2016-07-27 14:30:00","","","2016-07-27 16:30:00","","","","","38342");
INSERT INTO trianik_diary VALUES("76992","38276","249","U","N","2016-07-29 11:30:00","","","2016-07-29 15:30:00","","","","","38307");
INSERT INTO trianik_diary VALUES("76993","38297","254","U","N","2016-07-26 12:30:00","","","2016-07-26 14:30:00","","","","","38332");
INSERT INTO trianik_diary VALUES("76994","38326","257","U","N","2016-07-29 10:15:00","","","2016-07-29 11:45:00","","","","","38364");
INSERT INTO trianik_diary VALUES("76995","38318","258","U","N","2016-07-27 11:30:00","","","2016-07-27 14:30:00","","","","","38356");
INSERT INTO trianik_diary VALUES("76996","38265","249","U","N","2016-07-25 09:00:00","","","2016-07-25 11:00:00","","","","","38292");
INSERT INTO trianik_diary VALUES("76997","38265","249","U","N","2016-07-26 09:00:00","","","2016-07-26 11:00:00","","","","","38293");
INSERT INTO trianik_diary VALUES("76998","38265","249","U","N","2016-07-27 09:00:00","","","2016-07-27 11:00:00","","","","","38294");
INSERT INTO trianik_diary VALUES("76999","38265","249","U","N","2016-07-28 09:00:00","","","2016-07-28 11:00:00","","","","","38295");
INSERT INTO trianik_diary VALUES("77000","38265","249","U","N","2016-07-29 09:00:00","","","2016-07-29 11:00:00","","","","","38296");
INSERT INTO trianik_diary VALUES("77001","38270","249","U","N","2016-07-27 11:30:00","","","2016-07-27 13:30:00","","","","","38301");
INSERT INTO trianik_diary VALUES("77002","38291","248","U","N","2016-07-26 09:00:00","","","2016-07-26 11:00:00","","","","","38326");
INSERT INTO trianik_diary VALUES("77003","38275","249","U","N","2016-07-28 13:00:00","","","2016-07-28 15:00:00","","","","","38306");
INSERT INTO trianik_diary VALUES("77004","38307","255","U","N","2016-07-29 09:00:00","","","2016-07-29 11:00:00","","","","","38343");
INSERT INTO trianik_diary VALUES("77005","38282","252","U","N","2016-07-29 14:00:00","","","2016-07-29 16:00:00","","","","","38315");
INSERT INTO trianik_diary VALUES("77006","38323","255","U","N","2016-07-25 09:00:00","","","2016-07-25 13:00:00","","","","","38361");
INSERT INTO trianik_diary VALUES("77007","38249","248","U","N","2016-07-26 12:00:00","","","2016-07-26 14:00:00","","","","","38273");
INSERT INTO trianik_diary VALUES("77008","38293","256","U","N","2016-07-27 12:30:00","","","2016-07-27 15:30:00","","","","","38328");
INSERT INTO trianik_diary VALUES("77009","38251","248","U","N","2016-07-26 14:30:00","","","2016-07-26 17:00:00","","","","","38276");
INSERT INTO trianik_diary VALUES("77010","38266","249","U","N","2016-07-25 11:30:00","","","2016-07-25 13:30:00","","","","","38297");
INSERT INTO trianik_diary VALUES("77011","38267","255","U","N","2016-07-29 11:30:00","","","2016-07-29 13:30:00","","","","","38298");
INSERT INTO trianik_diary VALUES("77012","38296","256","U","N","2016-07-29 11:30:00","","","2016-07-29 13:30:00","","","","","38331");
INSERT INTO trianik_diary VALUES("77013","38301","255","U","N","2016-07-25 13:30:00","","","2016-07-25 15:30:00","","","","","38336");
INSERT INTO trianik_diary VALUES("77014","38298","254","U","N","2016-07-25 12:30:00","","","2016-07-25 15:30:00","","","","","38333");
INSERT INTO trianik_diary VALUES("77015","38305","255","U","N","2016-07-27 12:30:00","","","2016-07-27 14:30:00","","","","","38341");
INSERT INTO trianik_diary VALUES("77016","38278","252","U","N","2016-07-26 12:00:00","","","2016-07-26 14:00:00","","","","","38310");
INSERT INTO trianik_diary VALUES("77017","38278","252","U","N","2016-07-29 09:30:00","","","2016-07-29 11:30:00","","","","","38311");
INSERT INTO trianik_diary VALUES("77018","38273","250","U","N","2016-07-26 09:00:00","","","2016-07-26 12:00:00","","","","","38304");
INSERT INTO trianik_diary VALUES("77019","38332","259","U","N","2016-07-26 09:00:00","","","2016-07-26 11:00:00","","","","","38373");
INSERT INTO trianik_diary VALUES("77020","38269","249","U","N","2016-07-26 11:30:00","","","2016-07-26 14:30:00","","","","","38300");
INSERT INTO trianik_diary VALUES("77021","38256","250","U","N","2016-07-25 09:30:00","","","2016-07-25 12:00:00","","","","","38283");
INSERT INTO trianik_diary VALUES("77022","38294","256","U","N","2016-07-28 12:30:00","","","2016-07-28 16:30:00","","","","","38329");
INSERT INTO trianik_diary VALUES("77023","38247","248","U","N","2016-07-25 18:00:00","","","2016-07-25 19:00:00","","","","","38263");
INSERT INTO trianik_diary VALUES("77024","38247","248","U","N","2016-07-28 18:00:00","","","2016-07-28 19:00:00","","","","","38266");
INSERT INTO trianik_diary VALUES("77025","38247","248","U","N","2016-07-29 18:30:00","","","2016-07-29 19:30:00","","","","","38267");
INSERT INTO trianik_diary VALUES("77026","38310","258","U","N","2016-07-25 11:30:00","","","2016-07-25 14:30:00","","","","","38347");
INSERT INTO trianik_diary VALUES("77027","38331","249","U","N","2016-07-27 14:00:00","","","2016-07-27 16:00:00","","","","","38372");
INSERT INTO trianik_diary VALUES("77028","38324","257","U","N","2016-07-25 08:00:00","","","2016-07-25 11:00:00","","","","","38362");
INSERT INTO trianik_diary VALUES("77029","38248","248","U","N","2016-07-25 19:00:00","","","2016-07-25 22:30:00","","","","","38268");
INSERT INTO trianik_diary VALUES("77030","38248","248","U","N","2016-07-26 16:30:00","","","2016-07-26 20:00:00","","","","","38269");
INSERT INTO trianik_diary VALUES("77031","38248","248","U","N","2016-07-27 19:00:00","","","2016-07-27 22:00:00","","","","","38270");
INSERT INTO trianik_diary VALUES("77032","38248","248","U","N","2016-07-28 19:00:00","","","2016-07-28 22:00:00","","","","","38271");
INSERT INTO trianik_diary VALUES("77033","38248","248","U","N","2016-07-29 15:30:00","","","2016-07-29 18:30:00","","","","","38272");
INSERT INTO trianik_diary VALUES("77034","38286","253","U","N","2016-07-28 09:30:00","","","2016-07-28 12:30:00","","","","","38320");
INSERT INTO trianik_diary VALUES("77035","38264","250","U","N","2016-07-29 11:30:00","","","2016-07-29 15:30:00","","","","","38291");
INSERT INTO trianik_diary VALUES("77036","38304","255","U","N","2016-07-27 09:00:00","","","2016-07-27 11:30:00","","","","","38340");
INSERT INTO trianik_diary VALUES("77037","38289","256","U","N","2016-07-25 09:00:00","","","2016-07-25 12:00:00","","","","","38323");
INSERT INTO trianik_diary VALUES("77038","38289","256","I","N","2016-07-28 09:00:00","2016-07-28 11:16:17","","2016-07-28 12:00:00","","","","","38324");
INSERT INTO trianik_diary VALUES("77039","38325","257","U","N","2016-07-29 08:00:00","","","2016-07-29 10:00:00","","","","","38363");
INSERT INTO trianik_diary VALUES("77040","38257","257","U","N","2016-07-25 09:00:00","","","2016-07-25 11:00:00","","","","","38284");
INSERT INTO trianik_diary VALUES("77041","38327","255","U","N","2016-07-28 18:00:00","","","2016-07-28 19:00:00","","","","","38365");
INSERT INTO trianik_diary VALUES("77042","38315","255","U","N","2016-07-28 09:00:00","","","2016-07-28 11:00:00","","","","","38352");
INSERT INTO trianik_diary VALUES("77043","38321","254","U","N","2016-07-28 12:30:00","","","2016-07-28 15:30:00","","","","","38359");
INSERT INTO trianik_diary VALUES("77044","38329","257","U","N","2016-07-25 13:30:00","","","2016-07-25 15:30:00","","","","","38370");
INSERT INTO trianik_diary VALUES("77045","38300","254","U","N","2016-07-29 12:30:00","","","2016-07-29 14:30:00","","","","","38335");
INSERT INTO trianik_diary VALUES("77046","38260","250","U","N","2016-07-28 09:00:00","","","2016-07-28 11:00:00","","","","","38287");
INSERT INTO trianik_diary VALUES("77047","38261","248","U","N","2016-07-29 08:35:00","","","2016-07-29 15:35:00","","","","","38382");
INSERT INTO trianik_diary VALUES("77048","38260","250","U","N","2016-07-27 09:00:00","","","2016-07-27 11:00:00","","","","","38287");



DROP TABLE trianik_documents;

CREATE TABLE `trianik_documents` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `mimetype` varchar(255) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `image` longblob,
  `createdby` int(11) DEFAULT NULL,
  `createddate` timestamp NULL DEFAULT NULL,
  `lastmodifiedby` int(11) DEFAULT NULL,
  `lastmodifieddate` timestamp NULL DEFAULT NULL,
  `sessionid` varchar(50) DEFAULT NULL,
  `metacreateddate` datetime NOT NULL,
  `metacreateduserid` int(11) NOT NULL,
  `metamodifieddate` datetime NOT NULL,
  `metamodifieduserid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;




DROP TABLE trianik_errors;

CREATE TABLE `trianik_errors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pageid` int(11) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `description` text,
  `createddate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `metacreateddate` datetime NOT NULL,
  `metacreateduserid` int(11) NOT NULL,
  `metamodifieddate` datetime NOT NULL,
  `metamodifieduserid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28261 DEFAULT CHARSET=latin1;

INSERT INTO trianik_errors VALUES("28248","7280","1",0x494e5345525420494e544f20747269616e696b5f636c69656e7420286e616d652c207374617475732c2066697273746e616d652c206c6173746e616d652c20616464726573732c2062696c6c696e67616464726573732c2070617065726672656562696c6c696e67616464726573732c20656d61696c2c2074656c6570686f6e652c206d6f62696c652c20776f726b70686f6e652c206672657175656e63792c207374617274646174652c20686f75727372657175697265642c2070726566657272656464617974696d652c206e756d6265726f66626564726f6f6d732c206e756d6265726f6662617468726f6f6d732c2076616c7561626c6573746f626572656d6f7665642c2076616375756d2c2069726f6e696e6772657175697265642c207061796d656e746d6574686f642c206e756d6265726f666b657973676976656e2c20616c61726d666f62676976656e2c20616c61726d636f6465732c20616363657373696e737472756374696f6e732c207370656369666963726571756972656d656e74732c206d65746163726561746564646174652c206d657461637265617465647573657269642c206d6574616d6f646966696564646174652c206d6574616d6f646966696564757365726964292056414c5545532028274269676773272c20274c272c2027444444272c20276464272c2027272c2027272c2027272c20276b6576696e2e68696c746f6e4070726f64696779776f726b732e636f2e756b272c2027343437373330363139313935272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c204e4f5728292c20312c204e4f5728292c203129203d204475706c696361746520656e747279202742696767732720666f72206b657920276e616d6527,"2016-01-11 14:59:22","2016-01-11 14:59:22","1","2016-01-11 14:59:22","1");
INSERT INTO trianik_errors VALUES("28247","7280","1",0x53454c45435420412e2a2046524f4d20747269616e696b5f636c69656e74204120574845524520412e4269676773203d20276e616d6527204f5244455220425920412e6e616d6520415343202d20556e6b6e6f776e20636f6c756d6e2027412e42696767732720696e2027776865726520636c6175736527,"2016-01-11 14:59:22","2016-01-11 14:59:22","1","2016-01-11 14:59:22","1");
INSERT INTO trianik_errors VALUES("28246","7280","1",0x53454c45435420412e2a2046524f4d20747269616e696b5f636c69656e74204120574845524520412e3030303938383838203d20276e616d6527204f5244455220425920412e6e616d6520415343202d20556e6b6e6f776e20636f6c756d6e2027412e30303039383838382720696e2027776865726520636c6175736527,"2016-01-11 14:59:01","2016-01-11 14:59:01","1","2016-01-11 14:59:01","1");
INSERT INTO trianik_errors VALUES("28243","7299","1",0x544553542034,"2015-11-20 17:24:23","2015-11-20 17:24:23","1","2015-11-20 17:24:23","1");
INSERT INTO trianik_errors VALUES("28244","7299","1",0x544553542035,"2015-11-20 17:24:23","2015-11-20 17:24:23","1","2015-11-20 17:24:23","1");
INSERT INTO trianik_errors VALUES("28245","7280","1",0x494e5345525420494e544f20747269616e696b5f636c69656e7420286e616d652c207374617475732c2066697273746e616d652c206c6173746e616d652c20616464726573732c2062696c6c696e67616464726573732c2070617065726672656562696c6c696e67616464726573732c20656d61696c2c2074656c6570686f6e652c206d6f62696c652c20776f726b70686f6e652c206672657175656e63792c207374617274646174652c20686f75727372657175697265642c2070726566657272656464617974696d652c206e756d6265726f66626564726f6f6d732c206e756d6265726f6662617468726f6f6d732c2076616c7561626c6573746f626572656d6f7665642c2076616375756d2c2069726f6e696e6772657175697265642c207061796d656e746d6574686f642c206e756d6265726f666b657973676976656e2c20616c61726d666f62676976656e2c20616c61726d636f6465732c20616363657373696e737472756374696f6e732c207370656369666963726571756972656d656e74732c206d65746163726561746564646174652c206d657461637265617465647573657269642c206d6574616d6f646966696564646174652c206d6574616d6f646966696564757365726964292056414c5545532028274269676773272c20274c272c202773272c202773272c2027272c2027272c2027272c20277374657068656e2e7472696767406c617564656e63686f636f6c6174652e636f6d272c202764272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c204e4f5728292c20312c204e4f5728292c203129203d204475706c696361746520656e747279202742696767732720666f72206b657920276e616d6527,"2016-01-11 14:33:04","2016-01-11 14:33:04","1","2016-01-11 14:33:04","1");
INSERT INTO trianik_errors VALUES("28240","7299","1",0x544553542031,"2015-11-20 17:24:23","2015-11-20 17:24:23","1","2015-11-20 17:24:23","1");
INSERT INTO trianik_errors VALUES("28241","7299","1",0x544553542032,"2015-11-20 17:24:23","2015-11-20 17:24:23","1","2015-11-20 17:24:23","1");
INSERT INTO trianik_errors VALUES("28242","7299","1",0x544553542033,"2015-11-20 17:24:23","2015-11-20 17:24:23","1","2015-11-20 17:24:23","1");
INSERT INTO trianik_errors VALUES("28249","7280","1",0x53454c45435420412e2a2046524f4d20747269616e696b5f636c69656e74204120574845524520412e4269676773203d20276e616d6527204f5244455220425920412e6e616d6520415343202d20556e6b6e6f776e20636f6c756d6e2027412e42696767732720696e2027776865726520636c6175736527,"2016-01-11 15:00:03","2016-01-11 15:00:03","1","2016-01-11 15:00:03","1");
INSERT INTO trianik_errors VALUES("28250","7280","1",0x494e5345525420494e544f20747269616e696b5f636c69656e7420286e616d652c207374617475732c2066697273746e616d652c206c6173746e616d652c20616464726573732c2062696c6c696e67616464726573732c2070617065726672656562696c6c696e67616464726573732c20656d61696c2c2074656c6570686f6e652c206d6f62696c652c20776f726b70686f6e652c206672657175656e63792c207374617274646174652c20686f75727372657175697265642c2070726566657272656464617974696d652c206e756d6265726f66626564726f6f6d732c206e756d6265726f6662617468726f6f6d732c2076616c7561626c6573746f626572656d6f7665642c2076616375756d2c2069726f6e696e6772657175697265642c207061796d656e746d6574686f642c206e756d6265726f666b657973676976656e2c20616c61726d666f62676976656e2c20616c61726d636f6465732c20616363657373696e737472756374696f6e732c207370656369666963726571756972656d656e74732c206d65746163726561746564646174652c206d657461637265617465647573657269642c206d6574616d6f646966696564646174652c206d6574616d6f646966696564757365726964292056414c5545532028274269676773272c20274c272c20274b6576696e272c202748696c746f6e272c2027272c2027272c2027272c20276b6576696e2e68696c746f6e4070726f64696779776f726b732e636f2e756b272c2027343437373330363139313935272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c204e4f5728292c20312c204e4f5728292c203129203d204475706c696361746520656e747279202742696767732720666f72206b657920276e616d6527,"2016-01-11 15:00:03","2016-01-11 15:00:03","1","2016-01-11 15:00:03","1");
INSERT INTO trianik_errors VALUES("28251","7280","1",0x53454c45435420412e2a2046524f4d20747269616e696b5f636c69656e74204120574845524520412e4269676773203d20276e616d6527204f5244455220425920412e6e616d6520415343202d20556e6b6e6f776e20636f6c756d6e2027412e42696767732720696e2027776865726520636c6175736527,"2016-01-11 15:00:43","2016-01-11 15:00:43","1","2016-01-11 15:00:43","1");
INSERT INTO trianik_errors VALUES("28252","7280","1",0x494e5345525420494e544f20747269616e696b5f636c69656e7420286e616d652c207374617475732c2066697273746e616d652c206c6173746e616d652c20616464726573732c2062696c6c696e67616464726573732c2070617065726672656562696c6c696e67616464726573732c20656d61696c2c2074656c6570686f6e652c206d6f62696c652c20776f726b70686f6e652c206672657175656e63792c207374617274646174652c20686f75727372657175697265642c2070726566657272656464617974696d652c206e756d6265726f66626564726f6f6d732c206e756d6265726f6662617468726f6f6d732c2076616c7561626c6573746f626572656d6f7665642c2076616375756d2c2069726f6e696e6772657175697265642c207061796d656e746d6574686f642c206e756d6265726f666b657973676976656e2c20616c61726d666f62676976656e2c20616c61726d636f6465732c20616363657373696e737472756374696f6e732c207370656369666963726571756972656d656e74732c206d65746163726561746564646174652c206d657461637265617465647573657269642c206d6574616d6f646966696564646174652c206d6574616d6f646966696564757365726964292056414c5545532028274269676773272c2027272c20274b6576696e272c202748696c746f6e272c2027272c2027272c2027272c2027696e666f4070726f64696779776f726b732e636f2e756b272c2027343437373330363139313935272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c204e4f5728292c20312c204e4f5728292c203129203d204475706c696361746520656e747279202742696767732720666f72206b657920276e616d6527,"2016-01-11 15:00:43","2016-01-11 15:00:43","1","2016-01-11 15:00:43","1");
INSERT INTO trianik_errors VALUES("28253","7280","1",0x53454c45435420412e2a2046524f4d20747269616e696b5f636c69656e74204120574845524520412e4269676773203d20276e616d6527204f5244455220425920412e6e616d6520415343202d20556e6b6e6f776e20636f6c756d6e2027412e42696767732720696e2027776865726520636c6175736527,"2016-01-11 15:02:04","2016-01-11 15:02:04","1","2016-01-11 15:02:04","1");
INSERT INTO trianik_errors VALUES("28254","7280","1",0x494e5345525420494e544f20747269616e696b5f636c69656e7420286e616d652c207374617475732c2066697273746e616d652c206c6173746e616d652c20616464726573732c2062696c6c696e67616464726573732c2070617065726672656562696c6c696e67616464726573732c20656d61696c2c2074656c6570686f6e652c206d6f62696c652c20776f726b70686f6e652c206672657175656e63792c207374617274646174652c20686f75727372657175697265642c2070726566657272656464617974696d652c206e756d6265726f66626564726f6f6d732c206e756d6265726f6662617468726f6f6d732c2076616c7561626c6573746f626572656d6f7665642c2076616375756d2c2069726f6e696e6772657175697265642c207061796d656e746d6574686f642c206e756d6265726f666b657973676976656e2c20616c61726d666f62676976656e2c20616c61726d636f6465732c20616363657373696e737472756374696f6e732c207370656369666963726571756972656d656e74732c206d65746163726561746564646174652c206d657461637265617465647573657269642c206d6574616d6f646966696564646174652c206d6574616d6f646966696564757365726964292056414c5545532028274269676773272c20274c272c20274b6576696e272c202748696c746f6e272c2027272c2027272c2027272c20276b6576696e2e68696c746f6e4070726f64696779776f726b732e636f2e756b272c2027343437373330363139313935272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c204e4f5728292c20312c204e4f5728292c203129203d204475706c696361746520656e747279202742696767732720666f72206b657920276e616d6527,"2016-01-11 15:02:04","2016-01-11 15:02:04","1","2016-01-11 15:02:04","1");
INSERT INTO trianik_errors VALUES("28255","7280","1",0x53454c454354202a2046524f4d20747269616e696b5f636c69656e74205748455245204269676773203d206e616d65202d20556e6b6e6f776e20636f6c756d6e202742696767732720696e2027776865726520636c6175736527,"2016-01-11 15:04:18","2016-01-11 15:04:18","1","2016-01-11 15:04:18","1");
INSERT INTO trianik_errors VALUES("28256","7280","1",0x494e5345525420494e544f20747269616e696b5f636c69656e7420286e616d652c207374617475732c2066697273746e616d652c206c6173746e616d652c20616464726573732c2062696c6c696e67616464726573732c2070617065726672656562696c6c696e67616464726573732c20656d61696c2c2074656c6570686f6e652c206d6f62696c652c20776f726b70686f6e652c206672657175656e63792c207374617274646174652c20686f75727372657175697265642c2070726566657272656464617974696d652c206e756d6265726f66626564726f6f6d732c206e756d6265726f6662617468726f6f6d732c2076616c7561626c6573746f626572656d6f7665642c2076616375756d2c2069726f6e696e6772657175697265642c207061796d656e746d6574686f642c206e756d6265726f666b657973676976656e2c20616c61726d666f62676976656e2c20616c61726d636f6465732c20616363657373696e737472756374696f6e732c207370656369666963726571756972656d656e74732c206d65746163726561746564646174652c206d657461637265617465647573657269642c206d6574616d6f646966696564646174652c206d6574616d6f646966696564757365726964292056414c5545532028274269676773272c20274c272c20274b6576696e272c20274c697463686669656c64272c2027272c2027272c2027272c20276b6576696e2e68696c746f6e4070726f64696779776f726b732e636f2e756b272c2027343437373330363139313935272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c204e4f5728292c20312c204e4f5728292c203129203d204475706c696361746520656e747279202742696767732720666f72206b657920276e616d6527,"2016-01-11 15:04:18","2016-01-11 15:04:18","1","2016-01-11 15:04:18","1");
INSERT INTO trianik_errors VALUES("28257","7280","1",0x53454c454354202a2046524f4d20747269616e696b5f636c69656e74205748455245204269676773203d20276e616d6527202d20556e6b6e6f776e20636f6c756d6e202742696767732720696e2027776865726520636c6175736527,"2016-01-11 15:05:26","2016-01-11 15:05:26","1","2016-01-11 15:05:26","1");
INSERT INTO trianik_errors VALUES("28258","7280","1",0x494e5345525420494e544f20747269616e696b5f636c69656e7420286e616d652c207374617475732c2066697273746e616d652c206c6173746e616d652c20616464726573732c2062696c6c696e67616464726573732c2070617065726672656562696c6c696e67616464726573732c20656d61696c2c2074656c6570686f6e652c206d6f62696c652c20776f726b70686f6e652c206672657175656e63792c207374617274646174652c20686f75727372657175697265642c2070726566657272656464617974696d652c206e756d6265726f66626564726f6f6d732c206e756d6265726f6662617468726f6f6d732c2076616c7561626c6573746f626572656d6f7665642c2076616375756d2c2069726f6e696e6772657175697265642c207061796d656e746d6574686f642c206e756d6265726f666b657973676976656e2c20616c61726d666f62676976656e2c20616c61726d636f6465732c20616363657373696e737472756374696f6e732c207370656369666963726571756972656d656e74732c206d65746163726561746564646174652c206d657461637265617465647573657269642c206d6574616d6f646966696564646174652c206d6574616d6f646966696564757365726964292056414c5545532028274269676773272c20274c272c20274b6576696e272c202748696c746f6e272c2027272c2027272c2027272c20276b6576696e2e68696c746f6e4070726f64696779776f726b732e636f2e756b272c2027343437373330363139313935272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c2027272c204e4f5728292c20312c204e4f5728292c203129203d204475706c696361746520656e747279202742696767732720666f72206b657920276e616d6527,"2016-01-11 15:05:26","2016-01-11 15:05:26","1","2016-01-11 15:05:26","1");
INSERT INTO trianik_errors VALUES("28259","7280","1",0x202d205461626c652027747269616e696b2e747269616e696b5f757365726167656e742720646f65736e2774206578697374,"2016-03-21 14:37:03","2016-03-21 14:37:03","1","2016-03-21 14:37:03","1");
INSERT INTO trianik_errors VALUES("28260","7318","1",0x53454c4543542053554d2854494d455354414d5044494646284d494e5554452c20737461727474696d652c20656e6474696d65292920415320686f7572732c2020422e6e616d6520415320637573746f6d65726e616d650d0a09090909090946524f4d20747269616e696b5f64696172792041200d0a090909090909494e4e4552204a4f494e20747269616e696b5f636c69656e742042200d0a0909090909094f4e20422e6964203d20412e636c69656e746964200d0a090909090909574845524520412e73746174757320494e20282749272c20274327290d0a090909090909414e44205945415228412e737461727474696d6529203d200d0a090909090909414e44204d4f4e544828412e737461727474696d6529203d200d0a090909090909414e4420412e64656c6574656420213d202759270d0a09090909090947524f555020425920422e6e616d650d0a0909090909094f5244455220425920422e6e616d65202d20596f75206861766520616e206572726f7220696e20796f75722053514c2073796e7461783b20636865636b20746865206d616e75616c207468617420636f72726573706f6e647320746f20796f7572204d7953514c207365727665722076657273696f6e20666f72207468652072696768742073796e74617820746f20757365206e6561722027414e44204d4f4e544828412e737461727474696d6529203d200d0a090909090909414e4420412e64656c6574656420213d202759270d0a09090909090947524f555020425920422e6e616d650d0a090927206174206c696e652037,"2016-07-28 11:16:49","2016-07-28 11:16:49","1","2016-07-28 11:16:49","1");



DROP TABLE trianik_filter;

CREATE TABLE `trianik_filter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `memberid` int(11) NOT NULL,
  `pageid` int(11) NOT NULL,
  `description` varchar(60) NOT NULL,
  `metacreateddate` datetime NOT NULL,
  `metacreateduserid` int(11) NOT NULL,
  `metamodifieddate` datetime NOT NULL,
  `metamodifieduserid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;




DROP TABLE trianik_filterdata;

CREATE TABLE `trianik_filterdata` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `filterid` int(11) NOT NULL,
  `columnname` varchar(60) DEFAULT NULL,
  `value` text,
  `metacreateddate` datetime NOT NULL,
  `metacreateduserid` int(11) NOT NULL,
  `metamodifieddate` datetime NOT NULL,
  `metamodifieduserid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;




DROP TABLE trianik_holiday;

CREATE TABLE `trianik_holiday` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `daystaken` float DEFAULT NULL,
  `accepteddate` date NOT NULL,
  `acceptedby` int(11) DEFAULT NULL,
  `requesteddate` date NOT NULL,
  `rejecteddate` date NOT NULL,
  `rejectedby` int(11) DEFAULT NULL,
  `reason` text,
  `enddate_half` int(11) DEFAULT NULL,
  `startdate_half` int(11) DEFAULT NULL,
  `metacreateddate` date DEFAULT NULL,
  `metamodifieddate` date DEFAULT NULL,
  `metacreateduserid` int(11) DEFAULT NULL,
  `metamodifieduserid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;

INSERT INTO trianik_holiday VALUES("38","1","","2015-08-09","2015-08-13","4","0000-00-00","","2015-08-09","0000-00-00","",0x,"1","1","2015-08-09","2015-08-09","1","1");
INSERT INTO trianik_holiday VALUES("40","256","","2015-08-31","2015-08-31","1","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("41","248","","2015-08-31","2015-08-31","1","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("42","251","","2015-08-31","2015-08-31","1","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("43","258","","2015-08-31","2015-08-31","1","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("44","249","","2015-08-31","2015-08-31","1","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("45","250","","2015-08-31","2015-08-31","1","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("46","257","","2015-08-31","2015-08-31","1","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("47","259","","2015-08-31","2015-08-31","1","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("48","254","","2015-08-31","2015-08-31","1","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("49","255","","2015-08-31","2015-08-31","1","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("50","247","","2015-08-31","2015-08-31","1","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("55","255","","2015-08-27","2015-08-27","1","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("54","257","","2015-08-24","2015-08-24","1","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("53","254","","2015-08-17","2015-08-28","8","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("56","249","","2015-08-24","2015-08-28","5","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("58","253","","2015-09-01","2015-09-03","3","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("59","249","","2015-12-25","2016-01-01","6","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("60","250","","2015-12-25","2016-01-01","6","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("61","248","","2015-12-25","2016-01-01","6","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("62","251","","2015-12-25","2016-01-01","6","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("63","252","","2015-12-25","2016-01-01","3","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("64","253","","2015-12-25","2016-01-01","4","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("65","254","","2015-12-25","2016-01-01","6","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("66","255","","2015-12-25","2016-01-01","6","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("67","256","","2015-09-17","2015-09-30","10","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("68","256","","2015-12-25","2016-01-01","6","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("69","257","","2015-12-25","2016-01-01","3","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("70","258","","2015-12-25","2016-01-01","6","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("71","259","","2015-12-25","2016-01-01","6","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("72","250","","2015-09-07","2015-09-18","0","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("73","255","","2015-09-03","2015-09-03","1","0000-00-00","","2015-08-27","0000-00-00","",0x,"1","1","2015-08-27","2015-08-27","1","1");
INSERT INTO trianik_holiday VALUES("74","249","","2015-10-13","2015-10-13","1","0000-00-00","","2015-10-13","0000-00-00","",0x,"1","1","2015-10-13","2015-10-13","1","1");
INSERT INTO trianik_holiday VALUES("75","256","","2016-07-28","2016-07-28","1","0000-00-00","","2016-07-28","0000-00-00","",0x,"1","1","2016-07-28","2016-07-28","1","1");
INSERT INTO trianik_holiday VALUES("76","256","","2016-07-28","2016-07-28","1","0000-00-00","","2016-07-28","0000-00-00","",0x,"1","1","2016-07-28","2016-07-28","1","1");



DROP TABLE trianik_images;

CREATE TABLE `trianik_images` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `path` char(255) DEFAULT '',
  `mimetype` char(50) DEFAULT '',
  `name` char(255) DEFAULT '',
  `imgwidth` smallint(4) DEFAULT '0',
  `imgheight` smallint(4) DEFAULT '0',
  `tag` char(255) DEFAULT '',
  `description` char(255) DEFAULT '',
  `image` longblob,
  `createddate` timestamp NULL DEFAULT NULL,
  `metacreateddate` datetime NOT NULL,
  `metacreateduserid` int(11) NOT NULL,
  `metamodifieddate` datetime NOT NULL,
  `metamodifieduserid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ID` (`id`),
  FULLTEXT KEY `search_index` (`name`,`description`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;




DROP TABLE trianik_loginaudit;

CREATE TABLE `trianik_loginaudit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `memberid` int(10) unsigned NOT NULL,
  `timeon` datetime DEFAULT NULL,
  `timeoff` datetime DEFAULT NULL,
  `metacreateddate` datetime NOT NULL,
  `metacreateduserid` int(11) NOT NULL,
  `metamodifieddate` datetime NOT NULL,
  `metamodifieduserid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1235 DEFAULT CHARSET=latin1;

INSERT INTO trianik_loginaudit VALUES("1162","1","2015-08-25 17:55:46","2015-08-25 17:55:47","2015-08-25 17:55:46","1","2015-08-25 17:55:47","1");
INSERT INTO trianik_loginaudit VALUES("1163","1","2015-08-25 17:55:48","2015-08-25 18:09:19","2015-08-25 17:55:48","1","2015-08-25 18:09:19","1");
INSERT INTO trianik_loginaudit VALUES("1164","1","2015-08-25 18:09:20","2015-08-25 20:03:38","2015-08-25 18:09:20","1","2015-08-25 20:03:38","1");
INSERT INTO trianik_loginaudit VALUES("1165","1","2015-08-26 07:55:25","2015-08-27 12:24:02","2015-08-26 07:55:25","1","2015-08-27 12:24:02","1");
INSERT INTO trianik_loginaudit VALUES("1166","1","2015-08-27 07:28:40","2015-08-27 14:43:12","2015-08-27 07:28:40","1","2015-08-27 14:43:12","1");
INSERT INTO trianik_loginaudit VALUES("1167","251","2015-08-27 11:06:06","","2015-08-27 11:06:06","251","2015-08-27 11:06:06","251");
INSERT INTO trianik_loginaudit VALUES("1168","1","2015-08-27 12:28:43","2015-08-27 14:46:18","2015-08-27 12:28:43","1","2015-08-27 14:46:18","1");
INSERT INTO trianik_loginaudit VALUES("1169","1","2015-08-27 12:29:11","","2015-08-27 12:29:11","1","2015-08-27 12:29:11","1");
INSERT INTO trianik_loginaudit VALUES("1170","251","2015-08-27 12:32:35","2015-08-27 14:37:37","2015-08-27 12:32:35","251","2015-08-27 14:37:37","251");
INSERT INTO trianik_loginaudit VALUES("1171","257","2015-08-27 14:36:53","","2015-08-27 14:36:53","257","2015-08-27 14:36:53","257");
INSERT INTO trianik_loginaudit VALUES("1172","248","2015-08-27 14:37:48","2015-08-27 14:39:49","2015-08-27 14:37:48","248","2015-08-27 14:39:49","248");
INSERT INTO trianik_loginaudit VALUES("1173","249","2015-08-27 14:40:35","2015-08-27 14:41:26","2015-08-27 14:40:35","249","2015-08-27 14:41:26","249");
INSERT INTO trianik_loginaudit VALUES("1174","248","2015-08-27 14:43:20","2015-08-27 14:44:00","2015-08-27 14:43:20","248","2015-08-27 14:44:00","248");
INSERT INTO trianik_loginaudit VALUES("1175","248","2015-08-27 14:45:15","2015-08-27 14:46:40","2015-08-27 14:45:15","248","2015-08-27 14:46:40","248");
INSERT INTO trianik_loginaudit VALUES("1176","1","2015-08-27 14:46:20","2015-08-27 15:18:41","2015-08-27 14:46:20","1","2015-08-27 15:18:41","1");
INSERT INTO trianik_loginaudit VALUES("1177","1","2015-08-27 14:46:46","2015-08-27 15:08:21","2015-08-27 14:46:46","1","2015-08-27 15:08:21","1");
INSERT INTO trianik_loginaudit VALUES("1178","248","2015-08-27 15:05:09","2015-08-27 17:04:26","2015-08-27 15:05:09","248","2015-08-27 17:04:26","248");
INSERT INTO trianik_loginaudit VALUES("1179","248","2015-08-27 15:08:35","2015-08-27 15:14:20","2015-08-27 15:08:35","248","2015-08-27 15:14:20","248");
INSERT INTO trianik_loginaudit VALUES("1180","1","2015-08-27 15:14:27","2015-08-27 15:49:08","2015-08-27 15:14:27","1","2015-08-27 15:49:08","1");
INSERT INTO trianik_loginaudit VALUES("1181","1","2015-08-27 15:18:42","2015-08-27 15:19:03","2015-08-27 15:18:42","1","2015-08-27 15:19:03","1");
INSERT INTO trianik_loginaudit VALUES("1182","1","2015-08-27 15:20:03","2015-08-27 15:20:09","2015-08-27 15:20:03","1","2015-08-27 15:20:09","1");
INSERT INTO trianik_loginaudit VALUES("1183","260","2015-08-27 16:53:39","2015-08-27 16:54:24","2015-08-27 16:53:39","260","2015-08-27 16:54:24","260");
INSERT INTO trianik_loginaudit VALUES("1184","247","2015-08-27 17:04:46","","2015-08-27 17:04:46","247","2015-08-27 17:04:46","247");
INSERT INTO trianik_loginaudit VALUES("1185","1","2015-08-27 17:06:21","2015-08-27 17:06:21","2015-08-27 17:06:21","1","2015-08-27 17:06:21","1");
INSERT INTO trianik_loginaudit VALUES("1186","251","2015-08-27 19:11:31","","2015-08-27 19:11:31","251","2015-08-27 19:11:31","251");
INSERT INTO trianik_loginaudit VALUES("1187","260","2015-08-27 19:37:58","2015-08-28 05:38:37","2015-08-27 19:37:58","260","2015-08-28 05:38:37","260");
INSERT INTO trianik_loginaudit VALUES("1188","248","2015-08-27 20:15:35","","2015-08-27 20:15:35","248","2015-08-27 20:15:35","248");
INSERT INTO trianik_loginaudit VALUES("1189","254","2015-08-28 00:16:32","2015-08-28 00:21:35","2015-08-28 00:16:32","254","2015-08-28 00:21:35","254");
INSERT INTO trianik_loginaudit VALUES("1190","1","2015-08-28 08:19:32","2015-09-01 09:31:46","2015-08-28 08:19:32","1","2015-09-01 09:31:46","1");
INSERT INTO trianik_loginaudit VALUES("1191","254","2015-08-28 09:17:51","2015-08-28 09:22:11","2015-08-28 09:17:51","254","2015-08-28 09:22:11","254");
INSERT INTO trianik_loginaudit VALUES("1192","254","2015-08-28 09:39:41","2015-08-28 09:42:27","2015-08-28 09:39:41","254","2015-08-28 09:42:27","254");
INSERT INTO trianik_loginaudit VALUES("1193","260","2015-08-28 10:07:29","2015-08-28 10:07:43","2015-08-28 10:07:29","260","2015-08-28 10:07:43","260");
INSERT INTO trianik_loginaudit VALUES("1194","1","2015-08-28 10:18:56","2015-08-28 10:18:59","2015-08-28 10:18:56","1","2015-08-28 10:18:59","1");
INSERT INTO trianik_loginaudit VALUES("1195","253","2015-08-28 11:08:50","","2015-08-28 11:08:50","253","2015-08-28 11:08:50","253");
INSERT INTO trianik_loginaudit VALUES("1196","1","2015-08-28 11:54:16","2015-08-28 15:05:16","2015-08-28 11:54:16","1","2015-08-28 15:05:16","1");
INSERT INTO trianik_loginaudit VALUES("1197","1","2015-08-28 17:19:13","2015-08-28 17:27:03","2015-08-28 17:19:13","1","2015-08-28 17:27:03","1");
INSERT INTO trianik_loginaudit VALUES("1198","248","2015-08-28 17:20:23","","2015-08-28 17:20:23","248","2015-08-28 17:20:23","248");
INSERT INTO trianik_loginaudit VALUES("1199","255","2015-08-28 18:18:57","2015-08-28 18:31:57","2015-08-28 18:18:57","255","2015-08-28 18:31:57","255");
INSERT INTO trianik_loginaudit VALUES("1200","260","2015-08-29 05:04:16","2015-08-29 05:04:16","2015-08-29 05:04:16","260","2015-08-29 05:04:16","260");
INSERT INTO trianik_loginaudit VALUES("1201","250","2015-08-29 08:16:14","2015-08-29 08:19:12","2015-08-29 08:16:14","250","2015-08-29 08:19:12","250");
INSERT INTO trianik_loginaudit VALUES("1202","250","2015-08-29 08:19:24","2015-08-29 08:22:28","2015-08-29 08:19:24","250","2015-08-29 08:22:28","250");
INSERT INTO trianik_loginaudit VALUES("1203","249","2015-08-30 12:17:10","2015-08-30 12:19:20","2015-08-30 12:17:10","249","2015-08-30 12:19:20","249");
INSERT INTO trianik_loginaudit VALUES("1204","248","2015-09-01 09:01:51","","2015-09-01 09:01:51","248","2015-09-01 09:01:51","248");
INSERT INTO trianik_loginaudit VALUES("1205","248","2015-09-01 09:04:41","","2015-09-01 09:04:41","248","2015-09-01 09:04:41","248");
INSERT INTO trianik_loginaudit VALUES("1206","248","2015-09-01 09:29:33","","2015-09-01 09:29:33","248","2015-09-01 09:29:33","248");
INSERT INTO trianik_loginaudit VALUES("1207","248","2015-09-01 09:29:33","2015-09-01 09:29:53","2015-09-01 09:29:33","248","2015-09-01 09:29:53","248");
INSERT INTO trianik_loginaudit VALUES("1208","252","2015-09-01 09:30:05","2015-09-01 10:52:17","2015-09-01 09:30:05","252","2015-09-01 10:52:17","252");
INSERT INTO trianik_loginaudit VALUES("1209","1","2015-09-01 09:52:51","2015-09-01 09:54:55","2015-09-01 09:52:51","1","2015-09-01 09:54:55","1");
INSERT INTO trianik_loginaudit VALUES("1210","252","2015-09-01 09:54:53","","2015-09-01 09:54:53","252","2015-09-01 09:54:53","252");
INSERT INTO trianik_loginaudit VALUES("1211","1","2015-09-01 09:56:42","2015-09-01 13:20:10","2015-09-01 09:56:42","1","2015-09-01 13:20:10","1");
INSERT INTO trianik_loginaudit VALUES("1212","254","2015-09-01 10:06:40","2015-09-01 10:07:49","2015-09-01 10:06:40","254","2015-09-01 10:07:49","254");
INSERT INTO trianik_loginaudit VALUES("1213","254","2015-09-01 12:32:40","2015-09-01 12:32:40","2015-09-01 12:32:40","254","2015-09-01 12:32:40","254");
INSERT INTO trianik_loginaudit VALUES("1214","256","2015-09-01 14:52:41","","2015-09-01 14:52:41","256","2015-09-01 14:52:41","256");
INSERT INTO trianik_loginaudit VALUES("1215","1","2015-09-01 15:47:46","2015-09-01 15:53:57","2015-09-01 15:47:46","1","2015-09-01 15:53:57","1");
INSERT INTO trianik_loginaudit VALUES("1216","1","2015-09-01 16:58:03","2015-09-01 17:45:14","2015-09-01 16:58:03","1","2015-09-01 17:45:14","1");
INSERT INTO trianik_loginaudit VALUES("1217","1","2015-09-01 17:45:23","2015-09-01 21:05:31","2015-09-01 17:45:23","1","2015-09-01 21:05:31","1");
INSERT INTO trianik_loginaudit VALUES("1218","1","2015-09-04 10:52:49","2015-09-04 16:11:31","2015-09-04 10:52:49","1","2015-09-04 16:11:31","1");
INSERT INTO trianik_loginaudit VALUES("1219","1","2015-09-28 15:35:24","2015-09-28 15:50:03","2015-09-28 15:35:24","1","2015-09-28 15:50:03","1");
INSERT INTO trianik_loginaudit VALUES("1220","1","2015-10-13 10:33:51","2015-10-13 10:34:23","2015-10-13 10:33:51","1","2015-10-13 10:34:23","1");
INSERT INTO trianik_loginaudit VALUES("1221","1","2015-10-13 10:42:39","2015-10-13 10:43:19","2015-10-13 10:42:39","1","2015-10-13 10:43:19","1");
INSERT INTO trianik_loginaudit VALUES("1222","1","2015-10-13 10:43:41","2015-10-13 10:46:00","2015-10-13 10:43:41","1","2015-10-13 10:46:00","1");
INSERT INTO trianik_loginaudit VALUES("1223","1","2015-10-13 10:46:01","2015-10-13 11:02:57","2015-10-13 10:46:01","1","2015-10-13 11:02:57","1");
INSERT INTO trianik_loginaudit VALUES("1224","1","2015-10-16 13:35:00","2015-10-16 14:06:40","2015-10-16 13:35:00","1","2015-10-16 14:06:40","1");
INSERT INTO trianik_loginaudit VALUES("1225","1","2015-10-16 13:35:37","2015-10-16 13:46:01","2015-10-16 13:35:37","1","2015-10-16 13:46:01","1");
INSERT INTO trianik_loginaudit VALUES("1226","1","2015-10-16 14:06:42","2015-10-16 14:06:45","2015-10-16 14:06:42","1","2015-10-16 14:06:45","1");
INSERT INTO trianik_loginaudit VALUES("1227","1","2015-11-05 17:27:17","2015-11-05 17:28:06","2015-11-05 17:27:17","1","2015-11-05 17:28:06","1");
INSERT INTO trianik_loginaudit VALUES("1228","1","2015-11-05 17:28:07","2015-11-05 17:29:01","2015-11-05 17:28:07","1","2015-11-05 17:29:01","1");
INSERT INTO trianik_loginaudit VALUES("1229","1","2015-11-20 12:56:43","2015-11-20 17:25:27","2015-11-20 12:56:43","1","2015-11-20 17:25:27","1");
INSERT INTO trianik_loginaudit VALUES("1230","1","2016-01-04 16:03:41","2016-01-04 16:03:54","2016-01-04 16:03:41","1","2016-01-04 16:03:54","1");
INSERT INTO trianik_loginaudit VALUES("1231","1","2016-01-11 14:32:38","2016-01-11 15:08:32","2016-01-11 14:32:38","1","2016-01-11 15:08:32","1");
INSERT INTO trianik_loginaudit VALUES("1232","1","2016-03-21 12:15:50","2016-03-21 12:16:04","2016-03-21 12:15:50","1","2016-03-21 12:16:04","1");
INSERT INTO trianik_loginaudit VALUES("1233","1","2016-07-28 11:12:35","2016-07-28 11:18:42","2016-07-28 11:12:35","1","2016-07-28 11:18:42","1");
INSERT INTO trianik_loginaudit VALUES("1234","1","2016-10-13 18:41:42","","2016-10-13 18:41:42","1","2016-10-13 18:41:42","1");



DROP TABLE trianik_memberrota;

CREATE TABLE `trianik_memberrota` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `memberid` int(11) unsigned NOT NULL,
  `weekday` int(11) DEFAULT NULL,
  `metacreateddate` datetime NOT NULL,
  `metacreateduserid` int(11) NOT NULL,
  `metamodifieddate` datetime NOT NULL,
  `metamodifieduserid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `memberid_weekday` (`memberid`,`weekday`)
) ENGINE=MyISAM AUTO_INCREMENT=312 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

INSERT INTO trianik_memberrota VALUES("242","240","1","2015-08-04 20:37:44","1","2015-08-04 20:37:44","1");
INSERT INTO trianik_memberrota VALUES("243","240","3","2015-08-04 20:37:48","1","2015-08-04 20:38:07","1");
INSERT INTO trianik_memberrota VALUES("244","240","5","2015-08-04 20:38:12","1","2015-08-04 20:38:12","1");
INSERT INTO trianik_memberrota VALUES("245","238","2","2015-08-04 21:34:14","1","2015-08-04 21:34:14","1");
INSERT INTO trianik_memberrota VALUES("246","238","3","2015-08-04 21:34:18","1","2015-08-04 21:34:18","1");
INSERT INTO trianik_memberrota VALUES("247","238","4","2015-08-04 21:34:23","1","2015-08-04 21:34:23","1");
INSERT INTO trianik_memberrota VALUES("249","241","2","2015-08-04 21:34:55","1","2015-08-04 21:34:55","1");
INSERT INTO trianik_memberrota VALUES("250","241","3","2015-08-04 21:34:59","1","2015-08-04 21:34:59","1");
INSERT INTO trianik_memberrota VALUES("251","239","2","2015-08-04 21:35:28","1","2015-08-04 21:35:28","1");
INSERT INTO trianik_memberrota VALUES("252","239","3","2015-08-04 21:35:32","1","2015-08-04 21:35:32","1");
INSERT INTO trianik_memberrota VALUES("253","1","1","2015-08-04 21:35:52","1","2015-08-04 21:35:52","1");
INSERT INTO trianik_memberrota VALUES("254","1","3","2015-08-04 21:35:56","1","2015-08-04 21:35:56","1");
INSERT INTO trianik_memberrota VALUES("255","256","1","2015-08-27 07:56:18","1","2015-08-27 07:56:18","1");
INSERT INTO trianik_memberrota VALUES("256","256","2","2015-08-27 07:56:25","1","2015-08-27 07:56:25","1");
INSERT INTO trianik_memberrota VALUES("257","256","3","2015-08-27 07:56:28","1","2015-08-27 07:56:28","1");
INSERT INTO trianik_memberrota VALUES("258","256","4","2015-08-27 07:56:32","1","2015-08-27 07:56:32","1");
INSERT INTO trianik_memberrota VALUES("259","256","5","2015-08-27 07:56:37","1","2015-08-27 07:56:37","1");
INSERT INTO trianik_memberrota VALUES("260","248","1","2015-08-27 07:57:01","1","2015-08-27 07:57:01","1");
INSERT INTO trianik_memberrota VALUES("261","248","2","2015-08-27 07:57:05","1","2015-08-27 07:57:05","1");
INSERT INTO trianik_memberrota VALUES("262","248","3","2015-08-27 07:57:09","1","2015-08-27 07:57:09","1");
INSERT INTO trianik_memberrota VALUES("263","248","4","2015-08-27 07:57:13","1","2015-08-27 07:57:13","1");
INSERT INTO trianik_memberrota VALUES("264","248","5","2015-08-27 07:57:19","1","2015-08-27 07:57:19","1");
INSERT INTO trianik_memberrota VALUES("265","251","1","2015-08-27 07:57:38","1","2015-08-27 07:57:38","1");
INSERT INTO trianik_memberrota VALUES("266","251","3","2015-08-27 07:57:42","1","2015-08-27 07:57:42","1");
INSERT INTO trianik_memberrota VALUES("267","251","4","2015-08-27 07:57:46","1","2015-08-27 07:57:46","1");
INSERT INTO trianik_memberrota VALUES("268","251","5","2015-08-27 07:57:49","1","2015-08-27 07:57:49","1");
INSERT INTO trianik_memberrota VALUES("269","258","1","2015-08-27 07:58:22","1","2015-08-27 07:58:22","1");
INSERT INTO trianik_memberrota VALUES("270","258","2","2015-08-27 07:58:26","1","2015-08-27 07:58:26","1");
INSERT INTO trianik_memberrota VALUES("271","258","3","2015-08-27 07:58:30","1","2015-08-27 07:58:30","1");
INSERT INTO trianik_memberrota VALUES("272","258","4","2015-08-27 07:58:33","1","2015-08-27 07:58:33","1");
INSERT INTO trianik_memberrota VALUES("273","258","5","2015-08-27 07:58:38","1","2015-08-27 07:58:38","1");
INSERT INTO trianik_memberrota VALUES("274","249","1","2015-08-27 07:59:01","1","2015-08-27 07:59:01","1");
INSERT INTO trianik_memberrota VALUES("275","249","2","2015-08-27 07:59:05","1","2015-08-27 07:59:05","1");
INSERT INTO trianik_memberrota VALUES("276","249","3","2015-08-27 07:59:09","1","2015-08-27 07:59:09","1");
INSERT INTO trianik_memberrota VALUES("277","249","4","2015-08-27 07:59:14","1","2015-08-27 07:59:14","1");
INSERT INTO trianik_memberrota VALUES("278","249","5","2015-08-27 07:59:18","1","2015-08-27 07:59:18","1");
INSERT INTO trianik_memberrota VALUES("279","250","1","2015-08-27 07:59:38","1","2015-08-27 07:59:38","1");
INSERT INTO trianik_memberrota VALUES("280","250","2","2015-08-27 07:59:42","1","2015-08-27 07:59:42","1");
INSERT INTO trianik_memberrota VALUES("281","250","3","2015-08-27 07:59:47","1","2015-08-27 07:59:47","1");
INSERT INTO trianik_memberrota VALUES("282","250","4","2015-08-27 07:59:51","1","2015-08-27 07:59:51","1");
INSERT INTO trianik_memberrota VALUES("283","250","5","2015-08-27 07:59:55","1","2015-08-27 07:59:55","1");
INSERT INTO trianik_memberrota VALUES("284","257","1","2015-08-27 08:00:18","1","2015-08-27 08:00:18","1");
INSERT INTO trianik_memberrota VALUES("285","257","5","2015-08-27 08:00:24","1","2015-08-27 08:00:24","1");
INSERT INTO trianik_memberrota VALUES("286","259","1","2015-08-27 08:00:50","1","2015-08-27 08:00:50","1");
INSERT INTO trianik_memberrota VALUES("287","259","2","2015-08-27 08:00:54","1","2015-08-27 08:00:54","1");
INSERT INTO trianik_memberrota VALUES("288","259","3","2015-08-27 08:00:59","1","2015-08-27 08:00:59","1");
INSERT INTO trianik_memberrota VALUES("289","259","4","2015-08-27 08:01:03","1","2015-08-27 08:01:03","1");
INSERT INTO trianik_memberrota VALUES("290","259","5","2015-08-27 08:01:08","1","2015-08-27 08:01:08","1");
INSERT INTO trianik_memberrota VALUES("291","252","2","2015-08-27 08:01:28","1","2015-08-27 08:01:28","1");
INSERT INTO trianik_memberrota VALUES("292","252","4","2015-08-27 08:01:32","1","2015-08-27 08:01:32","1");
INSERT INTO trianik_memberrota VALUES("293","252","5","2015-08-27 08:01:37","1","2015-08-27 08:01:37","1");
INSERT INTO trianik_memberrota VALUES("294","253","2","2015-08-27 08:07:58","1","2015-08-27 08:07:58","1");
INSERT INTO trianik_memberrota VALUES("295","253","3","2015-08-27 08:08:01","1","2015-08-27 08:08:01","1");
INSERT INTO trianik_memberrota VALUES("296","253","4","2015-08-27 08:08:09","1","2015-08-27 08:08:09","1");
INSERT INTO trianik_memberrota VALUES("297","253","5","2015-08-27 08:08:12","1","2015-08-27 08:08:12","1");
INSERT INTO trianik_memberrota VALUES("298","254","1","2015-08-27 08:08:30","1","2015-08-27 08:08:30","1");
INSERT INTO trianik_memberrota VALUES("299","254","2","2015-08-27 08:08:33","1","2015-08-27 08:08:33","1");
INSERT INTO trianik_memberrota VALUES("300","254","4","2015-08-27 08:09:10","1","2015-08-27 08:09:10","1");
INSERT INTO trianik_memberrota VALUES("301","254","5","2015-08-27 08:09:16","1","2015-08-27 08:09:16","1");
INSERT INTO trianik_memberrota VALUES("302","255","1","2015-08-27 08:10:25","1","2015-08-27 08:10:25","1");
INSERT INTO trianik_memberrota VALUES("303","255","2","2015-08-27 08:10:28","1","2015-08-27 08:10:28","1");
INSERT INTO trianik_memberrota VALUES("304","255","3","2015-08-27 08:10:31","1","2015-08-27 08:10:31","1");
INSERT INTO trianik_memberrota VALUES("305","255","4","2015-08-27 08:10:35","1","2015-08-27 08:10:35","1");
INSERT INTO trianik_memberrota VALUES("306","255","5","2015-08-27 08:10:39","1","2015-08-27 08:10:39","1");
INSERT INTO trianik_memberrota VALUES("307","247","1","2015-08-27 15:33:28","1","2015-08-27 15:33:28","1");
INSERT INTO trianik_memberrota VALUES("308","247","2","2015-08-27 15:33:33","1","2015-08-27 15:33:33","1");
INSERT INTO trianik_memberrota VALUES("309","247","3","2015-08-27 15:33:36","1","2015-08-27 15:33:36","1");
INSERT INTO trianik_memberrota VALUES("310","247","4","2015-08-27 15:33:40","1","2015-08-27 15:33:40","1");
INSERT INTO trianik_memberrota VALUES("311","247","5","2015-08-27 15:33:44","1","2015-08-27 15:33:44","1");



DROP TABLE trianik_members;

CREATE TABLE `trianik_members` (
  `member_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `fullname` varchar(150) DEFAULT NULL,
  `login` varchar(100) NOT NULL DEFAULT '',
  `passwd` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(60) DEFAULT NULL,
  `title` varchar(60) DEFAULT NULL,
  `imageid` int(11) DEFAULT NULL,
  `holidayentitlement` int(11) DEFAULT NULL,
  `clientid` int(11) DEFAULT NULL,
  `description` text,
  `lastaccessdate` datetime DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `postcode` varchar(8) DEFAULT NULL,
  `systemuser` varchar(1) DEFAULT NULL,
  `accepted` varchar(1) DEFAULT NULL,
  `paymentmethod` varchar(1) DEFAULT NULL,
  `website` varchar(200) DEFAULT NULL,
  `guid` varchar(100) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `landline` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `dateofbirth` datetime NOT NULL,
  `notes` text NOT NULL,
  `address` text NOT NULL,
  `billingaddress` text NOT NULL,
  `paperfreebillingaddress` text NOT NULL,
  `loginauditid` int(11) NOT NULL,
  `postcode_lat` float NOT NULL,
  `postcode_lng` float NOT NULL,
  `metacreateddate` datetime NOT NULL,
  `metacreateduserid` int(11) NOT NULL,
  `metamodifieddate` datetime NOT NULL,
  `metamodifieduserid` int(11) NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=261 DEFAULT CHARSET=latin1;

INSERT INTO trianik_members VALUES("249","Julie","Roberts","Julie Roberts","julie","e95dafe7231707ebe28f6aeef49153c7","julieanddee2014@gmail.com","","","28","",0x,"2015-08-30 12:19:20","Y","","","Y","","","55debe838f30f","07913901614","","","0000-00-00 00:00:00",0x,0x,0x,0x,"1203","0","0","2015-08-27 07:38:43","1","2015-08-30 12:19:20","249");
INSERT INTO trianik_members VALUES("250","Kate","Hope","Kate Hope","kate","8c728e685ddde9f7fbbc452155e29639","nhope@fsmail.net","","","28","",0x,"2015-08-29 08:19:24","Y","","","Y","","","55debed709c25","07858747513","","","0000-00-00 00:00:00",0x,0x,0x,0x,"1202","0","0","2015-08-27 07:40:07","1","2015-08-29 08:19:24","250");
INSERT INTO trianik_members VALUES("251","Gail","Ingram","Gail Ingram","gail","22a19e5dd971e9648c335e6770497bba","gailingram@live.co.uk","","","22","",0x,"","Y","","","Y","","","55debf10cadc4","07511264780","","","0000-00-00 00:00:00",0x,0x,0x,0x,"1186","0","0","2015-08-27 07:41:04","1","2015-08-27 19:11:31","251");
INSERT INTO trianik_members VALUES("252","Lindsey","Bracken","Lindsey Bracken","lindsey","179342587daf0be9866c495f928d764d","lindseybracken@hotmail.co.uk","","","13","",0x,"","Y","","","Y","","","55debf5235a65","07443467378","","","0000-00-00 00:00:00",0x,0x,0x,0x,"1210","0","0","2015-08-27 07:42:10","1","2015-09-01 09:54:53","252");
INSERT INTO trianik_members VALUES("253","Lorraine","Fitzpatrick","Lorraine Fitzpatrick","lorraine","d53b99133799a0e5c7c04f5d6b5f82b6","lorrainewing82@hotmail.co.uk","","","22","",0x,"","Y","","","Y","","","55debfc625093","07581065210","","","0000-00-00 00:00:00",0x,0x,0x,0x,"1195","0","0","2015-08-27 07:44:06","1","2015-08-28 11:08:50","253");
INSERT INTO trianik_members VALUES("254","Louisa","Driscoll","Louisa Driscoll","louisa","b08e183035bb027264d4c2910f124f4e","louisadriscoll34@gmail.com","","","22","",0x,"2015-09-01 12:32:40","Y","","","Y","","","55dec00956250","07943083828","","","0000-00-00 00:00:00",0x,0x,0x,0x,"1213","0","0","2015-08-27 07:45:13","1","2015-09-01 12:32:40","254");
INSERT INTO trianik_members VALUES("255","Xenia","Schaefer","Xenia Schaefer","xenia","d28e60078ef7975fa5d4d3930b5c2775","ixi051273@hotmail.co.uk","","","28","",0x,"2015-08-28 18:31:28","Y","","","Y","","","55dec0492a23b","07739435243","","","0000-00-00 00:00:00",0x,0x,0x,0x,"1199","0","0","2015-08-27 07:46:17","1","2015-08-28 18:31:28","255");
INSERT INTO trianik_members VALUES("248","Danielle","Langford","Danielle Langford","Danielle","1cc0da8722d5ae4a573d2091f87551ee","danni.felicity@hotmail.co.uk","","","28","",0x,"2015-08-27 15:14:18","Y","","","Y","","","55debdffd4147","07595361887","","","0000-00-00 00:00:00",0x,0x,0x,0x,"1207","0","0","2015-08-27 07:36:31","1","2015-09-01 09:29:33","248");
INSERT INTO trianik_members VALUES("247","Nicola","Saunders","Nicola Saunders","nicola","21232f297a57a5a743894a0e4a801fc3","niknak.s@sky.com","","","28","",0x,"","Y","","","Y","","","55debce05738a","07795247961","","","0000-00-00 00:00:00",0x,0x,0x,0x,"1184","0","0","2015-08-27 07:31:44","1","2015-08-27 17:04:46","247");
INSERT INTO trianik_members VALUES("256","Amy","Barney","Amy Barney","amy","73d94ca09de7d23b853273b035cbc752","amy_barney_10@outlook.com","","","28","",0x,"","Y","","","Y","","","55dec08561350","07798753166","","","0000-00-00 00:00:00",0x,0x,0x,0x,"1214","0","0","2015-08-27 07:47:17","1","2015-09-01 14:52:41","256");
INSERT INTO trianik_members VALUES("257","Kirsten","Jarvis","Kirsten Jarvis","kirsten","e3bdea4f0a4883562d6e56a8ceb55e0a","kirsten-jarvis@hotmail.com","","","6","",0x,"","Y","","","Y","","","55dec0db4f2fe","07717317820","","","0000-00-00 00:00:00",0x,0x,0x,0x,"1171","0","0","2015-08-27 07:48:43","1","2015-08-27 14:36:53","257");
INSERT INTO trianik_members VALUES("258","Hollie","Morris","Hollie Morris","hollie","ec726fd938bbf930b86581442b18bec7","lil-tink01@hotmail.co.uk","","","28","",0x,"","Y","","","Y","","","55dec12836ad6","07912695273","","","0000-00-00 00:00:00",0x,0x,0x,0x,"0","0","0","2015-08-27 07:50:00","1","2015-08-27 07:50:00","1");
INSERT INTO trianik_members VALUES("259","Leanne","Turner","Leanne Turner","Leanne","0f16cff442c47bbbf3b4715d7b39b3d2","info@trianik.co.uk","","","28","",0x,"","Y","","","Y","","","55dec1a1bd9b8","07799401702","","","0000-00-00 00:00:00",0x,0x,0x,0x,"0","0","0","2015-08-27 07:52:01","1","2015-08-27 07:52:01","1");
INSERT INTO trianik_members VALUES("260","Natasha","Hubbard","Natasha Hubbard","natasha","1d902a2e0a226b6ab2d4e91cabf89d94","tashweyman@hotmail.co.uk","","","0","",0x,"2015-08-29 05:04:16","Y","","","Y","","","55dec1f9bc6bd","","","","0000-00-00 00:00:00",0x,0x,0x,0x,"1200","0","0","2015-08-27 07:53:29","1","2015-08-29 05:04:16","260");
INSERT INTO trianik_members VALUES("1","System","Manager","System Manager","admin","21232f297a57a5a743894a0e4a801fc3","kevin.hilton@prodigyworks.co.uk","","","28","",0x,"2016-07-28 11:18:42","Y","","","Y","","","55debe838f30f","07913901614","","","0000-00-00 00:00:00",0x,0x,0x,0x,"1234","0","0","2015-08-27 07:38:43","1","2016-10-13 18:41:42","1");



DROP TABLE trianik_messages;

CREATE TABLE `trianik_messages` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `from_member_id` int(11) DEFAULT NULL,
  `to_member_id` int(11) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text,
  `status` varchar(1) DEFAULT NULL,
  `deleted` varchar(1) DEFAULT NULL,
  `action` text,
  `createddate` timestamp NULL DEFAULT NULL,
  `replied` varchar(1) DEFAULT NULL,
  `metacreateddate` datetime NOT NULL,
  `metacreateduserid` int(11) NOT NULL,
  `metamodifieddate` datetime NOT NULL,
  `metamodifieduserid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `to_member_id` (`to_member_id`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

INSERT INTO trianik_messages VALUES("67","1","1","Work Allocation",0x536869667420616c6c6f636174656420746f20796f75206f6e204672696461792030383a32352d31333a303020666f72204173686275726e65720a,"N","",0x,"2015-11-20 17:25:26","","2015-11-20 17:25:26","1","2015-11-20 17:25:26","1");



DROP TABLE trianik_pagenavigation;

CREATE TABLE `trianik_pagenavigation` (
  `pagenavigationid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pageid` int(11) NOT NULL,
  `childpageid` int(11) NOT NULL,
  `sequence` int(11) NOT NULL,
  `pagetype` varchar(1) DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `divider` int(11) DEFAULT NULL,
  `target` varchar(50) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `metacreateddate` datetime NOT NULL,
  `metacreateduserid` int(11) NOT NULL,
  `metamodifieddate` datetime NOT NULL,
  `metamodifieduserid` int(11) NOT NULL,
  PRIMARY KEY (`pagenavigationid`),
  UNIQUE KEY `ix_pagenav` (`pageid`,`childpageid`,`sequence`)
) ENGINE=MyISAM AUTO_INCREMENT=275 DEFAULT CHARSET=latin1;

INSERT INTO trianik_pagenavigation VALUES("1","1","1","1","P","","","","red","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("2","1","8","600","M","Administration","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("3","1","11","321","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("118","1","7167","2700","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("9","1","1271","2000","M","Configuration","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("151","7195","7201","300","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("119","1","7168","2500","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("19","1","3000","11","P","","","","blue","0000-00-00 00:00:00","0","2014-05-13 17:27:27","1");
INSERT INTO trianik_pagenavigation VALUES("150","7196","7200","200","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("149","7196","7199","100","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("22","1","130","2","M","Data Management","","","","0000-00-00 00:00:00","0","2014-05-13 17:27:27","1");
INSERT INTO trianik_pagenavigation VALUES("148","7195","7198","200","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("147","7195","7197","100","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("132","7180","7182","200","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("133","3000","7183","1600","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("134","3000","7184","300","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("135","7174","7185","300","M","Graphs","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("136","7174","7186","500","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("137","7174","7187","400","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("138","7174","7188","600","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("139","3000","7189","800","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("140","3000","7190","1700","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("141","1","7191","3400","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("142","1","7192","3500","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("143","1","7193","200","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("144","1","7194","3600","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("145","1","7195","3700","P","","","","brown","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("146","1","7196","3800","P","","","","cyan","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("61","1","4","2100","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("62","1","7105","500","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("63","1","7107","500","H","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("131","7180","7181","100","M","Members","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("130","1","7180","3300","P","Members","","","pink","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("129","1","7179","3100","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("128","3000","7178","1500","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("127","7174","7177","200","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("110","3000","7159","500","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("111","7213","7160","300","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("112","3000","7161","600","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("113","1","7162","2200","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("114","1","7163","2300","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("115","1","7164","2400","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("116","7213","7165","400","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("117","3000","7166","700","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("109","3000","7158","100","M","Data Management","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("125","1","7174","3200","P","","","","orange","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("126","7174","7176","100","M","Bookings","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("124","1","7173","3000","P","","","","yellow","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("123","1","7172","2600","P","","","","green","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("122","3000","7171","1200","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("121","3000","7170","1000","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("120","3000","7169","900","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("152","1","7202","3900","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("153","1","7203","4100","L","","","","","0000-00-00 00:00:00","0","2014-02-17 10:03:42","1");
INSERT INTO trianik_pagenavigation VALUES("154","1","7204","4200","L","","","","","0000-00-00 00:00:00","0","2014-02-17 10:03:38","1");
INSERT INTO trianik_pagenavigation VALUES("155","1","7205","4300","L","","","","","0000-00-00 00:00:00","0","2014-02-17 10:03:35","1");
INSERT INTO trianik_pagenavigation VALUES("156","1","7206","4500","L","","","","","0000-00-00 00:00:00","0","2014-02-17 10:03:27","1");
INSERT INTO trianik_pagenavigation VALUES("157","3000","7207","2200","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("158","3000","7208","2300","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("159","1","7209","4400","P","","","","","0000-00-00 00:00:00","0","2014-02-17 10:03:30","1");
INSERT INTO trianik_pagenavigation VALUES("160","3000","7210","1400","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("161","3000","7211","1800","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("162","7174","7212","700","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("163","1","7213","4600","P","","","","","0000-00-00 00:00:00","0","2014-02-17 10:03:25","1");
INSERT INTO trianik_pagenavigation VALUES("164","7213","7214","200","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("165","7213","7215","200","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("166","7213","7216","400","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("167","7213","7217","100","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("168","3000","7218","2400","M","Reports","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("169","3000","7219","2000","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("170","3000","7220","2500","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("171","3000","7221","1900","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("172","1","7222","4700","P","","","","","0000-00-00 00:00:00","0","2014-02-17 10:03:18","1");
INSERT INTO trianik_pagenavigation VALUES("173","7222","7223","100","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("174","3000","7224","2600","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("175","3000","7225","2100","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("176","1","7226","4800","P","","","","","0000-00-00 00:00:00","0","2014-02-17 10:03:15","1");
INSERT INTO trianik_pagenavigation VALUES("177","3000","7227","2700","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("178","3000","7228","2800","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("179","1","7229","4900","P","","","","","0000-00-00 00:00:00","0","2014-02-17 10:03:11","1");
INSERT INTO trianik_pagenavigation VALUES("180","7229","7230","100","L","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("181","3000","7231","1300","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("182","3000","7232","1100","M","","","","","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pagenavigation VALUES("183","1","7233","4000","M","","","","","2014-02-17 10:03:08","1","2014-02-17 10:03:42","1");
INSERT INTO trianik_pagenavigation VALUES("184","1","7234","5000","M","","","","","2014-02-20 15:20:59","1","2014-02-20 15:20:59","1");
INSERT INTO trianik_pagenavigation VALUES("185","3000","7235","2900","M","","","","","2014-02-20 18:19:22","1","2014-02-20 18:19:22","1");
INSERT INTO trianik_pagenavigation VALUES("186","7174","7236","800","M","","","","","2014-03-02 11:04:46","1","2014-03-02 11:04:46","1");
INSERT INTO trianik_pagenavigation VALUES("187","7174","7237","900","M","","","","","2014-03-13 15:43:57","1","2014-03-13 15:43:57","1");
INSERT INTO trianik_pagenavigation VALUES("188","3000","7238","3000","L","","","","","2014-03-24 10:24:22","1","2014-03-24 10:24:22","1");
INSERT INTO trianik_pagenavigation VALUES("189","7174","7239","1000","M","","","","","2014-09-03 12:48:15","1","2014-09-03 12:48:15","1");
INSERT INTO trianik_pagenavigation VALUES("190","1","7240","5100","P","","","","","2014-10-09 19:35:09","1","2014-10-09 19:35:09","1");
INSERT INTO trianik_pagenavigation VALUES("191","1","7241","5200","P","","","","","2014-10-09 19:38:01","1","2014-10-09 19:38:01","1");
INSERT INTO trianik_pagenavigation VALUES("192","7240","7242","100","M","Holidays","","","","2014-10-09 19:42:05","1","2014-10-09 19:42:05","1");
INSERT INTO trianik_pagenavigation VALUES("193","7240","7243","200","M","","","","","2014-10-09 19:46:32","1","2014-10-09 19:46:32","1");
INSERT INTO trianik_pagenavigation VALUES("194","7240","7244","300","M","","","","","2014-10-09 19:48:06","1","2014-10-09 19:48:06","1");
INSERT INTO trianik_pagenavigation VALUES("195","7240","7245","400","M","Reports","","","","2014-10-09 19:49:14","1","2014-10-09 19:49:14","1");
INSERT INTO trianik_pagenavigation VALUES("196","7240","7246","500","M","","","","","2014-10-09 19:50:11","1","2014-10-09 19:50:11","1");
INSERT INTO trianik_pagenavigation VALUES("197","7240","7247","600","M","","","","","2014-10-09 19:50:51","1","2014-10-09 19:50:51","1");
INSERT INTO trianik_pagenavigation VALUES("198","7240","7248","700","M","","","","","2014-10-09 19:51:43","1","2014-10-09 19:51:43","1");
INSERT INTO trianik_pagenavigation VALUES("199","7240","7249","800","M","Calendar","","","","2014-10-09 19:52:46","1","2014-10-09 19:52:46","1");
INSERT INTO trianik_pagenavigation VALUES("200","7240","7250","900","M","","","","","2014-10-09 19:53:34","1","2014-10-09 19:53:34","1");
INSERT INTO trianik_pagenavigation VALUES("201","7240","7251","1000","L","","","","","2014-10-10 22:34:36","1","2014-10-10 22:34:36","1");
INSERT INTO trianik_pagenavigation VALUES("202","7241","7252","100","M","Absence","","","","2014-10-11 13:20:04","1","2014-10-11 13:20:04","1");
INSERT INTO trianik_pagenavigation VALUES("203","7241","7253","200","M","","","","","2014-10-11 13:22:06","1","2014-10-11 13:22:06","1");
INSERT INTO trianik_pagenavigation VALUES("204","7241","7254","300","M","Reports","","","","2014-10-11 13:22:35","1","2014-10-11 13:22:35","1");
INSERT INTO trianik_pagenavigation VALUES("205","7241","7255","400","M","","","","","2014-10-11 13:23:27","1","2014-10-11 13:23:27","1");
INSERT INTO trianik_pagenavigation VALUES("206","7241","7256","500","M","Calendar","","","","2014-10-11 13:24:38","1","2014-10-11 13:24:38","1");
INSERT INTO trianik_pagenavigation VALUES("207","7241","7257","600","M","","","","","2014-10-11 13:25:28","1","2014-10-11 13:25:28","1");
INSERT INTO trianik_pagenavigation VALUES("208","7241","7258","700","L","","","","","2014-10-11 13:26:16","1","2014-10-11 13:26:16","1");
INSERT INTO trianik_pagenavigation VALUES("209","7174","7259","1300","M","Workflow","","","","2014-10-11 14:22:02","1","2014-12-21 20:42:59","1");
INSERT INTO trianik_pagenavigation VALUES("210","7174","7260","1100","L","","","","","2014-10-26 21:29:58","1","2014-12-19 12:10:02","1");
INSERT INTO trianik_pagenavigation VALUES("211","3000","7261","3100","M","Booking Administration","","","","2014-11-30 15:22:04","1","2014-11-30 15:22:04","1");
INSERT INTO trianik_pagenavigation VALUES("212","3000","7262","3200","M","","","","","2014-12-07 18:44:25","1","2014-12-07 18:44:25","1");
INSERT INTO trianik_pagenavigation VALUES("213","3000","7263","3300","M","","","","","2014-12-07 19:04:33","1","2014-12-07 19:04:33","1");
INSERT INTO trianik_pagenavigation VALUES("214","3000","7264","3400","M","","","","","2014-12-07 19:13:02","1","2014-12-07 19:13:02","1");
INSERT INTO trianik_pagenavigation VALUES("215","3000","7265","3500","M","","","","","2014-12-09 20:13:19","1","2014-12-09 20:13:19","1");
INSERT INTO trianik_pagenavigation VALUES("216","3000","7266","3600","M","","","","","2014-12-18 14:12:18","1","2014-12-18 14:12:18","1");
INSERT INTO trianik_pagenavigation VALUES("217","7174","7267","1400","M","","","","","2014-12-18 15:42:25","1","2014-12-21 20:42:56","1");
INSERT INTO trianik_pagenavigation VALUES("218","7174","7268","1500","M","","","","","2014-12-19 12:13:51","1","2014-12-21 20:42:53","1");
INSERT INTO trianik_pagenavigation VALUES("219","7174","7269","1600","M","","","","","2014-12-19 12:14:29","1","2014-12-21 20:42:49","1");
INSERT INTO trianik_pagenavigation VALUES("220","7174","7270","1700","M","Completed","","","","2014-12-19 12:17:00","1","2014-12-21 20:42:47","1");
INSERT INTO trianik_pagenavigation VALUES("221","7174","7271","1800","M","","","","","2014-12-19 12:19:12","1","2014-12-21 20:42:45","1");
INSERT INTO trianik_pagenavigation VALUES("222","7174","7272","1200","M","","","","","2014-12-19 12:19:30","1","2014-12-21 20:42:59","1");
INSERT INTO trianik_pagenavigation VALUES("223","3000","7273","3700","M","","","","","2014-12-21 13:20:56","1","2014-12-21 13:20:56","1");
INSERT INTO trianik_pagenavigation VALUES("224","3000","7274","3800","M","","","","","2014-12-21 20:55:13","1","2014-12-21 20:55:13","1");
INSERT INTO trianik_pagenavigation VALUES("225","3000","7275","3900","M","","","","","2014-12-21 20:55:42","1","2014-12-21 20:55:42","1");
INSERT INTO trianik_pagenavigation VALUES("226","1","7276","5300","P","","","","","2014-12-21 21:36:55","1","2014-12-21 21:36:55","1");
INSERT INTO trianik_pagenavigation VALUES("227","7276","7277","100","M","Data","","","","2014-12-21 21:39:17","1","2014-12-21 21:39:17","1");
INSERT INTO trianik_pagenavigation VALUES("228","7276","7278","200","M","","","","","2014-12-21 21:39:46","1","2014-12-21 21:39:46","1");
INSERT INTO trianik_pagenavigation VALUES("229","1","7279","5400","P","","","","","2014-12-22 22:08:35","1","2014-12-22 22:08:35","1");
INSERT INTO trianik_pagenavigation VALUES("230","1","7280","5500","P","","","","","2014-12-22 22:08:51","1","2014-12-22 22:08:51","1");
INSERT INTO trianik_pagenavigation VALUES("231","7279","7281","100","M","","","","","2014-12-22 22:14:49","1","2014-12-22 22:14:49","1");
INSERT INTO trianik_pagenavigation VALUES("232","7279","7282","200","M","","","","","2014-12-22 22:15:02","1","2014-12-22 22:15:02","1");
INSERT INTO trianik_pagenavigation VALUES("233","7279","7283","300","M","","","","","2014-12-22 22:15:30","1","2014-12-22 22:15:30","1");
INSERT INTO trianik_pagenavigation VALUES("234","7280","7284","100","M","","","","","2014-12-22 22:19:19","1","2014-12-22 22:19:19","1");
INSERT INTO trianik_pagenavigation VALUES("235","7280","7285","200","M","","","","","2014-12-22 22:20:53","1","2014-12-22 22:20:53","1");
INSERT INTO trianik_pagenavigation VALUES("236","7280","7286","300","M","","","","","2014-12-22 22:21:41","1","2014-12-22 22:21:41","1");
INSERT INTO trianik_pagenavigation VALUES("237","7280","7287","400","M","","","","","2014-12-22 22:22:37","1","2014-12-22 22:22:37","1");
INSERT INTO trianik_pagenavigation VALUES("238","1","7288","6200","P","","","","","2014-12-23 19:46:42","1","2015-08-27 15:19:01","1");
INSERT INTO trianik_pagenavigation VALUES("239","7279","7289","400","M","","","","","2015-01-02 12:57:48","1","2015-01-02 12:57:48","1");
INSERT INTO trianik_pagenavigation VALUES("240","7279","7290","500","L","","","","","2015-01-02 12:58:00","1","2015-01-02 12:58:00","1");
INSERT INTO trianik_pagenavigation VALUES("241","7280","7291","500","M","","","","","2015-01-10 21:56:37","1","2015-01-10 21:56:37","1");
INSERT INTO trianik_pagenavigation VALUES("242","7288","7292","600","M","Reports","","","","2015-01-11 00:09:58","1","2015-01-11 00:09:58","1");
INSERT INTO trianik_pagenavigation VALUES("243","7288","7293","700","M","","","","","2015-01-22 19:05:10","1","2015-01-22 19:05:10","1");
INSERT INTO trianik_pagenavigation VALUES("244","7288","7294","800","M","","","","","2015-06-09 21:11:50","1","2015-06-09 21:11:50","1");
INSERT INTO trianik_pagenavigation VALUES("245","7288","7295","900","L","","","","","2015-06-11 18:33:01","1","2015-06-11 18:33:01","1");
INSERT INTO trianik_pagenavigation VALUES("246","7288","7296","1000","L","","","","","2015-06-12 16:26:13","1","2015-06-12 16:26:13","1");
INSERT INTO trianik_pagenavigation VALUES("247","1","7297","5600","L","","","","","2015-06-12 18:37:09","1","2015-08-09 20:10:39","1");
INSERT INTO trianik_pagenavigation VALUES("248","7288","7298","1100","M","","","","","2015-06-13 16:05:20","1","2015-06-13 16:05:20","1");
INSERT INTO trianik_pagenavigation VALUES("249","7280","7299","600","L","","","","","2015-06-15 19:31:40","1","2015-06-15 19:31:40","1");
INSERT INTO trianik_pagenavigation VALUES("250","7280","7300","700","L","","","","","2015-06-15 19:31:59","1","2015-06-15 19:31:59","1");
INSERT INTO trianik_pagenavigation VALUES("251","1","7301","5700","L","","","","","2015-06-15 21:25:51","1","2015-08-09 20:10:40","1");
INSERT INTO trianik_pagenavigation VALUES("252","1","7302","5900","L","","","","","2015-06-15 21:26:08","1","2015-08-27 15:18:57","1");
INSERT INTO trianik_pagenavigation VALUES("253","7280","7303","800","L","","","","","2015-06-28 16:00:14","1","2015-06-28 16:00:14","1");
INSERT INTO trianik_pagenavigation VALUES("263","7288","7312","1700","L","","","","","2015-07-13 10:10:15","1","2015-07-20 17:34:10","1");
INSERT INTO trianik_pagenavigation VALUES("255","1","7304","600","P","Reports","","","","2015-01-11 00:09:58","1","2015-01-11 00:09:58","1");
INSERT INTO trianik_pagenavigation VALUES("256","1","7305","6300","P","","","","","2015-07-02 21:26:32","1","2015-08-27 15:18:59","1");
INSERT INTO trianik_pagenavigation VALUES("257","7305","7306","100","M","","","","","2015-07-03 19:45:00","1","2015-07-03 19:45:00","1");
INSERT INTO trianik_pagenavigation VALUES("258","7288","7307","1200","L","","","","","2015-07-03 19:45:35","1","2015-07-03 19:45:35","1");
INSERT INTO trianik_pagenavigation VALUES("259","7288","7308","1600","L","","","","","2015-07-03 20:12:35","1","2015-07-20 17:34:12","1");
INSERT INTO trianik_pagenavigation VALUES("260","7288","7309","1300","M","","","","","2015-07-06 18:25:32","1","2015-07-06 18:25:36","1");
INSERT INTO trianik_pagenavigation VALUES("261","7305","7310","200","M","","","","","2015-07-06 18:27:17","1","2015-07-06 18:27:17","1");
INSERT INTO trianik_pagenavigation VALUES("262","7305","7311","300","M","","","","","2015-07-06 18:27:46","1","2015-07-06 18:27:46","1");
INSERT INTO trianik_pagenavigation VALUES("264","7288","7313","1500","M","","","","","2015-07-20 17:33:14","1","2015-07-20 17:34:14","1");
INSERT INTO trianik_pagenavigation VALUES("265","7288","7314","1400","M","","","","","2015-07-20 17:34:05","1","2015-07-20 17:34:14","1");
INSERT INTO trianik_pagenavigation VALUES("266","1","7315","6400","L","","","","","2015-08-04 20:37:20","1","2015-08-27 15:18:54","1");
INSERT INTO trianik_pagenavigation VALUES("267","1","7316","5800","P","","","","","2015-08-09 20:09:23","1","2015-08-09 20:10:42","1");
INSERT INTO trianik_pagenavigation VALUES("268","1","7317","6500","P","","","","","2015-08-24 15:51:19","1","2015-08-27 15:18:52","1");
INSERT INTO trianik_pagenavigation VALUES("269","7317","7318","100","M","","","","","2015-08-24 15:53:18","1","2015-08-24 15:53:18","1");
INSERT INTO trianik_pagenavigation VALUES("270","7317","7319","200","L","","","","","2015-08-24 15:53:41","1","2015-08-24 15:53:41","1");
INSERT INTO trianik_pagenavigation VALUES("271","1","7320","6100","P","","","","","2015-08-27 15:14:30","1","2015-08-27 15:19:01","1");
INSERT INTO trianik_pagenavigation VALUES("272","7288","7321","1800","M","","","","","2015-09-01 17:38:55","1","2015-09-01 17:38:55","1");
INSERT INTO trianik_pagenavigation VALUES("273","7316","7322","100","M","","","","","2015-11-05 17:27:47","1","2015-11-05 17:27:47","1");
INSERT INTO trianik_pagenavigation VALUES("274","7316","7323","200","M","","","","","2015-11-05 17:28:05","1","2015-11-05 17:28:05","1");



DROP TABLE trianik_pageroles;

CREATE TABLE `trianik_pageroles` (
  `pageroleid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pageid` int(11) NOT NULL,
  `roleid` varchar(20) NOT NULL,
  `metacreateddate` datetime NOT NULL,
  `metacreateduserid` int(11) NOT NULL,
  `metamodifieddate` datetime NOT NULL,
  `metamodifieduserid` int(11) NOT NULL,
  PRIMARY KEY (`pageroleid`),
  UNIQUE KEY `ix_pageroles` (`pageid`,`roleid`)
) ENGINE=MyISAM AUTO_INCREMENT=1264 DEFAULT CHARSET=latin1;

INSERT INTO trianik_pageroles VALUES("3","3","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("665","11","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("9","13","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("667","100","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1095","7183","USER","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1082","7182","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("21","1509","USER","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1080","7180","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("174","7106","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("161","2000","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("160","14","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("159","10","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1063","7172","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("157","6","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("156","5","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("155","2","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1079","7179","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1064","7173","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1062","7171","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1061","7170","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1110","7202","COMPANY","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1070","7167","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1071","7168","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1073","7169","INSTRUCTOR","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1076","7158","INSTRUCTOR","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1072","7169","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1136","7174","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1067","7175","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1078","7178","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1068","7176","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1069","7177","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("963","4","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("654","7107","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1147","7213","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("669","100","USER","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1084","7184","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("670","130","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("676","1271","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("678","7105","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("656","7107","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1081","7181","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1074","7160","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1050","7161","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1053","7162","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1054","7163","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1055","7164","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1097","7165","USER","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1057","7166","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1085","7185","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("982","7125","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1116","7206","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1115","7205","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1114","7204","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1124","8","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1111","7203","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1107","7201","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1106","7200","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1105","7199","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1104","7198","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1029","7143","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1103","7197","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1102","7196","SCHOOL","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1101","7195","COMPANY","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1033","7147","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1094","7194","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1096","7193","USER","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1092","7192","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1091","7191","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1090","7190","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1089","7189","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1088","7188","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1087","7187","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1086","7186","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1048","7159","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1075","7158","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1129","3000","USER","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1118","7207","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1119","7208","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1120","7209","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1121","7210","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1122","7211","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1123","7212","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1128","1","USER","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1132","7214","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1133","7215","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1134","7216","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1135","7217","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1137","7174","STATEMENTS","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1138","7218","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1139","3010","USER","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1140","7219","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1141","7220","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1142","7221","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1145","7222","TYPIST","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1144","7223","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1146","7222","ADMIN","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1148","7213","STATEMENTS","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1149","7224","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1150","7225","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1151","7226","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1152","7227","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1153","7228","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1154","7229","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1155","7230","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1156","7231","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1157","7232","PUBLIC","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pageroles VALUES("1248","7233","ADMIN","2015-07-06 19:10:05","1","2015-07-06 19:10:05","1");
INSERT INTO trianik_pageroles VALUES("1247","7234","ADMIN","2015-07-06 18:31:46","1","2015-07-06 18:31:46","1");
INSERT INTO trianik_pageroles VALUES("1160","7235","PUBLIC","2014-02-20 18:19:22","1","2014-02-20 18:19:22","1");
INSERT INTO trianik_pageroles VALUES("1161","7236","PUBLIC","2014-03-02 11:04:46","1","2014-03-02 11:04:46","1");
INSERT INTO trianik_pageroles VALUES("1162","7237","PUBLIC","2014-03-13 15:43:57","1","2014-03-13 15:43:57","1");
INSERT INTO trianik_pageroles VALUES("1163","7238","PUBLIC","2014-03-24 10:24:22","1","2014-03-24 10:24:22","1");
INSERT INTO trianik_pageroles VALUES("1164","7239","PUBLIC","2014-09-03 12:48:15","1","2014-09-03 12:48:15","1");
INSERT INTO trianik_pageroles VALUES("1165","7240","PUBLIC","2014-10-09 19:35:09","1","2014-10-09 19:35:09","1");
INSERT INTO trianik_pageroles VALUES("1166","7241","PUBLIC","2014-10-09 19:38:01","1","2014-10-09 19:38:01","1");
INSERT INTO trianik_pageroles VALUES("1167","7242","PUBLIC","2014-10-09 19:42:05","1","2014-10-09 19:42:05","1");
INSERT INTO trianik_pageroles VALUES("1168","7243","PUBLIC","2014-10-09 19:46:32","1","2014-10-09 19:46:32","1");
INSERT INTO trianik_pageroles VALUES("1169","7244","PUBLIC","2014-10-09 19:48:06","1","2014-10-09 19:48:06","1");
INSERT INTO trianik_pageroles VALUES("1170","7245","PUBLIC","2014-10-09 19:49:14","1","2014-10-09 19:49:14","1");
INSERT INTO trianik_pageroles VALUES("1171","7246","PUBLIC","2014-10-09 19:50:11","1","2014-10-09 19:50:11","1");
INSERT INTO trianik_pageroles VALUES("1172","7247","PUBLIC","2014-10-09 19:50:51","1","2014-10-09 19:50:51","1");
INSERT INTO trianik_pageroles VALUES("1173","7248","PUBLIC","2014-10-09 19:51:43","1","2014-10-09 19:51:43","1");
INSERT INTO trianik_pageroles VALUES("1174","7249","PUBLIC","2014-10-09 19:52:46","1","2014-10-09 19:52:46","1");
INSERT INTO trianik_pageroles VALUES("1175","7250","PUBLIC","2014-10-09 19:53:34","1","2014-10-09 19:53:34","1");
INSERT INTO trianik_pageroles VALUES("1176","7251","PUBLIC","2014-10-10 22:34:36","1","2014-10-10 22:34:36","1");
INSERT INTO trianik_pageroles VALUES("1177","7252","PUBLIC","2014-10-11 13:20:04","1","2014-10-11 13:20:04","1");
INSERT INTO trianik_pageroles VALUES("1178","7253","PUBLIC","2014-10-11 13:22:06","1","2014-10-11 13:22:06","1");
INSERT INTO trianik_pageroles VALUES("1179","7254","PUBLIC","2014-10-11 13:22:35","1","2014-10-11 13:22:35","1");
INSERT INTO trianik_pageroles VALUES("1180","7255","PUBLIC","2014-10-11 13:23:27","1","2014-10-11 13:23:27","1");
INSERT INTO trianik_pageroles VALUES("1181","7256","PUBLIC","2014-10-11 13:24:38","1","2014-10-11 13:24:38","1");
INSERT INTO trianik_pageroles VALUES("1182","7257","PUBLIC","2014-10-11 13:25:28","1","2014-10-11 13:25:28","1");
INSERT INTO trianik_pageroles VALUES("1183","7258","PUBLIC","2014-10-11 13:26:16","1","2014-10-11 13:26:16","1");
INSERT INTO trianik_pageroles VALUES("1184","7259","PUBLIC","2014-10-11 14:22:02","1","2014-10-11 14:22:02","1");
INSERT INTO trianik_pageroles VALUES("1185","7260","PUBLIC","2014-10-26 21:29:58","1","2014-10-26 21:29:58","1");
INSERT INTO trianik_pageroles VALUES("1186","7261","PUBLIC","2014-11-30 15:22:04","1","2014-11-30 15:22:04","1");
INSERT INTO trianik_pageroles VALUES("1187","7262","PUBLIC","2014-12-07 18:44:25","1","2014-12-07 18:44:25","1");
INSERT INTO trianik_pageroles VALUES("1188","7263","PUBLIC","2014-12-07 19:04:33","1","2014-12-07 19:04:33","1");
INSERT INTO trianik_pageroles VALUES("1189","7264","PUBLIC","2014-12-07 19:13:02","1","2014-12-07 19:13:02","1");
INSERT INTO trianik_pageroles VALUES("1190","7265","PUBLIC","2014-12-09 20:13:19","1","2014-12-09 20:13:19","1");
INSERT INTO trianik_pageroles VALUES("1191","7266","PUBLIC","2014-12-18 14:12:18","1","2014-12-18 14:12:18","1");
INSERT INTO trianik_pageroles VALUES("1192","7267","PUBLIC","2014-12-18 15:42:25","1","2014-12-18 15:42:25","1");
INSERT INTO trianik_pageroles VALUES("1193","7268","PUBLIC","2014-12-19 12:13:51","1","2014-12-19 12:13:51","1");
INSERT INTO trianik_pageroles VALUES("1194","7269","PUBLIC","2014-12-19 12:14:29","1","2014-12-19 12:14:29","1");
INSERT INTO trianik_pageroles VALUES("1195","7270","PUBLIC","2014-12-19 12:17:00","1","2014-12-19 12:17:00","1");
INSERT INTO trianik_pageroles VALUES("1196","7271","PUBLIC","2014-12-19 12:19:12","1","2014-12-19 12:19:12","1");
INSERT INTO trianik_pageroles VALUES("1197","7272","PUBLIC","2014-12-19 12:19:30","1","2014-12-19 12:19:30","1");
INSERT INTO trianik_pageroles VALUES("1198","7273","PUBLIC","2014-12-21 13:20:56","1","2014-12-21 13:20:56","1");
INSERT INTO trianik_pageroles VALUES("1199","7274","PUBLIC","2014-12-21 20:55:13","1","2014-12-21 20:55:13","1");
INSERT INTO trianik_pageroles VALUES("1200","7275","PUBLIC","2014-12-21 20:55:42","1","2014-12-21 20:55:42","1");
INSERT INTO trianik_pageroles VALUES("1201","7276","PUBLIC","2014-12-21 21:36:55","1","2014-12-21 21:36:55","1");
INSERT INTO trianik_pageroles VALUES("1202","7277","PUBLIC","2014-12-21 21:39:17","1","2014-12-21 21:39:17","1");
INSERT INTO trianik_pageroles VALUES("1203","7278","PUBLIC","2014-12-21 21:39:46","1","2014-12-21 21:39:46","1");
INSERT INTO trianik_pageroles VALUES("1204","7279","PUBLIC","2014-12-22 22:08:35","1","2014-12-22 22:08:35","1");
INSERT INTO trianik_pageroles VALUES("1232","7280","ADMIN","2015-07-02 19:27:54","1","2015-07-02 19:27:54","1");
INSERT INTO trianik_pageroles VALUES("1206","7281","PUBLIC","2014-12-22 22:14:49","1","2014-12-22 22:14:49","1");
INSERT INTO trianik_pageroles VALUES("1207","7282","PUBLIC","2014-12-22 22:15:02","1","2014-12-22 22:15:02","1");
INSERT INTO trianik_pageroles VALUES("1208","7283","PUBLIC","2014-12-22 22:15:30","1","2014-12-22 22:15:30","1");
INSERT INTO trianik_pageroles VALUES("1209","7284","PUBLIC","2014-12-22 22:19:19","1","2014-12-22 22:19:19","1");
INSERT INTO trianik_pageroles VALUES("1210","7285","PUBLIC","2014-12-22 22:20:53","1","2014-12-22 22:20:53","1");
INSERT INTO trianik_pageroles VALUES("1211","7286","PUBLIC","2014-12-22 22:21:41","1","2014-12-22 22:21:41","1");
INSERT INTO trianik_pageroles VALUES("1212","7287","PUBLIC","2014-12-22 22:22:37","1","2014-12-22 22:22:37","1");
INSERT INTO trianik_pageroles VALUES("1213","7288","PUBLIC","2014-12-23 19:46:42","1","2014-12-23 19:46:42","1");
INSERT INTO trianik_pageroles VALUES("1214","7289","PUBLIC","2015-01-02 12:57:48","1","2015-01-02 12:57:48","1");
INSERT INTO trianik_pageroles VALUES("1215","7290","PUBLIC","2015-01-02 12:58:00","1","2015-01-02 12:58:00","1");
INSERT INTO trianik_pageroles VALUES("1216","7291","PUBLIC","2015-01-10 21:56:37","1","2015-01-10 21:56:37","1");
INSERT INTO trianik_pageroles VALUES("1217","7292","PUBLIC","2015-01-11 00:09:58","1","2015-01-11 00:09:58","1");
INSERT INTO trianik_pageroles VALUES("1218","7293","PUBLIC","2015-01-22 19:05:10","1","2015-01-22 19:05:10","1");
INSERT INTO trianik_pageroles VALUES("1219","7294","PUBLIC","2015-06-09 21:11:50","1","2015-06-09 21:11:50","1");
INSERT INTO trianik_pageroles VALUES("1220","7295","PUBLIC","2015-06-11 18:33:01","1","2015-06-11 18:33:01","1");
INSERT INTO trianik_pageroles VALUES("1221","7296","PUBLIC","2015-06-12 16:26:13","1","2015-06-12 16:26:13","1");
INSERT INTO trianik_pageroles VALUES("1222","7297","PUBLIC","2015-06-12 18:37:09","1","2015-06-12 18:37:09","1");
INSERT INTO trianik_pageroles VALUES("1223","7298","PUBLIC","2015-06-13 16:05:20","1","2015-06-13 16:05:20","1");
INSERT INTO trianik_pageroles VALUES("1224","7299","PUBLIC","2015-06-15 19:31:40","1","2015-06-15 19:31:40","1");
INSERT INTO trianik_pageroles VALUES("1225","7300","PUBLIC","2015-06-15 19:31:59","1","2015-06-15 19:31:59","1");
INSERT INTO trianik_pageroles VALUES("1226","7301","PUBLIC","2015-06-15 21:25:51","1","2015-06-15 21:25:51","1");
INSERT INTO trianik_pageroles VALUES("1227","7302","PUBLIC","2015-06-15 21:26:08","1","2015-06-15 21:26:08","1");
INSERT INTO trianik_pageroles VALUES("1228","7303","PUBLIC","2015-06-28 16:00:14","1","2015-06-28 16:00:14","1");
INSERT INTO trianik_pageroles VALUES("1246","7305","ADMIN","2015-07-06 18:29:42","1","2015-07-06 18:29:42","1");
INSERT INTO trianik_pageroles VALUES("1233","7304","TEAM","2015-07-02 19:28:31","1","2015-07-02 19:28:31","1");
INSERT INTO trianik_pageroles VALUES("1242","7306","ADMIN","2015-07-06 18:27:24","1","2015-07-06 18:27:24","1");
INSERT INTO trianik_pageroles VALUES("1236","7307","PUBLIC","2015-07-03 19:45:35","1","2015-07-03 19:45:35","1");
INSERT INTO trianik_pageroles VALUES("1249","7308","ADMIN","2015-07-12 18:54:10","1","2015-07-12 18:54:10","1");
INSERT INTO trianik_pageroles VALUES("1239","7309","TEAM","2015-07-06 18:25:51","1","2015-07-06 18:25:51","1");
INSERT INTO trianik_pageroles VALUES("1244","7310","ADMIN","2015-07-06 18:27:57","1","2015-07-06 18:27:57","1");
INSERT INTO trianik_pageroles VALUES("1245","7311","ADMIN","2015-07-06 18:28:05","1","2015-07-06 18:28:05","1");
INSERT INTO trianik_pageroles VALUES("1250","7308","TEAM","2015-07-12 18:54:10","1","2015-07-12 18:54:10","1");
INSERT INTO trianik_pageroles VALUES("1251","7312","PUBLIC","2015-07-13 10:10:15","1","2015-07-13 10:10:15","1");
INSERT INTO trianik_pageroles VALUES("1252","7313","PUBLIC","2015-07-20 17:33:14","1","2015-07-20 17:33:14","1");
INSERT INTO trianik_pageroles VALUES("1253","7314","PUBLIC","2015-07-20 17:34:05","1","2015-07-20 17:34:05","1");
INSERT INTO trianik_pageroles VALUES("1254","7315","PUBLIC","2015-08-04 20:37:20","1","2015-08-04 20:37:20","1");
INSERT INTO trianik_pageroles VALUES("1255","7316","PUBLIC","2015-08-09 20:09:23","1","2015-08-09 20:09:23","1");
INSERT INTO trianik_pageroles VALUES("1256","7317","PUBLIC","2015-08-24 15:51:19","1","2015-08-24 15:51:19","1");
INSERT INTO trianik_pageroles VALUES("1257","7318","PUBLIC","2015-08-24 15:53:18","1","2015-08-24 15:53:18","1");
INSERT INTO trianik_pageroles VALUES("1258","7319","PUBLIC","2015-08-24 15:53:41","1","2015-08-24 15:53:41","1");
INSERT INTO trianik_pageroles VALUES("1259","7320","PUBLIC","2015-08-27 15:14:30","1","2015-08-27 15:14:30","1");
INSERT INTO trianik_pageroles VALUES("1261","7321","ADMIN","2015-09-01 17:39:02","1","2015-09-01 17:39:02","1");
INSERT INTO trianik_pageroles VALUES("1262","7322","PUBLIC","2015-11-05 17:27:47","1","2015-11-05 17:27:47","1");
INSERT INTO trianik_pageroles VALUES("1263","7323","PUBLIC","2015-11-05 17:28:05","1","2015-11-05 17:28:05","1");



DROP TABLE trianik_pages;

CREATE TABLE `trianik_pages` (
  `pageid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pagename` varchar(50) DEFAULT NULL,
  `label` varchar(100) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  `content` text,
  `metacreateddate` datetime NOT NULL,
  `metacreateduserid` int(11) NOT NULL,
  `metamodifieddate` datetime NOT NULL,
  `metamodifieduserid` int(11) NOT NULL,
  PRIMARY KEY (`pageid`),
  UNIQUE KEY `ix_page` (`pagename`)
) ENGINE=MyISAM AUTO_INCREMENT=7324 DEFAULT CHARSET=latin1;

INSERT INTO trianik_pages VALUES("1","index.php","Home","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("2","system-access-denied.php","Access Denied","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("3","system-admin.php","Admin","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("5","system-login-timeout.php","Session Timeout","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("6","system-login-failed.php","Login Failed","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("8","system-register.php","Register","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("10","system-register-success.php","Register Success","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("11","system-admin-roles.php","Manage Roles","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("13","system-register-exec.php","Register Save","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("14","system-imageviewer.php","Image Viewer","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("100","profile.php","Edit Profile","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("130","users.php","Manage Users","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("2000","system-login.php","Account log in","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("1271","siteconfig.php","Site Configuration","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("1508","passwordchanged.php","Changed Password","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("1509","system-register-amend.php","User Amendment","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("7105","managepages.php","Manage Pages","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("3010","documents.php","Documents","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("7106","manageactions.php","Manage Actions","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("4","manageerrors.php","System Errors","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("7125","messages.php","Messages","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("7143","managegrids.php","Manage Grids","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("7165","manageterms.php","Manage Terms","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("7147","runalerts.php","Alert Schedule","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("7239","reportbookings.php","Report Bookings","P",0x,"2014-09-03 12:48:15","1","2014-09-03 12:48:15","1");
INSERT INTO trianik_pages VALUES("7302","system-client-exec.php","Select Client Exel","P",0x,"2015-06-15 21:26:08","1","2015-06-15 21:26:08","1");
INSERT INTO trianik_pages VALUES("7158","managevehicles.php","Manage Vehicles","P",0x,"0000-00-00 00:00:00","0","2014-05-13 17:27:50","1");
INSERT INTO trianik_pages VALUES("7181","instructors.php","Instructors","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("7182","students.php","Students","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("7216","recalculateconfirm.php","Recalculate Price","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("7215","recalculateprice.php","Recalculate Price","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("7214","manageinvoiceitemtemplates.php","Invoice Items","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("7210","managedrivers.php","Manage Drivers","P",0x,"0000-00-00 00:00:00","0","2014-05-13 17:28:43","1");
INSERT INTO trianik_pages VALUES("7197","companymembers.php","Company Members","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("7199","schoolmembers.php","School Members","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("7200","schoolsubgroups.php","School Sub Groups","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("7201","managecompanysubgroups.php","Manage Sub Groups","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("7204","messageview.php","Message View","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("7205","messagecompose.php","Message Compose","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("7206","messageforward.php","MessageForward","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("7176","managebookings.php","All Bookings","P",0x,"0000-00-00 00:00:00","0","2014-12-21 11:35:18","1");
INSERT INTO trianik_pages VALUES("7217","editinvoices.php","View / Edit Invoices","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("7223","invoiceupload.php","Invoice Upload","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("7230","trackingreport.php","Tracking Report","P",0x,"0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_pages VALUES("7232","managetrailers.php","Manage Trailers","P",0x,"0000-00-00 00:00:00","0","2014-05-13 17:28:10","1");
INSERT INTO trianik_pages VALUES("7320","absences.php","Absences","P",0x,"2015-08-27 15:14:30","1","2015-08-27 15:14:30","1");
INSERT INTO trianik_pages VALUES("7234","runsql.php","Run SQL","P",0x,"2014-02-20 15:20:59","1","2014-02-20 15:20:59","1");
INSERT INTO trianik_pages VALUES("7282","manageproducts.php","Manage Products","P",0x,"2014-12-22 22:15:02","1","2014-12-22 22:15:02","1");
INSERT INTO trianik_pages VALUES("7242","raiseholidayrequest.php","Raise Holiday Requests","P",0x,"2014-10-09 19:42:05","1","2014-10-09 19:42:05","1");
INSERT INTO trianik_pages VALUES("7243","pendingholidays.php","Pending Holiday Requests","P",0x,"2014-10-09 19:46:32","1","2014-10-09 19:46:32","1");
INSERT INTO trianik_pages VALUES("7244","managebankholidays.php","Manage Bank Holidays","P",0x,"2014-10-09 19:48:06","1","2014-10-09 19:48:06","1");
INSERT INTO trianik_pages VALUES("7245","holidayexceptionreport.php","Holiday Exception Report","P",0x,"2014-10-09 19:49:14","1","2014-10-09 19:49:14","1");
INSERT INTO trianik_pages VALUES("7246","viewallholidays.php","View All Holidays","P",0x,"2014-10-09 19:50:11","1","2014-10-09 19:50:11","1");
INSERT INTO trianik_pages VALUES("7247","viewallholidaystaken.php","View All Holidays Taken","P",0x,"2014-10-09 19:50:51","1","2014-10-09 19:50:51","1");
INSERT INTO trianik_pages VALUES("7248","rejectedholidays.php","View All Rejected Holidays","P",0x,"2014-10-09 19:51:43","1","2014-10-09 19:51:43","1");
INSERT INTO trianik_pages VALUES("7249","pendingholidayscalendar.php","Pending Holidays Calendar","P",0x,"2014-10-09 19:52:46","1","2014-10-09 19:53:40","1");
INSERT INTO trianik_pages VALUES("7250","acceptedholidayscalendar.php","Accepted Holidays Calendar","P",0x,"2014-10-09 19:53:34","1","2014-10-09 19:53:34","1");
INSERT INTO trianik_pages VALUES("7251","holidayconfirm.php","Raise Holiday Requests","P",0x,"2014-10-10 22:34:36","1","2014-10-10 22:39:57","1");
INSERT INTO trianik_pages VALUES("7252","raiseabsencerequest.php","Raise Absence Request","P",0x,"2014-10-11 13:20:04","1","2014-10-11 13:20:04","1");
INSERT INTO trianik_pages VALUES("7253","pendingabsences.php","Pending Absences","P",0x,"2014-10-11 13:22:06","1","2014-10-11 13:22:06","1");
INSERT INTO trianik_pages VALUES("7254","viewabsences.php","View Absences","P",0x,"2014-10-11 13:22:35","1","2014-10-11 13:22:35","1");
INSERT INTO trianik_pages VALUES("7255","viewsickness.php","View Sickness","P",0x,"2014-10-11 13:23:27","1","2014-10-11 13:23:27","1");
INSERT INTO trianik_pages VALUES("7256","pendingabsencescalendar.php","Pending Absences Calendar","P",0x,"2014-10-11 13:24:38","1","2014-10-11 13:24:38","1");
INSERT INTO trianik_pages VALUES("7257","acceptedabsencescalendar.php","Accepted Absences Calendar","P",0x,"2014-10-11 13:25:28","1","2014-10-11 13:25:28","1");
INSERT INTO trianik_pages VALUES("7258","absenceconfirm.php","Raise Absence Request","P",0x,"2014-10-11 13:26:16","1","2014-10-11 13:26:16","1");
INSERT INTO trianik_pages VALUES("7259","allocatejobs.php","Jobs Awaiting Allocation","P",0x,"2014-10-11 14:22:02","1","2014-12-18 15:41:44","1");
INSERT INTO trianik_pages VALUES("7260","managebookinglegs.php","Manage Booking Legs","P",0x,"2014-10-26 21:29:58","1","2014-10-26 21:29:58","1");
INSERT INTO trianik_pages VALUES("7261","managevehicletypes.php","Manage Vehicle Types","P",0x,"2014-11-30 15:22:04","1","2014-11-30 15:22:04","1");
INSERT INTO trianik_pages VALUES("7262","managetaxcodes.php","Manage Tax Codes","P",0x,"2014-12-07 18:44:25","1","2014-12-07 18:44:25","1");
INSERT INTO trianik_pages VALUES("7263","manageaccountstatus.php","Manage Account Status","P",0x,"2014-12-07 19:04:33","1","2014-12-07 19:04:33","1");
INSERT INTO trianik_pages VALUES("7264","manageratecodes.php","Manage Rate Codes","P",0x,"2014-12-07 19:13:02","1","2014-12-07 19:13:02","1");
INSERT INTO trianik_pages VALUES("7265","manageloadtypes.php","Manage Load Types","P",0x,"2014-12-09 20:13:19","1","2014-12-09 20:13:19","1");
INSERT INTO trianik_pages VALUES("7266","managebookingstatus.php","Manage Booking Status","P",0x,"2014-12-18 14:12:18","1","2014-12-18 14:12:18","1");
INSERT INTO trianik_pages VALUES("7267","jobsawaitingdrivernotification.php","Jobs Awaiting Driver Notification","P",0x,"2014-12-18 15:42:25","1","2014-12-18 15:42:25","1");
INSERT INTO trianik_pages VALUES("7268","jobsawaitingdriverconfirmation.php","Jobs Awaiting Progress Confirmation","P",0x,"2014-12-19 12:13:51","1","2014-12-19 12:13:51","1");
INSERT INTO trianik_pages VALUES("7269","jobsawaitingcompletion.php","Jobs In Progress","P",0x,"2014-12-19 12:14:29","1","2014-12-19 12:18:14","1");
INSERT INTO trianik_pages VALUES("7270","completedjobs.php","Completed Jobs","P",0x,"2014-12-19 12:17:00","1","2014-12-19 12:17:00","1");
INSERT INTO trianik_pages VALUES("7271","invoicedjobs.php","Invoiced Jobs","P",0x,"2014-12-19 12:19:12","1","2014-12-19 12:25:41","1");
INSERT INTO trianik_pages VALUES("7272","failedjobs.php","Failed Jobs","P",0x,"2014-12-19 12:19:30","1","2014-12-19 12:19:30","1");
INSERT INTO trianik_pages VALUES("7273","manageworktypes.php","Manage Work Types","P",0x,"2014-12-21 13:20:56","1","2014-12-21 13:20:56","1");
INSERT INTO trianik_pages VALUES("7274","managevehicleunavailabilitycode.php","Manage Vehicle Unavailability Codes","P",0x,"2014-12-21 20:55:13","1","2014-12-21 20:55:13","1");
INSERT INTO trianik_pages VALUES("7275","managetrailerunavailabilitycode.php","Manage Trailer Unavailability Codes","P",0x,"2014-12-21 20:55:42","1","2014-12-21 20:55:42","1");
INSERT INTO trianik_pages VALUES("7281","importproducts.php","Import Products","P",0x,"2014-12-22 22:14:49","1","2014-12-22 22:14:49","1");
INSERT INTO trianik_pages VALUES("7277","vehicleunavailability.php","Vehicle Unavailability","P",0x,"2014-12-21 21:39:17","1","2014-12-21 21:39:17","1");
INSERT INTO trianik_pages VALUES("7278","trailerunavailability.php","Trailer Unavailability","P",0x,"2014-12-21 21:39:46","1","2014-12-21 21:39:46","1");
INSERT INTO trianik_pages VALUES("7280","clients.php","Clients","P",0x,"2014-12-22 22:08:51","1","2015-07-15 21:23:28","1");
INSERT INTO trianik_pages VALUES("7316","holidays.php","Holidays","P",0x,"2015-08-09 20:09:23","1","2015-08-09 20:09:23","1");
INSERT INTO trianik_pages VALUES("7288","scheduleplanner.php","Schedule Planner","P",0x,"2014-12-23 19:46:42","1","2015-07-20 17:28:16","1");
INSERT INTO trianik_pages VALUES("7301","system-client.php","Select Client","P",0x,"2015-06-15 21:25:51","1","2015-06-15 21:25:51","1");
INSERT INTO trianik_pages VALUES("7299","clientschedule.php","Client Schedule","P",0x,"2015-06-15 19:31:40","1","2015-07-20 18:16:45","1");
INSERT INTO trianik_pages VALUES("7314","clientplanner.php","Client Planner","P",0x,"2015-07-20 17:34:05","1","2015-07-20 17:34:05","1");
INSERT INTO trianik_pages VALUES("7297","m.system-login.php","System Login (Mobile)","P",0x,"2015-06-12 18:37:09","1","2015-06-12 18:37:09","1");
INSERT INTO trianik_pages VALUES("7306","refereereport.php","Referee Average Report","P",0x,"2015-07-03 19:45:00","1","2015-07-03 19:45:00","1");
INSERT INTO trianik_pages VALUES("7315","userrota.php","Manage User Rota","P",0x,"2015-08-04 20:37:20","1","2015-08-04 20:37:20","1");
INSERT INTO trianik_pages VALUES("7308","clientplannerdetails.php","Client Planner Print","P",0x,"2015-07-03 20:12:35","1","2015-08-16 21:54:42","1");
INSERT INTO trianik_pages VALUES("7313","myplanner.php","My Planner","P",0x,"2015-07-20 17:33:14","1","2015-07-20 17:33:14","1");
INSERT INTO trianik_pages VALUES("7310","importreferees.php","Import Referees","P",0x,"2015-07-06 18:27:17","1","2015-07-06 18:27:17","1");
INSERT INTO trianik_pages VALUES("7311","referees.php","Manage Referees","P",0x,"2015-07-06 18:27:46","1","2015-07-06 18:27:46","1");
INSERT INTO trianik_pages VALUES("7317","reports.php","Reports","P",0x,"2015-08-24 15:51:19","1","2015-08-24 15:51:19","1");
INSERT INTO trianik_pages VALUES("7318","reporthoursworked.php","Report Hours Worked - Monthly","P",0x,"2015-08-24 15:53:18","1","2015-08-24 15:53:18","1");
INSERT INTO trianik_pages VALUES("7319","reporthoursworkedlib.php","Report Hours Worked - Monthly (Lib)","P",0x,"2015-08-24 15:53:41","1","2015-08-24 15:53:41","1");
INSERT INTO trianik_pages VALUES("7321","diaryevents.php","Diary Events","P",0x,"2015-09-01 17:38:55","1","2015-09-01 17:38:55","1");
INSERT INTO trianik_pages VALUES("7322","manageholidays.php","Manage Holidays","P",0x,"2015-11-05 17:27:47","1","2015-11-05 17:27:47","1");
INSERT INTO trianik_pages VALUES("7323","managestatholidays.php","Manage Statutory Holidays","P",0x,"2015-11-05 17:28:05","1","2015-11-05 17:28:05","1");



DROP TABLE trianik_roles;

CREATE TABLE `trianik_roles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `roleid` varchar(20) DEFAULT '',
  `systemrole` varchar(1) DEFAULT NULL,
  `metacreateddate` datetime NOT NULL,
  `metacreateduserid` int(11) NOT NULL,
  `metamodifieddate` datetime NOT NULL,
  `metamodifieduserid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

INSERT INTO trianik_roles VALUES("1","PUBLIC","Y","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_roles VALUES("2","ADMIN","N","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_roles VALUES("3","USER","Y","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_roles VALUES("48","UNAUTHENTICATED","N","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_roles VALUES("52","TEAM","N","2015-07-02 19:27:17","1","2015-07-02 19:27:17","1");



DROP TABLE trianik_siteconfig;

CREATE TABLE `trianik_siteconfig` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `domainurl` varchar(60) DEFAULT NULL,
  `address` text,
  `bookingprefix` varchar(5) DEFAULT NULL,
  `invoiceprefix` varchar(5) DEFAULT NULL,
  `productcodeprefix` varchar(5) DEFAULT NULL,
  `productgroupprefix` varchar(5) DEFAULT NULL,
  `refereereportemail` varchar(70) DEFAULT NULL,
  `emailfooter` text,
  `lastschedulerun` date DEFAULT NULL,
  `runscheduledays` int(11) DEFAULT NULL,
  `vatrate` decimal(10,2) DEFAULT NULL,
  `metacreateddate` datetime NOT NULL,
  `metacreateduserid` int(11) NOT NULL,
  `metamodifieddate` datetime NOT NULL,
  `metamodifieduserid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO trianik_siteconfig VALUES("1","http://localhost/trianik",0x556e69742031330d0a4c696e636f6c6e205061726b0d0a4c696e636f6c6e20526f61640d0a48696768205779636f6d62650d0a4275636b696e6768616d73686972650d0a4850313220335244,"ORD-","INV-","PC-","PG-","",0x3c703e526567617264732c3c6272202f3e5468652046413c2f703e,"2016-07-28","1","20.00","0000-00-00 00:00:00","0","2016-07-28 11:12:38","1");



DROP TABLE trianik_userroles;

CREATE TABLE `trianik_userroles` (
  `userroleid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` varchar(20) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `metacreateddate` datetime NOT NULL,
  `metacreateduserid` int(11) NOT NULL,
  `metamodifieddate` datetime NOT NULL,
  `metamodifieduserid` int(11) NOT NULL,
  PRIMARY KEY (`userroleid`),
  UNIQUE KEY `ix_userroles` (`roleid`,`memberid`)
) ENGINE=MyISAM AUTO_INCREMENT=1734 DEFAULT CHARSET=latin1;

INSERT INTO trianik_userroles VALUES("1","PUBLIC","1","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1623","USER","228","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1624","INSTRUCTOR","228","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1622","PUBLIC","228","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1594","USER","219","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1619","PUBLIC","227","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1620","USER","227","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1596","USER","220","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1600","INSTRUCTOR","220","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1601","INSTRUCTOR","216","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1602","INSTRUCTOR","1","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1603","STUDENT","216","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1604","PUBLIC","221","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1605","USER","221","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1606","INSTRUCTOR","221","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1607","PUBLIC","222","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1608","USER","222","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1609","INSTRUCTOR","222","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1610","PUBLIC","223","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1611","USER","223","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1612","INSTRUCTOR","223","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1613","PUBLIC","224","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1614","USER","224","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1615","PUBLIC","225","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1616","USER","225","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1617","PUBLIC","226","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1618","USER","226","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("345","ADMIN","1","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1625","SCHOOL","220","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1627","COMPANY","220","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1628","COMPANY","1","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1629","PUBLIC","229","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1630","USER","229","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1631","COMPANY","229","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1632","INSTRUCTOR","229","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1633","PUBLIC","230","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1634","USER","230","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1635","COMPANY","230","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1636","INSTRUCTOR","230","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1637","PUBLIC","231","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1638","USER","231","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1639","COMPANY","231","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1640","INSTRUCTOR","231","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1641","PUBLIC","232","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1642","USER","232","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1643","COMPANY","232","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1644","INSTRUCTOR","232","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1645","PUBLIC","233","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1646","USER","233","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1647","COMPANY","233","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1648","INSTRUCTOR","233","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1592","PUBLIC","216","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1593","PUBLIC","219","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1595","PUBLIC","220","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1621","INSTRUCTOR","227","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1480","USER","1","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1590","USER","216","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1651","PUBLIC","234","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1657","TYPIST","234","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1656","TYPIST","225","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1655","TYPIST","220","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1658","TYPIST","1","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1677","OFFICE","221","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1665","TYPIST","235","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1664","PUBLIC","235","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1676","OFFICE","224","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1678","OFFICE","231","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1679","OFFICE","232","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1680","OFFICE","220","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1681","OFFICE","1","0000-00-00 00:00:00","0","0000-00-00 00:00:00","0");
INSERT INTO trianik_userroles VALUES("1682","PUBLIC","236","2015-06-09 18:12:56","1","2015-06-09 18:12:56","1");
INSERT INTO trianik_userroles VALUES("1683","USER","236","2015-06-09 18:12:56","1","2015-06-09 18:12:56","1");
INSERT INTO trianik_userroles VALUES("1684","A","236","2015-06-09 18:12:56","1","2015-06-09 18:12:56","1");
INSERT INTO trianik_userroles VALUES("1685","PUBLIC","237","2015-06-09 18:17:39","1","2015-06-09 18:17:39","1");
INSERT INTO trianik_userroles VALUES("1686","USER","237","2015-06-09 18:17:39","1","2015-06-09 18:17:39","1");
INSERT INTO trianik_userroles VALUES("1687","PUBLIC","238","2015-07-02 19:33:14","1","2015-07-02 19:33:14","1");
INSERT INTO trianik_userroles VALUES("1688","USER","238","2015-07-02 19:33:14","1","2015-07-02 19:33:14","1");
INSERT INTO trianik_userroles VALUES("1689","TEAM","238","2015-07-02 19:33:14","1","2015-07-02 19:33:14","1");
INSERT INTO trianik_userroles VALUES("1690","PUBLIC","239","2015-07-20 19:35:51","1","2015-07-20 19:35:51","1");
INSERT INTO trianik_userroles VALUES("1691","USER","239","2015-07-20 19:35:51","1","2015-07-20 19:35:51","1");
INSERT INTO trianik_userroles VALUES("1692","PUBLIC","240","2015-07-20 19:36:24","1","2015-07-20 19:36:24","1");
INSERT INTO trianik_userroles VALUES("1693","USER","240","2015-07-20 19:36:24","1","2015-07-20 19:36:24","1");
INSERT INTO trianik_userroles VALUES("1694","PUBLIC","241","2015-07-20 19:37:07","1","2015-07-20 19:37:07","1");
INSERT INTO trianik_userroles VALUES("1695","USER","241","2015-07-20 19:37:07","1","2015-07-20 19:37:07","1");
INSERT INTO trianik_userroles VALUES("1696","PUBLIC","242","2015-08-21 14:54:50","1","2015-08-21 14:54:50","1");
INSERT INTO trianik_userroles VALUES("1697","USER","242","2015-08-21 14:54:50","1","2015-08-21 14:54:50","1");
INSERT INTO trianik_userroles VALUES("1698","PUBLIC","243","2015-08-21 15:03:05","1","2015-08-21 15:03:05","1");
INSERT INTO trianik_userroles VALUES("1699","USER","243","2015-08-21 15:03:05","1","2015-08-21 15:03:05","1");
INSERT INTO trianik_userroles VALUES("1700","PUBLIC","244","2015-08-21 18:23:20","1","2015-08-21 18:23:20","1");
INSERT INTO trianik_userroles VALUES("1701","USER","244","2015-08-21 18:23:20","1","2015-08-21 18:23:20","1");
INSERT INTO trianik_userroles VALUES("1702","PUBLIC","245","2015-08-26 10:40:39","1","2015-08-26 10:40:39","1");
INSERT INTO trianik_userroles VALUES("1703","USER","245","2015-08-26 10:40:39","1","2015-08-26 10:40:39","1");
INSERT INTO trianik_userroles VALUES("1704","PUBLIC","246","2015-08-26 10:43:43","1","2015-08-26 10:43:43","1");
INSERT INTO trianik_userroles VALUES("1705","USER","246","2015-08-26 10:43:43","1","2015-08-26 10:43:43","1");
INSERT INTO trianik_userroles VALUES("1706","PUBLIC","247","2015-08-27 07:31:44","1","2015-08-27 07:31:44","1");
INSERT INTO trianik_userroles VALUES("1707","USER","247","2015-08-27 07:31:44","1","2015-08-27 07:31:44","1");
INSERT INTO trianik_userroles VALUES("1708","PUBLIC","248","2015-08-27 07:36:31","1","2015-08-27 07:36:31","1");
INSERT INTO trianik_userroles VALUES("1709","USER","248","2015-08-27 07:36:31","1","2015-08-27 07:36:31","1");
INSERT INTO trianik_userroles VALUES("1710","PUBLIC","249","2015-08-27 07:38:43","1","2015-08-27 07:38:43","1");
INSERT INTO trianik_userroles VALUES("1711","USER","249","2015-08-27 07:38:43","1","2015-08-27 07:38:43","1");
INSERT INTO trianik_userroles VALUES("1712","PUBLIC","250","2015-08-27 07:40:07","1","2015-08-27 07:40:07","1");
INSERT INTO trianik_userroles VALUES("1713","USER","250","2015-08-27 07:40:07","1","2015-08-27 07:40:07","1");
INSERT INTO trianik_userroles VALUES("1714","PUBLIC","251","2015-08-27 07:41:04","1","2015-08-27 07:41:04","1");
INSERT INTO trianik_userroles VALUES("1715","USER","251","2015-08-27 07:41:04","1","2015-08-27 07:41:04","1");
INSERT INTO trianik_userroles VALUES("1716","PUBLIC","252","2015-08-27 07:42:10","1","2015-08-27 07:42:10","1");
INSERT INTO trianik_userroles VALUES("1717","USER","252","2015-08-27 07:42:10","1","2015-08-27 07:42:10","1");
INSERT INTO trianik_userroles VALUES("1718","PUBLIC","253","2015-08-27 07:44:06","1","2015-08-27 07:44:06","1");
INSERT INTO trianik_userroles VALUES("1719","USER","253","2015-08-27 07:44:06","1","2015-08-27 07:44:06","1");
INSERT INTO trianik_userroles VALUES("1720","PUBLIC","254","2015-08-27 07:45:13","1","2015-08-27 07:45:13","1");
INSERT INTO trianik_userroles VALUES("1721","USER","254","2015-08-27 07:45:13","1","2015-08-27 07:45:13","1");
INSERT INTO trianik_userroles VALUES("1722","PUBLIC","255","2015-08-27 07:46:17","1","2015-08-27 07:46:17","1");
INSERT INTO trianik_userroles VALUES("1723","USER","255","2015-08-27 07:46:17","1","2015-08-27 07:46:17","1");
INSERT INTO trianik_userroles VALUES("1724","PUBLIC","256","2015-08-27 07:47:17","1","2015-08-27 07:47:17","1");
INSERT INTO trianik_userroles VALUES("1725","USER","256","2015-08-27 07:47:17","1","2015-08-27 07:47:17","1");
INSERT INTO trianik_userroles VALUES("1726","PUBLIC","257","2015-08-27 07:48:43","1","2015-08-27 07:48:43","1");
INSERT INTO trianik_userroles VALUES("1727","USER","257","2015-08-27 07:48:43","1","2015-08-27 07:48:43","1");
INSERT INTO trianik_userroles VALUES("1728","PUBLIC","258","2015-08-27 07:50:00","1","2015-08-27 07:50:00","1");
INSERT INTO trianik_userroles VALUES("1729","USER","258","2015-08-27 07:50:00","1","2015-08-27 07:50:00","1");
INSERT INTO trianik_userroles VALUES("1730","PUBLIC","259","2015-08-27 07:52:01","1","2015-08-27 07:52:01","1");
INSERT INTO trianik_userroles VALUES("1731","USER","259","2015-08-27 07:52:01","1","2015-08-27 07:52:01","1");
INSERT INTO trianik_userroles VALUES("1732","PUBLIC","260","2015-08-27 07:53:29","1","2015-08-27 07:53:29","1");
INSERT INTO trianik_userroles VALUES("1733","USER","260","2015-08-27 07:53:29","1","2015-08-27 07:53:29","1");



