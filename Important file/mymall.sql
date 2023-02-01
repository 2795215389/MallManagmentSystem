-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.23-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  10.3.0.5771
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出  表 mymall.cms_prefrence_area 结构
CREATE TABLE IF NOT EXISTS `cms_prefrence_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sub_title` varchar(255) DEFAULT NULL,
  `pic` varbinary(500) DEFAULT NULL COMMENT '展示图片',
  `sort` int(11) DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='优选专区';

-- 正在导出表  mymall.cms_prefrence_area 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `cms_prefrence_area` DISABLE KEYS */;
INSERT INTO `cms_prefrence_area` (`id`, `name`, `sub_title`, `pic`, `sort`, `show_status`) VALUES
	(1, '让音质更出众', '音质不打折 完美现场感', NULL, NULL, 1),
	(2, '让音质更出众22', '让音质更出众22', NULL, NULL, NULL),
	(3, '让音质更出众33', NULL, NULL, NULL, NULL),
	(4, '让音质更出众44', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `cms_prefrence_area` ENABLE KEYS */;

-- 导出  表 mymall.cms_prefrence_area_product_relation 结构
CREATE TABLE IF NOT EXISTS `cms_prefrence_area_product_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prefrence_area_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='优选专区和产品关系表';

-- 正在导出表  mymall.cms_prefrence_area_product_relation 的数据：~14 rows (大约)
/*!40000 ALTER TABLE `cms_prefrence_area_product_relation` DISABLE KEYS */;
INSERT INTO `cms_prefrence_area_product_relation` (`id`, `prefrence_area_id`, `product_id`) VALUES
	(1, 1, 12),
	(2, 1, 13),
	(3, 1, 14),
	(4, 1, 18),
	(5, 1, 7),
	(6, 2, 7),
	(7, 1, 22),
	(24, 1, 23),
	(25, 1, 37),
	(27, 1, 52),
	(28, 3, 52),
	(32, 2, 59),
	(33, 3, 59),
	(35, 1, 46),
	(36, 2, 62),
	(37, 3, 62);
/*!40000 ALTER TABLE `cms_prefrence_area_product_relation` ENABLE KEYS */;

-- 导出  表 mymall.cms_subject 结构
CREATE TABLE IF NOT EXISTS `cms_subject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `pic` varchar(500) DEFAULT NULL COMMENT '专题主图',
  `product_count` int(11) DEFAULT NULL COMMENT '关联产品数量',
  `recommend_status` int(1) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `collect_count` int(11) DEFAULT NULL,
  `read_count` int(11) DEFAULT NULL,
  `comment_count` int(11) DEFAULT NULL,
  `album_pics` varchar(1000) DEFAULT NULL COMMENT '画册图片用逗号分割',
  `description` varchar(1000) DEFAULT NULL,
  `show_status` int(1) DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `content` text,
  `forward_count` int(11) DEFAULT NULL COMMENT '转发数',
  `category_name` varchar(200) DEFAULT NULL COMMENT '专题分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='专题表';

-- 正在导出表  mymall.cms_subject 的数据：~15 rows (大约)
/*!40000 ALTER TABLE `cms_subject` DISABLE KEYS */;
INSERT INTO `cms_subject` (`id`, `category_id`, `title`, `pic`, `product_count`, `recommend_status`, `create_time`, `collect_count`, `read_count`, `comment_count`, `album_pics`, `description`, `show_status`, `content`, `forward_count`, `category_name`) VALUES
	(1, 1, '轮廓分明，双摄手机映现细腻美照', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t26434/217/1381240043/254214/290f9d5b/5bc6c11cN54567a27.jpg!q70.jpg', NULL, 1, '2018-11-11 13:26:55', 100, 1000, 100, NULL, '手机对于拍照党来说，已经不仅仅是通讯工具那么简单了。因为有时TA还充当着“单反”的角色，来不断地带给那些喜欢拍照的人惊喜。所以，在这里准备一波高颜值的双摄手机来给大家。让TA们灵敏捕捉影像的能力，为你展现出轮廓更加分明、且画质更加细腻的美照。', 1, NULL, NULL, '精选专题'),
	(2, 1, '交通拥挤有妙招，电动车小巧穿行无障碍', 'https://img11.360buyimg.com/mobilecms/s1500x600_jfs/t14224/229/529700229/74868/a1cc7364/5a314f85N5bfd22c7.jpg!q70.jpg', NULL, 1, '2018-11-12 13:27:00', 100, 1000, 100, NULL, '随着人们消费水平的提高，公路上的小车是越来越多了，导致每到上下班高峰期的时候，大路的车辆堵了一环又一环，而且你根本不知道它到底会塞多久，所以我们需要变通一下，不妨骑上电动车来个绿色出行，它够小巧玲珑，即使交通再怎么拥挤，也总有它可以通过的地方。', 1, NULL, NULL, '精选专题'),
	(3, 1, '无酒不成席，甘香白酒开怀助兴', 'https://img12.360buyimg.com/mobilecms/s1500x600_jfs/t1/881/4/12265/114011/5bd1446fEc71114bf/68925bfb4a2adc44.jpg!q70.jpg', NULL, 1, '2018-11-13 13:27:05', 100, 1000, 100, NULL, '白酒是由各种优质的高粱，小麦，大米等谷物为原料，经过传统工艺的长时间酿造，酒液在这样的环境中慢慢发酵，最终变成清香浓郁的白酒，被摆上人们的餐桌，供人畅饮，是一种受到大众喜爱的绝佳饮品。', 1, NULL, NULL, '精选专题'),
	(4, 2, '真规划不盲扫，全域清洁净无尘', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t15205/35/2539924281/429185/72fa7857/5aab2c4bN6a32a6c5.png', NULL, 1, '2018-11-01 13:27:09', 100, 1000, 100, NULL, '科技时代，聪明女人会选择用智慧来减负，和繁琐的家务挥手再见，才能腾出更多休闲时间。规划式扫地机器人设计个性化，它能够跟据房间布置呈现清扫路线，实现规划式覆盖性清洁，少遗漏不盲扫，从而大幅度降低损耗，侦测技术遇到家具及时避让，杜绝猛烈撞击，任它灵巧穿梭于低矮空间，坐享居家净无尘。', 1, NULL, NULL, '家电专题'),
	(5, 2, '抑菌更纯净，直饮净水保家人健康', 'https://img11.360buyimg.com/mobilecms/s1500x600_jfs/t11428/340/1504074828/20474/1e8cab1e/5a0305d3Nb1e7a762.jpg!q70.jpg', NULL, 1, '2018-11-06 13:27:18', 100, 1000, 100, NULL, '在城里居住，首先要担心的是饮水问题。桶装水太贵不够经济，还不一定是干净的。自己去干净的水源地取水也不切实际。此时只有选择在家里安装一台净水器才实在。装上一台直饮式的净水器，方便安全，关键是水质过滤得比较纯净，很大限度地处理了大部分的废弃物，留下健康的矿物质水。好生活，从一口干净的纯净水开始。', 1, NULL, NULL, '家电专题'),
	(6, 2, '储鲜冷冻灵活变，多门无霜更贴心', 'https://img12.360buyimg.com/mobilecms/s1500x600_jfs/t13015/356/2397552584/605232/46c88e6e/5a5321bcN6a8866f0.png', NULL, 1, '2018-11-07 13:27:21', 100, 1000, 100, NULL, '春节临近，每个家庭都要储备不少食材，但各种食材的保鲜方式与温度不尽相同，而多门风冷冰箱能轻松满足您。它们容积大占地小，拥有多个可以独立调节温度的温区，满足对不同类食材的存放需求，同时省去除霜烦恼，还可以通过温度调节满足您对大冷藏及大冷冻的需求变化，从而带来更好的保鲜冷冻体验，为新年宴请保驾护航。', 1, NULL, NULL, '家电专题'),
	(7, 2, '想喝健康水，就用304不锈钢热水壶', 'https://img13.360buyimg.com/mobilecms/s1500x600_jfs/t12541/90/443985343/33603/65d6e884/5a0bb77aNff08550a.jpg!q70.jpg', NULL, 1, '2019-01-29 11:21:55', 100, 1000, 100, NULL, '大冬天的喝一口热水，不仅能够暧身还可以给身体补充足够的水份，但是对于热水壶的购买却是需要慎之又慎，材质不好的热水壶在烧水的过程当中极容易产生对身体不利的有害物，极大影响人们的身体健康。304不锈钢热水壶选用食品级不不锈钢，确保水质安全，烧水健康好水，为您的饮水健康保驾护航。', 1, NULL, NULL, '家电专题'),
	(8, 2, '你尽情赖床！早餐“煲”在它身上', 'https://img14.360buyimg.com/mobilecms/s1500x600_jfs/t15949/363/1450937723/89513/7d8c1219/5a531d28N2aaec2a6.jpg!q70.jpg', NULL, 1, '2019-01-29 13:07:13', 100, 1000, 100, NULL, '赖床不想起，饿了的时候想吃饭又要现做等待简直饥肠辘辘让人心烦，所以一款带有预约功能的电饭煲简直不要太贴心，你睡懒觉的时候它已经给你做好了香滑软糯的粥，起床就能享美味是不是很贴心呐。', 1, NULL, NULL, '家电专题'),
	(9, 2, '小白变大厨，微波炉为实力加持', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t1/8774/21/11460/38908/5c2cbfcfEdab1ef03/d5800f0f7cf05b38.jpg!q70.jpg', NULL, 1, '2019-01-29 13:08:18', 100, 1000, 100, NULL, '对于厨艺小白而言，没有什么能比掌握好火候更来得困难的了！毕竟烹饪出食物的味道好坏，很大程度上还是对火候的掌控，想要轻松掌握火候，当然少不了一款微波炉的撑场，内设多功能，满足不同的烹饪需求，简单方便易操作，让厨艺小白秒变大师！', 1, NULL, NULL, '家电专题'),
	(10, 2, '十秒鲜榨，冬日把爱浓缩成杯果汁', 'https://img11.360buyimg.com/mobilecms/s1500x600_jfs/t13708/126/308291722/542847/26ee6edd/5a07dc72N3252a9e0.png', NULL, 1, '2019-01-29 13:10:02', 100, 1000, 100, NULL, '寒瑟冬日女友不喜欢吃水果，用便携迷你果汁机，撩妹又养胃。一按一转，碾压切割，简单快速制作，压榨出纯原味果汁。一键启动，十秒出汁，保留食物营养，轻轻松松粉碎食物，营养在手，说走就走。', 1, NULL, NULL, '家电专题'),
	(11, 3, '饭点未到肚已空？美味饼干先充饥', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t13240/79/443357432/38567/94792c4c/5a0ba054N89388654.jpg!q70.jpg', NULL, 1, '2019-01-29 13:10:45', 100, 1000, 100, NULL, '一上午都把精力集中在工作中，刚闲下来就发现自己已是饥肠辘辘了，可饭点却还没到，怎么办呢？不妨让这些美味饼干先帮你充充饥吧！酥香松脆有营养，每一口都让人回味无穷，既能满足你挑剔的味蕾又能起到果腹效果，快快为自己备上吧！', 1, NULL, NULL, '美食专题'),
	(12, 3, '赖床无罪，香酥面包营养又便捷', 'https://img11.360buyimg.com/mobilecms/s1500x600_jfs/t9775/33/1197239610/38547/34899011/59ddbd01N0bd693bb.jpg!q70.jpg', NULL, 1, '2019-01-29 13:11:41', 100, 1000, 100, NULL, '赖床是很多年轻人的通病，特别是秋冬季节，都会恋恋不舍温暖的被窝。对于苦逼的上班族来说，就算再多睡几分钟，还是要起床的，甚至来不及吃早餐。面包营养丰富，能快速饱腹，且携带方便，再搭配一盒牛奶，一顿简单而不失营养的早餐能提供一天的能量，让赖床族多睡几分钟也无妨。', 1, NULL, NULL, '美食专题'),
	(13, 3, '夹心饼干，予多重滋味交织舌尖', 'https://img12.360buyimg.com/mobilecms/s1500x600_jfs/t18877/139/652452758/27262/36e6ed6e/5a9d5b6dN327150e8.jpg!q70.jpg', NULL, 1, '2019-01-29 13:12:38', 100, 1000, 100, NULL, '饼干味道香脆可口，深受不少人的青睐。饼干的种类多样，而夹心饼干就是其中一种，相比普通饼干而言，夹心饼干有着更丰富的口感，当肚子空空如也的时候，来一些美味的夹心饼干，既能解馋，又能扛饿。下面就为大家推荐一组好吃的夹心饼干，作为办公室小零食非常不错。', 1, NULL, NULL, '美食专题'),
	(14, 4, '户外Party，便携音箱烘气氛', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t17125/265/644948348/42066/6f2dc610/5a9c9da1N9a95ee2c.jpg!q70.jpg', NULL, 1, '2019-01-29 13:13:53', 100, 1000, 100, NULL, '初春的季节，除了户外的各种踏青旅行，在户外开异常Party也是很惬意。户外派对，气氛的烘托肯定不能离开音箱的衬托，选择一款户外的便携音箱，无线蓝牙连接，免去有线的束缚，携带使用更方便。', 1, NULL, NULL, '数码专题'),
	(15, 5, '今冬潮包look，凹出绚丽女王范', 'https://img10.360buyimg.com/mobilecms/s1500x600_jfs/t8365/191/1901440450/575969/c71560c9/59c3144dNe6d8dd2f.png', NULL, 1, '2019-01-29 13:15:12', 100, 1000, 100, NULL, '潮流时尚的美包，搭配潮服，会让你魅力一直在线。因为潮包一直是女性出游扮美的秘籍，它不仅能够帮你收纳日常小物件，还能让你解放双手，这里推荐的时尚美包，随意搭配一件服饰，都可以让你潮范十足，凹出绚丽女王范。', 1, NULL, NULL, '服饰专题');
/*!40000 ALTER TABLE `cms_subject` ENABLE KEYS */;

-- 导出  表 mymall.cms_subject_product_relation 结构
CREATE TABLE IF NOT EXISTS `cms_subject_product_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='专题商品关系表';

-- 正在导出表  mymall.cms_subject_product_relation 的数据：~19 rows (大约)
/*!40000 ALTER TABLE `cms_subject_product_relation` DISABLE KEYS */;
INSERT INTO `cms_subject_product_relation` (`id`, `subject_id`, `product_id`) VALUES
	(3, 1, 28),
	(4, 1, 29),
	(5, 2, 30),
	(6, 2, 31),
	(7, 2, 35),
	(30, 2, 32),
	(31, 3, 33),
	(38, 3, 34),
	(39, 1, 37),
	(40, 3, 52),
	(41, 6, 52),
	(48, 2, 59),
	(49, 6, 59),
	(50, 1, 46),
	(51, 2, 46),
	(52, 3, 46),
	(53, 2, 36),
	(59, 1, 26),
	(60, 1, 27);
/*!40000 ALTER TABLE `cms_subject_product_relation` ENABLE KEYS */;

-- 导出  表 mymall.oms_company_address 结构
CREATE TABLE IF NOT EXISTS `oms_company_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address_name` varchar(200) DEFAULT NULL COMMENT '地址名称',
  `send_status` int(1) DEFAULT NULL COMMENT '默认发货地址：0->否；1->是',
  `receive_status` int(1) DEFAULT NULL COMMENT '是否默认收货地址：0->否；1->是',
  `name` varchar(64) DEFAULT NULL COMMENT '收发货人姓名',
  `phone` varchar(64) DEFAULT NULL COMMENT '收货人电话',
  `province` varchar(64) DEFAULT NULL COMMENT '省/直辖市',
  `city` varchar(64) DEFAULT NULL COMMENT '市',
  `region` varchar(64) DEFAULT NULL COMMENT '区',
  `detail_address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='公司收发货地址表';

-- 正在导出表  mymall.oms_company_address 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `oms_company_address` DISABLE KEYS */;
INSERT INTO `oms_company_address` (`id`, `address_name`, `send_status`, `receive_status`, `name`, `phone`, `province`, `city`, `region`, `detail_address`) VALUES
	(1, '深圳发货点', 1, 1, '大梨', '18000000000', '广东省', '深圳市', '南山区', '科兴科学园'),
	(2, '北京发货点', 0, 0, '大梨', '18000000000', '北京市', NULL, '南山区', '科兴科学园'),
	(3, '南京发货点', 0, 0, '大梨', '18000000000', '江苏省', '南京市', '南山区', '科兴科学园');
/*!40000 ALTER TABLE `oms_company_address` ENABLE KEYS */;

-- 导出  表 mymall.oms_order 结构
CREATE TABLE IF NOT EXISTS `oms_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `member_id` bigint(20) NOT NULL,
  `coupon_id` bigint(20) DEFAULT NULL,
  `order_sn` varchar(64) DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime DEFAULT NULL COMMENT '提交时间',
  `member_username` varchar(64) DEFAULT NULL COMMENT '用户帐号',
  `total_amount` decimal(10,2) DEFAULT NULL COMMENT '订单总金额',
  `pay_amount` decimal(10,2) DEFAULT NULL COMMENT '应付金额（实际支付金额）',
  `freight_amount` decimal(10,2) DEFAULT NULL COMMENT '运费金额',
  `promotion_amount` decimal(10,2) DEFAULT NULL COMMENT '促销优化金额（促销价、满减、阶梯价）',
  `integration_amount` decimal(10,2) DEFAULT NULL COMMENT '积分抵扣金额',
  `coupon_amount` decimal(10,2) DEFAULT NULL COMMENT '优惠券抵扣金额',
  `discount_amount` decimal(10,2) DEFAULT NULL COMMENT '管理员后台调整订单使用的折扣金额',
  `pay_type` int(1) DEFAULT NULL COMMENT '支付方式：0->未支付；1->支付宝；2->微信',
  `source_type` int(1) DEFAULT NULL COMMENT '订单来源：0->PC订单；1->app订单',
  `status` int(1) DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `order_type` int(1) DEFAULT NULL COMMENT '订单类型：0->正常订单；1->秒杀订单',
  `delivery_company` varchar(64) DEFAULT NULL COMMENT '物流公司(配送方式)',
  `delivery_sn` varchar(64) DEFAULT NULL COMMENT '物流单号',
  `auto_confirm_day` int(11) DEFAULT NULL COMMENT '自动确认时间（天）',
  `integration` int(11) DEFAULT NULL COMMENT '可以获得的积分',
  `growth` int(11) DEFAULT NULL COMMENT '可以活动的成长值',
  `promotion_info` varchar(100) DEFAULT NULL COMMENT '活动信息',
  `bill_type` int(1) DEFAULT NULL COMMENT '发票类型：0->不开发票；1->电子发票；2->纸质发票',
  `bill_header` varchar(200) DEFAULT NULL COMMENT '发票抬头',
  `bill_content` varchar(200) DEFAULT NULL COMMENT '发票内容',
  `bill_receiver_phone` varchar(32) DEFAULT NULL COMMENT '收票人电话',
  `bill_receiver_email` varchar(64) DEFAULT NULL COMMENT '收票人邮箱',
  `receiver_name` varchar(100) NOT NULL COMMENT '收货人姓名',
  `receiver_phone` varchar(32) NOT NULL COMMENT '收货人电话',
  `receiver_post_code` varchar(32) DEFAULT NULL COMMENT '收货人邮编',
  `receiver_province` varchar(32) DEFAULT NULL COMMENT '省份/直辖市',
  `receiver_city` varchar(32) DEFAULT NULL COMMENT '城市',
  `receiver_region` varchar(32) DEFAULT NULL COMMENT '区',
  `receiver_detail_address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  `note` varchar(500) DEFAULT NULL COMMENT '订单备注',
  `confirm_status` int(1) DEFAULT NULL COMMENT '确认收货状态：0->未确认；1->已确认',
  `delete_status` int(1) NOT NULL DEFAULT '0' COMMENT '删除状态：0->未删除；1->已删除',
  `use_integration` int(11) DEFAULT NULL COMMENT '下单时使用的积分',
  `payment_time` datetime DEFAULT NULL COMMENT '支付时间',
  `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
  `receive_time` datetime DEFAULT NULL COMMENT '确认收货时间',
  `comment_time` datetime DEFAULT NULL COMMENT '评价时间',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='订单表';

-- 正在导出表  mymall.oms_order 的数据：~15 rows (大约)
/*!40000 ALTER TABLE `oms_order` DISABLE KEYS */;
INSERT INTO `oms_order` (`id`, `member_id`, `coupon_id`, `order_sn`, `create_time`, `member_username`, `total_amount`, `pay_amount`, `freight_amount`, `promotion_amount`, `integration_amount`, `coupon_amount`, `discount_amount`, `pay_type`, `source_type`, `status`, `order_type`, `delivery_company`, `delivery_sn`, `auto_confirm_day`, `integration`, `growth`, `promotion_info`, `bill_type`, `bill_header`, `bill_content`, `bill_receiver_phone`, `bill_receiver_email`, `receiver_name`, `receiver_phone`, `receiver_post_code`, `receiver_province`, `receiver_city`, `receiver_region`, `receiver_detail_address`, `note`, `confirm_status`, `delete_status`, `use_integration`, `payment_time`, `delivery_time`, `receive_time`, `comment_time`, `modify_time`) VALUES
	(12, 1, 2, '201809150101000001', '2018-09-15 12:24:27', 'test', 18732.00, 16377.75, 80.00, 2344.25, 0.00, 10.00, 10.00, 0, 1, 4, 0, '', '', 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨3', '18033441849', '518000', '江苏省', '常州市', '天宁区', '东晓街道', '7897897', 0, 0, NULL, NULL, NULL, NULL, NULL, '2020-01-20 07:56:23'),
	(13, 1, 2, '201809150102000002', '2018-09-15 14:24:29', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 0, 0, '圆通快递', '234234', 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, 1000, '2018-10-11 14:04:19', '2020-01-20 14:47:36', NULL, NULL, NULL),
	(14, 1, 2, '201809130101000001', '2018-09-13 16:57:40', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 0, 0, '顺丰快递', '201707196398345', 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', '90-0-', 0, 0, NULL, '2018-10-13 13:44:04', '2018-10-16 13:43:41', NULL, NULL, '2020-01-19 08:38:33'),
	(15, 1, 2, '201809130102000002', '2018-09-13 17:03:00', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 3, 0, '顺丰快递', '201707196398346', 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 1, 0, NULL, '2018-10-13 13:44:54', '2018-10-16 13:45:01', '2018-10-18 14:05:31', NULL, NULL),
	(16, 1, 2, '201809140101000001', '2018-09-14 16:16:16', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 4, 0, NULL, NULL, 15, 13284, 13284, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
	(17, 1, 2, '201809150101000003', '2018-09-15 12:24:27', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 0, 1, 4, 0, '顺丰快递', '201707196398345', 15, NULL, NULL, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, '2018-10-12 14:01:28', NULL, NULL, NULL),
	(18, 1, 2, '201809150102000004', '2018-09-15 14:24:29', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 2, 0, '韵达快递', '23423423', 15, NULL, NULL, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, 1000, NULL, '2020-01-20 14:49:11', NULL, NULL, NULL),
	(19, 1, 2, '201809130101000003', '2018-09-13 16:57:40', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 2, 0, NULL, NULL, 15, NULL, NULL, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
	(20, 1, 2, '201809130102000004', '2018-09-13 17:03:00', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 3, 0, NULL, NULL, 15, NULL, NULL, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
	(21, 1, 2, '201809140101000002', '2018-09-14 16:16:16', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 0, 0, NULL, NULL, 15, 18682, 18682, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL),
	(22, 1, 2, '201809150101000005', '2018-09-15 12:24:27', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 0, 1, 4, 0, '顺丰快递', '201707196398345', 15, 0, 0, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', '234234', 0, 0, NULL, NULL, '2018-10-12 14:01:28', NULL, NULL, '2020-01-20 14:49:35'),
	(23, 1, 2, '201809150102000006', '2018-09-15 14:24:29', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 1, 1, 2, 0, '韵达快递', '2位4535', 15, 0, 0, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, 1000, NULL, '2020-01-20 14:50:10', NULL, NULL, NULL),
	(24, 1, 2, '201809130101000005', '2018-09-13 16:57:40', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 2, 1, 2, 0, NULL, NULL, 15, 18682, 18682, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL),
	(25, 1, 2, '201809130102000006', '2018-09-13 17:03:00', 'test', 18732.00, 16377.75, 10.00, 2344.25, 0.00, 10.00, 5.00, 1, 1, 4, 0, NULL, NULL, 15, 18682, 18682, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨22', '18033441849', '518000', '北京市', '北京城区', '东城区', '东城街道', 'xxx', 0, 0, NULL, NULL, NULL, NULL, NULL, '2018-10-30 15:08:31'),
	(26, 1, 2, '201809140101000003', '2018-09-14 16:16:16', 'test', 18732.00, 16377.75, 0.00, 2344.25, 0.00, 10.00, 0.00, 0, 1, 4, 0, NULL, NULL, 15, 18682, 18682, '单品促销,打折优惠：满3件，打7.50折,满减优惠：满1000.00元，减120.00元,满减优惠：满1000.00元，减120.00元,无优惠', NULL, NULL, NULL, NULL, NULL, '大梨', '18033441849', '518000', '广东省', '深圳市', '福田区', '东晓街道', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `oms_order` ENABLE KEYS */;

-- 导出  表 mymall.oms_order_item 结构
CREATE TABLE IF NOT EXISTS `oms_order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `order_sn` varchar(64) DEFAULT NULL COMMENT '订单编号',
  `product_id` bigint(20) DEFAULT NULL,
  `product_pic` varchar(500) DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `product_brand` varchar(200) DEFAULT NULL,
  `product_sn` varchar(64) DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL COMMENT '销售价格',
  `product_quantity` int(11) DEFAULT NULL COMMENT '购买数量',
  `product_sku_id` bigint(20) DEFAULT NULL COMMENT '商品sku编号',
  `product_sku_code` varchar(50) DEFAULT NULL COMMENT '商品sku条码',
  `product_category_id` bigint(20) DEFAULT NULL COMMENT '商品分类id',
  `sp1` varchar(100) DEFAULT NULL COMMENT '商品的销售属性',
  `sp2` varchar(100) DEFAULT NULL,
  `sp3` varchar(100) DEFAULT NULL,
  `promotion_name` varchar(200) DEFAULT NULL COMMENT '商品促销名称',
  `promotion_amount` decimal(10,2) DEFAULT NULL COMMENT '商品促销分解金额',
  `coupon_amount` decimal(10,2) DEFAULT NULL COMMENT '优惠券优惠分解金额',
  `integration_amount` decimal(10,2) DEFAULT NULL COMMENT '积分优惠分解金额',
  `real_amount` decimal(10,2) DEFAULT NULL COMMENT '该商品经过优惠后的分解金额',
  `gift_integration` int(11) DEFAULT '0',
  `gift_growth` int(11) DEFAULT '0',
  `product_attr` varchar(500) DEFAULT NULL COMMENT '商品销售属性:[{"key":"颜色","value":"颜色"},{"key":"容量","value":"4G"}]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='订单中所包含的商品';

-- 正在导出表  mymall.oms_order_item 的数据：~25 rows (大约)
/*!40000 ALTER TABLE `oms_order_item` DISABLE KEYS */;
INSERT INTO `oms_order_item` (`id`, `order_id`, `order_sn`, `product_id`, `product_pic`, `product_name`, `product_brand`, `product_sn`, `product_price`, `product_quantity`, `product_sku_id`, `product_sku_code`, `product_category_id`, `sp1`, `sp2`, `sp3`, `promotion_name`, `promotion_amount`, `coupon_amount`, `integration_amount`, `real_amount`, `gift_integration`, `gift_growth`, `product_attr`) VALUES
	(21, 12, '201809150101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, NULL, NULL, NULL, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{"key":"颜色","value":"金色"},{"key":"容量","value":"16G"}]'),
	(22, 12, '201809150101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, NULL, NULL, NULL, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{"key":"颜色","value":"黑色"},{"key":"容量","value":"32G"}]'),
	(23, 12, '201809150101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{"key":"颜色","value":"金色"},{"key":"容量","value":"16G"}]'),
	(24, 12, '201809150101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{"key":"颜色","value":"金色"},{"key":"容量","value":"32G"}]'),
	(25, 12, '201809150101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, NULL, NULL, NULL, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{"key":"颜色","value":"金色"},{"key":"容量","value":"32G"}]'),
	(26, 13, '201809150102000002', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, NULL, NULL, NULL, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{"key":"颜色","value":"金色"},{"key":"容量","value":"16G"}]'),
	(27, 13, '201809150102000002', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, NULL, NULL, NULL, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{"key":"颜色","value":"黑色"},{"key":"容量","value":"32G"}]'),
	(28, 13, '201809150102000002', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{"key":"颜色","value":"金色"},{"key":"容量","value":"16G"}]'),
	(29, 13, '201809150102000002', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{"key":"颜色","value":"金色"},{"key":"容量","value":"32G"}]'),
	(30, 13, '201809150102000002', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, NULL, NULL, NULL, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{"key":"颜色","value":"金色"},{"key":"容量","value":"32G"}]'),
	(31, 14, '201809130101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, NULL, NULL, NULL, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{"key":"颜色","value":"金色"},{"key":"容量","value":"16G"}]'),
	(32, 14, '201809130101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, NULL, NULL, NULL, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{"key":"颜色","value":"黑色"},{"key":"容量","value":"32G"}]'),
	(33, 14, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{"key":"颜色","value":"金色"},{"key":"容量","value":"16G"}]'),
	(34, 14, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{"key":"颜色","value":"金色"},{"key":"容量","value":"32G"}]'),
	(35, 14, '201809130101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, NULL, NULL, NULL, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{"key":"颜色","value":"金色"},{"key":"容量","value":"32G"}]'),
	(36, 15, '201809130101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, NULL, NULL, NULL, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{"key":"颜色","value":"金色"},{"key":"容量","value":"16G"}]'),
	(37, 15, '201809130101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, NULL, NULL, NULL, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{"key":"颜色","value":"黑色"},{"key":"容量","value":"32G"}]'),
	(38, 15, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{"key":"颜色","value":"金色"},{"key":"容量","value":"16G"}]'),
	(39, 15, '201809130101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{"key":"颜色","value":"金色"},{"key":"容量","value":"32G"}]'),
	(40, 15, '201809130101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, NULL, NULL, NULL, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{"key":"颜色","value":"金色"},{"key":"容量","value":"32G"}]'),
	(41, 16, '201809140101000001', 26, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '6946605', 3788.00, 1, 90, '201806070026001', 19, NULL, NULL, NULL, '单品促销', 200.00, 2.02, 0.00, 3585.98, 3788, 3788, '[{"key":"颜色","value":"金色"},{"key":"容量","value":"16G"}]'),
	(42, 16, '201809140101000001', 27, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '7437788', 2699.00, 3, 98, '201808270027001', 19, NULL, NULL, NULL, '打折优惠：满3件，打7.50折', 674.75, 1.44, 0.00, 2022.81, 2699, 2699, '[{"key":"颜色","value":"黑色"},{"key":"容量","value":"32G"}]'),
	(43, 16, '201809140101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 649.00, 1, 102, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 57.60, 0.35, 0.00, 591.05, 649, 649, '[{"key":"颜色","value":"金色"},{"key":"容量","value":"16G"}]'),
	(44, 16, '201809140101000001', 28, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '7437789', 699.00, 1, 103, '201808270028001', 19, NULL, NULL, NULL, '满减优惠：满1000.00元，减120.00元', 62.40, 0.37, 0.00, 636.23, 649, 649, '[{"key":"颜色","value":"金色"},{"key":"容量","value":"32G"}]'),
	(45, 16, '201809140101000001', 29, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', 'Apple iPhone 8 Plus', '苹果', '7437799', 5499.00, 1, 106, '201808270029001', 19, NULL, NULL, NULL, '无优惠', 0.00, 2.94, 0.00, 5496.06, 5499, 5499, '[{"key":"颜色","value":"金色"},{"key":"容量","value":"32G"}]');
/*!40000 ALTER TABLE `oms_order_item` ENABLE KEYS */;

-- 导出  表 mymall.oms_order_operate_history 结构
CREATE TABLE IF NOT EXISTS `oms_order_operate_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `operate_man` varchar(100) DEFAULT NULL COMMENT '操作人：用户；系统；后台管理员',
  `create_time` datetime DEFAULT NULL COMMENT '操作时间',
  `order_status` int(1) DEFAULT NULL COMMENT '订单状态：0->待付款；1->待发货；2->已发货；3->已完成；4->已关闭；5->无效订单',
  `note` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='订单操作历史记录';

-- 正在导出表  mymall.oms_order_operate_history 的数据：~29 rows (大约)
/*!40000 ALTER TABLE `oms_order_operate_history` DISABLE KEYS */;
INSERT INTO `oms_order_operate_history` (`id`, `order_id`, `operate_man`, `create_time`, `order_status`, `note`) VALUES
	(5, 12, '后台管理员', '2018-10-12 14:01:29', 2, '完成发货'),
	(6, 13, '后台管理员', '2018-10-12 14:01:29', 2, '完成发货'),
	(7, 12, '后台管理员', '2018-10-12 14:13:10', 4, '订单关闭:买家退货'),
	(8, 13, '后台管理员', '2018-10-12 14:13:10', 4, '订单关闭:买家退货'),
	(9, 22, '后台管理员', '2018-10-15 16:31:48', 4, '订单关闭:xxx'),
	(10, 22, '后台管理员', '2018-10-15 16:35:08', 4, '订单关闭:xxx'),
	(11, 22, '后台管理员', '2018-10-15 16:35:59', 4, '订单关闭:xxx'),
	(12, 17, '后台管理员', '2018-10-15 16:43:40', 4, '订单关闭:xxx'),
	(13, 25, '后台管理员', '2018-10-15 16:52:14', 4, '订单关闭:xxx'),
	(14, 26, '后台管理员', '2018-10-15 16:52:14', 4, '订单关闭:xxx'),
	(15, 23, '后台管理员', '2018-10-16 14:41:28', 2, '完成发货'),
	(16, 13, '后台管理员', '2018-10-16 14:42:17', 2, '完成发货'),
	(17, 18, '后台管理员', '2018-10-16 14:42:17', 2, '完成发货'),
	(18, 26, '后台管理员', '2018-10-30 14:37:44', 4, '订单关闭:关闭订单'),
	(19, 25, '后台管理员', '2018-10-30 15:07:01', 0, '修改收货人信息'),
	(20, 25, '后台管理员', '2018-10-30 15:08:13', 0, '修改费用信息'),
	(21, 25, '后台管理员', '2018-10-30 15:08:31', 0, '修改备注信息：xxx'),
	(22, 25, '后台管理员', '2018-10-30 15:08:39', 4, '订单关闭:2222'),
	(23, 12, '后台管理员', '2020-01-19 07:59:29', 4, '修改备注信息：7766767'),
	(24, 12, '后台管理员', '2020-01-19 08:00:16', 4, '修改备注信息：我是个好孩子'),
	(25, 12, '后台管理员', '2020-01-19 08:00:20', 4, '修改备注信息：我是个好孩子'),
	(26, 12, '后台管理员', '2020-01-19 08:21:37', 4, '修改备注信息：-0=-=-=-='),
	(27, 12, '后台管理员', '2020-01-19 08:35:56', 4, '修改备注信息：7897897'),
	(28, 14, '后台管理员', '2020-01-19 08:38:33', 2, '修改备注信息：90-0-'),
	(29, 12, '后台管理员', '2020-01-19 18:00:57', 0, '修改收货人信息'),
	(30, 12, '后台管理员', '2020-01-20 07:56:23', 0, '修改费用信息'),
	(31, 12, '后台管理员', '2020-01-20 08:14:47', 4, '订单关闭:456456'),
	(33, 12, '后台管理员', '2020-01-20 08:21:05', 4, '订单关闭:我要关闭'),
	(35, 13, '后台管理员', '2020-01-20 14:47:52', 2, '完成发货'),
	(36, 18, '后台管理员', '2020-01-20 14:49:11', 2, '完成发货'),
	(37, 22, '后台管理员', '2020-01-20 14:49:32', 4, '修改备注信息：234234'),
	(38, 22, '后台管理员', '2020-01-20 14:49:35', 4, '修改备注信息：234234'),
	(39, 23, '后台管理员', '2020-01-20 14:50:10', 2, '完成发货');
/*!40000 ALTER TABLE `oms_order_operate_history` ENABLE KEYS */;

-- 导出  表 mymall.oms_order_return_apply 结构
CREATE TABLE IF NOT EXISTS `oms_order_return_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `company_address_id` bigint(20) DEFAULT NULL COMMENT '收货地址表id',
  `product_id` bigint(20) DEFAULT NULL COMMENT '退货商品id',
  `order_sn` varchar(64) DEFAULT NULL COMMENT '订单编号',
  `create_time` datetime DEFAULT NULL COMMENT '申请时间',
  `member_username` varchar(64) DEFAULT NULL COMMENT '会员用户名',
  `return_amount` decimal(10,2) DEFAULT NULL COMMENT '退款金额',
  `return_name` varchar(100) DEFAULT NULL COMMENT '退货人姓名',
  `return_phone` varchar(100) DEFAULT NULL COMMENT '退货人电话',
  `status` int(1) DEFAULT NULL COMMENT '申请状态：0->待处理；1->退货中；2->已完成；3->已拒绝',
  `handle_time` datetime DEFAULT NULL COMMENT '处理时间',
  `product_pic` varchar(500) DEFAULT NULL COMMENT '商品图片',
  `product_name` varchar(200) DEFAULT NULL COMMENT '商品名称',
  `product_brand` varchar(200) DEFAULT NULL COMMENT '商品品牌',
  `product_attr` varchar(500) DEFAULT NULL COMMENT '商品销售属性：颜色：红色；尺码：xl;',
  `product_count` int(11) DEFAULT NULL COMMENT '退货数量',
  `product_price` decimal(10,2) DEFAULT NULL COMMENT '商品单价',
  `product_real_price` decimal(10,2) DEFAULT NULL COMMENT '商品实际支付单价',
  `reason` varchar(200) DEFAULT NULL COMMENT '原因',
  `description` varchar(500) DEFAULT NULL COMMENT '描述',
  `proof_pics` varchar(1000) DEFAULT NULL COMMENT '凭证图片，以逗号隔开',
  `handle_note` varchar(500) DEFAULT NULL COMMENT '处理备注',
  `handle_man` varchar(100) DEFAULT NULL COMMENT '处理人员',
  `receive_man` varchar(100) DEFAULT NULL COMMENT '收货人',
  `receive_time` datetime DEFAULT NULL COMMENT '收货时间',
  `receive_note` varchar(500) DEFAULT NULL COMMENT '收货备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='订单退货申请';

-- 正在导出表  mymall.oms_order_return_apply 的数据：~21 rows (大约)
/*!40000 ALTER TABLE `oms_order_return_apply` DISABLE KEYS */;
INSERT INTO `oms_order_return_apply` (`id`, `order_id`, `company_address_id`, `product_id`, `order_sn`, `create_time`, `member_username`, `return_amount`, `return_name`, `return_phone`, `status`, `handle_time`, `product_pic`, `product_name`, `product_brand`, `product_attr`, `product_count`, `product_price`, `product_real_price`, `reason`, `description`, `proof_pics`, `handle_note`, `handle_man`, `receive_man`, `receive_time`, `receive_note`) VALUES
	(3, 12, 2, 26, '201809150101000001', '2018-10-17 14:34:57', 'test', 19999.00, '大梨', '18000000000', 0, '2020-01-19 08:08:41', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', NULL, 'admin', 'admin', '2020-01-19 08:09:42', '我已经收货了'),
	(4, 12, 2, 27, '201809150101000001', '2018-10-17 14:40:21', 'test', 3585.98, '大梨', '18000000000', 1, '2018-10-18 13:54:10', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', '已经处理了', 'admin', NULL, NULL, NULL),
	(5, 12, 3, 28, '201809150101000001', '2018-10-17 14:44:18', 'test', 3585.98, '大梨', '18000000000', 2, '2018-10-18 13:55:28', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', '已经处理了', 'admin', 'admin', '2018-10-18 13:55:58', '已经处理了'),
	(9, 14, 2, 26, '201809130101000001', '2018-10-17 14:34:57', 'test', 3500.00, '大梨', '18000000000', 2, '2018-10-24 15:44:56', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', '呵呵', 'admin', 'admin', '2018-10-24 15:46:35', '收货了'),
	(10, 14, NULL, 27, '201809130101000001', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 3, '2018-10-24 15:46:57', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', '就是不退', 'admin', NULL, NULL, NULL),
	(11, 14, 2, 28, '201809130101000001', '2018-10-17 14:44:18', 'test', 591.05, '大梨', '18000000000', 1, '2018-10-24 17:09:04', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', '可以退款', 'admin', NULL, NULL, NULL),
	(12, 15, 3, 26, '201809130102000002', '2018-10-17 14:34:57', 'test', 3500.00, '大梨', '18000000000', 2, '2018-10-24 17:22:54', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', '退货了', 'admin', 'admin', '2018-10-24 17:23:06', '收货了'),
	(13, 15, NULL, 27, '201809130102000002', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 3, '2018-10-24 17:23:30', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', '无法退货', 'admin', NULL, NULL, NULL),
	(15, 16, NULL, 26, '201809140101000001', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL),
	(16, 16, NULL, 27, '201809140101000001', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL),
	(17, 16, NULL, 28, '201809140101000001', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL),
	(18, 17, NULL, 26, '201809150101000003', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL),
	(19, 17, NULL, 27, '201809150101000003', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL),
	(20, 17, NULL, 28, '201809150101000003', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL),
	(21, 18, NULL, 26, '201809150102000004', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL),
	(22, 18, NULL, 27, '201809150102000004', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL),
	(23, 18, NULL, 28, '201809150102000004', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL),
	(24, 19, NULL, 26, '201809130101000003', '2018-10-17 14:34:57', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '华为 HUAWEI P20', '华为', '颜色：金色;内存：16G', 1, 3788.00, 3585.98, '质量问题', '老是卡', '', NULL, NULL, NULL, NULL, NULL),
	(25, 19, NULL, 27, '201809130101000003', '2018-10-17 14:40:21', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '小米8', '小米', '颜色：黑色;内存：32G', 1, 2699.00, 2022.81, '质量问题', '不够高端', '', NULL, NULL, NULL, NULL, NULL),
	(26, 19, NULL, 28, '201809130101000003', '2018-10-17 14:44:18', 'test', NULL, '大梨', '18000000000', 0, NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '红米5A', '小米', '颜色：金色;内存：16G', 1, 649.00, 591.05, '质量问题', '颜色太土', '', NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `oms_order_return_apply` ENABLE KEYS */;

-- 导出  表 mymall.oms_order_return_reason 结构
CREATE TABLE IF NOT EXISTS `oms_order_return_reason` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '退货类型',
  `sort` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL COMMENT '状态：0->不启用；1->启用',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='退货原因表';

-- 正在导出表  mymall.oms_order_return_reason 的数据：~13 rows (大约)
/*!40000 ALTER TABLE `oms_order_return_reason` DISABLE KEYS */;
INSERT INTO `oms_order_return_reason` (`id`, `name`, `sort`, `status`, `create_time`) VALUES
	(1, '质量问题', 1, 1, '2018-10-17 10:00:45'),
	(2, '尺码太大', 1, 0, '2018-10-17 10:01:03'),
	(3, '颜色不喜欢', 1, 1, '2018-10-17 10:01:13'),
	(4, '7天无理由退货', 1, 1, '2018-10-17 10:01:47'),
	(5, '价格问题', 1, 0, '2018-10-17 10:01:57'),
	(12, '发票问题', 0, 1, '2018-10-19 16:28:36'),
	(13, '其他问题', 0, 1, '2018-10-19 16:28:51'),
	(14, '物流问题', 0, 1, '2018-10-19 16:29:01'),
	(15, '售后问题', 0, 1, '2018-10-19 16:29:11'),
	(16, '45646', 0, 1, '2020-02-04 17:41:31'),
	(18, '565656', 0, 1, '2020-02-04 17:42:59'),
	(19, '456456546', 0, 1, '2020-02-04 17:44:38'),
	(20, '898989', 0, 1, '2020-02-04 17:46:32');
/*!40000 ALTER TABLE `oms_order_return_reason` ENABLE KEYS */;

-- 导出  表 mymall.oms_order_setting 结构
CREATE TABLE IF NOT EXISTS `oms_order_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `flash_order_overtime` int(11) DEFAULT NULL COMMENT '秒杀订单超时关闭时间(分)',
  `normal_order_overtime` int(11) DEFAULT NULL COMMENT '正常订单超时时间(分)',
  `confirm_overtime` int(11) DEFAULT NULL COMMENT '发货后自动确认收货时间（天）',
  `finish_overtime` int(11) DEFAULT NULL COMMENT '自动完成交易时间，不能申请售后（天）',
  `comment_overtime` int(11) DEFAULT NULL COMMENT '订单完成后自动好评时间（天）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='订单设置表';

-- 正在导出表  mymall.oms_order_setting 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `oms_order_setting` DISABLE KEYS */;
INSERT INTO `oms_order_setting` (`id`, `flash_order_overtime`, `normal_order_overtime`, `confirm_overtime`, `finish_overtime`, `comment_overtime`) VALUES
	(1, 60, 120, 15, 8, 8);
/*!40000 ALTER TABLE `oms_order_setting` ENABLE KEYS */;

-- 导出  表 mymall.pms_brand 结构
CREATE TABLE IF NOT EXISTS `pms_brand` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `first_letter` varchar(8) DEFAULT NULL COMMENT '首字母',
  `sort` int(11) DEFAULT NULL,
  `factory_status` int(1) DEFAULT NULL COMMENT '是否为品牌制造商：0->不是；1->是',
  `show_status` int(1) DEFAULT NULL,
  `product_count` int(11) DEFAULT NULL COMMENT '产品数量',
  `product_comment_count` int(11) DEFAULT NULL COMMENT '产品评论数量',
  `logo` varchar(255) DEFAULT NULL COMMENT '品牌logo',
  `big_pic` varchar(255) DEFAULT NULL COMMENT '专区大图',
  `brand_story` text COMMENT '品牌故事',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='品牌表';

-- 正在导出表  mymall.pms_brand 的数据：~13 rows (大约)
/*!40000 ALTER TABLE `pms_brand` DISABLE KEYS */;
INSERT INTO `pms_brand` (`id`, `name`, `first_letter`, `sort`, `factory_status`, `show_status`, `product_count`, `product_comment_count`, `logo`, `big_pic`, `brand_story`) VALUES
	(1, '万和', 'W', 0, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(5).jpg', '', 'Victoria\'s Secret的故事'),
	(2, '三星', 'S', 100, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (1).jpg', NULL, '三星的故事'),
	(3, '华为', 'H', 100, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/17f2dd9756d9d333bee8e60ce8c03e4c_222_222.jpg', NULL, 'Victoria\'s Secret的故事'),
	(4, '格力', 'G', 30, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/dc794e7e74121272bbe3ce9bc41ec8c3_222_222.jpg', NULL, 'Victoria\'s Secret的故事'),
	(5, '方太', 'F', 20, 1, 1, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg (4).jpg', NULL, 'Victoria\'s Secret的故事'),
	(6, '小米', 'M', 500, 0, 0, 100, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/1e34aef2a409119018a4c6258e39ecfb_222_222.png', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180518/5afd7778Nf7800b75.jpg', '小米手机的故事'),
	(21, 'OPPO', 'O', 0, 1, 1, 88, 500, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg(6).jpg', '', 'string'),
	(49, '七匹狼', 'S', 200, 1, 1, 77, 400, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/18d8bc3eb13533fab466d702a0d3fd1f40345bcd.jpg', NULL, 'BOOB的故事'),
	(50, '海澜之家', 'H', 200, 1, 1, 66, 300, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/99d3279f1029d32b929343b09d3c72de_222_222.jpg', '', '海澜之家的故事'),
	(51, '苹果', 'A', 200, 1, 1, 55, 200, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg', NULL, '苹果的故事'),
	(58, 'NIKE', 'N', 0, 1, 1, 33, 100, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/timg (51).jpg', '', 'NIKE的故事'),
	(60, '123123', '123', 0, 0, 0, NULL, NULL, 'http://localhost:8080/static/upload/images//74f8af6d-a7b8-4eba-b139-b195f80303c0.jpg', 'http://localhost:8080/static/upload/images//c754c490-5675-4112-be63-d275ef790322.jpeg', '1231'),
	(61, '44', '44', 0, 0, 0, NULL, NULL, 'http://localhost:8080/static/upload/images//89822d08-7432-4b5e-a90b-2d55c3831f33.jpg', 'http://localhost:8080/static/upload/images//c4354002-697b-4067-a4b2-8381aaf76583.jpg', '343'),
	(62, '333', '222', 0, 0, 0, NULL, NULL, 'http://localhost:8080/static/upload/images//e6f61945-c22e-4ff9-afa7-e0d2aeace16d.jpg', 'http://localhost:8080/static/upload/images//a64d4850-f991-49af-bf33-5689eefe7297.jpg', '23213');
/*!40000 ALTER TABLE `pms_brand` ENABLE KEYS */;

-- 导出  表 mymall.pms_member_price 结构
CREATE TABLE IF NOT EXISTS `pms_member_price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `member_level_id` bigint(20) DEFAULT NULL,
  `member_price` decimal(10,2) DEFAULT NULL COMMENT '会员价格',
  `member_level_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=315 DEFAULT CHARSET=utf8 COMMENT='商品会员价格表';

-- 正在导出表  mymall.pms_member_price 的数据：~122 rows (大约)
/*!40000 ALTER TABLE `pms_member_price` DISABLE KEYS */;
INSERT INTO `pms_member_price` (`id`, `product_id`, `member_level_id`, `member_price`, `member_level_name`) VALUES
	(26, 7, 1, 500.00, NULL),
	(27, 8, 1, 500.00, NULL),
	(28, 9, 1, 500.00, NULL),
	(29, 10, 1, 500.00, NULL),
	(30, 11, 1, 500.00, NULL),
	(31, 12, 1, 500.00, NULL),
	(32, 13, 1, 500.00, NULL),
	(33, 14, 1, 500.00, NULL),
	(37, 18, 1, 500.00, NULL),
	(44, 7, 2, 480.00, NULL),
	(45, 7, 3, 450.00, NULL),
	(52, 22, 1, NULL, NULL),
	(53, 22, 2, NULL, NULL),
	(54, 22, 3, NULL, NULL),
	(58, 24, 1, NULL, NULL),
	(59, 24, 2, NULL, NULL),
	(60, 24, 3, NULL, NULL),
	(112, 23, 1, 88.00, '黄金会员'),
	(113, 23, 2, 88.00, '白金会员'),
	(114, 23, 3, 66.00, '钻石会员'),
	(142, 31, 1, NULL, '黄金会员'),
	(143, 31, 2, NULL, '白金会员'),
	(144, 31, 3, NULL, '钻石会员'),
	(148, 32, 1, NULL, '黄金会员'),
	(149, 32, 2, NULL, '白金会员'),
	(150, 32, 3, NULL, '钻石会员'),
	(154, 33, 1, NULL, '黄金会员'),
	(155, 33, 2, NULL, '白金会员'),
	(156, 33, 3, NULL, '钻石会员'),
	(172, 35, 1, NULL, '黄金会员'),
	(173, 35, 2, NULL, '白金会员'),
	(174, 35, 3, NULL, '钻石会员'),
	(175, 34, 1, NULL, '黄金会员'),
	(176, 34, 2, NULL, '白金会员'),
	(177, 34, 3, NULL, '钻石会员'),
	(178, 30, 1, NULL, '黄金会员'),
	(179, 30, 2, NULL, '白金会员'),
	(180, 30, 3, NULL, '钻石会员'),
	(195, 28, 1, NULL, '黄金会员'),
	(196, 28, 2, NULL, '白金会员'),
	(197, 28, 3, NULL, '钻石会员'),
	(198, 29, 1, NULL, '黄金会员'),
	(199, 29, 2, NULL, '白金会员'),
	(200, 29, 3, NULL, '钻石会员'),
	(201, 37, 1, 17.00, '黄金会员'),
	(202, 37, 2, 18.00, '白金会员'),
	(203, 37, 3, 19.00, '钻石会员'),
	(204, 38, 1, NULL, '黄金会员'),
	(205, 38, 2, NULL, '白金会员'),
	(206, 38, 3, NULL, '钻石会员'),
	(207, 39, 1, NULL, '黄金会员'),
	(208, 39, 2, NULL, '白金会员'),
	(209, 39, 3, NULL, '钻石会员'),
	(210, 40, 1, NULL, '黄金会员'),
	(211, 40, 2, NULL, '白金会员'),
	(212, 40, 3, NULL, '钻石会员'),
	(213, 41, 1, NULL, '黄金会员'),
	(214, 41, 2, NULL, '白金会员'),
	(215, 41, 3, NULL, '钻石会员'),
	(216, 42, 1, NULL, '黄金会员'),
	(217, 42, 2, NULL, '白金会员'),
	(218, 42, 3, NULL, '钻石会员'),
	(219, 43, 1, NULL, '黄金会员'),
	(220, 43, 2, NULL, '白金会员'),
	(221, 43, 3, NULL, '钻石会员'),
	(222, 44, 1, NULL, '黄金会员'),
	(223, 44, 2, NULL, '白金会员'),
	(224, 44, 3, NULL, '钻石会员'),
	(225, 45, 1, NULL, '黄金会员'),
	(226, 45, 2, NULL, '白金会员'),
	(227, 45, 3, NULL, '钻石会员'),
	(231, 47, 1, NULL, '黄金会员'),
	(232, 47, 2, NULL, '白金会员'),
	(233, 47, 3, NULL, '钻石会员'),
	(234, 52, 1, NULL, '黄金会员'),
	(235, 52, 2, NULL, '白金会员'),
	(236, 52, 3, NULL, '钻石会员'),
	(237, 53, 1, NULL, '黄金会员'),
	(238, 53, 2, NULL, '白金会员'),
	(239, 53, 3, NULL, '钻石会员'),
	(240, 54, 1, NULL, '黄金会员'),
	(241, 54, 2, NULL, '白金会员'),
	(242, 54, 3, NULL, '钻石会员'),
	(243, 55, 1, NULL, '黄金会员'),
	(244, 55, 2, NULL, '白金会员'),
	(245, 55, 3, NULL, '钻石会员'),
	(246, 56, 1, NULL, '黄金会员'),
	(247, 56, 2, NULL, '白金会员'),
	(248, 56, 3, NULL, '钻石会员'),
	(249, 57, 1, NULL, '黄金会员'),
	(250, 57, 2, NULL, '白金会员'),
	(251, 57, 3, NULL, '钻石会员'),
	(252, 58, 1, NULL, '黄金会员'),
	(253, 58, 2, NULL, '白金会员'),
	(254, 58, 3, NULL, '钻石会员'),
	(264, 59, 1, NULL, '黄金会员'),
	(265, 59, 2, NULL, '白金会员'),
	(266, 59, 3, NULL, '钻石会员'),
	(267, 60, 1, NULL, '黄金会员'),
	(268, 60, 2, NULL, '白金会员'),
	(269, 60, 3, NULL, '钻石会员'),
	(273, 46, 1, NULL, '黄金会员'),
	(274, 46, 2, NULL, '白金会员'),
	(275, 46, 3, NULL, '钻石会员'),
	(276, 61, 1, NULL, '黄金会员'),
	(277, 61, 2, NULL, '白金会员'),
	(278, 61, 3, NULL, '钻石会员'),
	(279, 62, 1, NULL, '黄金会员'),
	(280, 62, 2, NULL, '白金会员'),
	(281, 62, 3, NULL, '钻石会员'),
	(282, 36, 1, NULL, '黄金会员'),
	(283, 36, 2, NULL, '白金会员'),
	(284, 36, 3, NULL, '钻石会员'),
	(300, 26, 1, NULL, '黄金会员'),
	(301, 26, 2, NULL, '白金会员'),
	(302, 26, 3, NULL, '钻石会员'),
	(303, 27, 1, NULL, '黄金会员'),
	(304, 27, 2, NULL, '白金会员'),
	(305, 27, 3, NULL, '钻石会员'),
	(312, 63, 1, NULL, '黄金会员'),
	(313, 63, 2, NULL, '白金会员'),
	(314, 63, 3, NULL, '钻石会员');
/*!40000 ALTER TABLE `pms_member_price` ENABLE KEYS */;

-- 导出  表 mymall.pms_product 结构
CREATE TABLE IF NOT EXISTS `pms_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `brand_id` bigint(20) DEFAULT NULL,
  `product_category_id` bigint(20) DEFAULT NULL,
  `feight_template_id` bigint(20) DEFAULT NULL,
  `product_attribute_category_id` bigint(20) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `pic` varchar(255) DEFAULT NULL COMMENT '显示的主图片',
  `product_sn` varchar(64) NOT NULL COMMENT '货号',
  `delete_status` int(1) DEFAULT NULL COMMENT '删除状态：0->未删除；1->已删除',
  `publish_status` int(1) DEFAULT NULL COMMENT '上架状态：0->下架；1->上架',
  `new_status` int(1) DEFAULT NULL COMMENT '新品状态:0->不是新品；1->新品',
  `recommand_status` int(1) DEFAULT NULL COMMENT '推荐状态；0->不推荐；1->推荐',
  `verify_status` int(1) DEFAULT NULL COMMENT '审核状态：0->未审核；1->审核通过',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `sale` int(11) DEFAULT NULL COMMENT '销量',
  `price` decimal(10,2) DEFAULT NULL,
  `promotion_price` decimal(10,2) DEFAULT NULL COMMENT '促销价格',
  `gift_growth` int(11) DEFAULT '0' COMMENT '赠送的成长值',
  `gift_point` int(11) DEFAULT '0' COMMENT '赠送的积分',
  `use_point_limit` int(11) DEFAULT NULL COMMENT '限制使用的积分数',
  `sub_title` varchar(255) DEFAULT NULL COMMENT '副标题',
  `description` text COMMENT '商品描述',
  `original_price` decimal(10,2) DEFAULT NULL COMMENT '市场价',
  `stock` int(11) DEFAULT NULL COMMENT '库存',
  `low_stock` int(11) DEFAULT NULL COMMENT '库存预警值',
  `unit` varchar(16) DEFAULT NULL COMMENT '单位',
  `weight` decimal(10,2) DEFAULT NULL COMMENT '商品重量，默认为克',
  `preview_status` int(1) DEFAULT NULL COMMENT '是否为预告商品：0->不是；1->是',
  `service_ids` varchar(64) DEFAULT NULL COMMENT '以逗号分割的产品服务：1->无忧退货；2->快速退款；3->免费包邮',
  `keywords` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `album_pics` varchar(1024) DEFAULT NULL COMMENT '画册图片，连产品图片限制为5张，以逗号分割',
  `detail_title` varchar(255) DEFAULT NULL,
  `detail_desc` text,
  `detail_html` text COMMENT '产品详情网页内容',
  `detail_mobile_html` text COMMENT '移动端网页详情',
  `promotion_start_time` datetime DEFAULT NULL COMMENT '促销开始时间',
  `promotion_end_time` datetime DEFAULT NULL COMMENT '促销结束时间',
  `promotion_per_limit` int(11) DEFAULT NULL COMMENT '活动限购数量',
  `promotion_type` int(1) DEFAULT NULL COMMENT '促销类型：0->没有促销使用原价;1->使用促销价；2->使用会员价；3->使用阶梯价格；4->使用满减价格；5->限时购',
  `brand_name` varchar(255) DEFAULT NULL COMMENT '品牌名称',
  `product_category_name` varchar(255) DEFAULT NULL COMMENT '商品分类名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='商品信息';

-- 正在导出表  mymall.pms_product 的数据：~51 rows (大约)
/*!40000 ALTER TABLE `pms_product` DISABLE KEYS */;
INSERT INTO `pms_product` (`id`, `brand_id`, `product_category_id`, `feight_template_id`, `product_attribute_category_id`, `name`, `pic`, `product_sn`, `delete_status`, `publish_status`, `new_status`, `recommand_status`, `verify_status`, `sort`, `sale`, `price`, `promotion_price`, `gift_growth`, `gift_point`, `use_point_limit`, `sub_title`, `description`, `original_price`, `stock`, `low_stock`, `unit`, `weight`, `preview_status`, `service_ids`, `keywords`, `note`, `album_pics`, `detail_title`, `detail_desc`, `detail_html`, `detail_mobile_html`, `promotion_start_time`, `promotion_end_time`, `promotion_per_limit`, `promotion_type`, `brand_name`, `product_category_name`) VALUES
	(1, 49, 7, 0, 0, '银色星芒刺绣网纱底裤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 1, 1, 1, 100, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '七匹狼', '外套'),
	(2, 49, 7, 0, 0, '银色星芒刺绣网纱底裤2', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86578', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤2', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '<p>银色星芒刺绣网纱底裤</p>', '<p>银色星芒刺绣网纱底裤</p>', NULL, NULL, NULL, 0, '七匹狼', '外套'),
	(3, 1, 7, 0, 0, '银色星芒刺绣网纱底裤3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86579', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤3', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套'),
	(4, 1, 7, 0, 0, '银色星芒刺绣网纱底裤4', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86580', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤4', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套'),
	(5, 1, 7, 0, 0, '银色星芒刺绣网纱底裤5', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86581', 1, 0, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤5', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套'),
	(6, 1, 7, 0, 0, '银色星芒刺绣网纱底裤6', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86582', 1, 1, 1, 1, 1, 1, 0, 100.00, NULL, 0, 100, NULL, '111', '111', 120.00, 100, 20, '件', 1000.00, 0, NULL, '银色星芒刺绣网纱底裤6', '银色星芒刺绣网纱底裤', NULL, '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', '银色星芒刺绣网纱底裤', NULL, NULL, NULL, 0, '万和', '外套'),
	(7, 1, 7, 0, 1, '女式超柔软拉毛运动开衫', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套'),
	(8, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套'),
	(9, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套'),
	(10, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 0, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套'),
	(11, 1, 7, 0, 1, '女式超柔软拉毛运动开衫1', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套'),
	(12, 1, 7, 0, 1, '女式超柔软拉毛运动开衫2', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套'),
	(13, 1, 7, 0, 1, '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 1, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套'),
	(14, 1, 7, 0, 1, '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套'),
	(18, 1, 7, 0, 1, '女式超柔软拉毛运动开衫3', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180522/web.png', 'No86577', 1, 0, 0, 1, 0, 0, 0, 249.00, 0.00, 0, 100, 0, '匠心剪裁，垂感质地', '匠心剪裁，垂感质地', 299.00, 100, 0, '件', 0.00, 0, 'string', '女式超柔软拉毛运动开衫', 'string', 'string', 'string', 'string', 'string', 'string', '2018-04-26 10:41:03', '2018-04-26 10:41:03', 0, 0, '万和', '外套'),
	(22, 6, 7, 0, 1, 'test', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', '', 1, 1, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, 'test', '', 0.00, 100, 0, '', 0.00, 1, '1,2', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '外套'),
	(23, 6, 19, 0, 1, '毛衫测试', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', 'NO.1098', 1, 1, 1, 1, 0, 0, 0, 99.00, NULL, 99, 99, 1000, '毛衫测试11', 'xxx', 109.00, 100, 0, '件', 1000.00, 1, '1,2,3', '毛衫测试', '毛衫测试', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', '毛衫测试', '毛衫测试', '<p><img class="wscnph" src="http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/155x54.bmp" /><img class="wscnph" src="http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/APP登录bg1080.jpg" width="500" height="500" /><img class="wscnph" src="http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/APP登录界面.jpg" width="500" height="500" /></p>', '', NULL, NULL, 0, 2, '小米', '手机通讯'),
	(24, 6, 7, 0, NULL, 'xxx', '', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, 'xxx', '', 0.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '外套'),
	(26, 3, 19, 0, 3, '华为 HUAWEI P20 ', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf58Ndefaac16.jpg', '6946605', 0, 1, 1, 1, 0, 100, 0, 3788.00, NULL, 3788, 3788, 0, 'AI智慧全面屏 6GB +64GB 亮黑色 全网通版 移动联通电信4G手机 双卡双待手机 双卡双待', '', 4288.00, 1000, 0, '件', 0.00, 1, '2,3,1', '', '', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ab46a3cN616bdc41.jpg,http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ac1bf5fN2522b9dc.jpg', '', '', '<p><img class="wscnph" src="http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44f1cNf51f3bb0.jpg" /><img class="wscnph" src="http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa8Nfcf71c10.jpg" /><img class="wscnph" src="http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad44fa9N40e78ee0.jpg" /><img class="wscnph" src="http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f4N1c94bdda.jpg" /><img class="wscnph" src="http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5ad457f5Nd30de41d.jpg" /><img class="wscnph" src="http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/5b10fb0eN0eb053fb.jpg" /></p>', '', NULL, NULL, 0, 1, '华为', '手机通讯'),
	(27, 6, 19, 0, 3, '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/xiaomi.jpg', '7437788', 0, 0, 1, 1, 0, 0, 0, 2699.00, NULL, 2699, 2699, 0, '骁龙845处理器，红外人脸解锁，AI变焦双摄，AI语音助手小米6X低至1299，点击抢购', '小米8 全面屏游戏智能手机 6GB+64GB 黑色 全网通4G 双卡双待', 2699.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '<p><img class="wscnph" src="http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b2254e8N414e6d3a.jpg" width="500" /></p>', '', NULL, NULL, 0, 3, '小米', '手机通讯'),
	(28, 6, 19, 0, 3, '小米 红米5A 全网通版 3GB+32GB 香槟金 移动联通电信4G手机 双卡双待', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a9d248cN071f4959.jpg', '7437789', 0, 1, 1, 1, 0, 0, 0, 649.00, NULL, 649, 649, 0, '8天超长待机，137g轻巧机身，高通骁龙处理器小米6X低至1299，点击抢购', '', 649.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 4, '小米', '手机通讯'),
	(29, 51, 19, 0, 3, 'Apple iPhone 8 Plus 64GB 红色特别版 移动联通电信4G手机', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5acc5248N6a5f81cd.jpg', '7437799', 0, 0, 0, 0, 0, 0, 0, 5499.00, NULL, 5499, 5499, 0, '【限时限量抢购】Apple产品年中狂欢节，好物尽享，美在智慧！速来 >> 勾选[保障服务][原厂保2年]，获得AppleCare+全方位服务计划，原厂延保售后无忧。', '', 5499.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '苹果', '手机通讯'),
	(30, 50, 8, 0, 1, 'HLA海澜之家简约动物印花短袖T恤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ad83a4fN6ff67ecd.jpg!cc_350x449.jpg', 'HNTBJ2E042A', 0, 0, 1, 0, 0, 0, 0, 98.00, NULL, 0, 0, 0, '2018夏季新品微弹舒适新款短T男生 6月6日-6月20日，满300减30，参与互动赢百元礼券，立即分享赢大奖', '', 98.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '海澜之家', 'T恤'),
	(31, 50, 8, 0, 1, 'HLA海澜之家蓝灰花纹圆领针织布短袖T恤', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5ac98b64N70acd82f.jpg!cc_350x449.jpg', 'HNTBJ2E080A', 0, 1, 0, 0, 0, 0, 0, 98.00, NULL, 0, 0, 0, '2018夏季新品短袖T恤男HNTBJ2E080A 蓝灰花纹80 175/92A/L80A 蓝灰花纹80 175/92A/L', '', 98.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '海澜之家', 'T恤'),
	(32, 50, 8, 0, NULL, 'HLA海澜之家短袖T恤男基础款', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5a51eb88Na4797877.jpg', 'HNTBJ2E153A', 0, 1, 0, 0, 0, 0, 0, 68.00, NULL, 0, 0, 0, 'HLA海澜之家短袖T恤男基础款简约圆领HNTBJ2E153A藏青(F3)175/92A(50)', '', 68.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '海澜之家', 'T恤'),
	(33, 6, 35, 0, NULL, '小米（MI）小米电视4A ', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b02804dN66004d73.jpg', '4609652', 0, 1, 0, 0, 0, 0, 0, 2499.00, NULL, 0, 0, 0, '小米（MI）小米电视4A 55英寸 L55M5-AZ/L55M5-AD 2GB+8GB HDR 4K超高清 人工智能网络液晶平板电视', '', 2499.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '手机数码'),
	(34, 6, 35, 0, NULL, '小米（MI）小米电视4A 65英寸', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b028530N51eee7d4.jpg', '4609660', 0, 1, 0, 0, 0, 0, 0, 3999.00, NULL, 0, 0, 0, ' L65M5-AZ/L65M5-AD 2GB+8GB HDR 4K超高清 人工智能网络液晶平板电视', '', 3999.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '小米', '手机数码'),
	(35, 58, 29, 0, NULL, '耐克NIKE 男子 休闲鞋 ROSHE RUN 运动鞋 511881-010黑色41码', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b235bb9Nf606460b.jpg', '6799342', 0, 1, 0, 0, 0, 0, 0, 369.00, NULL, 0, 0, 0, '耐克NIKE 男子 休闲鞋 ROSHE RUN 运动鞋 511881-010黑色41码', '', 369.00, 100, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, 'NIKE', '男鞋'),
	(36, 58, 29, 0, NULL, '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180615/5b19403eN9f0b3cb8.jpg', '6799345', 0, 1, 1, 1, 0, 0, 0, 499.00, NULL, 0, 0, 0, '耐克NIKE 男子 气垫 休闲鞋 AIR MAX 90 ESSENTIAL 运动鞋 AJ1285-101白色41码', '', 499.00, 100, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/c8085b4f-00c8-4146-aab6-c54706b8ccff.jpg', '', '', '', '', NULL, NULL, 0, 0, 'NIKE', '男鞋'),
	(37, 50, 9, 0, 2, '4444', 'http://localhost:8080/static/upload/images/pics/3.jpg', '2', 1, 1, 1, 1, 0, 8, 0, 3.00, 16.00, 10, 9, 11, '555', '1', 4.00, 5, 0, '6', 7.00, 1, '2,1,3', '14', '15', 'http://localhost:8080/static/upload/images/pics/9.jpg,http://localhost:8080/static/upload/images/pics/14.jpg,http://localhost:8080/static/upload/images/pics/8.jpg', '12', '13', '', '', '2020-01-16 16:00:00', '2020-01-24 16:00:00', 0, 4, '海澜之家', '休闲裤'),
	(38, 3, 30, 0, 2, '32332', 'http://localhost:8080/static/upload/images/pics/3.jpg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '233223', '232323', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/9.jpg,http://localhost:8080/static/upload/images/pics/14.jpg,http://localhost:8080/static/upload/images/pics/8.jpg', '', '', '', '', NULL, NULL, 0, 0, '华为', '手机配件'),
	(39, 3, 7, 0, NULL, '54545', 'http://localhost:8080/static/upload/images/pics/3.jpg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '4545', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/9.jpg,http://localhost:8080/static/upload/images/pics/14.jpg,http://localhost:8080/static/upload/images/pics/8.jpg', '', '', '', '', NULL, NULL, 0, 0, '华为', '外套'),
	(40, 4, 7, 0, NULL, '565656', 'http://localhost:8080/static/upload/images/pics/3.jpg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '565656', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/9.jpg,http://localhost:8080/static/upload/images/pics/14.jpg,http://localhost:8080/static/upload/images/pics/8.jpg', '', '', '', '', NULL, NULL, 0, 0, '格力', '外套'),
	(41, 2, 8, 0, NULL, '233223', '', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '232332', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/9.jpg,http://localhost:8080/static/upload/images/pics/14.jpg,http://localhost:8080/static/upload/images/pics/8.jpg', '', '', '', '', NULL, NULL, 0, 0, '三星', 'T恤'),
	(42, 2, 7, 0, NULL, '787', 'http://localhost:8080/static/upload/images/pics/3.jpg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '787878', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/9.jpg,http://localhost:8080/static/upload/images/pics/14.jpg,http://localhost:8080/static/upload/images/pics/8.jpg', '', '', '', '', NULL, NULL, 0, 0, '三星', '外套'),
	(43, 49, 30, 0, NULL, '909090', 'http://localhost:8080/static/upload/images/pics/3.jpg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '9090', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/9.jpg,http://localhost:8080/static/upload/images/pics/14.jpg,http://localhost:8080/static/upload/images/pics/8.jpg', '', '', '', '', NULL, NULL, 0, 0, '七匹狼1', '手机配件'),
	(44, 2, 30, 0, NULL, '234324', 'http://localhost:8080/static/upload/images/pics/3.jpg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '234234', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/9.jpg,http://localhost:8080/static/upload/images/pics/14.jpg,http://localhost:8080/static/upload/images/pics/8.jpg', '', '', '', '', NULL, NULL, 0, 0, '三星', '手机配件'),
	(45, 2, 7, 0, NULL, '2342', 'http://localhost:8080/static/upload/images/pics/4.jpeg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '23432', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/9.jpg,http://localhost:8080/static/upload/images/pics/14.jpg,http://localhost:8080/static/upload/images/pics/8.jpg', '', '', '', '', NULL, NULL, 0, 0, '三星', '外套'),
	(46, 4, 30, 0, 1, '23432', 'http://localhost:8080/static/upload/images/pics/3.jpg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '4234234', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/8.jpg,http://localhost:8080/static/upload/images/pics/9.jpg', '', '', '', '', NULL, NULL, 0, 0, '格力', '手机配件'),
	(47, 3, 7, 0, NULL, '6666666666', 'http://localhost:8080/static/upload/images/pics/13.jpg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '666666', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/9.jpg,http://localhost:8080/static/upload/images/pics/14.jpg,http://localhost:8080/static/upload/images/pics/8.jpg', '', '', '', '', NULL, NULL, 0, 0, '华为', '外套'),
	(48, 4, 47, 0, NULL, '234234234', 'http://localhost:8080/static/upload/images/pics/3.jpg', '', 1, 0, 0, 1, 0, 0, 0, 0.00, NULL, 0, 0, 0, '234234', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/9.jpg,http://localhost:8080/static/upload/images/pics/8.jpg', '', '', '', '', NULL, NULL, 0, 0, '格力', '客厅家具'),
	(49, 2, 31, 0, NULL, '454545', 'http://localhost:8080/static/upload/images/pics/4.jpeg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '454545', '456546546', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/6.jpg', '', '', '', '', NULL, NULL, 0, 0, '三星', '摄影摄像'),
	(50, 2, 31, 0, NULL, '454545', 'http://localhost:8080/static/upload/images/pics/4.jpeg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '454545', '456546546', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/6.jpg', '', '', '', '', NULL, NULL, 0, 0, '三星', '摄影摄像'),
	(51, 4, 30, 0, NULL, '23432', 'http://localhost:8080/static/upload/images/pics/', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '42343242', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/', '', '', '', '', NULL, NULL, 0, 0, '格力', '手机配件'),
	(52, 4, 31, 0, NULL, '454545', 'http://localhost:8080/static/upload/images/pics/4.jpeg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '454545', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/3.jpg', '', '', '', '', NULL, NULL, 0, 0, '格力', '摄影摄像'),
	(53, 51, 38, 0, NULL, '123213', 'http://localhost:8080/static/upload/images/pics/blob:http://localhost:8090/71b56459-4557-4e97-a0ef-f13757c9a3ef', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '12321', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/blob:http://localhost:8090/3391bc29-9734-4dcd-b5a1-5e4b361382ec,http://localhost:8080/static/upload/images/pics/blob:http://localhost:8090/e5dc102c-c53c-4ac4-9d08-1e7ab1a175db,http://localhost:8080/static/upload/images/pics/blob:http://localhost:8090/dadf2a7e-4dd3-4a8b-b74f-ebae6b526357,http://localhost:8080/static/upload/images/pics/blob:http://localhost:8090/476ed568-3882-4590-9f7b-ac7dc9f383c0', '', '', '', '', NULL, NULL, 0, 0, '苹果1', '冰箱'),
	(54, 2, 30, 0, NULL, '34', 'http://localhost:8080/static/upload/images/pics/blob:http://localhost:8090/2aa1ae26-dd56-4987-b805-bf667c14cbee', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '34', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/blob:http://localhost:8090/d97116c6-7fe6-4667-925a-31ad6153f6b9', '', '', '', '', NULL, NULL, 0, 0, '三星', '手机配件'),
	(55, 3, 8, 0, NULL, '2342', 'http://localhost:8080/static/upload/images/pics/', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '234', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/', '', '', '', '', NULL, NULL, 0, 0, '华为', 'T恤'),
	(56, 3, 7, 0, NULL, '234523', 'http://localhost:8080/static/upload/images/pics/blob:http://localhost:8090/cda367e6-0d17-4c3b-984d-cd1ba61004de', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '23432', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/blob:http://localhost:8090/d463740e-1ae9-4d7d-b902-c9f4436f0bfb', '', '', '', '', NULL, NULL, 0, 0, '华为', '外套'),
	(57, 3, 8, 0, NULL, '23423', 'http://localhost:8080/static/upload/images/pics/http://localhost:8080/static/upload/images/pics/8.jpg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '2342', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/http://localhost:8080/static/upload/images/pics/9.jpg', '', '', '', '', NULL, NULL, 0, 0, '华为', 'T恤'),
	(58, 2, 30, 0, NULL, '23423', 'http://localhost:8080/static/upload/images/pics/http://localhost:8080/static/upload/images/pics/9.jpg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '23423', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/http://localhost:8080/static/upload/images/pics/8.jpg,http://localhost:8080/static/upload/images/pics/http://localhost:8080/static/upload/images/pics/2.jpg', '', '', '', '', NULL, NULL, 0, 0, '三星', '手机配件'),
	(59, 4, 7, 0, 2, '2位432', 'http://localhost:8080/static/upload/images/pics/8.jpg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '234234', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/2.jpg,http://localhost:8080/static/upload/images/pics/9.jpg,http://localhost:8080/static/upload/images/pics/4.jpeg,http://localhost:8080/static/upload/images/pics/10.jpg', '', '', '', '', NULL, NULL, 0, 0, '格力', '外套'),
	(60, 2, 7, 0, NULL, '23423', 'http://localhost:8080/static/upload/images/pics/3.jpg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '23423', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/14.jpg', '', '', '', '', NULL, NULL, 0, 0, '三星', '外套'),
	(61, 3, 7, 0, NULL, '12312', 'http://localhost:8080/static/upload/images/pics/8.jpg', '123', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '123', '123', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/15.jpg,http://localhost:8080/static/upload/images/pics/9.jpg', '', '', '', '', NULL, NULL, 0, 0, '华为', '外套'),
	(62, 2, 7, 0, NULL, '23423', 'http://localhost:8080/static/upload/images/pics/a713a2fe-a6a6-432f-8c03-29177452821e.jpg', '', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '4234', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', 'http://localhost:8080/static/upload/images/pics/79361c6a-8098-4e9c-b702-c5addd6e8fed.jpg', '', '', '', '', NULL, NULL, 0, 0, '三星', '外套'),
	(63, 49, 30, 0, 2, '234234', 'http://localhost:8080/static/upload/images//ae344b07-a4fe-478b-b35e-f2e9b0f85f6b.jpg', '23423', 1, 0, 0, 0, 0, 0, 0, 0.00, NULL, 0, 0, 0, '23423', '', 0.00, 0, 0, '', 0.00, 0, '', '', '', '', '', '', '', '', NULL, NULL, 0, 0, '七匹狼', '手机配件');
/*!40000 ALTER TABLE `pms_product` ENABLE KEYS */;

-- 导出  表 mymall.pms_product_attribute 结构
CREATE TABLE IF NOT EXISTS `pms_product_attribute` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_attribute_category_id` bigint(20) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `select_type` int(1) DEFAULT NULL COMMENT '属性选择类型：0->唯一；1->单选；2->多选',
  `input_type` int(1) DEFAULT NULL COMMENT '属性录入方式：0->手工录入；1->从列表中选取',
  `input_list` varchar(255) DEFAULT NULL COMMENT '可选值列表，以逗号隔开',
  `sort` int(11) DEFAULT NULL COMMENT '排序字段：最高的可以单独上传图片',
  `filter_type` int(1) DEFAULT NULL COMMENT '分类筛选样式：1->普通；1->颜色',
  `search_type` int(1) DEFAULT NULL COMMENT '检索类型；0->不需要进行检索；1->关键字检索；2->范围检索',
  `related_status` int(1) DEFAULT NULL COMMENT '相同属性产品是否关联；0->不关联；1->关联',
  `hand_add_status` int(1) DEFAULT NULL COMMENT '是否支持手动新增；0->不支持；1->支持',
  `type` int(1) DEFAULT NULL COMMENT '属性的类型；0->规格；1->参数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='商品属性参数表';

-- 正在导出表  mymall.pms_product_attribute 的数据：~29 rows (大约)
/*!40000 ALTER TABLE `pms_product_attribute` DISABLE KEYS */;
INSERT INTO `pms_product_attribute` (`id`, `product_attribute_category_id`, `name`, `select_type`, `input_type`, `input_list`, `sort`, `filter_type`, `search_type`, `related_status`, `hand_add_status`, `type`) VALUES
	(1, 1, '尺寸', 2, 1, 'M,X,XL,2XL,3XL,4XL', 0, 0, 0, 0, 0, 0),
	(7, 1, '颜色', 2, 1, '黑色,红色,白色,粉色', 100, 0, 0, 0, 1, 0),
	(13, 0, '上市年份', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1),
	(14, 0, '上市年份1', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1),
	(15, 0, '上市年份2', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1),
	(16, 0, '上市年份3', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1),
	(17, 0, '上市年份4', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1),
	(18, 0, '上市年份5', 1, 1, '2013年,2014年,2015年,2016年,2017年', 0, 0, 0, 0, 0, 1),
	(19, 0, '适用对象', 1, 1, '青年女性,中年女性', 0, 0, 0, 0, 0, 1),
	(20, 0, '适用对象1', 2, 1, '青年女性,中年女性', 0, 0, 0, 0, 0, 1),
	(21, 0, '适用对象3', 2, 1, '青年女性,中年女性', 0, 0, 0, 0, 0, 1),
	(24, 1, '商品编号', 1, 0, '', 0, 0, 0, 0, 0, 1),
	(25, 1, '适用季节', 1, 1, '春季,夏季,秋季,冬季', 0, 0, 0, 0, 0, 1),
	(32, 2, '适用人群', 0, 1, '老年,青年,中年', 0, 0, 0, 0, 0, 1),
	(33, 2, '风格', 0, 1, '嘻哈风格,基础大众,商务正装', 0, 0, 0, 0, 0, 1),
	(35, 2, '颜色', 0, 0, '', 100, 0, 0, 0, 1, 0),
	(37, 1, '适用人群', 1, 1, '儿童,青年,中年,老年', 0, 0, 0, 0, 0, 1),
	(38, 1, '上市时间', 1, 1, '2017年秋,2017年冬,2018年春,2018年夏', 0, 0, 0, 0, 0, 1),
	(39, 1, '袖长', 1, 1, '短袖,长袖,中袖', 0, 0, 0, 0, 0, 1),
	(40, 2, '尺码', 0, 1, '29,30,31,32,33,34', 0, 0, 0, 0, 0, 0),
	(41, 2, '适用场景', 0, 1, '居家,运动,正装', 0, 0, 0, 0, 0, 1),
	(42, 2, '上市时间', 0, 1, '2018年春,2018年夏', 0, 0, 0, 0, 0, 1),
	(43, 3, '颜色', 0, 0, '', 100, 0, 0, 0, 1, 0),
	(44, 3, '容量', 0, 1, '16G,32G,64G,128G', 0, 0, 0, 0, 0, 0),
	(45, 3, '屏幕尺寸', 0, 0, '', 0, 0, 0, 0, 0, 1),
	(46, 3, '网络', 0, 1, '3G,4G', 0, 0, 0, 0, 0, 1),
	(47, 3, '系统', 0, 1, 'Android,IOS', 0, 0, 0, 0, 0, 1),
	(48, 3, '电池容量', 0, 0, '', 0, 0, 0, 0, 0, 1),
	(55, 4, '6666', 0, 0, '', 0, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `pms_product_attribute` ENABLE KEYS */;

-- 导出  表 mymall.pms_product_attribute_category 结构
CREATE TABLE IF NOT EXISTS `pms_product_attribute_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `attribute_count` int(11) DEFAULT '0' COMMENT '属性数量',
  `param_count` int(11) DEFAULT '0' COMMENT '参数数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='产品属性分类表';

-- 正在导出表  mymall.pms_product_attribute_category 的数据：~9 rows (大约)
/*!40000 ALTER TABLE `pms_product_attribute_category` DISABLE KEYS */;
INSERT INTO `pms_product_attribute_category` (`id`, `name`, `attribute_count`, `param_count`) VALUES
	(1, '服装-T恤', 1, 5),
	(2, '服装-裤装', 2, 4),
	(3, '手机数码-手机通讯', 2, 4),
	(4, '配件', 1, 0),
	(5, '居家', 0, 0),
	(6, '洗护', 0, 0),
	(10, '测试分类', 0, 0),
	(12, '343434', 0, 0),
	(19, '4444', 0, 0),
	(20, '9999', 0, 0);
/*!40000 ALTER TABLE `pms_product_attribute_category` ENABLE KEYS */;

-- 导出  表 mymall.pms_product_attribute_value 结构
CREATE TABLE IF NOT EXISTS `pms_product_attribute_value` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `product_attribute_id` bigint(20) DEFAULT NULL,
  `value` varchar(64) DEFAULT NULL COMMENT '手动添加规格或参数的值，参数单值，规格有多个时以逗号隔开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8 COMMENT='存储产品参数信息的表';

-- 正在导出表  mymall.pms_product_attribute_value 的数据：~93 rows (大约)
/*!40000 ALTER TABLE `pms_product_attribute_value` DISABLE KEYS */;
INSERT INTO `pms_product_attribute_value` (`id`, `product_id`, `product_attribute_id`, `value`) VALUES
	(1, 9, 1, 'X'),
	(2, 10, 1, 'X'),
	(3, 11, 1, 'X'),
	(4, 12, 1, 'X'),
	(5, 13, 1, 'X'),
	(6, 14, 1, 'X'),
	(7, 18, 1, 'X'),
	(8, 7, 1, 'X'),
	(9, 7, 1, 'XL'),
	(10, 7, 1, 'XXL'),
	(11, 22, 7, 'x,xx'),
	(12, 22, 24, 'no110'),
	(13, 22, 25, '春季'),
	(14, 22, 37, '青年'),
	(15, 22, 38, '2018年春'),
	(16, 22, 39, '长袖'),
	(124, 23, 7, '米白色,浅黄色'),
	(125, 23, 24, 'no1098'),
	(126, 23, 25, '春季'),
	(127, 23, 37, '青年'),
	(128, 23, 38, '2018年春'),
	(129, 23, 39, '长袖'),
	(130, 1, 13, NULL),
	(131, 1, 14, NULL),
	(132, 1, 15, NULL),
	(133, 1, 16, NULL),
	(134, 1, 17, NULL),
	(135, 1, 18, NULL),
	(136, 1, 19, NULL),
	(137, 1, 20, NULL),
	(138, 1, 21, NULL),
	(139, 2, 13, NULL),
	(140, 2, 14, NULL),
	(141, 2, 15, NULL),
	(142, 2, 16, NULL),
	(143, 2, 17, NULL),
	(144, 2, 18, NULL),
	(145, 2, 19, NULL),
	(146, 2, 20, NULL),
	(147, 2, 21, NULL),
	(183, 31, 24, NULL),
	(184, 31, 25, '夏季'),
	(185, 31, 37, '青年'),
	(186, 31, 38, '2018年夏'),
	(187, 31, 39, '短袖'),
	(198, 30, 24, NULL),
	(199, 30, 25, '夏季'),
	(200, 30, 37, '青年'),
	(201, 30, 38, '2018年夏'),
	(202, 30, 39, '短袖'),
	(218, 28, 43, '金色,银色'),
	(219, 28, 45, '5.0'),
	(220, 28, 46, '4G'),
	(221, 28, 47, 'Android'),
	(222, 28, 48, '2800ml'),
	(223, 29, 43, '金色,银色'),
	(224, 29, 45, '4.7'),
	(225, 29, 46, '4G'),
	(226, 29, 47, 'IOS'),
	(227, 29, 48, '1960ml'),
	(228, 37, 32, '老年'),
	(229, 37, 33, '嘻哈风格'),
	(230, 37, 41, '运动'),
	(231, 37, 42, '2018年夏'),
	(232, 38, 32, NULL),
	(233, 38, 33, NULL),
	(234, 38, 41, NULL),
	(235, 38, 42, NULL),
	(247, 59, 35, '12321'),
	(248, 59, 32, NULL),
	(249, 59, 33, NULL),
	(250, 59, 41, NULL),
	(251, 59, 42, NULL),
	(258, 46, 7, '33'),
	(259, 46, 24, NULL),
	(260, 46, 25, NULL),
	(261, 46, 37, NULL),
	(262, 46, 38, NULL),
	(263, 46, 39, NULL),
	(289, 26, 43, '金色,银色'),
	(290, 26, 45, '5.0'),
	(291, 26, 46, '4G'),
	(292, 26, 47, 'Android'),
	(293, 26, 48, '3000'),
	(294, 27, 43, '黑色,蓝色'),
	(295, 27, 45, '5.8'),
	(296, 27, 46, '4G'),
	(297, 27, 47, 'Android'),
	(298, 27, 48, '3000ml'),
	(307, 63, 32, '青年'),
	(308, 63, 33, NULL),
	(309, 63, 41, NULL),
	(310, 63, 42, NULL);
/*!40000 ALTER TABLE `pms_product_attribute_value` ENABLE KEYS */;

-- 导出  表 mymall.pms_product_category 结构
CREATE TABLE IF NOT EXISTS `pms_product_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上机分类的编号：0表示一级分类',
  `name` varchar(64) DEFAULT NULL,
  `level` int(1) DEFAULT NULL COMMENT '分类级别：0->1级；1->2级',
  `product_count` int(11) DEFAULT NULL,
  `product_unit` varchar(64) DEFAULT NULL,
  `nav_status` int(1) DEFAULT NULL COMMENT '是否显示在导航栏：0->不显示；1->显示',
  `show_status` int(1) DEFAULT NULL COMMENT '显示状态：0->不显示；1->显示',
  `sort` int(11) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `keywords` varchar(255) DEFAULT NULL,
  `description` text COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='产品分类';

-- 正在导出表  mymall.pms_product_category 的数据：~38 rows (大约)
/*!40000 ALTER TABLE `pms_product_category` DISABLE KEYS */;
INSERT INTO `pms_product_category` (`id`, `parent_id`, `name`, `level`, `product_count`, `product_unit`, `nav_status`, `show_status`, `sort`, `icon`, `keywords`, `description`) VALUES
	(1, 0, '服装3', 0, 100, '件', 0, 0, 1, '9.jpg', '服装1', '服装分类'),
	(2, 0, '手机数码', 0, 100, '件', 0, 1, 1, NULL, '手机数码', '手机数码'),
	(3, 0, '家用电器', 0, 100, '件', 1, 1, 1, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/subject_cate_jiadian.png', '家用电器', '家用电器'),
	(4, 0, '家具家装', 0, 100, '件', 1, 1, 1, NULL, '家具家装', '家具家装'),
	(5, 0, '汽车用品', 0, 100, '件', 1, 1, 1, NULL, '汽车用品', '汽车用品'),
	(7, 1, '外套', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_waitao.png', '外套', '外套'),
	(8, 1, 'T恤', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_tshirt.png', 'T恤', 'T恤'),
	(9, 1, '休闲裤', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_xiuxianku.png', '休闲裤', '休闲裤'),
	(10, 1, '牛仔裤', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_niuzaiku.png', '牛仔裤', '牛仔裤'),
	(11, 1, '衬衫', 1, 100, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_chenshan.png', '衬衫', '衬衫分类'),
	(13, 12, '家电子分类1', 1, 1, 'string', 0, 1, 0, 'string', 'string', 'string'),
	(14, 12, '家电子分类2', 1, 1, 'string', 0, 1, 0, 'string', 'string', 'string'),
	(19, 2, '手机通讯', 1, 0, '件', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_shouji.png', '手机通讯', '手机通讯'),
	(29, 1, '男鞋', 1, 0, '', 0, 0, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_xie.png', '', ''),
	(30, 2, '手机配件', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_peijian.png', '手机配件', '手机配件'),
	(31, 2, '摄影摄像', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_sheying.png', '', ''),
	(32, 2, '影音娱乐', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_yule.png', '', ''),
	(33, 2, '数码配件', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_yule.png', '', ''),
	(34, 2, '智能设备', 1, 0, '', 1, 1, 0, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/product_cate_zhineng.png', '', ''),
	(35, 3, '电视', 1, 0, '', 1, 1, 0, '', '', ''),
	(36, 3, '空调', 1, 0, '', 1, 1, 0, '', '', ''),
	(37, 3, '洗衣机', 1, 0, '', 1, 1, 0, '', '', ''),
	(38, 3, '冰箱', 1, 0, '', 1, 1, 0, '', '', ''),
	(39, 3, '厨卫大电', 1, 0, '', 1, 1, 0, '', '', ''),
	(40, 3, '厨房小电', 1, 0, '', 0, 0, 0, '', '', ''),
	(41, 3, '生活电器', 1, 0, '', 0, 0, 0, '', '', ''),
	(42, 3, '个护健康', 1, 0, '', 0, 0, 0, '', '', ''),
	(43, 4, '厨房卫浴', 1, 0, '', 1, 1, 0, '', '', ''),
	(44, 4, '灯饰照明', 1, 0, '', 1, 1, 0, '', '', ''),
	(45, 4, '五金工具', 1, 0, '', 1, 1, 0, '', '', ''),
	(46, 4, '卧室家具', 1, 0, '', 1, 1, 0, '', '', ''),
	(47, 4, '客厅家具', 1, 0, '', 1, 1, 0, '', '', ''),
	(48, 5, '全新整车', 1, 0, '', 1, 1, 0, '', '', ''),
	(49, 5, '车载电器', 1, 0, '', 1, 1, 0, '', '', ''),
	(50, 5, '维修保养', 1, 0, '', 1, 1, 0, '', '', ''),
	(51, 5, '汽车装饰', 1, 0, '', 1, 1, 0, '', '', ''),
	(75, 1, '454545', 1, 0, '456546456', 0, 0, 0, '4.jpeg', '', ''),
	(76, 2, '9999999', 1, 0, '899', 0, 0, 0, '8.jpg', '', ''),
	(77, 0, '55555', 0, 0, '', 1, 1, 0, '', '', ''),
	(78, 77, '77777', 1, 0, '7667', 1, 1, 0, '', '', '');
/*!40000 ALTER TABLE `pms_product_category` ENABLE KEYS */;

-- 导出  表 mymall.pms_product_category_attribute_relation 结构
CREATE TABLE IF NOT EXISTS `pms_product_category_attribute_relation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_category_id` bigint(20) DEFAULT NULL,
  `product_attribute_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='产品的分类和属性的关系表，用于设置分类筛选条件（只支持一级分类）';

-- 正在导出表  mymall.pms_product_category_attribute_relation 的数据：~16 rows (大约)
/*!40000 ALTER TABLE `pms_product_category_attribute_relation` DISABLE KEYS */;
INSERT INTO `pms_product_category_attribute_relation` (`id`, `product_category_id`, `product_attribute_id`) VALUES
	(1, 1, 24),
	(5, 26, 24),
	(7, 28, 24),
	(9, 25, 24),
	(10, 25, 25),
	(17, 63, 7),
	(18, 63, 24),
	(19, 64, 33),
	(20, 65, 1),
	(21, 66, 45),
	(22, 69, 55),
	(25, 71, 33),
	(29, 75, 45),
	(30, 76, 46),
	(31, 78, 55),
	(32, 78, 43);
/*!40000 ALTER TABLE `pms_product_category_attribute_relation` ENABLE KEYS */;

-- 导出  表 mymall.pms_product_full_reduction 结构
CREATE TABLE IF NOT EXISTS `pms_product_full_reduction` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `full_price` decimal(10,2) DEFAULT NULL,
  `reduce_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COMMENT='产品满减表(只针对同商品)';

-- 正在导出表  mymall.pms_product_full_reduction 的数据：~49 rows (大约)
/*!40000 ALTER TABLE `pms_product_full_reduction` DISABLE KEYS */;
INSERT INTO `pms_product_full_reduction` (`id`, `product_id`, `full_price`, `reduce_price`) VALUES
	(1, 7, 100.00, 20.00),
	(2, 8, 100.00, 20.00),
	(3, 9, 100.00, 20.00),
	(4, 10, 100.00, 20.00),
	(5, 11, 100.00, 20.00),
	(6, 12, 100.00, 20.00),
	(7, 13, 100.00, 20.00),
	(8, 14, 100.00, 20.00),
	(9, 18, 100.00, 20.00),
	(10, 7, 200.00, 50.00),
	(11, 7, 300.00, 100.00),
	(14, 22, 0.00, 0.00),
	(16, 24, 0.00, 0.00),
	(34, 23, 0.00, 0.00),
	(44, 31, 0.00, 0.00),
	(46, 32, 0.00, 0.00),
	(48, 33, 0.00, 0.00),
	(54, 35, 0.00, 0.00),
	(55, 34, 0.00, 0.00),
	(56, 30, 0.00, 0.00),
	(60, 28, 500.00, 50.00),
	(61, 28, 1000.00, 120.00),
	(62, 29, 0.00, 0.00),
	(63, 37, 22.00, 23.00),
	(64, 37, 26.00, 27.00),
	(65, 38, 0.00, 0.00),
	(66, 39, 0.00, 0.00),
	(67, 40, 0.00, 0.00),
	(68, 41, 0.00, 0.00),
	(69, 42, 0.00, 0.00),
	(70, 43, 0.00, 0.00),
	(71, 44, 0.00, 0.00),
	(72, 45, 0.00, 0.00),
	(74, 47, 0.00, 0.00),
	(75, 52, 0.00, 0.00),
	(76, 53, 0.00, 0.00),
	(77, 54, 0.00, 0.00),
	(78, 55, 0.00, 0.00),
	(79, 56, 0.00, 0.00),
	(80, 57, 0.00, 0.00),
	(81, 58, 0.00, 0.00),
	(85, 59, 0.00, 0.00),
	(86, 60, 0.00, 0.00),
	(88, 46, 0.00, 0.00),
	(89, 61, 0.00, 0.00),
	(90, 62, 0.00, 0.00),
	(91, 36, 0.00, 0.00),
	(97, 26, 0.00, 0.00),
	(98, 27, 0.00, 0.00),
	(101, 63, 0.00, 0.00);
/*!40000 ALTER TABLE `pms_product_full_reduction` ENABLE KEYS */;

-- 导出  表 mymall.pms_product_ladder 结构
CREATE TABLE IF NOT EXISTS `pms_product_ladder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `count` int(11) DEFAULT NULL COMMENT '满足的商品数量',
  `discount` decimal(10,2) DEFAULT NULL COMMENT '折扣',
  `price` decimal(10,2) DEFAULT NULL COMMENT '折后价格',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COMMENT='产品阶梯价格表(只针对同商品)';

-- 正在导出表  mymall.pms_product_ladder 的数据：~49 rows (大约)
/*!40000 ALTER TABLE `pms_product_ladder` DISABLE KEYS */;
INSERT INTO `pms_product_ladder` (`id`, `product_id`, `count`, `discount`, `price`) VALUES
	(1, 7, 3, 0.70, 0.00),
	(2, 8, 3, 0.70, 0.00),
	(3, 9, 3, 0.70, 0.00),
	(4, 10, 3, 0.70, 0.00),
	(5, 11, 3, 0.70, 0.00),
	(6, 12, 3, 0.70, 0.00),
	(7, 13, 3, 0.70, 0.00),
	(8, 14, 3, 0.70, 0.00),
	(12, 18, 3, 0.70, 0.00),
	(14, 7, 4, 0.60, 0.00),
	(15, 7, 5, 0.50, 0.00),
	(18, 22, 0, 0.00, 0.00),
	(20, 24, 0, 0.00, 0.00),
	(38, 23, 0, 0.00, 0.00),
	(48, 31, 0, 0.00, 0.00),
	(50, 32, 0, 0.00, 0.00),
	(52, 33, 0, 0.00, 0.00),
	(58, 35, 0, 0.00, 0.00),
	(59, 34, 0, 0.00, 0.00),
	(60, 30, 0, 0.00, 0.00),
	(66, 28, 0, 0.00, 0.00),
	(67, 29, 0, 0.00, 0.00),
	(68, 37, 20, 21.00, 0.00),
	(69, 37, 24, 25.00, 0.00),
	(70, 38, 0, 0.00, 0.00),
	(71, 39, 0, 0.00, 0.00),
	(72, 40, 0, 0.00, 0.00),
	(73, 41, 0, 0.00, 0.00),
	(74, 42, 0, 0.00, 0.00),
	(75, 43, 0, 0.00, 0.00),
	(76, 44, 0, 0.00, 0.00),
	(77, 45, 0, 0.00, 0.00),
	(79, 47, 0, 0.00, 0.00),
	(80, 52, 0, 0.00, 0.00),
	(81, 53, 0, 0.00, 0.00),
	(82, 54, 0, 0.00, 0.00),
	(83, 55, 0, 0.00, 0.00),
	(84, 56, 0, 0.00, 0.00),
	(85, 57, 0, 0.00, 0.00),
	(86, 58, 0, 0.00, 0.00),
	(90, 59, 0, 0.00, 0.00),
	(91, 60, 0, 0.00, 0.00),
	(93, 46, 0, 0.00, 0.00),
	(94, 61, 0, 0.00, 0.00),
	(95, 62, 0, 0.00, 0.00),
	(96, 36, 0, 0.00, 0.00),
	(102, 26, 0, 0.00, 0.00),
	(103, 27, 2, 0.80, 0.00),
	(104, 27, 3, 0.75, 0.00),
	(107, 63, 0, 0.00, 0.00);
/*!40000 ALTER TABLE `pms_product_ladder` ENABLE KEYS */;

-- 导出  表 mymall.pms_sku_stock 结构
CREATE TABLE IF NOT EXISTS `pms_sku_stock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL,
  `sku_code` varchar(64) NOT NULL COMMENT 'sku编码',
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT '0' COMMENT '库存',
  `low_stock` int(11) DEFAULT NULL COMMENT '预警库存',
  `sp1` varchar(64) DEFAULT NULL COMMENT '销售属性1',
  `sp2` varchar(64) DEFAULT NULL,
  `sp3` varchar(64) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL COMMENT '展示图片',
  `sale` int(11) DEFAULT NULL COMMENT '销量',
  `promotion_price` decimal(10,2) DEFAULT NULL COMMENT '单品促销价格',
  `lock_stock` int(11) DEFAULT '0' COMMENT '锁定库存',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COMMENT='sku的库存';

-- 正在导出表  mymall.pms_sku_stock 的数据：~33 rows (大约)
/*!40000 ALTER TABLE `pms_sku_stock` DISABLE KEYS */;
INSERT INTO `pms_sku_stock` (`id`, `product_id`, `sku_code`, `price`, `stock`, `low_stock`, `sp1`, `sp2`, `sp3`, `pic`, `sale`, `promotion_price`, `lock_stock`) VALUES
	(1, 7, 'string', 100.00, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, 0),
	(2, 8, 'string', 100.00, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, 0),
	(3, 9, 'string', 100.00, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, 0),
	(4, 10, 'string', 100.00, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, 0),
	(5, 11, 'string', 100.00, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, 0),
	(6, 12, 'string', 100.00, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, 1),
	(7, 13, 'string', 100.00, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, 1),
	(8, 14, 'string', 100.00, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, 1),
	(9, 18, 'string', 100.00, 0, 5, 'string', 'string', 'string', 'string', 0, NULL, 0),
	(10, 7, 'string', 0.00, 0, 0, 'string', 'string', 'sp3', 'string', 0, NULL, 0),
	(11, 7, 'string', 0.00, 0, 0, 'string', 'string', 'sp33', 'string', 0, NULL, 0),
	(12, 22, '111', 99.00, 0, NULL, 'x', 'M', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', NULL, NULL, 0),
	(13, 22, '112', 99.00, 0, NULL, 'xx', 'M', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/2018032614134591_20180326141345650 (4).png', NULL, NULL, 0),
	(78, 23, '201806070023001', 99.00, 0, NULL, '米白色', 'M', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', NULL, NULL, 0),
	(79, 23, '201806070023002', 99.00, 0, NULL, '米白色', 'X', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/1522738681.jpg', NULL, NULL, 0),
	(80, 23, '201806070023003', 99.00, 0, NULL, '浅黄色', 'M', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/2017091716493787_20170917164937650 (1).png', NULL, NULL, 0),
	(81, 23, '201806070023004', 99.00, 0, NULL, '浅黄色', 'X', NULL, 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180604/2017091716493787_20170917164937650 (1).png', NULL, NULL, 0),
	(102, 28, '201808270028001', 649.00, 999, NULL, '金色', '16G', NULL, NULL, NULL, NULL, 0),
	(103, 28, '201808270028002', 699.00, 99, NULL, '金色', '32G', NULL, NULL, NULL, NULL, 0),
	(104, 28, '201808270028003', 649.00, 100, NULL, '银色', '16G', NULL, NULL, NULL, NULL, 0),
	(105, 28, '201808270028004', 699.00, 100, NULL, '银色', '32G', NULL, NULL, NULL, NULL, 0),
	(106, 29, '201808270029001', 5499.00, 99, NULL, '金色', '32G', NULL, NULL, NULL, NULL, 0),
	(107, 29, '201808270029002', 6299.00, 100, NULL, '金色', '64G', NULL, NULL, NULL, NULL, 0),
	(108, 29, '201808270029003', 5499.00, 100, NULL, '银色', '32G', NULL, NULL, NULL, NULL, 0),
	(109, 29, '201808270029004', 6299.00, 100, NULL, '银色', '64G', NULL, NULL, NULL, NULL, 0),
	(130, 26, '201806070026001', 3788.00, 999, 78, '金色', '16G', NULL, NULL, NULL, NULL, 0),
	(131, 26, '201806070026002', 3999.00, 500, NULL, '金色', '32G', NULL, NULL, NULL, NULL, 0),
	(132, 26, '201806070026003', 3788.00, 500, NULL, '银色', '16G', NULL, NULL, NULL, NULL, 0),
	(133, 26, '201806070026004', 3999.00, 500, NULL, '银色', '32G', NULL, NULL, NULL, NULL, 0),
	(134, 27, '201808270027001', 2699.00, 90, NULL, '黑色', '32G', NULL, NULL, NULL, NULL, 0),
	(135, 27, '201808270027002', 2999.00, 100, NULL, '黑色', '64G', NULL, NULL, NULL, NULL, 0),
	(136, 27, '201808270027003', 2699.00, 100, NULL, '蓝色', '32G', NULL, NULL, NULL, NULL, 0),
	(137, 27, '201808270027004', 2999.00, 100, NULL, '蓝色', '64G', NULL, NULL, NULL, NULL, 0);
/*!40000 ALTER TABLE `pms_sku_stock` ENABLE KEYS */;

-- 导出  表 mymall.ums_admin 结构
CREATE TABLE IF NOT EXISTS `ums_admin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `icon` varchar(500) DEFAULT NULL COMMENT '头像',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `nick_name` varchar(200) DEFAULT NULL COMMENT '昵称',
  `note` varchar(500) DEFAULT NULL COMMENT '备注信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `status` int(1) DEFAULT '1' COMMENT '帐号启用状态：0->禁用；1->启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='后台用户表';

-- 正在导出表  mymall.ums_admin 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `ums_admin` DISABLE KEYS */;
INSERT INTO `ums_admin` (`id`, `username`, `password`, `icon`, `email`, `nick_name`, `note`, `create_time`, `login_time`, `status`) VALUES
	(1, 'test', '119', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20180607/timg.jpg', NULL, '测试账号', NULL, '2018-09-29 13:55:30', '2018-09-29 13:55:39', 1),
	(3, 'admin', '119', 'http://macro-oss.oss-cn-shenzhen.aliyuncs.com/mall/images/20190129/170157_yIl3_1767531.jpg', 'admin@163.com', '系统管理员', '系统管理员', '2018-10-08 13:32:47', '2019-03-20 15:38:50', 1);
/*!40000 ALTER TABLE `ums_admin` ENABLE KEYS */;

-- 导出  表 mymall.ums_log 结构
CREATE TABLE IF NOT EXISTS `ums_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` varchar(50) DEFAULT NULL,
  `update_time` varchar(50) DEFAULT NULL,
  `cost_time` int(11) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `request_param` longtext,
  `request_type` varchar(255) DEFAULT NULL,
  `request_url` varchar(255) DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `log_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20237 DEFAULT CHARSET=utf8 COMMENT='用户操作日志表';

-- 正在导出表  mymall.ums_log 的数据：~31 rows (大约)
/*!40000 ALTER TABLE `ums_log` DISABLE KEYS */;
INSERT INTO `ums_log` (`id`, `create_time`, `update_time`, `cost_time`, `ip`, `name`, `request_param`, `request_type`, `request_url`, `userid`, `log_type`) VALUES
	(20206, '2020-02-09', '2020-02-09', 45, '127.0.0.1', '登出', '{}', 'POST', '/admin/logout', 2, 3),
	(20207, '2020-02-09', '2020-02-09', 18, '127.0.0.1', '获取当前登录用户信息', '{}', 'GET', '/admin/info', 68, 1),
	(20208, '2020-02-09', '2020-02-09', 296, '127.0.0.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'10\']}', 'GET', '/brand/list', 29, 4),
	(20209, '2020-02-09', '2020-02-09', 22, '127.0.0.1', '品牌列表', '{\'pageNum\':[\'2\']&&\'pageSize\':[\'10\']}', 'GET', '/brand/list', 93, 4),
	(20210, '2020-02-09', '2020-02-09', 45, '127.0.0.1', '更新品牌', '{}', 'POST', '/brand/update/60', 36, 5),
	(20211, '2020-02-09', '2020-02-09', 23, '127.0.0.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'10\']}', 'GET', '/brand/list', 56, 4),
	(20212, '2020-02-09', '2020-02-09', 121, '127.0.0.1', '查询订单', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'10\']}', 'GET', '/order/list', 82, 17),
	(20213, '2020-02-09', '2020-02-09', 52, '127.0.0.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'100\']}', 'GET', '/brand/list', 47, 4),
	(20214, '2020-02-09', '2020-02-09', 65, '127.0.0.1', '查询商品', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'5\']}', 'GET', '/product/list', 19, 50),
	(20215, '2020-02-09', '2020-02-09', 29, '127.0.0.1', 'UserView统计数据管理', '{\'sec\':[\'5\']&&\'start\':[\'2020-02-02T07:49:12.424Z\']&&\'end\':[\'2020-02-09T07:49:12.424Z\']&&\'type\':[\'3\']}', 'GET', '/uv/list', 5, 60),
	(20216, '2020-02-09', '2020-02-09', 19, '127.0.0.1', 'UserView统计数据管理', '{\'sec\':[\'5\']&&\'start\':[\'2020-02-02T07:49:12.424Z\']&&\'end\':[\'2020-02-09T07:49:12.424Z\']&&\'type\':[\'3\']}', 'GET', '/uv/list', 92, 60),
	(20217, '2020-02-09', '2020-02-09', 15, '127.0.0.1', 'UserView统计数据管理', '{\'sec\':[\'5\']&&\'start\':[\'2020-02-02T07:49:12.424Z\']&&\'end\':[\'2020-02-09T07:49:12.424Z\']&&\'type\':[\'5\']}', 'GET', '/uv/list', 30, 60),
	(20218, '2020-02-09', '2020-02-09', 23, '127.0.0.1', '获取当前登录用户信息', '{}', 'GET', '/admin/info', 4, 1),
	(20219, '2020-02-09', '2020-02-09', 8, '127.0.0.1', '登出', '{}', 'POST', '/admin/logout', 68, 3),
	(20220, '2020-02-09', '2020-02-09', 12, '127.0.0.1', '获取当前登录用户信息', '{}', 'GET', '/admin/info', 53, 1),
	(20221, '2020-02-09', '2020-02-09', 16, '127.0.0.1', 'UserView统计数据管理', '{\'sec\':[\'2\']&&\'start\':[\'2020-02-02T07:51:08.920Z\']&&\'end\':[\'2020-02-09T07:51:08.920Z\']&&\'type\':[\'3\']}', 'GET', '/uv/list', 88, 60),
	(20222, '2020-02-09', '2020-02-09', 15, '127.0.0.1', 'UserView统计数据管理', '{\'sec\':[\'2\']&&\'start\':[\'2020-02-02T07:51:08.920Z\']&&\'end\':[\'2020-02-09T07:51:08.920Z\']&&\'type\':[\'3\']}', 'GET', '/uv/list', 20, 60),
	(20223, '2020-02-09', '2020-02-09', 91, '127.0.0.1', '查询订单', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'10\']}', 'GET', '/order/list', 2, 17),
	(20224, '2020-02-09', '2020-02-09', 18, '127.0.0.1', '获取订单详情:订单信息、商品信息、操作记录', '{}', 'GET', '/order/12', 53, 11),
	(20225, '2020-02-09', '2020-02-09', 33, '127.0.0.1', '查询订单', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'10\']}', 'GET', '/order/list', 62, 17),
	(20226, '2020-02-09', '2020-02-09', 36, '127.0.0.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'100\']}', 'GET', '/brand/list', 38, 4),
	(20227, '2020-02-09', '2020-02-09', 10, '127.0.0.1', '获取当前登录用户信息', '{}', 'GET', '/admin/info', 69, 1),
	(20228, '2020-02-09', '2020-02-09', 18, '127.0.0.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'100\']}', 'GET', '/brand/list', 65, 4),
	(20229, '2020-02-09', '2020-02-09', 13, '127.0.0.1', '获取当前登录用户信息', '{}', 'GET', '/admin/info', 7, 1),
	(20230, '2020-02-09', '2020-02-09', 14, '127.0.0.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'100\']}', 'GET', '/brand/list', 57, 4),
	(20231, '2020-02-09', '2020-02-09', 13, '127.0.0.1', '获取当前登录用户信息', '{}', 'GET', '/admin/info', 82, 1),
	(20232, '2020-02-09', '2020-02-09', 10, '127.0.0.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'100\']}', 'GET', '/brand/list', 61, 4),
	(20233, '2020-02-09', '2020-02-09', 11, '127.0.0.1', '获取当前登录用户信息', '{}', 'GET', '/admin/info', 55, 1),
	(20234, '2020-02-09', '2020-02-09', 12, '127.0.0.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'100\']}', 'GET', '/brand/list', 46, 4),
	(20235, '2020-02-09', '2020-02-09', 13, '127.0.0.1', '获取当前登录用户信息', '{}', 'GET', '/admin/info', 98, 1),
	(20236, '2020-02-09', '2020-02-09', 18, '127.0.0.1', '品牌列表', '{\'pageNum\':[\'1\']&&\'pageSize\':[\'100\']}', 'GET', '/brand/list', 31, 4);
/*!40000 ALTER TABLE `ums_log` ENABLE KEYS */;

-- 导出  表 mymall.ums_log_type 结构
CREATE TABLE IF NOT EXISTS `ums_log_type` (
  `log_type` bigint(20) NOT NULL,
  `type_desc` varchar(255) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `flag` int(2) DEFAULT NULL COMMENT '是否UV使用',
  PRIMARY KEY (`log_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  mymall.ums_log_type 的数据：~62 rows (大约)
/*!40000 ALTER TABLE `ums_log_type` DISABLE KEYS */;
INSERT INTO `ums_log_type` (`log_type`, `type_desc`, `type_name`, `flag`) VALUES
	(0, '用户删除', 'USER_DELETE', 0),
	(1, '当前登录用户信息', 'USER_INFO', 0),
	(2, '哈哈 补充吧', 'USER_BAK', 1),
	(3, '登出', 'USER_LOGIN_OUT', 1),
	(4, '品牌列表', 'BRAND_LIST', 1),
	(5, '修改品牌', 'BRAND_UPDATE', 1),
	(6, '删除品牌', 'BRAND_DELETE', 1),
	(7, '增加品牌', 'BRAND_ADD', 1),
	(8, '优选专区列表', 'AREA_LIST', 0),
	(9, '获取商品专题', 'SUBJECT_LIST', 0),
	(10, '货物公司地址', 'COMPANY_ADDRESS', 0),
	(11, '订单明细', 'ORDER_DETAIL', 1),
	(12, '修改订单备注', 'ORDER_NOTE_UPDATE', 0),
	(13, '删除订单', 'ORDER_DELETE', 1),
	(14, '修改订单收货人', 'ORDER_RECEIVER_UPDATE', 0),
	(15, '修改订单费用信息', 'ORDER_MONEY_UPDATE', 0),
	(16, '关闭订单', 'ORDER_CLOE_UPDATE', 1),
	(17, '查询订单', 'ORDER_LIST', 1),
	(18, '订单发货', 'ORDER_DELIVERY', 0),
	(19, '取消超时订单', 'ORDER_CANCEL', 1),
	(20, '分页查询退货申请', 'ORDER_RETURN_APPLY', 0),
	(21, '删除退货申请', 'ORDER_DELETE_RETURN', 1),
	(22, '获取退货详情', 'ORDER_RETURN_DETAIL', 0),
	(23, '修改申请状态', 'ORDER_UPDATE_RETURN_STATUS', 1),
	(24, '添加退货原因', 'ORDER_ADD_RETURN_REASON', 1),
	(25, '查询退货原因', 'ORDER_RETURN_REASON_LIST', 0),
	(26, '删除退货原因', 'ORDER_DELETE_RETURN_REASON', 1),
	(27, '修改退货原因', 'ORDER_UPDATE_RETURN_REASON', 1),
	(28, '获取退货原因', 'ORDER_RETURN_REASON', 0),
	(29, '修改退货原因启用状态', 'ORDER_UPDATE_RETURN_REASON_STATUS', 1),
	(30, '获取指定订单设置', 'ORDER_DETAIL_SETTING', 1),
	(31, '修改指定订单设置', 'ORDER_UPDATE_DETAIL_SETTING', 1),
	(32, '获取商品属性', 'PRODUCT_ATTRIBUTE', 0),
	(33, '添加商品属性', 'PRODUCT_ADD_ATTRIBUTE', 1),
	(34, '删除商品属性', 'PRODUCT_DELETE_ATTRIBUTE', 1),
	(35, '修改商品属性', 'PRODUCT_UPDATE_ATTRIBUTE', 1),
	(36, '单个商品属性分类', 'PRODUCT_GET_ATTRIBUTE_CATEGORY', 0),
	(37, '所有商品属性分类及属性', 'PRODUCT_ATTRIBUTE_CATEGORY', 1),
	(38, '分类查询属性列表或参数', 'PRODUCT_ATTRIBUTE_LIST', 0),
	(39, '添加商品属性信息', 'PRODUCT_ATTRIBUTE_ADD', 1),
	(40, '单个属性信息', 'PRODUCT_ATTRIBUTE_DETAILS', 0),
	(41, '根据商品分类获取属性及属性分类', 'PRODUCT_CATEGORY_ID', 1),
	(42, '分页查询商品分类', 'PRODUCT_CATEGORY_LIST', 0),
	(43, '添加产品分类', 'PRODUCT_CATEGORY_ADD', 1),
	(44, '删除产品分类', 'PRODUCT_CATEGORY_DELETE', 1),
	(45, '修改产品分类', 'PRODUCT_CATEGORY_UPDATE', 1),
	(46, '修改导航栏显示状态', 'PRODUCT_NAV_STATUS', 0),
	(47, '修改显示状态', 'PRODUCT_SHOW_STATUS', 0),
	(48, '查询所有一级分类及子分类', 'PRODUCT_WITH_CHILDREN', 0),
	(49, '创建商品', 'PRODUCT_ADD', 1),
	(50, '商品列表', 'PRODUCT_LIST', 1),
	(51, '产品修改删除状态', 'PRODUCT_DELETE_STATUS', 1),
	(52, '产品上下架状态', 'PRODUCT_PUBLISH_STATUS', 0),
	(53, '推荐商品状态', 'PRODUCT_RECOMMEND_STATUS', 0),
	(54, '设为新品状态', 'PRODUCT_NEW_STATUS', 0),
	(55, '获取商品编辑信息', 'PRODUCT_ID', 1),
	(56, '更新商品', 'PRODUCT_UPDATE', 1),
	(57, '模糊搜索sku库存', 'PRODUCT_GET_SKU_STOCK', 1),
	(58, '更新库存信息', 'PRODUCT_UPDATE_SKU_STOCK', 1),
	(59, '查询所有会员等级', 'UMS_MEMBER_LEVEL_LIST', 0),
	(60, 'UserView数据统计管理', 'UMS_USER_VIEW_LIST', 1),
	(61, 'UserView统计类型管理', 'UMS_USER_VIEW_TYPE_LIST', 0),
	(62, '修改品牌制造商状态', 'BRAND_UPDATE_FACTORY_STATUS', 0);
/*!40000 ALTER TABLE `ums_log_type` ENABLE KEYS */;

-- 导出  表 mymall.ums_member_level 结构
CREATE TABLE IF NOT EXISTS `ums_member_level` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `growth_point` int(11) DEFAULT NULL,
  `default_status` int(1) DEFAULT NULL COMMENT '是否为默认等级：0->不是；1->是',
  `free_freight_point` decimal(10,2) DEFAULT NULL COMMENT '免运费标准',
  `comment_growth_point` int(11) DEFAULT NULL COMMENT '每次评价获取的成长值',
  `priviledge_free_freight` int(1) DEFAULT NULL COMMENT '是否有免邮特权',
  `priviledge_sign_in` int(1) DEFAULT NULL COMMENT '是否有签到特权',
  `priviledge_comment` int(1) DEFAULT NULL COMMENT '是否有评论获奖励特权',
  `priviledge_promotion` int(1) DEFAULT NULL COMMENT '是否有专享活动特权',
  `priviledge_member_price` int(1) DEFAULT NULL COMMENT '是否有会员价格特权',
  `priviledge_birthday` int(1) DEFAULT NULL COMMENT '是否有生日特权',
  `note` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='会员等级表';

-- 正在导出表  mymall.ums_member_level 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `ums_member_level` DISABLE KEYS */;
INSERT INTO `ums_member_level` (`id`, `name`, `growth_point`, `default_status`, `free_freight_point`, `comment_growth_point`, `priviledge_free_freight`, `priviledge_sign_in`, `priviledge_comment`, `priviledge_promotion`, `priviledge_member_price`, `priviledge_birthday`, `note`) VALUES
	(1, '黄金会员', 1000, 0, 199.00, 5, 1, 1, 1, 1, 1, 1, NULL),
	(2, '白金会员', 5000, 0, 99.00, 10, 1, 1, 1, 1, 1, 1, NULL),
	(3, '钻石会员', 15000, 0, 69.00, 15, 1, 1, 1, 1, 1, 1, NULL),
	(4, '普通会员', 1, 1, 199.00, 20, 1, 1, 1, 1, 0, 0, NULL);
/*!40000 ALTER TABLE `ums_member_level` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
