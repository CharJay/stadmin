package com.xm.autho.service;


import com.framework.core.constants.CoreCacheConstants;
import com.framework.core.db.agent.CoreDaoAgent;
import com.framework.core.db.bean.ParamMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service
public class DictService {
	
	@Autowired
	@Qualifier("coreDaoAgent")
	private CoreDaoAgent daoAgent;

	@Cacheable(cacheNames = CoreCacheConstants.CACHE_5MIN, key = "'getData@'+#p0+#p1")
	public String getData(String classId,String entryId){
		return daoAgent.quickSimpleDao.queryLangFirst("select entry_name from res_dict_data where class_id=:classId and entry_id=:entryId",
				ParamMap.newOne("classId", classId).put("entryId", entryId), String.class);
		 
	}
}
