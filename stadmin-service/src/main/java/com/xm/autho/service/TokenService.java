package com.xm.autho.service;

import java.util.List;

import com.framework.core.constants.CoreCacheConstants;
import com.framework.core.db.agent.CoreDaoAgent;
import com.framework.core.db.bean.ParamMap;
import com.xm.autho.common.constants.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.xm.autho.pojo.SysTokenPojo;

@Service
public class TokenService {
	
	@Autowired
	@Qualifier("coreDaoAgent")
	private CoreDaoAgent daoAgent;

	@Cacheable(cacheNames = CoreCacheConstants.CACHE_5MIN, key = "'getToken@'+#p0")
	public SysTokenPojo getTokenCache(String token){
		SysTokenPojo tokenObj=new SysTokenPojo();
		tokenObj.setSeqId(token);
		tokenObj.setIsDel(0);
		List<SysTokenPojo> obj = daoAgent.quickCrudDao.getList(SysTokenPojo.class, tokenObj);
		if(obj.isEmpty()){
			return null;
		}
		return obj.get(0);
	}
	public SysTokenPojo getToken(String token){
		SysTokenPojo tokenObj=new SysTokenPojo();
		tokenObj.setSeqId(token);
		tokenObj.setIsDel(0);
		List<SysTokenPojo> obj = daoAgent.quickCrudDao.getList(SysTokenPojo.class, tokenObj);
		if(obj.isEmpty()){
			return null;
		}
		return obj.get(0);
	}

	/**
	 * 单点登录
	 * @param userId
	 */
	public void singleLogin(Long userId){
		String sql=String.format("update %stoken set expire_time =now(),is_del=1 where user_id=:user_id", R.SysConfig.SYS_TABLE_PREFIX);
		daoAgent.quickSimpleDao.update(sql,ParamMap.newOne("user_id",userId));
	}
}
