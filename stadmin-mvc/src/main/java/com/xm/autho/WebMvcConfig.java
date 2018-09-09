package com.xm.autho;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.xm.autho.intercept.LoginInterceptor;
import com.xm.autho.intercept.AuthoInterceptor;

@Component
public class WebMvcConfig extends WebMvcConfigurerAdapter {

	@Autowired
	private LoginInterceptor loginInterceptor;
	@Autowired
	private AuthoInterceptor authoInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		String[] exclusions = { "/login","/logout","/autho/**" };
		registry.addInterceptor(loginInterceptor).excludePathPatterns(exclusions);
		registry.addInterceptor(authoInterceptor).excludePathPatterns(exclusions);
		super.addInterceptors(registry);
	}

}