package com.xm.autho.common.constants;

public abstract class BusinessCode {
	
	/**
	 * 1000~9999
	 *
	 */
	public abstract static class Sys {
		/**
		 * 短信验证码失效
		 */
		public static final Integer VCODE_EXPIRED = 1101;
		/**
		 * 短信验证码错误
		 */
		public static final Integer VCODE_ERROR = 1102;
	}

	/**
	 * 100001~100999
	 *
	 */
	public abstract static class Account{
		/**
		 * 账号不存在
		 */
		public static final Integer USERNAME_NOT_FOUND = 100001;
		/**
		 * 密码错误
		 */
		public static final Integer PASSWORD_ERROR = 100002;
		/**
		 * 封号
		 */
		public static final Integer IS_BANNED = 100003;
	}
}
