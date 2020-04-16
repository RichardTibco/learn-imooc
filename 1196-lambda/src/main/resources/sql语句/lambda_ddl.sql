-- 创建数据库
drop database spring_boot_cache;
create database spring_boot_cache default charset 'utf8';
use spring_boot_cache;

-- 创建表与数据
CREATE TABLE employee(
    empno int auto_increment primary key comment '人物编号',
    empname VARCHAR(10) comment '人物名称',
    nickname varchar(20) comment '昵称',
    job VARCHAR(9) comment '工作岗位',
    mgr int comment '上级编号',
    hirdate DATE comment '入伙时间',
    salary int comment '薪水待遇',
    comm int comment '奖金',
    deptno int comment '所属部门'
);

truncate table employee;
INSERT INTO employee VALUES
(1, '宋江', '天魁星·及时雨', '头领', null,'2015-11-8', 800, 200000, 1),
(2, '卢俊义', '天罡星·玉麒麟','卢俊义', 1,'2018-4-6', 800, 100000, 1),
(3, '吴用', '天机星·智多星', '头领', 1,'2012-8-10', 800, 100000, 1),

(21, '关胜', '天勇星·大刀','五虎上将', 1,'2017-4-6', 20000, 2000, 20),
(22, '林冲', '天雄星 豹子头','五虎上将', 1,'2018-4-6', 21000, 1800, 20),
(23, '秦明', '天猛星 霹雳火','五虎上将', 1,'2018-4-6', 19000, 1900, 20),
(24, '呼延灼', '天威星 双鞭','五虎上将', 1,'2019-4-6', 22000, 1100, 20),
(25, '董平', '天立星·双枪将','五虎上将', 1,'2017-4-6', 18000, 1200, 20),

(2101, '花荣', '天英星 小李广','骑兵头领', 1,'2016-4-6', 16000, 2000, 21),
(2102, '徐宁', '天佑星 金枪手','骑兵都统', 2101,'2015-4-6', 12000, 1200, 21),
(2103, '杨志', '天暗星 青面兽','骑兵都统', 2101,'2016-4-6', 13000, 1200, 21),
(2104, '索超', '天空星 急先锋','骑兵都统', 2101,'2018-4-6', 16000, 1100, 21),
(2105, '张青', '地刑星 菜园子','骑兵都统', 2101,'2016-4-6', 14000, 1000, 21),
(2106, '史进', '天微星 九纹龙','骑兵都统', 2101,'2017-4-6', 15000, 1100, 21),
(2107, '穆虹', '天究星 没遮拦','骑兵都统', 2101,'2015-4-6', 14000, 1000,  21),
(2108, '朱仝', '天满星 美髯公','骑兵都统', 2101,'2016-4-6', 14000, 1000, 21),
(2109, '王英', '地微星 矮脚虎','骑兵都统', 2101,'2017-4-6', 12000, 900, 21),
(2110, '扈三娘', '地慧星 一丈青','骑兵都统', 2101,'2017-4-6', 11000, 800, 21),
(2111, '吕方', '地佐星 小温侯','骑兵都统', 2101,'2016-4-6', 12000, 900, 21),
(2112, '郭盛', '地佑星 赛仁贵','骑兵都统', 2101,'2016-4-6', 12000, 900, 21),

