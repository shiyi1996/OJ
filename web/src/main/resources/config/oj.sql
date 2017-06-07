/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 40122
Source Host           : localhost:3306
Source Database       : oj

Target Server Type    : MYSQL
Target Server Version : 40122
File Encoding         : 65001

Date: 2017-05-23 02:01:49
*/

DROP DATABASE IF EXISTS `oj`; 
CREATE DATABASE `oj`;
USE `oj`;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `contest`
-- ----------------------------
DROP TABLE IF EXISTS `contest`;
CREATE TABLE `contest` (
  `contest_id` int(10) unsigned NOT NULL auto_increment COMMENT '比赛ID',
  `contest_name` varchar(100) NOT NULL default '' COMMENT '大赛名称',
  `description` varchar(255) NOT NULL default '' COMMENT '比赛描述',
  `start_time` datetime default NULL COMMENT '开始时间(年月日时分)',
  `end_time` datetime default NULL COMMENT '结束时间',
  `problem_num` int(10) unsigned NOT NULL default '0' COMMENT '试题的总数',
  `is_access` tinyint(1) unsigned NOT NULL default '0' COMMENT '试题是否可访问:(是:1不是:0)',
  `is_open` tinyint(1) unsigned NOT NULL default '0' COMMENT '不公开:0/公开:1',
  `password` varchar(16) NOT NULL default '' COMMENT '密码',
  PRIMARY KEY  (`contest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contest
-- ----------------------------

-- ----------------------------
-- Table structure for `contest_problem`
-- ----------------------------
DROP TABLE IF EXISTS `contest_problem`;
CREATE TABLE `contest_problem` (
  `problem_id` int(10) unsigned NOT NULL default '0' COMMENT '题目ID',
  `contest_id` int(10) unsigned default NULL COMMENT '竞赛ID',
  `num` int(10) unsigned NOT NULL default '0' COMMENT '竞赛中的题目编号',
  PRIMARY KEY (`problem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contest_problem
-- ----------------------------

-- ----------------------------
-- Table structure for `problem`
-- ----------------------------
DROP TABLE IF EXISTS `problem`;
CREATE TABLE `problem` (
  `problem_id` int(10) unsigned NOT NULL auto_increment COMMENT '题目编号(主键)',
  `problem_type` int(10) unsigned NOT NULL default '0' COMMENT '题目类型(默认为0:普通题,否则为contest_id)',
  `algorithm` varchar(60) NOT NULL default '' COMMENT '算法',
  `data_structure` varchar(60) NOT NULL default '' COMMENT '数据结构',
  `difficulty` varchar(40) NOT NULL default '' COMMENT '题目难度()',
  `title` varchar(200) NOT NULL default '' COMMENT '标题',
  `description` text COMMENT '题目描述',
  `input_description` text COMMENT '输入描述',
  `output_description` text COMMENT '输出描述',
  `input_test` text COMMENT '样例输出',
  `output_test` text COMMENT '样例输出',
  `data_area` text COMMENT 'hint',
  `add_time` datetime default NULL COMMENT '添加时间',
  `time_limit` int(10) unsigned NOT NULL default '0' COMMENT '限时(ms)',
  `memory_limit` int(10) unsigned NOT NULL default '0' COMMENT '空间限制',
  PRIMARY KEY  (`problem_id`)
) ENGINE=InnoDB AUTO_INCREMENT = 1001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of problem
-- ----------------------------
INSERT INTO `problem` VALUES (NULL, '0', '基础', '测试', '入门', 'A+B问题', '输入两个整数A和B，输出他们的和。', '输入为一行，包含两个整数A，B。数据保证A与B都在2^31-1的范围内', '输入A与B的和，数据保证A与B的和在2^31-1的范围内', '1 3', '4', '...', '2017-06-03 20:00:00', '1', '2');
INSERT INTO `problem` VALUES (NULL, '0', '贪心', '树结构', '难', '彩色丝带', 'Bat有一个彩色的丝带，它可以表示为一个只包含小写字母字符串，每个字母代表一个颜色。现在他想把丝带分成几部分，保证每个部分没有重复的颜色。请你告诉他划分彩带一共有多少种不同的方式。', '输入一个字符串，表示彩色的丝带。(字符串只包含小写字母，字符串长度<10^5)', '输出一个数字n，表示对答案取模后的数字。', 'abbc', '4', '由于数字会非常大，输出的答案对 1000000007 取余.', '2017-06-03 20:00:00', '1', '2');
INSERT INTO `problem` VALUES (NULL, '0', '贪心', '树结构', '中等', 'Bat数', 'Bat从小喜欢奇特的东西，而且天生对数字特别敏感，一次偶然的机会，他发现了一个有趣的四位数2992，这个数，它的十进制数表示，其各位数字之和为2+9+9+2=22，它的十六进制数BB0，其各位数字之和也为22，同时它的十二进制数表示1894，其各位数字之和也为22，啊哈，真是巧啊。Bat非常喜欢这种四位数，由于他的发现，所以这里我们命名其为Bat数。但是要判断这样的数还是有点麻烦啊，那么现在请你帮忙来判断任何一个十进制的四位数，是不是Bat数吧。', '输入一个四位十进制数 n', '若n为Bat数，输出”YES”,否则输出”NO”', '2992', 'YES', '对于2992 ：   \\n十进制数为：  2992  其各位数字之和为2+9+9+2  =22\\n十六进制数为：BB0   其各位数字之和为B+B+0     =22\\n十二进制数为：1894  其各位数字之和为1+8+9+4 =22', '2017-06-03 20:00:00', '1000', '128000');
INSERT INTO `problem` VALUES (NULL, '0', '贪心', '树结构', '中等', '叔叔的农场', 'Bat的叔叔最近新开了一个农场，准备用来养牛。已知农场第一年有一头母牛，它每年年初生一头小母牛。每头小母牛从第四个年头开始，每年年初也生一头小母牛。请帮Bat计算出第n年的时候，共有多少头母牛？', '输入一个数字n', '输出一个数代表第n年母牛的个数', '5', '6', '(n<=50)\\n前五年母牛个数如下：  \\n第一年母牛的个数：  1\\n第二年母牛的个数：  2\\n第三年母牛的个数：  3  \\n第四年母牛的个数：  4    \\n第五年母牛的个数：  6', '2017-06-03 20:00:00', '1000', '128000');
INSERT INTO `problem` VALUES (NULL, '0', '贪心', '树结构', '简单', '热爱汉字', 'Bat是一个美籍华人，他对汉字特别感兴趣。他从叔叔那里得到了一段字符串，出于对汉字的热爱，他想给每个汉字后面加一个标记。对于输入的字符串，查找其中的汉字，在该汉字后面插入字符串“(love)”。', '输入一个字符串，只包含汉字和英文字符', '输出插入“(love)”后的字符串', '阿里bat百度腾讯', '阿(love)里(love)bat百(love)度(love)腾(love)讯(love)', '（不包含空格，字符串的长度<1000）\\n该环境下为utf-8编码，该编码下 ， 一个汉字=3个字节 ， 且这三个字节ASCLL码值都为负值。如 :\\n\"腾\" 存储在s[0]、s[1]、s[2]三个字节中。\\n满足条件：s[0]<0&&s[1]<0&&s[2]<0', '2017-06-03 20:00:00', '1000', '128000');
INSERT INTO `problem` VALUES (NULL, '0', '贪心', '树结构', '简单', '最大素数因子', '今天Bat突发奇想，要找出整数N的最大素数因子 ，但他不知道该怎么做，于是向你求助。', '输入一个数字N', '输出N的最大素数因子', '10', '5', '(2<=N<=10^3)\\n10的因子有1、2、5、10，其最大的素数因子为5', '2017-06-03 20:00:00', '1000', '128000');
INSERT INTO `problem` VALUES (NULL, '0', '贪心', '树结构', '简单', '字符串统计', 'Bat是一个淘气的小朋友，有一天他得到了一个字符串，他想统计一下字符串中的小写字母(‘a’-’z’)的个数，快来帮帮他吧。', '输入一个字符串', '输出一个整数，代表小写字母的个数。', 'AabcBB', '3', '字符串中不包含空格、字符串长度<10000', '2017-06-03 20:00:00', '1000', '128000');

-- ----------------------------
-- Table structure for `submit`
-- ----------------------------
DROP TABLE IF EXISTS `submit`;
CREATE TABLE `submit` (
  `submit_id` int(10) unsigned NOT NULL auto_increment COMMENT '提交记录ID(主键)',
  `problem_id` int(10) unsigned NOT NULL default '0' COMMENT '题目编号',
  `user_id` int(10) unsigned NOT NULL default '0' COMMENT '提交用户ID',
  `submit_time` datetime default NULL COMMENT '提交时间',
  `running_time` int(10) unsigned NOT NULL default '0' COMMENT '耗时(ms)',
  `running_memory` int(10) unsigned NOT NULL default '0' COMMENT '所占空间',
  `result` smallint(5) unsigned NOT NULL default '0' COMMENT '结果(pending,judging,Accept,ComplieError,RuntimeErroe)',
  `result_description` varchar(200) NOT NULL default '' COMMENT '结果描述',
  `language` int(10) unsigned NOT NULL default '0' COMMENT '提交语言',
  `code` text NOT NULL  COMMENT '提交代码',
  `accept_sum` int(10) unsigned NOT NULL default '0' COMMENT '通过用例数',
  PRIMARY KEY  (`submit_id`),
  KEY `idx_uid` (`user_id`),
  KEY `idx_pid` (`problem_id`),
  KEY `idx_res` (`result`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of submit
-- ----------------------------


DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID(主键)',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `password` varchar(50) NOT NULL DEFAULT '' COMMENT '密码',
  `picture` varchar(40) NOT NULL DEFAULT '1.jpg' COMMENT '用户头像',
  `age` int(10) DEFAULT NULL COMMENT '年龄',
  `sex` int(10) DEFAULT NULL COMMENT '性别',
  `school` varchar(50) DEFAULT '' COMMENT '学校',
  `ac_num` int(10) NOT NULL DEFAULT '0' COMMENT '通过题目数目',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `blog_main`;
CREATE TABLE `blog_main` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `user_id` int(11) default NULL COMMENT '用户ID',
  `title` varchar(50) default NULL COMMENT '标题',
  `content` text default NULL COMMENT '内容',
  `createdate` datetime default NULL COMMENT '发布时间',
  `heart_num` int default 0 COMMENT '爱心数量',
  PRIMARY KEY  (`id`),
  KEY `user_id` (`user_id`),
  KEY `title` (`title`),
  KEY `createdate` (`createdate`),
  KEY `heart_num` (`heart_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='动态表';



DROP TABLE IF EXISTS `blog_leave`;
CREATE TABLE `blog_leave` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `floor_id` int(11) default NULL COMMENT '楼号(层数)',
  `leave_id` int(11) default NULL COMMENT '留言用户ID',
  `receive_id` int(11) default NULL COMMENT '被留言用户ID',
  `main_id` int(11) default NULL COMMENT '动态ID',
  `leave_content` text default NULL COMMENT '留言内容',
  `createdate` datetime default NULL COMMENT '发布时间',
  `heart_num` int default 0 COMMENT '爱心数量',
  PRIMARY KEY  (`id`),
  KEY `floor_id` (`floor_id`),
  KEY `leave_id` (`leave_id`),
  KEY `receive_id` (`receive_id`),
  KEY `main_id` (`main_id`),
  KEY `createdate` (`createdate`),
  KEY `heart_num` (`heart_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博客留言表';