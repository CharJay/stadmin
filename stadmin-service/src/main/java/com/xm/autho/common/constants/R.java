package com.xm.autho.common.constants;

import java.nio.charset.Charset;

public abstract class R {
	public static class SysConfig {
		public static final String SYS_TABLE_PREFIX = "stms_";
		public static final String DEFAULT_PWD = "7c4a8d09ca3762af61e59520943dc26494f8941b";//默认密码123456
	}
	public static class Charsets {
		public static final Charset UTF8 = Charset.forName("UTF-8");
		public static final Charset GBK = Charset.forName("GBK");
	}

	public static class Session {
		public static final String TOKEN_NAME = "token";
		public static final String TOKEN_REDIS_KEY = "stm:usertoken:";
	}
}
