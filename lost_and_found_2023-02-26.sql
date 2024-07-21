# ************************************************************
# Sequel Ace SQL dump
# 版本号： 20046
#
# https://sequel-ace.com/
# https://github.com/Sequel-Ace/Sequel-Ace
#
# 主机: 127.0.0.1 (MySQL 5.7.36)
# 数据库: lost_and_found
# 生成时间: 2023-02-26 07:46:12 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE='NO_AUTO_VALUE_ON_ZERO', SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# 转储表 auth_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# 转储表 auth_group_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# 转储表 auth_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
	(1,'Can add log entry',1,'add_logentry'),
	(2,'Can change log entry',1,'change_logentry'),
	(3,'Can delete log entry',1,'delete_logentry'),
	(4,'Can view log entry',1,'view_logentry'),
	(5,'Can add permission',2,'add_permission'),
	(6,'Can change permission',2,'change_permission'),
	(7,'Can delete permission',2,'delete_permission'),
	(8,'Can view permission',2,'view_permission'),
	(9,'Can add group',3,'add_group'),
	(10,'Can change group',3,'change_group'),
	(11,'Can delete group',3,'delete_group'),
	(12,'Can view group',3,'view_group'),
	(13,'Can add user',4,'add_user'),
	(14,'Can change user',4,'change_user'),
	(15,'Can delete user',4,'delete_user'),
	(16,'Can view user',4,'view_user'),
	(17,'Can add content type',5,'add_contenttype'),
	(18,'Can change content type',5,'change_contenttype'),
	(19,'Can delete content type',5,'delete_contenttype'),
	(20,'Can view content type',5,'view_contenttype'),
	(21,'Can add session',6,'add_session'),
	(22,'Can change session',6,'change_session'),
	(23,'Can delete session',6,'delete_session'),
	(24,'Can view session',6,'view_session'),
	(25,'Can add message',7,'add_message'),
	(26,'Can change message',7,'change_message'),
	(27,'Can delete message',7,'delete_message'),
	(28,'Can view message',7,'view_message'),
	(29,'Can add release',8,'add_release'),
	(30,'Can change release',8,'change_release'),
	(31,'Can delete release',8,'delete_release'),
	(32,'Can view release',8,'view_release'),
	(33,'Can add user',9,'add_user'),
	(34,'Can change user',9,'change_user'),
	(35,'Can delete user',9,'delete_user'),
	(36,'Can view user',9,'view_user');

/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 auth_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`)
VALUES
	(1,'pbkdf2_sha256$390000$4PNhE7chG2tmmLGv32wttc$3YtFpIqAv9uGYAe7t13C0oLdXOOqakNmb3qikvH8nPA=','2023-01-29 11:56:54.535870',1,'admin','','','',1,1,'2023-01-29 11:56:20.079492'),
	(2,'pbkdf2_sha256$390000$ciOCdmCT6kSABSlRujgpvD$ajH4EAV43/RJvdNS0ukp9ldvd8pAFLSGXQ5WHXziOHY=',NULL,0,'test','','','',0,1,'2023-01-29 11:57:30.201528');

/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 auth_user_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# 转储表 auth_user_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# 转储表 django_admin_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`)
VALUES
	(1,'2023-01-29 11:57:30.365875','2','test',1,'[{\"added\": {}}]',4,1);

/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 django_content_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;

INSERT INTO `django_content_type` (`id`, `app_label`, `model`)
VALUES
	(1,'admin','logentry'),
	(3,'auth','group'),
	(2,'auth','permission'),
	(4,'auth','user'),
	(5,'contenttypes','contenttype'),
	(7,'message','message'),
	(8,'release','release'),
	(6,'sessions','session'),
	(9,'user','user');

