DROP TABLE IF EXISTS blacklists;

CREATE TABLE `blacklists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO blacklists VALUES('1','Test','file:///C:/Users/Francis/Desktop/VENUS/index.html','5','2019-03-22 09:39:19','2019-03-22 09:39:19');



DROP TABLE IF EXISTS canned_messages;

CREATE TABLE `canned_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO canned_messages VALUES('1','How can help?','How can i help you sir?','5','2019-03-22 09:33:04','2019-03-22 09:33:04');



DROP TABLE IF EXISTS chat_requests;

CREATE TABLE `chat_requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guest_id` int(11) NOT NULL,
  `operator_id` int(11) DEFAULT NULL,
  `guest_is_typing` int(11) NOT NULL DEFAULT '0',
  `operator_is_typing` int(11) NOT NULL DEFAULT '0',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO chat_requests VALUES('1','1','6','0','0','chat_start','2019-03-21 14:59:16','2019-03-21 15:00:18');
INSERT INTO chat_requests VALUES('2','2','6','0','0','chat_end','2019-03-21 15:07:38','2019-03-21 16:11:55');
INSERT INTO chat_requests VALUES('3','3','2','0','0','chat_start','2019-03-21 15:13:21','2019-03-21 15:13:29');
INSERT INTO chat_requests VALUES('4','4','6','0','0','chat_start','2019-03-22 15:30:33','2019-03-22 15:31:15');



DROP TABLE IF EXISTS companies;

CREATE TABLE `companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid_to` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO companies VALUES('1','Software Factory','active','2019-04-30','2019-03-21 06:39:07','2019-03-21 06:50:23');
INSERT INTO companies VALUES('5','TrickyCode','active','2019-04-30','2019-03-21 07:04:31','2019-03-21 07:33:34');



DROP TABLE IF EXISTS company_settings;

CREATE TABLE `company_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO company_settings VALUES('1','primary_color','#2e9ce6','5','2019-03-21 10:10:35','2019-03-22 09:37:18');
INSERT INTO company_settings VALUES('2','secondary_color','#45d65b','5','2019-03-21 10:10:35','2019-03-22 09:37:18');
INSERT INTO company_settings VALUES('3','label_color','#ffffff','5','2019-03-21 10:10:35','2019-03-22 09:37:18');
INSERT INTO company_settings VALUES('4','heading_text','Live Tricky Chat','5','2019-03-21 10:10:35','2019-03-22 09:37:18');
INSERT INTO company_settings VALUES('5','offline_text','Hi, Currently We are not available !','5','2019-03-21 10:10:35','2019-03-22 09:37:18');
INSERT INTO company_settings VALUES('6','email','trickycode93@gmail.com','5','2019-03-21 10:10:35','2019-03-22 09:37:18');
INSERT INTO company_settings VALUES('7','widget_direction','right','5','2019-03-21 10:10:35','2019-03-22 09:37:18');
INSERT INTO company_settings VALUES('8','file_sharing','yes','5','2019-03-21 10:10:35','2019-03-22 09:37:18');
INSERT INTO company_settings VALUES('9','allow_department','yes','5','2019-03-21 10:10:35','2019-03-22 09:37:18');
INSERT INTO company_settings VALUES('10','language','English','5','2019-03-21 10:10:35','2019-03-22 09:37:18');
INSERT INTO company_settings VALUES('11','mobile_version_breakpoint','768','5','2019-03-21 10:10:35','2019-03-22 09:37:18');
INSERT INTO company_settings VALUES('12','mobile_field','no','5','2019-03-21 10:10:35','2019-03-22 09:37:18');
INSERT INTO company_settings VALUES('13','offline_mode','no','5','2019-03-21 10:20:07','2019-03-22 09:10:29');



DROP TABLE IF EXISTS departments;

CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `department` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `company_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO departments VALUES('1','General','','5','2019-03-21 09:09:17','2019-03-21 09:09:17');



DROP TABLE IF EXISTS guests;

