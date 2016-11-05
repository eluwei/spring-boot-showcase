spring boot栗子
集成：mybatis,pagehelper,tk.mybatis
使用： jsp、freemarker
模块： api、webapp


编译前先导入sql目录中的schema、data数据，否则unit、service、functional test会失败

模块：
  service: 基础服务模块
  api:     json服务模块
  web:     传统前台模块
  management: 后台模块
  
  开发手册：
    https://flian.gitbooks.io/lina/content/
    
  management: 后台模块
  
  ``` API ```
  start APIMain:
  view:
  http://localhost:8081/api/V1/swagger-ui.html for default swagger API docs & server
   
   
 ```Gen Code from Databse ```
 adjust /boot-showcase-service/src/main/resources/mybatis-generator, generator.properties and 
 generatorConfig.xml
 cmd swith to /boot-showcase-service
 run mvn mybatis-generator:generate
 you will get it. 