/*
SQLyog Community Edition- MySQL GUI v7.15 
MySQL - 5.5.29 : Database - Water_Distribution_Attacks
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`Water_Distribution_Attacks` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `Water_Distribution_Attacks`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add client register_ model',7,'add_clientregister_model'),(20,'Can change client register_ model',7,'change_clientregister_model'),(21,'Can delete client register_ model',7,'delete_clientregister_model'),(22,'Can add detect_iot_botnet_attacks',8,'add_detect_iot_botnet_attacks'),(23,'Can change detect_iot_botnet_attacks',8,'change_detect_iot_botnet_attacks'),(24,'Can delete detect_iot_botnet_attacks',8,'delete_detect_iot_botnet_attacks'),(25,'Can add detection_accuracy',9,'add_detection_accuracy'),(26,'Can change detection_accuracy',9,'change_detection_accuracy'),(27,'Can delete detection_accuracy',9,'delete_detection_accuracy'),(28,'Can add detection_ratio',10,'add_detection_ratio'),(29,'Can change detection_ratio',10,'change_detection_ratio'),(30,'Can delete detection_ratio',10,'delete_detection_ratio'),(31,'Can add pesticide_ poisoning_ diagnosis',11,'add_pesticide_poisoning_diagnosis'),(32,'Can change pesticide_ poisoning_ diagnosis',11,'change_pesticide_poisoning_diagnosis'),(33,'Can delete pesticide_ poisoning_ diagnosis',11,'delete_pesticide_poisoning_diagnosis'),(34,'Can add pesticide_ poisoning_ diagnosis_accuracy',12,'add_pesticide_poisoning_diagnosis_accuracy'),(35,'Can change pesticide_ poisoning_ diagnosis_accuracy',12,'change_pesticide_poisoning_diagnosis_accuracy'),(36,'Can delete pesticide_ poisoning_ diagnosis_accuracy',12,'delete_pesticide_poisoning_diagnosis_accuracy'),(37,'Can add stator_ imbalance_ defect',13,'add_Water_Distribution_Attacks'),(38,'Can change stator_ imbalance_ defect',13,'change_Water_Distribution_Attacks'),(39,'Can delete stator_ imbalance_ defect',13,'delete_Water_Distribution_Attacks');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'Remote_User','clientregister_model'),(9,'Remote_User','detection_accuracy'),(10,'Remote_User','detection_ratio'),(8,'Remote_User','detect_iot_botnet_attacks'),(11,'Remote_User','pesticide_poisoning_diagnosis'),(12,'Remote_User','pesticide_poisoning_diagnosis_accuracy'),(13,'Remote_User','Water_Distribution_Attacks'),(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'Remote_User','0001_initial','2024-08-07 11:31:13'),(2,'contenttypes','0001_initial','2024-08-07 11:31:13'),(3,'auth','0001_initial','2024-08-07 11:31:14'),(4,'admin','0001_initial','2024-08-07 11:31:15'),(5,'admin','0002_logentry_remove_auto_add','2024-08-07 11:31:15'),(6,'contenttypes','0002_remove_content_type_name','2024-08-07 11:31:15'),(7,'auth','0002_alter_permission_name_max_length','2024-08-07 11:31:15'),(8,'auth','0003_alter_user_email_max_length','2024-08-07 11:31:15'),(9,'auth','0004_alter_user_username_opts','2024-08-07 11:31:15'),(10,'auth','0005_alter_user_last_login_null','2024-08-07 11:31:15'),(11,'auth','0006_require_contenttypes_0002','2024-08-07 11:31:15'),(12,'auth','0007_alter_validators_add_error_messages','2024-08-07 11:31:15'),(13,'auth','0008_alter_user_username_max_length','2024-08-07 11:31:15'),(14,'auth','0009_alter_user_last_name_max_length','2024-08-07 11:31:15'),(15,'sessions','0001_initial','2024-08-07 11:31:15');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('08snhdsayx8ns06yhe19rdyvnabjn8iy','eyJ1c2VyaWQiOjF9:1oFx6B:3_h3tiP91115hfoAJl2N8umQpJF5Lg0b3BH7VQg2w4o','2022-08-08 12:22:11'),('0doxd89lelsb62hh61y1u9xvhgis91ks','eyJ1c2VyaWQiOjE5fQ:1mDlBs:xxj-bSmT5wd80FZ0QPs9yzR1wUnf-8naNjRRmgbWt-4','2021-08-25 10:10:28'),('0jpcgnd1gmwbp3e8tw54e6nxjylsogyo','YmM4NjE0MDQ2MzBmYWIxNzIzNTkxZjBiN2I5M2MxMzQyYTE0YmMxODp7InVzZXJpZCI6Mn0=','2020-02-21 08:52:28'),('1avxwyhltuaclq2zfq40bjmwzxgup6hp','eyJ1c2VyaWQiOjJ9:1ml5JO:9_XIwCjkeG7Vu6-k169B1gbde6aRX-mqiwhgCKNqrRA','2021-11-25 08:19:58'),('49qo7iki5uxczhyymi8ka7dnh6a2wva5','MmE4N2EzZmM3NTI1ODc3MjUxYjUxNWM3OWM4ZGExNWViMzRkN2MzYTp7Im5hbWUiOjF9','2019-05-08 09:19:45'),('4df7s82pddaszour6twx23d86058ppjq','ZmNkODA5MmI1ZGQ0Yjk5MmZlNzEyNTcwNTcxNjk2ZWYxZTE3NThkMjp7InVzZXJpZCI6NX0=','2020-11-23 11:49:21'),('4io28d085qjfib7a5s2qbhc8qp4wfiva','eyJ1c2VyaWQiOjE2fQ:1mAtmi:oIUbcN3WzJiaWnxMBZ6eIGMTo8NS2y701JlpwqvzBUk','2021-08-17 12:44:40'),('4x6b78w9rfcn34v650kd2j7oij6atr8p','Zjk0Y2RlYjc4OTJhNWMyZjQyNmM4ZGRhYTVjNmVlNDFhZGE4ZmU3NTp7InVzZXJpZCI6Nn0=','2019-12-27 12:07:42'),('6h7f2lif2b5xzckoqy0dzpuf2ssln6u6','eyJ1c2VyaWQiOjJ9:1oOxNy:rn921d2FdMCS42DJKaBJnAlT20byTRiY2P4X7Wm76Qc','2022-09-02 08:29:46'),('7ai80sml3hwq0jsvdfl1vm5m13x8d8k9','eyJ1c2VyaWQiOjF9:1mt5vR:3pScFzSqVCPEshZhoFMwZb-rfCX09_pAUFEuMV8fNKA','2021-12-17 10:36:21'),('7ixdamflp4fqyjecn17bd7xfbsi7eowq','eyJ1c2VyaWQiOjEwfQ:1mBzQr:5DfHs08xtygiklJxfW3kZFCrxnrA_igxR5gbDcKt2e8','2021-08-20 12:58:37'),('7ph664obz14m207786d3oubrzgjnisom','eyJ1c2VyaWQiOjN9:1ml5U2:RJ7eMbREY4fk71sBmCItxM6E3kDDc-R-clIp-QGiiuI','2021-11-25 08:30:58'),('7rdyzoqfblzy8bzyqws1ui918341wejx','YmM4NjE0MDQ2MzBmYWIxNzIzNTkxZjBiN2I5M2MxMzQyYTE0YmMxODp7InVzZXJpZCI6Mn0=','2024-09-04 08:21:57'),('9vom7mmn5muyoiy8nytc9mxown1q1g2b','eyJ1c2VyaWQiOjE5fQ:1mDRHr:QCoJ_gmMMx_cxknA5j_5NlcTLnENHFouosRuxYZlYbI','2021-08-24 12:55:19'),('amrgjvpebgpe0zriw4hpttkhsjwzn2xe','eyJ1c2VyaWQiOjF9:1oYPgL:WYtKTH_wYINNeXvB4a8O4T-va8TBm-_RPm2w6Y9xYD0','2022-09-28 10:31:49'),('au3tqhab9csr4r2g5p8wxgktebzxone0','eyJ1c2VyaWQiOjExfQ:1mexd7:BmPTZn93Z2602ApV03LTh7BmDypyoNMN2YRKctHrGF8','2021-11-08 10:55:01'),('b9cu6cjsfqfm5mame5dy1ikpiiy7yn3w','OTk3NTk2YTE0NjM5MWQ0OGQ0MjY3NzBjNzdhOTc0ZWJhM2ZkMzdkMjp7InVzZXJpZCI6MX0=','2019-05-09 11:00:08'),('bhfid9lacfwlfi5yu3rgdg1uo5fp2bq8','eyJ1c2VyaWQiOjE4fQ:1mBH4F:2wUorkPET_MGY07bWd-Zp-9HZUsjS3bGCHCu1j6BN-s','2021-08-18 13:36:19'),('ct13q5fpn94zvnij8ekixwzcky2imc5e','YWUzM2IzMWJiYmQ3YmY2YzlkMGFlNTM1YmU5ZGM4YjQ0MmY1YTc0NTp7InVzZXJpZCI6NH0=','2019-05-14 11:44:10'),('e07j4duysh402dedtomm8icctvs9ljgy','MmE4N2EzZmM3NTI1ODc3MjUxYjUxNWM3OWM4ZGExNWViMzRkN2MzYTp7Im5hbWUiOjF9','2019-05-09 06:08:12'),('fq0czwxzas1e5bjz5cx5pr6ytm8uhejy','eyJ1c2VyaWQiOjExfQ:1mfKoD:eQbeRUgZ8NFqCleEdS6fE0NAoRs3zn6_B82CZb4YtiQ','2021-11-09 11:40:01'),('g7nuag90xjhnh9u95i20nypedy1z6qdq','eyJ1c2VyaWQiOjN9:1oYRqG:HUdDJ2Z2-FYWfKfiOCzL3k5yQ_OS4o68mpY6iJv1KuE','2022-09-28 12:50:12'),('gq3vdjxoy34hxkorw2d8nztdusdknegl','eyJ1c2VyaWQiOjF9:1mpUvs:Lry5yh51WzsY8judWu-ApNb05fEC5oHytMQ9bZSqbGU','2021-12-07 12:29:56'),('gsqk7v1ei7yhuvcbxw6r8vxhgbuzz7zx','eyJ1c2VyaWQiOjJ9:1mkkhL:_T8wyqi-MJi-K7_a-0EPz-h6HRouyRfpeAhHqTS5N04','2021-11-24 10:19:19'),('h2up0dvopjvwswxnvprj7id9lgrivhus','eyJ1c2VyaWQiOjIzfQ:1mfM3f:FAuAUdY-ly6qun6t571yt1pYKVGhXfjbjhiruld5rNs','2021-11-09 13:00:03'),('hbv74sg6w6e4wp89vq807vw0xhkh5s1h','MzU0ZWYzNTQ3MjM4MWZlOTVjM2M1MWQ4MmE5ODE0OTlkNDRkNDkwMDp7InVzZXJpZCI6MX0=','2020-01-10 07:40:38'),('hhtt48je70l9nzw6dee4ocuxxm9blqej','NGRhY2JkNmQ4ZTM4OTU0Y2UzMzFlZmZmOTgzYmE0MWVkOThiNjc2NTp7Im5hbWUiOjEsInVzZXJpZCI6MX0=','2019-05-09 10:12:38'),('hsb5814on7cph0wvy0yls67ca94ngcq3','eyJ1c2VyaWQiOjE5fQ:1mBzgz:cug3sAkQKH-bQBkB9O5l0UsDJL-37eDV8mR9Qau3elA','2021-08-20 13:15:17'),('i530ldontosd9c37rlmr7i190cc8j54c','eyJ1c2VyaWQiOjExfQ:1mfGFZ:PSpZPmdPYnGzwCScqY4tYBkDj8BMVATwweZjjxmG5dk','2021-11-09 06:47:57'),('i77fui9jgj9yk7ncx7u4ph5d6kg0nl6c','eyJ1c2VyaWQiOjE5fQ:1mDPJC:kqt800XGsVGRjHS3TmeLFrJbrpIK4-GbH4ZirwIc7S4','2021-08-24 10:48:34'),('ic3hqykgws5iy6fz5ns6h6f921jbjzmt','eyJ1c2VyaWQiOjExfQ:1kywHL:I_tahJ0VJb7myAbMbXpWZu9XrSaAMmduNxGd2x5gtmY','2021-01-25 12:26:35'),('iz6wcyx97x1w6mpfc51g1tj72z2xghfn','eyJ1c2VyaWQiOjl9:1kwlIp:YKOKMwJARe6w057AKTGY1-GCuRcZAeAbJ0bdQao23wY','2021-01-19 12:19:07'),('jgcbya9z2s6b6mmldfv28lm18imc73m8','eyJ1c2VyaWQiOjIxfQ:1mDnYP:GTRQ2I-UYLdsCCyA0-WsFSAVBNno1wLo6lk4M8JS0OU','2021-08-25 12:41:53'),('jpkxxiej4bdjin5tpdjm0xqhdooexz9o','eyJ1c2VyaWQiOjExfQ:1mBEdk:YOk6fHHfBMmtt5ZvSyzgy13Az8JS59iXbU4LO1Ps1RI','2021-08-18 11:00:48'),('jupxwzh2ju8mudr1u77lc1skx2wgxb9c','YmM4NjE0MDQ2MzBmYWIxNzIzNTkxZjBiN2I5M2MxMzQyYTE0YmMxODp7InVzZXJpZCI6Mn0=','2024-09-03 10:38:42'),('k7dyn4irgrj5wb4jucb4po527iw724dp','eyJ1c2VyaWQiOjEzfQ:1l0JrY:2_TJ4L_XoHdOW51Zdp0MOdyBEZEzntk5pdXZFDmX9x4','2021-01-29 07:49:40'),('ktjsa2dwmkzggkc8htfro0m1zf2kt78d','eyJ1c2VyaWQiOjI0fQ:1mfiev:rUgpc2VOr-8MQnmWwZsSVM_IqXQAA3Bacheqmp_LQ2o','2021-11-10 13:08:01'),('kxla8qbe1hs1tb4a04ewpmdmi5fx1evc','eyJ1c2VyaWQiOjJ9:1mpVxM:dUv2r33P7CFNLdnAjy8jCk-OJOlisN07sHd5Rf7zCLg','2021-12-07 13:35:32'),('ndkx5ijkx13lw2weujqh7uawciwcjc2g','MzU0ZWYzNTQ3MjM4MWZlOTVjM2M1MWQ4MmE5ODE0OTlkNDRkNDkwMDp7InVzZXJpZCI6MX0=','2025-01-01 07:50:10'),('o7x1vhluuypdfmgv7fmv6nohgfn5ub55','NzMyZjlhNzFhZjk2ZGUzZmFiMmIzYjMwNTJkYTg5MDUzNmNlMDk4Mjp7InVzZXJpZCI6MTZ9','2020-01-02 12:51:55'),('oc4pzt7ijx1rzj09m2ve6b6y5uwc6wt5','eyJ1c2VyaWQiOjF9:1mkk7W:6GDuPOPoLHMwOYLys3lXIgfM79Fq36HHW31-utzbeyk','2021-11-24 09:42:18'),('owqt9fqa6pkheboduh6f4k5p4lkwj0yc','eyJ1c2VyaWQiOjExfQ:1mfiXk:Wzn12pygxu_2Z1TzCSC4bKDawuXj_i7_BFLhJjKx-10','2021-11-10 13:00:36'),('psdjoq42u7lfqwfodftic5x6z9ij34nk','eyJ1c2VyaWQiOjExfQ:1mAXDq:a8YYY1YJU3jPv03qo9-VcrjRHnDWRSqGseiR93n0GVM','2021-08-16 12:39:10'),('q6hp9a2l9dbrclvox0o02x1aamx1ukj7','eyJ1c2VyaWQiOjIyfQ:1mfGz3:wkq7ZgyB738cK3Jugrc0viqb3eI1C0gWhyypHF_DE-A','2021-11-09 07:34:57'),('qnaolidvfx6bu9ra3uyqvkgva7bv92f1','OTk3NTk2YTE0NjM5MWQ0OGQ0MjY3NzBjNzdhOTc0ZWJhM2ZkMzdkMjp7InVzZXJpZCI6MX0=','2019-05-14 05:34:50'),('r0lswf36qh5gt0i2afmqqeu550j9vohq','eyJ1c2VyaWQiOjF9:1oOvxv:-o0Ngd4h_vqB4DUhIuathTt7_CkrfaHFDCAmdaRTbwU','2022-09-02 06:58:47'),('r9qk0kd407g591hugz99fhps8zofh69s','eyJ1c2VyaWQiOjE4fQ:1mBxnG:qkd9MTM_FhhghUpV90qngEkwkoSKYdLbfwRKBLhK7Qg','2021-08-20 11:13:38'),('rfq3uvadj7qsqrz7qlcyie9wscsqz1nr','eyJ1c2VyaWQiOjI1fQ:1mk2vF:mTIne3EU3rECWccrUfyPmy7XxIwdAzxhig4S5oOngho','2021-11-22 11:34:45'),('rn48bwukkb2yv60kvkacr8nc0njr5xky','eyJ1c2VyaWQiOjExfQ:1mfggv:xsbmrrGzxtrEFgspA0Wp7oWTp9qDl0shDSlGG8fHJo4','2021-11-10 11:01:57'),('s7ui2zx2cslubpch6dm7iaxlz2wlsdgg','eyJ1c2VyaWQiOjExfQ:1mk1Xz:fpol-krFazPxkK0b4gEoocpOXHcd-eaYoxg26CU420Q','2021-11-22 10:06:39'),('sdcvtwp7s5yj8q1lb0mdvlg8nj5wujqo','eyJ1c2VyaWQiOjEyfQ:1kzJ3p:0g6nRuJv3TXWVpANqNgbJcrUv96ZU5UQwv3bgqBbL1I','2021-01-26 12:46:09'),('tejgl09oettnyva23kqdbns5nfz5g8ug','OTk3NTk2YTE0NjM5MWQ0OGQ0MjY3NzBjNzdhOTc0ZWJhM2ZkMzdkMjp7InVzZXJpZCI6MX0=','2019-05-09 11:19:24'),('tx26u0gjaebi1m6miqvms83dw452rw7c','eyJ1c2VyaWQiOjExfQ:1mg01H:i0OHhHK7t2WdfySWwMXXs92TaT7Vn1UQf2i0eZBO70s','2021-11-11 07:40:15'),('u5icgvq3qt5nthdlv99go3r804ccghbo','MmE4N2EzZmM3NTI1ODc3MjUxYjUxNWM3OWM4ZGExNWViMzRkN2MzYTp7Im5hbWUiOjF9','2019-05-09 06:00:13'),('ws2o4cq1jbqepe0e9s9v7n4erxatq9ic','eyJ1c2VyaWQiOjE1fQ:1l2CgI:SmlpAnZzplZhPTFJ_rkEJstnZRl2CYWyTcah7PHPv-M','2021-02-03 12:33:50'),('x5tpr0r7bu57jws6fpdwhi841252o6o2','eyJ1c2VyaWQiOjJ9:1oFxxT:uvC1LIN0lwgSyiMgEmEl1yH9W_bC1GTe5QDFsBdOQqM','2022-08-08 13:17:15'),('xc6si4gdotxq06mslnwwjtewdhzuyh44','eyJ1c2VyaWQiOjR9:1mnfuL:VMKdQ2gcb4wQppelEf-wAdfTSSkA6nWPCeQODqD3NOM','2021-12-02 11:48:49'),('zega5sz46ivu1tb1o1mtmg3v2ysxog1w','eyJ1c2VyaWQiOjh9:1kuVm4:L7RizVvw4EC0IyYCYAIhGjC8lvZol_Z1abqVwdkdKkY','2021-01-13 07:20:00'),('zq2idu1e3gkyelhzpa24k5jixqhj74da','eyJ1c2VyaWQiOjJ9:1mne5B:sOSzXh5WGI5se1746XNpUgE1_UZZw07Xzb03KIcZXfY','2021-12-02 09:51:53'),('zqfzqdolomzyjb8lckwouaztv90i58gi','eyJ1c2VyaWQiOjJ9:1mt6QE:e6TQ4CyC7rlTpZA0HyGK2zrDnv_EbGQrGGZUzgCcnCM','2021-12-17 11:08:10');

/*Table structure for table `remote_user_clientposts_model` */

