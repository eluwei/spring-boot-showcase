DROP TABLE IF EXISTS `CARDS`;
DROP TABLE IF EXISTS `admin_user`;
DROP TABLE IF EXISTS `category`;
DROP TABLE IF EXISTS `product`;
DROP TABLE IF EXISTS `sku`;

CREATE TABLE CARDS
(
ID VARCHAR(50) PRIMARY KEY,
cardId VARCHAR(25),
faceValue decimal(9,2),
frozenValue decimal(9,2),
balanceValue decimal(9,2),
comments VARCHAR(500)
);

CREATE TABLE `admin_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `salt` varchar(100) DEFAULT NULL,
  UNIQUE KEY `uq_unique_login_name` (`user_name`) USING BTREE,
  PRIMARY KEY (`id`)
);

CREATE TABLE `category` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) DEFAULT NULL,
  `descriptions` varchar(255) DEFAULT NULL,
  `parent_category_id` bigint(20) DEFAULT NULL,
  `path_Str` varchar(500) DEFAULT '',
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `categoryId_UNIQUE` (`category_id`)
);


CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(45) DEFAULT NULL,
  `long_description` text,
  `parent_category_id` bigint(20) DEFAULT NULL,
  `on_shelf` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
);

CREATE TABLE `sku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '商品描述',
  `list_price` decimal(10,0) DEFAULT NULL,
  `sale_price` decimal(10,0) DEFAULT NULL,
  `stock_level` decimal(10,0) DEFAULT -1 COMMENT 'sku库存' ,
  `img` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `img_detail` varchar(255) DEFAULT NULL COMMENT '商品详情图片',
  PRIMARY KEY (`id`)
);