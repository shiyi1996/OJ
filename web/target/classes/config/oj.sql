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
  `num` int(10) unsigned NOT NULL default '0' COMMENT '竞赛中的题目编号'
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
  `test_sum` int(11) unsigned NOT NULL default '0' COMMENT '测试数据的个数',
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
  `code` text NOT NULL default '' COMMENT '提交代码',
  `accept_sum` int(10) unsigned NOT NULL default '0' COMMENT '通过用例数',
  PRIMARY KEY  (`submit_id`),
  KEY `idx_uid` (`user_id`),
  KEY `idx_pid` (`problem_id`),
  KEY `idx_res` (`result`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of submit
-- ----------------------------
