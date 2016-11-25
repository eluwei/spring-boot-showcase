<#macro defaultLayout title charset="utf-8" lang="zh-CN">
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
    <link rel="stylesheet" href="${rc.contextPath}/css/common.css">

<!-- jQuery -->
    <script src="${rc.contextPath}/webjars/jquery/jquery.min.js"></script>

</head>
<body>
<#include "/common/header.ftl">

<#nested/>

</body>
</html>
</#macro>