DROP TABLE IF EXISTS `remote_user_clientposts_model`;

CREATE TABLE `remote_user_clientposts_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tdesc` varchar(300) NOT NULL,
  `uname` varchar(300) NOT NULL,
  `topics` varchar(300) NOT NULL,
  `sanalysis` varchar(300) NOT NULL,
  `senderstatus` varchar(300) NOT NULL,
  `ratings` int(11) NOT NULL,
  `userId_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Remote_User_clientpo_userId_id_12cefab2_fk_Remote_Us` (`userId_id`),
  CONSTRAINT `Remote_User_clientpo_userId_id_12cefab2_fk_Remote_Us` FOREIGN KEY (`userId_id`) REFERENCES `remote_user_clientregister_model` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `remote_user_clientposts_model` */

/*Table structure for table `remote_user_clientregister_model` */

DROP TABLE IF EXISTS `remote_user_clientregister_model`;

CREATE TABLE `remote_user_clientregister_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(10) NOT NULL,
  `phoneno` varchar(10) NOT NULL,
  `country` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `gender` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `remote_user_clientregister_model` */

insert  into `remote_user_clientregister_model`(`id`,`username`,`email`,`password`,`phoneno`,`country`,`state`,`city`,`gender`,`address`) values (1,'shanthan','myraprojects@gmail.com','shan','7702177291','India','Telangana','Hyderabad','Male','ameerpet 518');

/*Table structure for table `remote_user_detection_accuracy` */

DROP TABLE IF EXISTS `remote_user_detection_accuracy`;

CREATE TABLE `remote_user_detection_accuracy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(300) NOT NULL,
  `ratio` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