(2201, '鲁智深', '天孤星 花和尚','步军头领', 1,'2015-4-6', 16000, 2000, 22),
(2202, '武松', '天伤星 行者','步军都统', 2201,'2015-4-6', 16000, 1400, 22),
(2203, '刘唐', '天异星 赤髪鬼','步军都统', 2201,'2014-4-6', 13000, 1200, 22),
(2204, '雷横', '天退星 插翅虎','步军都统', 2201,'2016-4-6', 12000, 1200, 22),
(2205, '李逵', '天杀星 黑旋风','步军都统', 2201,'2018-4-6', 11000, 1200, 22),
(2206, '燕青', '天巧星 浪子','步军都统', 2201,'2016-4-6', 13000, 1200, 22),
(2207, '石秀', '天慧星·拚命三郎','步军都统', 2201,'2015-4-6', 12000, 1200, 22),
(2208, '杨雄', '天牢星 病关索','步军都统', 2201,'2014-4-6', 13000, 1200, 22),
(2209, '解珍', '天暴星 两头蛇','步军都统', 2201,'2013-4-6', 12000, 1200, 22),
(2210, '解宝', '天哭星 双尾蝎','步军都统', 2201,'2013-4-6', 12000, 1200, 22),
(2211, '孔明', '地猖星 毛头星','步军偏将', 2201,'2015-4-6', 13000, 1100, 22),
(2212, '孔亮', '地狂星 独火星','步军偏将', 2201,'2016-4-6', 13000, 1000, 22),
(2213, '樊瑞', '地默星 混世魔王','步军偏将', 1201,'2014-4-6', 12000, 1000, 22),
(2214, '鲍旭', '地暴星 丧门神','步军偏将', 1201,'2015-4-6', 12000, 900, 22),
(2215, '项充', '地飞星 八臂哪吒','步军偏将', 2201,'2016-4-6', 11000, 900, 22),
(2216, '李衮', '地走星 飞天大圣','步军偏将', 2201,'2016-4-6', 12000, 1100, 22),
(2217, '薛永', '地幽星 病大虫','步军偏将', 2201,'2014-4-6', 11000, 900, 22),
(2218, '施恩', '地伏星 金眼彪','步军偏将', 2201,'2014-4-6', 12000, 900, 22),
(2219, '穆春', '地镇星 小遮拦','步军偏将', 2201,'2015-4-6', 12800, 900, 22),
(2220, '李忠', '地僻星 打虎将','步军偏将', 2201,'2013-4-6', 11000, 1100, 22),
(2221, '郑天寿', '地异星·白面郎君','步军偏将', 2201,'2016-4-6', 12000, 1100, 22),
(2222, '宋万', '地魔星 云里金刚','步军偏将', 2201,'2016-4-6', 11000, 900, 22),
(2223, '杜迁', '地妖星 摸着天','步军偏将', 2201,'2017-4-6', 10000, 900, 22),
(2224, '邹渊', '地短星 出林龙','步军偏将', 2201,'2017-4-6', 10000, 900, 22),
(2225, '邹润', '地角星 独角龙','步军偏将', 2201,'2018-4-6', 10000, 1100, 22),
(2226, '龚旺', '地捷星 花项虎','步军偏将', 2201,'2018-4-6', 11000, 1000, 22),
(2227, '丁得孙', '地速星 中箭虎','步军偏将', 2201,'2018-4-6', 12000, 900, 22),
(2228, '焦挺', '地恶星 没面目','步军偏将', 2201,'2018-4-6', 11000, 900, 22),
(2229, '石勇', '地丑星 石将军','步军偏将', 2201,'2018-4-6', 13000, 900, 22),

(2301, '李俊', '天寿星 混江龙','水军头领', 1,'2016-4-6', 16000, 2000, 23),
(2302, '张横', '天平星 船火儿','水军都统', 2301,'2017-4-6', 13000, 1000, 23),
(2303, '张顺', '天损星 浪里白条','水军都统', 2301,'2018-4-6', 12000, 1100, 23),
(2304, '阮小二', '天剑星 立地太岁','水军都统', 2301,'2014-4-6', 14000, 1000, 23),
(2305, '阮小五', '天罪星 短命二郎','水军都统', 2301,'2014-4-6', 14000, 1200, 23),
(2306, '阮小七', '天败星 活阎罗','水军都统', 2301,'2014-4-6', 14000, 1000, 23),
(2307, '童威', '地进星 出洞蛟','水军偏将', 2301,'2018-4-6', 13000, 1100, 23),
(2308, '童猛', '地退星 翻江蜃','水军偏将', 2301,'2018-4-6', 12000, 1000, 23),

(3001, '柴进', '天贵星 小旋风','财务部长', 1,'2014-4-6', 15000, 2000, 30),
(3002, '李应', '天富星 扑天雕','财务会计', 3001,'2014-4-6', 13000, 2000, 30),
(3003, '皇甫端', '地兽星 紫髯伯','财务会计', 3001,'2015-4-6', 13000, 2000, 30),

(4001, '公孙胜', '天闲星 入云龙','参谋长', 1,'2015-8-6', 15000, 2000, 40),
(4002, '张清', '天捷星 没羽箭','参谋', 4001,'2016-9-15', 13000, 2000, 40),
(4003, '朱武', '地魁星 神机军师','参谋', 4001,'2017-6-20', 13000, 2000, 40),
(4004, '安道全', '地灵星 神医','参谋', 4001,'2015-10-18', 13000, 2000, 40),
(4005, '宋清', '地俊星 铁扇子','参谋', 4001,'2018-11-16', 13000, 2000, 40),

(5001, '金大坚', '地巧星 玉臂匠','后勤部长', 1,'2015-2-1', 9000, 3000, 50),
(5002, '蒋敬', '地会星 神算子','后勤杂事', 5001,'2015-4-20', 9000, 2000, 50),
(5003, '孟康', '地满星 玉幡竿','后勤杂事', 5001,'2016-5-10', 9000, 2000, 50),
(5004, '侯键', '地遂星 通臂猿','后勤杂事', 5001,'2016-8-16', 9000, 2000, 50),
(5005, '裴宣', '地正星 铁面孔目','后勤杂事', 5001,'2017-12-3', 9000, 2000, 50),
(5006, '汤隆', '地孤星 金钱豹子','后勤杂事', 5001,'2017-1-20', 9000, 2000, 50),
(5007, '凌阵', '地辅星 轰天雷','后勤杂事', 5001,'2018-8-20', 9000, 2000, 50),
(5008, '李云', '地察星 青眼虎','后勤杂事', 5001,'2018-8-21', 9000, 2000, 50),
(5009, '曹正', '地羁星 操刀鬼','后勤杂事', 5001,'2018-9-10', 9000, 2000, 50),
(5010, '朱富', '地藏星 笑面虎','后勤杂事', 5001,'2018-9-15', 9000, 2000, 50),
(5011, '陶宗旺', '地理星 九尾龟','后勤杂事', 5001,'2018-9-22', 9000, 2000, 50),
(5012, '郁保四', '地健星 险道神','后勤杂事', 5001,'2018-10-6', 9000, 2000, 50),