CREATE TABLE `guests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_picture` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO guests VALUES('1','jackob','jackob@gmail.com','','0','http://localhost/tricky_chat_saas/widget_preview','::1','male_guest.png','2019-03-21 15:05:16','5','2019-03-21 14:59:16','2019-03-21 15:05:16');
INSERT INTO guests VALUES('2','jackob','jackob@gmail.com','','0','http://localhost/tricky_chat_saas/widget_preview','::1','male_guest.png','2019-03-21 16:11:52','5','2019-03-21 15:07:38','2019-03-21 16:11:52');
INSERT INTO guests VALUES('3','Jony','jony@gmail.com','','0','http://localhost/tricky_chat_saas/widget_preview','::1','male_guest.png','2019-03-21 15:13:38','1','2019-03-21 15:13:21','2019-03-21 15:13:38');
INSERT INTO guests VALUES('4','Danny','danny@gmail.com','','1','file:///C:/Users/Francis/Desktop/VENUS/index.html','::1','male_guest.png','2019-03-22 15:42:43','5','2019-03-22 15:30:33','2019-03-22 15:42:43');



DROP TABLE IF EXISTS messages;

CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `chat_request_id` int(11) NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `sender` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `receiver` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO messages VALUES('1','1','jackob Has Started Chat Conversation','1','guest','operator','2019-03-21 14:59:16','2019-03-21 09:05:06');
INSERT INTO messages VALUES('2','1','Tricky Code Has Joined To Chat Conversation','1','operator','guest','2019-03-21 15:00:18','2019-03-21 09:05:06');
INSERT INTO messages VALUES('3','2','jackob Has Started Chat Conversation','1','guest','operator','2019-03-21 15:07:38','2019-03-21 09:18:36');
INSERT INTO messages VALUES('4','2','Tricky Code Has Joined To Chat Conversation','1','operator','guest','2019-03-21 15:07:48','2019-03-21 09:18:36');
INSERT INTO messages VALUES('5','2','Hi','1','operator','guest','2019-03-21 15:12:37','2019-03-21 09:18:36');
INSERT INTO messages VALUES('6','2','hello','1','guest','operator','2019-03-21 15:12:45','2019-03-21 09:18:36');
INSERT INTO messages VALUES('7','3','Jony Has Started Chat Conversation','1','guest','operator','2019-03-21 15:13:21','2019-03-21 09:13:43');
INSERT INTO messages VALUES('8','3','Francis kennedy Has Joined To Chat Conversation','1','operator','guest','2019-03-21 15:13:29','2019-03-21 09:13:43');
INSERT INTO messages VALUES('9','2','Hi','1','guest','operator','2019-03-21 15:14:20','2019-03-21 09:18:36');
INSERT INTO messages VALUES('10','2','sdfdsf','1','operator','guest','2019-03-21 15:17:08','2019-03-21 09:18:36');
INSERT INTO messages VALUES('11','2','sdfsdf<br>','1','guest','operator','2019-03-21 15:17:13','2019-03-21 09:18:36');
INSERT INTO messages VALUES('12','2','<span class=\'chat_ended\'><i class=\'fa fa-sign-out\'></i> jackob Has Ended Chat Session.</span>','0','guest','operator','2019-03-21 16:11:55','2019-03-21 16:11:55');
INSERT INTO messages VALUES('13','4','Danny Has Started Chat Conversation','1','guest','operator','2019-03-22 15:30:33','2019-03-22 09:34:15');
INSERT INTO messages VALUES('14','4','Tricky Code Has Joined To Chat Conversation','1','operator','guest','2019-03-22 15:31:15','2019-03-22 09:34:15');



DROP TABLE IF EXISTS migrations;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO migrations VALUES('1','2014_10_12_000000_create_users_table','1');
INSERT INTO migrations VALUES('2','2014_10_12_100000_create_password_resets_table','1');
INSERT INTO migrations VALUES('3','2018_06_01_080940_create_settings_table','1');
INSERT INTO migrations VALUES('4','2018_09_25_071732_create_departments_table','1');
INSERT INTO migrations VALUES('5','2018_09_25_071811_create_canned_messages_table','1');
INSERT INTO migrations VALUES('6','2018_10_18_082257_create_guests_table','1');
INSERT INTO migrations VALUES('7','2018_10_20_113010_create_chat_requests_table','1');
INSERT INTO migrations VALUES('8','2018_10_20_122018_create_messages_table','1');
INSERT INTO migrations VALUES('9','2018_10_22_160146_create_blacklists_table','1');
INSERT INTO migrations VALUES('10','2019_02_25_041857_create_offline_messages_table','1');
INSERT INTO migrations VALUES('11','2019_03_21_052934_create_companies_table','2');
INSERT INTO migrations VALUES('12','2019_03_19_123527_create_company_settings_table','3');



