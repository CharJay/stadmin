#添加默认字段
DROP PROCEDURE IF EXISTS tmp_add_def_col;
DELIMITER //
CREATE PROCEDURE tmp_add_def_col() BEGIN
DECLARE  cdb VARCHAR(100);
SELECT DATABASE() INTO cdb;

IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_login_log' AND column_name = 'CREATE_TIME') THEN
ALTER TABLE `sys_login_log`	ADD COLUMN `CREATE_TIME`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_login_log' AND column_name = 'CREATE_USER_ID') THEN
ALTER TABLE `sys_login_log`	ADD COLUMN `CREATE_USER_ID`  BIGINT(20) NULL DEFAULT NULL COMMENT '创建人ID' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_login_log' AND column_name = 'CREATE_USER_NAME') THEN
ALTER TABLE `sys_login_log`	ADD COLUMN `CREATE_USER_NAME`  VARCHAR(50) NULL DEFAULT NULL COMMENT '创建人名称' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_login_log' AND column_name = 'UPDATE_TIME') THEN
ALTER TABLE `sys_login_log`	ADD COLUMN `UPDATE_TIME`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_login_log' AND column_name = 'UPDATE_USER_ID') THEN
ALTER TABLE `sys_login_log`	ADD COLUMN `UPDATE_USER_ID`  BIGINT(20) NULL DEFAULT NULL COMMENT '修改人ID' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_login_log' AND column_name = 'UPDATE_USER_NAME') THEN
ALTER TABLE `sys_login_log`	ADD COLUMN `UPDATE_USER_NAME`  VARCHAR(50) NULL DEFAULT NULL COMMENT '修改人名称' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_login_log' AND column_name = 'IS_DEL') THEN
ALTER TABLE `sys_login_log`	ADD COLUMN `IS_DEL`  INT(11) NOT NULL DEFAULT '1' COMMENT '是否删除' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_login_log' AND column_name = 'DATA_ORDER') THEN
ALTER TABLE `sys_login_log`	ADD COLUMN `DATA_ORDER`  INT(11) NOT NULL DEFAULT '0' COMMENT '排序' ;
END IF;



IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_portal' AND column_name = 'CREATE_TIME') THEN
ALTER TABLE `sys_portal`	ADD COLUMN `CREATE_TIME`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_portal' AND column_name = 'CREATE_USER_ID') THEN
ALTER TABLE `sys_portal`	ADD COLUMN `CREATE_USER_ID`  BIGINT(20) NULL DEFAULT NULL COMMENT '创建人ID' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_portal' AND column_name = 'CREATE_USER_NAME') THEN
ALTER TABLE `sys_portal`	ADD COLUMN `CREATE_USER_NAME`  VARCHAR(50) NULL DEFAULT NULL COMMENT '创建人名称' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_portal' AND column_name = 'UPDATE_TIME') THEN
ALTER TABLE `sys_portal`	ADD COLUMN `UPDATE_TIME`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_portal' AND column_name = 'UPDATE_USER_ID') THEN
ALTER TABLE `sys_portal`	ADD COLUMN `UPDATE_USER_ID`  BIGINT(20) NULL DEFAULT NULL COMMENT '修改人ID' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_portal' AND column_name = 'UPDATE_USER_NAME') THEN
ALTER TABLE `sys_portal`	ADD COLUMN `UPDATE_USER_NAME`  VARCHAR(50) NULL DEFAULT NULL COMMENT '修改人名称' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_portal' AND column_name = 'IS_DEL') THEN
ALTER TABLE `sys_portal`	ADD COLUMN `IS_DEL`  INT(11) NOT NULL DEFAULT '1' COMMENT '是否删除' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_portal' AND column_name = 'DATA_ORDER') THEN
ALTER TABLE `sys_portal`	ADD COLUMN `DATA_ORDER`  INT(11) NOT NULL DEFAULT '0' COMMENT '排序' ;
END IF;



IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_role' AND column_name = 'CREATE_TIME') THEN
ALTER TABLE `sys_role`	ADD COLUMN `CREATE_TIME`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_role' AND column_name = 'CREATE_USER_ID') THEN
ALTER TABLE `sys_role`	ADD COLUMN `CREATE_USER_ID`  BIGINT(20) NULL DEFAULT NULL COMMENT '创建人ID' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_role' AND column_name = 'CREATE_USER_NAME') THEN
ALTER TABLE `sys_role`	ADD COLUMN `CREATE_USER_NAME`  VARCHAR(50) NULL DEFAULT NULL COMMENT '创建人名称' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_role' AND column_name = 'UPDATE_TIME') THEN
ALTER TABLE `sys_role`	ADD COLUMN `UPDATE_TIME`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_role' AND column_name = 'UPDATE_USER_ID') THEN
ALTER TABLE `sys_role`	ADD COLUMN `UPDATE_USER_ID`  BIGINT(20) NULL DEFAULT NULL COMMENT '修改人ID' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_role' AND column_name = 'UPDATE_USER_NAME') THEN
ALTER TABLE `sys_role`	ADD COLUMN `UPDATE_USER_NAME`  VARCHAR(50) NULL DEFAULT NULL COMMENT '修改人名称' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_role' AND column_name = 'IS_DEL') THEN
ALTER TABLE `sys_role`	ADD COLUMN `IS_DEL`  INT(11) NOT NULL DEFAULT '1' COMMENT '是否删除' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_role' AND column_name = 'DATA_ORDER') THEN
ALTER TABLE `sys_role`	ADD COLUMN `DATA_ORDER`  INT(11) NOT NULL DEFAULT '0' COMMENT '排序' ;
END IF;



IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_autho' AND column_name = 'CREATE_TIME') THEN
ALTER TABLE `sys_autho`	ADD COLUMN `CREATE_TIME`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_autho' AND column_name = 'CREATE_USER_ID') THEN
ALTER TABLE `sys_autho`	ADD COLUMN `CREATE_USER_ID`  BIGINT(20) NULL DEFAULT NULL COMMENT '创建人ID' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_autho' AND column_name = 'CREATE_USER_NAME') THEN
ALTER TABLE `sys_autho`	ADD COLUMN `CREATE_USER_NAME`  VARCHAR(50) NULL DEFAULT NULL COMMENT '创建人名称' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_autho' AND column_name = 'UPDATE_TIME') THEN
ALTER TABLE `sys_autho`	ADD COLUMN `UPDATE_TIME`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_autho' AND column_name = 'UPDATE_USER_ID') THEN
ALTER TABLE `sys_autho`	ADD COLUMN `UPDATE_USER_ID`  BIGINT(20) NULL DEFAULT NULL COMMENT '修改人ID' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_autho' AND column_name = 'UPDATE_USER_NAME') THEN
ALTER TABLE `sys_autho`	ADD COLUMN `UPDATE_USER_NAME`  VARCHAR(50) NULL DEFAULT NULL COMMENT '修改人名称' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_autho' AND column_name = 'IS_DEL') THEN
ALTER TABLE `sys_autho`	ADD COLUMN `IS_DEL`  INT(11) NOT NULL DEFAULT '1' COMMENT '是否删除' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_autho' AND column_name = 'DATA_ORDER') THEN
ALTER TABLE `sys_autho`	ADD COLUMN `DATA_ORDER`  INT(11) NOT NULL DEFAULT '0' COMMENT '排序' ;
END IF;



IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_role_has_autho' AND column_name = 'CREATE_TIME') THEN
ALTER TABLE `sys_role_has_autho`	ADD COLUMN `CREATE_TIME`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_role_has_autho' AND column_name = 'CREATE_USER_ID') THEN
ALTER TABLE `sys_role_has_autho`	ADD COLUMN `CREATE_USER_ID`  BIGINT(20) NULL DEFAULT NULL COMMENT '创建人ID' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_role_has_autho' AND column_name = 'CREATE_USER_NAME') THEN
ALTER TABLE `sys_role_has_autho`	ADD COLUMN `CREATE_USER_NAME`  VARCHAR(50) NULL DEFAULT NULL COMMENT '创建人名称' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_role_has_autho' AND column_name = 'UPDATE_TIME') THEN
ALTER TABLE `sys_role_has_autho`	ADD COLUMN `UPDATE_TIME`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_role_has_autho' AND column_name = 'UPDATE_USER_ID') THEN
ALTER TABLE `sys_role_has_autho`	ADD COLUMN `UPDATE_USER_ID`  BIGINT(20) NULL DEFAULT NULL COMMENT '修改人ID' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_role_has_autho' AND column_name = 'UPDATE_USER_NAME') THEN
ALTER TABLE `sys_role_has_autho`	ADD COLUMN `UPDATE_USER_NAME`  VARCHAR(50) NULL DEFAULT NULL COMMENT '修改人名称' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_role_has_autho' AND column_name = 'IS_DEL') THEN
ALTER TABLE `sys_role_has_autho`	ADD COLUMN `IS_DEL`  INT(11) NOT NULL DEFAULT '1' COMMENT '是否删除' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_role_has_autho' AND column_name = 'DATA_ORDER') THEN
ALTER TABLE `sys_role_has_autho`	ADD COLUMN `DATA_ORDER`  INT(11) NOT NULL DEFAULT '0' COMMENT '排序' ;
END IF;



IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_admin' AND column_name = 'CREATE_TIME') THEN
ALTER TABLE `sys_admin`	ADD COLUMN `CREATE_TIME`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_admin' AND column_name = 'CREATE_USER_ID') THEN
ALTER TABLE `sys_admin`	ADD COLUMN `CREATE_USER_ID`  BIGINT(20) NULL DEFAULT NULL COMMENT '创建人ID' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_admin' AND column_name = 'CREATE_USER_NAME') THEN
ALTER TABLE `sys_admin`	ADD COLUMN `CREATE_USER_NAME`  VARCHAR(50) NULL DEFAULT NULL COMMENT '创建人名称' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_admin' AND column_name = 'UPDATE_TIME') THEN
ALTER TABLE `sys_admin`	ADD COLUMN `UPDATE_TIME`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_admin' AND column_name = 'UPDATE_USER_ID') THEN
ALTER TABLE `sys_admin`	ADD COLUMN `UPDATE_USER_ID`  BIGINT(20) NULL DEFAULT NULL COMMENT '修改人ID' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_admin' AND column_name = 'UPDATE_USER_NAME') THEN
ALTER TABLE `sys_admin`	ADD COLUMN `UPDATE_USER_NAME`  VARCHAR(50) NULL DEFAULT NULL COMMENT '修改人名称' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_admin' AND column_name = 'IS_DEL') THEN
ALTER TABLE `sys_admin`	ADD COLUMN `IS_DEL`  INT(11) NOT NULL DEFAULT '1' COMMENT '是否删除' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_admin' AND column_name = 'DATA_ORDER') THEN
ALTER TABLE `sys_admin`	ADD COLUMN `DATA_ORDER`  INT(11) NOT NULL DEFAULT '0' COMMENT '排序' ;
END IF;



IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_org' AND column_name = 'CREATE_TIME') THEN
ALTER TABLE `sys_org`	ADD COLUMN `CREATE_TIME`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_org' AND column_name = 'CREATE_USER_ID') THEN
ALTER TABLE `sys_org`	ADD COLUMN `CREATE_USER_ID`  BIGINT(20) NULL DEFAULT NULL COMMENT '创建人ID' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_org' AND column_name = 'CREATE_USER_NAME') THEN
ALTER TABLE `sys_org`	ADD COLUMN `CREATE_USER_NAME`  VARCHAR(50) NULL DEFAULT NULL COMMENT '创建人名称' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_org' AND column_name = 'UPDATE_TIME') THEN
ALTER TABLE `sys_org`	ADD COLUMN `UPDATE_TIME`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_org' AND column_name = 'UPDATE_USER_ID') THEN
ALTER TABLE `sys_org`	ADD COLUMN `UPDATE_USER_ID`  BIGINT(20) NULL DEFAULT NULL COMMENT '修改人ID' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_org' AND column_name = 'UPDATE_USER_NAME') THEN
ALTER TABLE `sys_org`	ADD COLUMN `UPDATE_USER_NAME`  VARCHAR(50) NULL DEFAULT NULL COMMENT '修改人名称' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_org' AND column_name = 'IS_DEL') THEN
ALTER TABLE `sys_org`	ADD COLUMN `IS_DEL`  INT(11) NOT NULL DEFAULT '1' COMMENT '是否删除' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_org' AND column_name = 'DATA_ORDER') THEN
ALTER TABLE `sys_org`	ADD COLUMN `DATA_ORDER`  INT(11) NOT NULL DEFAULT '0' COMMENT '排序' ;
END IF;



IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_user_has_role' AND column_name = 'CREATE_TIME') THEN
ALTER TABLE `sys_user_has_role`	ADD COLUMN `CREATE_TIME`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_user_has_role' AND column_name = 'CREATE_USER_ID') THEN
ALTER TABLE `sys_user_has_role`	ADD COLUMN `CREATE_USER_ID`  BIGINT(20) NULL DEFAULT NULL COMMENT '创建人ID' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_user_has_role' AND column_name = 'CREATE_USER_NAME') THEN
ALTER TABLE `sys_user_has_role`	ADD COLUMN `CREATE_USER_NAME`  VARCHAR(50) NULL DEFAULT NULL COMMENT '创建人名称' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_user_has_role' AND column_name = 'UPDATE_TIME') THEN
ALTER TABLE `sys_user_has_role`	ADD COLUMN `UPDATE_TIME`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_user_has_role' AND column_name = 'UPDATE_USER_ID') THEN
ALTER TABLE `sys_user_has_role`	ADD COLUMN `UPDATE_USER_ID`  BIGINT(20) NULL DEFAULT NULL COMMENT '修改人ID' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_user_has_role' AND column_name = 'UPDATE_USER_NAME') THEN
ALTER TABLE `sys_user_has_role`	ADD COLUMN `UPDATE_USER_NAME`  VARCHAR(50) NULL DEFAULT NULL COMMENT '修改人名称' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_user_has_role' AND column_name = 'IS_DEL') THEN
ALTER TABLE `sys_user_has_role`	ADD COLUMN `IS_DEL`  INT(11) NOT NULL DEFAULT '1' COMMENT '是否删除' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_user_has_role' AND column_name = 'DATA_ORDER') THEN
ALTER TABLE `sys_user_has_role`	ADD COLUMN `DATA_ORDER`  INT(11) NOT NULL DEFAULT '0' COMMENT '排序' ;
END IF;



IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_dict_data' AND column_name = 'CREATE_TIME') THEN
ALTER TABLE `sys_dict_data`	ADD COLUMN `CREATE_TIME`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_dict_data' AND column_name = 'CREATE_USER_ID') THEN
ALTER TABLE `sys_dict_data`	ADD COLUMN `CREATE_USER_ID`  BIGINT(20) NULL DEFAULT NULL COMMENT '创建人ID' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_dict_data' AND column_name = 'CREATE_USER_NAME') THEN
ALTER TABLE `sys_dict_data`	ADD COLUMN `CREATE_USER_NAME`  VARCHAR(50) NULL DEFAULT NULL COMMENT '创建人名称' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_dict_data' AND column_name = 'UPDATE_TIME') THEN
ALTER TABLE `sys_dict_data`	ADD COLUMN `UPDATE_TIME`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_dict_data' AND column_name = 'UPDATE_USER_ID') THEN
ALTER TABLE `sys_dict_data`	ADD COLUMN `UPDATE_USER_ID`  BIGINT(20) NULL DEFAULT NULL COMMENT '修改人ID' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_dict_data' AND column_name = 'UPDATE_USER_NAME') THEN
ALTER TABLE `sys_dict_data`	ADD COLUMN `UPDATE_USER_NAME`  VARCHAR(50) NULL DEFAULT NULL COMMENT '修改人名称' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_dict_data' AND column_name = 'IS_DEL') THEN
ALTER TABLE `sys_dict_data`	ADD COLUMN `IS_DEL`  INT(11) NOT NULL DEFAULT '1' COMMENT '是否删除' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_dict_data' AND column_name = 'DATA_ORDER') THEN
ALTER TABLE `sys_dict_data`	ADD COLUMN `DATA_ORDER`  INT(11) NOT NULL DEFAULT '0' COMMENT '排序' ;
END IF;



IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_token' AND column_name = 'CREATE_TIME') THEN
ALTER TABLE `sys_token`	ADD COLUMN `CREATE_TIME`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_token' AND column_name = 'CREATE_USER_ID') THEN
ALTER TABLE `sys_token`	ADD COLUMN `CREATE_USER_ID`  BIGINT(20) NULL DEFAULT NULL COMMENT '创建人ID' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_token' AND column_name = 'CREATE_USER_NAME') THEN
ALTER TABLE `sys_token`	ADD COLUMN `CREATE_USER_NAME`  VARCHAR(50) NULL DEFAULT NULL COMMENT '创建人名称' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_token' AND column_name = 'UPDATE_TIME') THEN
ALTER TABLE `sys_token`	ADD COLUMN `UPDATE_TIME`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_token' AND column_name = 'UPDATE_USER_ID') THEN
ALTER TABLE `sys_token`	ADD COLUMN `UPDATE_USER_ID`  BIGINT(20) NULL DEFAULT NULL COMMENT '修改人ID' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_token' AND column_name = 'UPDATE_USER_NAME') THEN
ALTER TABLE `sys_token`	ADD COLUMN `UPDATE_USER_NAME`  VARCHAR(50) NULL DEFAULT NULL COMMENT '修改人名称' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_token' AND column_name = 'IS_DEL') THEN
ALTER TABLE `sys_token`	ADD COLUMN `IS_DEL`  INT(11) NOT NULL DEFAULT '1' COMMENT '是否删除' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_token' AND column_name = 'DATA_ORDER') THEN
ALTER TABLE `sys_token`	ADD COLUMN `DATA_ORDER`  INT(11) NOT NULL DEFAULT '0' COMMENT '排序' ;
END IF;



IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_org_has_user' AND column_name = 'CREATE_TIME') THEN
ALTER TABLE `sys_org_has_user`	ADD COLUMN `CREATE_TIME`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_org_has_user' AND column_name = 'CREATE_USER_ID') THEN
ALTER TABLE `sys_org_has_user`	ADD COLUMN `CREATE_USER_ID`  BIGINT(20) NULL DEFAULT NULL COMMENT '创建人ID' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_org_has_user' AND column_name = 'CREATE_USER_NAME') THEN
ALTER TABLE `sys_org_has_user`	ADD COLUMN `CREATE_USER_NAME`  VARCHAR(50) NULL DEFAULT NULL COMMENT '创建人名称' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_org_has_user' AND column_name = 'UPDATE_TIME') THEN
ALTER TABLE `sys_org_has_user`	ADD COLUMN `UPDATE_TIME`  DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_org_has_user' AND column_name = 'UPDATE_USER_ID') THEN
ALTER TABLE `sys_org_has_user`	ADD COLUMN `UPDATE_USER_ID`  BIGINT(20) NULL DEFAULT NULL COMMENT '修改人ID' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_org_has_user' AND column_name = 'UPDATE_USER_NAME') THEN
ALTER TABLE `sys_org_has_user`	ADD COLUMN `UPDATE_USER_NAME`  VARCHAR(50) NULL DEFAULT NULL COMMENT '修改人名称' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_org_has_user' AND column_name = 'IS_DEL') THEN
ALTER TABLE `sys_org_has_user`	ADD COLUMN `IS_DEL`  INT(11) NOT NULL DEFAULT '1' COMMENT '是否删除' ;
END IF;
IF NOT EXISTS (SELECT * FROM information_schema.columns WHERE table_schema=cdb and table_name = 'sys_org_has_user' AND column_name = 'DATA_ORDER') THEN
ALTER TABLE `sys_org_has_user`	ADD COLUMN `DATA_ORDER`  INT(11) NOT NULL DEFAULT '0' COMMENT '排序' ;
END IF;





