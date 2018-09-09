package com.xm.autho.service;

import java.util.List;

import javax.annotation.Resource;

import com.framework.core.constants.CoreCacheConstants;
import com.framework.core.db.agent.CoreDaoAgent;
import com.framework.core.db.bean.ParamMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.xm.autho.common.constants.R;
import com.xm.autho.pojo.SysAuthoPojo;
import com.xm.autho.vo.GrantAuthoVo;
import com.xm.autho.vo.GrantRoleVo;


@Service
public class AuthoService {
	
	@Autowired
	@Qualifier("coreDaoAgent")
	private CoreDaoAgent daoAgent;
	
	@Cacheable(cacheNames = CoreCacheConstants.CACHE_1MIN, key = "'getAuthosByRoleId@'+#p0")
	public List<SysAuthoPojo> getAuthosByRoleId(Long roleId){
		ParamMap param = ParamMap.newOne("roleId", roleId);
		String sql=String.format("select a.* from %srole_has_autho rha left join %sautho a on a.seq_id=rha.autho_id where rha.role_id=:roleId and rha.is_del=0 and a.is_del=0 and a.super_id>0",
				R.SysConfig.SYS_TABLE_PREFIX,R.SysConfig.SYS_TABLE_PREFIX);
		List<SysAuthoPojo> res = daoAgent.quickSimpleDao.queryForList(sql, param , SysAuthoPojo.class);
		return res;
	}
	@Cacheable(cacheNames = CoreCacheConstants.CACHE_1MIN, key = "'getAuthosBySuperId@'+#p0+#p1")
	public List<SysAuthoPojo> getAuthosBySuperId(Long roleId,Long superId){
		ParamMap param = ParamMap.newOne("roleId", roleId).put("super_id",superId);
		String sql=String.format("select a.* from %srole_has_autho rha left join %sautho a on a.seq_id=rha.autho_id where rha.role_id=:roleId and rha.is_del=0 and a.is_del=0 and a.super_id=:super_id",
				R.SysConfig.SYS_TABLE_PREFIX,R.SysConfig.SYS_TABLE_PREFIX);
		List<SysAuthoPojo> res = daoAgent.quickSimpleDao.queryForList(sql, param , SysAuthoPojo.class);
		return res;
	}
	@Cacheable(cacheNames = CoreCacheConstants.CACHE_1MIN, key = "'getAuthosEnnameByRoleId@'+#p0")
	public List<String> getAuthosEnnameByRoleId(Long roleId){
		ParamMap param = ParamMap.newOne("roleId", roleId);
		String sql=String.format("select a.en_name from %srole_has_autho rha left join %sautho a on a.seq_id=rha.autho_id where rha.role_id=:roleId and rha.is_del=0 and a.is_del=0", R.SysConfig.SYS_TABLE_PREFIX, R.SysConfig.SYS_TABLE_PREFIX);
		List<String> res = daoAgent.quickSimpleDao.queryLang(sql, param , String.class);
		return res;
	}
	
	@Cacheable(cacheNames = CoreCacheConstants.CACHE_1MIN, key = "'getAuthoIdsByUserId@'+#p0")
	public List<Long> getAuthoIdsByUserId(Long roleId){
		ParamMap param = ParamMap.newOne("roleId", roleId);
		String sql=String.format("select a.seq_id from %srole_has_autho rha left join %sautho a on a.seq_id=rha.autho_id where rha.role_id=:roleId and rha.is_del=0 and a.is_del=0", R.SysConfig.SYS_TABLE_PREFIX, R.SysConfig.SYS_TABLE_PREFIX);
		return daoAgent.quickSimpleDao.queryLang(sql, param, Long.class);
	}
	@CacheEvict(cacheNames = CoreCacheConstants.CACHE_1MIN, key="'deleteAuthoIdsByUserId@'+#p0",allEntries=true)
	public Long deleteAuthoIdsByUserId(Long roleId){
		return roleId;
	}
	
	@Cacheable(cacheNames = CoreCacheConstants.CACHE_1MIN, key = "'getRoleIdsByUserId@'+#p0")
	public List<Long> getRoleIdsByUserId(Long userId){
		ParamMap param = ParamMap.newOne("userId", userId);
		String sql=String.format("select role_id from %suser_has_role where user_id=:userId and is_del=0", R.SysConfig.SYS_TABLE_PREFIX);
		return daoAgent.quickSimpleDao.queryLang(sql, param, Long.class);
	}
	
	// 清缓存
	@CacheEvict(cacheNames = CoreCacheConstants.CACHE_1MIN, key="'getRoleIdsByUserId@'+#p0",allEntries=true)
	public Long deleteRoleIdsByUserId(Long userId){
		return userId;
	}

	@Cacheable(cacheNames = CoreCacheConstants.CACHE_1MIN, key = "'getAuthoById@'+#p0")
	public SysAuthoPojo getAuthoById(Long seqId) {
		ParamMap param = ParamMap.newOne("seqId", seqId);
		String sql=String.format("select * from %sautho where seq_id=:seqId and is_del=0", R.SysConfig.SYS_TABLE_PREFIX);
		return daoAgent.quickSimpleDao.queryForObject(sql, param, SysAuthoPojo.class);
	}
	
	@Cacheable(cacheNames = CoreCacheConstants.CACHE_1MIN, key = "'getRoleList'")
	public List<GrantRoleVo> getRoleList(){
		String sql=String.format("select seq_id role_id, name from %srole where is_del=0", R.SysConfig.SYS_TABLE_PREFIX);
		return daoAgent.quickSimpleDao.queryForList(sql, GrantRoleVo.class);
	}
	
	@Cacheable(cacheNames = CoreCacheConstants.CACHE_1MIN, key = "'getAuthoList'")
	public List<GrantAuthoVo> getAuthoList(){
		String sql=String.format("select seq_id autho_id, name, type,en_name,super_id from %sautho where is_del=0", R.SysConfig.SYS_TABLE_PREFIX);
		return daoAgent.quickSimpleDao.queryForList(sql, GrantAuthoVo.class);
	}

}
