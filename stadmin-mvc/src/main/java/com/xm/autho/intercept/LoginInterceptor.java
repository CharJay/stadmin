package com.xm.autho.intercept;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.framework.core.db.bean.RetMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.xm.autho.service.TokenHelper;
import com.framework.core.utils.helper.CodeEnum;
import com.framework.core.utils.json.JacksonHelper;

@Component
public class LoginInterceptor implements HandlerInterceptor {

	private static final org.slf4j.Logger logger = org.slf4j.LoggerFactory.getLogger(LoginInterceptor.class);

	@Autowired
	private TokenHelper tokenHelper;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		Long userId = tokenHelper.auth(request);
		if (userId != null)
			return true;
        if(userId == null && request.getRequestURI()=="/handleData/address"){
        	return true;
        }
//		if(true)
//			return true;
		
		RetMsg<String> ret = new RetMsg<>(CodeEnum.LOGON_FAILURE.getCode(), CodeEnum.LOGON_FAILURE.getDescr());
		try {
			String retStr = JacksonHelper.obj2jsonThrowRuntime(ret);
			response.setContentType("application/json");
			response.getOutputStream().write(retStr.getBytes("UTF-8"));
		} catch (Exception e) {
			logger.error("output error", e);
		}

		return false;
	}

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {

	}
}