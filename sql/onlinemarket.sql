/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : onlinemarket

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 17/12/2020 18:22:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `a_id` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址ID',
  `a_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人姓名',
  `a_phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人电话',
  `a_province` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人省份',
  `a_city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人城市',
  `a_district` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人县/区',
  `a_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人详细地址信息',
  `a_status` int(1) UNSIGNED ZEROFILL NOT NULL COMMENT '是否默认地址',
  `a_addtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址加入的时间戳',
  `c_id` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '顾客ID',
  PRIMARY KEY (`a_id`) USING BTREE,
  INDEX `c_id`(`c_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('191ddec4', 'test5', '12345678910', '河南省-410000', '信阳市-411500', '浉河区-411502', '信阳师范大学', 1, '1590632623000', 'cc2ffd77');
INSERT INTO `address` VALUES ('34967893', 'test2', '12345678910', '北京市-110000', '市辖区-110100', '东城区-110101', '珠市口徐记车行', 0, '1582220823000', '94a2add8');
INSERT INTO `address` VALUES ('35805185', 'test', '13212345679', '河南省-410000', '信阳市-411500', '平桥区-411503', '信阳农林学院', 1, '1590634044000', 'e8762174');
INSERT INTO `address` VALUES ('43eb7cac', 'test1', '12345678910', '北京市-110000', '市辖区-110100', '东城区-110101', '珠市口徐记车行', 0, '1582220374000', '94a2add8');
INSERT INTO `address` VALUES ('48c621d9', 'test4', '12345678910', '山西省-140000', '太原市-140100', '迎泽区-140106', '你第三方反对', 1, '1590632133000', '292f5833');
INSERT INTO `address` VALUES ('4d80cd64', 'test', '12345678910', '上海市-310000', '市辖区-310100', '黄浦区-310101', 'scasc那种', 1, '1583320044000', '94a2add8');
INSERT INTO `address` VALUES ('6d32a187', 'test2', '13146544564', '河北省-130000', '石家庄市-130100', '桥西区-130104', 'sfdgfdsg', 1, '1590028340000', 'cd5ee1aa');
INSERT INTO `address` VALUES ('7501505d', 'xiaozhang', '15512346598', '河南省-410000', '信阳市-411500', '平桥区-411503', '信阳农林学院', 1, '1590635988000', '5fafb6c0');
INSERT INTO `address` VALUES ('80afc2f0', 'test', '12345678910', '北京市-110000', '市辖区-110100', '朝阳区-110105', 'dasfsf', 1, '1583681795000', '01fb09f7');
INSERT INTO `address` VALUES ('8fe6ce9e', 'test6', '13112345698', '河南省-410000', '信阳市-411500', '平桥区-411503', '信阳农林学院', 1, '1590632895000', '52b2c4f4');
INSERT INTO `address` VALUES ('9212d7fb', 'test4', '13212345678', '河南省-410000', '信阳市-411500', '平桥区-411503', '信阳农林学院南门', 1, '1590633354000', '0c4a2287');
INSERT INTO `address` VALUES ('98b0cc5f', 'test', '13712345678', '河南省-410000', '信阳市-411500', '平桥区-411503', '信阳农林学院', 1, '1590634582000', '189f0812');
INSERT INTO `address` VALUES ('e99252df', 'test', '12345678910', '北京市-110000', '市辖区-110100', '朝阳区-110105', '按时发顺丰', 1, '1589955000000', 'b978f7f9');
INSERT INTO `address` VALUES ('f44c9c6b', 'test', '12345678910', '河南省-410000', '信阳市-411500', '平桥区-411503', '信阳农林学院', 1, '1583673143000', '015ebf93');
INSERT INTO `address` VALUES ('f87ff9fa', 'test3', '12345678910', '广东省-440000', '深圳市-440300', '南山区-440305', 'asdasf', 0, '1589000782000', '94a2add8');

