-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'address'
-- 
-- ---

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `id` INTEGER NULL DEFAULT NULL,
  `userID` INTEGER NULL DEFAULT NULL,
  `address` VARCHAR(512) NULL DEFAULT NULL,
  `city` VARCHAR(255) NULL DEFAULT NULL,
  `region` VARCHAR(255) NULL DEFAULT NULL,
  `country` VARCHAR(255) NULL DEFAULT NULL,
  `postalCode` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'emailPreferences'
-- 
-- ---

DROP TABLE IF EXISTS `emailPreferences`;

CREATE TABLE `emailPreferences` (
  `userID` INTEGER NULL DEFAULT NULL,
  `verified` CHAR(1) NULL DEFAULT NULL,
  `allowMarketingBool` CHAR(1) NULL DEFAULT NULL,
  `verificationKey` CHAR(32) NULL DEFAULT NULL,
  PRIMARY KEY (`userID`)
);

-- ---
-- Table 'user'
-- 
-- ---

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `password_hash` CHAR(32) NULL DEFAULT NULL,
  `hash_salt` CHAR(4) NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'game'
-- 
-- ---

DROP TABLE IF EXISTS `game`;

CREATE TABLE `game` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `releaseDate` DATE NULL DEFAULT NULL,
  `suggestedRetailPrice` DECIMAL NULL DEFAULT NULL,
  `platformID` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'order'
-- Before complete this is the "Cart", after complete this is your order history.
-- ---

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `billingAddress` INTEGER NULL DEFAULT NULL,
  `shippingAddress` INTEGER NULL DEFAULT NULL,
  `userID` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) COMMENT 'Before complete this is the "Cart", after complete this is y';

-- ---
-- Table 'orderItem'
-- 
-- ---

DROP TABLE IF EXISTS `orderItem`;

CREATE TABLE `orderItem` (
  `gameID` INTEGER NULL DEFAULT NULL,
  `orderID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `quantity` INTEGER NULL DEFAULT NULL,
  `salePrice` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`orderID`, `gameID`)
);

-- ---
-- Table 'platform'
-- 
-- ---

DROP TABLE IF EXISTS `platform`;

CREATE TABLE `platform` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'category'
-- 
-- ---

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'gameCategory'
-- 
-- ---

DROP TABLE IF EXISTS `gameCategory`;

CREATE TABLE `gameCategory` (
  `gameID` INTEGER NULL DEFAULT NULL,
  `categoryID` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`gameID`, `categoryID`)
);

-- ---
-- Table 'profile'
-- 
-- ---

DROP TABLE IF EXISTS `profile`;

CREATE TABLE `profile` (
  `userID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `displayName` VARCHAR(30) NULL DEFAULT NULL,
  `gender` CHAR(1) NULL DEFAULT NULL,
  `firstName` VARCHAR(50) NULL DEFAULT NULL,
  `lastName` VARCHAR(50) NULL DEFAULT NULL,
  `dateOfBirth` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`userID`)
);

-- ---
-- Table 'billingProfile'
-- 
-- ---

DROP TABLE IF EXISTS `billingProfile`;

CREATE TABLE `billingProfile` (
  `userID` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `stripeEmail` VARCHAR(50) NULL DEFAULT NULL,
  `stripeID` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`userID`)
);

-- ---
-- Table 'friendship'
-- 
-- ---

DROP TABLE IF EXISTS `friendship`;

CREATE TABLE `friendship` (
  `friendeeID` INTEGER NULL DEFAULT NULL,
  `frienderID` INTEGER NULL DEFAULT NULL,
  `familyMemberBool` CHAR(1) NULL DEFAULT NULL,
  PRIMARY KEY (`friendeeID`, `frienderID`)
);

-- ---
-- Table 'review'
-- 
-- ---

DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `gameID` INTEGER NULL DEFAULT NULL,
  `userID` INTEGER NULL DEFAULT NULL,
  `rating` INTEGER NULL DEFAULT NULL,
  `subjectText` VARCHAR(300) NULL DEFAULT NULL,
  `contentText` VARCHAR(2000) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `address` ADD FOREIGN KEY (userID) REFERENCES `user` (`id`);
ALTER TABLE `emailPreferences` ADD FOREIGN KEY (userID) REFERENCES `user` (`id`);
ALTER TABLE `user` ADD FOREIGN KEY (id) REFERENCES `profile` (`userID`);
ALTER TABLE `user` ADD FOREIGN KEY (id) REFERENCES `billingProfile` (`userID`);
ALTER TABLE `game` ADD FOREIGN KEY (platformID) REFERENCES `platform` (`id`);
ALTER TABLE `order` ADD FOREIGN KEY (billingAddress) REFERENCES `address` (`id`);
ALTER TABLE `order` ADD FOREIGN KEY (shippingAddress) REFERENCES `address` (`id`);
ALTER TABLE `order` ADD FOREIGN KEY (userID) REFERENCES `user` (`id`);
ALTER TABLE `orderItem` ADD FOREIGN KEY (gameID) REFERENCES `game` (`id`);
ALTER TABLE `orderItem` ADD FOREIGN KEY (orderID) REFERENCES `order` (`id`);
ALTER TABLE `gameCategory` ADD FOREIGN KEY (gameID) REFERENCES `game` (`id`);
ALTER TABLE `gameCategory` ADD FOREIGN KEY (categoryID) REFERENCES `category` (`id`);
ALTER TABLE `friendship` ADD FOREIGN KEY (friendeeID) REFERENCES `user` (`id`);
ALTER TABLE `friendship` ADD FOREIGN KEY (frienderID) REFERENCES `user` (`id`);
ALTER TABLE `review` ADD FOREIGN KEY (gameID) REFERENCES `game` (`id`);
ALTER TABLE `review` ADD FOREIGN KEY (userID) REFERENCES `user` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `address` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `emailPreferences` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `user` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `game` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `order` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `orderItem` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `platform` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `category` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `gameCategory` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `profile` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `billingProfile` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `friendship` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `review` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `address` (`id`,`userID`,`address`,`city`,`region`,`country`,`postalCode`) VALUES
-- ('','','','','','','');
-- INSERT INTO `emailPreferences` (`userID`,`verified`,`allowMarketingBool`,`verificationKey`) VALUES
-- ('','','','');
-- INSERT INTO `user` (`id`,`password_hash`,`hash_salt`,`email`) VALUES
-- ('','','','');
-- INSERT INTO `game` (`id`,`name`,`releaseDate`,`suggestedRetailPrice`,`platformID`) VALUES
-- ('','','','','');
-- INSERT INTO `order` (`id`,`billingAddress`,`shippingAddress`,`userID`) VALUES
-- ('','','','');
-- INSERT INTO `orderItem` (`gameID`,`orderID`,`quantity`,`salePrice`) VALUES
-- ('','','','');
-- INSERT INTO `platform` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `category` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `gameCategory` (`gameID`,`categoryID`) VALUES
-- ('','');
-- INSERT INTO `profile` (`userID`,`displayName`,`gender`,`firstName`,`lastName`,`dateOfBirth`) VALUES
-- ('','','','','','');
-- INSERT INTO `billingProfile` (`userID`,`stripeEmail`,`stripeID`) VALUES
-- ('','','');
-- INSERT INTO `friendship` (`friendeeID`,`frienderID`,`familyMemberBool`) VALUES
-- ('','','');
-- INSERT INTO `review` (`id`,`gameID`,`userID`,`rating`,`subjectText`,`contentText`) VALUES
-- ('','','','','','');