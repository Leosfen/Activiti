/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50641
Source Host           : localhost:3306
Source Database       : activiti_test

Target Server Type    : MYSQL
Target Server Version : 50641
File Encoding         : 65001

Date: 2019-07-20 17:48:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `act_de_databasechangelog`
-- ----------------------------
DROP TABLE IF EXISTS `act_de_databasechangelog`;
CREATE TABLE `act_de_databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of act_de_databasechangelog
-- ----------------------------
INSERT INTO `act_de_databasechangelog` VALUES ('1', 'activiti', 'META-INF/liquibase/activiti-app-db-changelog.xml', '2019-07-20 17:14:07', '1', 'EXECUTED', '7:670797aeab8d035a4350ea2c794a7e46', 'createTable (x3), createIndex, createTable, createIndex, createTable, createIndex (x2), createTable, createIndex (x3), createTable, addForeignKeyConstraint (x2)', '', null, '3.1.0');

-- ----------------------------
-- Table structure for `act_de_databasechangeloglock`
-- ----------------------------
DROP TABLE IF EXISTS `act_de_databasechangeloglock`;
CREATE TABLE `act_de_databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of act_de_databasechangeloglock
-- ----------------------------
INSERT INTO `act_de_databasechangeloglock` VALUES ('1', '', null, null);