DROP TABLE IF EXISTS offline_messages;

CREATE TABLE `offline_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `company_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS password_resets;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS settings;

CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO settings VALUES('1','timezone','Indian/Chagos','','2019-03-21 04:51:46');
INSERT INTO settings VALUES('2','mail_type','mail','','');
INSERT INTO settings VALUES('3','backend_direction','ltr','','');
INSERT INTO settings VALUES('4','widget_direction','right','','');
INSERT INTO settings VALUES('5','mobile_version_breakpoint','768','','');
INSERT INTO settings VALUES('6','chatting_refresh_rate','5','','');
INSERT INTO settings VALUES('7','user_tracking_refresh_rate','8','','');
INSERT INTO settings VALUES('8','message_sound','default.mp3','','');
INSERT INTO settings VALUES('9','max_upload_size','2','','');
INSERT INTO settings VALUES('10','file_sharing','yes','','');
INSERT INTO settings VALUES('11','file_type_supported','doc,jpg,jpeg,png,pdf,docx,zip','','');
INSERT INTO settings VALUES('12','allow_department','no','','');
INSERT INTO settings VALUES('13','company_name','Tricky Code','2019-03-21 04:51:46','2019-03-21 04:51:46');
INSERT INTO settings VALUES('14','site_title','Tricky Chat SaaS','2019-03-21 04:51:46','2019-03-21 04:51:46');
INSERT INTO settings VALUES('15','phone','+444-444-444','2019-03-21 04:51:46','2019-03-21 04:51:46');
INSERT INTO settings VALUES('16','email','trickycode93@gmail.com','2019-03-21 04:51:46','2019-03-21 04:51:46');



DROP TABLE IF EXISTS users;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `profile_picture` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_activity` datetime DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES('1','Super Admin','admin@demo.com','$2y$10$7yjVhuIfWBLQEHZL8Vtgd.O6gzN35bv3pfq8EQDAOfhCflipDPsKO','super_admin','','','','2019-03-22 15:44:41','EWDvL6X8yCtNN3WWC9HDZLEI4yuRp3gAmXnEmHK8zv2cqztP9L5NkgsbA0R3','2019-03-21 04:49:37','2019-03-22 15:44:41');
INSERT INTO users VALUES('2','Francis kennedy','kennedyrodrick93@gmail.com','$2y$10$zsxt80TxlacXlyu1Dag5eumA7hkTs9JusDl/pbnVq7.ijHv26o6OW','admin','1','','','2019-03-22 15:42:33','sJNbH7x0lMVvSgNCYenzAwsiYOxSYtyVGw2vdTwSATMgXbIKryWs2lDzSbEH','2019-03-21 06:39:07','2019-03-22 15:42:33');
INSERT INTO users VALUES('6','Tricky Code','trickycode93@gmail.com','$2y$10$zErDN0Sb/4UJznsjOAftIOB/r1gavLvjC9U4qh4XpuFUNme7Qz4J6','admin','5','','','2019-03-22 15:43:46','dXG3M4lB2oBCJnAFmH2asDIswc6vHiB0TcBdrb0X6ZDhOYW4X0ykmcvUJ4nX','2019-03-21 07:04:31','2019-03-22 15:43:46');
INSERT INTO users VALUES('7','hillol','hillol@gmail.com','$2y$10$4Gg2gLTXidWu37qM9ssAsuEQ9KORHnUcUbIADiMbuvXzULMtGbf/S','operator','5','1','','2019-03-21 15:57:20','tcDZYaNFftpH0JUwsBgj0mh8H5TslrBJIf9MsgGt9uLM1WVBViaE21YesskK','2019-03-21 09:09:36','2019-03-21 15:57:20');



