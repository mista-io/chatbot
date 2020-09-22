DROP TABLE IF EXISTS blacklists;

CREATE TABLE `blacklists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `domain_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




DROP TABLE IF EXISTS canned_messages;

CREATE TABLE `canned_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;




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

INSERT INTO chat_requests VALUES('1','1','2','0','0','chat_start','2020-08-31 19:56:35','2020-08-31 19:57:20');
INSERT INTO chat_requests VALUES('2','2','3','0','0','chat_end','2020-09-12 14:59:56','2020-09-12 20:18:35');
INSERT INTO chat_requests VALUES('3','3','2','0','0','chat_start','2020-09-12 21:51:40','2020-09-12 21:54:35');
INSERT INTO chat_requests VALUES('4','4','2','0','0','chat_start','2020-09-12 21:56:56','2020-09-12 21:57:08');



DROP TABLE IF EXISTS companies;

CREATE TABLE `companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `business_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valid_to` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO companies VALUES('1','REQUESIT','active','2020-08-31','2020-08-31 17:52:43','2020-08-31 17:52:43');



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

INSERT INTO company_settings VALUES('1','primary_color','#2bb378','1','2020-08-31 18:01:26','2020-09-12 19:40:19');
INSERT INTO company_settings VALUES('2','secondary_color','#2bb378','1','2020-08-31 18:01:26','2020-09-12 19:40:19');
INSERT INTO company_settings VALUES('3','label_color','#fcde19','1','2020-08-31 18:01:26','2020-09-12 19:40:19');
INSERT INTO company_settings VALUES('4','heading_text','Twabafasha','1','2020-08-31 18:01:26','2020-09-12 19:40:19');
INSERT INTO company_settings VALUES('5','offline_text','Hello mwatwandikire nituza online turabafasha','1','2020-08-31 18:01:26','2020-09-12 19:40:19');
INSERT INTO company_settings VALUES('6','email','info@requestit.dev','1','2020-08-31 18:01:26','2020-09-12 19:40:19');
INSERT INTO company_settings VALUES('7','widget_direction','right','1','2020-08-31 18:01:26','2020-09-12 19:40:19');
INSERT INTO company_settings VALUES('8','file_sharing','yes','1','2020-08-31 18:01:26','2020-09-12 19:40:19');
INSERT INTO company_settings VALUES('9','allow_department','yes','1','2020-08-31 18:01:26','2020-09-12 19:40:19');
INSERT INTO company_settings VALUES('10','language','Kinyarwanda','1','2020-08-31 18:01:26','2020-09-12 19:40:19');
INSERT INTO company_settings VALUES('11','mobile_version_breakpoint','660','1','2020-08-31 18:01:26','2020-09-12 19:40:19');
INSERT INTO company_settings VALUES('12','mobile_field','no','1','2020-08-31 18:01:26','2020-09-12 19:40:19');
INSERT INTO company_settings VALUES('13','offline_mode','yes','1','2020-08-31 18:13:27','2020-09-12 20:00:57');



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

INSERT INTO departments VALUES('1','Support','','1','2020-09-12 12:59:36','2020-09-12 12:59:36');



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

