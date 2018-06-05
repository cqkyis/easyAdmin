/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50635
Source Host           : localhost:3306
Source Database       : easyadmin

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2018-06-06 07:45:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ky_good
-- ----------------------------
DROP TABLE IF EXISTS `ky_good`;
CREATE TABLE `ky_good` (
  `good_id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_id` int(11) NOT NULL COMMENT '商品分类',
  `good_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL COMMENT '产品名称',
  `good_img` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '商品图片',
  `context` text COLLATE utf8_unicode_ci COMMENT '产品详细',
  `price` decimal(10,0) DEFAULT NULL,
  `creattime` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建时间',
  `good_s_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '商品短标题',
  `mall_price` decimal(10,2) NOT NULL COMMENT '商城价',
  `cost_price` decimal(10,2) DEFAULT NULL COMMENT '成本价',
  `is_new` tinyint(2) DEFAULT '0',
  `keys` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关键字',
  `is_home` tinyint(2) DEFAULT '0' COMMENT '首页推荐',
  `good_code` int(11) DEFAULT NULL COMMENT '产品编号',
  `wx_title` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '微信分享标题',
  `wx_cont` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '微信分享说明',
  PRIMARY KEY (`good_id`)
) ENGINE=MyISAM AUTO_INCREMENT=128 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ky_good
-- ----------------------------
INSERT INTO `ky_good` VALUES ('125', '1', '越南进口新鲜白心火龙果', 'good/5b0cc95df07a8.jpg', null, '50', '1527564758', '热带水果白肉非红色5斤包送', '29.90', null, '1', '热带水果', null, '9828', '', '');
INSERT INTO `ky_good` VALUES ('126', '1', 'Zespri佳沛新西兰绿奇异果', 'good/5b0cca41470b8.jpg', null, '26', '1527564907', '6个93-115g/个', '25.70', null, '1', '奇异果', null, '1079', '', '');
INSERT INTO `ky_good` VALUES ('127', '1', '测试商品', 'good/5b0e4307195dc.jpg', null, '16', '1527661341', '测试短标题', '0.01', null, '1', '', null, '3174', '', '');

-- ----------------------------
-- Table structure for ky_good_advert
-- ----------------------------
DROP TABLE IF EXISTS `ky_good_advert`;
CREATE TABLE `ky_good_advert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `advert_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '广告名称',
  `advert_urls` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '链接地址',
  `start_time` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '开始时间',
  `end_time` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '结束时间',
  `creattime` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0禁止，1启动',
  `cate_id` int(11) DEFAULT NULL,
  `advert_img` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '广告图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ky_good_advert
-- ----------------------------
INSERT INTO `ky_good_advert` VALUES ('1', '测试广告', '#', '2018-05-25', '2018-05-31', '1527233702', '1', '1', 'advert/5b07bae47a058.png');
INSERT INTO `ky_good_advert` VALUES ('2', '测试广告', '#', '2018-05-25', '2018-05-31', '1527233702', '1', '1', 'advert/5b07bc297e2c0.png');
INSERT INTO `ky_good_advert` VALUES ('3', '测试广告', '#', '2018-05-25', '2018-05-31', '1527233702', '1', '1', 'advert/5b07bc81a6360.png');