/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 django_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`)
VALUES
	(1,'contenttypes','0001_initial','2023-01-28 18:22:23.389512'),
	(2,'auth','0001_initial','2023-01-28 18:22:23.538675'),
	(3,'admin','0001_initial','2023-01-28 18:22:23.573009'),
	(4,'admin','0002_logentry_remove_auto_add','2023-01-28 18:22:23.577796'),
	(5,'admin','0003_logentry_add_action_flag_choices','2023-01-28 18:22:23.582109'),
	(6,'contenttypes','0002_remove_content_type_name','2023-01-28 18:22:23.610377'),
	(7,'auth','0002_alter_permission_name_max_length','2023-01-28 18:22:23.626984'),
	(8,'auth','0003_alter_user_email_max_length','2023-01-28 18:22:23.645456'),
	(9,'auth','0004_alter_user_username_opts','2023-01-28 18:22:23.650154'),
	(10,'auth','0005_alter_user_last_login_null','2023-01-28 18:22:23.663648'),
	(11,'auth','0006_require_contenttypes_0002','2023-01-28 18:22:23.665485'),
	(12,'auth','0007_alter_validators_add_error_messages','2023-01-28 18:22:23.670036'),
	(13,'auth','0008_alter_user_username_max_length','2023-01-28 18:22:23.685525'),
	(14,'auth','0009_alter_user_last_name_max_length','2023-01-28 18:22:23.701228'),
	(15,'auth','0010_alter_group_name_max_length','2023-01-28 18:22:23.718079'),
	(16,'auth','0011_update_proxy_permissions','2023-01-28 18:22:23.724651'),
	(17,'auth','0012_alter_user_first_name_max_length','2023-01-28 18:22:23.740039'),
	(18,'sessions','0001_initial','2023-01-28 18:22:23.760182'),
	(19,'user','0001_initial','2023-01-28 18:22:53.920609'),
	(20,'release','0001_initial','2023-01-28 18:22:53.948397'),
	(21,'message','0001_initial','2023-01-28 18:22:53.983149'),
	(22,'user','0002_alter_user_nick_name','2023-01-29 18:06:34.843191'),
	(23,'user','0003_alter_user_nick_name_alter_user_user_name','2023-01-29 18:26:44.191481'),
	(24,'message','0002_message_to_user_alter_message_user','2023-02-11 21:28:03.456548'),
	(25,'user','0004_user_age','2023-02-12 16:52:13.887407'),
	(26,'user','0005_alter_user_age_alter_user_phone','2023-02-12 20:47:19.325705');

/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 django_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`)
VALUES
	('yptiy8bkplupq0aqatwvmezjtvjovi4c','.eJxVjDsOwjAQBe_iGllr-buU9JzB8meNA8iW4qSKuDuJlALaNzNvYz6sS_XroNlPmV2ZYJffLYb0onaA_Azt0XnqbZmnyA-Fn3Twe8_0vp3u30ENo-51QiKdnRSCtAkFSWNJBYGMkkUmygacDQkNRFusJVACNYDbs4jaKfb5Avs5N_8:1pLyoI:NoodB-89O3wDcxV4oKLiA4dvtDkjKKL1k25aShSNvwQ','2023-02-12 11:56:54.536990');

