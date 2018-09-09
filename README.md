# stadmin

#### 项目介绍
基于framework-springboot实现的简易商城后台管理系统

#### 软件架构
springboot、druid、redis、mysql、layui

#### 功能
- [x] 前后端分离 ajax+json交互
- [x] druid监控
- [x] 自动部署
- [x] 单元测试
- [x] 全局配置中心
- [x] 用户角色权限系统
- [x] 商品管理
- [ ] 数据字典
- [ ] 传输加密处理

#### 部署教程
1. 下载framework与stadmin
2. 导入数据库教程 /stadmin-sqlscript/init_data.sql
3. 配置 application.properties
```
spring.datasource.url = jdbc:mysql://127.0.0.1:3306/stadmin
spring.datasource.username = root
spring.datasource.password = root
```
4. 配置 nginx
```
location ^~ /stadmin {
    proxy_pass http://127.0.0.1:12126;
}
location ^~ /stadmin-static/ {
    alias /usr/webser/static/stadmin-static/;
}
```
5. 启动应用 App.java
6. 商城后台 http://127.0.0.1/stadmin-static/layui/views/
账号密码 admin/123456
7. druid监控 http://127.0.0.1/stadmin/druid/login.html 
账号密码 admin/admin123