INSERT INTO guests VALUES('1','Alex','bwanakweli4ver@gmail.com','','0','http://localhost/chat/widget_preview','::1','male_guest.png','2020-08-31 20:05:24','1','2020-08-31 19:56:35','2020-08-31 20:05:24');
INSERT INTO guests VALUES('2','Alex','alex@mista.io','','1','http://localhost/chat/widget_preview','::1','male_guest.png','2020-09-12 20:18:30','1','2020-09-12 14:59:56','2020-09-12 20:18:30');
INSERT INTO guests VALUES('3','Alex','alex@gmail.com','','1','http://localhost/chat/widget_preview','::1','male_guest.png','2020-09-13 00:53:10','1','2020-09-12 21:51:40','2020-09-13 00:53:10');
INSERT INTO guests VALUES('4','Alex','alex@mista.io','','1','http://localhost/chat/widget_preview','::1','male_guest.png','2020-09-12 21:56:56','1','2020-09-12 21:56:56','2020-09-12 21:56:56');



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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO messages VALUES('1','1','Alex Has Started Chat Conversation','1','guest','operator','2020-08-31 19:56:35','2020-08-31 18:02:38');
INSERT INTO messages VALUES('2','1','heloo','1','guest','operator','2020-08-31 19:56:42','2020-08-31 18:02:38');
INSERT INTO messages VALUES('3','1','REQUESTIT Has Joined To Chat Conversation','1','operator','guest','2020-08-31 19:57:05','2020-08-31 18:02:38');
INSERT INTO messages VALUES('4','1','helloo','1','operator','guest','2020-08-31 19:57:12','2020-08-31 18:02:38');
INSERT INTO messages VALUES('5','1','<img class=\"s-emboji\" src=\"http://localhost/chat/public/emboji/angry.png\">','1','guest','operator','2020-08-31 20:01:51','2020-08-31 18:02:38');
INSERT INTO messages VALUES('6','1','<img class=\"s-emboji\" src=\"http://localhost/chat/public/emboji/angry.png\">','1','guest','operator','2020-08-31 20:01:51','2020-08-31 18:02:38');
INSERT INTO messages VALUES('7','1','heloo','1','operator','guest','2020-08-31 20:02:09','2020-08-31 18:02:38');
INSERT INTO messages VALUES('8','2','Alex Has Started Chat Conversation','1','guest','operator','2020-09-12 14:59:56','2020-09-12 18:58:55');
INSERT INTO messages VALUES('9','2','<a target=\'_blank\' href=\'http://localhost/chat/public/uploads/chat_files/Attachment_1599915639.png\'>Attachment_1599915639.png</a>','1','guest','operator','2020-09-12 15:00:39','2020-09-12 18:58:55');
INSERT INTO messages VALUES('10','2','REQUESTIT Has Joined To Chat Conversation','1','operator','guest','2020-09-12 15:04:18','2020-09-12 18:58:55');
INSERT INTO messages VALUES('11','2','helloo','1','guest','operator','2020-09-12 16:58:01','2020-09-12 18:58:55');
INSERT INTO messages VALUES('12','2','helllo','1','guest','operator','2020-09-12 19:09:31','2020-09-12 18:58:55');
INSERT INTO messages VALUES('13','2','i want your help','1','guest','operator','2020-09-12 20:15:09','2020-09-12 18:58:55');
INSERT INTO messages VALUES('14','2','helloo','1','operator','guest','2020-09-12 20:15:32','2020-09-12 18:58:55');
INSERT INTO messages VALUES('15','2','REQUESTIT Has Transfered Chat To Diane','1','operator','guest','2020-09-12 18:16:52','2020-09-12 18:58:55');
INSERT INTO messages VALUES('16','2','Diane Has Joined To Chat Conversation','1','operator','guest','2020-09-12 20:17:11','2020-09-12 18:58:55');
INSERT INTO messages VALUES('17','2','<span class=\'chat_ended\'><i class=\'fa fa-sign-out\'></i> Alex Has Ended Chat Session.</span>','1','guest','operator','2020-09-12 20:18:35','2020-09-12 18:58:55');
INSERT INTO messages VALUES('18','3','Alex Has Started Chat Conversation','1','guest','operator','2020-09-12 21:51:40','2020-09-12 22:53:09');
INSERT INTO messages VALUES('19','3','REQUESTIT Has Joined To Chat Conversation','1','operator','guest','2020-09-12 21:54:35','2020-09-12 22:53:09');
INSERT INTO messages VALUES('20','4','Alex Has Started Chat Conversation','1','guest','operator','2020-09-12 21:56:56','2020-09-12 19:57:30');
INSERT INTO messages VALUES('21','4','REQUESTIT Jinjiye mukiganiro','1','operator','guest','2020-09-12 21:57:08','2020-09-12 19:57:30');



