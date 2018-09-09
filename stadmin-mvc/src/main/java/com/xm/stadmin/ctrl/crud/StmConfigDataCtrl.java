package com.xm.stadmin.ctrl.crud;

import java.lang.reflect.InvocationTargetException;

import javax.servlet.http.HttpServletRequest;

import com.framework.core.db.bean.ListDataWrap;
import com.framework.core.db.bean.Page;
import com.framework.core.db.bean.RetMsg;
import com.framework.core.exception.BusinessException;
import com.xm.stadmin.pojo.StmGconfigPojo;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.xm.autho.ctrl.crud.SysAdminDataCtrl;
import com.xm.stadmin.param.StmGconfigParam;
import com.xm.stadmin.vo.StmGconfigVo;

import com.xm.stadmin.common.agent.SysServiceAgent;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
@Api(value="StmGconfigCtrl")
@RestController
@RequestMapping("crud/stmGconfig")
public class StmConfigDataCtrl {
	
	private static final Logger    logger = LoggerFactory.getLogger(SysAdminDataCtrl.class);
	
	@Autowired
    private SysServiceAgent sysServiceAgent;
	
	@RequiresPermissions("stmGconfig_readAndCount")
    @ApiOperation(value = "readAndCount", httpMethod = "POST")
	@RequestMapping(value="readAndCount",method=RequestMethod.POST)
	public RetMsg<ListDataWrap<StmGconfigPojo>> readAndCount(HttpServletRequest request, StmGconfigParam param, Page page)  {
    	StmGconfigPojo pojo=new StmGconfigPojo();
    	try {
			BeanUtils.copyProperties(pojo, param);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
			logger.error("",e);
		}
    	ListDataWrap<StmGconfigPojo> list = sysServiceAgent.quickCrudService.getList(StmGconfigPojo.class, pojo, page);
        return RetMsg.success(list);
    }
    
	@RequiresPermissions("stmGconfig_create")
    @ApiOperation(value = "create", httpMethod = "POST")
    @RequestMapping(value = "create", method = RequestMethod.POST)
    public RetMsg<Long> create(HttpServletRequest request, StmGconfigParam param){
		StmGconfigPojo pojo =  new StmGconfigPojo();
		try {
			BeanUtils.copyProperties(pojo, param);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
			logger.error("",e);
		}
	   Number number = sysServiceAgent.quickCrudService.create(pojo);
	   return RetMsg.success(number.longValue());
    }
	
	@RequiresPermissions("stmGconfig_deleteById")
    @ApiOperation(value = "deleteById", httpMethod = "POST")
    @RequestMapping( value = "deleteById", method = RequestMethod.POST )
    public RetMsg<Object> deleteById(HttpServletRequest request, Long seqId){
    	StmGconfigPojo pojo = new StmGconfigPojo();
    	pojo.setIsDel(1);
    	pojo.setSeqId(seqId.intValue());
		int ret = sysServiceAgent.quickCrudService.updateById( pojo  );
		if(ret == 0) {
			throw new BusinessException("删除失败");
		}
    	return RetMsg.success();
    }
	    
    @RequiresPermissions("stmGconfig_updateById")
    @ApiOperation(value = "updateById", httpMethod = "POST")
    @RequestMapping( value = "updateById", method = RequestMethod.POST )
    public RetMsg<Object> updateById(HttpServletRequest request,Long seqId, StmGconfigParam param) {
    	StmGconfigPojo pojo=new StmGconfigPojo();
    	try {
			BeanUtils.copyProperties(pojo, param);
			pojo.setSeqId(seqId.intValue());
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
			logger.error("",e);
		}
    	int ret = sysServiceAgent.quickCrudService.updateById( pojo);
    	if(ret == 0) {
    		throw new BusinessException("更新失败");
    	}
    	return RetMsg.success();
    }

    @RequiresPermissions("stmGconfig_readById")
    @ApiOperation(value = "readById", httpMethod = "POST")
    @RequestMapping(value = "readById", method = RequestMethod.POST)
    public RetMsg<StmGconfigVo> readById(HttpServletRequest request, Long seqId) {
        StmGconfigPojo pojo = sysServiceAgent.quickCrudService.getById(StmGconfigPojo.class, seqId);
        StmGconfigVo vo=new StmGconfigVo();
        try {
			BeanUtils.copyProperties(vo, pojo);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
			logger.error("",e);
		}
        return RetMsg.success(vo);
    }
}
