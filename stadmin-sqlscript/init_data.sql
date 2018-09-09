-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.16 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=''NO_AUTO_VALUE_ON_ZERO'' */;

-- 导出  表 stadmin.stms_admin 结构
CREATE TABLE IF NOT EXISTS `stms_admin` (
  `seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT ''ID'',
  `username` varchar(50) DEFAULT NULL COMMENT ''用户名,唯一性'',
  `realname` varchar(50) DEFAULT NULL COMMENT ''真实姓名'',
  `password` varchar(200) DEFAULT NULL COMMENT ''密码'',
  `salt` varchar(200) DEFAULT NULL COMMENT ''加密盐'',
  `address` varchar(255) DEFAULT NULL COMMENT ''地址'',
  `mobile_phone` varchar(50) DEFAULT NULL COMMENT ''手机号'',
  `contact_number` varchar(100) DEFAULT NULL COMMENT ''联系电话'',
  `email` varchar(100) DEFAULT NULL COMMENT ''电子邮件'',
  `descr` varchar(1000) DEFAULT NULL COMMENT ''描述'',
  `status` int(11) DEFAULT ''1'' COMMENT ''状态 1正常 2锁定'',
  `portal_key` varchar(50) DEFAULT NULL COMMENT ''门户标识'',
  `property_id` bigint(20) DEFAULT NULL COMMENT ''所属物业'',
  `sex` int(11) DEFAULT ''0'' COMMENT ''性别：0未知 1男，2女'',
  `user_type` int(11) DEFAULT ''1'' COMMENT ''用户类型（1：管理员，2：普通用户，3：注册用户）'',
  `photo_url` varchar(500) DEFAULT NULL COMMENT ''头像url'',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT ''创建时间'',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT ''修改时间'',
  `dversion` int(11) NOT NULL DEFAULT ''0'' COMMENT ''数据版本'',
  `is_del` int(11) DEFAULT ''0'' COMMENT ''是否删除 1：删除，0正常'',
  `data_order` int(11) DEFAULT ''100'' COMMENT ''排序'',
  PRIMARY KEY (`seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100003 DEFAULT CHARSET=utf8 COMMENT=''系统用户表'';

-- 正在导出表  stadmin.stms_admin 的数据：~1 rows (大约)
DELETE FROM `stms_admin`;
/*!40000 ALTER TABLE `stms_admin` DISABLE KEYS */;
INSERT INTO `stms_admin` (`seq_id`, `username`, `realname`, `password`, `salt`, `address`, `mobile_phone`, `contact_number`, `email`, `descr`, `status`, `portal_key`, `property_id`, `sex`, `user_type`, `photo_url`, `create_time`, `update_time`, `dversion`, `is_del`, `data_order`) VALUES
	(100001, ''admin'', ''admin1'', ''41f15d993cb4742604ef89b27dfd76109996b673818167326d6d476ca3333e84'', ''eEvsFy1J7ux+cg4iehJLry9mgq6/jfQ6bKwPLj8tGy0='', NULL, ''1'', NULL, ''2'', NULL, 0, ''stadmin'', NULL, 0, 1, NULL, ''2018-05-14 16:34:29'', ''2018-05-25 15:38:46'', 0, 0, 100);
/*!40000 ALTER TABLE `stms_admin` ENABLE KEYS */;

-- 导出  表 stadmin.stms_autho 结构
CREATE TABLE IF NOT EXISTS `stms_autho` (
  `seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT ''ID'',
  `name` varchar(50) DEFAULT NULL COMMENT ''权限名'',
  `en_name` varchar(50) DEFAULT NULL COMMENT ''英文名'',
  `uri` varchar(1000) DEFAULT NULL COMMENT ''地址'',
  `type` int(11) DEFAULT NULL COMMENT ''(1、模块，2、菜单，3、按钮)'',
  `descr` varchar(1000) DEFAULT NULL COMMENT ''描述'',
  `super_id` bigint(20) DEFAULT NULL COMMENT ''父节点ID'',
  `node_level` int(11) DEFAULT NULL COMMENT ''节点层级'',
  `node_path` varchar(255) DEFAULT NULL COMMENT ''节点路径'',
  `icon_class` varchar(100) DEFAULT NULL COMMENT ''图标样式'',
  `is_leaf` int(11) NOT NULL DEFAULT ''1'' COMMENT ''叶子节点'',
  `super_name` varchar(255) DEFAULT NULL COMMENT ''上级名称'',
  `node_path_name` varchar(1000) DEFAULT NULL COMMENT ''节点路径名称'',
  `portal_key` varchar(50) DEFAULT NULL COMMENT ''门户标识'',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT ''创建时间'',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT ''修改时间'',
  `dversion` int(11) NOT NULL DEFAULT ''0'' COMMENT ''数据版本'',
  `is_del` int(11) DEFAULT ''0'' COMMENT ''是否删除'',
  `data_order` int(11) DEFAULT ''100'' COMMENT ''排序'',
  PRIMARY KEY (`seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10030 DEFAULT CHARSET=utf8 COMMENT=''权限'';

-- 正在导出表  stadmin.stms_autho 的数据：~30 rows (大约)
DELETE FROM `stms_autho`;
/*!40000 ALTER TABLE `stms_autho` DISABLE KEYS */;
INSERT INTO `stms_autho` (`seq_id`, `name`, `en_name`, `uri`, `type`, `descr`, `super_id`, `node_level`, `node_path`, `icon_class`, `is_leaf`, `super_name`, `node_path_name`, `portal_key`, `create_time`, `update_time`, `dversion`, `is_del`, `data_order`) VALUES
	(1124, ''商城后台'', ''stadmin_system'', NULL, 0, NULL, 0, 1, NULL, NULL, 2, NULL, NULL, ''stadmin'', ''2018-05-14 16:34:29'', ''2018-07-09 16:34:29'', 0, 0, 100),
	(1125, ''系统模块'', ''stadmin_menu_root'', NULL, 1, NULL, 1124, 2, NULL, ''layui-icon-user'', 2, NULL, NULL, ''stadmin'', ''2018-05-14 16:34:29'', ''2018-07-09 16:34:35'', 0, 0, 100),
	(1126, ''管理员管理'', ''sysAdmin_readAndCount'', ''/stadmin-static/layui/views/admin/list.html'', 2, NULL, 1125, 3, NULL, NULL, 2, NULL, NULL, ''stadmin'', ''2018-05-14 16:34:29'', ''2018-07-09 16:32:03'', 0, 0, 100),
	(1127, ''管理员查询'', ''sysAdmin_readById'', NULL, 3, NULL, 1126, 4, NULL, NULL, 1, NULL, NULL, ''stadmin'', ''2018-05-14 16:34:29'', ''2018-07-09 16:32:05'', 0, 0, 100),
	(1128, ''管理员添加'', ''sysAdmin_create'', NULL, 3, NULL, 1126, 4, NULL, NULL, 1, NULL, NULL, ''stadmin'', ''2018-05-14 16:34:29'', ''2018-07-09 16:32:06'', 0, 0, 100),
	(1129, ''管理员修改'', ''sysAdmin_updateById'', NULL, 3, NULL, 1126, 4, NULL, NULL, 1, NULL, NULL, ''stadmin'', ''2018-05-14 16:34:29'', ''2018-07-09 16:32:08'', 0, 0, 100),
	(1130, ''管理员删除'', ''sysAdmin_deleteById'', NULL, 3, NULL, 1126, 4, NULL, NULL, 1, NULL, NULL, ''stadmin'', ''2018-05-14 16:34:29'', ''2018-07-09 16:32:10'', 0, 0, 100),
	(1136, ''角色授权'', ''sysRole_grantAutho'', NULL, 3, NULL, 1161, 4, NULL, NULL, 1, NULL, NULL, ''stadmin'', ''2018-05-14 16:34:29'', ''2018-07-24 16:07:34'', 0, 0, 100),
	(1137, ''管理员授权'', ''sysAdmin_grantRole'', NULL, 3, NULL, 1126, 4, NULL, NULL, 1, NULL, NULL, ''stadmin'', ''2018-05-14 16:34:29'', ''2018-07-24 16:07:35'', 0, 0, 100),
	(1161, ''角色管理'', ''sysRole_readAndCount'', ''/stadmin-static/layui/views/role/list.html'', 2, NULL, 1125, 3, NULL, NULL, 2, NULL, NULL, ''stadmin'', ''2018-05-14 16:34:29'', ''2018-09-09 12:13:27'', 0, 0, 110),
	(1162, ''角色查询'', ''sysRole_readById'', NULL, 3, NULL, 1161, 4, NULL, NULL, 1, NULL, NULL, ''stadmin'', ''2018-05-14 16:34:29'', ''2018-05-17 10:34:03'', 0, 0, 100),
	(1163, ''角色添加'', ''sysRole_create'', NULL, 3, NULL, 1161, 4, NULL, NULL, 1, NULL, NULL, ''stadmin'', ''2018-05-14 16:34:29'', ''2018-05-17 10:34:05'', 0, 0, 100),
	(1164, ''角色修改'', ''sysRole_updateById'', NULL, 3, NULL, 1161, 4, NULL, NULL, 1, NULL, NULL, ''stadmin'', ''2018-05-14 16:34:29'', ''2018-05-17 10:34:10'', 0, 0, 100),
	(1165, ''角色删除'', ''sysRole_deleteById'', NULL, 3, NULL, 1161, 4, NULL, NULL, 1, NULL, NULL, ''stadmin'', ''2018-05-14 16:34:29'', ''2018-05-17 10:34:12'', 0, 0, 100),
	(1171, ''权限管理'', ''sysAutho_readAndCount'', ''/stadmin-static/layui/views/autho/list.html'', 2, NULL, 1125, 3, NULL, NULL, 2, NULL, NULL, ''stadmin'', ''2018-05-14 16:34:29'', ''2018-09-09 12:18:22'', 0, 0, 100),
	(1172, ''权限查询'', ''sysAutho_readById'', NULL, 3, NULL, 1171, 4, NULL, NULL, 1, NULL, NULL, ''stadmin'', ''2018-05-14 16:34:29'', ''2018-09-09 12:19:24'', 0, 0, 100),
	(1173, ''权限添加'', ''sysAutho_create'', NULL, 3, NULL, 1171, 4, NULL, NULL, 1, NULL, NULL, ''stadmin'', ''2018-05-14 16:34:29'', ''2018-09-09 12:19:25'', 0, 0, 100),
	(1174, ''权限修改'', ''sysAutho_updateById'', NULL, 3, NULL, 1171, 4, NULL, NULL, 1, NULL, NULL, ''stadmin'', ''2018-05-14 16:34:29'', ''2018-09-09 12:19:26'', 0, 0, 100),
	(1175, ''权限删除'', ''sysAutho_deleteById'', NULL, 3, NULL, 1171, 4, NULL, NULL, 1, NULL, NULL, ''stadmin'', ''2018-05-14 16:34:29'', ''2018-09-09 12:19:27'', 0, 0, 100),
	(10000, ''商城模块'', ''stadmin_menu_shop'', NULL, 1, NULL, 1124, 2, NULL, ''layui-icon-cart-simple'', 2, NULL, NULL, ''stadmin'', ''2018-05-14 16:34:29'', ''2018-07-09 16:34:44'', 0, 0, 100),
	(10001, ''商品管理'', ''stmGoods_readAndCount'', ''/stadmin-static/layui/views/goods/list.html'', 2, NULL, 10000, 3, NULL, NULL, 2, NULL, NULL, ''stadmin'', ''2018-05-14 16:34:29'', ''2018-06-11 15:12:59'', 0, 0, 100),
	(10002, ''商品查询'', ''stmGoods_readById'', NULL, 3, NULL, 10001, 4, NULL, NULL, 1, NULL, NULL, ''stadmin'', ''2018-05-14 16:34:29'', ''2018-05-17 10:21:15'', 0, 0, 100),
	(10003, ''商品添加'', ''stmGoods_create'', NULL, 3, NULL, 10001, 4, NULL, NULL, 1, NULL, NULL, ''stadmin'', ''2018-05-14 16:34:29'', ''2018-05-17 10:21:15'', 0, 0, 100),
	(10004, ''商品修改'', ''stmGoods_updateById'', NULL, 3, NULL, 10001, 4, NULL, NULL, 1, NULL, NULL, ''stadmin'', ''2018-05-14 16:34:29'', ''2018-05-17 10:21:16'', 0, 0, 100),
	(10005, ''商品删除'', ''stmGoods_deleteById'', NULL, 3, NULL, 10001, 4, NULL, NULL, 1, NULL, NULL, ''stadmin'', ''2018-05-14 16:34:29'', ''2018-05-17 10:21:19'', 0, 0, 100),
	(10007, ''配置管理'', ''stmGconfig_readAndCount'', ''/stadmin-static/layui/views/gconfig/list.html'', 2, NULL, 10000, 3, NULL, NULL, 2, NULL, NULL, ''stadmin'', ''2018-08-01 14:41:08'', ''2018-09-09 11:22:35'', 0, 0, 100),
	(10008, ''配置管理添加'', ''stmGconfig_create'', NULL, 3, NULL, 10007, 4, NULL, NULL, 1, NULL, NULL, ''stadmin'', ''2018-08-01 15:28:26'', ''2018-09-09 11:17:36'', 0, 0, 100),
	(10009, ''配置管理修改'', ''stmGconfig_updateById'', NULL, 3, NULL, 10007, 4, NULL, NULL, 1, NULL, NULL, ''stadmin'', ''2018-08-01 15:48:39'', ''2018-09-09 11:17:38'', 0, 0, 100),
	(10010, ''配置管理删除'', ''stmGconfig_deleteById'', NULL, 3, NULL, 10007, 4, NULL, NULL, 1, NULL, NULL, ''stadmin'', ''2018-08-01 15:49:10'', ''2018-09-09 11:17:40'', 0, 0, 100),
	(10011, ''配置管理查询'', ''stmGconfig_readById'', NULL, 3, NULL, 10007, 4, NULL, NULL, 1, NULL, NULL, ''stadmin'', ''2018-08-01 15:49:43'', ''2018-09-09 11:17:42'', 0, 0, 100);
/*!40000 ALTER TABLE `stms_autho` ENABLE KEYS */;

-- 导出  表 stadmin.stms_dict_data 结构
CREATE TABLE IF NOT EXISTS `stms_dict_data` (
  `seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT ''ID'',
  `dict_type` varchar(20) DEFAULT NULL COMMENT ''字典类型'',
  `dict_name` varchar(100) DEFAULT NULL COMMENT ''字典名称'',
  `class_id` varchar(255) DEFAULT NULL COMMENT ''字典类ID'',
  `class_name` varchar(100) DEFAULT NULL COMMENT ''字典名'',
  `entry_id` varchar(255) DEFAULT NULL COMMENT ''条目'',
  `entry_name` varchar(100) DEFAULT NULL COMMENT ''条目名称'',
  `descr` varchar(255) DEFAULT NULL COMMENT ''描述'',
  `portal_key` varchar(50) DEFAULT NULL COMMENT ''门户标识'',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT ''创建时间'',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT ''修改时间'',
  `dversion` int(11) NOT NULL DEFAULT ''0'' COMMENT ''数据版本'',
  `is_del` int(11) DEFAULT ''0'' COMMENT ''是否删除'',
  `data_order` int(11) DEFAULT ''100'' COMMENT ''排序'',
  PRIMARY KEY (`seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT=''系统数据字典'';

-- 正在导出表  stadmin.stms_dict_data 的数据：~0 rows (大约)
DELETE FROM `stms_dict_data`;
/*!40000 ALTER TABLE `stms_dict_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `stms_dict_data` ENABLE KEYS */;

-- 导出  表 stadmin.stms_login_log 结构
CREATE TABLE IF NOT EXISTS `stms_login_log` (
  `seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT ''ID'',
  `remote_ip` varchar(50) DEFAULT NULL COMMENT ''IP'',
  `user_id` bigint(20) DEFAULT NULL COMMENT ''用户ID'',
  `user_name` varchar(50) DEFAULT NULL COMMENT ''用户名'',
  `auth_type` int(11) DEFAULT NULL COMMENT ''认证类型。1密码，2token'',
  `ret_code` int(11) DEFAULT NULL COMMENT ''0为成功'',
  `ret_msg` varchar(255) DEFAULT NULL COMMENT ''结果描述'',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT ''创建时间'',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT ''修改时间'',
  `dversion` int(11) NOT NULL DEFAULT ''0'' COMMENT ''数据版本'',
  `is_del` int(11) DEFAULT ''0'' COMMENT ''是否删除'',
  `data_order` int(11) DEFAULT ''100'' COMMENT ''排序'',
  PRIMARY KEY (`seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT=''登录日志'';

-- 正在导出表  stadmin.stms_login_log 的数据：~0 rows (大约)
DELETE FROM `stms_login_log`;
/*!40000 ALTER TABLE `stms_login_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `stms_login_log` ENABLE KEYS */;

-- 导出  表 stadmin.stms_org 结构
CREATE TABLE IF NOT EXISTS `stms_org` (
  `seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT ''ID'',
  `name` varchar(50) DEFAULT NULL COMMENT ''组织机构名称'',
  `descr` varchar(1000) DEFAULT NULL COMMENT ''描述'',
  `super_id` bigint(20) DEFAULT NULL COMMENT ''父节点ID'',
  `node_level` int(11) DEFAULT NULL COMMENT ''节点层级'',
  `node_path` varchar(255) DEFAULT NULL COMMENT ''节点路径'',
  `portal_key` varchar(50) DEFAULT NULL COMMENT ''门户标识'',
  `is_leaf` int(11) NOT NULL DEFAULT ''1'' COMMENT ''叶子节点'',
  `super_name` varchar(255) DEFAULT NULL COMMENT ''上级名称'',
  `node_path_name` varchar(1000) DEFAULT NULL COMMENT ''节点路径名称'',
  `idcard` varchar(100) DEFAULT NULL COMMENT ''机构编号'',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT ''创建时间'',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT ''修改时间'',
  `dversion` int(11) NOT NULL DEFAULT ''0'' COMMENT ''数据版本'',
  `is_del` int(11) DEFAULT ''0'' COMMENT ''是否删除'',
  `data_order` int(11) DEFAULT ''100'' COMMENT ''排序'',
  PRIMARY KEY (`seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100002 DEFAULT CHARSET=utf8 COMMENT=''组织机构'';

-- 正在导出表  stadmin.stms_org 的数据：~1 rows (大约)
DELETE FROM `stms_org`;
/*!40000 ALTER TABLE `stms_org` DISABLE KEYS */;
INSERT INTO `stms_org` (`seq_id`, `name`, `descr`, `super_id`, `node_level`, `node_path`, `portal_key`, `is_leaf`, `super_name`, `node_path_name`, `idcard`, `create_time`, `update_time`, `dversion`, `is_del`, `data_order`) VALUES
	(100001, ''管理后台总部'', NULL, 0, 0, '';100001;'', ''stadmin'', 1, NULL, NULL, NULL, ''2018-05-14 16:34:29'', ''2018-05-14 16:34:29'', 0, 0, 100);
/*!40000 ALTER TABLE `stms_org` ENABLE KEYS */;

-- 导出  表 stadmin.stms_org_has_user 结构
CREATE TABLE IF NOT EXISTS `stms_org_has_user` (
  `seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT ''ID'',
  `user_id` bigint(20) DEFAULT NULL COMMENT ''用户'',
  `org_id` bigint(20) DEFAULT NULL COMMENT ''机构'',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT ''创建时间'',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT ''修改时间'',
  `dversion` int(11) NOT NULL DEFAULT ''0'' COMMENT ''数据版本'',
  `is_del` int(11) DEFAULT ''1'' COMMENT ''是否删除'',
  `data_order` int(11) DEFAULT ''100'',
  PRIMARY KEY (`seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100002 DEFAULT CHARSET=utf8 COMMENT=''机构用户关联'';

-- 正在导出表  stadmin.stms_org_has_user 的数据：~1 rows (大约)
DELETE FROM `stms_org_has_user`;
/*!40000 ALTER TABLE `stms_org_has_user` DISABLE KEYS */;
INSERT INTO `stms_org_has_user` (`seq_id`, `user_id`, `org_id`, `create_time`, `update_time`, `dversion`, `is_del`, `data_order`) VALUES
	(100001, 100001, 100001, ''2018-05-14 16:34:29'', ''2018-05-14 16:34:29'', 0, 0, 100);
/*!40000 ALTER TABLE `stms_org_has_user` ENABLE KEYS */;

-- 导出  表 stadmin.stms_portal 结构
CREATE TABLE IF NOT EXISTS `stms_portal` (
  `seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT ''ID'',
  `name` varchar(100) DEFAULT NULL COMMENT ''名称'',
  `en_name` varchar(100) DEFAULT NULL COMMENT ''英文名'',
  `login_logo` varchar(255) DEFAULT NULL COMMENT ''登录界面logo'',
  `login_bg` varchar(255) DEFAULT NULL COMMENT ''登录页背景'',
  `index_logo` varchar(255) DEFAULT NULL COMMENT ''首页LOGO'',
  `develop_unit` varchar(255) DEFAULT NULL COMMENT ''建设单位'',
  `owner_unit` varchar(255) DEFAULT NULL COMMENT ''业主单位'',
  `use_captcha` int(11) DEFAULT ''1'' COMMENT ''登录需验证码'',
  `css_theme` varchar(1000) DEFAULT NULL COMMENT ''CSS样式'',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT ''创建时间'',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT ''修改时间'',
  `dversion` int(11) NOT NULL DEFAULT ''0'' COMMENT ''数据版本'',
  `is_del` int(11) DEFAULT ''0'' COMMENT ''是否删除'',
  `data_order` int(11) DEFAULT ''100'' COMMENT ''排序'',
  PRIMARY KEY (`seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100001 DEFAULT CHARSET=utf8 COMMENT=''门户'';

-- 正在导出表  stadmin.stms_portal 的数据：~1 rows (大约)
DELETE FROM `stms_portal`;
/*!40000 ALTER TABLE `stms_portal` DISABLE KEYS */;
INSERT INTO `stms_portal` (`seq_id`, `name`, `en_name`, `login_logo`, `login_bg`, `index_logo`, `develop_unit`, `owner_unit`, `use_captcha`, `css_theme`, `create_time`, `update_time`, `dversion`, `is_del`, `data_order`) VALUES
	(100000, ''管理后台'', ''stadmin'', ''login_logo.png'', NULL, ''index_logo.png'', ''---'', ''---'', 2, NULL, ''2018-05-14 16:34:29'', ''2018-05-14 16:34:29'', 0, 0, 100);
/*!40000 ALTER TABLE `stms_portal` ENABLE KEYS */;

-- 导出  表 stadmin.stms_role 结构
CREATE TABLE IF NOT EXISTS `stms_role` (
  `seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT ''ID'',
  `name` varchar(50) DEFAULT NULL COMMENT ''名称'',
  `en_name` varchar(50) DEFAULT NULL COMMENT ''英文名'',
  `descr` varchar(1000) DEFAULT NULL COMMENT ''描述'',
  `portal_key` varchar(50) DEFAULT NULL COMMENT ''门户标识'',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT ''创建时间'',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT ''修改时间'',
  `dversion` int(11) NOT NULL DEFAULT ''0'' COMMENT ''数据版本'',
  `is_del` int(11) DEFAULT ''0'' COMMENT ''是否删除'',
  `data_order` int(11) DEFAULT ''100'' COMMENT ''排序'',
  PRIMARY KEY (`seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100003 DEFAULT CHARSET=utf8 COMMENT=''系统角色'';

-- 正在导出表  stadmin.stms_role 的数据：~1 rows (大约)
DELETE FROM `stms_role`;
/*!40000 ALTER TABLE `stms_role` DISABLE KEYS */;
INSERT INTO `stms_role` (`seq_id`, `name`, `en_name`, `descr`, `portal_key`, `create_time`, `update_time`, `dversion`, `is_del`, `data_order`) VALUES
	(100001, ''管理后台_管理员'', ''stadmin_admin'', NULL, ''stadmin'', ''2018-05-14 16:34:29'', ''2018-05-14 16:34:29'', 0, 0, 100);
/*!40000 ALTER TABLE `stms_role` ENABLE KEYS */;

-- 导出  表 stadmin.stms_role_has_autho 结构
CREATE TABLE IF NOT EXISTS `stms_role_has_autho` (
  `seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT ''ID'',
  `role_id` bigint(20) DEFAULT NULL COMMENT ''角色'',
  `autho_id` bigint(20) DEFAULT NULL COMMENT ''权限'',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT ''创建时间'',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT ''修改时间'',
  `dversion` int(11) NOT NULL DEFAULT ''0'' COMMENT ''数据版本'',
  `is_del` int(11) DEFAULT ''0'' COMMENT ''是否删除'',
  `data_order` int(11) DEFAULT ''100'',
  PRIMARY KEY (`seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1236 DEFAULT CHARSET=utf8 COMMENT=''角色拥有权限'';

-- 正在导出表  stadmin.stms_role_has_autho 的数据：~30 rows (大约)
DELETE FROM `stms_role_has_autho`;
/*!40000 ALTER TABLE `stms_role_has_autho` DISABLE KEYS */;
INSERT INTO `stms_role_has_autho` (`seq_id`, `role_id`, `autho_id`, `create_time`, `update_time`, `dversion`, `is_del`, `data_order`) VALUES
	(1124, 100001, 1124, ''2018-05-14 16:34:29'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(1125, 100001, 1125, ''2018-05-14 16:34:29'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(1126, 100001, 1126, ''2018-05-14 16:34:29'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(1127, 100001, 1127, ''2018-05-14 16:34:29'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(1128, 100001, 1128, ''2018-05-14 16:34:29'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(1129, 100001, 1129, ''2018-05-14 16:34:29'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(1130, 100001, 1130, ''2018-05-14 16:34:29'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(1136, 100001, 1136, ''2018-05-14 16:34:29'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(1137, 100001, 1137, ''2018-05-14 16:34:29'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(1161, 100001, 1161, ''2018-05-14 16:34:29'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(1162, 100001, 1162, ''2018-05-14 16:34:29'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(1163, 100001, 1163, ''2018-05-14 16:34:29'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(1164, 100001, 1164, ''2018-05-14 16:34:29'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(1165, 100001, 1165, ''2018-05-14 16:34:29'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(1171, 100001, 1171, ''2018-05-14 16:34:29'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(1172, 100001, 1172, ''2018-05-14 16:34:29'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(1173, 100001, 1173, ''2018-05-14 16:34:29'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(1174, 100001, 1174, ''2018-05-14 16:34:29'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(1175, 100001, 1175, ''2018-05-14 16:34:29'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(10000, 100001, 10000, ''2018-05-17 10:31:47'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(10001, 100001, 10001, ''2018-05-17 10:32:33'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(10002, 100001, 10002, ''2018-05-17 10:32:35'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(10003, 100001, 10003, ''2018-05-17 10:32:35'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(10004, 100001, 10004, ''2018-05-17 10:32:35'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(10005, 100001, 10005, ''2018-05-17 10:32:36'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(10007, 100001, 10007, ''2018-08-01 14:50:20'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(10008, 100001, 10008, ''2018-08-01 15:33:00'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(10009, 100001, 10009, ''2018-08-01 15:53:44'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(10010, 100001, 10010, ''2018-08-01 15:54:07'', ''2018-09-09 16:15:32'', 0, 0, 100),
	(10011, 100001, 10011, ''2018-08-01 15:54:20'', ''2018-09-09 16:15:32'', 0, 0, 100);
/*!40000 ALTER TABLE `stms_role_has_autho` ENABLE KEYS */;

-- 导出  表 stadmin.stms_token 结构
CREATE TABLE IF NOT EXISTS `stms_token` (
  `seq_id` varchar(50) NOT NULL COMMENT ''ID'',
  `user_id` bigint(20) DEFAULT NULL COMMENT ''用户'',
  `expire_time` datetime DEFAULT NULL COMMENT ''过期时间'',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT ''创建时间'',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT ''修改时间'',
  `dversion` int(11) NOT NULL DEFAULT ''0'' COMMENT ''数据版本'',
  `is_del` int(11) DEFAULT ''0'' COMMENT ''是否删除'',
  PRIMARY KEY (`seq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT=''系统令牌表'';

-- 正在导出表  stadmin.stms_token 的数据：~1 rows (大约)
DELETE FROM `stms_token`;
/*!40000 ALTER TABLE `stms_token` DISABLE KEYS */;
INSERT INTO `stms_token` (`seq_id`, `user_id`, `expire_time`, `create_time`, `update_time`, `dversion`, `is_del`) VALUES
	(''79ade05862c09b0120eea9a66aa92094'', 100001, ''2018-09-09 23:21:05'', ''2018-09-08 23:21:03'', NULL, 0, 0);
/*!40000 ALTER TABLE `stms_token` ENABLE KEYS */;

-- 导出  表 stadmin.stms_user_has_role 结构
CREATE TABLE IF NOT EXISTS `stms_user_has_role` (
  `seq_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT ''ID'',
  `user_id` bigint(20) DEFAULT NULL COMMENT ''用户'',
  `role_id` bigint(20) DEFAULT NULL COMMENT ''角色'',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT ''创建时间'',
  `update_time` datetime DEFAULT NULL COMMENT ''修改时间'',
  `dversion` int(11) DEFAULT ''0'',
  `is_del` int(11) DEFAULT ''0'' COMMENT ''是否删除'',
  `data_order` int(11) DEFAULT ''100'',
  PRIMARY KEY (`seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100006 DEFAULT CHARSET=utf8 COMMENT=''用户角色'';

-- 正在导出表  stadmin.stms_user_has_role 的数据：~1 rows (大约)
DELETE FROM `stms_user_has_role`;
/*!40000 ALTER TABLE `stms_user_has_role` DISABLE KEYS */;
INSERT INTO `stms_user_has_role` (`seq_id`, `user_id`, `role_id`, `create_time`, `update_time`, `dversion`, `is_del`, `data_order`) VALUES
	(100001, 100001, 100001, ''2018-05-14 16:34:29'', ''2018-05-14 16:34:29'', 0, 0, 100);
/*!40000 ALTER TABLE `stms_user_has_role` ENABLE KEYS */;

-- 导出  表 stadmin.stm_gconfig 结构
CREATE TABLE IF NOT EXISTS `stm_gconfig` (
  `seq_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_del` tinyint(4) DEFAULT ''0'',
  `group_name` varchar(16) DEFAULT NULL,
  `config_name` varchar(32) DEFAULT NULL,
  `config_val` varchar(4000) DEFAULT NULL,
  `config_memo` varchar(255) DEFAULT NULL,
  `portal_key` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`seq_id`),
  KEY `group_name_config_name` (`group_name`,`config_name`)
) ENGINE=InnoDB AUTO_INCREMENT=376 DEFAULT CHARSET=utf8mb4 COMMENT=''配置'';

-- 正在导出表  stadmin.stm_gconfig 的数据：~5 rows (大约)
DELETE FROM `stm_gconfig`;
/*!40000 ALTER TABLE `stm_gconfig` DISABLE KEYS */;
INSERT INTO `stm_gconfig` (`seq_id`, `update_time`, `create_time`, `is_del`, `group_name`, `config_name`, `config_val`, `config_memo`, `portal_key`) VALUES
	(101, ''2018-09-09 11:08:00'', ''2017-11-02 18:37:16'', 0, ''url'', ''mploginapi'', ''http://{authoDomain}/stlive/sign/mp/{mpkey}?originalurl=index'', ''（弃用）'', ''pyg''),
	(102, ''2018-09-09 11:08:00'', ''2017-11-02 18:37:16'', 0, ''url'', ''authorizeUrl'', ''https://open.weixin.qq.com/connect/oauth2/authorize?appid={appid}&redirect_uri={redirect_uri}&response_type=code&scope=snsapi_base&state=interceptor#wechat_redirect'', ''（弃用）'', ''pyg''),
	(272, ''2018-09-09 11:08:00'', ''2017-11-27 10:48:04'', 0, ''window'', ''bindInvideCode'', ''{\r\n\''title\'':\''请输入您的推荐人\'',\r\n\''url\'':\''http://11.8.ymz008.com/stlive-web/page/bindInviteCode.html\'',\r\n\''width\'':80,\r\n\''height\'':25\r\n}'', ''邀请码窗口'', ''pyg''),
	(372, ''2018-09-09 11:08:00'', ''2018-08-02 11:41:59'', 0, ''test'', ''test2'', ''test'', '''', NULL),
	(373, ''2018-09-09 11:08:00'', ''2018-08-02 14:34:27'', 0, ''test'', ''test'', ''tes2'', ''测试'', NULL);
/*!40000 ALTER TABLE `stm_gconfig` ENABLE KEYS */;

-- 导出  表 stadmin.stm_goods 结构
CREATE TABLE IF NOT EXISTS `stm_goods` (
  `seq_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `active_date` date DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) DEFAULT NULL COMMENT ''名称'',
  `intro` varchar(255) DEFAULT NULL COMMENT ''简介'',
  `img_url` varchar(255) DEFAULT NULL COMMENT ''封面图（多张以分号分隔）'',
  `spe` varchar(255) DEFAULT NULL COMMENT ''规格（多规格以分号分隔）'',
  `place` varchar(255) DEFAULT NULL COMMENT ''（暂无用）产地'',
  `price` bigint(20) DEFAULT NULL COMMENT ''单价 分'',
  `price_original` bigint(20) DEFAULT NULL COMMENT ''原价'',
  `price_express` bigint(20) DEFAULT NULL COMMENT ''快递费 分'',
  `price_cost` bigint(20) DEFAULT ''0'' COMMENT ''成本价'',
  `hpoints_send` bigint(20) NOT NULL DEFAULT ''-1'' COMMENT ''赠送欢乐豆（小于0的商品不送，等于0的按默认配置来，大于0的按数据库来）'',
  `price_collage` bigint(20) DEFAULT ''-1'' COMMENT ''【拼单】拼单价格 分'',
  `collage_need_count` int(11) DEFAULT NULL COMMENT ''【拼单】拼单需要数量'',
  `price_dis` bigint(20) DEFAULT ''0'' COMMENT ''【优惠券】抵扣金额'',
  `price_cut` bigint(20) DEFAULT ''0'' COMMENT ''【优惠券】满减金额'',
  `coupon_use_type` tinyint(4) NOT NULL DEFAULT ''1'' COMMENT ''【优惠券】优惠券使用范围 1正价 2正价+促销'',
  `detail` text COMMENT ''详细'',
  `num` bigint(20) DEFAULT ''1000'' COMMENT ''库剩余存'',
  `num_all` bigint(20) DEFAULT ''1000'' COMMENT ''所有库存'',
  `status` tinyint(4) DEFAULT ''1'' COMMENT ''1上架 2已下架 '',
  `is_gift` tinyint(4) DEFAULT ''0'' COMMENT ''是否可赠送（正价无法配置送礼）'',
  `classify_id` bigint(20) DEFAULT ''-1'' COMMENT ''商品分类id'',
  `classify` tinyint(4) DEFAULT ''10'',
  `goods_type` tinyint(4) DEFAULT ''1'' COMMENT ''1正价 2促销  3积分兑换商品（只是一个分类，不能用作判断积分支付，可使用payType） 4拼团购 11优惠券'',
  `pay_type` tinyint(4) DEFAULT ''1'' COMMENT ''支付类型 1人民币 3纯积分'',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user_id` bigint(20) NOT NULL DEFAULT ''1'',
  `data_order` int(11) DEFAULT NULL COMMENT ''正向排序'',
  `is_del` int(11) NOT NULL DEFAULT ''0'' COMMENT ''0正常，1删除'',
  PRIMARY KEY (`seq_id`),
  KEY `active_date` (`active_date`)
) ENGINE=InnoDB AUTO_INCREMENT=2044 DEFAULT CHARSET=utf8mb4 COMMENT=''商品'';

-- 正在导出表  stadmin.stm_goods 的数据：~73 rows (大约)
DELETE FROM `stm_goods`;
/*!40000 ALTER TABLE `stm_goods` DISABLE KEYS */;
INSERT INTO `stm_goods` (`seq_id`, `active_date`, `update_time`, `name`, `intro`, `img_url`, `spe`, `place`, `price`, `price_original`, `price_express`, `price_cost`, `hpoints_send`, `price_collage`, `collage_need_count`, `price_dis`, `price_cut`, `coupon_use_type`, `detail`, `num`, `num_all`, `status`, `is_gift`, `classify_id`, `classify`, `goods_type`, `pay_type`, `create_time`, `create_user_id`, `data_order`, `is_del`) VALUES
	(103, ''2018-04-17'', ''2018-09-09 16:10:02'', ''IH电饭煲1'', ''电磁感应加热，米饭更好吃'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_1_799_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_1_799_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_1_799_3.jpg'', '''', NULL, 79900, NULL, 0, 39950, -1, NULL, NULL, 0, 0, 1, ''<div><img src="http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_1_799_41.jpg"></div><div><img src="http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_1_799_42.jpg"></div><div><img src="http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_1_799_43.jpg"></div>'', 100, 100, 2, 0, -1, 10, 1, 1, ''2018-04-17 13:54:19'', 1, 1, 0),
	(104, ''2018-04-17'', ''2018-05-31 17:50:55'', ''免安装台式洗碗机'', ''解放双手，让洗碗变得简单'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_1_3599_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_1_3599_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_1_3599_3.jpg'', '''', NULL, 359900, NULL, 0, 179950, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_1_3599_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_1_3599_42.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_1_3599_43.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_1_3599_44.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-04-17 13:54:19'', 1, 2, 0),
	(105, ''2018-04-17'', ''2018-05-31 17:50:55'', ''日式和风声波式便携电动牙刷'', ''随时充电，精巧实用'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_2_399_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_2_399_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_2_399_3.jpg'', '''', NULL, 39900, NULL, 0, 19950, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_2_399_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_2_399_43.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_2_399_44.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_2_399_45.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-04-17 13:54:19'', 1, 3, 0),
	(106, ''2018-04-17'', ''2018-08-10 16:59:51'', ''空气净化器'', ''杀菌、除甲醛、PM2.5指数实时显示'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_2_1599_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_2_1599_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_2_1599_3.jpg'', '''', ''飞利浦制造商'', 159900, NULL, 0, 79950, -1, NULL, NULL, 0, 0, 1, ''<div><img src="http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_2_1599_41.jpg"></div><div><img src="http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_2_1599_42.jpg"></div><div><img src="http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_2_1599_43.jpg"></div><div><img src="http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_2_1599_44.jpg"></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-04-17 13:54:19'', 1, 4, 0),
	(107, ''2018-04-17'', ''2018-05-31 17:50:55'', ''网易云音乐无线蓝牙音箱MB1'', ''美观便携，优质音效'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_5_599_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_5_599_2.jpg;http://qbbfile.oss-cn-hangzhou.aliyuncs.com/test/2018/0523/1527047471030.jpg'', '''', '''', 59900, NULL, 0, 29950, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_5_599_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_5_599_42.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_5_599_43.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-04-17 13:54:19'', 1, 5, 0),
	(108, ''2018-04-17'', ''2018-08-10 16:13:42'', ''音伏INVOICE'', ''回归本质，聆听内心'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_5_999_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_5_999_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_5_999_3.jpg'', '''', ''铁三角制造商'', 99900, NULL, 0, 49950, -1, NULL, NULL, 0, 0, 1, ''<div><img src="http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_5_999_41.jpg"></div><div><img src="http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_5_999_42.jpg"></div><div><img src="http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_5_999_43.jpg"></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-04-17 13:54:19'', 1, 6, 0),
	(109, ''2018-04-17'', ''2018-05-31 17:50:55'', ''液晶控温陶瓷直发板'', ''区间控温，柔顺同时更护发'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_6_299_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_6_299_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_6_299_3.jpg'', '''', ''GHD制造商'', 29900, NULL, 0, 14950, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_6_299_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_6_299_42.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_6_299_43.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-04-17 13:54:19'', 1, 7, 0),
	(110, ''2018-04-17'', ''2018-05-31 17:50:55'', ''蒸汽式挂烫机'', ''平烫挂烫一机两用'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_6_599_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_6_599_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_6_599_3.jpg'', '''', NULL, 59900, NULL, 0, 29950, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_6_599_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_6_599_42.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_6_599_43.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_6_599_44.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_6_599_45.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_6_599_46.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-04-17 13:54:19'', 1, 8, 0),
	(111, ''2018-04-17'', ''2018-05-31 17:50:55'', ''网易有道'', ''二十七种语言 智能语音翻译机'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_7_999_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_7_999_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_7_999_3.jpg'', '''', NULL, 99900, NULL, 0, 49950, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_7_999_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_7_999_42.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_7_999_43.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_7_999_44.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-04-17 13:54:19'', 1, 9, 0),
	(112, ''2018-04-17'', ''2018-05-31 17:50:55'', ''车载空气净化器'', ''CADR值高达70m³每小时'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_7_599_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_7_599_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_7_599_3.jpg'', '''', NULL, 59900, NULL, 0, 29950, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_7_599_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_7_599_42.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_7_599_43.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_7_599_44.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/15_7_599_45.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-04-17 13:54:19'', 1, 10, 0),
	(123, ''2018-04-17'', ''2018-05-31 17:50:55'', ''正山小种红茶礼盒'', ''枣蜜花香，回甘持久'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_1_668_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_1_668_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_1_668_3.jpg'', ''150克'', NULL, 66800, NULL, 0, 33400, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_1_668_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_1_668_42.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_1_668_43.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-04-17 14:57:39'', 1, 1, 0),
	(124, ''2018-04-17'', ''2018-05-31 17:50:55'', ''茶六趣茗茶礼盒'', ''尽享中国六大茶系之趣'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_10_368_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_10_368_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_10_368_3.jpg'', ''165克'', NULL, 36800, NULL, 0, 18400, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_10_368_51.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_10_368_52.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_10_368_53.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_10_368_54.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_10_368_55.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-04-17 14:57:42'', 1, 2, 0),
	(125, ''2018-04-17'', ''2018-05-31 17:50:55'', ''特级普洱熟茶礼盒'', ''嫩芽春焙 高端熟普礼盒'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_2_668_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_2_668_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_2_668_3.jpg'', ''220克'', NULL, 66800, NULL, 0, 33400, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_2_668_51.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_2_668_52.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_2_668_53.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_2_668_54.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-04-17 14:57:42'', 1, 3, 0),
	(126, ''2018-04-17'', ''2018-05-31 17:50:55'', ''茉莉大龙毫礼盒'', ''六窨一提，非遗工艺传承大师监茶'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_3_668_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_3_668_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_3_668_3.jpg'', ''160克'', NULL, 66800, NULL, 0, 33400, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_3_668_51.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_3_668_52.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_3_668_53.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_3_668_54.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_3_668_888.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-04-17 14:57:42'', 1, 4, 0),
	(127, ''2018-04-17'', ''2018-05-31 17:50:55'', ''太平猴魁礼盒'', ''甘香如兰，猴韵清爽'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_4_668_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_4_668_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_4_668_3.jpg'', ''100克'', NULL, 66800, NULL, 0, 33400, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_4_668_51.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_4_668_52.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_4_668_53.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_4_668_54.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-04-17 14:57:42'', 1, 5, 0),
	(128, ''2018-04-17'', ''2018-05-31 17:50:55'', ''特级安溪铁观音礼盒'', ''观音韵浓，传统正味'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_5_668_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_5_668_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_5_668_3.jpg'', ''288克'', NULL, 66800, NULL, 0, 33400, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_5_668_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_5_668_42.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_5_668_43.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_5_668_44.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-04-17 14:57:42'', 1, 6, 0),
	(129, ''2018-04-17'', ''2018-05-31 17:50:55'', ''武夷大红袍礼盒'', ''一级岩茶，纯正岩韵'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_6_668_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_6_668_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_6_668_3.jpg'', ''160克'', NULL, 66800, NULL, 0, 33400, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_6_668_51.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_6_668_52.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_6_668_53.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_6_668_54.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-04-17 14:57:42'', 1, 7, 0),
	(130, ''2018-04-17'', ''2018-05-31 17:50:55'', ''江南四茗茶叶礼盒'', ''春采灵芽，云间新茗'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_7_888_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_7_888_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_7_888_3.jpg'', ''200克'', NULL, 88800, NULL, 0, 44400, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_7_888_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_7_888_42.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_7_888_43.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_7_888_44.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-04-17 14:57:42'', 1, 8, 0),
	(131, ''2018-04-17'', ''2018-05-31 17:50:55'', ''明前特级西湖龙井（纸包）'', ''2018新茶，梅家坞产区、品质自饮'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_8_888_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_8_888_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_8_888_3.jpg'', ''150克'', NULL, 88800, NULL, 0, 44400, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_8_888_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_8_888_42.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_8_888_43.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_8_888_44.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-04-17 14:57:42'', 1, 9, 0),
	(132, ''2018-04-17'', ''2018-05-31 17:50:55'', ''陈皮滇红礼盒'', ''鲜爽滇红初遇柑香陈皮'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_9_398_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_9_398_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_9_398_3.jpg'', ''130克'', NULL, 39800, NULL, 0, 19900, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_9_398_51.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_9_398_52.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_9_398_53.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/20_9_398_54.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-04-17 14:57:42'', 1, 10, 0),
	(133, ''2018-04-17'', ''2018-05-31 17:50:55'', ''智利直采赤霞珠干红葡萄酒'', ''智利名庄，经典赤霞珠'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_1_188_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_1_188_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_1_188_3.jpg'', ''750毫升'', NULL, 18800, NULL, 0, 9400, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_1_188_51.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_1_188_52.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_1_188_53.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_1_188_54.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_1_188_55.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-04-17 15:11:35'', 1, 1, 0),
	(134, ''2018-04-17'', ''2018-05-31 17:50:55'', ''智利直采梅洛干红葡萄酒'', ''经典产区 甜美柔顺'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_2_188_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_2_188_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_2_188_3.jpg'', ''750毫升'', NULL, 18800, NULL, 0, 9400, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_2_188_51.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_2_188_52.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_2_188_53.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_2_188_54.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-04-17 15:11:35'', 1, 2, 0),
	(135, ''2018-04-17'', ''2018-05-31 17:50:55'', ''澳洲直采西拉干红葡萄酒'', ''百年双红名庄，大奖酒款'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_3_188_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_3_188_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_3_188_3.jpg'', ''750毫升'', NULL, 18800, NULL, 0, 9400, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_3_188_51.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_3_188_52.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_3_188_53.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_3_188_54.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_3_188_55.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-04-17 15:11:35'', 1, 3, 0),
	(136, ''2018-04-17'', ''2018-05-31 17:50:55'', ''澳洲直采混酿干红葡萄酒'', ''百年双红名庄，大奖酒款'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_4_188_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_4_188_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_4_188_3.jpg'', ''750毫升'', NULL, 18800, NULL, 0, 9400, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_4_188_51.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_4_188_52.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_4_188_53.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_4_188_54.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_4_188_55.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-04-17 15:11:35'', 1, 4, 0),
	(137, ''2018-04-17'', ''2018-05-31 17:50:55'', ''澳洲直采西拉赤霞珠珍藏干红葡萄酒'', ''澳洲双红酒庄 老藤混酿'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_5_258_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_5_258_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_5_258_3.jpg'', ''750毫升'', NULL, 25800, NULL, 0, 12900, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_5_258_51.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_5_258_52.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_5_258_53.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_5_258_54.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_5_258_55.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-04-17 15:11:35'', 1, 5, 0),
	(138, ''2018-04-17'', ''2018-05-31 17:50:55'', ''西班牙直采珍藏干红葡萄酒'', ''产区名庄，囊获大奖'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_6_258_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_6_258_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_6_258_3.jpg'', ''750毫升'', NULL, 25800, NULL, 0, 12900, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_6_258_51.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_6_258_52.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_6_258_53.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_6_258_54.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_6_258_55.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-04-17 15:11:35'', 1, 6, 0),
	(139, ''2018-04-17'', ''2018-05-31 17:50:55'', ''法国直采南法混酿干红葡萄酒'', ''法国原产 原瓶进口'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_7_188_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_7_188_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_7_188_3.jpg'', ''750毫升'', ''法国直采'', 18800, NULL, 0, 9400, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_7_188_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_7_188_42.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_7_188_43.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_7_188_44.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-04-17 15:11:35'', 1, 7, 0),
	(140, ''2018-04-17'', ''2018-05-31 17:50:55'', ''法国直采普罗旺斯桃红葡萄酒'', ''普罗旺斯产区 优雅精致'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_8_258_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_8_258_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_8_258_3.jpg'', ''750毫升'', ''法国直采'', 25800, NULL, 0, 12900, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_8_258_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_8_258_42.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_8_258_43.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0417/30_8_258_44.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-04-17 15:11:35'', 1, 8, 0),
	(285, ''2018-04-17'', ''2018-05-31 17:50:55'', ''满888减200元优惠券'', ''限时购等详情页标注不可用券的商品除外'', ''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stlive/coupon/djq.jpg'', '''', NULL, 10000, NULL, 0, 0, -1, NULL, NULL, 20000, 88800, 1, NULL, 100, 100, 1, 1, -1, 10, 11, 3, ''2018-04-17 13:54:19'', 1, 3, 0),
	(286, ''2018-04-17'', ''2018-05-31 17:50:55'', ''满1888减600元优惠券'', ''限时购等详情页标注不可用券的商品除外'', ''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stlive/coupon/djq.jpg'', '''', NULL, 30000, NULL, 0, 0, -1, NULL, NULL, 60000, 188800, 1, NULL, 100, 100, 1, 1, -1, 10, 11, 3, ''2018-04-17 13:54:19'', 1, 4, 0),
	(287, ''2018-04-26'', ''2018-05-31 17:50:55'', ''大红袍'', ''岩茶精髓，岩韵显著'', ''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_1_0_1.jpg;http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_1_0_2.jpg;http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_1_0_3.jpg'', ''313克'', NULL, 98000, NULL, 0, 28000, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_1_0_41.jpg\''></div><div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_1_0_42.jpg\''></div><div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_1_0_43.jpg\''></div><div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_1_0_44.jpg\''></div>'', 100, 100, 3, 0, -1, 10, 1, 1, ''2018-04-26 10:59:21'', 1, 1, 0),
	(288, ''2018-04-26'', ''2018-05-31 17:50:55'', ''牡丹王茶饼'', ''花香牡丹王，物以稀为贵'', ''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_10_0_1.jpg;http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_10_0_2.jpg;http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_10_0_3.jpg'', ''367克'', NULL, 88000, NULL, 0, 26000, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_10_0_41.jpg\''></div><div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_10_0_42.jpg\''></div>'', 100, 100, 3, 0, -1, 10, 1, 1, ''2018-04-26 10:59:21'', 1, 10, 0),
	(289, ''2018-04-26'', ''2018-05-31 17:50:55'', ''金骏眉'', ''色泽乌润，滋味醇厚'', ''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_11_0_1.jpg;http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_11_0_2.jpg;http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_11_0_3.jpg'', ''377克'', NULL, 88000, NULL, 0, 22000, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_11_0_41.jpg\''></div><div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_11_0_42.jpg\''></div>'', 100, 100, 3, 0, -1, 10, 1, 1, ''2018-04-26 10:59:21'', 1, 11, 0),
	(290, ''2018-04-26'', ''2018-05-31 17:50:55'', ''铁观音'', ''观音韵浓，传统正味'', ''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_2_0_1.jpg;http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_2_0_2.jpg;http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_2_0_3.jpg'', ''470克'', NULL, 88000, NULL, 0, 23000, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_2_0_41.jpg\''></div><div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_2_0_42.jpg\''></div><div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_2_0_43.jpg\''></div><div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_2_0_44.jpg\''></div>'', 100, 100, 3, 0, -1, 10, 1, 1, ''2018-04-26 10:59:21'', 1, 2, 0),
	(291, ''2018-04-26'', ''2018-05-31 17:50:55'', ''正山小种'', ''枣蜜花香，回甘持久'', ''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_3_0_1.jpg;http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_3_0_2.jpg;http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_3_0_3.jpg'', ''500克'', NULL, 78000, NULL, 0, 17000, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_3_0_41.jpg\''></div><div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_3_0_42.jpg\''></div><div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_3_0_43.jpg\''></div>'', 100, 100, 3, 0, -1, 10, 1, 1, ''2018-04-26 10:59:21'', 1, 3, 0),
	(292, ''2018-04-26'', ''2018-05-31 17:50:55'', ''龙井'', ''2018新茶，梅家坞产区、品质自饮'', ''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_4_0_1.jpg;http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_4_0_2.jpg;http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_4_0_3.jpg'', ''500克'', NULL, 168000, NULL, 0, 45000, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_4_0_41.jpg\''></div><div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_4_0_42.jpg\''></div><div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_4_0_43.jpg\''></div><div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_4_0_44.jpg\''></div><div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_4_0_45.jpg\''></div>'', 100, 100, 3, 0, -1, 10, 1, 1, ''2018-04-26 10:59:21'', 1, 4, 0),
	(293, ''2018-04-26'', ''2018-05-31 17:50:55'', ''熟普茶饼'', ''嫩芽春焙 高端熟普'', ''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_5_0_1.jpg;http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_5_0_2.jpg;http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_5_0_3.jpg'', ''359克'', NULL, 88000, NULL, 0, 20000, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_5_0_41.jpg\''></div><div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_5_0_42.jpg\''></div><div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_5_0_43.jpg\''></div>'', 100, 100, 3, 0, -1, 10, 1, 1, ''2018-04-26 10:59:21'', 1, 5, 0),
	(294, ''2018-04-26'', ''2018-05-31 17:50:55'', ''生普茶饼'', ''布朗山大叶底晒青毛茶'', ''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_6_0_1.jpg;http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_6_0_2.jpg;http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_6_0_3.jpg'', ''357克'', NULL, 88000, NULL, 0, 26000, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_6_0_41.jpg\''></div><div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_6_0_42.jpg\''></div><div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_6_0_43.jpg\''></div>'', 100, 100, 3, 0, -1, 10, 1, 1, ''2018-04-26 10:59:21'', 1, 6, 0),
	(295, ''2018-04-26'', ''2018-05-31 17:50:55'', ''野生红茶'', ''世界三大高香名茶之一'', ''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_7_0_1.jpg;http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_7_0_2.jpg;http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_7_0_3.jpg'', ''500克'', NULL, 38000, NULL, 0, 6000, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_7_0_41.jpg\''></div><div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_7_0_42.jpg\''></div><div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_7_0_43.jpg\''></div>'', 100, 100, 3, 0, -1, 10, 1, 1, ''2018-04-26 10:59:21'', 1, 7, 0),
	(296, ''2018-04-26'', ''2018-05-31 17:50:55'', ''毛尖'', ''芽叶细嫩，色翠香幽，味醇形美'', ''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_8_0_1.jpg;http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_8_0_2.jpg;http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_8_0_3.jpg'', ''500克'', NULL, 98000, NULL, 0, 29000, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_8_0_41.jpg\''></div><div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_8_0_42.jpg\''></div><div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_8_0_43.jpg\''></div>'', 100, 100, 3, 0, -1, 10, 1, 1, ''2018-04-26 10:59:21'', 1, 8, 0),
	(297, ''2018-04-26'', ''2018-05-31 17:50:55'', ''白牡丹茶饼'', ''一芽两叶，里外一口料，兰花香味'', ''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_9_0_1.jpg;http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_9_0_2.jpg;http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_9_0_3.jpg'', ''364克'', NULL, 78000, NULL, 0, 18000, -1, NULL, NULL, 0, 0, 1, ''<div><img src=\''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0426/20_9_0_41.jpg\''></div>'', 100, 100, 3, 0, -1, 10, 1, 1, ''2018-04-26 10:59:21'', 1, 9, 0),
	(2001, ''2018-04-17'', ''2018-05-31 17:50:55'', ''5元直减券'', ''限时购等详情页标注不可用券的商品除外'', ''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stlive/coupon/djq.jpg'', '''', NULL, 500, NULL, 0, 0, -1, NULL, NULL, 500, 0, 2, NULL, 100, 100, 3, 0, -1, 10, 11, 3, ''2018-04-17 13:54:19'', 1, 3, 0),
	(2002, ''2018-04-17'', ''2018-05-31 17:50:55'', ''10元直减券'', ''限时购等详情页标注不可用券的商品除外'', ''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stlive/coupon/djq.jpg'', '''', NULL, 1000, NULL, 0, 0, -1, NULL, NULL, 1000, 0, 2, NULL, 100, 100, 3, 0, -1, 10, 11, 3, ''2018-04-17 13:54:19'', 1, 3, 0),
	(2003, ''2018-04-17'', ''2018-05-31 17:50:55'', ''50元直减券'', ''限时购等详情页标注不可用券的商品除外'', ''http://qbbfile.oss-cn-hangzhou.aliyuncs.com/stlive/coupon/djq.jpg'', '''', NULL, 5000, NULL, 0, 0, -1, NULL, NULL, 5000, 0, 2, NULL, 100, 100, 3, 0, -1, 10, 11, 3, ''2018-04-17 13:54:19'', 1, 3, 0),
	(2004, ''2018-05-31'', ''2018-05-31 17:50:55'', ''云南红茶（滇红）'', ''花香蜜韵，汤带金圈'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/22_1_0_1.jpg'', NULL, NULL, 68000, NULL, 0, 30000, -1, NULL, NULL, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/22_1_0_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/22_1_0_42.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-05-31 09:47:39'', 1, 1, 0),
	(2005, ''2018-05-31'', ''2018-05-31 17:50:55'', ''祁门红茶'', ''红艳鲜润，独具祁门香'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/22_2_0_1.jpg'', NULL, NULL, 68000, NULL, 0, 35000, -1, NULL, NULL, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/22_2_0_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/22_2_0_42.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-05-31 09:47:39'', 1, 2, 0),
	(2006, ''2018-05-31'', ''2018-05-31 17:50:55'', ''正山小种'', ''枣蜜花香，回甘持久'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/22_3_0_1.jpg'', NULL, NULL, 58000, NULL, 0, 22000, -1, NULL, NULL, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/22_3_0_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/22_3_0_42.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-05-31 09:47:39'', 1, 3, 0),
	(2007, ''2018-05-31'', ''2018-06-13 18:06:12'', ''野生红茶'', ''世界三大高香名茶之一'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/22_4_0_1.jpg'', NULL, NULL, 58000, NULL, 0, 23000, -1, NULL, NULL, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/22_4_0_41.jpg\''></div>'', 99, 100, 1, 0, -1, 10, 1, 1, ''2018-05-31 09:47:39'', 1, 4, 0),
	(2008, ''2018-05-31'', ''2018-05-31 17:50:55'', ''银骏眉'', ''遵循自然古法，尊重每一片茶叶，遵从自己内心的发声'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/22_5_0_1.jpg'', NULL, NULL, 38000, NULL, 0, 18000, -1, NULL, NULL, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/22_5_0_41.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-05-31 09:47:39'', 1, 5, 0),
	(2009, ''2018-05-31'', ''2018-05-31 17:50:55'', ''金骏眉'', ''色泽乌润，滋味醇厚'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/22_6_0_1.jpg'', NULL, NULL, 58000, NULL, 0, 22000, -1, NULL, NULL, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/22_6_0_41.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-05-31 09:47:39'', 1, 6, 0),
	(2010, ''2018-05-31'', ''2018-05-31 17:50:55'', ''安吉白茶'', ''新茶，明前特级，安吉溪龙核心产区'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/23_1_0_1.jpg'', NULL, NULL, 118000, NULL, 0, 60000, -1, NULL, NULL, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/23_1_0_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/23_1_0_42.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-05-31 09:49:53'', 1, 1, 0),
	(2011, ''2018-05-31'', ''2018-05-31 17:50:55'', ''龙井'', ''2018新茶，梅家坞产区、品质自饮'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/23_2_0_1.jpg'', NULL, NULL, 168000, NULL, 0, 85000, -1, NULL, NULL, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/23_2_0_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/23_2_0_42.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-05-31 09:49:53'', 1, 2, 0),
	(2012, ''2018-05-31'', ''2018-05-31 17:50:55'', ''特级贡芽茶'', ''形似寿眉，银毫披露，绿中透翠'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/23_3_0_1.jpg'', NULL, NULL, 68000, NULL, 0, 30000, -1, NULL, NULL, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/23_3_0_41.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-05-31 09:49:53'', 1, 3, 0),
	(2013, ''2018-05-31'', ''2018-05-31 17:50:55'', ''三杯香绿茶'', ''山韵鲜明，香高味醇'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/23_4_0_1.jpg'', NULL, NULL, 18000, NULL, 0, 8000, -1, NULL, NULL, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/23_4_0_41.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-05-31 09:49:53'', 1, 4, 0),
	(2014, ''2018-05-31'', ''2018-05-31 17:50:55'', ''五峰毛尖'', ''特级高山茶日照充足'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/23_5_0_1.jpg'', NULL, NULL, 68000, NULL, 0, 26000, -1, NULL, NULL, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/23_5_0_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/23_5_0_42.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-05-31 09:49:53'', 1, 5, 0),
	(2015, ''2018-05-31'', ''2018-05-31 17:50:55'', ''信阳毛尖'', ''叶枝茂盛，芽叶肥厚'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/23_6_0_1.jpg'', NULL, NULL, 118000, NULL, 0, 63000, -1, NULL, NULL, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/23_6_0_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/23_6_0_42.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-05-31 09:49:53'', 1, 6, 0),
	(2016, ''2018-05-31'', ''2018-05-31 17:50:55'', ''茉莉花茶'', ''窨花入茶，清绝馥郁'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/24_1_0_1.jpg'', NULL, NULL, 68000, NULL, 0, 20000, -1, NULL, NULL, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/24_1_0_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/24_1_0_42.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-05-31 09:51:26'', 1, 1, 0),
	(2017, ''2018-05-31'', ''2018-05-31 17:50:55'', ''杭白菊花茶'', ''在树林深处品茶，静下来思考，非淡泊无以明志，方宁静才能致远'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/24_2_0_1.jpg'', NULL, NULL, 18000, NULL, 0, 10000, -1, NULL, NULL, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/24_2_0_41.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-05-31 09:51:26'', 1, 2, 0),
	(2018, ''2018-05-31'', ''2018-05-31 17:50:55'', ''玫瑰花茶'', ''花蕾紧致娇俏，花朵散发烂漫甜香，优雅迷人'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/24_3_0_1.jpg'', NULL, NULL, 36000, NULL, 0, 18000, -1, NULL, NULL, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/24_3_0_41.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-05-31 09:51:26'', 1, 3, 0),
	(2019, ''2018-05-31'', ''2018-05-31 17:50:55'', ''茉莉龙珠'', ''花香自然，冰糖甜香，鲜爽耐泡'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/24_4_0_1.jpg'', NULL, NULL, 58000, NULL, 0, 20000, -1, NULL, NULL, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/24_4_0_41.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-05-31 09:51:26'', 1, 4, 0),
	(2020, ''2018-05-31'', ''2018-05-31 17:50:55'', ''婺源黄菊'', ''来自美丽乡村的馈赠'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/24_5_0_1.jpg'', NULL, NULL, 118000, NULL, 0, 55000, -1, NULL, NULL, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/24_5_0_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/24_5_0_42.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-05-31 09:51:26'', 1, 5, 0),
	(2021, ''2018-05-31'', ''2018-05-31 17:50:55'', ''野菊花'', ''精心炒制，品质放心'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/24_6_0_1.jpg'', NULL, NULL, 18000, NULL, 0, 9000, -1, NULL, NULL, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0531/24_6_0_41.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-05-31 09:51:26'', 1, 6, 0),
	(2022, ''2018-05-07'', ''2018-05-31 17:50:55'', ''羊脂玉白紫金线茶具套装'', ''景德镇白瓷，手工制作'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0507/21_1_0_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0507/21_1_0_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0507/21_1_0_3.jpg'', ''6件装'', NULL, 78000, NULL, 0, 34000, -1, NULL, NULL, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0507/21_1_0_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0507/21_1_0_42.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-05-07 17:34:18'', 1, 1, 0),
	(2023, ''2018-05-07'', ''2018-05-31 17:50:55'', ''德钟壶紫砂玉白茶具套装'', ''随身茶空间，随心泡好茶'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0507/21_2_0_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0507/21_2_0_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0507/21_2_0_3.jpg'', ''10件装'', NULL, 118000, NULL, 0, 80000, -1, NULL, NULL, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0507/21_2_0_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0507/21_2_0_42.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0507/21_2_0_43.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0507/21_2_0_44.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0507/21_2_0_45.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-05-07 17:34:18'', 1, 2, 0),
	(2024, ''2018-05-07'', ''2018-05-31 17:50:55'', ''功夫茶具套装'', ''小巧精致，光亮清澈'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0507/21_3_0_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0507/21_3_0_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0507/21_3_0_3.jpg'', ''1壶4杯'', NULL, 28000, NULL, 0, 10000, -1, NULL, NULL, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0507/21_3_0_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0507/21_3_0_42.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0507/21_3_0_43.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-05-07 17:34:18'', 1, 3, 0),
	(2025, ''2018-05-07'', ''2018-05-31 17:50:55'', ''茶漏、搅拌棍'', ''泡茶咖啡蜂蜜好伴侣'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0507/21_4_0_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0507/21_4_0_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0507/21_4_0_3.jpg'', ''2件套'', NULL, 8000, NULL, 0, 2000, -1, NULL, NULL, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0507/21_4_0_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0507/21_4_0_42.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0507/21_4_0_43.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-05-07 17:34:18'', 1, 4, 0),
	(2026, ''2018-05-08'', ''2018-06-07 18:03:15'', ''黑苦荞胚芽茶'', ''胚芽入茶，营养健康'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_1_0_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_1_0_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_1_0_3.jpg'', ''6克21袋'', NULL, 6000, NULL, 0, 2000, -1, 5000, 2, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_1_0_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_1_0_42.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_1_0_43.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_1_0_44.jpg\''></div>'', 101, 100, 1, 0, -1, 10, 4, 1, ''2018-05-08 12:12:14'', 1, 1, 0),
	(2027, ''2018-05-08'', ''2018-07-30 11:43:48'', ''麦香乌龙茶(岩茶)'', ''麦香厚重，茶韵甘醇'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_2_0_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_2_0_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_2_0_3.jpg'', ''3克10袋'', NULL, 6000, NULL, 0, 2000, 6000, NULL, NULL, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_2_0_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_2_0_42.jpg\''></div>'', 96, 100, 1, 0, -1, 10, 1, 1, ''2018-05-08 12:12:14'', 1, 2, 0),
	(2028, ''2018-05-08'', ''2018-07-27 12:08:37'', ''桂花大麦茶'', ''悠悠麦香，浓情金桂'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_3_0_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_3_0_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_3_0_3.jpg'', ''10克10袋'', NULL, 6000, NULL, 0, 2000, -1, NULL, NULL, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_3_0_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_3_0_42.jpg\''></div>'', 99, 100, 1, 0, -1, 10, 1, 1, ''2018-05-08 12:12:14'', 1, 3, 0),
	(2029, ''2018-05-08'', ''2018-05-31 17:50:55'', ''玫瑰红茶'', ''杯中玛瑙色，舌底玫瑰香'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_4_0_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_4_0_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_4_0_3.jpg'', ''3克10袋'', NULL, 6000, NULL, 0, 2000, -1, NULL, NULL, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_4_0_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_4_0_42.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-05-08 12:12:14'', 1, 4, 0),
	(2030, ''2018-05-08'', ''2018-08-01 12:00:49'', ''胎菊'', ''桐乡胎菊，上品花茶'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_5_0_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_5_0_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_5_0_3.jpg'', ''50克1袋'', NULL, 6000, NULL, 0, 2000, -1, NULL, NULL, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_5_0_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_5_0_42.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-05-08 12:12:14'', 1, 5, 0),
	(2031, ''2018-05-08'', ''2018-05-31 17:50:55'', ''六和茶'', ''取六和养分，营养均衡'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_6_0_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_6_0_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_6_0_3.jpg'', ''10克10袋'', NULL, 6000, NULL, 0, 3000, -1, NULL, NULL, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_6_0_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_6_0_42.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-05-08 12:12:14'', 1, 6, 0),
	(2032, ''2018-05-08'', ''2018-05-31 17:50:55'', ''草莓白茶'', ''标题-调茶大师独特配方'', ''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_7_0_1.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_7_0_2.jpg;http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_7_0_3.jpg'', ''2.2克10袋'', NULL, 6000, NULL, 0, 3000, -1, NULL, NULL, NULL, NULL, 1, ''<div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_7_0_41.jpg\''></div><div><img src=\''http://myshop188.oss-cn-hangzhou.aliyuncs.com/stmall/2018/0508/19_7_0_42.jpg\''></div>'', 100, 100, 1, 0, -1, 10, 1, 1, ''2018-05-08 12:12:14'', 1, 7, 0);
/*!40000 ALTER TABLE `stm_goods` ENABLE KEYS */;

-- 导出  表 stadmin.stm_goods_classify 结构
CREATE TABLE IF NOT EXISTS `stm_goods_classify` (
  `seq_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT ''更新时间'',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT ''创建时间'',
  `name` varchar(50) DEFAULT NULL COMMENT ''分类名称'',
  `data_order` int(11) DEFAULT NULL COMMENT ''正向排序'',
  `is_del` tinyint(4) DEFAULT ''0'',
  PRIMARY KEY (`seq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1015 DEFAULT CHARSET=utf8mb4 COMMENT=''商品分类'';

-- 正在导出表  stadmin.stm_goods_classify 的数据：~7 rows (大约)
DELETE FROM `stm_goods_classify`;
/*!40000 ALTER TABLE `stm_goods_classify` DISABLE KEYS */;
INSERT INTO `stm_goods_classify` (`seq_id`, `update_time`, `create_time`, `name`, `data_order`, `is_del`) VALUES
	(1007, ''2018-08-06 18:16:22'', ''2018-08-06 17:05:10'', ''食品'', 5, 0),
	(1009, ''2018-08-06 18:02:22'', ''2018-08-06 17:41:31'', ''水果'', 1, 1),
	(1010, ''2018-08-06 17:41:31'', ''2018-08-06 17:41:31'', ''水果'', 1, 0),
	(1011, ''2018-08-06 18:02:18'', ''2018-08-06 17:41:51'', ''look1'', 3, 1),
	(1012, ''2018-08-07 11:50:17'', ''2018-08-06 17:41:51'', ''电器'', 3, 0),
	(1013, ''2018-08-07 15:26:59'', ''2018-08-07 15:26:59'', ''化妆'', 3, 0),
	(1014, ''2018-08-08 18:20:11'', ''2018-08-08 18:20:11'', '' 3C   产品'', 5, 0);
/*!40000 ALTER TABLE `stm_goods_classify` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '''') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
