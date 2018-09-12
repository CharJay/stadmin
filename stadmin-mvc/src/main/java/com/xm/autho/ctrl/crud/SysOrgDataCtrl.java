package com.xm.autho.ctrl.crud;

import com.xm.autho.param.SysOrgParam;
import com.xm.autho.pojo.SysOrgPojo;
import com.xm.autho.vo.SysOrgVo;
import com.xm.stadmin.common.agent.SysServiceAgent;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

import java.lang.reflect.InvocationTargetException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.framework.core.db.bean.ListDataWrap;
import com.framework.core.db.bean.Page;
import com.framework.core.db.bean.RetMsg;
import com.framework.core.exception.BusinessException;



@Api(value = "SysOrgCtrl")
@RestController
@RequestMapping("crud/sysOrg")
public class SysOrgDataCtrl {

    private static final Logger    logger = LoggerFactory.getLogger(SysOrgDataCtrl.class);

    @Autowired
    private SysServiceAgent sysServiceAgent;

    @RequiresPermissions("SysOrg_create")
    @ApiOperation(value = "create", httpMethod = "POST")
    @RequestMapping(value = "create", method = RequestMethod.POST)
    public RetMsg<Long> create(HttpServletRequest request, SysOrgParam param){
    	SysOrgPojo pojo=new SysOrgPojo();
    	try {
			BeanUtils.copyProperties(pojo, param);
		} catch (IllegalAccessException | InvocationTargetException e) {
			logger.error("",e);
		}
        Number num = sysServiceAgent.quickCrudService.create(pojo);
        return RetMsg.success(num.longValue());
    }
    
    @RequiresPermissions("SysOrg_deleteById")
    @ApiOperation(value = "deleteById", httpMethod = "POST")
    @RequestMapping( value = "deleteById", method = RequestMethod.POST )
    public RetMsg<Object> deleteById(HttpServletRequest request, Long seqId) throws Exception {
    	SysOrgPojo pojo = new SysOrgPojo();
    	pojo.setIsDel(1);
    	pojo.setSeqId(seqId);
    	int ret = sysServiceAgent.quickCrudService.updateById( pojo  );
    	if(ret == 0) {
    		throw new BusinessException("删除失败");
    	}
    	return RetMsg.success();
    }
    
    @RequiresPermissions("SysOrg_updateById")
    @ApiOperation(value = "updateById", httpMethod = "POST")
    @RequestMapping( value = "updateById", method = RequestMethod.POST )
    public RetMsg<Object> updateById(HttpServletRequest request,Long seqId, SysOrgParam param) throws Exception {
    	SysOrgPojo pojo=new SysOrgPojo();
    	try {
			BeanUtils.copyProperties(pojo, param);
		} catch (IllegalAccessException | InvocationTargetException e) {
			logger.error("",e);
		}
    	int ret = sysServiceAgent.quickCrudService.updateById( pojo);
    	if(ret == 0) {
    		throw new BusinessException("更新失败");
    	}
    	return RetMsg.success();
    }

    @RequiresPermissions("SysOrg_readById")
    @ApiOperation(value = "readById", httpMethod = "POST")
    @RequestMapping(value = "readById", method = {RequestMethod.POST,RequestMethod.GET})
    public RetMsg<SysOrgVo> readById(HttpServletRequest request, Long seqId) throws Exception {
    	SysOrgPojo pojo = sysServiceAgent.quickCrudService.getById(SysOrgPojo.class, seqId);
    	SysOrgVo vo=new SysOrgVo();
    	try {
    		BeanUtils.copyProperties(vo, pojo);
    	} catch (IllegalAccessException | InvocationTargetException e) {
    		logger.error("",e);
    	}
        return RetMsg.success(vo);
    }

    @RequiresPermissions("SysOrg_count")
    @ApiOperation(value = "count", httpMethod = "GET")
    @RequestMapping(value = "count", method = RequestMethod.GET)
    public RetMsg<Long> count(HttpServletRequest request, SysOrgParam param)  {
    	SysOrgPojo pojo=new SysOrgPojo();
    	try {
			BeanUtils.copyProperties(pojo, param);
		} catch (IllegalAccessException | InvocationTargetException e) {
			logger.error("",e);
		}
    	long cnt = sysServiceAgent.quickCrudService.count(SysOrgPojo.class,pojo);
        return RetMsg.success(cnt);
    }
    
    @RequiresPermissions("SysOrg_readList")
    @ApiOperation(value = "readList", httpMethod = "POST")
    @RequestMapping(value = "readList", method = RequestMethod.POST)
    public RetMsg<ListDataWrap<SysOrgPojo>> readList(HttpServletRequest request, SysOrgParam param)  {
    	SysOrgPojo pojo=new SysOrgPojo();
    	try {
			BeanUtils.copyProperties(pojo, param);
			pojo.setIsDel(0);
		} catch (IllegalAccessException | InvocationTargetException e) {
			logger.error("",e);
		}
    	Page page=new Page(5000, 1);//限制，不全部查询
    	ListDataWrap<SysOrgPojo> listDataWrap = sysServiceAgent.quickCrudService.getList(SysOrgPojo.class, pojo, page," seq_id desc");
        return RetMsg.success(listDataWrap);
    }

    @RequiresPermissions("SysOrg_readAndCount")
    @ApiOperation(value = "readAndCount", httpMethod = "POST")
    @RequestMapping(value = "readAndCount", method = RequestMethod.POST)
    public RetMsg<ListDataWrap<SysOrgPojo>> readAndCount(HttpServletRequest request, SysOrgParam param, Page page)  {
    	SysOrgPojo pojo=new SysOrgPojo();
    	try {
			BeanUtils.copyProperties(pojo, param);
			pojo.setIsDel(0);
		} catch (IllegalAccessException | InvocationTargetException e) {
			logger.error("",e);
		}
    	ListDataWrap<SysOrgPojo> listDataWrap = sysServiceAgent.quickCrudService.getList(SysOrgPojo.class, pojo, page," seq_id desc");
        return RetMsg.success(listDataWrap);
    }

}
