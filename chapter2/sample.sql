-- phpMyAdmin SQL

--
-- Database: `sample`
--
CREATE DATABASE IF NOT EXISTS `sample` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sample`;

-- --------------------------------------------------------

--
-- テーブルの構造 `m_hosp`
--

DROP TABLE IF EXISTS `m_hosp`;
CREATE TABLE IF NOT EXISTS `m_hosp` (
  `hosp_code` VARCHAR(20) NOT NULL COMMENT '医療機関コード',
  `hosp_name` VARCHAR(256) NOT NULL COMMENT '医療機関名',
  `hosp_addr` VARCHAR(256) NOT NULL COMMENT '医療機関住所',
  `hosp_tel` VARCHAR(256) NOT NULL COMMENT '医療機関電話番号',
  PRIMARY KEY (`hosp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='医療機関_マスタ';

--
-- テーブルのデータのダンプ `m_hosp`
--

INSERT INTO `m_hosp` (`hosp_code`, `hosp_name`, `hosp_addr`, `hosp_tel`) VALUES
('001', 'test病院', '東京都◇◇区◇◇', '03-111-9999'),
('002', '◇◇病院', '東京都◆◆区◆◆', '03-222-9999'),
('003', '◆◆クリニック', '大阪府〇〇区〇〇３－３－３', '06-333-9999'),
('004', '◇◇大学付属病院', '大阪府〇〇区〇〇４－４－４', '06-444-9999');

-- --------------------------------------------------------

--
-- テーブルの構造 `m_user`
--

DROP TABLE IF EXISTS `m_user`;
CREATE TABLE IF NOT EXISTS `m_user` (
  `user_id` VARCHAR(20) NOT NULL COMMENT '利用者ID',
  `user_name` VARCHAR(60) NOT NULL COMMENT '利用者名',
  `user_pwd` VARCHAR(256) NOT NULL COMMENT '利用者パスワード',
  `auth_id` INT(11) NOT NULL COMMENT '操作権限ID',
  PRIMARY KEY (`user_id`),
  KEY `FK_AUTH_ID` (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='利用者_マスタ';

--
-- テーブルのデータのダンプ `m_user`
--

INSERT INTO `m_user` (`user_id`, `user_name`, `user_pwd`, `auth_id`) VALUES
('suzuki', '鈴木次郎', 'E8B76AD055515B9D144D3C02AEEBB664', 20),
('yamada', '山田太郎', 'A2C2451FC186A9DAABF14C3DB4EC1E09', 10);

-- --------------------------------------------------------

--
-- テーブルの構造 `t_visit`
--

DROP TABLE IF EXISTS `t_visit`;
CREATE TABLE IF NOT EXISTS `t_visit` (
  `visit_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '訪問ID',
  `hosp_code` VARCHAR(20) NOT NULL COMMENT '医療機関コード',
  `user_id` VARCHAR(20) NOT NULL COMMENT '利用者ID',
  `plan_date` DATE DEFAULT NULL COMMENT '訪問予定日',
  `record_date` DATE DEFAULT NULL COMMENT '訪問実績日',
  `note` VARCHAR(2000) DEFAULT NULL COMMENT 'MR備考',
  PRIMARY KEY (`visit_id`),
  KEY `hosp_code` (`hosp_code`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='訪問予定/訪問実績_トランザクション';

--
-- テーブルのデータのダンプ `t_visit`
--

INSERT INTO `t_visit` (`visit_id`, `hosp_code`, `user_id`, `plan_date`, `record_date`, `note`) VALUES
(1, '001', 'yamada', '2018-06-01', '2018-06-01', NULL),
(2, '002', 'yamada', '2018-06-04', '2018-06-04', NULL);
COMMIT;