-- ----------------------------
-- Table structure for ky_good_cate
-- ----------------------------
DROP TABLE IF EXISTS `ky_good_cate`;
CREATE TABLE `ky_good_cate` (
  `cate_id` int(11) NOT NULL AUTO_INCREMENT,
  `cate_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL COMMENT '分类名称',
  `orderby` tinyint(11) DEFAULT '100' COMMENT '排序',
  `parent_id` int(11) DEFAULT '0' COMMENT '上级ID',
  `remark` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`cate_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ky_good_cate
-- ----------------------------
INSERT INTO `ky_good_cate` VALUES ('1', '水果', '1', '0', '');
INSERT INTO `ky_good_cate` VALUES ('6', '水2', '0', '5', '');
INSERT INTO `ky_good_cate` VALUES ('5', '水1', '0', '1', '');
INSERT INTO `ky_good_cate` VALUES ('7', '蔬菜', '2', '0', '蔬菜');
INSERT INTO `ky_good_cate` VALUES ('8', '零食', '3', '0', '零食');
INSERT INTO `ky_good_cate` VALUES ('9', '乳品', '4', '0', '乳品');
INSERT INTO `ky_good_cate` VALUES ('10', '饮品', '5', '0', '饮品');

-- ----------------------------
-- Table structure for ky_good_config
-- ----------------------------
DROP TABLE IF EXISTS `ky_good_config`;
CREATE TABLE `ky_good_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `postprice` decimal(10,2) DEFAULT NULL COMMENT '配送费',
  `mprice` decimal(10,2) DEFAULT NULL COMMENT '满多少元包送',
  `sendtime` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '送达时间',
  `yetime` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '营业时间',
  `yetimes` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '关门时间',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ky_good_config
-- ----------------------------
INSERT INTO `ky_good_config` VALUES ('1', '0.00', '30.00', '35', '6:00', '22:00');

-- ----------------------------
-- Table structure for ky_good_imgs
-- ----------------------------
DROP TABLE IF EXISTS `ky_good_imgs`;
CREATE TABLE `ky_good_imgs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) DEFAULT NULL,
  `imgs` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ky_good_imgs
-- ----------------------------
INSERT INTO `ky_good_imgs` VALUES ('1', '125', 'good/5b0cc99fcc588.jpg');
INSERT INTO `ky_good_imgs` VALUES ('2', '125', 'good/5b0cc99fc2d30.jpg');
INSERT INTO `ky_good_imgs` VALUES ('3', '126', 'good/5b0cca4d8a6d8.jpg');
INSERT INTO `ky_good_imgs` VALUES ('4', '126', 'good/5b0cca4d7eb58.jpg');
INSERT INTO `ky_good_imgs` VALUES ('5', '127', 'good/5b0e4310eb154.jpg');

