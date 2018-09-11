package com.xm.stadmin;

import com.framework.core.db.dynamic.DynamicDataSourceRegister;
import org.apache.catalina.connector.Connector;
import org.apache.coyote.http11.Http11NioProtocol;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.embedded.EmbeddedServletContainerFactory;
import org.springframework.boot.context.embedded.tomcat.TomcatConnectorCustomizer;
import org.springframework.boot.context.embedded.tomcat.TomcatEmbeddedServletContainerFactory;
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
	public EmbeddedServletContainerFactory servletContainer() {
		TomcatEmbeddedServletContainerFactory tomcat = new TomcatEmbeddedServletContainerFactory();
		tomcat.addConnectorCustomizers(new TomcatConnectorCustomizer() {

			@Override
			public void customize(Connector arg0) {
				Http11NioProtocol handler = (Http11NioProtocol) arg0.getProtocolHandler();
				// 设置最大连接数
				handler.setMaxConnections(2000);
				// 设置最大线程数
				handler.setMaxThreads(2000);
				handler.setConnectionTimeout(30000);

			}
		});
		return tomcat;
	}

	@Bean
	public ThreadPoolTaskExecutor taskExecutor() {
		ThreadPoolTaskExecutor pool = new ThreadPoolTaskExecutor();
		pool.setCorePoolSize(5);
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
		scheduler.setPoolSize(4);//可根据并发定时任务数设置
		return scheduler;
	}

	//u-insert#
	
}
