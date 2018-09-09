DROP PROCEDURE IF EXISTS tmp_add_def_col;
DELIMITER //
CREATE PROCEDURE tmp_add_def_col() BEGIN

###所有系统自动数据都必须从100000开始
### [静态界面主目录] 默认为：/stadmin/bootstrap；（所以需要把bootstrap文件夹改为crud文件夹）
###门户
DELETE FROM SYS_PORTAL WHERE en_name = 'stadmin';
INSERT INTO SYS_PORTAL(seq_id,create_time,update_time,data_order,is_del,name,en_name,login_logo,index_logo,develop_unit,owner_unit,use_captcha)
VALUES(100000,now(),now(),100,0,'管理后台','stadmin','login_logo.png', 'index_logo.png','---','---', 2 );
####u-insert#portal_update#
####u-insert#

###人员 pwd -> system
DELETE FROM SYS_ADMIN WHERE portal_key = 'stadmin';
INSERT INTO SYS_ADMIN (seq_id,create_time,update_time,data_order,is_del,username,realname,password,salt,status,portal_key)
 VALUES( 100001, now(),now(),100,0,'stadmin_admin','stadmin_admin','7c4a8d09ca3762af61e59520943dc26494f8941b','',0, 'stadmin');
####u-insert#user_update#
####u-insert#

###角色
DELETE FROM SYS_ROLE WHERE portal_key = 'stadmin';
INSERT INTO SYS_ROLE (seq_id,create_time,update_time,data_order,is_del,name,en_name,portal_key)
VALUES( 100001, now(),now(),100,0, '管理后台_管理员','stadmin_admin','stadmin' );
####u-insert#role_update#
####u-insert#

###人员关联角色
DELETE FROM SYS_USER_HAS_ROLE WHERE user_id in ( select seq_id from SYS_ADMIN where portal_key = 'stadmin');
INSERT INTO SYS_USER_HAS_ROLE(seq_id,create_time,update_time,data_order,is_del,user_id,role_id)
VALUES( 100001 , now(),now(),100,0, 100001, 100001);
####u-insert#userhasrole_update#
####u-insert#

###机构
DELETE FROM SYS_ORG WHERE portal_key = 'stadmin';
INSERT INTO SYS_ORG (seq_id,create_time,update_time,data_order,is_del,name,super_id,node_level,node_path,portal_key)
VALUES ( 100001, now(),now(),100,0, '管理后台总部' , 0, 0 ,';100001;','stadmin');
####u-insert#org_update#
####u-insert#

###人员关联机构
DELETE FROM SYS_ORG_HAS_USER WHERE user_id in (select seq_id from SYS_ADMIN where portal_key = 'stadmin');
INSERT INTO SYS_ORG_HAS_USER (seq_id,create_time,update_time,data_order,is_del,user_id,org_id)
VALUES( 100001, now(),now(),100,0, 100001, 100001);
####u-insert#orghasuser_update#
####u-insert#

###权限###以及角色权限关联
DELETE FROM SYS_ROLE_HAS_AUTHO WHERE autho_id in (select seq_id from SYS_AUTHO where portal_key = 'stadmin');
DELETE FROM SYS_AUTHO WHERE portal_key = 'stadmin';

######系统
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key, is_leaf)
VALUES( now(),now(),100,0, '管理后台','stadmin_system', null, 1, 0 , 1, 'stadmin', 2);
SET @_menu_system_id = last_insert_id();
######根菜单
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key, is_leaf)
VALUES( now(),now(),100,0, '管理后台','stadmin_menu_root', null, 2, @_menu_system_id, 2, 'stadmin', 2);

