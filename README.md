###spring boot栗子

- 使用：```Java8， lombok```
- 集成：mybatis,pagehelper,tk.mybatis
- 使用： freemarker、jsp
- 模块： api、webapp

导入前确保使用Java8， lombok已经安装到集成开发环境（Eclispe、Idea）
#####lombok新

 官方： https://projectlombok.org/
 注解API： https://projectlombok.org/features/index.html
 
编译前先导入sql目录中的schema、data (seed)数据，否则unit、service、functional test会失败
如果不想管unit test，使用``` mvn package -Dmaven.test.skip=true```打包

###模块： 
+  base:        基础封装模块
+  service:     基础服务模块
+  api:         API服务模块
+  web:         传统前台模块
+  management:  后台管理模块

###management
start ManagementMain.java
open browser to url:
``` http://localhost:8081```
management ship with a default user, ```admin/admin```

  
###API

start APIMain.java
open browser to url:
``` http://localhost:8081/api/V1/swagger-ui.html```
   for default swagger API docs & server

  
   
###从表生成 mybatis（tk mybatis） domain、dao、mapper

 adjust /boot-showcase-service/src/main/resources/mybatis-generator,
  ```generator.properties``` and ```generatorConfig.xml```
 cmd swith to /boot-showcase-service
 run ```mvn mybatis-generator:generate```
 you will get it. 
 
   
###开发手册：
  ```
    https://flian.gitbooks.io/lina/content/
  ```
