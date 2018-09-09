package com.xm.stadmin.common.exception;

import javax.servlet.http.HttpServletRequest;

import com.framework.core.db.bean.RetMsg;
import com.framework.core.exception.BusinessException;
import com.framework.core.exception.WebAssertException;
import com.framework.core.utils.helper.CodeEnum;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;


@ControllerAdvice
class GlobalExceptionHandler {
	private static final org.slf4j.Logger logger = org.slf4j.LoggerFactory.getLogger(GlobalExceptionHandler.class);
	
    @ExceptionHandler(value = Exception.class)
    public ResponseEntity<RetMsg<Object>> defaultErrorHandler(HttpServletRequest req, Exception e) throws Exception {
        if(e instanceof BusinessException){
            logger.error("businessExceptionHandler", e);
            BusinessException ee = (BusinessException)e;
            return new ResponseEntity<>(RetMsg.error(ee.getErrCode(), ee.getLocalizedMessage()), HttpStatus.OK);
        }else if(e instanceof WebAssertException){
            logger.error("webAssertExceptionHandler", e);
            WebAssertException wae = (WebAssertException)e;
            return new ResponseEntity<>(RetMsg.error(wae.getErrCode(), wae.getLocalizedMessage()), HttpStatus.OK);
        }else{
            logger.error("exceptionHandler", e);
            CodeEnum.ERROR.getCode();
            return new ResponseEntity<>(RetMsg.error(CodeEnum.ERROR.getCode(), CodeEnum.ERROR.getDescr()), HttpStatus.OK);
        }
    }
}