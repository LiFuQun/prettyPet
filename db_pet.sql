-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1:3306
-- 生成日期： 2020-07-02 01:24:54
-- 服务器版本： 5.7.26
-- PHP 版本： 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `db_pet`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `admin`
--

INSERT INTO `admin` (`id`, `name`, `pwd`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(2, 'bar', 'foo'),
(3, 'bar', 'foo'),
(4, 'name', 'b068931cc450442b63f5b3d276ea4297');

-- --------------------------------------------------------

--
-- 表的结构 `baike`
--

DROP TABLE IF EXISTS `baike`;
CREATE TABLE IF NOT EXISTS `baike` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL COMMENT '词名',
  `classb` varchar(7) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `des` varchar(100) DEFAULT NULL COMMENT '描述',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `baike`
--

INSERT INTO `baike` (`id`, `name`, `classb`, `img`, `des`, `content`, `create_time`, `update_time`) VALUES
(1, '金鱼', '其他', './static/img/index/baike/3-1.jpg', '金鱼是中国比较具有代表性的观赏鱼品种', '金鱼是中国比较具有代表性的观赏鱼品种，金鱼的品种有很多，颜色有红、橙、紫、蓝、墨、银白、五花等，比较常见的是金黄色。由于金鱼具有一定的观赏价值，而且它们的饲养难度也是不大的，因此深受鱼友的青睐。', '2020-06-26 21:15:10', '2020-06-30 02:15:33'),
(2, '布偶猫', '猫', './static/img/index/baike/1-1.jpg', '布偶猫又称布拉多尔猫，是猫中体型和体重最大的一种猫。', '布偶猫性格温顺和好静，对人非常友善，忍耐性强，常被误认为缺乏疼痛感，布偶猫由于能容忍孩子的抓弄，最适宜有孩子的家庭饲养。它头呈V形，眼大而圆，被毛丰厚，四肢粗大，尾长，身体柔软，多为三色或双色猫。它的原产地是美国，经过贸易传播，全球大部分经济较发达国家都有分布。布偶猫，英文名Ragdoll，俗名别名布娃娃猫。布偶猫的原产地是美国，又称布拉多尔猫,是由加州的妇女安贝可(Ann Baker)培育出来的猫种。', '2020-06-26 21:15:19', '2020-06-30 02:18:23'),
(3, '金毛犬', '狗', './static/img/index/baike/2-1.jpg', '金毛犬别名为金毛寻回猎犬。', '金毛寻回犬起源于十九世纪的英国苏格兰，对金毛寻回犬其记载如血统来源或被协会承认记载资料不一，於杜德利迈哲班克[特威德毛斯]爵士所写有关配种的书详细记载著单猎犬的起源而亦有传说金毛寻回犬来自一个俄罗斯马戏团犬的品种演进而来，但是它还是比较像由黄色的平毛猎犬和特威得西班牙水猎犬与後来引进的爱尔兰蹲猎犬、拉布拉多犬和寻血猎犬交配孕育而成在西元1920年以後以今天大家所熟悉的黄金猎犬作为正式的名字，在此之前是以金色平毛犬的名字而闻名。', '2020-06-26 21:17:24', '2020-06-30 02:19:14'),
(4, '波兰兔', '其他', './static/img/index/baike/3-2.png', '波兰兔是纯种兔中最娇小的。', '<p>波兰兔体形特征：小于1.6kg 是纯种兔中最娇小的，身圆头短，两只耳朵竖起及靠在一起，长度不过7.6cm，毛短及浓密。草食，比如红豆幼叶，大豆幼叶，小草幼叶，等等。兔子可分为三大类：家兔( Rabbits )、野兔( Hares )及鼠兔( Pikas )。兔子在动物分类学上属於哺乳动物中的兔形目( Lagomorpha )。兔形目可分为两科，分别是鼠兔科( 鼠兔 )和兔科( 家兔及野兔 )。兔科由十一属四十五种兔子所组成，十一属中包括有野兔属(Lepus )、穴兔属(Oryctolagus )及棉尾兔属( Sylvilagus )等，一般饲养的兔子便是属於穴兔属。</p>', '2020-06-26 21:36:07', '2020-06-30 02:19:48'),
(5, '折耳猫', '猫', './static/img/index/baike/1-2.png', '折耳猫全称为苏格兰折耳猫。', '折耳猫（Scottish Fold）在纯种猫大家族中属于比较年轻的品种，在繁殖过程中，由于与英国短毛猫和美国短毛猫进行交配，所以继承了以上两种猫身体强壮、活泼可爱、抗病力强的优点，成为一种比较容易饲养的纯种猫。而它活泼、聪明、喜欢与人亲近的性格，几乎使任何一个喜欢猫的人都会爱上它。 折耳猫日常无须过分的照顾，但由于耳朵下垂会影响耳朵内部的空气流通，造成细菌的滋生，容易发生耳部疾病，所以最好经常给它清洁耳朵内部。折耳猫拥有纯色、斑纹、双色、玳瑁等多种毛色，但重点色和香槟色还不被承认。', '2020-06-29 00:00:00', '2020-06-30 02:20:03'),
(6, '暹罗猫', '猫', './static/img/index/baike/1-3.jpg', '暹罗猫又称泰国猫，原产泰国，属短毛型。', '暹罗猫又称泰国猫，原产泰国，属短毛型。最早饲养在泰国皇室和大寺院中，曾一度是外界鲜为人知的宫庭“秘宝”。暹罗猫为流线形修长身材，四肢、躯干、颈部、尾巴均细长而且比例均衡。暹罗猫生性活泼好动，聪明伶俐，动作敏捷，气质高雅，相貌不凡。目前暹罗猫已是最为流行的纯种短毛猫的代表。暹罗猫或许是所有谱系中最有名的种类，19世纪末，豹斑暹罗猫作为外交礼物由泰国皇家国会送给英国和美国。其养育引起公众的兴趣，数量一直在增长。暹罗猫又称西母猫、泰国猫，是世界著名的短毛猫，也是短毛猫的代表品种。', '2020-06-29 00:00:00', '2020-06-30 02:20:26'),
(7, '缅甸猫', '猫', './static/img/index/baike/1-4.jpg', '缅甸猫，别名黑韶猫。', '缅甸猫（Burmese），以圆著称，无论头部正面还是侧面，从头到尾都是圆头圆脑，浑圆丰腴。大部分分布在缅甸仰光。共有10个品种，是上世纪三十年代初期由美国科学家Dr. Joseph Thomson培育而成的。其中以全身呈黑貂棕褐色为最理想，各种缅甸猫的眼睛都是黄色的。缅甸猫的体重显得偏重，通常被形容为“包在丝绸里的砖”。它的被毛很短，如纤维般光滑，不需要每日的梳理。缅甸猫活泼好动，叫声轻柔，谈谐有趣，富于表情，勇敢，聪颖，爱撒娇。缅甸猫寿命较长，一般为16岁~18岁，有的甚至更长。', '2020-06-29 00:00:00', '2020-06-30 02:20:43'),
(8, '波斯猫', '猫', './static/img/index/baike/1-5.jpg', '波斯猫，别名喜马拉雅猫。', '波斯猫（英文名 Persian）， 波斯是古伊朗的国名。波斯猫是最常见、最典型的品种，波斯猫实际上是以阿富汗的土种长毛猫和土耳其或亚美尼亚地区的安哥拉长毛猫为基础，在英国经过100多年的选育繁殖，于1860年诞生的一个品种。波斯猫有一张讨人喜欢的面庞，长而华丽的被毛，优雅的举止，故有“猫中王子”、“王妃”之称，因而身价很高。一只纯种的波斯猫可达上千美元，是世界上爱猫者最喜欢的猫之一。波斯猫猫中贵族，性情温文尔雅，聪明敏捷，善解人意，少动好静，叫声尖细柔美，爱撒娇。', '2020-06-29 00:00:00', '2020-06-30 02:21:17'),
(9, '巴厘猫', '猫', './static/img/index/baike/1-6.jpg', '巴厘猫，别名长毛暹罗猫。', '巴厘猫是哈瓦那猫种群里的长毛型变种，是从在美国出生的暹逻猫幼崽中自然产生的毛发较长的个体演变过来的。巴厘猫被毛光滑漂亮，体态高雅，动物专家正是因为这种猫的优美体形和婀娜多姿的动作，联想起印尼巴厘岛土着舞蹈演员的姿态而给以命名的，实际上和巴厘岛没有地域关系。巴厘猫亦称巴厘岛猫、爪哇猫，是由暹罗猫自然变异或隐没遗传性状产生的，故最初被叫做长毛暹罗猫。巴厘猫原产于美国，它是本世纪初在美国纽约州的贝伦史密斯夫人饲养的逼罗猫后代中发现的长毛突变种，经一系列的选育、纯化、繁育而成。', '2020-06-29 00:00:00', '2020-06-30 02:21:38'),
(10, '埃及猫', '猫', './static/img/index/baike/1-7.jpg', '埃及猫，别名法老王猫。', '埃及猫是一个古老的品种，在古埃及被奉为神猫，性格聪明、对人友善，活泼顽皮，但较为敏感，如不加看管，容易逃脱。埃及猫在几千年前古埃及的墓碑和纸卷上都有其图形和文字记载。埃及猫身上带有斑点，形成固定品种起源于19世纪地中海地区的一位王妃，她非常喜欢一只从开罗引进的猫，将它和一只意大利猫交配产子。后来该猫的后代被带到美国繁衍，并于次年在美国注册和首次参展，受到美国家庭的普遍欢迎。原产埃及，20世纪50年代由埃及传入美国和英国。埃及猫头颅稍呈圆形，脸椭圆。', '2020-06-29 00:00:00', '2020-06-30 02:21:57'),
(11, '缅因猫', '猫', './static/img/index/baike/1-8.jpg', '缅因猫，别名缅因库恩猫。', '缅因猫是北美洲自然产生的最早的长毛猫品种，原产于美国东岸缅因州附近。缅因猫是美国猫种当中“猫口”最多的种群，除了其聪颖与活泼广为人知以外，其独一无二巨大的体型也令人过目难忘。1895年在纽约举行的猫展上，缅因猫成为了美国第一种本土展示猫。缅因库恩猫的捕鼠技巧精湛，亦因此令这种土生于美国缅因州的长毛猫为人所认识。透过特有的繁殖计划，这种猫发展成体魄健壮，尤其适合生活于浓冬及不同的季节。缅因库恩猫的美丽外表常常被人欣赏。纯种缅因猫必须具备的特点是：眼圈、嘴唇和爪垫必须都是黑色。', '2020-06-29 00:00:00', '2020-06-30 02:22:15'),
(12, '英短', '猫', './static/img/index/baike/1-9.png', '全称英国短毛猫。', '英国短毛猫，体形圆胖，四肢粗短发达，被毛短而密，头大脸圆，温柔平静，对人友善，极易饲养。在英国本地很早就获得认可，1901年，还出现其猫种之理想形象。它原是一种体型相当大又结实的蓝猫，过了1970年代，毛色和外型都开始改变。体型越来越小，毛色的种类也变得丰富，所有的改变都朝向优雅的风格。', '2020-06-29 00:00:00', '2020-06-30 02:22:30'),
(13, '贵兵犬', '狗', './static/img/index/baike/2-2.jpg', '贵宾犬也称“贵妇犬”。', '贵宾犬也称“贵妇犬”，属于非常聪明且喜欢狩猎的犬种，据猜测贵妇犬起源于德国，在那儿它以水中捕猎犬而著称。贵宾犬分为标准犬、迷你犬、玩具犬三种。它们之间的区别只是在于体型的大小不同。许多年以来，它一直被认为是法国的国犬。犬种标准及特征贵宾犬的祖先原是生活在水边被用于从水中衔取猎物的猎犬，人们根据需要，经育犬专家数百年的繁殖改良，终于形成了其外形固定、能区别于其他犬只的特征和标准的犬种。这种犬种的特征及标准具有国际性、惟一性及约束力。', '2020-06-29 00:00:00', '2020-06-30 02:22:49'),
(14, '泰迪犬', '狗', './static/img/index/baike/2-3.jpeg', '泰迪犬其实是贵宾犬的一种美容方式。', '贵宾是法国品种，一度被用作猎水鸟，19世纪和20世纪该品种达到其发展的顶峰，用作打猎、表演和陪伴。根据体型大小被分为四类，最受欢迎的是体型较小的品种：迷你贵宾犬和玩具贵宾犬。其中玩具贵宾犬是体型最小的一种。贵宾犬不脱毛，是极好的宠物犬。如果红色玩具贵宾犬不剃胡须和嘴边的毛 可以长成动漫画里面泰迪熊的模样 所以红色玩具贵宾犬又叫“泰迪熊”。泰迪属于贵宾犬的一种美容方式。很多打着泰迪贵宾旗号的贵宾犬，其实为失格的贵宾犬，一般都眼圆，耳位高。', '2020-06-29 00:00:00', '2020-06-30 02:23:05'),
(15, '柯基犬', '狗', './static/img/index/baike/2-4.jpg', '柯基犬即威尔士柯基犬（著名犬种）。', '威尔士柯基犬共分两种：卡迪根威尔士柯基犬和彭布罗克威尔士柯基犬。两者比较，彭布罗克柯基犬的体形较短，腿骨更直、更轻，而威尔士柯基犬背毛的质地更好；但在性情上，彭布罗克柯基犬显得不安分，容易激动，没有卡迪根威尔士柯基犬那么驯服。从12世纪的理查一世到现在的女王伊丽莎白二世，柯基犬一直是英国王室的宠物。', '2020-06-29 00:00:00', '2020-06-30 02:23:24'),
(16, '秋田犬', '狗', './static/img/index/baike/2-5.jpg', '秋田犬（日本语：秋田犬/あきたいぬ/アキタイヌ）是日本国犬，它的祖先，被称呼为山地狩猎犬。', '本来在日本犬里大型犬是不存在的，秋田犬是中型的熊猎犬。除了协助猎熊外，它还被利用来捕鹿和野猪。江户时代，出羽国北部的秋田地方，被佐竹氏平定。佐竹氏是关原之战之后被常陆国转封的旁系诸侯。自庆长年间（1630年左右），为了培养藩士斗志养斗犬，而将猎兽犬与秋田地区的土犬进行交配。这犬种成为秋田犬的原种，不过当时被称为「大馆犬」。2014年2月8日，借助索契冬奥会，安倍实现了第五次与俄罗斯总统普京的会谈。', '2020-06-29 00:00:00', '2020-06-30 02:23:37'),
(17, '蝴蝶犬', '狗', './static/img/index/baike/2-6.jpg', '蝴蝶犬（法语：Papillon，名称起源于法语单词“蝴蝶”）。', '16世纪起源于西班牙，也有人认为起源于法国，是欧洲最古老的品种之一，1935年正式获得纯正血统的认定。该犬种身高28厘米以下，体重3.6～4.5公斤，寿命10-14岁，毛色有黑色和白色、褐色和白色、或白色和黑色带有棕褐色斑块。该犬两耳直立外展，酷似蝴蝶的翅膀而得名。蝴蝶犬是极容易亲近、柔弱、聪颖、活泼好动、胆大灵活的犬种，该犬对主人极具独占心，对第三者会起妒忌之心，对陌生人较冷漠，适合作伴侣犬。', '2020-06-29 00:00:00', '2020-06-30 02:23:58'),
(18, '哈士奇', '狗', './static/img/index/baike/2-7.jpg', '别称“二哈”。', '西伯利亚雪撬犬(俄语：Сибирский хаски，Sibirskiy haski，英语：Siberian husky)犬科，犬属，是一种原产于西伯利亚东部的工作犬，常见别名哈士奇。西伯利亚雪撬犬体重介于25~55磅(16~27kg)之间，身高大约20~23.5英寸(51~60cm)，是一种中型犬。由于有着能在北极严寒环境中繁衍生息的能力，西伯利亚雪撬犬是一种适应力很强的犬种。它们最早是用于狩猎驯鹿，拖曳雪橇或者照顾幼儿使孩子们远离寒冷。哈士奇的肠胃功能比较独特,对蛋白质和脂肪的要求比较高,所以建议饲喂幼犬粮到18个月龄以后才改喂成犬狗粮。', '2020-06-29 00:00:00', '2020-06-30 02:24:11'),
(19, '吉娃娃', '狗', './static/img/index/baike/2-8.jpg', '别称“芝娃娃”。', '吉娃娃（西班牙语：Chihuahueño，英语：Chihuahua），也译作芝娃娃、奇娃娃、齐花花，以墨西哥奇瓦瓦州命名。吉娃娃以匀称的体格和娇小的体型广受人们的喜爱，属小型犬种里最小型，优雅、警惕、动作迅速，是世界上最小的犬种之一。有人认为此犬原产于南美，初期被印加族人视为神圣的犬种，后来传到阿斯提克族。也有人认为此犬是随西班牙的侵略者到达新世界的品种，或者在19世纪初期，从中国传入的。吉娃娃易难产，产前尽量咨询兽医。', '2020-06-29 00:00:00', '2020-06-30 02:24:23'),
(20, '法斗犬', '狗', './static/img/index/baike/2-9.jpg', '全称“法国斗牛犬”。', '法国斗牛犬(FRENCH BULLDOG)是一种活泼、聪明、肌肉发达的狗，骨骼沉重，被毛平滑、结构紧凑，体型中等或较小。表情显得警惕、好奇而感兴趣。除了切除狼爪以外，对他的任何改动都是错误的，属于失格。 法国斗牛犬亲切，敦厚，忠诚，执著，勇敢，具有独特的品位，而且完全表露于表情与动作。对小孩和善，同时也是作风彪悍，能力强，对于新鲜事物有极强的好奇心的优秀玩具犬。', '2020-06-29 00:00:00', '2020-06-30 02:24:36'),
(21, '孔雀鱼', '其他', './static/img/index/baike/3-3.jpg', '外观漂亮优雅。', '孔雀鱼，听孔雀鱼的名字就知道这种鱼是非常漂亮，并且很优雅的。很多人喜欢这种有着迷人外表的鱼，饲养者同样会因为它的漂亮而赏心悦目。性格温和的孔雀鱼，平常也会好动，只是寿命较短。饲养孔雀鱼的水温要与热带鱼的水温相差无几，保持在22-26度之间即可。', '2020-06-29 00:00:00', '2020-06-30 02:25:06'),
(22, '荷兰兔', '其他', './static/img/index/baike/3-4.jpg', '荷兰兔脸部有v字形的白色区块，延伸至下颔部位。', '荷兰兔脸部有v字形的白色区块，延伸至下颔部位。体型小，耳朵也比较短，鼻子四周和脖子到前脚为白色，其他部分为黑色、蓝色、巧克力色、灰色、黄色(ARBA对黄色荷兰兔并不认可)、海龟绿和铜铁色等颜色搭配目前大概配出了十几种色彩。荷兰兔具有高度想象空间的模样，使它成为欧、美、澳洲，非常流行的宠物兔。荷兰兔脸部有V字形的白色区块，延伸至下颔部位。体型小，耳朵也比较 荷兰兔(10张)短，鼻子四周和脖子到前脚为白色，其他部分为黑色、蓝色、巧克力色、灰色、黄色（ARBA对黄色荷兰兔并不认可）、海龟绿和铜铁色等颜色搭配，大概配出了十几种色彩。', '2020-06-29 00:00:00', '2020-06-30 02:25:26'),
(23, '鹦鹉鱼', '其他', './static/img/index/baike/3-5.jpg', '鹦鹉鱼是一种色彩比较鲜艳的热带观赏鱼。', '鹦鹉鱼体形近似球形或卵圆形，嘴型酷似鹦鹉嘴型。鹦鹉鱼的品种比较多，最常见的是体色鲜红的血鹦鹉。鹦鹉鱼对环境的适应能力是比较强的，是易饲养的观赏鱼品种，深受大众的喜爱。', '2020-06-29 00:00:00', '2020-06-30 02:25:40'),
(24, '海棠兔', '其他', './static/img/index/baike/3-6.jpg', '海棠兔俗称荷达特兔 、熊猫兔，原产于法国，几乎是完全的草食动物。', '熊猫兔也叫海棠兔、荷达特兔，熊猫兔的饲养与其它宠物兔的饲养基本一样。食物，兔子几乎是完全的草食动物。非常喜爱吃胡萝卜、土豆、萝卜叶等蔬菜，以及蒲公英、车前草等。日本市场最近推出给兔子食用的颗粒状人工饲料，具有营养均衡、硬度对牙齿有益等优点，未来可以人工饲料为主食，再提供少许的蔬菜或野草即可。至今仍有人相信\"让兔子喝水立刻会死亡\"的迷信，甚至宠物店也会告诉饲主，最好不要喂食饮水。但兔子和其他动物一样，若不不饮水一定会死亡。', '2020-06-29 00:00:00', '2020-06-30 02:25:55'),
(25, '龙鱼', '其他', './static/img/index/baike/3-7.jpg', '龙鱼，又叫做古舌鱼科，这种鱼类在东南亚地区可是非常受欢迎的。', '对于龙鱼，它对水质的要求颇高，最好的温度就是24-29摄氏度，饲养过程中，不要水温有剧烈的差异。龙鱼的种类不同，它的颜色也不一。身体上的鳞片会因为年龄的增长而变得更加亮、厚。', '2020-06-29 00:00:00', '2020-06-30 02:26:10'),
(26, '仓鼠', '其他', './static/img/index/baike/3-8.jpeg', '也叫腮鼠。', '仓鼠体长5-12厘米，除分布在中亚的小仓鼠外，其他种类的仓鼠两颊皆有颊囊，从臼齿侧延伸到肩部，因此得名为仓鼠。这种动物非常迷你和可爱，是一种很强势的独居动物，同时也是一种很受欢迎的宠物', '2020-06-29 00:00:00', '2020-06-30 02:26:31'),
(27, '鹦鹉', '其他', './static/img/index/baike/3-9.jpg', '鹦鹉主要是热带，亚热带森林中羽色鲜艳的食果鸟类。', '鹦鹉种类繁多，形态各异，羽色艳丽。有华贵高雅的紫蓝金刚鹦鹉、全身洁白头戴黄冠的葵花凤头鹦鹉、能言善语的亚马逊鹦鹉、五彩缤纷的彩虹吸蜜鹦鹦鹉、小型葵花似的鸡尾鹦鹉、小巧玲珑的虎皮鹦鹉和牡丹鹦鹉、大红大绿的折衷鹦鹉、形状如鸽的非洲灰鹦鹉。', '2020-06-29 00:00:00', '2020-06-30 02:26:44');

-- --------------------------------------------------------

--
-- 表的结构 `classb`
--

DROP TABLE IF EXISTS `classb`;
CREATE TABLE IF NOT EXISTS `classb` (
  `classb` varchar(7) NOT NULL,
  PRIMARY KEY (`classb`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `classb`
--

INSERT INTO `classb` (`classb`) VALUES
('其他'),
('狗'),
('猫');

-- --------------------------------------------------------

--
-- 表的结构 `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL COMMENT '用户名',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `content` varchar(300) DEFAULT NULL COMMENT '留言内容',
  `pid` int(4) DEFAULT NULL COMMENT '对应博客id',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `comment`
--

INSERT INTO `comment` (`id`, `name`, `email`, `content`, `pid`, `create_time`, `update_time`) VALUES
(6, '李某', '222123@qq.com', '真的很不错', 14, '2020-07-01 13:58:50', '2020-07-01 13:58:50'),
(7, '张某', '1231@qq.com', '就立刻就是打算离开房间数量肯定就是', 13, '2020-07-01 15:51:45', '2020-07-01 15:51:45'),
(8, '建设靠', '1231@qq.com', '就立刻就是打算离开房间数量肯定就是', 13, '2020-07-01 15:51:55', '2020-07-01 15:51:55'),
(9, '建设靠', '1231@qq.com', '就立刻就是打算离开房间数量肯定就是', 13, '2020-07-01 15:51:58', '2020-07-01 15:51:58'),
(10, 'username', 'useremail@qq.com', '士大夫士大夫十分', 12, '2020-07-01 22:30:16', '2020-07-01 22:30:16'),
(11, 'username', 'user@qq.com', 'sjfdksjlfk就喀什酱豆腐上来看萨芬', 14, '2020-07-01 23:08:06', '2020-07-01 23:08:06'),
(12, 'username', 'sjfk@qq.com', '是快递发接受了看到房价', 14, '2020-07-02 00:06:12', '2020-07-02 00:06:12');

-- --------------------------------------------------------

--
-- 表的结构 `msg`
--

DROP TABLE IF EXISTS `msg`;
CREATE TABLE IF NOT EXISTS `msg` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `them` varchar(50) DEFAULT NULL,
  `msg` varchar(500) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `msg`
--

INSERT INTO `msg` (`id`, `name`, `email`, `them`, `msg`, `create_time`) VALUES
(2, 'name', 'email@qq.com', 'them', 'message', '2020-06-26 01:07:34'),
(4, 'name', 'email@qq.com', 'them', 'message', '2020-06-26 01:07:39'),
(5, 'name', 'email@qq.com', 'them', 'message', '2020-06-26 01:07:39'),
(6, 'name', 'email@qq.com', 'them', 'message', '2020-06-26 01:07:39'),
(8, 'usernmae', 'sdfj@qq.com', '就喀什酱豆腐老师', '送到附近上空地方就是两地分居', '2020-07-01 23:09:29');

-- --------------------------------------------------------

--
-- 表的结构 `problem`
--

DROP TABLE IF EXISTS `problem`;
CREATE TABLE IF NOT EXISTS `problem` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `problem` varchar(100) DEFAULT NULL,
  `message` varchar(500) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `problem`
--

INSERT INTO `problem` (`id`, `problem`, `message`, `create_time`, `update_time`) VALUES
(2, '频繁给狗狗洗澡，发现狗狗出现瘙痒等毛病就洗得更勤', '1-2周洗澡一次比较适宜。人的皮肤偏酸性，而狗狗的皮肤偏碱性，与人类皮肤的结构、质地完全不同，比人的皮肤薄得多，频繁洗澡会破坏它的天然保护油脂，造成多种皮肤病。', '2020-06-24 02:12:06', '2020-06-24 02:12:06'),
(4, '人的洗浴用品效果那么好，肯定也适合狗狗', '由于人类和狗狗的皮肤酸碱度的不同，人用的东西会使狗狗的皮肤干燥、老化和脱毛。应用宠物专用香波。如所在地实在买不到，可选用人用中性洗发水，且必须是无香精和无除头皮屑功能的产品，可以选择温和的婴儿浴液。一旦出现瘙痒或红疹，应立即停用', '2020-06-24 02:13:30', '2020-06-24 02:13:30'),
(5, '动物肝脏营养丰富，狗狗也爱吃，索性让它吃个够', '肝含多种营养成分，其独特的腥味为犬猫所喜爱。但长期吃肝会导致肥胖、皮肤瘙痒、维生素A中毒、缺钙、出血、产后抽搐，非常危险。', '2020-06-24 02:13:49', '2020-06-24 02:13:49'),
(6, '我家狗狗最乖，不带它出门，它能长时间憋住大小便', '我家狗狗最乖，不带它出门，它能长时间憋住大小便', '2020-06-24 02:14:01', '2020-06-24 02:14:01'),
(7, '我家狗狗最乖，不带它出门，它能长时间憋住大小便', '狗狗不喜欢在自己的活动范围内排泄，这是它的天性，但并不等于对它的健康有利。应训练它养成在卫生间大小便的习惯，或是给它足够的机会出门排泄，但应注意主动清理排泄物。成年狗狗憋尿时间不应超过10小时，长期憋尿会导致泌尿系统的多种疾病，给狗狗带来莫大的痛苦。', '2020-06-24 02:14:27', '2020-06-24 02:14:27'),
(8, '狗狗不吃狗粮，吃其他的', '很多主人会过度宠爱自己家的狗狗，导致狗狗会挑食，也没有意识到其中的严重性，更加不会去让狗狗纠正挑食的这一习惯。然后想着狗狗不吃狗粮，怕狗狗会饿着，然后就不停给狗狗喂食它喜欢吃的食物，导致狗狗变得越来越挑食，不会好好吃饭了，这一行为也容易导致狗狗营养不均衡。', '2020-06-24 02:15:44', '2020-06-24 02:15:44'),
(9, '狗狗不吃狗粮，吃其他的', '很多主人会过度宠爱自己家的狗狗，导致狗狗会挑食，也没有意识到其中的严重性，更加不会去让狗狗纠正挑食的这一习惯。然后想着狗狗不吃狗粮，怕狗狗会饿着，然后就不停给狗狗喂食它喜欢吃的食物，导致狗狗变得越来越挑食，不会好好吃饭了，这一行为也容易导致狗狗营养不均衡。', '2020-06-24 02:16:43', '2020-06-24 02:16:43'),
(10, '疫苗打不打无所谓', '有些主人认为自己家的狗狗平时不出门，不会感染一些疾病，不打疫苗也无所谓。其实狗狗的传染性疾病不仅会通过狗与狗之间直接传播，各种分泌物和接触过的东西都会传染疾病，呼吸空气，空气尘埃中的病原微生物进入狗狗的呼吸道也会引起呼吸道疾病。为了狗狗的健康，还是给狗狗做好疫苗工作吧。', '2020-06-24 02:18:02', '2020-06-24 02:18:02'),
(11, '易碎的骨头里面是空心，狗狗吃了容易划破食道，甚至戳穿胃部，造成生命危险。可以给些大骨狗狗磨牙，或者买点磨牙的小零食，既健康又安全。', '修改到现在还有多少人认为狗狗吃骨头是理所当然的？但是给狗狗喂骨头还是非常有讲究的。一些鸡骨、鱼骨等还是不要喂食，因为大部分的狗狗吃东西的时候不会充分咀嚼，大多数情况下都是直接吞，', '2020-06-24 02:18:19', '2020-06-26 00:13:58'),
(12, '狗狗皮肤病会传染人类', '狗狗得螨虫性皮肤病都不会传染给人的，但蜱虫是人畜共患的，所以在带狗狗出去玩的时候，注意玩耍的场所，过后记得要定期去清洁驱虫等，平时也要做到定期驱虫哦。', '2020-06-24 02:18:36', '2020-06-24 02:18:36'),
(25, '添加问题', '问题解说', '2020-07-02 00:11:17', '2020-07-02 00:11:17'),
(20, '修改3', '修改3', '2020-06-26 11:40:14', '2020-06-26 11:45:35'),
(21, '修改', '修改', '2020-06-26 11:42:41', '2020-06-26 11:42:41'),
(22, '阿斯蒂芬', '手动阀手动阀手动阀手动阀士大夫十分芬', '2020-06-26 11:45:56', '2020-06-30 06:42:00'),
(23, '士大夫随风倒', '撒旦飞洒地方', '2020-06-30 06:42:13', '2020-06-30 06:42:13'),
(16, '阿斯蒂芬撒', '阿斯顿发射点发顺丰撒旦飞洒地方撒旦飞洒地方', '2020-06-24 11:12:05', '2020-06-24 11:12:05'),
(17, '阿斯顿发顺丰的萨芬', '阿斯顿发顺丰撒旦发顺丰', '2020-06-24 11:12:37', '2020-06-24 11:12:37'),
(18, '啊手动阀手动阀手动阀', '阿斯蒂芬撒地方撒阿三发士大夫撒旦士大夫', '2020-06-24 11:13:08', '2020-06-24 11:13:08');

-- --------------------------------------------------------

--
-- 表的结构 `publish`
--

DROP TABLE IF EXISTS `publish`;
CREATE TABLE IF NOT EXISTS `publish` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `keyword` varchar(50) DEFAULT NULL COMMENT '内容关键字',
  `des` varchar(300) DEFAULT NULL COMMENT '内容描述',
  `text` longtext COMMENT '内容',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `publish`
--

INSERT INTO `publish` (`id`, `title`, `keyword`, `des`, `text`, `create_time`, `update_time`) VALUES
(11, '网友家的小胖橘能吃又能睡，每天都要睡足20个小时！', '小胖橘，睡觉', '网友家的小胖橘能吃又能睡，每天都要睡足20个小时！还记得我们前段时间写过的“福祥”吗？', '<p>这货凭借着自己的小短腿和圆润的身躯，迅速跻身网红行列。</p><p>俗话说的好，“猫红是非多…”</p><p>很快，铲屎官就出面吐槽：其实除了可爱，福祥还有另外一个技能——</p><p>那就是睡觉！</p><p>因为它不但擅长秒睡，还一睡就至少能睡20个小时，怎么叫都叫不醒的那种…</p><p>困了↓</p><p>“不吹电扇，这也能睡？”</p><p></p><p><img src=\"./static/upload/62c0480611eb4694a01f1d803668fb27.jpeg\" style=\"max-width:100%;\"><br></p><p><br></p><p><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/8a/pcmoren_cool2017_org.png\" alt=\"[酷]\" data-w-e=\"1\"><br></p><img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/6a/laugh.gif\" alt=\"[哈哈]\" data-w-e=\"1\">', '2020-07-01 13:47:07', '2020-07-01 13:56:45'),
(12, '囧囧猫：有些猫注定要成为表情包，因为太丑了！', '猫，表情包，丑', '网友家的小胖橘能吃又能睡，每天都要睡足20个小时！还记得我们前段时间写过的“福祥”吗？', '<p>这by 抖音@辛普森—普普森森</p><p>它让我想起了前段时间丑上热搜的另一只猫。</p><p>诺，就是右边这位↓</p><p><strong>▌@去年十二岁了</strong></p><p>哟！这小别致长得挺东西。</p><p><strong>▌@爱学习的小猫鲸：</strong></p><p>千万别被小奶猫小时候的样子骗了，它们一旦长大就...！</p><p><img src=\"./static/upload/7.jpg\" style=\"max-width:100%;\"><br></p>\r\n<img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/6a/laugh.gif\" alt=\"[哈哈]\" data-w-e=\"1\">', '2020-07-01 13:48:49', '2020-07-01 13:56:18'),
(13, '四只流浪狗入职阿里巴巴，网友：这下可不愁狗粮了！', '流浪狗，狗粮', '四只流浪狗入职阿里巴巴，网友：这下可不愁狗粮了！', '<p><img src=\"./static/upload/14.jpg\" style=\"max-width:100%;\"><br></p><p>这by 抖音@辛普森—普普森森</p><p>它让我想起了前段时间丑上热搜的另一只猫。</p><p>诺，就最近，阿里巴巴收编了四位“新员工”！</p><p>乍一听没什么特别的，但是，这四位新员工并不是人，而是四只流浪<a href=\"https://petssky.com/tags/dog/\" title=\"查看与 狗狗 相关的文章\" target=\"_blank\">狗狗</a>！</p><p>喏，就是它们！</p><p>这四只流浪狗狗是如何“逆袭”为阿里新员工的呢……说起来，其中的故事还有些曲折……</p><p>四只小狗崽子是疫情间狗妈妈在阿里园区内生下的，但生下宝宝不久后，狗妈妈就不见了。</p>', '2020-07-01 13:50:10', '2020-07-01 13:50:10'),
(14, '柯基打翻墨水完成了一副“墨彩画”，主人看到后直接哭了', '柯基，打翻', '柯基打翻墨水完成了一副“墨彩画”，主人看到后直接哭了', '<p>近日，北京王女士收到了自家柯基“亲手”准备的一份惊喜</p><p>一打开门，映入眼帘的就是如此壮景，差点没把王女士气得当场晕厥。</p><p>你没看错！</p><p>它这是把一整瓶墨水打碎之后，就开始了满屋子作画。</p><p>晃眼一看，还以为是野兽派画家亨利·马蒂斯转世呢！</p><p><img src=\"./static/upload/wallhaven-47yrzo.jpg\" style=\"max-width:100%;\"><br></p><p><br></p><p>生气归生气，麻麻也来不及顾得上教育毛孩子了，赶紧先拿出拖把，含泪进行大扫除！</p><p>此时此刻，王女士内心是极度崩溃的。</p><p>这小家伙倒是丝毫不慌，还在屋子里悠哉哉地到处跑，一点也没有做错了事的自觉。</p>', '2020-07-01 13:58:11', '2020-07-01 13:58:11');

-- --------------------------------------------------------

--
-- 表的结构 `station`
--

DROP TABLE IF EXISTS `station`;
CREATE TABLE IF NOT EXISTS `station` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `pname` varchar(10) DEFAULT NULL COMMENT '驿站管理者真实姓名',
  `id_number` varchar(20) DEFAULT NULL,
  `sname` varchar(20) DEFAULT NULL COMMENT '驿站名',
  `des` varchar(300) DEFAULT NULL COMMENT '驿站描述',
  `state` int(1) DEFAULT '0' COMMENT '0为驿站申请中，1为驿站申请通过和驿站正常经营，2为驿站经营异常,',
  `sphotos` varchar(150) DEFAULT NULL COMMENT '驿站图片',
  `zheng` varchar(150) DEFAULT NULL COMMENT '身份证证明照片',
  `fan` varchar(150) DEFAULT NULL COMMENT '身份证反面照片',
  `photos` varchar(150) DEFAULT NULL COMMENT '本人手持身份证照片',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `address` varchar(300) DEFAULT NULL COMMENT '驿站地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `station`
--

INSERT INTO `station` (`id`, `pname`, `id_number`, `sname`, `des`, `state`, `sphotos`, `zheng`, `fan`, `photos`, `create_time`, `address`) VALUES
(3, '李盟', '13121323423', '盟站', '本驿站收养流浪宠物，爱宠们可以免费领养宠物，时常会在网站发布驿站活动，欢迎大家参加', 3, '.\\static\\upload\\station\\application\\20200630\\ec94a646bafbe92cb9240a4796e9af04.jpg', '.\\static\\upload\\station\\application\\20200630\\a1b0f727ce22d16c013b09e6fad7c633.jpg', '.\\static\\upload\\station\\application\\20200630\\5c252d2be4dc5be48105e04b4129bc21.jpg', '.\\static\\upload\\station\\application\\20200630\\45460c5b81953d21ed0e60c93c4fb47b.jpg', '2020-06-30 05:17:16', '重庆市高新区大学城'),
(5, 'IPisdf', '2342432', '随风倒随风倒', '士大夫萨芬', 3, '.\\static\\upload\\station\\application\\20200630\\fa16dee3b7fcb124ea011c0bde9267f6.jpg', '.\\static\\upload\\station\\application\\20200630\\778247fd5b577b219ae21592b7dc243d.jpg', '.\\static\\upload\\station\\application\\20200630\\f4bdd65e4ed2a7010b9df88c1407c0a7.jpg', '.\\static\\upload\\station\\application\\20200630\\8031d4aadc274f24410fc14db1316aad.jpg', '2020-06-30 07:54:49', '士大夫萨芬'),
(6, 'IPisdf', '2342432', '随风倒随风倒', '士大夫萨芬', 2, '.\\static\\upload\\station\\application\\20200630\\d549a1d35934d7d28f48c021feaeb38a.jpg', '.\\static\\upload\\station\\application\\20200630\\52ddc6998714cc2c4d7485f645a64620.jpg', '.\\static\\upload\\station\\application\\20200630\\1ab08f7296728c4e18f61958b063188f.jpg', '.\\static\\upload\\station\\application\\20200630\\fb17fb2556b0eda5b4a37bea8f56f604.jpg', '2020-06-30 07:55:05', '士大夫萨芬'),
(11, '真实', '5525123563127', '驿站名', '驿站描述', 1, '.\\static\\upload\\station\\application\\20200701\\6ba1691adfb60ddea433b15745e24dd2.jpg', '.\\static\\upload\\station\\application\\20200701\\74ddf6cc07b37ed70cfd855414d1c04f.jpg', '.\\static\\upload\\station\\application\\20200701\\a89b6533681bee4c1e2bdc8ab915c02f.jpg', '.\\static\\upload\\station\\application\\20200701\\461d38f024bf3781c4247c909c164085.jpg', '2020-07-01 23:55:02', '驿站地址'),
(12, '姓名', '5525123563127', '驿站名', '驿站描述', 1, '.\\static\\upload\\station\\application\\20200702\\1ffc51a528fd4db68a5f1849d33f3a5d.jpg', '.\\static\\upload\\station\\application\\20200702\\d9910a7cfdf92c10a9d4fcec655781d0.jpg', '.\\static\\upload\\station\\application\\20200702\\75e1cae4708ce1a641e9b90b596f8a2d.jpg', '.\\static\\upload\\station\\application\\20200702\\c73701d35012ab03ec3e36f1ea211021.jpg', '2020-07-02 00:01:03', '驿站地址'),
(13, 'sfdf ', 'sdfs1231231231231231', 'sdf', 'sdf', 0, '.\\static\\upload\\station\\application\\20200702\\d4cd347dbc97e90fbba5544ff622c1f5.jpg', '.\\static\\upload\\station\\application\\20200702\\130ac4a00829391be4f964280fe9dbbe.jpg', '.\\static\\upload\\station\\application\\20200702\\503388fe67bd85938d97929ae68bc290.jpg', '.\\static\\upload\\station\\application\\20200702\\fdb73716cdee2fc53de81ec5fced687b.jpg', '2020-07-02 01:25:17', 'sdf'),
(14, 'sd', 'sdfsdsdssfdsfsdfsd', 'sdf', 'sdf', 0, '.\\static\\upload\\station\\application\\20200702\\6122522fe8e54e40de5ca6e741fa86f5.jpg', '.\\static\\upload\\station\\application\\20200702\\ac91b84cd8c87110661357ac78854f66.jpg', '.\\static\\upload\\station\\application\\20200702\\95ac5e13c287cd7b6891f3bb2b6660e0.jpg', '.\\static\\upload\\station\\application\\20200702\\b9aa65134d7e5c8358aef00747e78e5c.jpg', '2020-07-02 01:50:37', 'sdf');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `sid` int(4) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `sid`, `name`, `pwd`, `role`) VALUES
(1, 1, '水水水水水水水水地方', '1213', '驿站'),
(2, 2, '水水水水水水水水地方', '1213', '驿站'),
(3, 3, '李盟', '3423', '驿站'),
(4, 4, 'IPisdf', '2432', '驿站'),
(5, 5, 'IPisdf', '2432', '驿站'),
(6, 6, 'IPisdf', '2432', '驿站'),
(7, 7, '士大夫', '3453', '驿站'),
(8, 10, 'sdfsf', '2332', '志愿者'),
(9, 11, '萨芬', '2342', '志愿者'),
(10, 12, '萨芬', '2342', '志愿者'),
(11, 8, '用户真实姓名', '3127', '驿站'),
(12, 13, '真实姓名', '3133', '志愿者'),
(13, 9, '用户真实姓名', '3127', '驿站'),
(14, 10, '用户真实姓名', '3127', '驿站'),
(15, 11, '真实', '3127', '驿站'),
(16, 12, '姓名', '3127', '驿站'),
(17, 14, '真实姓名', '3133', '志愿者'),
(18, 13, 'sfdf ', '1231', '驿站'),
(19, 15, 'sdf', 'sdf', '志愿者'),
(20, 16, 'sdf', 'sdfs', '志愿者'),
(21, 17, 'sdf', 'sdfs', '志愿者'),
(22, 14, 'sd', 'dfsd', '驿站');

-- --------------------------------------------------------

--
-- 表的结构 `volunteer`
--

DROP TABLE IF EXISTS `volunteer`;
CREATE TABLE IF NOT EXISTS `volunteer` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `tname` varchar(10) DEFAULT NULL COMMENT '真实姓名',
  `number` varchar(20) DEFAULT NULL,
  `zname` varchar(20) DEFAULT NULL COMMENT '志愿者昵称',
  `address` varchar(60) DEFAULT NULL COMMENT '现居住地',
  `degree` varchar(10) DEFAULT NULL COMMENT '学历',
  `position` varchar(10) DEFAULT NULL COMMENT '现任职位',
  `des` varchar(500) DEFAULT NULL COMMENT '自我介绍',
  `exp` varchar(500) DEFAULT NULL COMMENT '志愿者经历',
  `zheng` varchar(200) DEFAULT NULL COMMENT '身份证正面图片路径',
  `fan` varchar(200) DEFAULT NULL COMMENT '身份证反面图片路径',
  `sphotos` varchar(200) DEFAULT NULL COMMENT '手持身份证图片',
  `state` int(2) DEFAULT '0' COMMENT '志愿者状态，0为申请中，1为申请通过,2为申请不通过',
  `rank` int(4) DEFAULT '0' COMMENT '志愿者等级，数值越大等级越高',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `head` varchar(200) DEFAULT NULL COMMENT '志愿者头像路径',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `volunteer`
--

INSERT INTO `volunteer` (`id`, `tname`, `number`, `zname`, `address`, `degree`, `position`, `des`, `exp`, `zheng`, `fan`, `sphotos`, `state`, `rank`, `create_time`, `head`) VALUES
(14, '真实姓名', '3123123133', '妮妮哇', '现居住地址上海', '研究生', '上班族', '自我介绍看世界的方式开绿灯飞机', '志愿者经历尽快收集东方斯卡拉', '.\\static\\upload\\station\\application\\20200702\\c7fafdc2602b6a7e73a56034fd17a7ae.jpg', '.\\static\\upload\\station\\application\\20200702\\f7fd3f3282a23930062abab5ca4fbd31.jpg', '.\\static\\upload\\station\\application\\20200702\\63806346883a08d134b12d46dbaa5904.jpg', 1, 0, '2020-07-02 00:03:23', '.\\static\\upload\\station\\application\\20200702\\ed68f1e80c5ed6c07f2a2ceea70d9fa2.jpg'),
(13, '真实姓名', '3123123133', '妮妮哇', '现居住地址上海', '本科', '上班族', '自我介绍看世界的方式开绿灯飞机', '志愿者经历尽快收集东方斯卡拉', '.\\static\\upload\\station\\application\\20200701\\a7d6d8001c79b8f03038f876d9b71488.jpg', '.\\static\\upload\\station\\application\\20200701\\c281ef6fb9829c0c8a0353cd16f2071e.jpg', '.\\static\\upload\\station\\application\\20200701\\60450f09519596709437cfca182bcb5b.jpg', 0, 0, '2020-07-01 23:01:39', '.\\static\\upload\\station\\application\\20200701\\5c5b0bfc95fd697b251a8f9025a569a4.jpg'),
(12, '萨芬', '234243342342342', '士大夫', '士大夫瑟瑟发抖', '其他', '士大夫', '撒旦发射点发射点是否是', '撒旦发射点发射点发生', '.\\static\\upload\\station\\application\\20200701\\7d14426fa3761238e7f7f36efb9f7c77.jpg', '.\\static\\upload\\station\\application\\20200701\\5658c758210437f5b2c793662b080881.jpg', '.\\static\\upload\\station\\application\\20200701\\f4afcf82468ee31fced3bef62590f166.jpg', 1, 0, '2020-07-01 20:14:16', '.\\static\\upload\\station\\application\\20200701\\b44447ccfa74b326e55a6a60b51ffdef.jpg'),
(11, '萨芬', '234243342342342', '士大夫', '士大夫瑟瑟发抖', '其他', '士大夫', '撒旦发射点发射点是否是', '撒旦发射点发射点发生', '.\\static\\upload\\station\\application\\20200701\\e0e9713e17882ba4571481e3cd3e71c4.jpg', '.\\static\\upload\\station\\application\\20200701\\ddb033f500977feaa301fb3dad6a63a0.jpg', '.\\static\\upload\\station\\application\\20200701\\fe9d5049080f61530036cd931b54d43b.jpg', 2, 0, '2020-07-01 20:13:56', '.\\static\\upload\\station\\application\\20200701\\2189f05cbf6e87d54e372f4e602b94ec.jpg'),
(6, '阿斯蒂芬', '1231231321', '撒旦发胜', '撒旦发胜', '研究生', '士大夫', '士大夫萨芬sdfsdfd士大夫胜多负少的地方士大夫色发射点犯得上发射点发射点发射点发射点', 's\'d\'f\'s\'d\'f\'士大夫士大夫撒旦发生发射点发射点发d', '.\\static\\upload\\station\\application\\20200629\\5dd3a176a8d0480b6b0d863446ed3571.jpg', '.\\static\\upload\\station\\application\\20200629\\1ac0e87077f94db05fd437438834323c.jpg', '.\\static\\upload\\station\\application\\20200629\\f7a2ddb1d3456da65b6e63a34e4fc825.jpg', 1, 0, '2020-06-29 16:34:01', '.\\static\\upload\\station\\application\\20200629\\0f56a6f681b064496af746ee3bf109d7.jpg'),
(7, '阿斯蒂芬', '1231231321', '撒旦发胜', '撒旦发胜', '研究生', '士大夫', '士大夫萨芬sdfsdfd士大夫胜多负少的地方士大夫色发射点犯得上发射点发射点发射点发射点', 's\'d\'f\'s\'d\'f\'士大夫士大夫撒旦发生发射点发射点发d', '.\\static\\upload\\station\\application\\20200629\\5ef2678654b0f8e7450b82aecf24a180.jpg', '.\\static\\upload\\station\\application\\20200629\\95a676522671cfd0c7822a0487f8a316.jpg', '.\\static\\upload\\station\\application\\20200629\\41e3ee8bd660a15c0284333d5b801f4c.jpg', 3, 0, '2020-06-29 16:34:15', '.\\static\\upload\\station\\application\\20200629\\62aadbf588935155a0ae8ba10fb08104.jpg'),
(8, '阿斯顿发生', '1231231321', '撒旦发胜', '撒旦发胜', '研究生', '士大夫', '士大夫萨芬sdfsdfd士大夫胜多负少的地方士大夫色发射点犯得上发射点发射点发射点发射点', 's\'d\'f\'s\'d\'f\'士大夫士大夫撒旦发生发射点发射点发d', '.\\static\\upload\\station\\application\\20200629\\2671f2f28cc599aaf1c66977301db82d.jpg', '.\\static\\upload\\station\\application\\20200629\\c9452ed1ed87c17fd425949678cacecf.jpg', '.\\static\\upload\\station\\application\\20200629\\0e2a8d02c4139117c6c27abcb5b00073.jpg', 2, 0, '2020-06-29 16:34:33', '.\\static\\upload\\station\\application\\20200629\\624604d59896ef6fbbb9aedf6e108a80.jpg'),
(9, '阿斯顿发生', '1231231321', '撒旦发胜', '撒旦发胜', '研究生', '士大夫', '士大夫萨芬sdfsdfd士大夫胜多负少的地方士大夫色发射点犯得上发射点发射点发射点发射点', 's\'d\'f\'s\'d\'f\'士大夫士大夫撒旦发生发射点发射点发d', '.\\static\\upload\\station\\application\\20200629\\3a7ffff5718a2b391a230cbd79826303.jpg', '.\\static\\upload\\station\\application\\20200629\\93a2118b29be249a56d779a8c7ce1d8d.jpg', '.\\static\\upload\\station\\application\\20200629\\d6b4ff129a57603d8c0c99fc0502b65c.jpg', 1, 0, '2020-06-29 16:34:41', '.\\static\\upload\\station\\application\\20200629\\4db85a9a74d8a5e1dde14691dad4646a.jpg'),
(10, 'sdfsf', '23232332', '232342', 'efsdfs十点十分', '研究生', '士大夫', '胜多负少发射点发顺丰', '士大夫士大夫十分', '.\\static\\upload\\station\\application\\20200630\\45e2b4c9ec2803722b244616b9a00b5f.jpg', '.\\static\\upload\\station\\application\\20200630\\c25710734d7906eac83a472cbde8391b.jpg', '.\\static\\upload\\station\\application\\20200630\\e42f79c4b269c9527fa67f3674d872fb.jpg', 1, 0, '2020-06-30 08:01:27', '.\\static\\upload\\station\\application\\20200630\\58bf390937120435d3884eb12a5aa94b.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `website`
--

DROP TABLE IF EXISTS `website`;
CREATE TABLE IF NOT EXISTS `website` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `webname` varchar(10) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `Operating_hours` varchar(30) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `website`
--

INSERT INTO `website` (`id`, `webname`, `phone`, `Operating_hours`, `email`, `address`, `update_time`) VALUES
(1, '萌宠汇', '153xxx2312', '周一到周日 8：00-22：00', '2657450020@qq.com', '重庆市高新区大学城', '2020-07-02 00:11:55');

--
-- 限制导出的表
--

--
-- 限制表 `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `publish` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
