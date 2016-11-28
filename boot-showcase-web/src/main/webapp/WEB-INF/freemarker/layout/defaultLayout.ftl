
<#macro defaultLayout title css="" js="" charset="utf-8" lang="zh-CN">
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<title>${title}</title>

<#include "/common/css.ftl"/>
    <!-- additional CSS -->
    <#if css?? && css !="">
        <link rel="stylesheet" href="${rc.contextPath}/${css}">
    </#if>

<#include "/common/js.ftl"/>
<!-- additional  javascript-->
    <#if js?? && js!="">
        <script src="${rc.contextPath}/${js}"></script>
    </#if>

</head>
<body>
<#include "/common/header.ftl">

<#nested/>

</body>
</html>
</#macro>