###spring boot栗子

- 使用：`Java8， lombok`
- 集成：mybatis,pagehelper,tk.mybatis
- 使用： freemarker、jsp
- 模块： api、webapp

导入前确保使用Java8， lombok已经安装到集成开发环境（Eclispe、Idea）
#####lombok新

 官方： [lombok home](https://projectlombok.org/)   
 注解API：[lombok api](https://projectlombok.org/features/index.html)
 
编译前先导入sql目录中的schema、data (seed)数据，否则unit、service、functional test会失败   
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
TBD

###API
start APIMain.java
open browser to url:
   [http://localhost:8081/api/V1/swagger-ui.html](http://localhost:8081/api/V1/swagger-ui.html)
   for default swagger API docs & server
   
   
###开发手册：
[LINA manual](https://flian.gitbooks.io/lina/content/)
 
