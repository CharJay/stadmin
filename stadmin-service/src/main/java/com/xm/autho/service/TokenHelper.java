package com.xm.autho.service;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import com.framework.core.constants.CoreCacheConstants;
import com.framework.core.db.agent.CoreDaoAgent;
import org.apache.commons.lang.StringUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.xm.autho.common.constants.R;
import com.xm.autho.pojo.SysTokenPojo;
import com.framework.core.utils.crypto.CipherUtil;

@Service
public class TokenHelper {

//	@Autowired
//	public EntityManagerMini em;
	@Autowired
	@Qualifier("coreDaoAgent")
	public CoreDaoAgent daoAgent;
	@Autowired
	@Qualifier("tokenService")
	public TokenService tokenService;
	/**
	 * 登记token
	 * 
	 * @param userId
	 *            已授权用户ID
	 * @param expire
	 *            token有效时长，单位秒
	 * @return token
	 */
	public String bind(Long userId, int expire) {
		if (userId == null)
			throw new NullPointerException("userId is null");


		Date now = new Date();
		Date expireIn = new DateTime(now).plusSeconds(expire).toDate();
		String token = null;
		for (int i = 0; i < 32; i++) {
			token = CipherUtil.generateToken(32);
//			SysTokenPojo tokenObj = em.find(SysTokenPojo.class, token);
			SysTokenPojo tokenObj = tokenService.getToken(token);
			
			if (tokenObj != null) {
				continue;
			}
			break;
		}
		if (token == null)
			throw new RuntimeException("几乎不可能出现的情况！");

		SysTokenPojo newToken = new SysTokenPojo();
		newToken.setSeqId(token);
		newToken.setExpireTime(expireIn);
		newToken.setUserId(userId);
//		em.persist(newToken);
		daoAgent.quickCrudDao.create(newToken);
		return token;
	}

	/**
	 * 验证token。token不存在、失效都返回null
	 * 
	 * @param token
	 * @return 已授权用户ID
	 */
	@Cacheable(cacheNames = CoreCacheConstants.CACHE_5MIN, key = "'auth_token@'+#p0")
	public Long auth(String token) {
		if (StringUtils.isEmpty(token))
			return null;
//		SysTokenPojo tokenObj = em.find(SysTokenPojo.class, token);
		SysTokenPojo tokenObj = tokenService.getTokenCache(token);
		
		if (tokenObj != null && tokenObj.getExpireTime().after(new Date())) {
			return tokenObj.getUserId();
		}
		return null;
	}

	public Long auth(HttpServletRequest request) {
		String token = findToken(request);
		if (StringUtils.isEmpty(token))
			return null;
//		return ((TokenHelper)AopContext.currentProxy()).auth(token);
		return auth(token);
	}
	
	public void unbind(HttpServletRequest request) {
		String token = findToken(request);
		if (StringUtils.isEmpty(token))
			return;
		SysTokenPojo tokenObj=new SysTokenPojo();
		tokenObj.setSeqId(token);
		tokenObj.setIsDel(1);
		daoAgent.quickCrudDao.updateById(tokenObj);
//		em.remove(SysTokenPojo.class, token);
	}
	
	private String findToken(HttpServletRequest request) {
		String token = request.getParameter(R.Session.TOKEN_NAME);
		if (StringUtils.isEmpty(token)) {// 参数里没有，查看cookie
			Cookie[] cookies = request.getCookies();
			if (cookies != null && cookies.length > 0) {
				for (Cookie cookie : cookies) {
					if (R.Session.TOKEN_NAME.equals(cookie.getName())) {
						token = cookie.getValue();
						break;
					}
				}
			}
		}
		return token;
	}
	
	
}
