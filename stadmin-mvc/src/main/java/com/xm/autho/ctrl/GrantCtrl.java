package com.xm.autho.ctrl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONArray;
import com.framework.core.db.agent.CoreServiceAgent;
import com.framework.core.db.bean.ParamMap;
import com.framework.core.db.bean.RetMsg;
import com.xm.autho.common.utils.TreeBuilder;
import com.xm.autho.common.utils.TreeNode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.xm.autho.common.constants.R;
import com.xm.autho.pojo.SysRoleHasAuthoPojo;
import com.xm.autho.pojo.SysUserHasRolePojo;
import com.xm.autho.service.AuthoService;
import com.xm.autho.service.TokenHelper;
import com.xm.autho.vo.GrantAuthoVo;
import com.xm.autho.vo.GrantRoleVo;


@RestController
@RequestMapping("/grant")
public class GrantCtrl {
	
	private static final Logger logger = LoggerFactory.getLogger(GrantCtrl.class);
	
	@Autowired
	private AuthoService authoService;
	@Autowired
	@Qualifier("coreServiceAgent")
	private CoreServiceAgent serviceAgent;

	@RequestMapping(value = { "getRoleList" }, method = RequestMethod.POST)
	@ResponseBody
	public RetMsg<List<GrantRoleVo>> getRoleList(HttpServletRequest request, Long userId) {
		List<GrantRoleVo> roleList = authoService.getRoleList();
		if(roleList == null || roleList.size() == 0) {
			return RetMsg.success();
		}
		List<Long> rolesIds = authoService.getRoleIdsByUserId(userId);
		List<GrantRoleVo> tmp = new ArrayList<>();
		for (GrantRoleVo role : roleList) {
			GrantRoleVo e = new GrantRoleVo();
			e.setRoleId(role.getRoleId());
			e.setName(role.getName());
			if(rolesIds.contains(role.getRoleId())) {
				e.setIsGrant(1);
			} else {
				e.setIsGrant(0);
			}
			tmp.add(e );
		}
		return RetMsg.success(tmp);
	}
	
	@RequestMapping(value = { "grantRole" }, method = RequestMethod.POST)
	@ResponseBody
	public RetMsg<List<GrantRoleVo>> grantRole(HttpServletRequest request, Long userId, Long roleId, Integer isGrant) {
		if(isGrant == 1) {
			// 授权
			String sql = String.format("update %suser_has_role set is_del=0 where user_id=:userId and role_id=:roleId and is_del=1 ", R.SysConfig.SYS_TABLE_PREFIX);
			int res = serviceAgent.quickSimpleService.update(sql, ParamMap.newOne("userId", userId).put("roleId", roleId));
			if(res <= 0) {
				SysUserHasRolePojo ur = new SysUserHasRolePojo();
				ur.setRoleId(roleId);
				ur.setUserId(userId);
				serviceAgent.quickCrudService.create(ur);
			}
		} else {
			// 取消授权
			String sql = String.format("update %suser_has_role set is_del=1 where user_id=:userId and role_id=:roleId and is_del=0 ", R.SysConfig.SYS_TABLE_PREFIX);
			int res = serviceAgent.quickSimpleService.update(sql, ParamMap.newOne("userId", userId).put("roleId", roleId));
		}
		authoService.deleteRoleIdsByUserId(userId);
		return RetMsg.success();
	}
	
	@RequestMapping(value = { "getAuthoList" }, method = RequestMethod.POST)
	@ResponseBody
	public RetMsg<List<GrantAuthoVo>> getAuthoList(HttpServletRequest request, Long roleId) {
		List<GrantAuthoVo> authoList = authoService.getAuthoList();
		if(authoList == null || authoList.size() == 0) {
			return RetMsg.success();
		}
		List<Long> authoIds = authoService.getAuthoIdsByUserId(roleId);
		List<GrantAuthoVo> tmp = new ArrayList<>();
		for (GrantAuthoVo autho : authoList) {
			GrantAuthoVo e = new GrantAuthoVo();
			e.setAuthoId(autho.getAuthoId());
			e.setName(autho.getName());
			e.setType(autho.getType());
			if(authoIds.contains(autho.getAuthoId())) {
				e.setIsGrant(1);
			} else {
				e.setIsGrant(0);
			}
			tmp.add(e);
		}
		return RetMsg.success(tmp);
	}
	@RequestMapping(value = { "getAuthoTree" }, method = RequestMethod.POST)
	@ResponseBody
	public RetMsg<JSONArray> getAuthoTree(HttpServletRequest request, Long roleId) {
		List<GrantAuthoVo> authoList = authoService.getAuthoList();
		if(authoList == null || authoList.size() == 0) {
			return RetMsg.success();
		}
		List<Long> authoIds = authoService.getAuthoIdsByUserId(roleId);

		List<TreeNode> nodeList=new ArrayList<>();
		TreeNode node= null;
		for (GrantAuthoVo auth : authoList) {
			node=new TreeNode(auth.getAuthoId(), auth.getSuperId(), auth.getName(), auth.getEnName(), "", "");
			if(auth.getType()<=1){
				node.setSpread(true);
			}
			if(authoIds.contains(auth.getAuthoId())) {
				node.setSelected(1);
				node.setIcon("selected");
			} else {
				node.setSelected(0);
			}
			nodeList.add(node);
		}
		String json = new TreeBuilder().buildTree(nodeList);
		JSONArray jsonArr = JSONArray.parseArray(json);
		return RetMsg.success(jsonArr);
	}
	@RequestMapping(value = { "grantAutho" }, method = RequestMethod.POST)
	@ResponseBody
	public RetMsg<List<GrantAuthoVo>> grantAutho(HttpServletRequest request, Long roleId, Long authoId, Integer isGrant) {
		if(isGrant == 1) {
			// 授权
			String sql = String.format("update %srole_has_autho set is_del=0 where role_id=:roleId and autho_id=:authoId and is_del=1 ", R.SysConfig.SYS_TABLE_PREFIX);
			int res = serviceAgent.quickSimpleService.update(sql, ParamMap.newOne("roleId", roleId).put("authoId", authoId));
			if(res <= 0) {
				SysRoleHasAuthoPojo ra = new SysRoleHasAuthoPojo();
				ra.setRoleId(roleId);
				ra.setAuthoId(authoId);
				serviceAgent.quickCrudService.create(ra);
			}
		} else {
			// 取消授权
			String sql = String.format("update %srole_has_autho set is_del=1 where role_id=:roleId and autho_id=:authoId and is_del=0 ", R.SysConfig.SYS_TABLE_PREFIX);
			int res = serviceAgent.quickSimpleService.update(sql, ParamMap.newOne("roleId", roleId).put("authoId", authoId));
		}
		authoService.deleteAuthoIdsByUserId(roleId);
		return RetMsg.success();
	}
}