/*Data for the table `remote_user_detection_accuracy` */

/*Table structure for table `remote_user_detection_ratio` */

DROP TABLE IF EXISTS `remote_user_detection_ratio`;

CREATE TABLE `remote_user_detection_ratio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(300) NOT NULL,
  `ratio` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `remote_user_detection_ratio` */

/*Table structure for table `remote_user_Water_Distribution_Attacks` */

DROP TABLE IF EXISTS `remote_user_Water_Distribution_Attacks`;

CREATE TABLE `remote_user_Water_Distribution_Attacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Pump_Speed` varchar(3000) NOT NULL,
  `Flow_Rate` varchar(3000) NOT NULL,
  `pH_Level` varchar(3000) NOT NULL,
  `Chlorine_Level` varchar(3000) NOT NULL,
  `Turbidity` varchar(3000) NOT NULL,
  `Temperature` varchar(3000) NOT NULL,
  `Pressure` varchar(3000) NOT NULL,
  `Operational_Status` varchar(3000) NOT NULL,
  `Quality_Flag` varchar(3000) NOT NULL,
  `Sensor_ID` varchar(3000) NOT NULL,
  `Prediction` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `remote_user_Water_Distribution_Attacks` */
 
/*Table structure for table `remote_user_Water_Distribution_Attacks_accuracy` */

DROP TABLE IF EXISTS `remote_user_Water_Distribution_Attacks_accuracy`;

CREATE TABLE `remote_user_Water_Distribution_Attacks_accuracy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `names` varchar(300) NOT NULL,
  `ratio` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `remote_user_Water_Distribution_Attacks_accuracy` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
