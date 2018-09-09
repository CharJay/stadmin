package com.xm.stadmin;

import com.framework.core.db.dynamic.DynamicDataSourceRegister;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;

/**
 * 启动程序
 */
@SpringBootApplication
//@Import({DynamicDataSourceRegister.class})//注册动态多数据源
@ComponentScan(basePackages={"com.framework","com.xm"})
public class App {
	public static void main(String[] args) {
	    
		SpringApplication.run(App.class, args);
	}
	//u-insert#other3#
	@Bean
	public ThreadPoolTaskExecutor taskExecutor() {
		ThreadPoolTaskExecutor pool = new ThreadPoolTaskExecutor();
		pool.setCorePoolSize(1);
		pool.setMaxPoolSize(100);
		pool.setWaitForTasksToCompleteOnShutdown(true);
		return pool;
	}
	/**
	 * 定时器多线程
	 * @return
	 */
	@Bean
	public TaskScheduler taskScheduler() {
		ThreadPoolTaskScheduler scheduler = new ThreadPoolTaskScheduler();
		scheduler.setPoolSize(3);//可根据并发定时任务数设置
		return scheduler;
	}
	//u-insert#
	
}