(6001, '戴宗', '天速星 神行太保','军情部长', 1,'2014-2-16', 5000, 10000, 50),
(6002, '乐和', '地乐星 铁叫子','军情都统', 6001,'2015-12-13', 2000, 8000, 50),
(6003, '时迁', '地贼星 鼓上蚤','军情都统', 6001,'2015-10-16', 2000, 8000, 50),
(6004, '段景住', '地狗星 金毛犬','军情都统', 6001,'2016-6-19', 2000, 8000, 50),
(6005, '白胜', '地耗星 白日鼠','军情都统', 6001,'2016-8-20', 2000, 8000, 50),
(6006, '黄信', '地煞星 镇三山','军情远哨', 6001,'2017-4-6', 2000, 8000, 50),
(6007, '孙立', '地勇星 病尉迟','军情远哨', 6001,'2018-12-6', 2000, 8000, 50),
(6008, '宣赞', '地杰星 丑郡马','军情远哨', 6001,'2018-9-30', 2000, 8000, 50),
(6009, '郝思文', '地雄星 井木犴','军情远哨', 6001,'2018-5-21', 2000, 8000, 50),
(6010, '韩滔', '地威星 百胜将','军情远哨', 6001,'2018-5-21', 2000, 8000, 50),
(6011, '彭屺', '地英星 天目将','军情远哨', 6001,'2017-2-16', 2000, 8000, 50),
(6012, '单廷圭', '地奇星 圣水将','军情远哨', 6001,'2016-10-6', 2000, 8000, 50),
(6013, '魏定国', '地猛星 神火将','军情远哨', 6001,'2018-12-3', 2000, 8000, 50),
(6014, '欧鹏', '地辟星 摩云金翅','军情远哨', 6001,'2017-11-4', 2000, 8000, 50),
(6015, '邓飞', '地阖星 火眼狻猊','军情远哨', 6001,'2017-11-5', 2000, 8000, 50),
(6016, '燕顺', '地强星 锦毛虎','军情远哨', 6001,'2018-10-16', 2000, 8000, 50),
(6017, '马麟', '地明星 铁笛仙','军情远哨', 6001,'2018-10-16', 2000, 8000, 50),
(6018, '陈达', '地周星 跳涧虎','军情远哨', 6001,'2018-9-20', 2000, 8000, 50),
(6019, '杨春', '地隐星 白花蛇','军情远哨', 6001,'2018-9-20', 2000, 8000, 50),
(6020, '杨林', '地暗星 锦豹子','军情远哨', 6001,'2018-9-20', 2000, 8000, 50),
(6021, '周通', '地空星 小霸王','军情远哨', 6001,'2018-5-30', 2000, 8000, 50),


(7001, '孙新', '地数星 小尉迟','东山迎宾', 3,'2014-8-6', 8000, 9000, 70),
(7002, '顾大嫂', '地阴星 母大虫','东山迎宾', 3,'2014-8-6', 8000, 9000, 70),
(7003, '张青', '地刑星 菜园子','西山迎宾', 3,'2015-6-12', 8000, 9000, 70),
(7004, '孙儿娘', '地壮星 母夜叉','西山迎宾', 3,'2015-6-12', 8000, 9000, 70),
(7005, '朱贵', '地囚星 旱地忽律','南山迎宾', 3,'2013-5-25', 8000, 9000, 70),
(7006, '杜兴', '地全星 鬼睑儿','南山迎宾', 3,'2013-5-26', 8000, 9000, 70),
(7007, '李立', '地奴星 催命判官','北山迎宾', 3,'2015-4-18', 8000, 9000, 70),
(7008, '王定六', '地劣星 活闪婆','北山迎宾', 3,'2015-4-18', 8000, 9000, 70),

(8001, '蔡福', '地平星 铁臂膊','刑罚堂主', 3,'2013-7-10', 12000, 2000, 80),
(8002, '蔡庆', '地损星 一枝花','刑罚执法', 3,'2013-7-10', 12000, 2000, 80);

select * from employee;

CREATE TABLE `department` (
    `deptno` int auto_increment primary key comment '部门编号',
    `deptname` varchar(50) comment '部门名称',
    `location` varchar(100) comment '部门地点'
);

INSERT INTO department VALUES
(10, '中央', '梁山本部'),
(20, '近卫', '梁山本部'),
(21, '军委1部', '梁山本部'),
(22, '军委2部', '梁山本部'),
(23, '军委3部', '梁山本部'),
(30, '财务部', '梁山本部'),
(40, '参谋部', '梁山本部'),
(50, '后勤部', '梁山本部'),
(60, '军情部', '梁山本部'),
(70, '迎宾部', '梁山本部'),
(80, '刑罚部', '梁山本部');   