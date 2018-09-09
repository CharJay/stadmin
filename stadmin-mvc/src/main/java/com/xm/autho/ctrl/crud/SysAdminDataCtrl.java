package com.xm.autho.ctrl.crud;

import java.lang.reflect.InvocationTargetException;

import javax.servlet.http.HttpServletRequest;

import com.framework.core.db.agent.CoreServiceAgent;
import com.framework.core.db.bean.ListDataWrap;
import com.framework.core.db.bean.Page;
import com.framework.core.db.bean.ParamMap;
import com.framework.core.db.bean.RetMsg;
import com.framework.core.exception.BusinessException;
import com.framework.core.utils.crypto.CipherUtil;
import com.xm.autho.common.constants.R;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.xm.autho.param.SysAdminParam;
import com.xm.autho.pojo.SysAdminPojo;
import com.xm.autho.vo.SysAdminVo;


import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@Api(value = "SysAdminCtrl")
@RestController
@RequestMapping("crud/sysAdmin")
public class SysAdminDataCtrl {

    private static final Logger    logger = LoggerFactory.getLogger(SysAdminDataCtrl.class);
    
    @Autowired
    @Qualifier("coreServiceAgent")
    private CoreServiceAgent serviceAgent;

    @RequiresPermissions("sysAdmin_create")
    @ApiOperation(value = "create", httpMethod = "POST")
    @RequestMapping(value = "create", method = RequestMethod.POST)
    public RetMsg<Long> create(HttpServletRequest request, SysAdminParam param){
		Long cnt=serviceAgent.quickSimpleService.queryForLong(String.format("select count(1) from %sadmin where username=:username",R.SysConfig.SYS_TABLE_PREFIX),ParamMap.newOne("username",param.getUsername()));
		if(cnt>0){
			return RetMsg.error(2001,"用户名已存在");
		}
		SysAdminPojo pojo=new SysAdminPojo();
		try {
			BeanUtils.copyProperties(pojo, param);
			//默认密码
			pojo.setSalt(CipherUtil.gnerateSaltBase64() );
			pojo.setPassword(CipherUtil.sha256Hash2Hex( R.SysConfig.DEFAULT_PWD, pojo.getSalt() ));
		} catch (IllegalAccessException | InvocationTargetException e) {
			logger.error("",e);
		}
        Number num = serviceAgent.quickCrudService.create(pojo);
        return RetMsg.success(num.longValue());
    }
    
    @RequiresPermissions("sysAdmin_deleteById")
    @ApiOperation(value = "deleteById", httpMethod = "POST")
    @RequestMapping( value = "deleteById", method = RequestMethod.POST )
    public RetMsg<Object> deleteById(HttpServletRequest request, Long seqId){
    	SysAdminPojo pojo = new SysAdminPojo();
    	pojo.setIsDel(1);
    	pojo.setSeqId(seqId);
		int ret = serviceAgent.quickCrudService.updateById( pojo  );
		if(ret == 0) {
			throw new BusinessException("删除失败");
		}
    	return RetMsg.success();
    }
    
    @RequiresPermissions("sysAdmin_updateById")
    @ApiOperation(value = "updateById", httpMethod = "POST")
    @RequestMapping( value = "updateById", method = RequestMethod.POST )
    public RetMsg<Object> updateById(HttpServletRequest request,Long seqId, SysAdminParam param) {
    	SysAdminPojo pojo=new SysAdminPojo();
    	try {
			BeanUtils.copyProperties(pojo, param);
			pojo.setSeqId(seqId);
		} catch (IllegalAccessException | InvocationTargetException e) {
			logger.error("",e);
		}
    	int ret = serviceAgent.quickCrudService.updateById( pojo);
    	if(ret == 0) {
    		throw new BusinessException("更新失败");
    	}
    	return RetMsg.success();
    }

    @RequiresPermissions("sysAdmin_readById")
    @ApiOperation(value = "readById", httpMethod = "POST")
    @RequestMapping(value = "readById", method = RequestMethod.POST)
    public RetMsg<SysAdminVo> readById(HttpServletRequest request, Long seqId) {
        SysAdminPojo pojo = serviceAgent.quickCrudService.getById(SysAdminPojo.class, seqId);
        SysAdminVo vo=new SysAdminVo();
        try {
			BeanUtils.copyProperties(vo, pojo);
		} catch (IllegalAccessException | InvocationTargetException e) {
			logger.error("",e);
		}
        return RetMsg.success(vo);
    }

    @RequiresPermissions("sysAdmin_count")
    @ApiOperation(value = "count", httpMethod = "GET")
    @RequestMapping(value = "count", method = RequestMethod.GET)
    public RetMsg<Long> count(HttpServletRequest request, SysAdminParam param)  {
    	SysAdminPojo pojo=new SysAdminPojo();
    	try {
			BeanUtils.copyProperties(pojo, param);
		} catch (IllegalAccessException | InvocationTargetException e) {
			logger.error("",e);
		}
    	long cnt = serviceAgent.quickCrudService.count(SysAdminPojo.class,pojo);
        return RetMsg.success(cnt);
    }
    
    @RequiresPermissions("sysAdmin_readList")
    @ApiOperation(value = "readList", httpMethod = "POST")
    @RequestMapping(value = "readList", method = RequestMethod.POST)
    public RetMsg<ListDataWrap<SysAdminPojo>> readList(HttpServletRequest request, SysAdminParam param)  {
    	SysAdminPojo pojo=new SysAdminPojo();
    	try {
			BeanUtils.copyProperties(pojo, param);
			pojo.setIsDel(0);
		} catch (IllegalAccessException | InvocationTargetException e) {
			logger.error("",e);
		}
    	Page page=new Page(5000, 1);//限制，不全部查询
    	ListDataWrap<SysAdminPojo> list = serviceAgent.quickCrudService.getList(SysAdminPojo.class, pojo, page);
        return RetMsg.success(list);
    }

    @RequiresPermissions("sysAdmin_readAndCount")
    @ApiOperation(value = "readAndCount", httpMethod = "POST")
    @RequestMapping(value = "readAndCount", method = RequestMethod.POST)
    public RetMsg<ListDataWrap<SysAdminPojo>> readAndCount(HttpServletRequest request, SysAdminParam param, Page page)  {
    	SysAdminPojo pojo=new SysAdminPojo();
    	try {
			BeanUtils.copyProperties(pojo, param);
			pojo.setIsDel(0);
		} catch (IllegalAccessException | InvocationTargetException e) {
			logger.error("",e);
		}
    	ListDataWrap<SysAdminPojo> list = serviceAgent.quickCrudService.getList(SysAdminPojo.class, pojo, page);
        return RetMsg.success(list);
    }

}
