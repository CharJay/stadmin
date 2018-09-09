package com.xm.autho.ctrl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.framework.core.db.bean.RetMsg;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.xm.autho.common.utils.TreeNode;
import com.xm.autho.common.utils.TreeBuilder;
import com.xm.autho.pojo.SysAuthoPojo;
import com.xm.autho.service.AuthoService;
import com.xm.autho.service.TokenHelper;
import com.framework.core.utils.helper.CodeEnum;

@RestController
@RequestMapping("/autho")
public class AuthoCtrl {
	
	private static final Logger logger = LoggerFactory.getLogger(AuthoCtrl.class);
	
	@Autowired
	private AuthoService authoService;
	@Autowired
	private TokenHelper tokenHelper;

	@RequestMapping(value = { "menu" }, method = RequestMethod.POST)
	@ResponseBody
	public RetMsg<String> menu(HttpServletRequest request) {
		Long userId = tokenHelper.auth(request);
		if(userId==null){
			return RetMsg.error(CodeEnum.LOGON_FAILURE.getCode(), CodeEnum.LOGON_FAILURE.getDescr());
		}
		List<Long> rolesIds = authoService.getRoleIdsByUserId(userId);
		if(rolesIds.isEmpty()){
			return RetMsg.error(CodeEnum.PERMISSION_DENIED.getCode(), CodeEnum.PERMISSION_DENIED.getDescr());
		}
		// 获取superObj对象
		logger.debug("menu getAuthosByRoleId rolesIds={}", rolesIds);
		List<SysAuthoPojo> list = authoService.getAuthosByRoleId(rolesIds.get(0));//TODO 一个用户先一个角色
		List<TreeNode> nodeList=new ArrayList<>();
		TreeNode node= null;
		for (SysAuthoPojo auth : list) {
			node=new TreeNode(auth.getSeqId(), auth.getSuperId(), auth.getName(), auth.getEnName(), auth.getIconClass(), auth.getUri());
			nodeList.add(node);
		}
		String json = new TreeBuilder().buildTree(nodeList);
		return RetMsg.success(json);
	}
	@RequestMapping(value = { "button" }, method = RequestMethod.POST)
	@ResponseBody
	public RetMsg<String> button(HttpServletRequest request,Long superId) {
		Long userId = tokenHelper.auth(request);
		if(userId==null){
			return RetMsg.error(CodeEnum.LOGON_FAILURE.getCode(), CodeEnum.LOGON_FAILURE.getDescr());
		}
		List<Long> rolesIds = authoService.getRoleIdsByUserId(userId);
		if(rolesIds.isEmpty()){
			return RetMsg.error(CodeEnum.PERMISSION_DENIED.getCode(), CodeEnum.PERMISSION_DENIED.getDescr());
		}
		List<SysAuthoPojo> list = authoService.getAuthosBySuperId(rolesIds.get(0),superId);//TODO 一个用户先一个角色

		StringBuffer sb=new StringBuffer();
		for (SysAuthoPojo auth : list) {
			sb.append(auth.getEnName()).append(",");
		}
		return RetMsg.success(sb.toString().substring(0,sb.length()-1));
	}
}
