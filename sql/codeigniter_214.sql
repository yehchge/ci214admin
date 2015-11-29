-- --------------------------------------------------------
-- 主機:                           localhost
-- 服務器版本:                        5.5.15 - MySQL Community Server (GPL)
-- 服務器操作系統:                      Win32
-- HeidiSQL 版本:                  8.3.0.4775
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 導出 codeigniter_214 的資料庫結構
CREATE DATABASE IF NOT EXISTS `codeigniter_214` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `codeigniter_214`;


-- 導出  表 codeigniter_214.comments 結構
CREATE TABLE IF NOT EXISTS `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned DEFAULT NULL,
  `body` text,
  `author` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- 正在導出表  codeigniter_214.comments 的資料：11 rows
DELETE FROM `comments`;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` (`id`, `entry_id`, `body`, `author`) VALUES
	(1, 1, 'bmhghfj', 'gfhj'),
	(2, 1, 'My first Comment', 'bill'),
	(3, 1, 'sdfklaasduif', 'yang'),
	(4, 1, 'Third comments ', ' jeromte'),
	(5, 2, 'The comment for a entry !!', 'David Jerk'),
	(6, 2, 'dafsdasf', 'asda'),
	(7, 2, 'sdafdfasd', 'asdfasdf'),
	(8, 2, 'czgsdfgsdfg', 'adsfasdf'),
	(9, 1, 'fasdfasdf', 'fqwefqwef'),
	(10, 2, 'dfasdfasdfas', 'asdfqdfasd'),
	(11, 1, '??', '??');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;


-- 導出  表 codeigniter_214.entries 結構
CREATE TABLE IF NOT EXISTS `entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `body` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- 正在導出表  codeigniter_214.entries 的資料：2 rows
DELETE FROM `entries`;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` (`id`, `title`, `body`) VALUES
	(1, 'My First Entries', 'aqfff aqfff aqfff'),
	(2, 'My Secend Entries', 'Blogs Blogs Blogs');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;


-- 導出  表 codeigniter_214.links 結構
CREATE TABLE IF NOT EXISTS `links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `link_title` varchar(50) NOT NULL,
  `link_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 正在導出表  codeigniter_214.links 的資料：~3 rows (大約)
DELETE FROM `links`;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
INSERT INTO `links` (`id`, `link_title`, `link_url`) VALUES
	(1, 'google', 'http://www.google.com'),
	(2, 'Yahoo', 'http://tw.yahoo.com'),
	(3, 'iCD', 'http://www.iwant-music.com');
/*!40000 ALTER TABLE `links` ENABLE KEYS */;


-- 導出  表 codeigniter_214.news 結構
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `slug` varchar(128) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 正在導出表  codeigniter_214.news 的資料：~4 rows (大約)
DELETE FROM `news`;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` (`id`, `title`, `slug`, `text`) VALUES
	(1, '快訊／連丁對決要選誰？　馬英九投給丁守中', '', '記者陳弘修／台北報導\r\n\r\n國民黨台北市19日進行黨內初選投票，黨主席馬英九下午完成投票，面對媒體詢問支持那位參選人？他雖然沒有回答，但卻被現場媒體拍到圈票後拿在手上對折的選票，透過光線與放大檢視，馬英九將選票蓋給了丁守中。\r\n\r\n國民黨台北市長黨內初選的參選人登記，按照號次為：1號鍾小平、2號蔡正元、3號丁守中、4號連勝文。從現場媒體拍到圈票後拿在手上對折的選票，透過光線與放大檢視馬英九折起來的選票，3號上方有紅色印戳。\r\n\r\n新聞相關影音'),
	(2, '快訊／連丁對決要選誰？　馬英九投給丁守中', '', '記者陳弘修／台北報導\r\n\r\n國民黨台北市19日進行黨內初選投票，黨主席馬英九下午完成投票，面對媒體詢問支持那位參選人？他雖然沒有回答，但卻被現場媒體拍到圈票後拿在手上對折的選票，透過光線與放大檢視，馬英九將選票蓋給了丁守中。\r\n\r\n國民黨台北市長黨內初選的參選人登記，按照號次為：1號鍾小平、2號蔡正元、3號丁守中、4號連勝文。從現場媒體拍到圈票後拿在手上對折的選票，透過光線與放大檢視馬英九折起來的選票，3號上方有紅色印戳。'),
	(3, '快訊／連丁對決要選誰？　馬英九投給丁守中', '', '記者陳弘修／台北報導\r\n\r\n國民黨台北市19日進行黨內初選投票，黨主席馬英九下午完成投票，面對媒體詢問支持那位參選人？他雖然沒有回答，但卻被現場媒體拍到圈票後拿在手上對折的選票，透過光線與放大檢視，馬英九將選票蓋給了丁守中。\r\n\r\n國民黨台北市長黨內初選的參選人登記，按照號次為：1號鍾小平、2號蔡正元、3號丁守中、4號連勝文。從現場媒體拍到圈票後拿在手上對折的選票，透過光線與放大檢視馬英九折起來的選票，3號上方有紅色印戳。'),
	(4, ' 翁倒路旁 蒼蠅圍繞…警伸援送醫', '', '東勢有個「路倒哥」劉姓獨居男子，雙腳腫脹且染有肺病，日前又橫躺便利超商整天，渾身臭味，蒼蠅圍繞在腳上傷口，劉男拿著健保卡向路人求救，但無人搭理，直到巡邏員警看到，才趕緊將他送東勢農民醫院急救。\r\n\r\n76歲的劉男是搭豐原客運從卓蘭到東勢，走沒幾步路就倒臥豐勢路、忠孝街的超商前面，身上只有一些零錢跟健保卡，可能右腳掌傷口未癒合，引來一群蒼蠅靠近，經過的人紛紛走避。\r\n\r\n劉姓男子說，僅有1個哥哥但未同住，之前因車禍腳受傷，本來想去看醫生，太痛了只好先躺著休息；趕到的劉男哥哥說，弟弟不願與他住，他也沒辦法。\r\n\r\n經過的員警羅平山、郭文達看到劉男無法站立，雙腳腫了比平常2倍大，先請所內同事支援其他勤務，並通知附近農民醫院醫生過來了解。郭文達並幫忙推擔架、將劉男扶上車；羅平山說，東勢農民醫院只有幾步路距離，但劉男不能行走，必須請醫護人員診療後再移動比較妥當。');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;


-- 導出  表 codeigniter_214.sessions 結構
CREATE TABLE IF NOT EXISTS `sessions` (
  `sesskey` varchar(64) NOT NULL DEFAULT '',
  `expiry` datetime NOT NULL,
  `expireref` varchar(250) DEFAULT '',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `sessdata` longtext,
  PRIMARY KEY (`sesskey`),
  KEY `sess2_expiry` (`expiry`),
  KEY `sess2_expireref` (`expireref`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 正在導出表  codeigniter_214.sessions 的資料：2 rows
DELETE FROM `sessions`;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` (`sesskey`, `expiry`, `expireref`, `created`, `modified`, `sessdata`) VALUES
	('vvp0528hmgcmvlog9id0tfosu7', '2014-04-27 18:33:40', '', '2014-04-27 13:50:34', '2014-04-27 18:03:40', ''),
	('p0iggrc6cgfgfdkm4bu1ag54f6', '2015-11-29 05:22:46', '', '2015-11-29 04:52:46', '2015-11-29 04:52:46', '');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;


