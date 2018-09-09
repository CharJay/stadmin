package com.xm.autho.intercept;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.framework.core.db.bean.RetMsg;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.xm.autho.service.AuthoService;
import com.xm.autho.service.TokenHelper;
import com.framework.core.utils.helper.CodeEnum;
import com.framework.core.utils.json.JacksonHelper;

@Component
public class AuthoInterceptor implements HandlerInterceptor {

	private static final org.slf4j.Logger logger = org.slf4j.LoggerFactory.getLogger(AuthoInterceptor.class);

	@Autowired
	private AuthoService authorizationService;
	@Autowired
	private TokenHelper tokenHelper;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

        if (!(handler instanceof HandlerMethod)) {
            return true;
        }
        
        RequiresPermissions methodAnnotation = ((HandlerMethod) handler).getMethodAnnotation( RequiresPermissions.class );
        if (methodAnnotation == null) {// 没有权限注解，无需判断
            return true;
        }
        
        // 取用户权限
        Long userId = tokenHelper.auth(request);
        if(userId==null){
        	doResponseForAuthFailed( request, response, new RetMsg<>(CodeEnum.LOGON_FAILURE.getCode(), CodeEnum.LOGON_FAILURE.getDescr()) );
            return false;
        }
        List<Long> rolesIds = authorizationService.getRoleIdsByUserId(userId);
        List<String> authos = new ArrayList<String>();
        for (Long roleId : rolesIds) {
            List<String> list = authorizationService.getAuthosEnnameByRoleId(roleId);
            authos.addAll(list);
        }
        if(authos.isEmpty()){
        	doResponseForAuthFailed( request, response, new RetMsg<>(CodeEnum.PARAMS_ERROR.getCode(), CodeEnum.PARAMS_ERROR.getDescr()) );
            return false;
        }
        
        // 用户权限比对接口权限
        String[] permissions = methodAnnotation.value();
        for (String p : permissions) {
            switch (methodAnnotation.logical()) {
            case AND:
                if (!authos.contains( p )) {
                    doResponseForAuthFailed( request, response, new RetMsg<>(CodeEnum.PERMISSION_DENIED.getCode(), CodeEnum.PERMISSION_DENIED.getDescr()) );
                    return false;
                }
                break;
            case OR:
                if (authos.contains( p )) {
                    return true;
                }
                break;
            default:
                break;
            }
        }
        if (methodAnnotation.logical() == Logical.OR) {
            doResponseForAuthFailed( request, response, new RetMsg<>(CodeEnum.PARAMS_ERROR.getCode(), CodeEnum.PARAMS_ERROR.getDescr()) );
            return false;
        } else {
            return true;
        }
	}

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {

	}
	
	/**
     * output返回错误码处理
     *
     * @param request
     * @param response
     * @throws Exception
     */
    protected void doResponseForAuthFailed( HttpServletRequest request, HttpServletResponse response, RetMsg<Object> ret)
            throws Exception {
    	try {
    		String retStr = JacksonHelper.obj2jsonThrowRuntime(ret);
			response.setContentType("application/json");
			response.getOutputStream().write(retStr.getBytes("UTF-8"));
		} catch (Exception e) {
			logger.error("output error", e);
		}
    }
}