SET @_menu_root_id=last_insert_id();
####u-insert#other_menu_root#
####u-insert#
######其他菜单
#########SysAdmin
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key, is_leaf)
VALUES( now(),now(),100,0, 'SysAdmin','sysAdmin_readAndCount', '/stadmin/layui/views/SysAdmin/list.html', 2, @_menu_root_id, 3, 'stadmin', 2);
SET @_menu_mgr_id=last_insert_id();
####u-insert#other_menu_SysAdminMgr_update#
####u-insert#
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysAdmin-查询','sysAdmin_readById', null, 3, @_menu_mgr_id, 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysAdmin-添加','sysAdmin_create', null, 3, @_menu_mgr_id , 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysAdmin-修改','sysAdmin_updateById', null, 3, @_menu_mgr_id , 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysAdmin-删除','sysAdmin_deleteById', null, 3, @_menu_mgr_id, 4, 'stadmin');
#########SysAutho
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key, is_leaf)
VALUES( now(),now(),100,0, 'SysAutho','sysAutho_readAndCount', '/stadmin/layui/views/SysAutho/list.html', 2, @_menu_root_id, 3, 'stadmin', 2);
SET @_menu_mgr_id=last_insert_id();
####u-insert#other_menu_SysAuthoMgr_update#
####u-insert#
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysAutho-查询','sysAutho_readById', null, 3, @_menu_mgr_id, 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysAutho-添加','sysAutho_create', null, 3, @_menu_mgr_id , 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysAutho-修改','sysAutho_updateById', null, 3, @_menu_mgr_id , 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysAutho-删除','sysAutho_deleteById', null, 3, @_menu_mgr_id, 4, 'stadmin');
#########SysDictData
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key, is_leaf)
VALUES( now(),now(),100,0, 'SysDictData','sysDictData_readAndCount', '/stadmin/layui/views/SysDictData/list.html', 2, @_menu_root_id, 3, 'stadmin', 2);
SET @_menu_mgr_id=last_insert_id();
####u-insert#other_menu_SysDictDataMgr_update#
####u-insert#
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysDictData-查询','sysDictData_readById', null, 3, @_menu_mgr_id, 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysDictData-添加','sysDictData_create', null, 3, @_menu_mgr_id , 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysDictData-修改','sysDictData_updateById', null, 3, @_menu_mgr_id , 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysDictData-删除','sysDictData_deleteById', null, 3, @_menu_mgr_id, 4, 'stadmin');
#########SysLoginLog
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key, is_leaf)
VALUES( now(),now(),100,0, 'SysLoginLog','sysLoginLog_readAndCount', '/stadmin/layui/views/SysLoginLog/list.html', 2, @_menu_root_id, 3, 'stadmin', 2);
SET @_menu_mgr_id=last_insert_id();
####u-insert#other_menu_SysLoginLogMgr_update#
####u-insert#
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysLoginLog-查询','sysLoginLog_readById', null, 3, @_menu_mgr_id, 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysLoginLog-添加','sysLoginLog_create', null, 3, @_menu_mgr_id , 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysLoginLog-修改','sysLoginLog_updateById', null, 3, @_menu_mgr_id , 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysLoginLog-删除','sysLoginLog_deleteById', null, 3, @_menu_mgr_id, 4, 'stadmin');
#########SysOrg
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key, is_leaf)
VALUES( now(),now(),100,0, 'SysOrg','sysOrg_readAndCount', '/stadmin/layui/views/SysOrg/list.html', 2, @_menu_root_id, 3, 'stadmin', 2);
SET @_menu_mgr_id=last_insert_id();
####u-insert#other_menu_SysOrgMgr_update#
####u-insert#
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysOrg-查询','sysOrg_readById', null, 3, @_menu_mgr_id, 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysOrg-添加','sysOrg_create', null, 3, @_menu_mgr_id , 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysOrg-修改','sysOrg_updateById', null, 3, @_menu_mgr_id , 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysOrg-删除','sysOrg_deleteById', null, 3, @_menu_mgr_id, 4, 'stadmin');
#########SysOrgHasUser
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key, is_leaf)
VALUES( now(),now(),100,0, 'SysOrgHasUser','sysOrgHasUser_readAndCount', '/stadmin/layui/views/SysOrgHasUser/list.html', 2, @_menu_root_id, 3, 'stadmin', 2);
SET @_menu_mgr_id=last_insert_id();
####u-insert#other_menu_SysOrgHasUserMgr_update#
####u-insert#
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysOrgHasUser-查询','sysOrgHasUser_readById', null, 3, @_menu_mgr_id, 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysOrgHasUser-添加','sysOrgHasUser_create', null, 3, @_menu_mgr_id , 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysOrgHasUser-修改','sysOrgHasUser_updateById', null, 3, @_menu_mgr_id , 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysOrgHasUser-删除','sysOrgHasUser_deleteById', null, 3, @_menu_mgr_id, 4, 'stadmin');
#########SysPortal
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key, is_leaf)
VALUES( now(),now(),100,0, 'SysPortal','sysPortal_readAndCount', '/stadmin/layui/views/SysPortal/list.html', 2, @_menu_root_id, 3, 'stadmin', 2);
SET @_menu_mgr_id=last_insert_id();
####u-insert#other_menu_SysPortalMgr_update#
####u-insert#
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysPortal-查询','sysPortal_readById', null, 3, @_menu_mgr_id, 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysPortal-添加','sysPortal_create', null, 3, @_menu_mgr_id , 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysPortal-修改','sysPortal_updateById', null, 3, @_menu_mgr_id , 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysPortal-删除','sysPortal_deleteById', null, 3, @_menu_mgr_id, 4, 'stadmin');
#########SysRole
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key, is_leaf)
VALUES( now(),now(),100,0, 'SysRole','sysRole_readAndCount', '/stadmin/layui/views/SysRole/list.html', 2, @_menu_root_id, 3, 'stadmin', 2);
SET @_menu_mgr_id=last_insert_id();
####u-insert#other_menu_SysRoleMgr_update#
####u-insert#
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysRole-查询','sysRole_readById', null, 3, @_menu_mgr_id, 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysRole-添加','sysRole_create', null, 3, @_menu_mgr_id , 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysRole-修改','sysRole_updateById', null, 3, @_menu_mgr_id , 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysRole-删除','sysRole_deleteById', null, 3, @_menu_mgr_id, 4, 'stadmin');
#########SysRoleHasAutho
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key, is_leaf)
VALUES( now(),now(),100,0, 'SysRoleHasAutho','sysRoleHasAutho_readAndCount', '/stadmin/layui/views/SysRoleHasAutho/list.html', 2, @_menu_root_id, 3, 'stadmin', 2);
SET @_menu_mgr_id=last_insert_id();
####u-insert#other_menu_SysRoleHasAuthoMgr_update#
####u-insert#
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysRoleHasAutho-查询','sysRoleHasAutho_readById', null, 3, @_menu_mgr_id, 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysRoleHasAutho-添加','sysRoleHasAutho_create', null, 3, @_menu_mgr_id , 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysRoleHasAutho-修改','sysRoleHasAutho_updateById', null, 3, @_menu_mgr_id , 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysRoleHasAutho-删除','sysRoleHasAutho_deleteById', null, 3, @_menu_mgr_id, 4, 'stadmin');
#########SysToken
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key, is_leaf)
VALUES( now(),now(),100,0, 'SysToken','sysToken_readAndCount', '/stadmin/layui/views/SysToken/list.html', 2, @_menu_root_id, 3, 'stadmin', 2);
SET @_menu_mgr_id=last_insert_id();
####u-insert#other_menu_SysTokenMgr_update#
####u-insert#
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysToken-查询','sysToken_readById', null, 3, @_menu_mgr_id, 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysToken-添加','sysToken_create', null, 3, @_menu_mgr_id , 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysToken-修改','sysToken_updateById', null, 3, @_menu_mgr_id , 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysToken-删除','sysToken_deleteById', null, 3, @_menu_mgr_id, 4, 'stadmin');
#########SysUserHasRole
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key, is_leaf)
VALUES( now(),now(),100,0, 'SysUserHasRole','sysUserHasRole_readAndCount', '/stadmin/layui/views/SysUserHasRole/list.html', 2, @_menu_root_id, 3, 'stadmin', 2);
SET @_menu_mgr_id=last_insert_id();
####u-insert#other_menu_SysUserHasRoleMgr_update#
####u-insert#
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysUserHasRole-查询','sysUserHasRole_readById', null, 3, @_menu_mgr_id, 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysUserHasRole-添加','sysUserHasRole_create', null, 3, @_menu_mgr_id , 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysUserHasRole-修改','sysUserHasRole_updateById', null, 3, @_menu_mgr_id , 4, 'stadmin');
INSERT INTO SYS_AUTHO (create_time,update_time,data_order,is_del,name,en_name,uri,type,super_id,node_level,portal_key)
VALUES( now(),now(),100,0, 'SysUserHasRole-删除','sysUserHasRole_deleteById', null, 3, @_menu_mgr_id, 4, 'stadmin');


###数据字典
#DELETE FROM SYS_DICT_DATA WHERE portal_key='stadmin';
#INSERT INTO SYS_DICT_DATA (seq_id,update_time,create_time,data_order,is_del,dict_type,dict_name,class_id,class_name,entry_id,entry_name,portal_key) VALUES (100001,now(),now(),100,0,'stadmin','stadmin','英文key','中文描述','值value','显示的text','stadmin');
DELETE FROM SYS_DICT_DATA WHERE portal_key='stadmin';
####u-insert#dict_insert#
####u-insert#

####u-insert#other_insert#
####u-insert#
DELETE FROM SYS_ROLE_HAS_AUTHO WHERE autho_id in (select seq_id from SYS_AUTHO where portal_key = 'stadmin');
INSERT INTO SYS_ROLE_HAS_AUTHO(create_time,update_time,data_order,is_del,role_id,autho_id) select now(),now(),100,0, (select max(seq_id) from SYS_ROLE where en_name = 'stadmin_admin') , seq_id from SYS_AUTHO where portal_key = 'stadmin';
####u-insert#other_insert2#


####u-insert#
END//
DELIMITER ;
CALL tmp_add_def_col();
DROP PROCEDURE IF EXISTS tmp_add_def_col;