update sys_login_log set CREATE_TIME = now() where CREATE_TIME is null;
update sys_login_log set CREATE_USER_ID = -1 where CREATE_USER_ID is null;
update sys_login_log set CREATE_USER_NAME = '-1' where CREATE_USER_NAME is null;
update sys_login_log set UPDATE_TIME = now() where UPDATE_TIME is null;
update sys_login_log set UPDATE_USER_ID = -1 where UPDATE_USER_ID is null;
update sys_login_log set UPDATE_USER_NAME = '-1' where UPDATE_USER_NAME is null;
update sys_login_log set IS_DEL = 1 where IS_DEL is null;
update sys_login_log set DATA_ORDER = 0 where DATA_ORDER is null;


update sys_portal set CREATE_TIME = now() where CREATE_TIME is null;
update sys_portal set CREATE_USER_ID = -1 where CREATE_USER_ID is null;
update sys_portal set CREATE_USER_NAME = '-1' where CREATE_USER_NAME is null;
update sys_portal set UPDATE_TIME = now() where UPDATE_TIME is null;
update sys_portal set UPDATE_USER_ID = -1 where UPDATE_USER_ID is null;
update sys_portal set UPDATE_USER_NAME = '-1' where UPDATE_USER_NAME is null;
update sys_portal set IS_DEL = 1 where IS_DEL is null;
update sys_portal set DATA_ORDER = 0 where DATA_ORDER is null;


update sys_role set CREATE_TIME = now() where CREATE_TIME is null;
update sys_role set CREATE_USER_ID = -1 where CREATE_USER_ID is null;
update sys_role set CREATE_USER_NAME = '-1' where CREATE_USER_NAME is null;
update sys_role set UPDATE_TIME = now() where UPDATE_TIME is null;
update sys_role set UPDATE_USER_ID = -1 where UPDATE_USER_ID is null;
update sys_role set UPDATE_USER_NAME = '-1' where UPDATE_USER_NAME is null;
update sys_role set IS_DEL = 1 where IS_DEL is null;
update sys_role set DATA_ORDER = 0 where DATA_ORDER is null;


update sys_autho set CREATE_TIME = now() where CREATE_TIME is null;
update sys_autho set CREATE_USER_ID = -1 where CREATE_USER_ID is null;
update sys_autho set CREATE_USER_NAME = '-1' where CREATE_USER_NAME is null;
update sys_autho set UPDATE_TIME = now() where UPDATE_TIME is null;
update sys_autho set UPDATE_USER_ID = -1 where UPDATE_USER_ID is null;
update sys_autho set UPDATE_USER_NAME = '-1' where UPDATE_USER_NAME is null;
update sys_autho set IS_DEL = 1 where IS_DEL is null;
update sys_autho set DATA_ORDER = 0 where DATA_ORDER is null;


update sys_role_has_autho set CREATE_TIME = now() where CREATE_TIME is null;
update sys_role_has_autho set CREATE_USER_ID = -1 where CREATE_USER_ID is null;
update sys_role_has_autho set CREATE_USER_NAME = '-1' where CREATE_USER_NAME is null;
update sys_role_has_autho set UPDATE_TIME = now() where UPDATE_TIME is null;
update sys_role_has_autho set UPDATE_USER_ID = -1 where UPDATE_USER_ID is null;
update sys_role_has_autho set UPDATE_USER_NAME = '-1' where UPDATE_USER_NAME is null;
update sys_role_has_autho set IS_DEL = 1 where IS_DEL is null;
update sys_role_has_autho set DATA_ORDER = 0 where DATA_ORDER is null;


update sys_admin set CREATE_TIME = now() where CREATE_TIME is null;
update sys_admin set CREATE_USER_ID = -1 where CREATE_USER_ID is null;
update sys_admin set CREATE_USER_NAME = '-1' where CREATE_USER_NAME is null;
update sys_admin set UPDATE_TIME = now() where UPDATE_TIME is null;
update sys_admin set UPDATE_USER_ID = -1 where UPDATE_USER_ID is null;
update sys_admin set UPDATE_USER_NAME = '-1' where UPDATE_USER_NAME is null;
update sys_admin set IS_DEL = 1 where IS_DEL is null;
update sys_admin set DATA_ORDER = 0 where DATA_ORDER is null;


