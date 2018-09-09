package com.xm.autho.ctrl.crud;

import java.lang.reflect.InvocationTargetException;

import javax.servlet.http.HttpServletRequest;

import com.framework.core.db.agent.CoreServiceAgent;
import com.framework.core.db.bean.ListDataWrap;
import com.framework.core.db.bean.Page;
import com.framework.core.db.bean.RetMsg;
import com.framework.core.exception.BusinessException;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.xm.autho.param.SysAuthoParam;
import com.xm.autho.pojo.SysAuthoPojo;
import com.xm.autho.vo.SysAuthoVo;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@Api(value = "SysAuthoCtrl")
@RestController
@RequestMapping("crud/sysAutho")
public class SysAuthoDataCtrl {

    private static final Logger    logger = LoggerFactory.getLogger(SysAuthoDataCtrl.class);
    
    @Autowired
    @Qualifier("coreServiceAgent")
    private CoreServiceAgent serviceAgent;

    @RequiresPermissions("sysAutho_create")
    @ApiOperation(value = "create", httpMethod = "POST")
    @RequestMapping(value = "create", method = RequestMethod.POST)
    public RetMsg<Long> create(HttpServletRequest request, SysAuthoParam param){
    	SysAuthoPojo pojo=new SysAuthoPojo();
    	try {
			BeanUtils.copyProperties(pojo, param);
		} catch (IllegalAccessException | InvocationTargetException e) {
			logger.error("",e);
		}
        Number num = serviceAgent.quickCrudService.create(pojo);
        return RetMsg.success(num.longValue());
    }
    
    @RequiresPermissions("sysAutho_deleteById")
    @ApiOperation(value = "deleteById", httpMethod = "POST")
    @RequestMapping( value = "deleteById", method = RequestMethod.POST )
    public RetMsg<Object> deleteById(HttpServletRequest request, Long seqId){
    	SysAuthoPojo pojo = new SysAuthoPojo();
    	pojo.setIsDel(1);
    	pojo.setSeqId(seqId);
    	pojo.setIsDel(2);
		int ret = serviceAgent.quickCrudService.updateById( pojo  );
		if(ret == 0) {
			throw new BusinessException("删除失败");
		}
    	return RetMsg.success();
    }
    
    @RequiresPermissions("sysAutho_updateById")
    @ApiOperation(value = "updateById", httpMethod = "POST")
    @RequestMapping( value = "updateById", method = RequestMethod.POST )
    public RetMsg<Object> updateById(HttpServletRequest request,Long seqId, SysAuthoParam param) {
    	SysAuthoPojo pojo=new SysAuthoPojo();
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

    @RequiresPermissions("sysAutho_readById")
    @ApiOperation(value = "readById", httpMethod = "POST")
    @RequestMapping(value = "readById", method = RequestMethod.POST)
    public RetMsg<SysAuthoVo> readById(HttpServletRequest request, Long seqId) {
        SysAuthoPojo pojo = serviceAgent.quickCrudService.getById(SysAuthoPojo.class, seqId);
        SysAuthoVo vo=new SysAuthoVo();
        try {
			BeanUtils.copyProperties(vo, pojo);
		} catch (IllegalAccessException | InvocationTargetException e) {
			logger.error("",e);
		}
        return RetMsg.success(vo);
    }

    @RequiresPermissions("sysAutho_count")
    @ApiOperation(value = "count", httpMethod = "GET")
    @RequestMapping(value = "count", method = RequestMethod.GET)
    public RetMsg<Long> count(HttpServletRequest request, SysAuthoParam param)  {
    	SysAuthoPojo pojo=new SysAuthoPojo();
    	try {
			BeanUtils.copyProperties(pojo, param);
		} catch (IllegalAccessException | InvocationTargetException e) {
			logger.error("",e);
		}
    	long cnt = serviceAgent.quickCrudService.count(SysAuthoPojo.class,pojo);
        return RetMsg.success(cnt);
    }
    
    @RequiresPermissions("sysAutho_readList")
    @ApiOperation(value = "readList", httpMethod = "POST")
    @RequestMapping(value = "readList", method = RequestMethod.POST)
    public RetMsg<ListDataWrap<SysAuthoPojo>> readList(HttpServletRequest request, SysAuthoParam param)  {
    	SysAuthoPojo pojo=new SysAuthoPojo();
    	try {
			BeanUtils.copyProperties(pojo, param);
			pojo.setIsDel(0);
		} catch (IllegalAccessException | InvocationTargetException e) {
			logger.error("",e);
		}
    	Page page=new Page(5000, 1);//限制，不全部查询
    	ListDataWrap<SysAuthoPojo> list = serviceAgent.quickCrudService.getList(SysAuthoPojo.class, pojo, page);
        return RetMsg.success(list);
    }

    @RequiresPermissions("sysAutho_readAndCount")
    @ApiOperation(value = "readAndCount", httpMethod = "POST")
    @RequestMapping(value = "readAndCount", method = RequestMethod.POST)
    public RetMsg<ListDataWrap<SysAuthoPojo>> readAndCount(HttpServletRequest request, SysAuthoParam param, Page page)  {
    	SysAuthoPojo pojo=new SysAuthoPojo();
    	try {
			BeanUtils.copyProperties(pojo, param);
			pojo.setIsDel(0);
		} catch (IllegalAccessException | InvocationTargetException e) {
			logger.error("",e);
		}
    	ListDataWrap<SysAuthoPojo> list = serviceAgent.quickCrudService.getList(SysAuthoPojo.class, pojo, page);
        return RetMsg.success(list);
    }

}
