package com.xm.autho.common.constants;

import java.nio.charset.Charset;

public abstract class R {
	public static class SysConfig {
		public static final String SYS_TABLE_PREFIX = "stms_";
	}
	public static class Charsets {
		public static final Charset UTF8 = Charset.forName("UTF-8");
		public static final Charset GBK = Charset.forName("GBK");
	}

	public static class Session {
		public static final String TOKEN_NAME = "_vc";
		public static final String TOKEN_REDIS_KEY = "stm:usertoken:";
	}
}