update sys_org set CREATE_TIME = now() where CREATE_TIME is null;
update sys_org set CREATE_USER_ID = -1 where CREATE_USER_ID is null;
update sys_org set CREATE_USER_NAME = '-1' where CREATE_USER_NAME is null;
update sys_org set UPDATE_TIME = now() where UPDATE_TIME is null;
update sys_org set UPDATE_USER_ID = -1 where UPDATE_USER_ID is null;
update sys_org set UPDATE_USER_NAME = '-1' where UPDATE_USER_NAME is null;
update sys_org set IS_DEL = 1 where IS_DEL is null;
update sys_org set DATA_ORDER = 0 where DATA_ORDER is null;


update sys_user_has_role set CREATE_TIME = now() where CREATE_TIME is null;
update sys_user_has_role set CREATE_USER_ID = -1 where CREATE_USER_ID is null;
update sys_user_has_role set CREATE_USER_NAME = '-1' where CREATE_USER_NAME is null;
update sys_user_has_role set UPDATE_TIME = now() where UPDATE_TIME is null;
update sys_user_has_role set UPDATE_USER_ID = -1 where UPDATE_USER_ID is null;
update sys_user_has_role set UPDATE_USER_NAME = '-1' where UPDATE_USER_NAME is null;
update sys_user_has_role set IS_DEL = 1 where IS_DEL is null;
update sys_user_has_role set DATA_ORDER = 0 where DATA_ORDER is null;


update sys_dict_data set CREATE_TIME = now() where CREATE_TIME is null;
update sys_dict_data set CREATE_USER_ID = -1 where CREATE_USER_ID is null;
update sys_dict_data set CREATE_USER_NAME = '-1' where CREATE_USER_NAME is null;
update sys_dict_data set UPDATE_TIME = now() where UPDATE_TIME is null;
update sys_dict_data set UPDATE_USER_ID = -1 where UPDATE_USER_ID is null;
update sys_dict_data set UPDATE_USER_NAME = '-1' where UPDATE_USER_NAME is null;
update sys_dict_data set IS_DEL = 1 where IS_DEL is null;
update sys_dict_data set DATA_ORDER = 0 where DATA_ORDER is null;


update sys_token set CREATE_TIME = now() where CREATE_TIME is null;
update sys_token set CREATE_USER_ID = -1 where CREATE_USER_ID is null;
update sys_token set CREATE_USER_NAME = '-1' where CREATE_USER_NAME is null;
update sys_token set UPDATE_TIME = now() where UPDATE_TIME is null;
update sys_token set UPDATE_USER_ID = -1 where UPDATE_USER_ID is null;
update sys_token set UPDATE_USER_NAME = '-1' where UPDATE_USER_NAME is null;
update sys_token set IS_DEL = 1 where IS_DEL is null;
update sys_token set DATA_ORDER = 0 where DATA_ORDER is null;


update sys_org_has_user set CREATE_TIME = now() where CREATE_TIME is null;
update sys_org_has_user set CREATE_USER_ID = -1 where CREATE_USER_ID is null;
update sys_org_has_user set CREATE_USER_NAME = '-1' where CREATE_USER_NAME is null;
update sys_org_has_user set UPDATE_TIME = now() where UPDATE_TIME is null;
update sys_org_has_user set UPDATE_USER_ID = -1 where UPDATE_USER_ID is null;
update sys_org_has_user set UPDATE_USER_NAME = '-1' where UPDATE_USER_NAME is null;
update sys_org_has_user set IS_DEL = 1 where IS_DEL is null;
update sys_org_has_user set DATA_ORDER = 0 where DATA_ORDER is null;



END//
DELIMITER ;
CALL tmp_add_def_col();
DROP PROCEDURE IF EXISTS tmp_add_def_col;