-- ----------------------------
-- Table structure for ky_order
-- ----------------------------
DROP TABLE IF EXISTS `ky_order`;
CREATE TABLE `ky_order` (
  `orderId` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `ordercode` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单编号',
  `uid` int(11) DEFAULT NULL COMMENT '所属用户',
  `price` decimal(10,2) DEFAULT NULL COMMENT '商品价格',
  `nums` int(11) DEFAULT NULL COMMENT '数量',
  `stauts` tinyint(4) DEFAULT '0' COMMENT '状态，0未支付，1支付成功，2配送，3，退款，4，完成',
  `creattime` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建时间',
  `postprice` decimal(10,2) DEFAULT NULL COMMENT '运费',
  `sprice` decimal(10,2) DEFAULT NULL COMMENT '付款金额',
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ky_order
-- ----------------------------
INSERT INTO `ky_order` VALUES ('95', '15281054463721765881', '7', '0.01', '1', '0', '1528105446', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('96', '15281054815064676490', '7', '0.01', '1', '1', '1528105481', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('97', '15281055003224174708', '7', '0.01', '1', '1', '1528105500', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('98', '15281056137339810467', '7', '0.01', '1', '1', '1528105613', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('99', '15281056447455340918', '7', '0.01', '1', '1', '1528105644', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('100', '15281056711362697837', '7', '0.01', '1', '1', '1528105671', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('101', '15281057144725183684', '7', '0.01', '1', '2', '1528105714', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('102', '15281057660651185237', '7', '0.01', '1', '3', '1528105767', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('103', '15281058211879732539', '7', '0.01', '1', '2', '1528105821', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('104', '15281058657584412767', '7', '0.01', '1', '2', '1528105865', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('105', '15281058753202709468', '7', '0.01', '1', '2', '1528105875', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('106', '15281059656772991960', '7', '0.01', '1', '3', '1528105965', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('107', '15281059822744267073', '7', '0.01', '1', '2', '1528105982', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('108', '15281059999786783618', '7', '0.01', '1', '2', '1528105999', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('109', '15281060216481695793', '7', '0.01', '1', '4', '1528106021', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('110', '15281060348971753512', '7', '0.01', '1', '4', '1528106034', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('111', '15281060571088008759', '7', '0.01', '1', '4', '1528106057', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('112', '15281060703166688510', '7', '0.01', '1', '4', '1528106070', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('113', '15281061728758150012', '7', '0.01', '1', '0', '1528106172', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('114', '15281061930123549178', '7', '0.01', '1', '0', '1528106193', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('115', '15281062066775481659', '7', '0.01', '1', '0', '1528106206', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('116', '15281063257187145044', '7', '0.01', '1', '0', '1528106325', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('117', '15281064151396191628', '7', '0.01', '1', '0', '1528106415', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('118', '15281065821785545002', '7', '0.01', '1', '0', '1528106582', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('119', '15281066174808502317', '7', '0.01', '1', '0', '1528106617', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('120', '15281066680682133076', '7', '0.01', '1', '0', '1528106668', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('121', '15281067534807790954', '7', '0.01', '1', '0', '1528106753', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('122', '15281068353919330705', '7', '0.01', '1', '0', '1528106835', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('123', '15281068892637015518', '7', '0.01', '1', '0', '1528106889', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('124', '15281071203067021157', '7', '0.01', '1', '0', '1528107120', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('125', '15281072897802463305', '7', '0.01', '1', '0', '1528107289', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('126', '15281073229745188790', '7', '0.01', '1', '0', '1528107322', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('127', '15281077725268821634', '7', '0.01', '1', '0', '1528107772', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('128', '15281078970153099485', '7', '0.01', '1', '0', '1528107897', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('129', '15281079560367506369', '7', '0.01', '1', '0', '1528107956', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('130', '15281082521878099672', '7', '0.01', '1', '0', '1528108252', '3.00', '3.01');
INSERT INTO `ky_order` VALUES ('131', '15281099342064788993', '7', '0.01', '1', '0', '1528109934', '0.00', '0.01');

-- ----------------------------
-- Table structure for ky_order_goods
-- ----------------------------
DROP TABLE IF EXISTS `ky_order_goods`;
CREATE TABLE `ky_order_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordercode` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单编号',
  `good_id` int(11) DEFAULT NULL COMMENT '产品ID',
  `good_price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `good_num` tinyint(4) DEFAULT NULL COMMENT '数量',
  `good_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产品名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ky_order_goods
-- ----------------------------
INSERT INTO `ky_order_goods` VALUES ('23', '15277386415603679571', '125', '29.90', '1', '越南进口新鲜白心火龙果');
INSERT INTO `ky_order_goods` VALUES ('24', '15277386415603679571', '126', '25.70', '2', 'Zespri佳沛新西兰绿奇异果');
INSERT INTO `ky_order_goods` VALUES ('25', '15277386415603679571', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('26', '15277387277661299881', '125', '29.90', '2', '越南进口新鲜白心火龙果');
INSERT INTO `ky_order_goods` VALUES ('27', '15277388605836959692', '125', '29.90', '1', '越南进口新鲜白心火龙果');
INSERT INTO `ky_order_goods` VALUES ('28', '15277388605836959692', '126', '25.70', '1', 'Zespri佳沛新西兰绿奇异果');
INSERT INTO `ky_order_goods` VALUES ('29', '15277388605836959692', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('30', '15277391330162457040', '125', '29.90', '1', '越南进口新鲜白心火龙果');
INSERT INTO `ky_order_goods` VALUES ('31', '15277392591634546471', '125', '29.90', '1', '越南进口新鲜白心火龙果');
INSERT INTO `ky_order_goods` VALUES ('32', '15277394789686300513', '125', '29.90', '1', '越南进口新鲜白心火龙果');
INSERT INTO `ky_order_goods` VALUES ('33', '15277396413732069451', '125', '29.90', '1', '越南进口新鲜白心火龙果');
INSERT INTO `ky_order_goods` VALUES ('34', '15280734520893601829', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('35', '15280735074210057835', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('36', '15280737743731284098', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('37', '15280738099496510729', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('38', '15280738391726683840', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('39', '15280738551699248646', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('40', '15280933504732265390', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('41', '15280935193867051749', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('42', '15280939207807405365', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('43', '15280939574523786238', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('44', '15280939712079081246', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('45', '15280941591350428365', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('46', '15280941993496457223', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('47', '15280942389692589350', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('48', '15280942738028431629', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('49', '15280946033686910755', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('50', '15280950626337082354', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('51', '15280950626337082354', '126', '25.70', '1', 'Zespri佳沛新西兰绿奇异果');
INSERT INTO `ky_order_goods` VALUES ('52', '15280950900919126647', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('53', '15280950900919126647', '126', '25.70', '1', 'Zespri佳沛新西兰绿奇异果');
INSERT INTO `ky_order_goods` VALUES ('54', '15280952188013879367', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('55', '15280952521517768908', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('56', '15280954361174675499', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('57', '15280955103356177820', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('58', '15280955380640699524', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('59', '15280956326129827005', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('60', '15280957691342829408', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('61', '15280958811623935946', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('62', '15280963684203985768', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('63', '15280964358613423075', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('64', '15280964617234320099', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('65', '15280965063173158929', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('66', '15280965851048593296', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('67', '15280970542027488389', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('68', '15280970793351690824', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('69', '15280971202511791699', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('70', '15280971467641971223', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('71', '15280972981964158602', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('72', '15280977368619881129', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('73', '15280977559745371942', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('74', '15280984222346124409', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('75', '15280985122593180876', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('76', '15280987999733170272', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('77', '15281029656274854241', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('78', '15281030418007498194', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('79', '15281030813376859881', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('80', '15281032418442126503', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('81', '15281035565283698000', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('82', '15281036666258766152', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('83', '15281037597396306094', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('84', '15281042741905099754', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('85', '15281042741905099754', '126', '25.70', '1', 'Zespri佳沛新西兰绿奇异果');
INSERT INTO `ky_order_goods` VALUES ('86', '15281043701761993803', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('87', '15281043701761993803', '126', '25.70', '1', 'Zespri佳沛新西兰绿奇异果');
INSERT INTO `ky_order_goods` VALUES ('88', '15281043701761993803', '125', '29.90', '1', '越南进口新鲜白心火龙果');
INSERT INTO `ky_order_goods` VALUES ('89', '15281044565984007981', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('90', '15281044565984007981', '126', '25.70', '1', 'Zespri佳沛新西兰绿奇异果');
INSERT INTO `ky_order_goods` VALUES ('91', '15281045681070756131', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('92', '15281046179373417867', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('93', '15281046261730269758', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('94', '15281046494070776053', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('95', '15281049051326865390', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('96', '15281049283043505887', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('97', '15281049864256052709', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('98', '15281050313630471893', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('99', '15281050469596880732', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('100', '15281050653810900521', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('101', '15281053497482896749', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('102', '15281054463721765881', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('103', '15281054815064676490', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('104', '15281055003224174708', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('105', '15281056137339810467', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('106', '15281056447455340918', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('107', '15281056711362697837', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('108', '15281057144725183684', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('109', '15281057660651185237', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('110', '15281058211879732539', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('111', '15281058657584412767', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('112', '15281058753202709468', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('113', '15281059656772991960', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('114', '15281059822744267073', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('115', '15281059999786783618', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('116', '15281060216481695793', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('117', '15281060348971753512', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('118', '15281060571088008759', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('119', '15281060703166688510', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('120', '15281061728758150012', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('121', '15281061930123549178', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('122', '15281062066775481659', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('123', '15281063257187145044', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('124', '15281064151396191628', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('125', '15281065821785545002', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('126', '15281066174808502317', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('127', '15281066680682133076', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('128', '15281067534807790954', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('129', '15281068353919330705', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('130', '15281068892637015518', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('131', '15281071203067021157', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('132', '15281072897802463305', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('133', '15281073229745188790', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('134', '15281077725268821634', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('135', '15281078970153099485', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('136', '15281079560367506369', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('137', '15281082521878099672', '127', '0.01', '1', '测试商品');
INSERT INTO `ky_order_goods` VALUES ('138', '15281099342064788993', '127', '0.01', '1', '测试商品');

-- ----------------------------
-- Table structure for ky_system_aliyun_sms
-- ----------------------------
DROP TABLE IF EXISTS `ky_system_aliyun_sms`;
CREATE TABLE `ky_system_aliyun_sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `KeyId` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KeySecret` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SignName` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


-- ----------------------------
-- Table structure for ky_system_aliyun_temp
-- ----------------------------
DROP TABLE IF EXISTS `ky_system_aliyun_temp`;
CREATE TABLE `ky_system_aliyun_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `templ` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ky_system_aliyun_temp
-- ----------------------------

-- ----------------------------
-- Table structure for ky_system_config
-- ----------------------------
DROP TABLE IF EXISTS `ky_system_config`;
CREATE TABLE `ky_system_config` (
  `k` varchar(255) DEFAULT NULL,
  `v` text,
  UNIQUE KEY `k` (`k`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ky_system_config
-- ----------------------------

-- ----------------------------
-- Table structure for ky_system_dept
-- ----------------------------
DROP TABLE IF EXISTS `ky_system_dept`;
CREATE TABLE `ky_system_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '部门名称',
  `parent_id` tinyint(4) DEFAULT '0' COMMENT '上级ID',
  `dept_cont` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `orderby` tinyint(4) DEFAULT '100' COMMENT '排序',
  PRIMARY KEY (`dept_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ky_system_dept
-- ----------------------------
INSERT INTO `ky_system_dept` VALUES ('1', '技术部', '0', 'JAVA技术部', '1');
INSERT INTO `ky_system_dept` VALUES ('2', 'Java技术部', '1', 'Java技术部', '1');
INSERT INTO `ky_system_dept` VALUES ('3', 'PHP技术部', '1', 'PHP技术部', '2');
INSERT INTO `ky_system_dept` VALUES ('4', '前端', '1', 'CSS+HTML+JAVASCRIPT', '3');
INSERT INTO `ky_system_dept` VALUES ('5', '销售部', '0', '公司销售部', '2');
INSERT INTO `ky_system_dept` VALUES ('6', '销售一部', '5', '主要销售JAVA系统', '1');
INSERT INTO `ky_system_dept` VALUES ('7', '客户', '0', '客户', '3');
INSERT INTO `ky_system_dept` VALUES ('8', '微信客户', '7', '微信客户', '1');
INSERT INTO `ky_system_dept` VALUES ('9', 'APP客户', '7', 'APP客户', '2');
INSERT INTO `ky_system_dept` VALUES ('10', '实体客户', '7', '实体客户', '3');

-- ----------------------------
-- Table structure for ky_system_log
-- ----------------------------
DROP TABLE IF EXISTS `ky_system_log`;
CREATE TABLE `ky_system_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL DEFAULT '' COMMENT '操作者IP地址',
  `node` char(200) NOT NULL DEFAULT '' COMMENT '当前操作节点',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人用户名',
  `action` varchar(200) NOT NULL DEFAULT '' COMMENT '操作行为',
  `content` text NOT NULL COMMENT '操作内容描述',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统操作日志表';

-- ----------------------------
-- Records of ky_system_log
-- ----------------------------

-- ----------------------------
-- Table structure for ky_system_menu
-- ----------------------------
DROP TABLE IF EXISTS `ky_system_menu`;
CREATE TABLE `ky_system_menu` (
  `menu_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `menu_name` char(80) NOT NULL DEFAULT '菜单名称',
  `menu_role` char(20) NOT NULL DEFAULT '权限标识',
  `type` tinyint(1) DEFAULT '1',
  `status` tinyint(1) DEFAULT '1',
  `condition` char(100) DEFAULT '',
  `menu_icon` varchar(45) DEFAULT NULL COMMENT '图标',
  `parent_id` int(11) DEFAULT '0' COMMENT '上级Id',
  `orderby` tinyint(4) DEFAULT '100',
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `menu_role` (`menu_role`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ky_system_menu
-- ----------------------------
INSERT INTO `ky_system_menu` VALUES ('1', '系统设置', 'system', '1', '1', '', 'md-settings', '0', '1');
INSERT INTO `ky_system_menu` VALUES ('2', '系统菜单', 'menu/index', '1', '1', '', 'md md-list', '1', '1');
INSERT INTO `ky_system_menu` VALUES ('10', '角色管理', 'role/index', '1', '1', '', 'md md-account-child', '1', '2');
INSERT INTO `ky_system_menu` VALUES ('7', '添加', 'menu/add', '1', '1', '', '', '2', '1');
INSERT INTO `ky_system_menu` VALUES ('8', '修改', 'menu/edit', '1', '1', '', '', '2', '2');
INSERT INTO `ky_system_menu` VALUES ('9', '删除', 'menu/del', '1', '1', '', '', '2', '3');
INSERT INTO `ky_system_menu` VALUES ('11', '添加', 'role/add', '1', '1', '', '', '10', '1');
INSERT INTO `ky_system_menu` VALUES ('12', '删除', 'role/del', '1', '1', '', '', '10', '3');
INSERT INTO `ky_system_menu` VALUES ('13', '修改', 'role/edit', '1', '1', '', '', '10', '2');
INSERT INTO `ky_system_menu` VALUES ('14', '系统菜单图标', 'menu/icon', '1', '1', '', '', '2', '4');
INSERT INTO `ky_system_menu` VALUES ('15', '系统菜单列表', 'menu/menulist', '1', '1', '', '', '2', '5');
INSERT INTO `ky_system_menu` VALUES ('16', '会员管理', 'user', '1', '1', '', 'md md-account-circle', '0', '3');
INSERT INTO `ky_system_menu` VALUES ('17', '部门管理', 'dept/index', '1', '1', '', 'md md-assignment-ind', '16', '1');
INSERT INTO `ky_system_menu` VALUES ('18', '添加', 'dept/add', '1', '1', '', '', '17', '1');
INSERT INTO `ky_system_menu` VALUES ('19', '修改', 'dept/edit', '1', '1', '', '', '17', '2');
INSERT INTO `ky_system_menu` VALUES ('20', '删除', 'dept/del', '1', '1', '', '', '17', '3');
INSERT INTO `ky_system_menu` VALUES ('21', '会员列表', 'user/index', '1', '1', '', 'md md-account-child', '16', '2');
INSERT INTO `ky_system_menu` VALUES ('22', '添加', 'user/add', '1', '1', '', '', '21', '1');
INSERT INTO `ky_system_menu` VALUES ('23', '修改', 'user/edit', '1', '1', '', '', '21', '2');
INSERT INTO `ky_system_menu` VALUES ('24', '删除', 'user/del', '1', '1', '', '', '21', '3');
INSERT INTO `ky_system_menu` VALUES ('25', '日志管理', 'logs', '1', '1', '', 'md md-assignment-late', '0', '12');
INSERT INTO `ky_system_menu` VALUES ('26', '日志列表', 'logs/index', '1', '1', '', 'md md-info', '25', '1');
INSERT INTO `ky_system_menu` VALUES ('27', '清空日志', 'logs/del', '1', '1', '', '', '26', '1');
INSERT INTO `ky_system_menu` VALUES ('28', '商城管理', 'mall', '1', '1', '', 'md md-shopping-basket', '0', '4');
INSERT INTO `ky_system_menu` VALUES ('29', '商品管理', 'good/index', '1', '1', '', 'md md-stars', '28', '1');
INSERT INTO `ky_system_menu` VALUES ('30', '添加', 'good/add', '1', '1', '', '', '29', '1');
INSERT INTO `ky_system_menu` VALUES ('31', '修改', 'good/edit', '1', '1', '', '', '29', '2');
INSERT INTO `ky_system_menu` VALUES ('32', '删除', 'good/del', '1', '1', '', '', '29', '3');
INSERT INTO `ky_system_menu` VALUES ('33', '商品分类', 'goodcate/index', '1', '1', '', 'md md-bookmark', '28', '2');
INSERT INTO `ky_system_menu` VALUES ('34', '添加', 'goodcate/add', '1', '1', '', '', '33', '1');
INSERT INTO `ky_system_menu` VALUES ('35', '修改', 'goodcate/edit', '1', '1', '', '', '33', '2');
INSERT INTO `ky_system_menu` VALUES ('36', '删除', 'goodcate/del', '1', '1', '', '', '33', '3');
INSERT INTO `ky_system_menu` VALUES ('38', '微信配置', 'weixin/index', '1', '1', '', 'md md-multitrack-audio', '44', '3');
INSERT INTO `ky_system_menu` VALUES ('39', '配送管理', 'shopper', '1', '1', '', 'md md-account-box', '0', '6');
INSERT INTO `ky_system_menu` VALUES ('40', '订单管理', 'orders', '1', '1', '', 'md md-assignment', '0', '7');
INSERT INTO `ky_system_menu` VALUES ('41', '统计管理', 'census', '1', '1', '', 'md md-apps', '0', '8');
INSERT INTO `ky_system_menu` VALUES ('42', '菜单权限列表', 'menu/tree', '1', '1', '', '', '2', '6');
INSERT INTO `ky_system_menu` VALUES ('43', '小程序配置', 'weixin/app', '0', '1', '', 'md md-book', '44', '4');
INSERT INTO `ky_system_menu` VALUES ('44', '系统参数', 'setting', '0', '1', '', 'md md-group-work', '0', '2');
INSERT INTO `ky_system_menu` VALUES ('45', '阿里短信', 'setting/sms', '0', '1', '', 'md md-question-answer', '44', '1');
INSERT INTO `ky_system_menu` VALUES ('47', '商城广告管理', 'advert/index', '0', '1', '', 'md md-dashboard', '28', '3');
INSERT INTO `ky_system_menu` VALUES ('48', '地址管理', 'address', '0', '1', '', 'md md-pin-drop', '0', '9');
INSERT INTO `ky_system_menu` VALUES ('49', '收货地址', 'address/index', '0', '1', '', 'md md-pin-drop', '48', '1');
INSERT INTO `ky_system_menu` VALUES ('50', '商城参数', 'goodconfig/index', '0', '1', '', 'md md-aspect-ratio', '28', '4');
INSERT INTO `ky_system_menu` VALUES ('51', '订单信息', 'orders/index', '0', '1', '', 'md md-assignment', '40', '1');

-- ----------------------------
-- Table structure for ky_system_role
-- ----------------------------
DROP TABLE IF EXISTS `ky_system_role`;
CREATE TABLE `ky_system_role` (
  `role_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ky_system_role
-- ----------------------------
INSERT INTO `ky_system_role` VALUES ('1', '超级管理员', '1', '7,8,9,14,15,42,2,11,12,13,10,1,18,19,20,17,22,23,24,21,27,26,30,31,32,34,35,36,16,25,29,33,28,0,38,37,39,40,41');
INSERT INTO `ky_system_role` VALUES ('19', '编辑员', '1', '7,8,9,14,15,42,2,11,12,13,10,1,18,19,20,17,22,23,24,21,16,27,26,25,0');

-- ----------------------------
-- Table structure for ky_system_user
-- ----------------------------
DROP TABLE IF EXISTS `ky_system_user`;
CREATE TABLE `ky_system_user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '登录名称',
  `password` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '登录密码',
  `nickname` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '妮称',
  `face` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '头像',
  `phone` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话号码',
  `login_ip` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '登录IP',
  `login_time` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(2) DEFAULT '0' COMMENT '状态',
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  `login_num` tinyint(4) DEFAULT NULL COMMENT '登录次数',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `creattime` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '创建时间',
  `openid` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '微信惟一ID',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ky_system_user
-- ----------------------------
INSERT INTO `ky_system_user` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Mr.He', null, '18223830067', '127.0.0.1', '1528156026', '1', '1', '74', '1', '1526026790', null);
INSERT INTO `ky_system_user` VALUES ('7', null, null, '重庆柯一网络有限公司', 'https://wx.qlogo.cn/mmopen/vi_32/rIzs9ybGH7zVVvdcxLjYz6ee856CnPN1sTm9HV1KHsJFkctGKgGCxSgrOZpOygHjibNqj0uiaQMvXSGaG2NU0vibw/132', null, '127.0.0.1', null, '0', null, null, null, '1527674655', 'o1_R_4s1pTcQdis6flGqLEq0FX9o');

-- ----------------------------
-- Table structure for ky_system_user_address
-- ----------------------------
DROP TABLE IF EXISTS `ky_system_user_address`;
CREATE TABLE `ky_system_user_address` (
  `adId` int(11) NOT NULL AUTO_INCREMENT,
  `contacts` varchar(45) COLLATE utf8_unicode_ci NOT NULL COMMENT '联系人',
  `phone` varchar(45) COLLATE utf8_unicode_ci NOT NULL COMMENT '联系电话',
  `readdress` varchar(125) COLLATE utf8_unicode_ci DEFAULT NULL,
  `doorno` varchar(125) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`adId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ky_system_user_address
-- ----------------------------
INSERT INTO `ky_system_user_address` VALUES ('1', '何兵', '18223830067', '开宇骄景', '吕氏春秋西大门三楼D32号', '9');
INSERT INTO `ky_system_user_address` VALUES ('2', '刘远超', '15215251247', '傻子格格万州面(开州区店)', '保健院6楼护士站', '9');
INSERT INTO `ky_system_user_address` VALUES ('3', '测试一下', '18223830067', '重庆广播电视大学开州区工作站', '魂牵梦萦', '9');
INSERT INTO `ky_system_user_address` VALUES ('4', '我的错', '18223830067', '重庆广播电视大学开州区工作站', '魂牵梦萦', '7');
INSERT INTO `ky_system_user_address` VALUES ('5', '再来试一下', '18223830067', '重庆广播电视大学开州区工作站', '地址不准呀，太不靠谱了', '7');

-- ----------------------------
-- Table structure for ky_system_user_role
-- ----------------------------
DROP TABLE IF EXISTS `ky_system_user_role`;
CREATE TABLE `ky_system_user_role` (
  `uid` mediumint(8) unsigned NOT NULL,
  `role_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_role_id` (`uid`,`role_id`),
  KEY `uid` (`uid`),
  KEY `role_id` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ky_system_user_role
-- ----------------------------
INSERT INTO `ky_system_user_role` VALUES ('3', '19');

-- ----------------------------
-- Table structure for ky_system_weixin
-- ----------------------------
DROP TABLE IF EXISTS `ky_system_weixin`;
CREATE TABLE `ky_system_weixin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(45) DEFAULT NULL,
  `appid` varchar(45) DEFAULT NULL,
  `appsecret` varchar(32) DEFAULT NULL,
  `encodingaeskey` varchar(100) DEFAULT NULL,
  `mch_id` varchar(45) DEFAULT NULL,
  `partnerkey` varchar(45) DEFAULT NULL,
  `type` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


