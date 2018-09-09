package com.xm.stadmin.common.constants;


public class AopConstants {
    
    public final static String PRJ_PACKAGE="com.xm.stadmin";
    
    public final static String AOP_MVC_CTRL_DATA="execution(* "+PRJ_PACKAGE+".ctrl.data..*(..)) and @annotation(org.springframework.web.bind.annotation.RequestMapping)";
    
    public final static String AOP_HTTPCLIENT_SERVICE="execution(* com.core.utils.remote..*(..)) ";
}
