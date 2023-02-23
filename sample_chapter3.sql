-- phpMyAdmin SQL 


CREATE TABLE IF NOT EXISTS `m_employee` (
  `emp_code` INT(11) NOT NULL COMMENT '社員番号',
  `emp_name` VARCHAR(60) DEFAULT NULL COMMENT '社員名',
  `dep_name` VARCHAR(60) DEFAULT NULL COMMENT '部署名',
  `join_date` DATE DEFAULT NULL COMMENT '入社日',
  `retire_date` DATE DEFAULT NULL COMMENT '退職日'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='社員_マスタ';

-- カラムの追加
ALTER TABLE `m_employee` 
    ADD `post_name` VARCHAR(60) DEFAULT NULL COMMENT '役職' AFTER `retire_date`,
    ADD `grad_name` VARCHAR(60) DEFAULT NOT NULL COMMENT '等級' AFTER `post_name`;

ALTER TABLE `m_employee` ADD `address` VARCHAR(120) NULL COMMENT '住所';

-- カラムの削除
ALTER TABLE `m_employee` DROP `address`;

-- カラムの変更 「役職」カラムの桁数(長さ)を変更
ALTER TABLE `m_employee`
    CHANGE COLUMN `post_name` VARCHAR(80) NULL COMMENT '役職' AFTER `retire_date`;

-- 主キー制約を追加 社員番号
ALTER TABLE `m_employee` ADD PRIMARY KEY(`emp_code`);

-- 主キー制約を削除
ALTER TABLE `m_employee` DROP PRIMARY KEY;


INSERT INTO `m_employee`() VALUES('','','','2000/04/01','','','');
INSERT INTO `m_employee`() VALUES('','','','2000/04/01','','','');
INSERT INTO `m_employee`() VALUES('','','','2000/04/01','','','');








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
  `hosp_code` varchar(20) NOT NULL COMMENT '',
  `hosp_name` varchar(256) NOT NULL COMMENT '',
  `hosp_addr` varchar(256) NOT NULL COMMENT '',
  `hosp_tel` varchar(256) NOT NULL COMMENT '',
  PRIMARY KEY (`hosp_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='医療機関_マスタ';

--
-- テーブルのデータのダンプ `m_hosp`
--

INSERT INTO `m_hosp` (`hosp_code`, `hosp_name`, `hosp_addr`, `hosp_tel`) VALUES
('001', '秀和病院', '東京都◇◇区◇◇', '03-111-9999'),
('002', '◇◇病院', '東京都◆◆区◆◆', '03-222-9999'),
('003', '◆◆クリニック', '大阪府〇〇区〇〇３－３－３', '06-333-9999'),
('004', '◇◇大学付属病院', '大阪府〇〇区〇〇４－４－４', '06-444-9999');

-- --------------------------------------------------------

--
-- テーブルの構造 `m_user`
--

DROP TABLE IF EXISTS `m_user`;
CREATE TABLE IF NOT EXISTS `m_user` (
  `user_id` varchar(20) NOT NULL COMMENT '利用者ID',
  `user_name` varchar(60) NOT NULL COMMENT '利用者名',
  `user_pwd` varchar(256) NOT NULL COMMENT 'パスワード',
  `auth_id` int(11) NOT NULL COMMENT '操作権限ID',
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
-- テーブルの構造 `m_user_auth`
--

DROP TABLE IF EXISTS `m_user_auth`;
CREATE TABLE IF NOT EXISTS `m_user_auth` (
  `auth_id` int(11) NOT NULL COMMENT '操作権限ID',
  `auth_name` varchar(60) NOT NULL COMMENT '操作権限名',
  PRIMARY KEY (`auth_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='操作権限_マスタ';

--
-- テーブルのデータのダンプ `m_user_auth`
--

INSERT INTO `m_user_auth` (`auth_id`, `auth_name`) VALUES
(10, 'ＭＲ'),
(20, '管理部門');

-- --------------------------------------------------------

--
-- テーブルの構造 `t_visit`
--

DROP TABLE IF EXISTS `t_visit`;
CREATE TABLE IF NOT EXISTS `t_visit` (
  `visit_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `hosp_code` varchar(20) NOT NULL COMMENT '',
  `user_id` varchar(20) NOT NULL COMMENT '',
  `plan_date` date DEFAULT NULL COMMENT '',
  `record_date` date DEFAULT NULL COMMENT '',
  `note` varchar(2000) DEFAULT NULL COMMENT '',
  PRIMARY KEY (`visit_id`),
  KEY `hosp_code` (`hosp_code`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='';

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `m_user`
--
ALTER TABLE `m_user`
  ADD CONSTRAINT `FK_AUTH_ID` FOREIGN KEY (`auth_id`) REFERENCES `m_user_auth` (`auth_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
