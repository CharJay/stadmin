package com.xm.stadmin.ctrl.crud;

import java.lang.reflect.InvocationTargetException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.framework.core.db.bean.ListDataWrap;
import com.framework.core.db.bean.Page;
import com.framework.core.db.bean.ParamMap;
import com.framework.core.db.bean.RetMsg;
import com.framework.core.exception.BusinessException;
import com.xm.stadmin.pojo.StmGoodsClassifyPojo;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import com.xm.stadmin.param.StmGoodsParam;
import com.framework.core.utils.date.DateUtil;
import com.xm.stadmin.common.agent.SysServiceAgent;
import com.xm.stadmin.pojo.StmGoodsPojo;
import com.xm.stadmin.vo.StmGoodsVo;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@Api(value = "StmGoodsCtrl")
@RestController
@RequestMapping("crud/stmGoods")
public class StmGoodsDataCtrl {

    private static final Logger logger = LoggerFactory.getLogger(StmGoodsDataCtrl.class);

    @Autowired
    private SysServiceAgent sysServiceAgent;

    @RequiresPermissions("stmGoods_create")
    @ApiOperation(value = "create", httpMethod = "POST")
    @RequestMapping(value = "create", method = RequestMethod.POST)
    public RetMsg<Long> create(HttpServletRequest request, StmGoodsParam param) {
        StmGoodsPojo pojo = new StmGoodsPojo();
        try {
            BeanUtils.copyProperties(pojo, param);
            Date now = DateUtil.getNowTime();
            pojo.setActiveDate(now);
        } catch (IllegalAccessException | InvocationTargetException e) {
            logger.error("", e);
        }
        Number num = sysServiceAgent.quickCrudService.create(pojo);
        return RetMsg.success(num.longValue());
    }

    @RequiresPermissions("stmGoods_deleteById")
    @ApiOperation(value = "deleteById", httpMethod = "POST")
    @RequestMapping(value = "deleteById", method = RequestMethod.POST)
    public RetMsg<Object> deleteById(HttpServletRequest request, Long seqId) {
        StmGoodsPojo pojo = new StmGoodsPojo();
        pojo.setIsDel(1);
        pojo.setSeqId(seqId);
        int ret = sysServiceAgent.quickCrudService.updateById(pojo);
        if (ret == 0) {
            throw new BusinessException("删除失败");
        }
        return RetMsg.success();
    }

    @RequiresPermissions("stmGoods_updateById")
    @ApiOperation(value = "updateById", httpMethod = "POST")
    @RequestMapping(value = "updateById", method = RequestMethod.POST)
    public RetMsg<Object> updateById(HttpServletRequest request, Long seqId, StmGoodsParam param) {
        StmGoodsPojo pojo = new StmGoodsPojo();
        try {
            BeanUtils.copyProperties(pojo, param);
            pojo.setSeqId(seqId);
        } catch (IllegalAccessException | InvocationTargetException e) {
            logger.error("", e);
        }
        int ret = sysServiceAgent.quickCrudService.updateById(pojo);
        if (ret == 0) {
            throw new BusinessException("更新失败");
        }
        return RetMsg.success();
    }

    @RequiresPermissions("stmGoods_readById")
    @ApiOperation(value = "readById", httpMethod = "POST")
    @RequestMapping(value = "readById", method = {RequestMethod.POST, RequestMethod.GET})
    public RetMsg<StmGoodsVo> readById(HttpServletRequest request, Long seqId) {
        StmGoodsPojo pojo = sysServiceAgent.quickCrudService.getById(StmGoodsPojo.class, seqId);
        StmGoodsVo vo = new StmGoodsVo();
        try {
            BeanUtils.copyProperties(vo, pojo);
        } catch (IllegalAccessException | InvocationTargetException e) {
            logger.error("", e);
        }
        return RetMsg.success(vo);
    }

    @RequiresPermissions("stmGoods_count")
    @ApiOperation(value = "count", httpMethod = "GET")
    @RequestMapping(value = "count", method = RequestMethod.GET)
    public RetMsg<Long> count(HttpServletRequest request, StmGoodsParam param) {
        StmGoodsPojo pojo = new StmGoodsPojo();
        try {
            BeanUtils.copyProperties(pojo, param);
        } catch (IllegalAccessException | InvocationTargetException e) {
            logger.error("", e);
        }
        long cnt = sysServiceAgent.quickCrudService.count(StmGoodsPojo.class, pojo);
        return RetMsg.success(cnt);
    }

    @RequiresPermissions("stmGoods_readList")
    @ApiOperation(value = "readList", httpMethod = "POST")
    @RequestMapping(value = "readList", method = RequestMethod.POST)
    public RetMsg<ListDataWrap<StmGoodsPojo>> readList(HttpServletRequest request, StmGoodsParam param) {
        StmGoodsPojo pojo = new StmGoodsPojo();
        try {
            BeanUtils.copyProperties(pojo, param);
            pojo.setIsDel(0);
        } catch (IllegalAccessException | InvocationTargetException e) {
            logger.error("", e);
        }
        Page page = new Page(5000, 1);//限制，不全部查询
        ListDataWrap<StmGoodsPojo> list = sysServiceAgent.quickCrudService.getList(StmGoodsPojo.class, pojo, page);
        return RetMsg.success(list);
    }

    @RequiresPermissions("stmGoods_readAndCount")
    @ApiOperation(value = "readAndCount", httpMethod = "POST")
    @RequestMapping(value = "readAndCount", method = RequestMethod.POST)
    public RetMsg<ListDataWrap<StmGoodsPojo>> readAndCount(HttpServletRequest request, StmGoodsParam param, Page page) {
        StmGoodsPojo pojo = new StmGoodsPojo();
        try {
            BeanUtils.copyProperties(pojo, param);
            pojo.setIsDel(0);
        } catch (IllegalAccessException | InvocationTargetException e) {
            logger.error("", e);
        }
        ListDataWrap<StmGoodsPojo> list = sysServiceAgent.quickCrudService.getList(StmGoodsPojo.class, pojo, page);
        return RetMsg.success(list);
    }

    @RequestMapping(value = "updateStatusById", method = RequestMethod.POST)
    public RetMsg<String> updateStatusById(HttpServletRequest request, Long seqId, Integer status) {

        StmGoodsPojo pojo = new StmGoodsPojo();
        pojo.setStatus(status);
        pojo.setSeqId(seqId);
        int ret = sysServiceAgent.quickCrudService.updateById(pojo);
        if (ret > 0) {
            return RetMsg.success();
        }
        return RetMsg.error(1002, "更新失败");
    }

    @RequestMapping(value = "getGoodsContentById", method = RequestMethod.POST)
    public RetMsg<String> getGoodsContentById(HttpServletRequest request, Long seqId) {

        String sql = "select detail from stm_goods where seq_id=:seqId ";
        String content = sysServiceAgent.quickSimpleService.queryForString(sql, ParamMap.newOne("seqId", seqId));
        if (content != null) {
            return RetMsg.success(content);
        }
        return RetMsg.success("");
    }

    @RequestMapping(value = "getClassify")
    @ResponseBody
    public RetMsg<List<StmGoodsClassifyPojo>> getClassify() {
        String sql = "select seq_id,name from stm_goods_classify where is_del = 0";
        List<StmGoodsClassifyPojo> classifys = sysServiceAgent.quickSimpleService.queryForList(sql, StmGoodsClassifyPojo.class);
        return RetMsg.success(classifys);
    }
}