-- ----------------------------
-- Table structure for admin_type
-- ----------------------------
DROP TABLE IF EXISTS `admin_type`;
CREATE TABLE `admin_type`  (
  `admin_type_id` int(5) NOT NULL COMMENT '管理员类别ID',
  `admin_type_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员类别名称',
  PRIMARY KEY (`admin_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_type
-- ----------------------------
INSERT INTO `admin_type` VALUES (1, '管理层管理员');
INSERT INTO `admin_type` VALUES (2, '员工管理员');

-- ----------------------------
-- Table structure for administrators
-- ----------------------------
DROP TABLE IF EXISTS `administrators`;
CREATE TABLE `administrators`  (
  `admin_id` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员ID',
  `admin_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员姓名',
  `admin_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员密码',
  `admin_gender` int(1) NULL DEFAULT NULL COMMENT '管理员性别',
  `admin_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员邮箱',
  `admin_phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员手机号',
  `admin_createtime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员创建时间',
  `admin_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员头像',
  `admin_type_id` int(5) NOT NULL COMMENT '管理员类别ID',
  PRIMARY KEY (`admin_id`) USING BTREE,
  UNIQUE INDEX `admin_name`(`admin_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of administrators
-- ----------------------------
INSERT INTO `administrators` VALUES ('03c91', 'eb87', '12345678', 1, 'eb87@qq.com', '13428550117', '1602547297000', NULL, 2);
INSERT INTO `administrators` VALUES ('0a6f9', '07a6', '12345678', 1, '07a6@qq.com', '15658600796', '1602558448000', NULL, 2);
INSERT INTO `administrators` VALUES ('0f9bc', '6298df483b', '12345678', 1, '6298df483b@qq.com', '15177162002', '1602547297000', NULL, 2);
INSERT INTO `administrators` VALUES ('10048', '2ce55f40', '12345678', 1, '2ce55f40@qq.com', '18563463948', '1602552013000', NULL, 2);
INSERT INTO `administrators` VALUES ('1a475', '53e2b3', '12345678', 1, '53e2b3@qq.com', '15887965487', '1602547297000', NULL, 2);
INSERT INTO `administrators` VALUES ('1eb1d', '69ef', '12345678', 1, '69ef@qq.com', '13231960776', '1602558448000', NULL, 2);
INSERT INTO `administrators` VALUES ('218c5', '小梨', '11111111', 0, 'xiaoli@qq.com', '15612345678', '2020-05-21', '/images/userImage.jpg', 2);
INSERT INTO `administrators` VALUES ('2574d', 'f33d68e75', '12345678', 1, 'f33d68e75@qq.com', '15548368972', '1602558448000', NULL, 2);
INSERT INTO `administrators` VALUES ('27b6e', '96c9', '12345678', 1, '96c9@qq.com', '14705927097', '1602558448000', NULL, 2);
INSERT INTO `administrators` VALUES ('33150', '452f', '12345678', 1, '452f@qq.com', '15702230819', '1602547297000', NULL, 2);
INSERT INTO `administrators` VALUES ('41a18', '8f8eee', '12345678', 1, '8f8eee@qq.com', '13180824082', '1602547482000', NULL, 2);
INSERT INTO `administrators` VALUES ('44830', '5f88b4', '12345678', 1, '5f88b4@qq.com', '18147706076', '1602547297000', NULL, 2);
INSERT INTO `administrators` VALUES ('480f2', 'dd24', '12345678', 1, 'dd24@qq.com', '17574584316', '1602552013000', NULL, 2);
INSERT INTO `administrators` VALUES ('51967', '32b487faa5', '12345678', 1, '32b487faa5@qq.com', '18509260522', '1602547482000', NULL, 2);
INSERT INTO `administrators` VALUES ('55bb3', '05811ba26', '12345678', 1, '05811ba26@qq.com', '17280057756', '1602547297000', NULL, 2);
INSERT INTO `administrators` VALUES ('5902b', 'a92e4', '12345678', 1, 'a92e4@qq.com', '15888761917', '1602547482000', NULL, 2);
INSERT INTO `administrators` VALUES ('5b96f', '33a5', '12345678', 1, '33a5@qq.com', '17515907752', '1602558448000', NULL, 2);
INSERT INTO `administrators` VALUES ('5bde1', '6373dbfd', '12345678', 1, '6373dbfd@qq.com', '18053252538', '1602552013000', NULL, 2);
INSERT INTO `administrators` VALUES ('5ea3c', '8a5fda9f', '12345678', 1, '8a5fda9f@qq.com', '13485937759', '1602547482000', NULL, 2);
INSERT INTO `administrators` VALUES ('62bd4', '小张啊', '12345678', 0, 'd6656028@qq.com', '18490081695', '2020-03-01', '/images/userImage.jpg', 2);
INSERT INTO `administrators` VALUES ('63910', '小李', '12345678', 1, '03000ab30@qq.com', '19988980459', '2020-03-21', '/images/userImage.jpg', 2);
INSERT INTO `administrators` VALUES ('63961', '9853', '12345678', 0, '9853@qq.com', '14542788364', '2020-05-15', '/upload/3596007e64.jpg', 1);
INSERT INTO `administrators` VALUES ('7b6af', 'c9e3ffe', '12345678', 1, 'c9e3ffe@qq.com', '13443884198', '1602547482000', NULL, 2);
INSERT INTO `administrators` VALUES ('7e690', '48880', '12345678', 1, '48880@qq.com', '18456160327', '1602558448000', NULL, 2);
INSERT INTO `administrators` VALUES ('8453c', '73d1b286', '12345678', 1, '73d1b286@qq.com', '15076351574', '1602547297000', NULL, 2);
INSERT INTO `administrators` VALUES ('94bf6', 'e935c', '12345678', 1, 'e935c@qq.com', '15191553392', '1602558448000', NULL, 2);
INSERT INTO `administrators` VALUES ('94e2e', 'efe2ebf48', '12345678', 1, 'efe2ebf48@qq.com', '19909355645', '1602552013000', NULL, 2);
INSERT INTO `administrators` VALUES ('a5581', '3c423ee13', '12345678', 1, '3c423ee13@qq.com', '17601704208', '1602558448000', NULL, 2);
INSERT INTO `administrators` VALUES ('ac7aa', 'd2e945353', '12345678', 1, 'd2e945353@qq.com', '13292876761', '1602547482000', NULL, 2);
INSERT INTO `administrators` VALUES ('adb40', '小红', '12345678', 1, '0ee7d0@qq.com', '17145375097', '2020-03-14', '/images/userImage.jpg', 2);
INSERT INTO `administrators` VALUES ('aec25', '0475b4', '12345678', 1, '0475b4@qq.com', '13594878068', '1602552013000', NULL, 2);
INSERT INTO `administrators` VALUES ('b817d', '37ccd8c', '12345678', 1, '37ccd8c@qq.com', '15866515902', '1602547481000', NULL, 2);
INSERT INTO `administrators` VALUES ('b9702', '4c885f', '12345678', 1, '4c885f@qq.com', '15671179954', '1602552013000', NULL, 2);
INSERT INTO `administrators` VALUES ('ba345', '59217a9b8', '12345678', 1, '59217a9b8@qq.com', '15957710968', '1602552013000', NULL, 2);
INSERT INTO `administrators` VALUES ('bb150', '681f11', '12345678', 1, '681f11@qq.com', '17142471475', '1602547482000', NULL, 2);
INSERT INTO `administrators` VALUES ('c7299', '81d4b2', '12345678', 1, '81d4b2@qq.com', '15871481447', '1602558448000', NULL, 2);
INSERT INTO `administrators` VALUES ('c90b2', '32ab', '12345678', 1, '32ab@qq.com', '18183431087', '1602547482000', NULL, 2);
INSERT INTO `administrators` VALUES ('cf930', 'f63a2', '12345678', 1, 'f63a2@qq.com', '13548786202', '1602558448000', NULL, 2);
INSERT INTO `administrators` VALUES ('d464b', 'f5fa99664', '12345678', 1, 'f5fa99664@qq.com', '13844765831', '1602552013000', NULL, 2);
INSERT INTO `administrators` VALUES ('d57bc', 'bce5280', '12345678', 1, 'bce5280@qq.com', '17834598174', '1602552013000', NULL, 2);
INSERT INTO `administrators` VALUES ('dd47b', 'bc93327', '12345678', 1, 'bc93327@qq.com', '19892449335', '2020-03-12', '/images/userImage.jpg', 2);
INSERT INTO `administrators` VALUES ('dde49', '0c3272', '12345678', 1, '0c3272@qq.com', '13994226077', '1602547482000', NULL, 2);
INSERT INTO `administrators` VALUES ('ea749', 'c5e5e', '12345678', 1, 'c5e5e@qq.com', '18081469916', '1602552013000', NULL, 2);
INSERT INTO `administrators` VALUES ('f0379', '阿萨德', '11111111', 1, '1123@qq.com', '15537659100', '2020-03-14', '/images/userImage.jpg', 2);
INSERT INTO `administrators` VALUES ('f26ec', '220aedbe', '12345678', 1, '220aedbe@qq.com', '13014612068', '1602547297000', NULL, 2);
INSERT INTO `administrators` VALUES ('f7f53', 'xiaoliu', '11111111', 0, 'xiaoliu123@qq.com', '13212346585', '2020-05-28', '/images/userImage.jpg', 2);
INSERT INTO `administrators` VALUES ('f8f19', '044f7c9bde', '12345678', 1, '044f7c9bde@qq.com', '13152783109', '1602547297000', NULL, 2);
INSERT INTO `administrators` VALUES ('fd2a2', 'a0efe', '12345678', 1, 'a0efe@qq.com', '18279868045', '1602547297000', NULL, 2);
INSERT INTO `administrators` VALUES ('ff345', 'xiaozhao', '11111111', 0, 'xiaozhao@qq.com', '14512345678', '2020-05-22', '/images/userImage.jpg', 2);

-- ----------------------------
-- Table structure for buycar
-- ----------------------------
DROP TABLE IF EXISTS `buycar`;
CREATE TABLE `buycar`  (
  `b_id` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购物车主键ID',
  `b_num` int(11) NOT NULL COMMENT '购买数量',
  `g_id` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品ID',
  `c_id` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `status` int(1) NOT NULL COMMENT '状态：有cid为1，无为0',
  PRIMARY KEY (`b_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `comment_id` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评价ID',
  `comment_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评价内容',
  `score` int(5) NOT NULL COMMENT '评分',
  `createTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论时间',
  `o_id` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单ID',
  `g_id` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品ID',
  `c_id` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1808617b', '苹果很甜！下次还会买', 5, '1583587562000', 'd77c90c0', '03344895', '94a2add8');
INSERT INTO `comment` VALUES ('18880088', '茄子很好吃！', 4, '1583587217000', '0079b1cc', '4cb0d1d7', '94a2add8');
INSERT INTO `comment` VALUES ('20a3cf32', '不涨反跌', 5, '1589876077000', '5902612d', '03344895', '94a2add8');
INSERT INTO `comment` VALUES ('414d406c', '很好吃！', 4, '1590636410000', '9f6234ae', '06ec4abb', '5fafb6c0');
INSERT INTO `comment` VALUES ('6218fe1d', '很一般吧', 3, '1583681872000', '775a6019', '03344895', '01fb09f7');
INSERT INTO `comment` VALUES ('944d2393', '苹果很赞！下次还来，么么哒', 4, '1583673233000', 'fba98bd5', '03344895', '015ebf93');
INSERT INTO `comment` VALUES ('988611a1', '怎么会这么好吃，已经第二次买了', 5, '1583672344000', '3385f089', '03344895', '94a2add8');
INSERT INTO `comment` VALUES ('9dc90907', '很好吃啊，下次还来买', 4, '1590633740000', '1f72dff1', '03344895', '0c4a2287');
INSERT INTO `comment` VALUES ('a2b49dd2', 'dsggH', 4, '1590028574000', '36587acd', '03344895', 'cd5ee1aa');

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers`  (
  `c_id` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `c_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名',
  `c_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `c_gender` int(1) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '性别',
  `c_birthday` date NULL DEFAULT NULL COMMENT '用户生日',
  `c_email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户邮箱',
  `c_phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户手机',
  `c_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像地址',
  `jifen` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT '积分',
  PRIMARY KEY (`c_id`) USING BTREE,
  UNIQUE INDEX `c_name`(`c_name`) USING BTREE,
  UNIQUE INDEX `c_phone`(`c_phone`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES ('015ebf93', 'dfe7阿斯', 'MTIzNDU2Nzg=', 1, '2020-03-17', 'dfe7@qq.com', '18135642223', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('01fb09f7', '6736a86c', 'MTIzNDU2Nzg=', 1, '2020-03-19', '6736a86c@qq.com', '13337611638', '/images/userImage.jpg', 0000000044);
INSERT INTO `customers` VALUES ('0c4a2287', 'test4', 'MTIzNDU2Nzg=', 0, '2020-05-28', '123@qq.com', '13212345678', '/upload/e2d3c70b7a.jpg', 0000000005);
INSERT INTO `customers` VALUES ('189f0812', 'test6', 'MTIzNDU2Nzg=', 0, '2020-05-16', '123@qq.com', '13712345678', '/upload/177eba18b0.jpg', 0000000020);
INSERT INTO `customers` VALUES ('1d0fd39c', 'xiaoliu', '11111111', 0, '2020-05-22', 'xiaoliu@qq.com', '13132165498', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('249470a1', '0242bc9dd22c402f', 'MTIzNDU2Nzg=', 1, NULL, '0242bc9dd22c402f@qq.com', '17056348850', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('2613b9c5', '0c32e486238d40', 'MTIzNDU2Nzg=', 1, NULL, '0c32e486238d40@qq.com', '18437630593', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('267ca805', '1be9b15e71ea4', 'MTIzNDU2Nzg=', 1, NULL, '1be9b15e71ea4@qq.com', '18992760357', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('28f8e3bd', '4bc6c09378f74bc686f', 'MTIzNDU2Nzg=', 1, NULL, '4bc6c09378f74bc686f@qq.com', '15503376547', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('2bf8584a', 'd63ba3b839', 'MTIzNDU2Nzg=', 1, NULL, 'd63ba3b839@qq.com', '18171581909', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('2ca509c5', 'fc1a1485492b4bd1a', 'MTIzNDU2Nzg=', 1, NULL, 'fc1a1485492b4bd1a@qq.com', '13729491405', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('2eb1c6e2', 'f6eb3', 'MTIzNDU2Nzg=', 1, NULL, 'f6eb3@qq.com', '18298039214', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('3155de28', '8a33436607b642', 'MTIzNDU2Nzg=', 1, NULL, '8a33436607b642@qq.com', '19962102594', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('31eee3c0', 'b34b6b0d146c', 'MTIzNDU2Nzg=', 1, NULL, 'b34b6b0d146c@qq.com', '15089320030', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('371ba2df', '2f67650b69b543bc9b4e', 'MTIzNDU2Nzg=', 1, NULL, '2f67650b69b543bc9b4e@qq.com', '14729488896', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('371ddd1f', 'ccb7d2a40c7', 'MTIzNDU2Nzg=', 1, NULL, 'ccb7d2a40c7@qq.com', '18826509715', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('3a33f512', 'b30d967a3a46', 'MTIzNDU2Nzg=', 1, NULL, 'b30d967a3a46@qq.com', '14573791354', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('3a60f5d0', '07796fd68ec94a04baf0', 'MTIzNDU2Nzg=', 1, NULL, '07796fd68ec94a04baf0@qq.com', '15152739652', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('3a99d13c', 'e0725', 'MTIzNDU2Nzg=', 1, NULL, 'e0725@qq.com', '15228236276', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('3b1893a7', 'd12652422', 'MTIzNDU2Nzg=', 1, NULL, 'd12652422@qq.com', '16620399951', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('3b431191', 'ed5e56c4d2e', 'MTIzNDU2Nzg=', 1, NULL, 'ed5e56c4d2e@qq.com', '13482869681', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('3ce43fee', '03bb04f7103', 'MTIzNDU2Nzg=', 1, NULL, '03bb04f7103@qq.com', '15244575020', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('3df66fab', '6cb2905bd3b940', 'MTIzNDU2Nzg=', 1, NULL, '6cb2905bd3b940@qq.com', '18488850363', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('408ddd86', 'b65f2a', 'MTIzNDU2Nzg=', 1, NULL, 'b65f2a@qq.com', '13784377448', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('439a77b5', '886bed6e27ca4297', 'MTIzNDU2Nzg=', 1, NULL, '886bed6e27ca4297@qq.com', '16661482470', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('43a396a0', 'e72065665da14da68b', 'MTIzNDU2Nzg=', 1, NULL, 'e72065665da14da68b@qq.com', '18771717682', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('43e819b8', '7d41a63571e', 'MTIzNDU2Nzg=', 1, NULL, '7d41a63571e@qq.com', '13621900284', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('44ed6887', '89aca', 'MTIzNDU2Nzg=', 1, NULL, '89aca@qq.com', '14773066761', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('4c98d804', '2fc0c2cce8', 'MTIzNDU2Nzg=', 1, NULL, '2fc0c2cce8@qq.com', '15994826538', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('4f241bb6', '2523db8', 'MTIzNDU2Nzg=', 1, NULL, '2523db8@qq.com', '13007470473', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('531a5cc8', 'db7a83a0c', 'MTIzNDU2Nzg=', 1, NULL, 'db7a83a0c@qq.com', '18297546979', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('5372d8b3', 'fa83efda82f', 'MTIzNDU2Nzg=', 1, NULL, 'fa83efda82f@qq.com', '18290321914', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('53e89237', 'a0ac180781', 'MTIzNDU2Nzg=', 1, NULL, 'a0ac180781@qq.com', '18001567030', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('582acb8b', 'f7f45ed09d', 'MTIzNDU2Nzg=', 1, NULL, 'f7f45ed09d@qq.com', '15610889114', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('5a70b6de', 'lucy', 'MTIzNDU2Nzg=', 0, '2020-02-18', '123@qq.com', '16675162368', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('5d26ec4e', '5146c6795', 'MTIzNDU2Nzg=', 1, NULL, '5146c6795@qq.com', '18883858052', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('5fafb6c0', 'xiaoli', 'MTIzNDU2Nzg=', 0, '2020-05-07', '123@qq.com', '15512364589', '/upload/31f8bdc0f3.jpg', 0000000005);
INSERT INTO `customers` VALUES ('64875a74', '938be4b', 'MTIzNDU2Nzg=', 1, NULL, '938be4b@qq.com', '13496042751', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('66945fb4', '82cb8d0fe34f49a38fa', 'MTIzNDU2Nzg=', 1, NULL, '82cb8d0fe34f49a38fa@qq.com', '13810823735', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('6cc5160f', 'test', 'MTIzNDU2Nzg=', 1, NULL, 'qwe@qq.com', '13155555555', NULL, 0000000000);
INSERT INTO `customers` VALUES ('6cd98f03', '4572823edfde4', 'MTIzNDU2Nzg=', 1, NULL, '4572823edfde4@qq.com', '15054314417', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('6d4fd80e', '23e03f', 'MTIzNDU2Nzg=', 1, NULL, '23e03f@qq.com', '13397595395', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('6da560b5', 'asds', '11111111', 0, '2020-03-18', 'asd@qq.com', '15537659000', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('6e97fa79', '22d30d8172db420fa4ed', 'MTIzNDU2Nzg=', 1, NULL, '22d30d8172db420fa4ed@qq.com', '13389268769', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('739b3642', '9aea1a5c3b6a431', 'MTIzNDU2Nzg=', 1, NULL, '9aea1a5c3b6a431@qq.com', '18762823985', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('74e71555', '181ff4514f', 'MTIzNDU2Nzg=', 1, NULL, '181ff4514f@qq.com', '16639491273', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('75d832c7', '74531a4', 'MTIzNDU2Nzg=', 1, NULL, '74531a4@qq.com', '17223991690', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('7d3f06ab', '47cc4f', 'MTIzNDU2Nzg=', 1, NULL, '47cc4f@qq.com', '17224051278', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('7edbc6a4', '238d89f8b5b', 'MTIzNDU2Nzg=', 1, NULL, '238d89f8b5b@qq.com', '17204818802', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('82ac84dc', '9e2910', 'MTIzNDU2Nzg=', 1, NULL, '9e2910@qq.com', '18359691361', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('838309f9', '84aed68c1ada', 'MTIzNDU2Nzg=', 1, NULL, '84aed68c1ada@qq.com', '14908285988', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('84649e05', 'f0de80391dcc4bdc', 'MTIzNDU2Nzg=', 1, NULL, 'f0de80391dcc4bdc@qq.com', '18384459719', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('8482bc5f', 'b17ab75', 'MTIzNDU2Nzg=', 1, NULL, 'b17ab75@qq.com', '15161086389', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('8660cf54', 'd3088', 'MTIzNDU2Nzg=', 1, NULL, 'd3088@qq.com', '18350660408', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('89743cf5', 'cfb52877c8714', 'MTIzNDU2Nzg=', 1, NULL, 'cfb52877c8714@qq.com', '13858445636', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('8dc233cc', '0b0a719cd7', 'MTIzNDU2Nzg=', 1, NULL, '0b0a719cd7@qq.com', '15639411370', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('93d78ecd', '3a54797b14e6448fbd', 'MTIzNDU2Nzg=', 1, NULL, '3a54797b14e6448fbd@qq.com', '15265959111', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('94a2add8', '路人甲1', 'MTIzNDU2Nzg=', 1, '2020-02-17', '94a2add8@qq.com', '15537659105', '/upload/15711422f7.jpg', 0000000357);
INSERT INTO `customers` VALUES ('965f3db0', 'f6bbad8023a24add97af', 'MTIzNDU2Nzg=', 1, NULL, 'f6bbad8023a24add97af@qq.com', '15599242238', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('96e718df', 'a2359', 'MTIzNDU2Nzg=', 1, NULL, 'a2359@qq.com', '18120910377', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('97211982', '08f4dd7', 'MTIzNDU2Nzg=', 1, NULL, '08f4dd7@qq.com', '17519365029', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('9a0b70c0', '773c247e5ee14d018d6', 'MTIzNDU2Nzg=', 1, NULL, '773c247e5ee14d018d6@qq.com', '18312035771', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('9c95c63d', 'e2135a592500424', 'MTIzNDU2Nzg=', 1, NULL, 'e2135a592500424@qq.com', '14519341874', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('9d955ca8', '4cf91e1089a0443f', 'MTIzNDU2Nzg=', 1, NULL, '4cf91e1089a0443f@qq.com', '15214066295', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('9e811cd1', '3c260d8', 'MTIzNDU2Nzg=', 1, NULL, '3c260d8@qq.com', '13203006611', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('a1485162', 'f95041bcf1c74', 'MTIzNDU2Nzg=', 1, NULL, 'f95041bcf1c74@qq.com', '17723257727', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('a439d60c', '067f851830ad46ac', 'MTIzNDU2Nzg=', 1, NULL, '067f851830ad46ac@qq.com', '17341264220', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('a69ff0a6', 'a4fd35c6c18d455', 'MTIzNDU2Nzg=', 1, NULL, 'a4fd35c6c18d455@qq.com', '18820357474', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('a9052298', 'ad2fd9fcc6e', 'MTIzNDU2Nzg=', 1, NULL, 'ad2fd9fcc6e@qq.com', '18242658352', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('a9acd113', 'e6239f9fa1084f3', 'MTIzNDU2Nzg=', 1, NULL, 'e6239f9fa1084f3@qq.com', '17613654025', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('ad3aa18b', '36db63bdca264559add', 'MTIzNDU2Nzg=', 1, NULL, '36db63bdca264559add@qq.com', '17123201459', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('ae979c71', 'e04dd7519c33498fb37', 'MTIzNDU2Nzg=', 1, NULL, 'e04dd7519c33498fb37@qq.com', '14575222073', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('b287d165', '5fb4431081a', 'MTIzNDU2Nzg=', 1, NULL, '5fb4431081a@qq.com', '18493569478', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('b4865972', '6d02692ec22', 'MTIzNDU2Nzg=', 1, NULL, '6d02692ec22@qq.com', '13608299675', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('bd487124', '628b7741bacf40a2b42a', 'MTIzNDU2Nzg=', 1, NULL, '628b7741bacf40a2b42a@qq.com', '18371515177', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('bd8f354a', 'bb4d0', 'MTIzNDU2Nzg=', 1, NULL, 'bb4d0@qq.com', '13324782301', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('bf8bd78e', '873019a72b3c429ba2ca', 'MTIzNDU2Nzg=', 1, NULL, '873019a72b3c429ba2ca@qq.com', '15503564678', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('c35bb1da', '03b653ab8', 'MTIzNDU2Nzg=', 1, NULL, '03b653ab8@qq.com', '18105381904', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('c394d3fd', 'd7eda30f7b', 'MTIzNDU2Nzg=', 1, NULL, 'd7eda30f7b@qq.com', '17397465390', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('c42d8901', '2fd2ff', 'MTIzNDU2Nzg=', 1, NULL, '2fd2ff@qq.com', '18113456789', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('ccd2930b', '6b2e92', 'MTIzNDU2Nzg=', 1, NULL, '6b2e92@qq.com', '17638821626', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('cd5ee1aa', 'test3', 'MTIzNDU2Nzg=', 1, '2020-05-30', '23gfs2@QQ.COM', '13145674561', '/upload/c50a1d2895.jpg', 0000000046);
INSERT INTO `customers` VALUES ('d1e3e4bd', '752f1', 'MTIzNDU2Nzg=', 1, NULL, '752f1@qq.com', '13214403727', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('d269e838', '2f352ffda8034d28', 'MTIzNDU2Nzg=', 1, NULL, '2f352ffda8034d28@qq.com', '19875772959', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('d3135dd3', '1fb1d0e263', 'MTIzNDU2Nzg=', 1, NULL, '1fb1d0e263@qq.com', '18187028501', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('da3efcfc', '6443ea', 'MTIzNDU2Nzg=', 1, NULL, '6443ea@qq.com', '13070349872', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('dba5de3d', '3e21f896f929450ca259', 'MTIzNDU2Nzg=', 1, NULL, '3e21f896f929450ca259@qq.com', '19933247265', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('dbdbb103', '559af', 'MTIzNDU2Nzg=', 1, NULL, '559af@qq.com', '17033192176', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('dc1e08f2', 'e192d5b673c840b0', 'MTIzNDU2Nzg=', 1, NULL, 'e192d5b673c840b0@qq.com', '19949092771', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('dedc40fe', '16d2aa84', 'MTIzNDU2Nzg=', 1, NULL, '16d2aa84@qq.com', '17887853710', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('deea767e', '23846d4d7dda47b78', 'MTIzNDU2Nzg=', 1, NULL, '23846d4d7dda47b78@qq.com', '18538968300', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('e258dd02', '85e1fe54464042fe', 'MTIzNDU2Nzg=', 1, NULL, '85e1fe54464042fe@qq.com', '17069679925', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('e2d82857', 'c02522b0f04148b89745', 'MTIzNDU2Nzg=', 1, NULL, 'c02522b0f04148b89745@qq.com', '18244516396', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('e4348007', '4800733e0', 'MTIzNDU2Nzg=', 1, NULL, '4800733e0@qq.com', '16665831720', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('e8762174', 'test5', 'MTIzNDU2Nzg=', 1, '2020-05-29', '125463@qq.com', '13212345679', '/upload/fc9f3ac2ff.jpg', 0000000020);
INSERT INTO `customers` VALUES ('edfb22e9', '7149c60adac', 'MTIzNDU2Nzg=', 1, NULL, '7149c60adac@qq.com', '13910332991', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('f1f17a39', 'd474e8fbfb', 'MTIzNDU2Nzg=', 1, NULL, 'd474e8fbfb@qq.com', '17340856420', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('f5232720', 'dead09089c8e492cb', 'MTIzNDU2Nzg=', 1, NULL, 'dead09089c8e492cb@qq.com', '15919115005', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('f6075c79', 'xiaozhang', '11111111', 0, '2020-05-13', '123@qq.com', '15612343241', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('f61bc380', '18aa6c1c', 'MTIzNDU2Nzg=', 1, NULL, '18aa6c1c@qq.com', '18935070463', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('f962272c', 'xiaoxiao', '11111111', 0, '2020-03-11', 'asd@qq.com', '15512345678', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('fb836ff4', '2e26d2d385', 'MTIzNDU2Nzg=', 1, NULL, '2e26d2d385@qq.com', '13173743958', '/images/userImage.jpg', 0000000000);
INSERT INTO `customers` VALUES ('fc05b270', '894c3b11a94247', 'MTIzNDU2Nzg=', 1, NULL, '894c3b11a94247@qq.com', '14589114304', '/images/userImage.jpg', 0000000000);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `g_id` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品的ID',
  `g_detailInfo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品详细信息',
  `g_price` float(10, 2) NOT NULL COMMENT '商品价格',
  `g_creatTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '生产日期',
  `g_endTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '过期日期',
  `g_num` int(5) NOT NULL COMMENT '库存',
  `g_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片',
  `g_clickNum` int(10) UNSIGNED ZEROFILL NOT NULL COMMENT '商品点击量',
  `gft_id` int(5) NOT NULL COMMENT '第一级分类',
  `gst_id` int(5) NOT NULL COMMENT '第二级分类',
  `gt_id` int(5) NOT NULL COMMENT '第三级分类',
  PRIMARY KEY (`g_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('00bfa736', '维达(Vinda) 抽纸 超韧3层130抽软抽*24包纸巾(小规格) 整箱销售（新旧产品随机发货）', 59.90, '1584633600000', '1647705600000', 100, '/images/84c160cdec8e3671.jpg', 0000000000, 5, 24, 87);
INSERT INTO `goods` VALUES ('03344895', '正常发货 烟台苹果水果礼盒栖霞红富士苹果年货礼盒一级果径80-85mm 脆甜多汁 绿色食品认证 10-12个 净重5斤', 0.10, '1582128000000', '1587571200000', 64, '/images/5b7cb524N1908eeb6_apple.jpg', 0000000097, 1, 1, 1);
INSERT INTO `goods` VALUES ('04703eb1', 'WIS隐形水润面膜【24片装】补水保湿玻尿酸清洁控油收缩毛孔提亮肤色男女士学生贴化妆品套装', 79.90, '1584633600000', '1600531200000', 100, '/images/ff0c7dfaf7e2a98e.jpg', 0000000000, 4, 18, 68);
INSERT INTO `goods` VALUES ('06ec4abb', '绿鲜知 上海青 小油菜 小青菜 约400g 火锅食材 新鲜蔬菜', 0.10, '1584633600000', '1586016000000', 95, '/images/e08301adc7fe86f9.jpg', 0000000005, 1, 5, 16);
INSERT INTO `goods` VALUES ('0c572791', '金榜题名 三只猫', 0.20, '1586707200000', '1618243200000', 100, '/upload/26cda919af.jpg', 0000000000, 2, 10, 37);
INSERT INTO `goods` VALUES ('0fdf5bd3', '良品铺子 猪肉脯自然片靖江猪肉干肉铺肉类零食休闲网红小吃100g', 25.90, '1584633600000', '1592582400000', 100, '/images/c17b2de1911bbde8.jpg', 0000000014, 2, 7, 25);
INSERT INTO `goods` VALUES ('1342f2d5', '乐事（Lay\'s）薯片 休闲零食 美国经典原味 135克', 19.90, '1584633600000', '1600531200000', 100, '/images/8a78ff96e46e4b65.jpg', 0000000010, 2, 7, 26);
INSERT INTO `goods` VALUES ('15b54928', '海南小台农芒果 1kg装 单果50g以上 新鲜水果', 29.90, '1584633600000', '1587312000000', 98, '/images/a0aaba0447d9c7df.jpg', 0000000023, 1, 1, 2);
INSERT INTO `goods` VALUES ('184dc842', '三只松鼠奶油味夏威夷果 坚果炒货孕妇坚果每日坚果干果零食160g/袋', 56.00, '1584633600000', '1600531200000', 99, '/images/a11997fcc5578c2b.jpg', 0000000040, 2, 7, 27);
INSERT INTO `goods` VALUES ('1bc70e7a', '曼秀雷敦男士控油抗痘洁面乳150ml 男士洗面奶（去黑头去油 油性护肤品 淡化痘印 深层洁净）', 69.90, '1584633600000', '1608393600000', 100, '/images/4ca571ce1c18a90b.jpg', 0000000000, 4, 18, 69);
INSERT INTO `goods` VALUES ('1dc0cac5', '欧莱雅女士 复颜玻尿酸水光充盈 全脸淡纹 紫熨斗眼霜 保湿淡化细纹 抗皱提拉紧致 30 ml', 339.00, '1584633600000', '1592582400000', 100, '/images/4e060f7c1072752c.jpg', 0000000000, 4, 18, 70);
INSERT INTO `goods` VALUES ('1deaa312', 'Anessa安热沙小金瓶防晒乳60ml (防晒霜 小金瓶 防水防汗 资生堂防晒)', 218.00, '1584633600000', '1592582400000', 100, '/images/488d3598deed2c2d.jpg', 0000000000, 4, 18, 71);
INSERT INTO `goods` VALUES ('20da9957', '金龙鱼 食用油 压榨 浓香花生油5L', 89.80, '1584633600000', '1608393600000', 100, '/images/5b3ee25bN27bc635b.jpg', 0000000000, 3, 13, 49);
INSERT INTO `goods` VALUES ('24f2c729', '赣南脐橙 鲜甜橙子 2.5kg装 单果160g-200g 生鲜自营新鲜水果', 39.90, '1584633600000', '1587312000000', 100, '/images/22171b9ee3e1acb9.jpg', 0000000000, 1, 1, 3);
INSERT INTO `goods` VALUES ('25fd12b1', '百草味 全球精选葡萄干200g/袋 提子干休闲零食新疆特产蜜饯果干小包装免洗', 12.90, '1584633600000', '1608393600000', 100, '/images/5a1ba8d8N65d14a23.jpg', 0000000000, 2, 7, 28);
INSERT INTO `goods` VALUES ('27a54105', '维达(Vinda) 卷纸 蓝色经典4层140g卫生纸巾*27卷（整箱销售）', 57.90, '1584633600000', '1616169600000', 100, '/images/278f3a7d5a3e6cbd.jpg', 0000000000, 5, 24, 88);
INSERT INTO `goods` VALUES ('2aafb91b', '百草味 肉干肉脯休闲零食小吃猪肉干靖江风味特产 白芝麻猪肉脯 100g/袋', 38.70, '1584633600000', '1600531200000', 100, '/upload/6d0543c548.jpg', 0000000000, 2, 7, 25);
INSERT INTO `goods` VALUES ('2e16ed83', '丹麦进口曲奇 皇冠（Danisa）丹麦曲奇饼干礼盒装908g（新老包装随机发货）送礼零食礼包', 62.00, '1584633600000', '1616169600000', 100, '/images/bcc2ef5d68b6ce48.jpg', 0000000000, 2, 8, 29);
INSERT INTO `goods` VALUES ('312013e9', '达利园 法式小面包香奶味 400g 休闲零食早餐面包蛋糕点心', 9.90, '1584633600000', '1616169600000', 100, '/images/55cd6685N68381baf.jpg', 0000000000, 2, 8, 30);
INSERT INTO `goods` VALUES ('3186633c', '香当当 香蕉牛奶夹心蛋糕1000g整箱早餐面包 休闲零食品网红糕点小吃的', 20.90, '1584633600000', '1603123200000', 100, '/images/3fdd500dc64659de.jpg', 0000000010, 2, 8, 31);
INSERT INTO `goods` VALUES ('31f4c8f4', '金龙鱼 食用油 黄金比例食用调和油 5L', 59.90, '1584633600000', '1608393600000', 100, '/images/01bd8435914fb4b2.jpg', 0000000026, 3, 13, 50);
INSERT INTO `goods` VALUES ('34c31f7d', '福临门 食用油 压榨一级充氮保鲜葵花籽油4L 中粮出品', 56.90, '1584633600000', '1608393600000', 100, '/images/31d84df20ca39925.jpg', 0000000000, 3, 13, 51);
INSERT INTO `goods` VALUES ('375fc268', '香奈儿(Chanel)女士香水 持久淡香氛邂逅系列/五号系列 粉色邂逅柔情发香雾35ml', 369.00, '1584633600000', '1608393600000', 100, '/images/395920f060825667.jpg', 0000000000, 4, 19, 72);
INSERT INTO `goods` VALUES ('391dafd4', '江中猴姑 酥性饼干960g（40包）20天装 猴头菇制成', 118.00, '1584633600000', '1616169600000', 100, '/images/3889fa8a5584f2cb.jpg', 0000000000, 2, 8, 32);
INSERT INTO `goods` VALUES ('3a53dd7e', '是的深V的', 12.00, '1589817600000', '1590163200000', 100, '/upload/b593cb8f46.jpg', 0000000000, 3, 14, 54);
INSERT INTO `goods` VALUES ('3be4d823', '菲拉格慕（Ferragamo）蓝色经典淡香水50ml男士香水淡香持久淡雅自然清新优雅留香男 邂逅意大利品牌进口网红', 169.00, '1584633600000', '1608393600000', 100, '/images/5efc7d43e761874a.jpg', 0000000000, 4, 19, 73);
INSERT INTO `goods` VALUES ('40346fbf', '福临门 食用油 一级大豆油5L 中粮出品', 42.90, '1584633600000', '1608393600000', 100, '/images/51175ebef2620660.jpg', 0000000000, 3, 13, 52);
INSERT INTO `goods` VALUES ('432e83f4', '美宝莲 FITme 高保湿定制妆前乳 柔雾版30ml（控油持久不脱妆油皮隔离霜打底平滑隐形毛孔平价）', 135.00, '1584633600000', '1608393600000', 100, '/images/dbd7eb23cb5276b6.jpg', 0000000000, 4, 20, 74);
INSERT INTO `goods` VALUES ('46941573', '玛丽黛佳自然生动眉笔自营送替换装 05 棕色(彩妆 防水配方 不易脱色 自然持久 )', 42.00, '1584633600000', '1647705600000', 100, '/images/45451290e07d2a50.jpg', 0000000000, 4, 20, 75);
INSERT INTO `goods` VALUES ('475e6c27', '德芙Dove巧克力分享碗装 什锦牛奶榛仁葡萄干巧克力办公室休闲零食新年春节 员工福利 249g', 28.90, '1584633600000', '1616169600000', 98, '/images/fdd416f0682d0d3e.jpg', 0000000002, 2, 9, 33);
INSERT INTO `goods` VALUES ('4cb0d1d7', '云南新鲜蔬菜长茄子露天种植 5斤装', 5.00, '1584633600000', '1585497600000', 97, '/images/d665a5efd0a90a53.jpg', 0000000013, 1, 5, 17);
INSERT INTO `goods` VALUES ('50b04656', '绿鲜知 金针菇 蘑菇 菌菇 约400g 火锅烧烤食材 新鲜蔬菜', 11.80, '1584633600000', '1586448000000', 100, '/images/6295c5069b11d93c.jpg', 0000000000, 1, 5, 18);
INSERT INTO `goods` VALUES ('514cdde1', 'Girlcult屁桃联名腮红情绪腮红暗涌晒红女盘橘色闪眼影膏高光修容 Bling Bling-奶油柿子', 59.00, '1584633600000', '1600531200000', 100, '/images/59883ac7N69b12ae8.jpg', 0000000000, 4, 20, 76);
INSERT INTO `goods` VALUES ('53b4a7eb', '崇明岛 当季新大米 米大王6号10Kg（20斤）', 108.80, '1584633600000', '1600531200000', 100, '/images/7ca83a941b2c87b3.jpg', 0000000000, 3, 14, 53);
INSERT INTO `goods` VALUES ('5b1ffb45', '清风（APP）手帕纸纸巾 原木纯品 3层10张*10包纸巾 无香型（新老交替随机发货）', 3.90, '1584633600000', '1616169600000', 100, '/images/5b30c155N28ccaf7b.jpg', 0000000000, 5, 24, 89);
INSERT INTO `goods` VALUES ('5c9f7578', '益达（Extra）尊享护齿56g*3瓶京东定制装（草本精华+冰柠+清新西柚）（新旧包装随机发）', 26.90, '1584633600000', '1616169600000', 100, '/images/583f9859Na1323aa8.jpg', 0000000000, 2, 9, 34);
INSERT INTO `goods` VALUES ('61595826', '香雪 美味富强粉 小麦粉 面粉 适合馒头 包子 烙饼等各类面食更适合蒸制类 中粮出品 5kg', 23.90, '1584633600000', '1608393600000', 100, '/images/cfdc9d6d15b26380.jpg', 0000000000, 3, 14, 54);
INSERT INTO `goods` VALUES ('65d94763', '资生堂惠润（SUPER MiLD）柔净（绿野芳香）洗发露600ml（日本进口无硅油洗发水 蓬松柔顺 持续保湿）', 67.00, '1584633600000', '1616169600000', 100, '/images/70b3effd69619a62.jpg', 0000000000, 4, 21, 77);
INSERT INTO `goods` VALUES ('66b42e2a', '越南进口红心火龙果 4个装 红肉中果 单果约330-420g 新鲜水果', 43.90, '1584633600000', '1587312000000', 100, '/images/5bc69bcfN8030a03e.jpg', 0000000000, 1, 1, 4);
INSERT INTO `goods` VALUES ('6a5836e6', 'dsghrh', 12.00, '1589990400000', '1591372800000', 100, '/upload/e906ffc578.jpg', 0000000000, 2, 8, 30);
INSERT INTO `goods` VALUES ('6c04d298', '比利时进口 克特多金象（Cote d\'Or） 86%可可黑巧克力 糖果零食 高可可含量 排装100g', 38.90, '1584633600000', '1616169600000', 100, '/images/46e7ace99f41dd41.jpg', 0000000000, 2, 9, 35);
INSERT INTO `goods` VALUES ('6e27b6f1', '金沙河面条 原味银丝挂面 龙须面 方便速食拉面 清汤面 900g', 10.80, '1584633600000', '1608393600000', 100, '/images/5b73a35aN92891309.jpg', 0000000000, 3, 14, 55);
INSERT INTO `goods` VALUES ('6ecc0d50', '徐福记 喜庆糖1500g婚庆糖果结婚喜糖(促销3斤装 每袋约300颗左右)散装混合水果口味糖果批发', 69.00, '1584633600000', '1616169600000', 100, '/images/067ceb238770f05b.jpg', 0000000000, 2, 9, 36);
INSERT INTO `goods` VALUES ('6ff26a85', '十月稻田 黄小米 红谷小米 溯源 （小黄米 月子米 小米粥 五谷杂粮 真空装）2.5kg', 35.80, '1584633600000', '1608393600000', 100, '/images/62eff05189bbd2e9.jpg', 0000000000, 3, 15, 56);
INSERT INTO `goods` VALUES ('72fba131', '温氏 供港黄油鸡 1kg 高品质供港鸡 农家散养土鸡 散养母鸡走地鸡 烤鸡烧鸡整鸡 散养90天以上', 59.00, '1584633600000', '1589904000000', 100, '/images/02429a9fb7cf26b4.jpg', 0000000000, 1, 4, 12);
INSERT INTO `goods` VALUES ('73ffebd9', '东鹏（EASTROC）东鹏特饮有奖版 维生素功能饮料 500ml*24瓶/箱 大瓶更尽兴', 62.90, '1584633600000', '1600531200000', 100, '/images/0eb50aeefd45f645.jpg', 0000000016, 2, 10, 37);
INSERT INTO `goods` VALUES ('76b185d9', '菌菇三鲜王饺子 350g*2 水饺 蒸饺 煎饺 锅贴 早餐方便菜', 29.90, '1584633600000', '1592582400000', 100, '/images/db23eb31ecd079a7.jpg', 0000000000, 1, 6, 20);
INSERT INTO `goods` VALUES ('77ccb794', '名滋园 【发2只】土鸭子整只新鲜冷冻白条鸭肉 生鲜', 59.00, '1584633600000', '1592582400000', 100, '/images/37afc46745dd963a.jpg', 0000000000, 1, 4, 13);
INSERT INTO `goods` VALUES ('7c4b1fc8', '三都港 深海速冻宁德大黄花鱼700g 2条 生鲜 海鲜水产', 55.90, '1584633600000', '1589904000000', 100, '/images/2e0faed2d99957af.jpg', 0000000000, 1, 2, 5);
INSERT INTO `goods` VALUES ('806f4a1c', '十月稻田 绿豆 （可发豆芽 打豆浆 东北 五谷 杂粮 粗粮 真空装 大米伴侣）1kg', 19.80, '1584633600000', '1608393600000', 100, '/images/3057104e7ca9c47c.jpg', 0000000000, 3, 15, 57);
INSERT INTO `goods` VALUES ('8709ca45', '大虾鲜活速冻冷冻海鲜水产基围虾厄瓜多尔白虾大对虾生鲜 虾类 带冰4斤 80100冻虾4斤', 96.00, '1584633600000', '1589904000000', 100, '/images/1723c088030fa623.jpg', 0000000000, 1, 2, 6);
INSERT INTO `goods` VALUES ('8a72ee37', '蓝月亮洗衣液12斤套装：亮白增艳薰衣草3kg瓶+1kg袋*3', 79.90, '1584633600000', '1608393600000', 100, '/images/8b1cd2dc9de448ec.jpg', 0000000000, 5, 25, 90);
INSERT INTO `goods` VALUES ('8a95fab2', '三得利（Suntory） 无糖乌龙茶饮料 500ml*15瓶整箱装', 49.50, '1584633600000', '1608393600000', 100, '/images/58df5fc6N547ffa0d.jpg', 0000000000, 2, 10, 38);
INSERT INTO `goods` VALUES ('9367e9f5', '滴露 Dettol 衣物除菌液 清新柠檬3L 高效除菌除螨 消毒液 孕妇儿童内衣内裤一起洗', 49.00, '1584633600000', '1616169600000', 100, '/images/47a4f5553c51a127.jpg', 0000000000, 5, 25, 91);
INSERT INTO `goods` VALUES ('93e92ce9', '农夫山泉 饮用水 饮用天然水塑膜量贩装550ml*12瓶（新老保质期产品随机发货）', 15.80, '1584633600000', '1647705600000', 100, '/images/9cb63a2901e829b8.jpg', 0000000000, 2, 10, 39);
INSERT INTO `goods` VALUES ('949b9f8c', '立白 全效馨香无磷洗衣粉（百合馨香）1.45kg/袋 白衣亮白 彩衣鲜艳', 14.90, '1584633600000', '1616169600000', 100, '/images/732c90477b23b1c4.jpg', 0000000000, 5, 25, 92);
INSERT INTO `goods` VALUES ('96aadba9', '十月稻田 糯米 端午 粽子米（ 黏米 东北 五谷 杂粮 真空装 大米 粥米伴侣）1kg', 14.80, '1584633600000', '1608393600000', 100, '/images/cb3a39755a8ce515.jpg', 0000000000, 3, 15, 58);
INSERT INTO `goods` VALUES ('96aed354', '立白 内衣专用除菌皂肥皂家庭特惠装（101g*4块） 健康除菌达99.9% 洁净薰香', 9.90, '1584633600000', '1616169600000', 100, '/images/5ed74f8c815bac78.jpg', 0000000000, 5, 25, 93);
INSERT INTO `goods` VALUES ('9763cf4a', '绿帝 鱿鱼干 淡晒 海鲜干货 浙江舟山 海产品 干鱿鱼300g', 29.80, '1584633600000', '1616169600000', 100, '/images/b40284bc5eb735cd.jpg', 0000000017, 1, 2, 7);
INSERT INTO `goods` VALUES ('9800effc', '滴露洗手液500g 有效抑菌99.9% 儿童宝宝健康抑菌洗手液 易冲洗 男士女士通用 呵护全家 滋润倍护1瓶', 19.90, '1584633600000', '1608393600000', 100, '/images/7ec1f81d238d450c.jpg', 0000000000, 5, 26, 94);
INSERT INTO `goods` VALUES ('9e635a75', '立白茶籽洗洁精 1.45kg*2瓶双瓶省心装 茶籽精华 健康除菌达99% 轻松去油', 19.90, '1584633600000', '1608393600000', 100, '/images/1db30fde226e5fd7.jpg', 0000000000, 5, 26, 95);
INSERT INTO `goods` VALUES ('9ff2c2c3', '花王（KAO）进口花王魔术灵浴室清洁剂（柠檬香）500ml 去污防霉除菌 瓷砖玻璃去水垢水渍', 39.90, '1584633600000', '1608393600000', 100, '/images/ec1974cbfdaed080.jpg', 0000000000, 5, 26, 96);
INSERT INTO `goods` VALUES ('a00e8fba', '十月稻田 熟黑芝麻 200g（无添加 低温炒制熟 免洗 干吃 香醇饱满 五谷杂粮 代餐 便携装）', 9.90, '1584633600000', '1608393600000', 100, '/images/5a6820d9Nfb0ee66d.jpg', 0000000000, 3, 15, 59);
INSERT INTO `goods` VALUES ('a1388f99', '乐麦点台湾原味50片*80g大克重装早餐手抓饼面饼批发 包邮 如坏包赔', 37.90, '1584633600000', '1587312000000', 100, '/images/5ae55775N41779c4f.jpg', 0000000000, 1, 6, 21);
INSERT INTO `goods` VALUES ('a4122447', '家美舒达 山东大葱 铁杆葱 净葱约700g 新鲜蔬菜', 15.90, '1584633600000', '1586016000000', 100, '/images/5b839540N5c4f20b3.jpg', 0000000000, 1, 5, 19);
INSERT INTO `goods` VALUES ('a85194c8', 'nak 香水身体乳（粉）女士 进口香氛持续留香 香体露 补水保湿滋润嫩肤 全身滋养去鸡皮可擦脸润肤乳 妩媚浓情身体乳300g（粉色）', 79.00, '1584633600000', '1608393600000', 100, '/images/9737ee4c419b6ab2.jpg', 0000000000, 4, 21, 78);
INSERT INTO `goods` VALUES ('a9e4444e', '蒙牛 纯牛奶 PURE MILK 250ml*16 礼盒装', 43.00, '1584633600000', '1592582400000', 100, '/images/2bad18cfc4c063a3.jpg', 0000000000, 2, 10, 40);
INSERT INTO `goods` VALUES ('b023c0dc', '传奇会茶叶 无农残安溪铁观音清香型 正宗兰花香闽南乌龙茶礼盒装非散装500g（250g*2）散装', 85.00, '1584633600000', '1616169600000', 100, '/images/41277bb6807be4f5.jpg', 0000000000, 2, 11, 41);
INSERT INTO `goods` VALUES ('b71c975a', '初鲜 冷冻大号带黄扇贝肉400g 50-60粒袋装 粉丝扇贝原料 火锅烧烤食材 海鲜水产', 29.80, '1584633600000', '1592582400000', 100, '/images/63753625dbf8a550.jpg', 0000000000, 1, 2, 8);
INSERT INTO `goods` VALUES ('bc9e3ec1', '飞科(FLYCO) 男士电动剃须刀 全身水洗干湿双剃刮胡刀 1小时快充90分钟长续航 FS375', 135.00, '1584633600000', '1647705600000', 100, '/images/7278320ef489199b.jpg', 0000000000, 4, 21, 79);
INSERT INTO `goods` VALUES ('bd333d93', '李锦记 酱油 锦珍生抽 味鲜凉拌蘸点 1.65L', 14.90, '1584633600000', '1600531200000', 100, '/images/70b8f1f2d0059a53.jpg', 0000000000, 3, 16, 60);
INSERT INTO `goods` VALUES ('bd59d8a2', '家の物语（KATEI STORY） 日本进口除霉清洁剂除菌清洁玻璃墙面清洗剂墙壁瓷砖浴缸水槽去污剂 (泡沫喷雾式)300ml', 28.90, '1584633600000', '1616169600000', 100, '/images/82a53144a5945c1e.jpg', 0000000000, 5, 26, 97);
INSERT INTO `goods` VALUES ('bdf1f74d', '正大（CP） 甘蓝菜猪肉包 1.02kg 12只装 包子馒头 早餐食材 方便菜', 29.90, '1584633600000', '1589904000000', 100, '/images/31d7cc8db3b831e3.jpg', 0000000000, 1, 6, 22);
INSERT INTO `goods` VALUES ('bf3801c2', '玉泽皮肤屏障深层护理套装 保湿面霜调理乳套装 面部护理套装 保湿霜+调理乳', 360.00, '1584633600000', '1608393600000', 100, '/images/5beb8305N328ffc2a.jpg', 0000000000, 4, 21, 80);
INSERT INTO `goods` VALUES ('c1ccb28f', '蜜朋 白砂糖 一级白糖 碳法工艺 烹饪烘焙调味 250g', 4.50, '1584633600000', '1616169600000', 100, '/images/5bece7f6N5cb75d52.jpg', 0000000000, 3, 16, 61);
INSERT INTO `goods` VALUES ('c2c3d92f', '茶人岭 茶叶 乌龙茶 黄金桂 特级福建乌龙茶 250g', 49.00, '1584633600000', '1616169600000', 100, '/images/5abe0776N89150b11.jpg', 0000000000, 2, 11, 42);
INSERT INTO `goods` VALUES ('c551b5b9', '三只松鼠猪肉脯 猪肉干肉脯靖江特产休闲零食100g/袋', 33.90, '1584633600000', '1600531200000', 100, '/upload/e3565e714d.jpg', 0000000000, 2, 7, 25);
INSERT INTO `goods` VALUES ('c6199bd8', '家乐 鸡粉 不添加防腐剂 代替鸡精鸡汁 270g 联合利华出品', 24.80, '1584633600000', '1616169600000', 100, '/images/9e3dcf979db9b196.jpg', 0000000000, 3, 16, 62);
INSERT INTO `goods` VALUES ('c6bf6f0c', '恒都 澳洲原切牛腩块 1kg 进口草饲牛肉生鲜', 88.00, '1584633600000', '1587312000000', 100, '/images/fa598f06b082094f.jpg', 0000000000, 1, 3, 9);
INSERT INTO `goods` VALUES ('c7f417f2', '456564354', 45.00, '1584720000000', '1585843200000', 0, '/upload/9eae7c657b.jpg', 0000000000, 2, 8, 31);
INSERT INTO `goods` VALUES ('c8996914', '舒肤佳沐浴露套装 纯白1000ml+柠檬1000ml送薰衣草400ml*2+纯白100ml*2 无皂基 男士女士通用', 79.90, '1584633600000', '1608393600000', 100, '/images/eb4773a521c11136.jpg', 0000000000, 4, 22, 81);
INSERT INTO `goods` VALUES ('c9a8bd65', '澳洲Mr Clean一次性手套 透明PVC橡胶手套A级加厚餐饮厨房家用多功能手套 100只盒装', 49.90, '1584633600000', '1616169600000', 100, '/images/9cc8e99fa6f32bc8.jpg', 0000000000, 5, 27, 98);
INSERT INTO `goods` VALUES ('ccda8084', '蒙都 新西兰羊肉卷500g 火锅食材', 39.90, '1584633600000', '1589904000000', 100, '/images/c173a71153959825.jpg', 0000000005, 1, 3, 10);
INSERT INTO `goods` VALUES ('d3cd915d', '2020新茶头芽龙井茶一杯香茶叶绿茶100克礼盒装明前春茶散装', 128.00, '1584633600000', '1616169600000', 100, '/images/a1284cf88bafc6b1.jpg', 0000000000, 2, 11, 43);
INSERT INTO `goods` VALUES ('d447ae5a', '八马茶业 茶叶 云南普洱茶熟茶茶饼黑茶自饮简易装357g', 64.90, '1584633600000', '1616169600000', 100, '/images/08aa0c0624cb271c.jpg', 0000000000, 2, 11, 44);
INSERT INTO `goods` VALUES ('d83eb992', '露西 LoShi 身体乳 马油身体乳女补水保湿润肤乳 日本进口天然精华沐浴液 身体护理润肤露 北海道护肤品485ml', 89.00, '1584633600000', '1608393600000', 100, '/images/5b6e3312N75d71d7e.jpg', 0000000000, 4, 22, 82);
INSERT INTO `goods` VALUES ('e00f4f36', '帕尔司 西班牙进口猪肋排条 1kg 进口猪排骨猪肋骨 进口猪肉生鲜 猪骨高汤红烧排骨糖醋排骨食材', 78.90, '1584633600000', '1589904000000', 100, '/images/e79b98ff7cfe3f36.jpg', 0000000000, 1, 3, 11);
INSERT INTO `goods` VALUES ('e07de2f5', '桂格早餐谷物,无添加蔗糖,膳食纤维,即食燕麦片超值装1478g,（新老包装替换中）', 22.80, '1584633600000', '1600531200000', 100, '/images/67f8b6e2d71cacee.jpg', 0000000000, 2, 12, 45);
INSERT INTO `goods` VALUES ('e1d98435', '五芳斋 速冻老传统黑芝麻汤圆 960g 48只 夜宵 早餐食材 点心', 22.90, '1584633600000', '1589904000000', 100, '/images/47c8820ae369a6e0.jpg', 0000000000, 1, 6, 23);
INSERT INTO `goods` VALUES ('e23c8043', '雀巢（Nestle）咖啡 速溶 1+2特浓 微研磨 冲调饮品 30条390g', 38.00, '1584633600000', '1616169600000', 100, '/images/969535c55f0f9122.jpg', 0000000000, 2, 12, 46);
INSERT INTO `goods` VALUES ('e3f9499f', '【晨诚】农家生态正宗土鸡蛋新鲜妈妈蛋草鸡蛋笨鸡蛋40枚 包邮', 35.80, '1584633600000', '1587312000000', 100, '/images/e50cf6a821dfbb2e.jpg', 0000000000, 1, 4, 14);
INSERT INTO `goods` VALUES ('e4a972a9', '丽容冻疮皲裂膏50g 脚裂护手霜女男脚后跟干裂脚脱皮冻伤止痒龟裂手裂润手霜护足霜', 57.00, '1584633600000', '1603123200000', 100, '/images/7345524c9d81e404.jpg', 0000000000, 4, 22, 83);
INSERT INTO `goods` VALUES ('e57249a8', '香飘飘奶茶 美味畅享20杯椰果礼盒装 原味麦香草莓香芋4种口味1.6kg 早餐冲调饮料', 69.00, '1584633600000', '1608393600000', 100, '/images/30b30a6b7fad3f35.jpg', 0000000000, 2, 12, 47);
INSERT INTO `goods` VALUES ('e71ec828', '3CE11支魅族粉黛化妆刷套装韩国特种细纤维毛散粉刷腮红刷轮廓刷粉底刷晕染刷眼影刷眉刷唇刷520情人节配桶', 158.00, '1584633600000', '1634659200000', 100, '/images/6ab736c798a18419.jpg', 0000000000, 4, 23, 84);
INSERT INTO `goods` VALUES ('e7a73ae5', '吴大嫂 东北水饺 皮皮虾馅 800g 40只 早餐 馄饨蒸饺 海鲜水饺', 29.90, '1584633600000', '1589904000000', 100, '/images/9088211d274ad355.jpg', 0000000000, 1, 6, 24);
INSERT INTO `goods` VALUES ('e7aec0e5', '尚岛宜家 抽绳手提式垃圾袋 360只装 中号45*50cm*20卷 加厚 自动收口大垃圾袋 家用办公分类垃圾桶袋', 11.80, '1584633600000', '1618848000000', 100, '/images/407d0a6e0928e868.jpg', 0000000000, 5, 27, 99);
INSERT INTO `goods` VALUES ('ea2d8caa', '中盐 盐 加碘精制盐 食盐 500g 中盐出品', 3.50, '1584633600000', '1616169600000', 100, '/images/cc06b2db39e723db.jpg', 0000000000, 3, 16, 63);
INSERT INTO `goods` VALUES ('eccc7571', '吉香居 调味酱 暴下饭牛肉酱 香菇竹笋牛肉酱（川香味）辣椒酱 川式劲辣口味 250g', 11.80, '1584633600000', '1616169600000', 100, '/images/79d153f9714561d3.jpg', 0000000000, 3, 16, 64);
INSERT INTO `goods` VALUES ('ed0d2e0b', '【晨诚】农家生态 散养新鲜鸭蛋草鸭蛋30枚', 36.80, '1584633600000', '1589904000000', 100, '/images/b0c1c30c3dd944b6.png', 0000000000, 1, 4, 15);
INSERT INTO `goods` VALUES ('ee4dcb9a', '统一 方便面 汤达人 日式豚骨味方便面 五连包', 14.90, '1584633600000', '1608393600000', 97, '/images/0bb8b4a9adf420e2.jpg', 0000000081, 3, 17, 65);
INSERT INTO `goods` VALUES ('f104f9f5', '维维 豆浆粉 营养早餐速溶即食 冲饮代餐无添加蔗糖非转基因大豆豆浆粉500g', 16.90, '1584633600000', '1616169600000', 100, '/images/7613de080c9aee15.jpg', 0000000000, 2, 12, 48);
INSERT INTO `goods` VALUES ('f16b9963', '双汇 火腿肠 润口香甜王 玉米风味香肠 30g*9/袋', 7.90, '1584633600000', '1608393600000', 100, '/images/18240dc581524d46.jpg', 0000000000, 3, 17, 66);
INSERT INTO `goods` VALUES ('f5cf3271', '牛韵 白水牛角刮痧筒拔筋棒刮痧板 茶勺 全身脸部美容美体送长辈生日礼物按摩工具按摩器具廋腿教师节', 49.00, '1584633600000', '1647705600000', 100, '/images/58906ff1N79ea9b34.jpg', 0000000000, 4, 23, 85);
INSERT INTO `goods` VALUES ('f60459d5', '振德 （ZHENDE) 口罩一次性医用口罩男女无纺布内里口罩防尘防柳絮防花粉骑行透气 10只/包 浅蓝', 18.00, '1584633600000', '1600531200000', 99, '/images/8fa65c224bc16ff1.jpg', 0000000000, 5, 27, 100);
INSERT INTO `goods` VALUES ('f9ca1d8d', '银鹭 八宝粥 桂圆八宝粥360g*12罐 整箱粥礼盒装', 39.00, '1584633600000', '1616169600000', 100, '/images/a9f0109b5d5a19dd.jpg', 0000000000, 3, 17, 67);
INSERT INTO `goods` VALUES ('fb21dcb3', '张小泉 指甲钳ZJQ-103B', 14.50, '1584633600000', '1647705600000', 100, '/images/55fb7972Nb8faea25.jpg', 0000000000, 4, 23, 86);

-- ----------------------------
-- Table structure for goods_first_type
-- ----------------------------
DROP TABLE IF EXISTS `goods_first_type`;
CREATE TABLE `goods_first_type`  (
  `gft_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '商品分类表主键ID',
  `gft_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品分类名称',
  PRIMARY KEY (`gft_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_first_type
-- ----------------------------
INSERT INTO `goods_first_type` VALUES (1, '生鲜水果');
INSERT INTO `goods_first_type` VALUES (2, '食品饮料');
INSERT INTO `goods_first_type` VALUES (3, '粮油副食');
INSERT INTO `goods_first_type` VALUES (4, '美容洗护');
INSERT INTO `goods_first_type` VALUES (5, '家具清洁');

-- ----------------------------
-- Table structure for goods_second_type
-- ----------------------------
DROP TABLE IF EXISTS `goods_second_type`;
CREATE TABLE `goods_second_type`  (
  `gst_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '二级商品分类主键ID',
  `gst_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '二级商品分类名称',
  `gft_id` int(5) NOT NULL COMMENT '一级分类ID',
  PRIMARY KEY (`gst_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_second_type
-- ----------------------------
INSERT INTO `goods_second_type` VALUES (1, '新鲜水果', 1);
INSERT INTO `goods_second_type` VALUES (2, '海鲜水产', 1);
INSERT INTO `goods_second_type` VALUES (3, '猪羊牛肉', 1);
INSERT INTO `goods_second_type` VALUES (4, '禽类蛋品', 1);
INSERT INTO `goods_second_type` VALUES (5, '新鲜蔬菜', 1);
INSERT INTO `goods_second_type` VALUES (6, '冷冻速食', 1);
INSERT INTO `goods_second_type` VALUES (7, '休闲食品', 2);
INSERT INTO `goods_second_type` VALUES (8, '蛋糕饼干', 2);
INSERT INTO `goods_second_type` VALUES (9, '糖果/巧克力', 2);
INSERT INTO `goods_second_type` VALUES (10, '饮料/水', 2);
INSERT INTO `goods_second_type` VALUES (11, '茗茶', 2);
INSERT INTO `goods_second_type` VALUES (12, '营养冲调', 2);
INSERT INTO `goods_second_type` VALUES (13, '食用油', 3);
INSERT INTO `goods_second_type` VALUES (14, '米面/面粉', 3);
INSERT INTO `goods_second_type` VALUES (15, '健康杂粮', 3);
INSERT INTO `goods_second_type` VALUES (16, '厨房调味', 3);
INSERT INTO `goods_second_type` VALUES (17, '方便速食', 3);
INSERT INTO `goods_second_type` VALUES (18, '面部护肤', 4);
INSERT INTO `goods_second_type` VALUES (19, '香水', 4);
INSERT INTO `goods_second_type` VALUES (20, '彩妆', 4);
INSERT INTO `goods_second_type` VALUES (21, '男士专区', 4);
INSERT INTO `goods_second_type` VALUES (22, '身体护肤', 4);
INSERT INTO `goods_second_type` VALUES (23, '美容工具', 4);
INSERT INTO `goods_second_type` VALUES (24, '纸品湿巾', 5);
INSERT INTO `goods_second_type` VALUES (25, '衣物清洁', 5);
INSERT INTO `goods_second_type` VALUES (26, '家庭清洁', 5);
INSERT INTO `goods_second_type` VALUES (27, '一次性用品', 5);

-- ----------------------------
-- Table structure for goods_three_type
-- ----------------------------
DROP TABLE IF EXISTS `goods_three_type`;
CREATE TABLE `goods_three_type`  (
  `gt_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '商品三级分类ID',
  `gt_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品三级分类名称',
  `gft_id` int(5) NOT NULL COMMENT '商品一级分类ID',
  `gst_id` int(5) NOT NULL COMMENT '商品二级分类ID',
  PRIMARY KEY (`gt_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_three_type
-- ----------------------------
INSERT INTO `goods_three_type` VALUES (1, '苹果', 1, 1);
INSERT INTO `goods_three_type` VALUES (2, '芒果', 1, 1);
INSERT INTO `goods_three_type` VALUES (3, '橙子', 1, 1);
INSERT INTO `goods_three_type` VALUES (4, '火龙果', 1, 1);
INSERT INTO `goods_three_type` VALUES (5, '鱼类', 1, 2);
INSERT INTO `goods_three_type` VALUES (6, '虾类', 1, 2);
INSERT INTO `goods_three_type` VALUES (7, '海产干货', 1, 2);
INSERT INTO `goods_three_type` VALUES (8, '贝类', 1, 2);
INSERT INTO `goods_three_type` VALUES (9, '牛肉', 1, 3);
INSERT INTO `goods_three_type` VALUES (10, '羊肉', 1, 3);
INSERT INTO `goods_three_type` VALUES (11, '猪肉', 1, 3);
INSERT INTO `goods_three_type` VALUES (12, '鸡', 1, 4);
INSERT INTO `goods_three_type` VALUES (13, '鸭', 1, 4);
INSERT INTO `goods_three_type` VALUES (14, '鸡蛋', 1, 4);
INSERT INTO `goods_three_type` VALUES (15, '鸭蛋', 1, 4);
INSERT INTO `goods_three_type` VALUES (16, '叶菜类', 1, 5);
INSERT INTO `goods_three_type` VALUES (17, '瓜果茄类', 1, 5);
INSERT INTO `goods_three_type` VALUES (18, '鲜菌菇', 1, 5);
INSERT INTO `goods_three_type` VALUES (19, '葱姜蒜类', 1, 5);
INSERT INTO `goods_three_type` VALUES (20, '水饺', 1, 6);
INSERT INTO `goods_three_type` VALUES (21, '手抓饼', 1, 6);
INSERT INTO `goods_three_type` VALUES (22, '包子', 1, 6);
INSERT INTO `goods_three_type` VALUES (23, '汤圆', 1, 6);
INSERT INTO `goods_three_type` VALUES (24, '馄饨', 1, 6);
INSERT INTO `goods_three_type` VALUES (25, '猪肉脯', 2, 7);
INSERT INTO `goods_three_type` VALUES (26, '薯片/膨化', 2, 7);
INSERT INTO `goods_three_type` VALUES (27, '坚果炒类', 2, 7);
INSERT INTO `goods_three_type` VALUES (28, '蜜饯果干', 2, 7);
INSERT INTO `goods_three_type` VALUES (29, '曲奇', 2, 8);
INSERT INTO `goods_three_type` VALUES (30, '面包', 2, 8);
INSERT INTO `goods_three_type` VALUES (31, '蛋糕', 2, 8);
INSERT INTO `goods_three_type` VALUES (32, '饼干', 2, 8);
INSERT INTO `goods_three_type` VALUES (33, '巧克力', 2, 9);
INSERT INTO `goods_three_type` VALUES (34, '口香糖', 2, 9);
INSERT INTO `goods_three_type` VALUES (35, '黑巧克力', 2, 9);
INSERT INTO `goods_three_type` VALUES (36, '喜糖', 2, 9);
INSERT INTO `goods_three_type` VALUES (37, '功能类', 2, 10);
INSERT INTO `goods_three_type` VALUES (38, '茶饮', 2, 10);
INSERT INTO `goods_three_type` VALUES (39, '矿泉水', 2, 10);
INSERT INTO `goods_three_type` VALUES (40, '牛奶', 2, 10);
INSERT INTO `goods_three_type` VALUES (41, '铁观音', 2, 11);
INSERT INTO `goods_three_type` VALUES (42, '乌龙茶', 2, 11);
INSERT INTO `goods_three_type` VALUES (43, '龙井', 2, 11);
INSERT INTO `goods_three_type` VALUES (44, '普洱', 2, 11);
INSERT INTO `goods_three_type` VALUES (45, '麦片', 2, 12);
INSERT INTO `goods_three_type` VALUES (46, '咖啡', 2, 12);
INSERT INTO `goods_three_type` VALUES (47, '奶茶', 2, 12);
INSERT INTO `goods_three_type` VALUES (48, '谷粉豆浆', 2, 12);
INSERT INTO `goods_three_type` VALUES (49, '花生油', 3, 13);
INSERT INTO `goods_three_type` VALUES (50, '调和油', 3, 13);
INSERT INTO `goods_three_type` VALUES (51, '葵花籽油', 3, 13);
INSERT INTO `goods_three_type` VALUES (52, '大豆油', 3, 13);
INSERT INTO `goods_three_type` VALUES (53, '大米', 3, 14);
INSERT INTO `goods_three_type` VALUES (54, '面粉', 3, 14);
INSERT INTO `goods_three_type` VALUES (55, '挂面', 3, 14);
INSERT INTO `goods_three_type` VALUES (56, '小米', 3, 15);
INSERT INTO `goods_three_type` VALUES (57, '绿豆', 3, 15);
INSERT INTO `goods_three_type` VALUES (58, '糯米', 3, 15);
INSERT INTO `goods_three_type` VALUES (59, '黑芝麻', 3, 15);
INSERT INTO `goods_three_type` VALUES (60, '酱油', 3, 16);
INSERT INTO `goods_three_type` VALUES (61, '白糖', 3, 16);
INSERT INTO `goods_three_type` VALUES (62, '味精/鸡精', 3, 16);
INSERT INTO `goods_three_type` VALUES (63, '盐', 3, 16);
INSERT INTO `goods_three_type` VALUES (64, '调味酱', 3, 16);
INSERT INTO `goods_three_type` VALUES (65, '方便面', 3, 17);
INSERT INTO `goods_three_type` VALUES (66, '火腿肠', 3, 17);
INSERT INTO `goods_three_type` VALUES (67, '八宝粥', 3, 17);
INSERT INTO `goods_three_type` VALUES (68, '面膜', 4, 18);
INSERT INTO `goods_three_type` VALUES (69, '洁面', 4, 18);
INSERT INTO `goods_three_type` VALUES (70, '眼霜', 4, 18);
INSERT INTO `goods_three_type` VALUES (71, '防晒', 4, 18);
INSERT INTO `goods_three_type` VALUES (72, '女士香水', 4, 19);
INSERT INTO `goods_three_type` VALUES (73, '男士香水', 4, 19);
INSERT INTO `goods_three_type` VALUES (74, '底妆', 4, 20);
INSERT INTO `goods_three_type` VALUES (75, '眉笔', 4, 20);
INSERT INTO `goods_three_type` VALUES (76, '腮红', 4, 20);
INSERT INTO `goods_three_type` VALUES (77, '洗发护理', 4, 21);
INSERT INTO `goods_three_type` VALUES (78, '身体护理', 4, 21);
INSERT INTO `goods_three_type` VALUES (79, '剃须刀', 4, 21);
INSERT INTO `goods_three_type` VALUES (80, '面部护理', 4, 21);
INSERT INTO `goods_three_type` VALUES (81, '沐浴', 4, 22);
INSERT INTO `goods_three_type` VALUES (82, '润肤', 4, 22);
INSERT INTO `goods_three_type` VALUES (83, '手足', 4, 22);
INSERT INTO `goods_three_type` VALUES (84, '化妆工具', 4, 23);
INSERT INTO `goods_three_type` VALUES (85, '美体工具', 4, 23);
INSERT INTO `goods_three_type` VALUES (86, '指甲刀', 4, 23);
INSERT INTO `goods_three_type` VALUES (87, '抽纸', 5, 24);
INSERT INTO `goods_three_type` VALUES (88, '卷纸', 5, 24);
INSERT INTO `goods_three_type` VALUES (89, '手帕纸', 5, 24);
INSERT INTO `goods_three_type` VALUES (90, '洗衣液', 5, 25);
INSERT INTO `goods_three_type` VALUES (91, '除菌消毒', 5, 25);
INSERT INTO `goods_three_type` VALUES (92, '洗衣粉', 5, 25);
INSERT INTO `goods_three_type` VALUES (93, '洗衣皂', 5, 25);
INSERT INTO `goods_three_type` VALUES (94, '洗手液', 5, 26);
INSERT INTO `goods_three_type` VALUES (95, '洗洁精', 5, 26);
INSERT INTO `goods_three_type` VALUES (96, '卫浴清洁', 5, 26);
INSERT INTO `goods_three_type` VALUES (97, '墙面玻璃清洁', 5, 26);
INSERT INTO `goods_three_type` VALUES (98, '手套', 5, 27);
INSERT INTO `goods_three_type` VALUES (99, '垃圾袋', 5, 27);
INSERT INTO `goods_three_type` VALUES (100, '口罩', 5, 27);

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice`  (
  `n_id` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告ID',
  `n_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告内容',
  `n_createTime` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `admin_id` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理员ID',
  PRIMARY KEY (`n_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('77bb291b', '大促销就现在', '1590595200000', '63961');
INSERT INTO `notice` VALUES ('9a6fc19d', '猪肉大降价', '1590595200000', '63961');

-- ----------------------------
-- Table structure for orderinfo
-- ----------------------------
DROP TABLE IF EXISTS `orderinfo`;
CREATE TABLE `orderinfo`  (
  `o_id` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单ID',
  `c_id` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `a_id` char(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址ID',
  `g_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品ID集合',
  `g_nums` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品数量对应集合',
  `total_money` float(255, 2) NOT NULL COMMENT '订单金额',
  `createTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单创建时间戳',
  `alipay_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝交易订单',
  `is_comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '对应商品是否评价',
  `pay_status` int(1) NOT NULL COMMENT '支付状态；0：未付款；1：付款成功；2：待发货；3：已完成',
  PRIMARY KEY (`o_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderinfo
-- ----------------------------
INSERT INTO `orderinfo` VALUES ('0079b1cc', '94a2add8', '43eb7cac', '4cb0d1d7', '1', 5.00, '1583249183000', '2020030322001466010500452163', '1', 3);
INSERT INTO `orderinfo` VALUES ('08b95016', 'b978f7f9', 'e99252df', '03344895', '1', 0.00, '1589956382000', '', '0', 2);
INSERT INTO `orderinfo` VALUES ('0cf4f7e9', 'b978f7f9', 'e99252df', '06ec4abb-03344895', '1-1', 0.20, '1589958837000', '2020052022001466010500518167', '0-0', 3);
INSERT INTO `orderinfo` VALUES ('0ef97d10', '01fb09f7', '80afc2f0', '03344895-06ec4abb', '1-1', 0.20, '1583776787000', '2020031022001466010500466166', '0-0', 2);
INSERT INTO `orderinfo` VALUES ('15950582', '94a2add8', '4d80cd64', 'ee4dcb9a-03344895', '1-2', 15.10, '1586176032000', '2020040622001466010500485375', '0-0', 2);
INSERT INTO `orderinfo` VALUES ('173d9206', '015ebf93', 'f44c9c6b', '03344895', '2', 0.20, '1583679342000', '2020030822001466010500460781', '0', 2);
INSERT INTO `orderinfo` VALUES ('1f72dff1', '0c4a2287', '9212d7fb', '03344895-ee4dcb9a', '2-1', 15.10, '1590633361000', '2020052822001466010500523386', '0', 3);
INSERT INTO `orderinfo` VALUES ('203b3cfc', 'b978f7f9', 'e99252df', '03344895-475e6c27', '2-1', 29.10, '1589955089000', '2020052022001466010500518329', '0', 3);
INSERT INTO `orderinfo` VALUES ('2974689c', '01fb09f7', '80afc2f0', '06ec4abb', '1', 0.00, '1583853394000', '', '0', 2);
INSERT INTO `orderinfo` VALUES ('3385f089', '94a2add8', '34967893', '03344895', '1', 0.10, '1583592006000', '2020030722001466010500459956', '1', 3);
INSERT INTO `orderinfo` VALUES ('36587acd', 'cd5ee1aa', '6d32a187', '06ec4abb-03344895-184dc842', '1-1-1', 56.20, '1590028346000', '2020052122001466010500518917', '0', 3);
INSERT INTO `orderinfo` VALUES ('57540df1', '189f0812', '98b0cc5f', '15b54928-03344895', '1-2', 30.10, '1590634588000', '2020052822001466010500523387', '0-0', 2);
INSERT INTO `orderinfo` VALUES ('5902612d', '94a2add8', '4d80cd64', '03344895', '1', 0.00, '1589875884000', '', '1', 3);
INSERT INTO `orderinfo` VALUES ('603f1936', '015ebf93', 'f44c9c6b', '03344895', '2', 0.20, '1583679464000', '2020030822001466010500462280', '0', 2);
INSERT INTO `orderinfo` VALUES ('68f6c5fc', '0c4a2287', '9212d7fb', '06ec4abb', '1', 0.00, '1590633469000', '', '0', 3);
INSERT INTO `orderinfo` VALUES ('744546e9', 'cc2ffd77', '191ddec4', '03344895', '2', 0.20, '1590632628000', '2020052822001466010500523234', '0', 1);
INSERT INTO `orderinfo` VALUES ('775a6019', '01fb09f7', '80afc2f0', '03344895', '1', 0.10, '1583681807000', '2020030822001466010500461256', '1', 2);
INSERT INTO `orderinfo` VALUES ('79aaa313', 'b978f7f9', 'e99252df', '475e6c27-03344895', '1-1', 29.00, '1589959037000', '2020052022001466010500518168', '0', 3);
INSERT INTO `orderinfo` VALUES ('81ebb425', 'e8762174', '35805185', '15b54928-03344895', '1-2', 30.10, '1590634049000', '2020052822001466010500523578', '0-0', 1);
INSERT INTO `orderinfo` VALUES ('84a82972', '52b2c4f4', '8fe6ce9e', '03344895', '2', 0.20, '1590632901000', '', '0', 0);
INSERT INTO `orderinfo` VALUES ('9552d19d', 'e8762174', '35805185', '06ec4abb', '1', 0.00, '1590634138000', '', '0', 1);
INSERT INTO `orderinfo` VALUES ('99af5d36', '015ebf93', 'f44c9c6b', '03344895', '1', 0.10, '1583679926000', '2020030822001466010500460782', '0', 2);
INSERT INTO `orderinfo` VALUES ('9c05fe22', '94a2add8', '4d80cd64', '03344895', '1', 0.00, '1586176121000', '', '0', 3);
INSERT INTO `orderinfo` VALUES ('9f6234ae', '5fafb6c0', '7501505d', '06ec4abb', '1', 0.00, '1590636083000', '', '1', 3);
INSERT INTO `orderinfo` VALUES ('a3b8aabb', '01fb09f7', '80afc2f0', '03344895', '1', 0.10, '1583778330000', '2020031022001466010500466549', '0', 2);
INSERT INTO `orderinfo` VALUES ('aa32f793', '94a2add8', '4d80cd64', '0fdf5bd3', '1', 25.90, '1585230239000', '', '0', 0);
INSERT INTO `orderinfo` VALUES ('b22ab9b0', '94a2add8', '4d80cd64', '03344895-f60459d5', '1-1', 18.10, '1589854923000', '2020051922001466010500517513', '0-0', 1);
INSERT INTO `orderinfo` VALUES ('b4e31a14', '189f0812', '98b0cc5f', '06ec4abb', '1', 0.00, '1590634687000', '', '0', 1);
INSERT INTO `orderinfo` VALUES ('b55baf13', '292f5833', '48c621d9', '03344895', '2', 0.20, '1590632139000', '', '0', 0);
INSERT INTO `orderinfo` VALUES ('c1ad15e1', '94a2add8', '4d80cd64', '4cb0d1d7', '1', 5.00, '1585579516000', '2020033022001466010500480921', '0', 1);
INSERT INTO `orderinfo` VALUES ('c734a5fa', '01fb09f7', '80afc2f0', '4cb0d1d7', '1', 5.00, '1583849682000', '2020031022001466010500466283', '0', 2);
INSERT INTO `orderinfo` VALUES ('d5444797', '015ebf93', 'f44c9c6b', '03344895', '1', 0.10, '1583679684000', '2020030822001466010500462281', '0', 2);
INSERT INTO `orderinfo` VALUES ('d5537145', '01fb09f7', '80afc2f0', '06ec4abb', '1', 0.00, '1583853173000', '', '0', 2);
INSERT INTO `orderinfo` VALUES ('d620aff6', '94a2add8', '34967893', '06ec4abb', '1', 0.10, '1587348438000', '2020042022001466010500494786', '0', 2);
INSERT INTO `orderinfo` VALUES ('d77c90c0', '94a2add8', '43eb7cac', '03344895-06ec4abb', '1-1', 0.20, '1583587489000', '2020030722001466010500458823', '1', 3);
INSERT INTO `orderinfo` VALUES ('db82ccd4', '94a2add8', '43eb7cac', '03344895-06ec4abb', '1-1', 0.20, '1583587713000', '', '0-0', 0);
INSERT INTO `orderinfo` VALUES ('dd40d966', '015ebf93', 'f44c9c6b', '03344895', '1', 0.10, '1583678774000', '2020030822001466010500461110', '0', 2);
INSERT INTO `orderinfo` VALUES ('e9f60a83', '015ebf93', 'f44c9c6b', '03344895', '2', 0.20, '1583679458000', '', '0', 0);
INSERT INTO `orderinfo` VALUES ('ea80f11b', '5fafb6c0', '7501505d', 'ee4dcb9a-03344895', '1-2', 15.10, '1590635993000', '2020052822001466010500523389', '0-0', 1);
INSERT INTO `orderinfo` VALUES ('ef2d85c2', '94a2add8', '4d80cd64', '06ec4abb', '1', 0.10, '1586708294000', '', '0', 0);
INSERT INTO `orderinfo` VALUES ('f4e93fcb', '94a2add8', '4d80cd64', '06ec4abb', '1', 0.00, '1585579625000', '', '0', 1);
INSERT INTO `orderinfo` VALUES ('fba98bd5', '015ebf93', 'f44c9c6b', '03344895', '1', 0.10, '1583673156000', '2020030822001466010500461109', '1', 2);
INSERT INTO `orderinfo` VALUES ('ff1400bc', 'cd5ee1aa', '6d32a187', '03344895', '1', 0.00, '1590028426000', '', '0', 1);

SET FOREIGN_KEY_CHECKS = 1;