-- 導出  表 codeigniter_214.student 結構
CREATE TABLE IF NOT EXISTS `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(64) DEFAULT NULL,
  `p_name` varchar(64) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `state` char(2) DEFAULT NULL,
  `zip` char(10) DEFAULT NULL,
  `phone` char(20) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- 正在導出表  codeigniter_214.student 的資料：7 rows
DELETE FROM `student`;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`id`, `s_name`, `p_name`, `address`, `city`, `state`, `zip`, `phone`, `email`) VALUES
	(1, '葉12', '聰智', '內湖路一段91巷17號3樓', '台北', '內湖', '114', '0968821548', 'yehchge@gmail.com'),
	(10, 'Peter Green', 'Len & Natalie Green', '480 West Broad Street', 'Eastbrook Canyon', 'PA', '19104', '(215) 900-2341', 'greenery@timewarner.dsl.com'),
	(11, 'Jonah Ross', 'Robert & Linda Ross', '1293 Law Street', 'Eastbrook Village', 'PA', '19105', '(215) 907-1122', 'ross_boss@gmail.com'),
	(12, 'Rebecca Dillon', 'Lainie and Howard Dillon', '12 Flamingo Drive', 'Westbrook Village', 'PA', '19103', '(215) 887-4313', 'ld_1975@yahoo.com'),
	(13, 'Noah Singer', 'Carolyn & Peter Singer', '393 Green Lake Road, 8th Floor', 'Eastbrook Village', 'PA', '19105', '(215) 907-2344', 'candp@gmail.com'),
	(14, 'Trevor Lee Logan', 'Steven Logan', '400 Green Lake Road, 9th Floor', 'Eastbrook Village', 'PA', '19105-6541', '(828) 299-9885', 'misterSAL@sbcglobal.net'),
	(15, 'Audrey Christiansen', 'Lovey Christiansen', '1993 East Sunnyside Lane', 'Eastbrook Canyon', 'PA', '19104', '(215) 887-5545', 'lovey@christiansen-clan.com');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;


-- 導出  表 codeigniter_214.tbl_comment 結構
CREATE TABLE IF NOT EXISTS `tbl_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `author` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_comment_post` (`post_id`),
  CONSTRAINT `FK_comment_post` FOREIGN KEY (`post_id`) REFERENCES `tbl_post` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在導出表  codeigniter_214.tbl_comment 的資料：~19 rows (大約)
DELETE FROM `tbl_comment`;
/*!40000 ALTER TABLE `tbl_comment` DISABLE KEYS */;
INSERT INTO `tbl_comment` (`id`, `content`, `status`, `create_time`, `author`, `email`, `url`, `post_id`) VALUES
	(1, 'This is a test comment.', 2, 1230952187, 'Tester', 'tester@example.com', NULL, 2),
	(2, 'This is a bill Comment.', 2, 1347360153, 'bill', 'yehchge@hotmail.com', '', 2),
	(3, 'This is a demo11 comment.', 2, 1347360206, ' jeromte', 'demo11@gmail.com', 'http://www.edupointer.com', 2),
	(4, 'fgsdfgeh', 2, 1347519312, 'ewsadfa', 'asdfas', '', 12),
	(5, 'kghjgkhj', 2, 1347529306, 'hjkghj', 'asdfas@sdfasd.sdfs', '', 45),
	(6, 'adsfadf', 2, 1347636027, 'dsfsafasdf', 'sdadsf@coaf.com', '', 50),
	(7, 'asdfasd', 2, 1347636050, 'adsfasdf', 'asfdde@dfas.com', '', 50),
	(8, 'asdfasf', 2, 1347636065, 'asdfasdg', 'sdefrewqrew@asfda.asdf', '', 50),
	(9, 'This is my 3rd. comments.', 2, 1347883895, 'yehchge', 'yehchge@gmail.com', '', 1),
	(10, 'adfasdfasdfasfgsdgsdg\r\nsgfdgsfdgsfd', 2, 1347887788, 'fasfdasdf', 'asdfasf@adsfa.com', '', 50),
	(11, 'asfawfewqefr43435\r\nkdsasdfasgfirejg\r\nasdfierjwadfas234\r\neiuradsfasdfa4355\r\njgasdfasdfds\r\n', 2, 1347888837, 'adfasd3241fasdf', 'asdf@asw24df.com', '', 50),
	(12, 'dfasdfadfadsf', 2, 1347889034, 'fafadfasdfads', 'asfadsafds@sdfg.cjnm', '', 63),
	(13, 'adsfasdf', 2, 1347893797, 'sdfas', 'sdadsf@coaf.com', '', 48),
	(14, 'adfasfdasdf.a adfasdfa.sdfas .asdf. as.dfasdfasd fasd\r\n', 2, 1347893837, 'yehchge', 'yehchge@gmail.com', 'http://www.edupointer.com', 63),
	(15, 'aasdfjhaueifaasfd\r\nadsfasdfasfd\r\nasdfasdfas\r\n* dfasd\r\n*fasdfas\r\n*fa\r\n**sdf\r\n**as\r\n**dfa\r\ndsfasdfasdfadsaf', 2, 1347894861, 'asdf', 'asdfasd@ads.sdf', 'http://tw.yahoo.com', 48),
	(16, 'dfadsfadsf\r\nfgsfdgsfdadfasdfads\r\ndfafdsdsfad\r\nsfdgsdgf', 2, 1347895726, 'asfdasf', 'yehchge@gmail.com', 'http://www.google.com', 64),
	(17, '資料太少了,\r\n所以多打了一些!!\r\n', 2, 1347896083, 'dfasf', 'asdfasf@adsfa.com', '', 1),
	(18, 'dfasfd\r\nfdasdfa\r\nsdf\r\nasdfasdfasdf\r\ndfasdfas\r\nfasdfads', 2, 1347896831, 'asfda', 'yehchge@gmail.com', 'www.google.com', 64),
	(19, 'asdfasd', 1, 1398208242, 'dasfdq', 'asdfasf', 'asdfas', 77);
/*!40000 ALTER TABLE `tbl_comment` ENABLE KEYS */;


-- 導出  表 codeigniter_214.tbl_lookup 結構
CREATE TABLE IF NOT EXISTS `tbl_lookup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `code` int(11) NOT NULL,
  `type` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在導出表  codeigniter_214.tbl_lookup 的資料：~5 rows (大約)
