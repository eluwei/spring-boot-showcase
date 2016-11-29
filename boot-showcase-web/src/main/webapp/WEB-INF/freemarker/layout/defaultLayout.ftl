
<#macro defaultLayout title requires='' charset="utf-8" lang="zh-CN">
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
    <script src="/webjarsjs"></script>
    <script src="webjars/requirejs/require.min.js"></script>
    <script type="application/javascript">
        require(["jquery","bootstrap"]);
        <#if requires?? && requires!="">
            <#list requires?split(",") as require>
                require(["${require}"]);
            </#list>
        </#if>
    </script>
</head>
<body>

<#nested/>

</body>
</html>
</#macro>