/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 message
# ------------------------------------------------------------

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) DEFAULT NULL,
  `content` longtext,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `release_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `to_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `message_release_id_2ae71c18_fk_release_id` (`release_id`),
  KEY `message_user_id_60e6a50a_fk_user_id` (`user_id`),
  KEY `message_to_user_id_2e13a1cc_fk_user_id` (`to_user_id`),
  CONSTRAINT `message_release_id_2ae71c18_fk_release_id` FOREIGN KEY (`release_id`) REFERENCES `release` (`id`),
  CONSTRAINT `message_to_user_id_2e13a1cc_fk_user_id` FOREIGN KEY (`to_user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `message_user_id_60e6a50a_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;

INSERT INTO `message` (`id`, `pid`, `content`, `created_at`, `updated_at`, `release_id`, `user_id`, `to_user_id`)
VALUES
	(1,0,'诸葛青，你败过吗？','2023-01-29 17:12:45.996031','2023-01-29 17:12:45.996048',1,1,NULL),
	(2,1,'王也，你被埋过吗？','2023-01-29 17:15:33.071459','2023-01-29 17:15:33.071495',1,2,1),
	(3,0,'他们总说我瓜，其实我一点也不瓜，大多时候我都机智的一批','2023-01-29 17:15:52.162267','2023-01-29 17:15:52.162297',1,2,NULL),
	(4,3,'我机智你奶奶个腿儿啊，要不是打不过你，我非敲烂你这颗机智的头，你哪偷的铁锹，你到底多爱埋人！\n我机智你奶奶个腿儿啊，要不是打不过你，我非敲烂你这颗机智的头，你哪偷的铁锹，你到底多爱埋人！\n我机智你奶奶个腿儿啊，要不是打不过你，我非敲烂你这颗机智的头，你哪偷的铁锹，你到底多爱埋人！\n我机智你奶奶个腿儿啊，要不是打不过你，我非敲烂你这颗机智的头，你哪偷的铁锹，你到底多爱埋人！','2023-01-29 17:15:52.162267','2023-01-29 17:15:52.162297',1,3,2),
	(5,3,'你这也太溜了！','2023-01-29 17:15:52.162267','2023-01-29 17:15:52.162297',1,1,2),
	(6,3,'没啥子，维手熟尔！','2023-01-29 17:15:52.162267','2023-01-29 17:15:52.162297',1,2,1),
	(10,1,'宝儿姐牛蛙！','2023-02-12 12:27:05.248146','2023-02-12 12:27:05.248179',1,1,1),
	(11,3,'回复张楚岚。。。','2023-02-12 12:29:56.833110','2023-02-12 12:29:56.833185',1,1,3),
	(12,0,'服了你这个老六','2023-02-12 15:16:29.096531','2023-02-12 15:16:29.096556',1,1,NULL),
	(13,0,'老铁666','2023-02-12 15:50:20.498459','2023-02-12 15:50:20.498511',2,1,NULL),
	(14,0,'马村长被带走了','2023-02-12 15:51:19.615536','2023-02-12 15:51:19.615635',2,1,NULL),
	(19,0,'妙啊','2023-02-12 18:55:00.894597','2023-02-12 18:55:00.894657',1,11,NULL);

/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 release
# ------------------------------------------------------------

DROP TABLE IF EXISTS `release`;

CREATE TABLE `release` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `type` varchar(1) NOT NULL,
  `status` varchar(1) NOT NULL,
  `event_at` datetime(6) DEFAULT NULL,
  `event_place` varchar(255) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `release_user_id_7ab184e9_fk_user_id` (`user_id`),
  CONSTRAINT `release_user_id_7ab184e9_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `release` WRITE;
/*!40000 ALTER TABLE `release` DISABLE KEYS */;

INSERT INTO `release` (`id`, `name`, `desc`, `image`, `type`, `status`, `event_at`, `event_place`, `created_at`, `updated_at`, `user_id`)
VALUES
	(1,'水杯','蓝色的水杯','图片地址','1','0','2023-01-29 12:35:09.340398','A座三层会议室丢失','2023-01-29 12:35:09.340439','2023-01-29 12:35:09.340450',1),
	(2,'水杯','在教室捡到一个蓝色的水杯','图片地址','1','1','2023-02-11 17:30:59.975242','A座三层会议室','2023-01-29 12:36:25.430623','2023-02-11 17:30:59.975258',1),
	(3,'鼠标','白色的罗技鼠标','地址','2','0','2023-02-11 17:30:59.975242','教学楼','2023-01-29 12:36:25.430623','2023-01-29 12:36:25.430623',2);

/*!40000 ALTER TABLE `release` ENABLE KEYS */;
UNLOCK TABLES;


# 转储表 user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL,
  `nick_name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `sex` varchar(1) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `age` varchar(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_user_name_37cba673_uniq` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `user_name`, `nick_name`, `password`, `sex`, `phone`, `created_at`, `updated_at`, `age`)
VALUES
	(1,'test','王也','test','1','00017118848','2023-01-28 12:00:00.000000','2023-01-28 12:00:00.000000',''),
	(2,'erlou','冯宝宝','test','0','','2023-01-28 12:00:00.000000','2023-01-28 12:00:00.000000',''),
	(3,'sanlou','张楚岚','test','1','','2023-01-28 12:00:00.000000','2023-01-28 12:00:00.000000',''),
	(4,'测试注册','诸葛青','1234567','1','00017580000','2023-01-29 18:04:57.990617','2023-01-29 18:04:57.990664',''),
	(11,'测试','虎哥','1234567','1','00017580000','2023-01-29 18:26:49.596129','2023-01-29 18:26:49.596149',''),
	(13,'Tiger','虎虎呀','1234567','1','00017580000','2023-02-12 20:37:05.427064','2023-02-12 20:37:05.427173',''),
	(14,'yaya','鸭鸭','1234','1','134','2023-02-12 20:42:54.411973','2023-02-12 20:42:54.411998','18');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
