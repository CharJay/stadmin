package com.xm.autho.ctrl;

import javax.servlet.http.HttpServletRequest;

import com.framework.core.db.agent.CoreServiceAgent;
import com.framework.core.db.bean.ParamMap;
import com.framework.core.db.bean.RetMsg;
import com.xm.autho.param.SysAdminParam;
import com.xm.autho.service.TokenService;
import com.xm.autho.vo.AdminVo;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.xm.autho.common.constants.BusinessCode;
import com.xm.autho.common.constants.R;
import com.xm.autho.pojo.SysAdminPojo;
import com.xm.autho.service.TokenHelper;
import com.xm.autho.vo.LoginVo;

import com.framework.core.utils.crypto.CipherUtil;
import com.framework.core.utils.helper.CodeEnum;

import java.lang.reflect.InvocationTargetException;

/**
 * 管理员登录相关接口
 */
@RestController
public class 	LoginCtrl {

	private static final Logger logger = LoggerFactory.getLogger(LoginCtrl.class);

	@Autowired
	@Qualifier("coreServiceAgent")
	private CoreServiceAgent serviceAgent;
	@Autowired
	private TokenHelper tokenHelper;
	@Autowired
	private TokenService tokenService;
	/**
	 * token有效期，秒
	 * 
	 * @return
	 */
	private int getTokenExpire() {
		return 60 * 60 * 24 * 1;// 1天
	}

	/**
	 * 账号密码登录
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	@RequestMapping(value = { "login" }, method = RequestMethod.POST)
	@ResponseBody
	public RetMsg<LoginVo> login(String username, String password) {
		logger.debug("signin. username={},password={}", username, password);
		if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
			return new RetMsg<>(CodeEnum.PARAMS_ERROR.getCode(), CodeEnum.PARAMS_ERROR.getDescr());
		}
		// 查询账号
		String sql = String.format("select * from %sadmin where username=:username", R.SysConfig.SYS_TABLE_PREFIX);
		SysAdminPojo admin = serviceAgent.quickSimpleService.queryForObject(sql,
				ParamMap.newOne("username", username), SysAdminPojo.class);
		if (admin == null) {
			logger.debug("could not find user by username {}", username);
			return new RetMsg<>(BusinessCode.Account.USERNAME_NOT_FOUND, "账号不存在");
		}
		logger.debug("find user. id={},username={}", admin.getSeqId(), username);
		// 密码校验
		if (!CipherUtil.sha1Hash2Hex(password).equals(admin.getPassword())) {
			logger.debug("password is wrong for user {}", admin.getSeqId());
			return new RetMsg<>(BusinessCode.Account.PASSWORD_ERROR, "密码错误");
		}
		// 是否封号
		if (Integer.valueOf(2).equals(admin.getStatus())) {
			logger.debug("user is banned for username {}", admin.getSeqId());
			return new RetMsg<>(BusinessCode.Account.IS_BANNED, "封号");
		}
		// **********验证OK******
		//单点登录
//		tokenService.singleLogin(admin.getSeqId());
		// TODO 登录日志
		// 生成token
		String token = tokenHelper.bind(admin.getSeqId(), getTokenExpire());
		LoginVo vo=new LoginVo();
		vo.setToken(token);
		vo.setUsername(username);
		vo.setUserType(admin.getUserType());
		vo.setUserId(admin.getSeqId());
		return RetMsg.success(vo);
	}

	/**
	 * 退出登录
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = { "logout" }, method = RequestMethod.POST)
	@ResponseBody
	public RetMsg<Object> logout(HttpServletRequest request) {
		try {
			tokenHelper.unbind(request);
		} catch (Exception e) {
			logger.error("signout error", e);
		}
		return RetMsg.success();
	}
	/**
	 * 密码修改
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping(value = { "updatePwd" }, method = RequestMethod.POST)
	@ResponseBody
	public RetMsg<Object> updatePwd(HttpServletRequest request,String oldPassword,String password,String repassword) {
		Long userId = tokenHelper.auth(request);
		SysAdminPojo admin = serviceAgent.quickCrudService.getById(SysAdminPojo.class, userId);
		if(admin!=null){
			// 密码校验
			if (!CipherUtil.sha1Hash2Hex(oldPassword).equals(admin.getPassword())) {
				return new RetMsg<>(BusinessCode.Account.PASSWORD_ERROR, "旧密码错误");
			}
			//确认密码
			if(!password.equals(repassword)){
				return new RetMsg<>(BusinessCode.Account.PASSWORD_ERROR, "两次密码不一致");
			}
			if(password.length()<6){
				return new RetMsg<>(BusinessCode.Account.PASSWORD_ERROR, "密码不小于6位数");
			}
			admin.setPassword(CipherUtil.sha1Hash2Hex(password));
			serviceAgent.quickCrudService.updateById(admin);
		}
		return RetMsg.success();
	}

	/**
	 * 修改个人信息
	 *
	 * @param request
	 * @return
	 */
	@RequestMapping(value = { "getMyInfo" }, method = RequestMethod.POST)
	@ResponseBody
	public RetMsg<AdminVo> getMyInfo(HttpServletRequest request, SysAdminParam param) {
		Long userId = tokenHelper.auth(request);
		SysAdminPojo admin = serviceAgent.quickCrudService.getById(SysAdminPojo.class, userId);
		AdminVo vo =new AdminVo();
		try {
			BeanUtils.copyProperties(vo, admin);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		return RetMsg.success(vo);
	}
	/**
	 * 修改个人信息
	 *
	 * @param request
	 * @return
	 */
	@RequestMapping(value = { "updateMyInfo" }, method = RequestMethod.POST)
	@ResponseBody
	public RetMsg<Object> updateMyInfo(HttpServletRequest request, SysAdminParam param) {
		Long userId = tokenHelper.auth(request);
		SysAdminPojo admin = serviceAgent.quickCrudService.getById(SysAdminPojo.class, userId);
		if(admin!=null){
			admin.setRealname(param.getRealname());
			admin.setMobilePhone(param.getMobilePhone());
			admin.setEmail(param.getEmail());
			admin.setSex(param.getSex());
			serviceAgent.quickCrudService.updateById(admin);
		}
		return RetMsg.success();
	}
}
