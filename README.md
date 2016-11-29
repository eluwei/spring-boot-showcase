###spring boot栗子

- 使用：`Java8， lombok`
- 集成：mybatis,pagehelper,tk.mybatis
- migration: 使用flywaydb
- 使用： freemarker、jsp
- 模块： api、webapp

导入前确保使用Java8， lombok已经安装到集成开发环境（Eclispe、Idea）
#####lombok新

 官方： [lombok home](https://projectlombok.org/)   
 注解API：[lombok api](https://projectlombok.org/features/index.html)
 
####flywaydb
  官方[flywaydb](https://flywaydb.org/documentation/migration/)
  默认会按照 
  `V<VERSION>__<NAME>.sql (with <VERSION> an underscore-separated version, e.g. ‘1’ or ‘2_1’). `
  spring boot关于
  [flywaydb介绍](https://docs.spring.io/spring-boot/docs/current/reference/html/howto-database-initialization.html#howto-execute-flyway-database-migrations-on-startup)
  
如果不想管unit test，使用` mvn package -Dmaven.test.skip=true`打包

###模块： 
+  base:        基础封装模块
+  service:     基础服务模块
+  web:         传统前台模块
+  management:  后台管理模块
+  API:         API服务模块

###base
TBD

###service
- 使用MBG生成domain->dao->xml
- mapper默认继承MyMapper，自动获取CRUD、Example搜索功能
- service继承BaseService自动获取CRUD方法

#### 从表生成 mybatis（tk mybatis） domain、dao、mapper

 调整 /boot-showcase-service/src/main/resources/mybatis-generator,
  `generator.properties` and `generatorConfig.xml`
 cmd 进入 /boot-showcase-service
 run `mvn mybatis-generator:generate`
 Dao、domain、mapper会生成到指定文件夹
 
###management
- Controller继承BaseController，获取异常自动封装
- 默认包含category树CRUD
- 默认包含Product、SKU SPA CRUD
- 默认包含用户管理
- 包含一套基于数据库配置、URL权限管理。(TBD)
- 默认包含用户修改密码功能

start ManagementMain.java
open browser to url:
[http://localhost:8081](http://localhost:8081)
management ship with a default user, `admin/admin`

###Web
- 使用webjars依赖。[webjars官方](http://www.webjars.org/classic)
- 由于使用了jsp，IDEA用户需要设置 working_dir=$MODULE_DIR$` 
![working dir设置](/docs/img/working-directory.jpg)
- 设置了auto_import: "/layout/defaultLayout.ftl" as layout，无需在页面在import一次模板
- 使用webjars & requireJS 管理js依赖 (参考defaultLayout.ftl, index.ftl, index.js)

###API
start APIMain.java
open browser to url:
   [http://localhost:8081/api/V1/swagger-ui.html](http://localhost:8081/api/V1/swagger-ui.html)
   for default swagger API docs & server
   
   
###开发手册：
[LINA manual](https://flian.gitbooks.io/lina/content/)
 
### TODO
+ 完善权限
+ 除mysql外其他数据库的支持？如oracle
+ web前台show case完善