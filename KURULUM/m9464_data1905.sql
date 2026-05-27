-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: mysql6.serv00.com
-- Üretim Zamanı: 02 Şub 2025, 04:27:37
-- Sunucu sürümü: 8.0.39
-- PHP Sürümü: 8.1.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `m9464_data1905`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admin`
--

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `username` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$jAivw4RvSDFW5m85pmnnzuJSFs6fg9SWx5Pog5vjcbjDRANO1eIGy');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `blocked`
--

CREATE TABLE `blocked` (
  `id` int NOT NULL,
  `uid` int NOT NULL,
  `by` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `chat`
--

CREATE TABLE `chat` (
  `id` int NOT NULL,
  `from` int NOT NULL,
  `to` int NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read` int NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `comments`
--

CREATE TABLE `comments` (
  `id` int NOT NULL,
  `uid` int NOT NULL,
  `mid` int NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `likes` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `conversations`
--

CREATE TABLE `conversations` (
  `from` int NOT NULL,
  `to` int NOT NULL,
  `read` tinyint NOT NULL,
  `cid` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `conversations`
--

INSERT INTO `conversations` (`from`, `to`, `read`, `cid`) VALUES
(2, 1, 1, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `dislikes`
--

CREATE TABLE `dislikes` (
  `id` int NOT NULL,
  `post` int NOT NULL,
  `by` int NOT NULL,
  `type` int NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `friendships`
--

CREATE TABLE `friendships` (
  `id` int NOT NULL,
  `user1` int NOT NULL,
  `user2` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `groups`
--

CREATE TABLE `groups` (
  `id` int NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `privacy` int NOT NULL,
  `posts` int NOT NULL,
  `members` int NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `groups_users`
--

CREATE TABLE `groups_users` (
  `id` int NOT NULL,
  `group` int NOT NULL,
  `user` int NOT NULL,
  `status` int NOT NULL,
  `permissions` int NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `info_pages`
--

CREATE TABLE `info_pages` (
  `id` int NOT NULL,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `public` tinyint NOT NULL,
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `likes`
--

CREATE TABLE `likes` (
  `id` int NOT NULL,
  `post` int NOT NULL,
  `by` int NOT NULL,
  `type` int NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `messages`
--

CREATE TABLE `messages` (
  `id` int NOT NULL,
  `uid` int NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `group` int NOT NULL DEFAULT '0',
  `page` int NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `public` int NOT NULL,
  `likes` int NOT NULL DEFAULT '0',
  `comments` int NOT NULL DEFAULT '0',
  `shares` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `notifications`
--

CREATE TABLE `notifications` (
  `id` int NOT NULL,
  `from` int NOT NULL,
  `to` int NOT NULL DEFAULT '0',
  `parent` int NOT NULL DEFAULT '0',
  `child` int NOT NULL DEFAULT '0',
  `type` int NOT NULL,
  `read` int NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `notifications`
--

INSERT INTO `notifications` (`id`, `from`, `to`, `parent`, `child`, `type`, `read`, `time`) VALUES
(2, 1, 2, 0, 0, 5, 0, '2025-02-01 22:56:25');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `pages`
--

CREATE TABLE `pages` (
  `id` int NOT NULL,
  `by` int NOT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` int NOT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cover` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `likes` int NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `plugins`
--

CREATE TABLE `plugins` (
  `id` int NOT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `plugins`
--

INSERT INTO `plugins` (`id`, `name`, `type`, `priority`) VALUES
(1, 'cookie_law', '489', 0),
(2, 'dislike', '789', 0),
(3, 'file_share', '189ed', 100),
(4, 'media_share', '189ed', 10),
(5, 'poll', '189de', 100),
(6, 'url_parser', '18d', 0),
(7, 'weather', '2389', 0),
(8, 'social_share', '789', 10);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `plugins_settings`
--

CREATE TABLE `plugins_settings` (
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `plugins_settings`
--

INSERT INTO `plugins_settings` (`name`, `value`) VALUES
('cookie_law_color', 'black'),
('cookie_law_position', '0'),
('cookie_law_url', ''),
('file_share_allowed_extensions', 'zip,7z,rar,txt,pdf,docx,pptx,xlsx,jpg,png,gif,3gp,mp4,flv,mkv,mp3,wav'),
('file_share_max_files', '5'),
('file_share_max_size', '5242880'),
('file_share_max_upload_size', '20971520'),
('media_share_audio', '1'),
('media_share_audio_extensions', 'mp3'),
('media_share_max_size', '10485760'),
('media_share_services', 'youtube,vimeo,twitch,streamable,dailymotion,soundcloud,mixcloud,tunein,spotify,giphy,gfycat'),
('media_share_video', '1'),
('media_share_video_extensions', 'mp4'),
('social_share_services', 'facebook,twitter,pinterest,tumblr,email,vkontakte,reddit,linkedin,whatsapp,viber,digg,evernote,yummly,yahoo,gmail'),
('weather_api_key', 'c0ac878a0ff30fb7ddd27d86393044a7'),
('weather_days', '5'),
('weather_default_location', 'New York'),
('weather_format', '0');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `polls_answers`
--

CREATE TABLE `polls_answers` (
  `id` int NOT NULL,
  `question` int NOT NULL,
  `answer` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `polls_durations`
--

CREATE TABLE `polls_durations` (
  `poll_id` int NOT NULL,
  `poll_start` int NOT NULL,
  `poll_stop` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `polls_results`
--

CREATE TABLE `polls_results` (
  `id` int NOT NULL,
  `question` int NOT NULL,
  `answer` int NOT NULL,
  `by` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `reports`
--

CREATE TABLE `reports` (
  `id` int NOT NULL,
  `post` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` int NOT NULL DEFAULT '0',
  `type` int NOT NULL,
  `by` int NOT NULL,
  `state` int NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `settings`
--

CREATE TABLE `settings` (
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `perpage` int NOT NULL,
  `censor` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `captcha` int NOT NULL,
  `intervalm` int NOT NULL,
  `intervaln` int NOT NULL,
  `time` int NOT NULL,
  `message` int NOT NULL,
  `size` int NOT NULL,
  `format` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail` int NOT NULL,
  `sizemsg` int NOT NULL,
  `formatmsg` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cperpage` int NOT NULL,
  `ilimit` int NOT NULL,
  `climit` int NOT NULL,
  `uperpage` int NOT NULL,
  `sperpage` int NOT NULL,
  `nperpage` tinyint NOT NULL,
  `nperwidget` tinyint NOT NULL,
  `aperip` int NOT NULL,
  `conline` int NOT NULL,
  `ronline` tinyint NOT NULL,
  `mperpage` tinyint NOT NULL,
  `verified` int NOT NULL,
  `chatr` int NOT NULL,
  `email_activation` tinyint NOT NULL,
  `email_comment` tinyint NOT NULL,
  `email_like` tinyint NOT NULL,
  `email_new_friend` tinyint NOT NULL,
  `email_group_invite` tinyint NOT NULL,
  `email_page_invite` tinyint NOT NULL,
  `email_mention` tinyint NOT NULL,
  `smiles` tinyint NOT NULL,
  `permalinks` tinyint NOT NULL,
  `fbapp` int NOT NULL,
  `fbappid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fbappsecret` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtp_email` int NOT NULL,
  `smtp_host` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtp_port` int NOT NULL,
  `smtp_secure` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtp_auth` int NOT NULL,
  `smtp_username` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtp_password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_provider` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `friends_limit` int NOT NULL,
  `pages_limit` int NOT NULL,
  `groups_limit` int NOT NULL,
  `pages` int NOT NULL,
  `groups` int NOT NULL,
  `timezone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ad1` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ad2` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ad3` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ad4` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ad5` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ad6` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ad7` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tracking_code` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tos_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `privacy_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lt` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lk` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `settings`
--

INSERT INTO `settings` (`title`, `theme`, `perpage`, `censor`, `captcha`, `intervalm`, `intervaln`, `time`, `message`, `size`, `format`, `mail`, `sizemsg`, `formatmsg`, `cperpage`, `ilimit`, `climit`, `uperpage`, `sperpage`, `nperpage`, `nperwidget`, `aperip`, `conline`, `ronline`, `mperpage`, `verified`, `chatr`, `email_activation`, `email_comment`, `email_like`, `email_new_friend`, `email_group_invite`, `email_page_invite`, `email_mention`, `smiles`, `permalinks`, `fbapp`, `fbappid`, `fbappsecret`, `smtp_email`, `smtp_host`, `smtp_port`, `smtp_secure`, `smtp_auth`, `smtp_username`, `smtp_password`, `language`, `email_provider`, `friends_limit`, `pages_limit`, `groups_limit`, `pages`, `groups`, `timezone`, `ad1`, `ad2`, `ad3`, `ad4`, `ad5`, `ad6`, `ad7`, `tracking_code`, `tos_url`, `privacy_url`, `lt`, `lk`) VALUES
('𝓡𝓲𝓸𝓖𝓻𝓪𝓶𝓼', 'plus', 500, '', 0, 50000, 10000, 0, 500, 52428800, 'png,jpg,gif,jpeg', 1, 524288000, 'png,jpg,gif,jpeg', 500, 500, 500, 10, 8500, 50, 10, 3, 600, 10, 127, 0, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '', '', 0, '', 0, '0', 0, '', '', 'english', '', 2000, 500, 100, 1, 1, '', '', '', '', '', '', '', '', '', '', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `idu` int NOT NULL,
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `location` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `work` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `school` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `website` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bio` varchar(160) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `date` date NOT NULL,
  `facebook` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `twitter` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `private` int NOT NULL DEFAULT '0',
  `suspended` int NOT NULL DEFAULT '0',
  `salted` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `login_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cover` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `verified` int NOT NULL DEFAULT '0',
  `privacy` int NOT NULL DEFAULT '1',
  `gender` tinyint NOT NULL DEFAULT '0',
  `interests` tinyint NOT NULL DEFAULT '0',
  `online` int NOT NULL DEFAULT '0',
  `offline` tinyint NOT NULL DEFAULT '0',
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_group` int NOT NULL DEFAULT '0',
  `notificationl` tinyint NOT NULL,
  `notificationc` tinyint NOT NULL,
  `notifications` tinyint NOT NULL,
  `notificationd` tinyint NOT NULL,
  `notificationf` tinyint NOT NULL,
  `notificationg` tinyint NOT NULL,
  `notificationx` tinyint NOT NULL,
  `notificationp` tinyint NOT NULL,
  `notificationm` tinyint NOT NULL,
  `email_mention` tinyint NOT NULL,
  `email_comment` tinyint NOT NULL,
  `email_like` tinyint NOT NULL,
  `email_new_friend` tinyint NOT NULL,
  `email_group_invite` tinyint NOT NULL,
  `email_page_invite` tinyint NOT NULL,
  `sound_new_notification` tinyint NOT NULL,
  `sound_new_chat` tinyint NOT NULL,
  `born` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`idu`, `username`, `password`, `email`, `first_name`, `last_name`, `country`, `location`, `address`, `work`, `school`, `website`, `bio`, `date`, `facebook`, `twitter`, `image`, `private`, `suspended`, `salted`, `login_token`, `cover`, `verified`, `privacy`, `gender`, `interests`, `online`, `offline`, `ip`, `user_group`, `notificationl`, `notificationc`, `notifications`, `notificationd`, `notificationf`, `notificationg`, `notificationx`, `notificationp`, `notificationm`, `email_mention`, `email_comment`, `email_like`, `email_new_friend`, `email_group_invite`, `email_page_invite`, `sound_new_notification`, `sound_new_chat`, `born`) VALUES
(1, 'ceren', '$2y$10$1Ql7j8V1loJlJ9X7N.occeuiGTj3HtvViwAU9bUd68tieRFyFovam', 'cerenviosvip@gmail.com', '𝗗𝗿𝗲𝗮𝗺', '𝐀𝐧𝐠𝐞𝐥', 'British Virgin Islands', 'London', 'Candyland, Vision ⭐', '', '', '', '𝖨𝖿 𝖧𝖾𝗋 𝖭𝖺𝗆𝖾 𝖨𝗌 𝖫𝗈𝗏𝖾, 𝖨 𝖠𝗆 𝖧𝖾𝗋 𝖲𝗁𝖺𝖽𝗈𝗐𝗌, ★彡', '2025-02-01', '', '', '61467046_454277239_1258187189.jpg', 0, 0, '', NULL, '1821884373_810635322_1678523507.png', 0, 1, 1, 1, 1738466773, 0, '85.106.162.143', 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2002-09-05');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `blocked`
--
ALTER TABLE `blocked`
  ADD PRIMARY KEY (`id`),
  ADD KEY `block_status` (`uid`,`by`);

--
-- Tablo için indeksler `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unread_chat_messages` (`from`,`to`,`read`),
  ADD KEY `update_chat_status` (`to`,`read`);

--
-- Tablo için indeksler `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mid` (`mid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `admin_stats` (`time`);

--
-- Tablo için indeksler `conversations`
--
ALTER TABLE `conversations`
  ADD KEY `chat_count` (`to`,`read`),
  ADD KEY `chat_notifications_AND_chat_pagination` (`cid`);

--
-- Tablo için indeksler `dislikes`
--
ALTER TABLE `dislikes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verify_dislike` (`post`,`by`);

--
-- Tablo için indeksler `friendships`
--
ALTER TABLE `friendships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verify_friendship` (`user1`,`user2`,`status`),
  ADD KEY `user1_count_friends_AND_select_friends` (`user1`,`status`,`id`),
  ADD KEY `user2_count_friends_AND_select_friends` (`user2`,`status`,`id`);

--
-- Tablo için indeksler `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `admin_stats` (`time`);

--
-- Tablo için indeksler `groups_users`
--
ALTER TABLE `groups_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_user_data` (`group`,`user`),
  ADD KEY `group_members_count` (`group`,`status`,`permissions`),
  ADD KEY `group_requests_blocked` (`group`,`status`,`time`),
  ADD KEY `joined_groups` (`user`,`status`);

--
-- Tablo için indeksler `info_pages`
--
ALTER TABLE `info_pages`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profile_likes_count` (`by`,`type`),
  ADD KEY `verify_like` (`post`,`by`,`type`),
  ADD KEY `likes_statistics` (`post`,`type`,`time`),
  ADD KEY `admin_stats` (`time`);

--
-- Tablo için indeksler `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `public` (`public`),
  ADD KEY `type` (`type`),
  ADD KEY `uid` (`uid`),
  ADD KEY `group` (`group`),
  ADD KEY `page` (`page`),
  ADD KEY `time` (`time`),
  ADD KEY `news_feed` (`uid`,`group`,`page`,`public`),
  ADD KEY `value` (`value`(255));

--
-- Tablo için indeksler `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_activity` (`from`,`type`),
  ADD KEY `notifications_widget` (`to`,`type`,`read`);

--
-- Tablo için indeksler `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_page` (`name`),
  ADD KEY `page_owner` (`by`),
  ADD KEY `admin_stats` (`time`);

--
-- Tablo için indeksler `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `plugins_settings`
--
ALTER TABLE `plugins_settings`
  ADD PRIMARY KEY (`name`);

--
-- Tablo için indeksler `polls_answers`
--
ALTER TABLE `polls_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question` (`question`);

--
-- Tablo için indeksler `polls_durations`
--
ALTER TABLE `polls_durations`
  ADD KEY `poll_id` (`poll_id`);

--
-- Tablo için indeksler `polls_results`
--
ALTER TABLE `polls_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question` (`question`),
  ADD KEY `by` (`by`);

--
-- Tablo için indeksler `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `state` (`state`),
  ADD KEY `time` (`time`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idu`),
  ADD KEY `username` (`username`),
  ADD KEY `gender` (`gender`),
  ADD KEY `admin_manage_user_moderators` (`user_group`),
  ADD KEY `admin_manage_user_verified` (`verified`),
  ADD KEY `admin_manage_user_suspended` (`suspended`),
  ADD KEY `user_active` (`idu`,`suspended`),
  ADD KEY `admin_stats_registered` (`date`),
  ADD KEY `admin_stats_online` (`online`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `blocked`
--
ALTER TABLE `blocked`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `dislikes`
--
ALTER TABLE `dislikes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `friendships`
--
ALTER TABLE `friendships`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `groups_users`
--
ALTER TABLE `groups_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `info_pages`
--
ALTER TABLE `info_pages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `polls_answers`
--
ALTER TABLE `polls_answers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `polls_results`
--
ALTER TABLE `polls_results`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `idu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
