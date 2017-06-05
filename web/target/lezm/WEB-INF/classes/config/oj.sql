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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of problem
-- ----------------------------

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
  `user_id` int(10) unsigned NOT NULL auto_increment COMMENT '用户ID(主键)',
  `username` varchar(50) NOT NULL default '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL default '' COMMENT '昵称',
  `email` varchar(50) NOT NULL default '' COMMENT '邮箱',
  `password` varchar(50) NOT NULL default '' COMMENT '密码',
  `picture` varchar(40) NOT NULL default '1.jpg' COMMENT '用户头像',
  `age` int(10) default NULL COMMENT '年龄',
  `sex` int(10) default NULL COMMENT '性别',
  `school` varchar(50)  default '' COMMENT '学校',
  PRIMARY KEY  (`user_id`)
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