DELETE FROM `tbl_lookup`;
/*!40000 ALTER TABLE `tbl_lookup` DISABLE KEYS */;
INSERT INTO `tbl_lookup` (`id`, `name`, `code`, `type`, `position`) VALUES
	(1, 'Draft', 1, 'PostStatus', 1),
	(2, 'Published', 2, 'PostStatus', 2),
	(3, 'Archived', 3, 'PostStatus', 3),
	(4, 'Pending Approval', 1, 'CommentStatus', 1),
	(5, 'Approved', 2, 'CommentStatus', 2);
/*!40000 ALTER TABLE `tbl_lookup` ENABLE KEYS */;


-- 導出  表 codeigniter_214.tbl_post 結構
CREATE TABLE IF NOT EXISTS `tbl_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `tags` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_post_author` (`author_id`),
  CONSTRAINT `FK_post_author` FOREIGN KEY (`author_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在導出表  codeigniter_214.tbl_post 的資料：~39 rows (大約)
DELETE FROM `tbl_post`;
/*!40000 ALTER TABLE `tbl_post` DISABLE KEYS */;
INSERT INTO `tbl_post` (`id`, `title`, `content`, `tags`, `status`, `create_time`, `update_time`, `author_id`) VALUES
	(1, 'Welcome!', 'This blog system is developed using Yii. It is meant to demonstrate how to use Yii to build a complete real-world application. Complete source code may be found in the Yii releases.\r\n\r\nFeel free to try this system by writing new posts and posting comments.', 'yii, blog', 3, 1380466391, 1380466391, 1),
	(2, 'A Test Post', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'test', 2, 1230952187, 1230952187, 1),
	(3, 'ghfjghfj', 'ghfjghfjgh', 'gfhj', 2, 1347628025, 1347628025, 1),
	(4, 'this is my 3 new posts.', 'this is my 3 new posts.\r\nthis is my 3 new posts.\r\nthis is my 3 new posts.\r\nthis is my 3 new posts.\r\nthis is my 3 new posts.\r\n', 'test', 2, 1347628038, 1347628038, 1),
	(5, '更新為中文', 'asfasfasdf', 'test,random', 2, 1347896295, 1347896295, 1),
	(6, 'kghgk', 'hgkhjfghjfg', 'test', 2, 1347628089, 1347628089, 1),
	(7, 'kghgk', 'hgkhjfghjfg', 'test', 2, 1347628097, 1347628097, 1),
	(8, 'ertgergt', 'crw4tber45we', 'test', 2, 1347628105, 1347628105, 1),
	(9, 'd342df43', 'df43fd34d23', 'test', 2, 1347628114, 1347628114, 1),
	(10, '323sdf34g45h7', 'f45ggh5j674h323t', 'test', 2, 1347628126, 1347628126, 1),
	(11, 'fwerf34dw43dw43', 'df43dfw34f3456y', 'test', 2, 1347441814, 1347441814, 1),
	(12, '這是中文的第一次PO文。', '這是中文的第一次PO文。\r\n這是中文的第一次PO文。\r\n這是中文的第一次PO文。\r\n這是中文的第一次PO文。\r\n這是中文的第一次PO文。\r\n', '中文,test', 2, 1347441976, 1347441976, 1),
	(13, '定便當', '定便當定便當\r\n\r\n定便當定便當\r\n定便當\r\n定便當\r\n定便當\r\n定便當定便當\r\n定便當定便當\r\n定便當定便當定便當', 'test', 2, 1347983675, 1347983675, 1),
	(14, '注意時間', '注意時間\r\n注意時間\r\n注意時間', 'time', 2, 1347983713, 1347983713, 1),
	(15, '設定時區', '設定時區設定時區設定時區', 'time', 2, 1347503281, 1347503281, 1),
	(16, '顯示正確時間', '顯示正確時間\r\n顯示正確時間\r\n顯示正確時間\r\n顯示正確時間\r\n顯示正確時間\r\n顯示正確時間\r\n顯示正確時間\r\n顯示正確時間\r\n顯示正確時間', 'time', 2, 1347983729, 1347983729, 1),
	(17, '你也可以使用Markdown.', 'dhfgdh真的嗎?', 'markdown', 2, 1347897084, 1347897084, 1),
	(18, '太短改常點', 'dhfgdh\r\nadsfasdfasd\r\nfasdfasdfadsf\r\nasdfadsf', 'random', 2, 1347896336, 1347896336, 1),
	(19, 'x45v67j7', 'sgdfsgdf', 'test', 2, 1347983761, 1347983761, 1),
	(20, 'a132ddff', 'sgdfsgdf', 'test', 2, 1347896934, 1347896934, 1),
	(21, 'dfsg', 'dfsgd', 'asdf', 2, 1347983782, 1347983782, 1),
	(23, 'dfgsdfg', 'dfgsdfsgdf', 'asdf', 2, 1347983802, 1347983802, 1),
	(24, 'hjgeq32522', 'yhkhjfjasdf', 'asdf', 2, 1347983839, 1347983839, 1),
	(25, 'sdfa', 'asgf', '', 1, 1347518446, 1347518446, 1),
	(26, 'sddf', 'asdf', 'asdf,test', 3, 1347983860, 1347983860, 1),
	(27, 'asef432545', 'fsgfsdf', 'asdf', 2, 1347983883, 1347983883, 1),
	(28, 'sdafa', 'sdgdfg', 'asdf,test', 2, 1347983902, 1347983902, 1),
	(29, 'sdg', 'sfgsdf', '', 1, 1347518471, 1347518471, 1),
	(30, 'dfrewf', 'awefwe', '', 1, 1347518477, 1347518477, 1),
	(31, 'jkfafadfasfd', 'ghk', 'test', 2, 1347984015, 1347984015, 1),
	(32, 'gf', 'dhfgdh', 'ewf', 2, 1347983941, 1347983941, 1),
	(33, 'fhd', 'gfdhgf', 'asdf', 2, 1347983956, 1347983956, 1),
	(34, 'gfwerywerywer', 'dhfgdh', 'asdf', 2, 1347983987, 1347983987, 1),
	(35, 'gf', 'dhfgdh', '', 1, 1347518515, 1347518515, 1),
	(36, 'fg', 'dhfg', 'asf', 3, 1347983968, 1347983968, 1),
	(37, 'fgdhgf', 'fdgh', '', 1, 1347518522, 1347518522, 1),
	(38, 'fg', 'dhfgdh', '', 1, 1347518526, 1347518526, 1),
	(39, 'k573w34h', 'sgdfsg', 'test', 2, 1347896952, 1347896952, 1),
	(40, 'dfsg', 'sdf', '', 1, 1347518533, 1347518533, 1),
	(41, 'This is a subject.', 'sgdfg', 'test', 2, 1347896981, 1347896981, 1),
	(42, 'I am a student.', 'sgdf', 'test,easy', 2, 1347897014, 1347897014, 1),
	(43, 'dfsg', 'dfsg', 'test', 2, 1347984030, 1347984030, 1),
	(44, 'dfsg', 'dfsg', '', 1, 1347518549, 1347518549, 1),
	(45, '更新落格展示', '更新落格展示\r\n更新落格展示\r\n更新落格展示\r\n更新落格展示\r\n更新落格展示\r\n更新落格展示\r\n更新落格展示\r\n更新落格展示', 'test', 2, 1347528934, 1347528934, 1),
	(46, 'yu', 'iyutit', '', 1, 1347520188, 1347520188, 1),
	(47, '設定時區', '設定時區設定時區設定時區', 'time', 2, 1347523208, 1347523208, 1),
	(48, '設定時區123', '設定時區1,\r\n設定時區2,\r\n設定時區3,', 'test,測試', 2, 1347524554, 1347524554, 1),
	(49, '設定時區76789', '設定時區設定時區設定時區78697869', 'tyrut', 2, 1347523269, 1347523269, 1),
	(50, '新增文章321', '新增文章321\r\n新增文章321\r\n新增文章321\r\n新增文章321\r\n新增文章321\r\n\r\n新增文章321\r\n新增文章321\r\n新增文章321\r\n新增文章321', 'test', 2, 1347528876, 1347528876, 1),
	(51, 'hjgkhj', 'ghjgkhjkg', 'dsaf', 2, 1347984067, 1347984067, 1),
	(52, 'hj', 'gkhgk', '', 1, 1347529351, 1347529351, 1),
	(53, 'hjgkhjg', 'hgk', '', 1, 1347529355, 1347529355, 1),
	(54, 'hjgk', 'hjgkhj', '', 1, 1347529360, 1347529360, 1),
	(55, 'hjgk', 'hgkhj', '', 1, 1347529364, 1347529364, 1),
	(56, 'hjgkh', 'jgkhjk', '', 1, 1347529368, 1347529368, 1),
	(57, 'hjkg', 'hjkghjgkh', '', 1, 1347529372, 1347529372, 1),
	(58, 'dfgs', 'sdg', '', 1, 1347529784, 1347529784, 1),
	(59, 'adfdsdf', 'qasdgasdfas', '', 1, 1347529792, 1347529792, 1),
	(60, 'asfasd`safas', 'afasdgsdf', '', 1, 1347529805, 1347529805, 1),
	(61, 'wevth453`432f5', 'd342fr45tw4gsdf', '', 1, 1347529814, 1347529814, 1),
	(62, 'fafadsasfasdfa', 'afasdfasdfasdf', 'test', 2, 1347888912, 1347888912, 1),
	(63, 'dsfasfasgf', 'afasdfadsfdads', 'test', 2, 1347889015, 1347889015, 1),
	(64, 'asfsdf', 'dsfadf', 'test', 2, 1347895566, 1347895566, 1),
	(65, 'sdadsfadf', 'adfasdfa', 'yeh', 1, 1347972978, 1347972978, 1),
	(66, 'test', 'ateatasaetast', 'apppp', 1, 1347983471, 1347983471, 1),
	(67, 'asdf', '`asdfasdf', 'test', 1, 1347983512, 1347983512, 1),
	(68, 'sdfasfas', 'asdfasf', 'test', 1, 1347983524, 1347983524, 1),
	(69, 'afasfsafasdf', 'asfasfas', 'test', 1, 1347983536, 1347983536, 1),
	(70, 'afasdfadsvfb', 'sfvsdfdfbsd', 'blog', 2, 1347983553, 1347983553, 1),
	(71, 'dfasfdasdf', 'asfasdfasfasd', 'yii,test', 2, 1347983577, 1347983577, 1),
	(72, 'akjfdaslkfjhsal', 'asdfasjdfasdkfhlj', 'test,yii,blog', 2, 1347983924, 1347983924, 1),
	(73, 'dfasjfaldshfi', 'usdfkjvnslfjnvldfjkdl', 'test', 2, 1347984042, 1347984042, 1),
	(74, 'dafasfag', 'agfasfasdfa', 'test', 2, 1347983625, 1347983625, 1),
	(75, 'Markdown Description.', 'Markdown\r\n========\r\n\r\nVersion 1.0.1 - Tue 14 Dec 2004\r\n\r\nby John Gruber  \r\n<http://daringfireball.net/>\r\n\r\n\r\nIntroduction\r\n------------\r\n\r\nMarkdown is a text-to-HTML conversion tool for web writers. Markdown\r\nallows you to write using an easy-to-read, easy-to-write plain text\r\nformat, then convert it to structurally valid XHTML (or HTML).\r\n\r\nThus, "Markdown" is two things: a plain text markup syntax, and a\r\nsoftware tool, written in Perl, that converts the plain text markup \r\nto HTML.\r\n\r\nMarkdown works both as a Movable Type plug-in and as a standalone Perl\r\nscript -- which means it can also be used as a text filter in BBEdit\r\n(or any other application that supporst filters written in Perl).\r\n\r\nFull documentation of Markdown\'s syntax and configuration options is\r\navailable on the web: <http://daringfireball.net/projects/markdown/>.\r\n(Note: this readme file is formatted in Markdown.)\r\n\r\n\r\n\r\nInstallation and Requirements\r\n-----------------------------\r\n\r\nMarkdown requires Perl 5.6.0 or later. Welcome to the 21st Century.\r\nMarkdown also requires the standard Perl library module `Digest::MD5`. \r\n\r\n\r\n### Movable Type ###\r\n\r\nMarkdown works with Movable Type version 2.6 or later (including \r\nMT 3.0 or later).\r\n\r\n1.  Copy the "Markdown.pl" file into your Movable Type "plugins"\r\n    directory. The "plugins" directory should be in the same directory\r\n    as "mt.cgi"; if the "plugins" directory doesn\'t already exist, use\r\n    your FTP program to create it. Your installation should look like\r\n    this:\r\n\r\n        (mt home)/plugins/Markdown.pl\r\n\r\n2.  Once installed, Markdown will appear as an option in Movable Type\'s\r\n    Text Formatting pop-up menu. This is selectable on a per-post basis.\r\n    Markdown translates your posts to HTML when you publish; the posts\r\n    themselves are stored in your MT database in Markdown format.\r\n\r\n3.  If you also install SmartyPants 1.5 (or later), Markdown will offer\r\n    a second text formatting option: "Markdown with SmartyPants". This\r\n    option is the same as the regular "Markdown" formatter, except that\r\n    automatically uses SmartyPants to create typographically correct\r\n    curly quotes, em-dashes, and ellipses. See the SmartyPants web page\r\n    for more information: <http://daringfireball.net/projects/smartypants/>\r\n\r\n4.  To make Markdown (or "Markdown with SmartyPants") your default\r\n    text formatting option for new posts, go to Weblog Config ->\r\n    Preferences.\r\n\r\nNote that by default, Markdown produces XHTML output. To configure\r\nMarkdown to produce HTML 4 output, see "Configuration", below.\r\n\r\n\r\n### Blosxom ###\r\n\r\nMarkdown works with Blosxom version 2.x.\r\n\r\n1.  Rename the "Markdown.pl" plug-in to "Markdown" (case is\r\n    important). Movable Type requires plug-ins to have a ".pl"\r\n    extension; Blosxom forbids it.\r\n\r\n2.  Copy the "Markdown" plug-in file to your Blosxom plug-ins folder.\r\n    If you\'re not sure where your Blosxom plug-ins folder is, see the\r\n    Blosxom documentation for information.\r\n\r\n3.  That\'s it. The entries in your weblog will now automatically be\r\n    processed by Markdown.\r\n\r\n4.  If you\'d like to apply Markdown formatting only to certain posts,\r\n    rather than all of them, see Jason Clark\'s instructions for using\r\n    Markdown in conjunction with Blosxom\'s Meta plugin:\r\n    \r\n    <http://jclark.org/weblog/WebDev/Blosxom/Markdown.html>\r\n\r\n\r\n### BBEdit ###\r\n\r\nMarkdown works with BBEdit 6.1 or later on Mac OS X. (It also works\r\nwith BBEdit 5.1 or later and MacPerl 5.6.1 on Mac OS 8.6 or later.)\r\n\r\n1.  Copy the "Markdown.pl" file to appropriate filters folder in your\r\n    "BBEdit Support" folder. On Mac OS X, this should be:\r\n\r\n        BBEdit Support/Unix Support/Unix Filters/\r\n\r\n    See the BBEdit documentation for more details on the location of\r\n    these folders.\r\n\r\n    You can rename "Markdown.pl" to whatever you wish.\r\n\r\n2.  That\'s it. To use Markdown, select some text in a BBEdit document,\r\n    then choose Markdown from the Filters sub-menu in the "#!" menu, or\r\n    the Filters floating palette\r\n\r\n\r\n\r\nConfiguration\r\n-------------\r\n\r\nBy default, Markdown produces XHTML output for tags with empty elements.\r\nE.g.:\r\n\r\n    <br />\r\n\r\nMarkdown can be configured to produce HTML-style tags; e.g.:\r\n\r\n    <br>\r\n\r\n\r\n### Movable Type ###\r\n\r\nYou need to use a special `MTMarkdownOptions` container tag in each\r\nMovable Type template where you want HTML 4-style output:\r\n\r\n    <MTMarkdownOptions output=\'html4\'>\r\n        ... put your entry content here ...\r\n    </MTMarkdownOptions>\r\n\r\nThe easiest way to use MTMarkdownOptions is probably to put the\r\nopening tag right after your `<body>` tag, and the closing tag right\r\nbefore `</body>`.\r\n\r\nTo suppress Markdown processing in a particular template, i.e. to\r\npublish the raw Markdown-formatted text without translation into\r\n(X)HTML, set the `output` attribute to \'raw\':\r\n\r\n    <MTMarkdownOptions output=\'raw\'>\r\n        ... put your entry content here ...\r\n    </MTMarkdownOptions>\r\n\r\n\r\n### Command-Line ###\r\n\r\nUse the `--html4tags` command-line switch to produce HTML output from a\r\nUnix-style command line. E.g.:\r\n\r\n    % perl Markdown.pl --html4tags foo.text\r\n\r\nType `perldoc Markdown.pl`, or read the POD documentation within the\r\nMarkdown.pl source code for more information.\r\n\r\n\r\n\r\nBugs\r\n----\r\n\r\nTo file bug reports or feature requests please send email to:\r\n<markdown@daringfireball.net>.\r\n\r\n\r\n\r\nVersion History\r\n---------------\r\n\r\n1.0.1 (14 Dec 2004):\r\n\r\n+	Changed the syntax rules for code blocks and spans. Previously,\r\n	backslash escapes for special Markdown characters were processed\r\n	everywhere other than within inline HTML tags. Now, the contents\r\n	of code blocks and spans are no longer processed for backslash\r\n	escapes. This means that code blocks and spans are now treated\r\n	literally, with no special rules to worry about regarding\r\n	backslashes.\r\n\r\n	**NOTE**: This changes the syntax from all previous versions of\r\n	Markdown. Code blocks and spans involving backslash characters\r\n	will now generate different output than before.\r\n\r\n+	Tweaked the rules for link definitions so that they must occur\r\n	within three spaces of the left margin. Thus if you indent a link\r\n	definition by four spaces or a tab, it will now be a code block.\r\n	\r\n		   [a]: /url/  "Indented 3 spaces, this is a link def"\r\n\r\n		    [b]: /url/  "Indented 4 spaces, this is a code block"\r\n	\r\n	**IMPORTANT**: This may affect existing Markdown content if it\r\n	contains link definitions indented by 4 or more spaces.\r\n\r\n+	Added `>`, `+`, and `-` to the list of backslash-escapable\r\n	characters. These should have been done when these characters\r\n	were added as unordered list item markers.\r\n\r\n+	Trailing spaces and tabs following HTML comments and `<hr/>` tags\r\n	are now ignored.\r\n\r\n+	Inline links using `<` and `>` URL delimiters weren\'t working:\r\n\r\n		like [this](<http://example.com/>)\r\n\r\n+	Added a bit of tolerance for trailing spaces and tabs after\r\n	Markdown hr\'s.\r\n\r\n+	Fixed bug where auto-links were being processed within code spans:\r\n\r\n		like this: `<http://example.com/>`\r\n\r\n+	Sort-of fixed a bug where lines in the middle of hard-wrapped\r\n	paragraphs, which lines look like the start of a list item,\r\n	would accidentally trigger the creation of a list. E.g. a\r\n	paragraph that looked like this:\r\n\r\n		I recommend upgrading to version\r\n		8. Oops, now this line is treated\r\n		as a sub-list.\r\n\r\n	This is fixed for top-level lists, but it can still happen for\r\n	sub-lists. E.g., the following list item will not be parsed\r\n	properly:\r\n\r\n		+	I recommend upgrading to version\r\n			8. Oops, now this line is treated\r\n			as a sub-list.\r\n\r\n	Given Markdown\'s list-creation rules, I\'m not sure this can\r\n	be fixed.\r\n\r\n+	Standalone HTML comments are now handled; previously, they\'d get\r\n	wrapped in a spurious `<p>` tag.\r\n\r\n+	Fix for horizontal rules preceded by 2 or 3 spaces.\r\n\r\n+	`<hr>` HTML tags in must occur within three spaces of left\r\n	margin. (With 4 spaces or a tab, they should be code blocks, but\r\n	weren\'t before this fix.)\r\n\r\n+	Capitalized "With" in "Markdown With SmartyPants" for\r\n	consistency with the same string label in SmartyPants.pl.\r\n	(This fix is specific to the MT plug-in interface.)\r\n\r\n+	Auto-linked email address can now optionally contain\r\n	a \'mailto:\' protocol. I.e. these are equivalent:\r\n\r\n		<mailto:user@example.com>\r\n		<user@example.com>\r\n\r\n+	Fixed annoying bug where nested lists would wind up with\r\n	spurious (and invalid) `<p>` tags.\r\n\r\n+	You can now write empty links:\r\n\r\n		[like this]()\r\n\r\n	and they\'ll be turned into anchor tags with empty href attributes.\r\n	This should have worked before, but didn\'t.\r\n\r\n+	`***this***` and `___this___` are now turned into\r\n\r\n		<strong><em>this</em></strong>\r\n\r\n	Instead of\r\n\r\n		<strong><em>this</strong></em>\r\n\r\n	which isn\'t valid. (Thanks to Michel Fortin for the fix.)\r\n\r\n+	Added a new substitution in `_EncodeCode()`: s/$/&#036;/g; This\r\n	is only for the benefit of Blosxom users, because Blosxom\r\n	(sometimes?) interpolates Perl scalars in your article bodies.\r\n\r\n+	Fixed problem for links defined with urls that include parens, e.g.:\r\n\r\n		[1]: http://sources.wikipedia.org/wiki/Middle_East_Policy_(Chomsky)\r\n\r\n	"Chomsky" was being erroneously treated as the URL\'s title.\r\n\r\n+	At some point during 1.0\'s beta cycle, I changed every sub\'s\r\n	argument fetching from this idiom:\r\n\r\n		my $text = shift;\r\n\r\n	to:\r\n\r\n		my $text = shift || return \'\';\r\n\r\n	The idea was to keep Markdown from doing any work in a sub\r\n	if the input was empty. This introduced a bug, though:\r\n	if the input to any function was the single-character string\r\n	"0", it would also evaluate as false and return immediately.\r\n	How silly. Now fixed.\r\n\r\n\r\n\r\nDonations\r\n---------\r\n\r\nDonations to support Markdown\'s development are happily accepted. See:\r\n<http://daringfireball.net/projects/markdown/> for details.\r\n\r\n\r\n\r\nCopyright and License\r\n---------------------\r\n\r\nCopyright (c) 2003-2004 John Gruber   \r\n<http://daringfireball.net/>   \r\nAll rights reserved.\r\n\r\nRedistribution and use in source and binary forms, with or without\r\nmodification, are permitted provided that the following conditions are\r\nmet:\r\n\r\n* Redistributions of source code must retain the above copyright notice,\r\n  this list of conditions and the following disclaimer.\r\n\r\n* Redistributions in binary form must reproduce the above copyright\r\n  notice, this list of conditions and the following disclaimer in the\r\n  documentation and/or other materials provided with the distribution.\r\n\r\n* Neither the name "Markdown" nor the names of its contributors may\r\n  be used to endorse or promote products derived from this software\r\n  without specific prior written permission.\r\n\r\nThis software is provided by the copyright holders and contributors "as\r\nis" and any express or implied warranties, including, but not limited\r\nto, the implied warranties of merchantability and fitness for a\r\nparticular purpose are disclaimed. In no event shall the copyright owner\r\nor contributors be liable for any direct, indirect, incidental, special,\r\nexemplary, or consequential damages (including, but not limited to,\r\nprocurement of substitute goods or services; loss of use, data, or\r\nprofits; or business interruption) however caused and on any theory of\r\nliability, whether in contract, strict liability, or tort (including\r\nnegligence or otherwise) arising in any way out of the use of this\r\nsoftware, even if advised of the possibility of such damage.', 'Markdown,blog', 2, 1348067091, 1348067091, 1),
	(76, 'test', 'aeaet', 'test', 2, 1379764232, 1379764232, 1),
	(77, 'dasdasdf', 'adsfasdfasdf', 'sdafsa', 2, 1380466332, 1380466332, 1),
	(78, 'sadfadsf', 'adsfasdf', 'asdf', 1, 1380466361, 1380466361, 1);
/*!40000 ALTER TABLE `tbl_post` ENABLE KEYS */;


-- 導出  表 codeigniter_214.tbl_tag 結構
CREATE TABLE IF NOT EXISTS `tbl_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `frequency` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在導出表  codeigniter_214.tbl_tag 的資料：~11 rows (大約)
DELETE FROM `tbl_tag`;
/*!40000 ALTER TABLE `tbl_tag` DISABLE KEYS */;
INSERT INTO `tbl_tag` (`id`, `name`, `frequency`) VALUES
	(1, 'yii', 3),
	(2, 'blog', 4),
	(3, 'test', 13),
	(4, 'yeh', 1),
	(6, 'apppp', 1),
	(7, 'asdf', 9),
	(8, 'ewf', 1),
	(9, 'asf', 1),
	(10, 'dsaf', 1),
	(11, 'Markdown', 1),
	(12, 'sdafsa', 1);
/*!40000 ALTER TABLE `tbl_tag` ENABLE KEYS */;


-- 導出  表 codeigniter_214.tbl_user 結構
CREATE TABLE IF NOT EXISTS `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `profile` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- 正在導出表  codeigniter_214.tbl_user 的資料：~1 rows (大約)
DELETE FROM `tbl_user`;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` (`id`, `username`, `password`, `salt`, `email`, `profile`) VALUES
	(1, 'demo', '2e5c7db760a33498023813489cfadc0b', '28b206548469ce62182048fd9cf91760', 'webmaster@example.com', NULL);
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;


-- 導出  表 codeigniter_214.user 結構
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 正在導出表  codeigniter_214.user 的資料：~4 rows (大約)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `email`, `password`, `date_added`) VALUES
	(1, 'test@test.com', 'test', '0000-00-00 00:00:00'),
	(2, 'test@test.com', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', '0000-00-00 00:00:00'),
	(3, 'test@test.com', '14ef34f2a60b3a0d42831029f5f4e2fa58b9a5d6', '0000-00-00 00:00:00'),
	(4, 'test@test.com', '14ef34f2a60b3a0d42831029f5f4e2fa58b9a5d6', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
