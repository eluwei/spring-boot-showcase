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
  PRIMARY KEY (`id`)
);