DROP TABLE IF EXISTS migrations;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO migrations VALUES('11','2019_03_19_123527_create_company_settings_table','1');
INSERT INTO migrations VALUES('12','2019_03_21_052934_create_companies_table','1');
INSERT INTO migrations VALUES('13','2019_07_04_070022_create_package_table','1');



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




DROP TABLE IF EXISTS package;

CREATE TABLE `package` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `package_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator_limit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_limit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `canned_message_limit` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cost` decimal(8,2) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO settings VALUES('1','timezone','Africa/Kigali','','2020-08-31 17:48:33');
INSERT INTO settings VALUES('2','mail_type','mail','','');
INSERT INTO settings VALUES('3','backend_direction','ltr','','2020-08-31 17:48:33');
INSERT INTO settings VALUES('4','widget_direction','right','','');
INSERT INTO settings VALUES('5','mobile_version_breakpoint','768','','');
INSERT INTO settings VALUES('6','chatting_refresh_rate','5','','2020-08-31 17:48:33');
INSERT INTO settings VALUES('7','user_tracking_refresh_rate','8','','2020-08-31 17:48:33');
INSERT INTO settings VALUES('8','message_sound','default.mp3','','2020-08-31 17:48:33');
INSERT INTO settings VALUES('9','max_upload_size','2','','2020-08-31 17:48:33');
INSERT INTO settings VALUES('10','file_sharing','yes','','');
INSERT INTO settings VALUES('11','file_type_supported','doc,jpg,jpeg,png,pdf,docx,zip','','2020-08-31 17:48:33');
INSERT INTO settings VALUES('12','allow_department','no','','');
INSERT INTO settings VALUES('13','company_name','MISTA','2020-08-31 17:46:47','2020-08-31 17:48:33');
INSERT INTO settings VALUES('14','site_title','MISTA CHAT','2020-08-31 17:46:48','2020-08-31 17:48:33');
INSERT INTO settings VALUES('15','phone','250787490069','2020-08-31 17:46:48','2020-08-31 17:46:48');
INSERT INTO settings VALUES('16','email','alex@mista.io','2020-08-31 17:46:48','2020-08-31 17:46:48');
INSERT INTO settings VALUES('17','logo','logo.png','2020-08-31 17:48:11','2020-08-31 17:48:11');
INSERT INTO settings VALUES('18','language','English','2020-08-31 17:48:33','2020-08-31 17:48:33');



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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO users VALUES('1','Alex','alex@mista.io','$2y$10$rwXmdSUh4qCzU2eVQigNsO8VjUQEpcFPpY1ch6669yQ/ICPQSwAqy','super_admin','','','','2020-09-13 00:55:35','rAUWiSIosLrsWMshtcfCGXxiBUND9wWEKunwbHfl3B70jQk7yCqifRGNKkoY','2020-08-31 17:46:08','2020-09-13 00:55:35');
INSERT INTO users VALUES('2','REQUESTIT','dev@mista.io','$2y$10$ejjC7apY8sIYMJQVkk5beug6ghnH71tx5KxoENhWvqVsmq6UyreoO','admin','1','','profile_1598896363.jpg','2020-09-13 00:55:38','YG9oLZl4Y5KKaNvCIryOVwfloi8prNz0AcBjD8IQjBFYRpn0kJ0Ag5OyXmMl','2020-08-31 17:52:43','2020-09-13 00:55:38');
INSERT INTO users VALUES('3','Diane','diane@mista.io','$2y$10$pIigmiIBIToa5/oDr2x0KeemJzQIDkWuPD1D7ouNViYgoJkpRyX1i','operator','1','1','profile_1599934481.jpg','2020-09-12 20:58:55','','2020-09-12 18:14:41','2020-09-12 20:58:55');



