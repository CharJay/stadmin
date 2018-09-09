#开启事务，脚本执行后自行检查并选择提交事务或回滚事务
#bug 如果path一直为null，挂掉，建议执行10次就好
set autocommit=0;

#清空节点路径
UPDATE SC_AUTHO SET node_path = NULL, node_path_name = null;
#一级节点特殊
UPDATE SC_AUTHO SET node_level=1, node_path = CONCAT(';',seq_id, ';'), node_path_name = CONCAT(';',name,';'), super_name = '/'
WHERE super_id = 0;
#临时创建过程，循环递归
DROP PROCEDURE IF EXISTS tmp_fix_tree;
DELIMITER //
CREATE PROCEDURE tmp_fix_tree() BEGIN
DECLARE  i INT DEFAULT 0;

loop1: LOOP
IF i<10 and EXISTS (SELECT 1 FROM SC_AUTHO WHERE node_path is null) THEN
	UPDATE SC_AUTHO t,SC_AUTHO tt SET t.node_level=tt.node_level+1, t.node_path = CONCAT( tt.node_path,t.seq_id, ';'), t.node_path_name = CONCAT(tt.node_path_name,t.name,';'), t.super_name = tt.name
		WHERE t.super_id = tt.seq_id and tt.node_path is not null;
    SET i = i+1;
ELSE
	LEAVE loop1;
END IF;
END LOOP loop1;

END//
DELIMITER ;
CALL tmp_fix_tree();
DROP PROCEDURE IF EXISTS tmp_fix_tree;

UPDATE SC_AUTHO SET is_leaf = 1;
UPDATE SC_AUTHO t SET t.is_leaf = 2 where t.seq_id in (SELECT t2.super_id FROM (select super_id from SC_AUTHO group by super_id) t2 );

commit;
#rollback;