-- ----------------------------
-- Table structure for `act_de_model`
-- ----------------------------
DROP TABLE IF EXISTS `act_de_model`;
CREATE TABLE `act_de_model` (
  `id` varchar(255) NOT NULL,
  `name` varchar(400) NOT NULL,
  `model_key` varchar(400) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `model_comment` varchar(4000) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `last_updated_by` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `model_editor_json` longtext,
  `thumbnail` longblob,
  `model_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_proc_mod_created` (`created_by`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of act_de_model
-- ----------------------------

-- ----------------------------
-- Table structure for `act_de_model_history`
-- ----------------------------
DROP TABLE IF EXISTS `act_de_model_history`;
CREATE TABLE `act_de_model_history` (
  `id` varchar(255) NOT NULL,
  `name` varchar(400) NOT NULL,
  `model_key` varchar(400) NOT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `model_comment` varchar(4000) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `last_updated` datetime(6) DEFAULT NULL,
  `last_updated_by` varchar(255) DEFAULT NULL,
  `removal_date` datetime(6) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `model_editor_json` longtext,
  `model_id` varchar(255) NOT NULL,
  `model_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_proc_mod_history_proc` (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of act_de_model_history
-- ----------------------------

-- ----------------------------
-- Table structure for `act_de_model_relation`
-- ----------------------------
DROP TABLE IF EXISTS `act_de_model_relation`;
CREATE TABLE `act_de_model_relation` (
  `id` varchar(255) NOT NULL,
  `parent_model_id` varchar(255) DEFAULT NULL,
  `model_id` varchar(255) DEFAULT NULL,
  `relation_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_relation_parent` (`parent_model_id`),
  KEY `fk_relation_child` (`model_id`),
  CONSTRAINT `fk_relation_child` FOREIGN KEY (`model_id`) REFERENCES `act_de_model` (`id`),
  CONSTRAINT `fk_relation_parent` FOREIGN KEY (`parent_model_id`) REFERENCES `act_de_model` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of act_de_model_relation
-- ----------------------------

-- ----------------------------
-- Table structure for `act_dmn_databasechangelog`
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_databasechangelog`;
CREATE TABLE `act_dmn_databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of act_dmn_databasechangelog
-- ----------------------------
INSERT INTO `act_dmn_databasechangelog` VALUES ('1', 'activiti', 'org/activiti/dmn/db/liquibase/activiti-dmn-db-changelog.xml', '2019-07-20 17:13:57', '1', 'EXECUTED', '7:d878c2672ead57b5801578fd39c423af', 'createTable (x3)', '', null, '3.1.0');

-- ----------------------------
-- Table structure for `act_dmn_databasechangeloglock`
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_databasechangeloglock`;
CREATE TABLE `act_dmn_databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of act_dmn_databasechangeloglock
-- ----------------------------
INSERT INTO `act_dmn_databasechangeloglock` VALUES ('1', '', null, null);

-- ----------------------------
-- Table structure for `act_dmn_decision_table`
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_decision_table`;
CREATE TABLE `act_dmn_decision_table` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of act_dmn_decision_table
-- ----------------------------

-- ----------------------------
-- Table structure for `act_dmn_deployment`
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_deployment`;
CREATE TABLE `act_dmn_deployment` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `DEPLOY_TIME_` datetime DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of act_dmn_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for `act_dmn_deployment_resource`
-- ----------------------------
DROP TABLE IF EXISTS `act_dmn_deployment_resource`;
CREATE TABLE `act_dmn_deployment_resource` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of act_dmn_deployment_resource
-- ----------------------------

-- ----------------------------
-- Table structure for `act_evt_log`
-- ----------------------------
DROP TABLE IF EXISTS `act_evt_log`;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_evt_log
-- ----------------------------

-- ----------------------------
-- Table structure for `act_fo_databasechangelog`
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_databasechangelog`;
CREATE TABLE `act_fo_databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of act_fo_databasechangelog
-- ----------------------------
INSERT INTO `act_fo_databasechangelog` VALUES ('1', 'activiti', 'org/activiti/form/db/liquibase/activiti-form-db-changelog.xml', '2019-07-20 17:13:55', '1', 'EXECUTED', '7:913aee6a78e577fe455efed1d40980f1', 'createTable (x4)', '', null, '3.1.0');

-- ----------------------------
-- Table structure for `act_fo_databasechangeloglock`
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_databasechangeloglock`;
CREATE TABLE `act_fo_databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of act_fo_databasechangeloglock
-- ----------------------------
INSERT INTO `act_fo_databasechangeloglock` VALUES ('1', '', null, null);

-- ----------------------------
-- Table structure for `act_fo_form_definition`
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_form_definition`;
CREATE TABLE `act_fo_form_definition` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) DEFAULT NULL,
  `DESCRIPTION_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of act_fo_form_definition
-- ----------------------------

-- ----------------------------
-- Table structure for `act_fo_form_deployment`
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_form_deployment`;
CREATE TABLE `act_fo_form_deployment` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `CATEGORY_` varchar(255) DEFAULT NULL,
  `DEPLOY_TIME_` datetime DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of act_fo_form_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for `act_fo_form_resource`
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_form_resource`;
CREATE TABLE `act_fo_form_resource` (
  `ID_` varchar(255) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of act_fo_form_resource
-- ----------------------------

-- ----------------------------
-- Table structure for `act_fo_submitted_form`
-- ----------------------------
DROP TABLE IF EXISTS `act_fo_submitted_form`;
CREATE TABLE `act_fo_submitted_form` (
  `ID_` varchar(255) NOT NULL,
  `FORM_ID_` varchar(255) NOT NULL,
  `TASK_ID_` varchar(255) DEFAULT NULL,
  `PROC_INST_ID_` varchar(255) DEFAULT NULL,
  `PROC_DEF_ID_` varchar(255) DEFAULT NULL,
  `SUBMITTED_DATE_` datetime DEFAULT NULL,
  `SUBMITTED_BY_` varchar(255) DEFAULT NULL,
  `FORM_VALUES_ID_` varchar(255) DEFAULT NULL,
  `TENANT_ID_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of act_fo_submitted_form
-- ----------------------------

-- ----------------------------
-- Table structure for `act_ge_bytearray`
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_bytearray`;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for `act_ge_property`
-- ----------------------------
DROP TABLE IF EXISTS `act_ge_property`;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ge_property
-- ----------------------------
INSERT INTO `act_ge_property` VALUES ('cfg.execution-related-entities-count', 'false', '1');
INSERT INTO `act_ge_property` VALUES ('next.dbid', '17701', '10');
INSERT INTO `act_ge_property` VALUES ('schema.history', 'create(6.0.0.4)', '1');
INSERT INTO `act_ge_property` VALUES ('schema.version', '6.0.0.4', '1');

-- ----------------------------
-- Table structure for `act_hi_actinst`
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_actinst`;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_actinst
-- ----------------------------
INSERT INTO `act_hi_actinst` VALUES ('102', 'helloworld:1:4', '101', '101', 'startevent1', null, null, 'Start', 'startEvent', null, '2019-07-20 12:12:18.000', '2019-07-20 12:12:18.000', '16', null, '');
INSERT INTO `act_hi_actinst` VALUES ('103', 'helloworld:1:4', '101', '101', 'usertask1', '104', null, '提交申请', 'userTask', '张三', '2019-07-20 12:12:18.000', null, null, null, '');
INSERT INTO `act_hi_actinst` VALUES ('12708', 'vacationProcess:5:12704', '12705', '12707', 'startevent1', null, null, 'Start', 'startEvent', null, '2019-07-20 16:46:28.390', '2019-07-20 16:46:28.394', '4', null, '');
INSERT INTO `act_hi_actinst` VALUES ('12709', 'vacationProcess:5:12704', '12705', '12707', 'usertask1', '12710', null, '????', 'userTask', 'fengyaof', '2019-07-20 16:46:28.402', '2019-07-20 16:46:28.702', '300', null, '');
INSERT INTO `act_hi_actinst` VALUES ('12718', 'vacationProcess:5:12704', '12705', '12707', 'exclusivegateway1', null, null, 'Exclusive Gateway', 'exclusiveGateway', null, '2019-07-20 16:46:28.702', '2019-07-20 16:46:28.735', '33', null, '');
INSERT INTO `act_hi_actinst` VALUES ('12719', 'vacationProcess:5:12704', '12705', '12707', 'usertask3', '12720', null, '????', 'userTask', 'm', '2019-07-20 16:46:28.737', null, null, null, '');
INSERT INTO `act_hi_actinst` VALUES ('15208', 'vacationProcess:6:15204', '15205', '15207', 'startevent1', null, null, 'Start', 'startEvent', null, '2019-07-20 17:38:07.733', '2019-07-20 17:38:07.737', '4', null, '');
INSERT INTO `act_hi_actinst` VALUES ('15209', 'vacationProcess:6:15204', '15205', '15207', 'usertask1', '15210', null, '????', 'userTask', 'fengyaof', '2019-07-20 17:38:07.740', '2019-07-20 17:38:07.929', '189', null, '');
INSERT INTO `act_hi_actinst` VALUES ('15218', 'vacationProcess:6:15204', '15205', '15207', 'exclusivegateway1', null, null, 'Exclusive Gateway', 'exclusiveGateway', null, '2019-07-20 17:38:07.930', '2019-07-20 17:38:07.949', '19', null, '');
INSERT INTO `act_hi_actinst` VALUES ('15219', 'vacationProcess:6:15204', '15205', '15207', 'usertask2', '15220', null, '????', 'userTask', 'm', '2019-07-20 17:38:07.951', '2019-07-20 17:39:07.449', '59498', null, '');
INSERT INTO `act_hi_actinst` VALUES ('15229', 'vacationProcess:6:15204', '15205', '15207', 'endevent1', null, null, 'End', 'endEvent', null, '2019-07-20 17:39:07.449', '2019-07-20 17:39:07.449', '0', null, '');
INSERT INTO `act_hi_actinst` VALUES ('15237', 'vacationProcess:2:5204', '5205', '5207', 'endevent1', null, null, 'End', 'endEvent', null, '2019-07-20 17:39:11.233', '2019-07-20 17:39:11.233', '0', null, '');
INSERT INTO `act_hi_actinst` VALUES ('15245', 'vacationProcess:1:204', '2701', '2703', 'endevent1', null, null, 'End', 'endEvent', null, '2019-07-20 17:39:19.900', '2019-07-20 17:39:19.900', '0', null, '');
INSERT INTO `act_hi_actinst` VALUES ('2704', 'vacationProcess:1:204', '2701', '2703', 'startevent1', null, null, 'Start', 'startEvent', null, '2019-07-20 15:48:06.869', '2019-07-20 15:48:06.874', '5', null, '');
INSERT INTO `act_hi_actinst` VALUES ('2705', 'vacationProcess:1:204', '2701', '2703', 'usertask1', '2706', null, '????', 'userTask', 'fengyaof', '2019-07-20 15:48:06.880', '2019-07-20 15:48:07.133', '253', null, '');
INSERT INTO `act_hi_actinst` VALUES ('2714', 'vacationProcess:1:204', '2701', '2703', 'exclusivegateway1', null, null, 'Exclusive Gateway', 'exclusiveGateway', null, '2019-07-20 15:48:07.133', '2019-07-20 15:48:07.160', '27', null, '');
INSERT INTO `act_hi_actinst` VALUES ('2715', 'vacationProcess:1:204', '2701', '2703', 'usertask2', '2716', null, '????', 'userTask', 'm', '2019-07-20 15:48:07.161', '2019-07-20 17:39:19.900', '6672739', null, '');
INSERT INTO `act_hi_actinst` VALUES ('2721', 'vacationProcess:1:204', '2718', '2720', 'startevent1', null, null, 'Start', 'startEvent', null, '2019-07-20 15:48:54.816', '2019-07-20 15:48:54.817', '1', null, '');
INSERT INTO `act_hi_actinst` VALUES ('2722', 'vacationProcess:1:204', '2718', '2720', 'usertask1', '2723', null, '????', 'userTask', 'aaa', '2019-07-20 15:48:54.817', '2019-07-20 15:48:54.901', '84', null, '');
INSERT INTO `act_hi_actinst` VALUES ('2731', 'vacationProcess:1:204', '2718', '2720', 'exclusivegateway1', null, null, 'Exclusive Gateway', 'exclusiveGateway', null, '2019-07-20 15:48:54.901', '2019-07-20 15:48:54.901', '0', null, '');
INSERT INTO `act_hi_actinst` VALUES ('2732', 'vacationProcess:1:204', '2718', '2720', 'usertask2', '2733', null, '????', 'userTask', null, '2019-07-20 15:48:54.902', null, null, null, '');
INSERT INTO `act_hi_actinst` VALUES ('5208', 'vacationProcess:2:5204', '5205', '5207', 'startevent1', null, null, 'Start', 'startEvent', null, '2019-07-20 16:25:22.231', '2019-07-20 16:25:22.235', '4', null, '');
INSERT INTO `act_hi_actinst` VALUES ('5209', 'vacationProcess:2:5204', '5205', '5207', 'usertask1', '5210', null, '????', 'userTask', 'sss', '2019-07-20 16:25:22.244', '2019-07-20 16:25:23.246', '1002', null, '');
INSERT INTO `act_hi_actinst` VALUES ('5218', 'vacationProcess:2:5204', '5205', '5207', 'exclusivegateway1', null, null, 'Exclusive Gateway', 'exclusiveGateway', null, '2019-07-20 16:25:23.246', '2019-07-20 16:25:23.272', '26', null, '');
INSERT INTO `act_hi_actinst` VALUES ('5219', 'vacationProcess:2:5204', '5205', '5207', 'usertask2', '5220', null, '????', 'userTask', 'm', '2019-07-20 16:25:23.299', '2019-07-20 17:39:11.233', '4427934', null, '');

-- ----------------------------
-- Table structure for `act_hi_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_attachment`;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for `act_hi_comment`
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_comment`;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `act_hi_detail`
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_detail`;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_detail
-- ----------------------------
INSERT INTO `act_hi_detail` VALUES ('12713', 'VariableUpdate', '12705', '12705', null, '12709', 'applyUser', 'string', '0', '2019-07-20 16:46:28.685', null, null, null, 'fengyaof', null);
INSERT INTO `act_hi_detail` VALUES ('12715', 'VariableUpdate', '12705', '12705', null, '12709', 'days', 'integer', '0', '2019-07-20 16:46:28.690', null, null, '8', '8', null);
INSERT INTO `act_hi_detail` VALUES ('12717', 'VariableUpdate', '12705', '12705', null, '12709', 'reason', 'string', '0', '2019-07-20 16:46:28.690', null, null, null, '?????2222222222222222', null);
INSERT INTO `act_hi_detail` VALUES ('15213', 'VariableUpdate', '15205', '15205', null, '15209', 'applyUser', 'string', '0', '2019-07-20 17:38:07.916', null, null, null, 'fengyaof', null);
INSERT INTO `act_hi_detail` VALUES ('15215', 'VariableUpdate', '15205', '15205', null, '15209', 'days', 'integer', '0', '2019-07-20 17:38:07.920', null, null, '3', '3', null);
INSERT INTO `act_hi_detail` VALUES ('15217', 'VariableUpdate', '15205', '15205', null, '15209', 'reason', 'string', '0', '2019-07-20 17:38:07.920', null, null, null, '?????', null);
INSERT INTO `act_hi_detail` VALUES ('15224', 'VariableUpdate', '15205', '15205', null, '15219', 'result', 'string', '0', '2019-07-20 17:39:07.439', null, null, null, '????', null);
INSERT INTO `act_hi_detail` VALUES ('15226', 'VariableUpdate', '15205', '15205', null, '15219', 'auditTime', 'date', '0', '2019-07-20 17:39:07.441', null, null, '1563615547398', null, null);
INSERT INTO `act_hi_detail` VALUES ('15228', 'VariableUpdate', '15205', '15205', null, '15219', 'auditor', 'string', '0', '2019-07-20 17:39:07.441', null, null, null, 'm', null);
INSERT INTO `act_hi_detail` VALUES ('15232', 'VariableUpdate', '5205', '5205', null, '5219', 'result', 'string', '0', '2019-07-20 17:39:11.223', null, null, null, '????', null);
INSERT INTO `act_hi_detail` VALUES ('15234', 'VariableUpdate', '5205', '5205', null, '5219', 'auditTime', 'date', '0', '2019-07-20 17:39:11.225', null, null, '1563615551176', null, null);
INSERT INTO `act_hi_detail` VALUES ('15236', 'VariableUpdate', '5205', '5205', null, '5219', 'auditor', 'string', '0', '2019-07-20 17:39:11.225', null, null, null, 'm', null);
INSERT INTO `act_hi_detail` VALUES ('15240', 'VariableUpdate', '2701', '2701', null, '2715', 'result', 'string', '0', '2019-07-20 17:39:19.893', null, null, null, '????', null);
INSERT INTO `act_hi_detail` VALUES ('15242', 'VariableUpdate', '2701', '2701', null, '2715', 'auditTime', 'date', '0', '2019-07-20 17:39:19.895', null, null, '1563615559854', null, null);
INSERT INTO `act_hi_detail` VALUES ('15244', 'VariableUpdate', '2701', '2701', null, '2715', 'auditor', 'string', '0', '2019-07-20 17:39:19.895', null, null, null, 'm', null);
INSERT INTO `act_hi_detail` VALUES ('2709', 'VariableUpdate', '2701', '2701', null, '2705', 'applyUser', 'string', '0', '2019-07-20 15:48:07.112', null, null, null, 'fengyaof', null);
INSERT INTO `act_hi_detail` VALUES ('2711', 'VariableUpdate', '2701', '2701', null, '2705', 'days', 'integer', '0', '2019-07-20 15:48:07.116', null, null, '1', '1', null);
INSERT INTO `act_hi_detail` VALUES ('2713', 'VariableUpdate', '2701', '2701', null, '2705', 'reason', 'string', '0', '2019-07-20 15:48:07.116', null, null, null, '?????', null);
INSERT INTO `act_hi_detail` VALUES ('2726', 'VariableUpdate', '2718', '2718', null, '2722', 'applyUser', 'string', '0', '2019-07-20 15:48:54.890', null, null, null, 'aaa', null);
INSERT INTO `act_hi_detail` VALUES ('2728', 'VariableUpdate', '2718', '2718', null, '2722', 'days', 'integer', '0', '2019-07-20 15:48:54.893', null, null, '1', '1', null);
INSERT INTO `act_hi_detail` VALUES ('2730', 'VariableUpdate', '2718', '2718', null, '2722', 'reason', 'string', '0', '2019-07-20 15:48:54.893', null, null, null, '?????', null);
INSERT INTO `act_hi_detail` VALUES ('5213', 'VariableUpdate', '5205', '5205', null, '5209', 'applyUser', 'string', '0', '2019-07-20 16:25:23.188', null, null, null, 'sss', null);
INSERT INTO `act_hi_detail` VALUES ('5215', 'VariableUpdate', '5205', '5205', null, '5209', 'days', 'integer', '0', '2019-07-20 16:25:23.217', null, null, '1', '1', null);
INSERT INTO `act_hi_detail` VALUES ('5217', 'VariableUpdate', '5205', '5205', null, '5209', 'reason', 'string', '0', '2019-07-20 16:25:23.217', null, null, null, '?????', null);

-- ----------------------------
-- Table structure for `act_hi_identitylink`
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_identitylink`;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_identitylink
-- ----------------------------
INSERT INTO `act_hi_identitylink` VALUES ('105', null, 'participant', '张三', null, '101');
INSERT INTO `act_hi_identitylink` VALUES ('12706', null, 'starter', 'fengyaof', null, '12705');
INSERT INTO `act_hi_identitylink` VALUES ('12711', 'empGroup', 'candidate', null, '12710', null);
INSERT INTO `act_hi_identitylink` VALUES ('12721', null, 'participant', 'm', null, '12705');
INSERT INTO `act_hi_identitylink` VALUES ('12722', 'dirGroup', 'candidate', null, '12720', null);
INSERT INTO `act_hi_identitylink` VALUES ('15206', null, 'starter', 'fengyaof', null, '15205');
INSERT INTO `act_hi_identitylink` VALUES ('15211', 'empGroup', 'candidate', null, '15210', null);
INSERT INTO `act_hi_identitylink` VALUES ('15221', 'manageGroup', 'candidate', null, '15220', null);
INSERT INTO `act_hi_identitylink` VALUES ('15222', null, 'participant', 'm', null, '15205');
INSERT INTO `act_hi_identitylink` VALUES ('15230', null, 'participant', 'm', null, '5205');
INSERT INTO `act_hi_identitylink` VALUES ('15238', null, 'participant', 'm', null, '2701');
INSERT INTO `act_hi_identitylink` VALUES ('2702', null, 'starter', 'fengyaof', null, '2701');
INSERT INTO `act_hi_identitylink` VALUES ('2707', 'empGroup', 'candidate', null, '2706', null);
INSERT INTO `act_hi_identitylink` VALUES ('2717', 'manageGroup', 'candidate', null, '2716', null);
INSERT INTO `act_hi_identitylink` VALUES ('2719', null, 'starter', 'aaa', null, '2718');
INSERT INTO `act_hi_identitylink` VALUES ('2724', 'empGroup', 'candidate', null, '2723', null);
INSERT INTO `act_hi_identitylink` VALUES ('2734', 'manageGroup', 'candidate', null, '2733', null);
INSERT INTO `act_hi_identitylink` VALUES ('5206', null, 'starter', 'sss', null, '5205');
INSERT INTO `act_hi_identitylink` VALUES ('5211', 'empGroup', 'candidate', null, '5210', null);
INSERT INTO `act_hi_identitylink` VALUES ('5221', 'manageGroup', 'candidate', null, '5220', null);

-- ----------------------------
-- Table structure for `act_hi_procinst`
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_procinst`;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_procinst
-- ----------------------------
INSERT INTO `act_hi_procinst` VALUES ('101', '101', null, 'helloworld:1:4', '2019-07-20 12:12:18.000', null, null, null, 'startevent1', null, null, null, '', null);
INSERT INTO `act_hi_procinst` VALUES ('12705', '12705', null, 'vacationProcess:5:12704', '2019-07-20 16:46:28.381', null, null, 'fengyaof', 'startevent1', null, null, null, '', null);
INSERT INTO `act_hi_procinst` VALUES ('15205', '15205', null, 'vacationProcess:6:15204', '2019-07-20 17:38:07.727', '2019-07-20 17:39:07.485', '59758', 'fengyaof', 'startevent1', 'endevent1', null, null, '', null);
INSERT INTO `act_hi_procinst` VALUES ('2701', '2701', null, 'vacationProcess:1:204', '2019-07-20 15:48:06.839', '2019-07-20 17:39:19.921', '6673082', 'fengyaof', 'startevent1', 'endevent1', null, null, '', null);
INSERT INTO `act_hi_procinst` VALUES ('2718', '2718', null, 'vacationProcess:1:204', '2019-07-20 15:48:54.815', null, null, 'aaa', 'startevent1', null, null, null, '', null);
INSERT INTO `act_hi_procinst` VALUES ('5205', '5205', null, 'vacationProcess:2:5204', '2019-07-20 16:25:22.220', '2019-07-20 17:39:11.253', '4429033', 'sss', 'startevent1', 'endevent1', null, null, '', null);

-- ----------------------------
-- Table structure for `act_hi_taskinst`
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_taskinst`;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_taskinst
-- ----------------------------
INSERT INTO `act_hi_taskinst` VALUES ('104', 'helloworld:1:4', 'usertask1', '101', '101', '提交申请', null, null, null, '张三', '2019-07-20 12:12:18.000', null, null, null, null, '50', null, null, null, '');
INSERT INTO `act_hi_taskinst` VALUES ('12710', 'vacationProcess:5:12704', 'usertask1', '12705', '12707', '????', null, null, null, 'fengyaof', '2019-07-20 16:46:28.483', '2019-07-20 16:46:28.617', '2019-07-20 16:46:28.698', '215', null, '50', null, null, null, '');
INSERT INTO `act_hi_taskinst` VALUES ('12720', 'vacationProcess:5:12704', 'usertask3', '12705', '12707', '????', null, null, null, 'm', '2019-07-20 16:46:28.738', null, null, null, null, '50', null, null, null, '');
INSERT INTO `act_hi_taskinst` VALUES ('15210', 'vacationProcess:6:15204', 'usertask1', '15205', '15207', '????', null, null, null, 'fengyaof', '2019-07-20 17:38:07.766', '2019-07-20 17:38:07.873', '2019-07-20 17:38:07.926', '160', null, '50', null, null, null, '');
INSERT INTO `act_hi_taskinst` VALUES ('15220', 'vacationProcess:6:15204', 'usertask2', '15205', '15207', '????', null, null, null, 'm', '2019-07-20 17:38:07.951', '2019-07-20 17:39:07.401', '2019-07-20 17:39:07.447', '59496', null, '50', null, null, null, '');
INSERT INTO `act_hi_taskinst` VALUES ('2706', 'vacationProcess:1:204', 'usertask1', '2701', '2703', '????', null, null, null, 'fengyaof', '2019-07-20 15:48:06.929', '2019-07-20 15:48:07.071', '2019-07-20 15:48:07.129', '200', null, '50', null, null, null, '');
INSERT INTO `act_hi_taskinst` VALUES ('2716', 'vacationProcess:1:204', 'usertask2', '2701', '2703', '????', null, null, null, 'm', '2019-07-20 15:48:07.161', '2019-07-20 17:39:19.857', '2019-07-20 17:39:19.899', '6672738', null, '50', null, null, null, '');
INSERT INTO `act_hi_taskinst` VALUES ('2723', 'vacationProcess:1:204', 'usertask1', '2718', '2720', '????', null, null, null, 'aaa', '2019-07-20 15:48:54.817', '2019-07-20 15:48:54.864', '2019-07-20 15:48:54.899', '82', null, '50', null, null, null, '');
INSERT INTO `act_hi_taskinst` VALUES ('2733', 'vacationProcess:1:204', 'usertask2', '2718', '2720', '????', null, null, null, null, '2019-07-20 15:48:54.902', null, null, null, null, '50', null, null, null, '');
INSERT INTO `act_hi_taskinst` VALUES ('5210', 'vacationProcess:2:5204', 'usertask1', '5205', '5207', '????', null, null, null, 'sss', '2019-07-20 16:25:22.295', '2019-07-20 16:25:23.076', '2019-07-20 16:25:23.243', '948', null, '50', null, null, null, '');
INSERT INTO `act_hi_taskinst` VALUES ('5220', 'vacationProcess:2:5204', 'usertask2', '5205', '5207', '????', null, null, null, 'm', '2019-07-20 16:25:23.300', '2019-07-20 17:39:11.179', '2019-07-20 17:39:11.231', '4427931', null, '50', null, null, null, '');

-- ----------------------------
-- Table structure for `act_hi_varinst`
-- ----------------------------
DROP TABLE IF EXISTS `act_hi_varinst`;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_hi_varinst
-- ----------------------------
INSERT INTO `act_hi_varinst` VALUES ('12712', '12705', '12705', null, 'applyUser', 'string', '0', null, null, null, 'fengyaof', null, '2019-07-20 16:46:28.685', '2019-07-20 16:46:28.685');
INSERT INTO `act_hi_varinst` VALUES ('12714', '12705', '12705', null, 'days', 'integer', '0', null, null, '8', '8', null, '2019-07-20 16:46:28.690', '2019-07-20 16:46:28.690');
INSERT INTO `act_hi_varinst` VALUES ('12716', '12705', '12705', null, 'reason', 'string', '0', null, null, null, '?????2222222222222222', null, '2019-07-20 16:46:28.690', '2019-07-20 16:46:28.690');
INSERT INTO `act_hi_varinst` VALUES ('15212', '15205', '15205', null, 'applyUser', 'string', '0', null, null, null, 'fengyaof', null, '2019-07-20 17:38:07.916', '2019-07-20 17:38:07.916');
INSERT INTO `act_hi_varinst` VALUES ('15214', '15205', '15205', null, 'days', 'integer', '0', null, null, '3', '3', null, '2019-07-20 17:38:07.920', '2019-07-20 17:38:07.920');
INSERT INTO `act_hi_varinst` VALUES ('15216', '15205', '15205', null, 'reason', 'string', '0', null, null, null, '?????', null, '2019-07-20 17:38:07.920', '2019-07-20 17:38:07.920');
INSERT INTO `act_hi_varinst` VALUES ('15223', '15205', '15205', null, 'result', 'string', '0', null, null, null, '????', null, '2019-07-20 17:39:07.439', '2019-07-20 17:39:07.439');
INSERT INTO `act_hi_varinst` VALUES ('15225', '15205', '15205', null, 'auditTime', 'date', '0', null, null, '1563615547398', null, null, '2019-07-20 17:39:07.441', '2019-07-20 17:39:07.441');
INSERT INTO `act_hi_varinst` VALUES ('15227', '15205', '15205', null, 'auditor', 'string', '0', null, null, null, 'm', null, '2019-07-20 17:39:07.441', '2019-07-20 17:39:07.441');
INSERT INTO `act_hi_varinst` VALUES ('15231', '5205', '5205', null, 'result', 'string', '0', null, null, null, '????', null, '2019-07-20 17:39:11.223', '2019-07-20 17:39:11.223');
INSERT INTO `act_hi_varinst` VALUES ('15233', '5205', '5205', null, 'auditTime', 'date', '0', null, null, '1563615551176', null, null, '2019-07-20 17:39:11.225', '2019-07-20 17:39:11.225');
INSERT INTO `act_hi_varinst` VALUES ('15235', '5205', '5205', null, 'auditor', 'string', '0', null, null, null, 'm', null, '2019-07-20 17:39:11.225', '2019-07-20 17:39:11.225');
INSERT INTO `act_hi_varinst` VALUES ('15239', '2701', '2701', null, 'result', 'string', '0', null, null, null, '????', null, '2019-07-20 17:39:19.893', '2019-07-20 17:39:19.893');
INSERT INTO `act_hi_varinst` VALUES ('15241', '2701', '2701', null, 'auditTime', 'date', '0', null, null, '1563615559854', null, null, '2019-07-20 17:39:19.895', '2019-07-20 17:39:19.895');
INSERT INTO `act_hi_varinst` VALUES ('15243', '2701', '2701', null, 'auditor', 'string', '0', null, null, null, 'm', null, '2019-07-20 17:39:19.895', '2019-07-20 17:39:19.895');
INSERT INTO `act_hi_varinst` VALUES ('2708', '2701', '2701', null, 'applyUser', 'string', '0', null, null, null, 'fengyaof', null, '2019-07-20 15:48:07.112', '2019-07-20 15:48:07.112');
INSERT INTO `act_hi_varinst` VALUES ('2710', '2701', '2701', null, 'days', 'integer', '0', null, null, '1', '1', null, '2019-07-20 15:48:07.116', '2019-07-20 15:48:07.116');
INSERT INTO `act_hi_varinst` VALUES ('2712', '2701', '2701', null, 'reason', 'string', '0', null, null, null, '?????', null, '2019-07-20 15:48:07.116', '2019-07-20 15:48:07.116');
INSERT INTO `act_hi_varinst` VALUES ('2725', '2718', '2718', null, 'applyUser', 'string', '0', null, null, null, 'aaa', null, '2019-07-20 15:48:54.890', '2019-07-20 15:48:54.890');
INSERT INTO `act_hi_varinst` VALUES ('2727', '2718', '2718', null, 'days', 'integer', '0', null, null, '1', '1', null, '2019-07-20 15:48:54.893', '2019-07-20 15:48:54.893');
INSERT INTO `act_hi_varinst` VALUES ('2729', '2718', '2718', null, 'reason', 'string', '0', null, null, null, '?????', null, '2019-07-20 15:48:54.893', '2019-07-20 15:48:54.893');
INSERT INTO `act_hi_varinst` VALUES ('5212', '5205', '5205', null, 'applyUser', 'string', '0', null, null, null, 'sss', null, '2019-07-20 16:25:23.188', '2019-07-20 16:25:23.188');
INSERT INTO `act_hi_varinst` VALUES ('5214', '5205', '5205', null, 'days', 'integer', '0', null, null, '1', '1', null, '2019-07-20 16:25:23.217', '2019-07-20 16:25:23.217');
INSERT INTO `act_hi_varinst` VALUES ('5216', '5205', '5205', null, 'reason', 'string', '0', null, null, null, '?????', null, '2019-07-20 16:25:23.217', '2019-07-20 16:25:23.217');

-- ----------------------------
-- Table structure for `act_idm_persistent_token`
-- ----------------------------
DROP TABLE IF EXISTS `act_idm_persistent_token`;
CREATE TABLE `act_idm_persistent_token` (
  `series` varchar(255) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `token_value` varchar(255) DEFAULT NULL,
  `token_date` datetime(6) DEFAULT NULL,
  `ip_address` varchar(39) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of act_idm_persistent_token
-- ----------------------------
INSERT INTO `act_idm_persistent_token` VALUES ('hsS3KAV3fxCTOPLzwCwMdg==', 'fengyaof', 'F8+J7XDl0gd7dDBPSYfajg==', '2019-07-20 17:14:49.171000', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.62 Safari/537.36');

-- ----------------------------
-- Table structure for `act_id_group`
-- ----------------------------
DROP TABLE IF EXISTS `act_id_group`;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_group
-- ----------------------------
INSERT INTO `act_id_group` VALUES ('dirGroup', '4', 'dir', '4');
INSERT INTO `act_id_group` VALUES ('empGroup', '5', 'emp', '5');
INSERT INTO `act_id_group` VALUES ('goup1', '1', '组1', '1');
INSERT INTO `act_id_group` VALUES ('goup2', '2', '组2', '2');
INSERT INTO `act_id_group` VALUES ('manageGroup', '3', 'manage', '3');

-- ----------------------------
-- Table structure for `act_id_info`
-- ----------------------------
DROP TABLE IF EXISTS `act_id_info`;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_info
-- ----------------------------

-- ----------------------------
-- Table structure for `act_id_membership`
-- ----------------------------
DROP TABLE IF EXISTS `act_id_membership`;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_membership
-- ----------------------------
INSERT INTO `act_id_membership` VALUES ('n', 'dirGroup');
INSERT INTO `act_id_membership` VALUES ('aaa', 'empGroup');
INSERT INTO `act_id_membership` VALUES ('fengyaof', 'empGroup');
INSERT INTO `act_id_membership` VALUES ('sss', 'empGroup');
INSERT INTO `act_id_membership` VALUES ('m', 'manageGroup');

-- ----------------------------
-- Table structure for `act_id_user`
-- ----------------------------
DROP TABLE IF EXISTS `act_id_user`;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_id_user
-- ----------------------------
INSERT INTO `act_id_user` VALUES ('aaa', '1', null, null, null, '123456', null);
INSERT INTO `act_id_user` VALUES ('fengyaof', '1', null, null, null, '123456', null);
INSERT INTO `act_id_user` VALUES ('m', '1', null, null, null, '123456', null);
INSERT INTO `act_id_user` VALUES ('n', null, null, null, null, '123456', null);
INSERT INTO `act_id_user` VALUES ('sss', '2', null, null, null, '123456', null);

-- ----------------------------
-- Table structure for `act_procdef_info`
-- ----------------------------
DROP TABLE IF EXISTS `act_procdef_info`;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_procdef_info
-- ----------------------------

-- ----------------------------
-- Table structure for `act_re_deployment`
-- ----------------------------
DROP TABLE IF EXISTS `act_re_deployment`;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOY_TIME_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_deployment
-- ----------------------------
INSERT INTO `act_re_deployment` VALUES ('1', 'helloworld入门程序', null, null, '', null, '2019-07-20 12:11:51.000');
INSERT INTO `act_re_deployment` VALUES ('10201', 'SpringAutoDeployment', null, null, '', null, '2019-07-20 16:43:34.204');
INSERT INTO `act_re_deployment` VALUES ('12701', 'SpringAutoDeployment', null, null, '', null, '2019-07-20 16:44:45.685');
INSERT INTO `act_re_deployment` VALUES ('15201', 'SpringAutoDeployment', null, null, '', null, '2019-07-20 17:37:13.757');
INSERT INTO `act_re_deployment` VALUES ('201', 'SpringAutoDeployment', null, null, '', null, '2019-07-20 15:09:50.055');
INSERT INTO `act_re_deployment` VALUES ('5201', 'SpringAutoDeployment', null, null, '', null, '2019-07-20 16:20:13.310');
INSERT INTO `act_re_deployment` VALUES ('7701', 'SpringAutoDeployment', null, null, '', null, '2019-07-20 16:28:23.512');

-- ----------------------------
-- Table structure for `act_re_model`
-- ----------------------------
DROP TABLE IF EXISTS `act_re_model`;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_re_model
-- ----------------------------

-- ----------------------------
-- Table structure for `act_re_procdef`
-- ----------------------------
DROP TABLE IF EXISTS `act_re_procdef`;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for `act_ru_deadletter_job`
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_deadletter_job`;
CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_deadletter_job
-- ----------------------------

-- ----------------------------
-- Table structure for `act_ru_event_subscr`
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_event_subscr`;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_event_subscr
-- ----------------------------

-- ----------------------------
-- Table structure for `act_ru_execution`
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_execution`;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
  `TASK_COUNT_` int(11) DEFAULT NULL,
  `JOB_COUNT_` int(11) DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_execution
-- ----------------------------
INSERT INTO `act_ru_execution` VALUES ('101', '1', '101', null, null, 'helloworld:1:4', null, null, 'usertask1', '1', '0', '1', '0', null, '1', '2', '', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `act_ru_execution` VALUES ('12705', '1', '12705', null, null, 'vacationProcess:5:12704', null, '12705', null, '1', '0', '1', '0', '0', '1', null, '', null, '2019-07-20 16:46:28.381', 'fengyaof', null, '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `act_ru_execution` VALUES ('12707', '2', '12705', null, '12705', 'vacationProcess:5:12704', null, '12705', 'usertask3', '1', '0', '0', '0', '0', '1', null, '', null, '2019-07-20 16:46:28.384', null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `act_ru_execution` VALUES ('2718', '1', '2718', null, null, 'vacationProcess:1:204', null, '2718', null, '1', '0', '1', '0', '0', '1', null, '', null, '2019-07-20 15:48:54.815', 'aaa', null, '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `act_ru_execution` VALUES ('2720', '2', '2718', null, '2718', 'vacationProcess:1:204', null, '2718', 'usertask2', '1', '0', '0', '0', '0', '1', null, '', null, '2019-07-20 15:48:54.816', null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `act_ru_identitylink`
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_identitylink`;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_identitylink
-- ----------------------------
INSERT INTO `act_ru_identitylink` VALUES ('105', '1', null, 'participant', '张三', null, '101', null);
INSERT INTO `act_ru_identitylink` VALUES ('12706', '1', null, 'starter', 'fengyaof', null, '12705', null);
INSERT INTO `act_ru_identitylink` VALUES ('12721', '1', null, 'participant', 'm', null, '12705', null);
INSERT INTO `act_ru_identitylink` VALUES ('12722', '1', 'dirGroup', 'candidate', null, '12720', null, null);
INSERT INTO `act_ru_identitylink` VALUES ('2719', '1', null, 'starter', 'aaa', null, '2718', null);
INSERT INTO `act_ru_identitylink` VALUES ('2734', '1', 'manageGroup', 'candidate', null, '2733', null, null);

-- ----------------------------
-- Table structure for `act_ru_job`
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_job`;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_job
-- ----------------------------

-- ----------------------------
-- Table structure for `act_ru_suspended_job`
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_suspended_job`;
CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_suspended_job
-- ----------------------------

-- ----------------------------
-- Table structure for `act_ru_task`
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_task`;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_task
-- ----------------------------
INSERT INTO `act_ru_task` VALUES ('104', '1', '101', '101', 'helloworld:1:4', '提交申请', null, null, 'usertask1', null, '张三', null, '50', null, '1', '', null, null, '2019-07-20 12:12:18.000', null);
INSERT INTO `act_ru_task` VALUES ('12720', '1', '12707', '12705', 'vacationProcess:5:12704', '????', null, null, 'usertask3', null, 'm', null, '50', null, '1', '', null, null, '2019-07-20 16:46:28.737', null);
INSERT INTO `act_ru_task` VALUES ('2733', '1', '2720', '2718', 'vacationProcess:1:204', '????', null, null, 'usertask2', null, null, null, '50', null, '1', '', null, null, '2019-07-20 15:48:54.902', null);

-- ----------------------------
-- Table structure for `act_ru_timer_job`
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_timer_job`;
CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TIMER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_timer_job
-- ----------------------------

-- ----------------------------
-- Table structure for `act_ru_variable`
-- ----------------------------
DROP TABLE IF EXISTS `act_ru_variable`;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of act_ru_variable
-- ----------------------------
INSERT INTO `act_ru_variable` VALUES ('12712', '1', 'string', 'applyUser', '12705', '12705', null, null, null, null, 'fengyaof', null);
INSERT INTO `act_ru_variable` VALUES ('12714', '1', 'integer', 'days', '12705', '12705', null, null, null, '8', '8', null);
INSERT INTO `act_ru_variable` VALUES ('12716', '1', 'string', 'reason', '12705', '12705', null, null, null, null, '?????2222222222222222', null);
INSERT INTO `act_ru_variable` VALUES ('2725', '1', 'string', 'applyUser', '2718', '2718', null, null, null, null, 'aaa', null);
INSERT INTO `act_ru_variable` VALUES ('2727', '1', 'integer', 'days', '2718', '2718', null, null, null, '1', '1', null);
INSERT INTO `act_ru_variable` VALUES ('2729', '1', 'string', 'reason', '2718', '2718', null, null, null, null, '?????', null);

-- ----------------------------
-- Table structure for `act_wo_comments`
-- ----------------------------
DROP TABLE IF EXISTS `act_wo_comments`;
CREATE TABLE `act_wo_comments` (
  `id` bigint(20) NOT NULL,
  `message` varchar(4000) NOT NULL,
  `created` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `task_id` varchar(255) DEFAULT NULL,
  `proc_inst_id` varchar(255) DEFAULT NULL,
  `comment_definition` longtext,
  PRIMARY KEY (`id`),
  KEY `comment_task_created` (`task_id`,`created`),
  KEY `comment_proc_created` (`proc_inst_id`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of act_wo_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `act_wo_related_content`
-- ----------------------------
DROP TABLE IF EXISTS `act_wo_related_content`;
CREATE TABLE `act_wo_related_content` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created` timestamp(6) NULL DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `task_id` varchar(255) DEFAULT NULL,
  `process_id` varchar(255) DEFAULT NULL,
  `content_source` varchar(255) DEFAULT NULL,
  `source_id` varchar(4000) DEFAULT NULL,
  `store_id` varchar(255) DEFAULT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `field` varchar(400) DEFAULT NULL,
  `related_content` bit(1) NOT NULL,
  `link` bit(1) NOT NULL,
  `link_url` varchar(4000) DEFAULT NULL,
  `content_available` bit(1) DEFAULT b'0',
  `locked` bit(1) DEFAULT b'0',
  `lock_date` timestamp(6) NULL DEFAULT NULL,
  `lock_exp_date` timestamp(6) NULL DEFAULT NULL,
  `lock_owner` varchar(255) DEFAULT NULL,
  `checked_out` bit(1) DEFAULT b'0',
  `checkout_date` timestamp(6) NULL DEFAULT NULL,
  `checkout_owner` varchar(255) DEFAULT NULL,
  `last_modified` timestamp(6) NULL DEFAULT NULL,
  `last_modified_by` varchar(255) DEFAULT NULL,
  `checked_out_to_local` bit(1) DEFAULT b'0',
  `content_size` bigint(20) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_relcont_createdby` (`created_by`),
  KEY `idx_relcont_taskid` (`task_id`),
  KEY `idx_relcont_procid` (`process_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of act_wo_related_content
-- ----------------------------

-- ----------------------------
-- Table structure for `hibernate_sequences`
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequences`;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) DEFAULT NULL,
  `sequence_next_hi_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of hibernate_sequences
-- ----------------------------
