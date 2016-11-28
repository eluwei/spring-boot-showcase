
<#macro defaultLayout title css="" js="" charset="utf-8" lang="zh-CN">
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<title>${title}</title>
<!-- Bootstrap -->
    <link rel='stylesheet' href='${rc.contextPath}/webjars/bootstrap/css/bootstrap.min.css'>
<!-- Overwrite CSS -->
    <link rel="stylesheet" href="${rc.contextPath}/static/css/common.css">
<!-- additional CSS -->
    <#if css?? && css !="">
        <link rel="stylesheet" href="${rc.contextPath}/${css}">
    </#if>
    <link href="//cdn.bootcss.com/tether/1.3.6/css/tether.min.css" rel="stylesheet">

<!-- jQuery -->
    <script src="${rc.contextPath}/webjars/jquery/jquery.min.js"></script>

<!-- bootstrap/bootbox  -->
    <!--<script src="//cdn.bootcss.com/tether/1.3.6/js/tether.min.js"></script> -->
    <script src="${rc.contextPath}/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script src="${rc.contextPath}/webjars/bootbox/bootbox.js"></script>

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