<#--
     项目：Tiger示例框架
     功能：自定义的分页指令。
   pager      分页实体(@See #com.tiger.framework.datamodel.Pager)
   toURL      点击分页标签时要跳转到的目标URL(string类型)（1、绝对路径、2、相对路径）
	使用方式：
    <#import "/common/pager.ftl" as mypage>
    <@mypage.pager pagerBean=pager toURL="/tiger-platform/web/wallet/walletList" />
     作者：Charles(charles.wang0@pactera.com)
-->


<#macro pager pagerBean toURL>
<#-- 定义局部变量 -->
<#assign pageNo=pagerBean.pageNo>
<#assign pageCount=pagerBean.pageCount>
<#assign recordCount=pagerBean.recordCount>
<#if recordCount==0><#return/></#if>

<#-- 输出分页样式，TODO 待抽取到独立的css文件中 -->
<style type="text/css">
    .pagination {
        margin-top: 10px;
        padding: 5px;
        float: right;
        font-size: 12px;
    }

    .pagination a, .pagination a:link, .pagination a:visited {
        padding: 2px 5px;
        margin: 2px;
        border: 1px solid #aaaadd;
        text-decoration: none;
        color: #006699;
    }

    .pagination a:hover, .pagination a:active {
        border: 1px solid #ff0000;
        color: #000;
        text-decoration: none;
    }

    .pagination span.current {
        padding: 2px 5px;
        margin: 2px;
        border: 1px solid #ff0000;
        font-weight: bold;
        background-color: #ff0000;
        color: #FFF;
    }

    .pagination span.disabled {
        padding: 2px 5px;
        margin: 2px;
        border: 1px solid #eee;
        color: #ddd;
    }
</style>

<#-- 这个页码在正常情况下是不会越界的，哈哈 -->
<#--<#if (pageNo > pageCount)>
    <#assign pageNo=pageCount>
</#if>
<#if (pageNo < 1)>
    <#assign pageNo=1>
</#if>-->

<#-- 输出分页表单 -->
<div class="pagination">
    <form method="post" action="" name="qPagerForm">
        <#-- 把请求中的所有参数当作隐藏表单域(无法解决一个参数对应多个值的情况) -->
        <#list RequestParameters?keys as key>
            <#if (key!="pageNo" && RequestParameters[key]??)>
                <input type="hidden" name="${key}" value="${RequestParameters[key]}"/>
            </#if>
        </#list>
        <input type="hidden" name="pageNo" value="${pageNo}"/>
        <#-- 首页 -->
        <#if (pageNo == 1)>
            <span class="disabled">&laquo;&nbsp;首页</span>
        <#else>
            <a href="javascript:void(0)" onclick="turnOverPage(1)">&laquo;&nbsp;首页</a>
        </#if>
        <#-- 上一页处理 -->
        <#if (pageNo == 1)>
            <span class="disabled">&laquo;&nbsp;上一页</span>
        <#else>
            <a href="javascript:void(0)" onclick="turnOverPage(${pageNo - 1})">&laquo;&nbsp;上一页</a>
        </#if>
        <#-- 如果前面页数过多,显示... -->
        <#assign start=1>
        <#if (pageNo > 4)>
            <#assign start=(pageNo - 1)>
            <a href="javascript:void(0)" onclick="turnOverPage(1)">1</a>
            <a href="javascript:void(0)" onclick="turnOverPage(2)">2</a>&hellip;
        </#if>
        <#-- 显示当前页号和它附近的页号 -->
        <#assign end=(pageNo + 1)>
        <#if (end > pageCount)>
            <#assign end=pageCount>
        </#if>
        <#list start..end as i>
            <#if (pageNo==i)>
                <span class="current">${i}</span>
            <#else>
                <a href="javascript:void(0)" onclick="turnOverPage(${i})">${i}</a>
            </#if>
        </#list>
        <#-- 如果后面页数过多,显示... -->
        <#if (end < pageCount - 2)>
            &hellip;
        </#if>
        <#if (end < pageCount - 1)>
            <a href="javascript:void(0)" onclick="turnOverPage(${pageCount - 1})">${pageCount-1}</a>
        </#if>
        <#if (end < pageCount)>
            <a href="javascript:void(0)" onclick="turnOverPage(${pageCount})">${pageCount}</a>
        </#if>
        <#-- 下一页处理 -->
        <#if (pageNo == pageCount)>
            <span class="disabled">下一页&nbsp;&raquo;</span>
        <#else>
            <a href="javascript:void(0)" onclick="turnOverPage(${pageNo + 1})">下一页&nbsp;&raquo;</a>
        </#if>
        <#-- 尾页 -->
        <#if (pageNo == pageCount)>
            <span class="disabled">尾页&nbsp;&raquo;</span>
        <#else>
            <a href="javascript:void(0)" onclick="turnOverPage(${pageCount})">尾页&nbsp;&raquo;</a>
        </#if>
        跳到&nbsp;<input id="goPage" type="text" style="width: 40px"
                       onkeyup="value=value.replace(/[^\d]/g,'') "
                       onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"
                       onkeydown="if(event.keyCode==13) { gotoPage(${pageCount}); return false; }"
            >&nbsp;页
       
        <input type="button" value="Go" onclick="gotoPage(${pageCount})" />&nbsp;&nbsp;&nbsp;&nbsp;
    </form>

    <script language="javascript">
        /** 跳到指定页码的页面 */
        function turnOverPage(pageNo) {
            var qForm = document.qPagerForm;
            if (pageNo >${pageCount}) {
                pageNo =${pageCount};
            }
            if (pageNo < 1) {
                pageNo = 1;
            }
            qForm.pageNo.value = pageNo;
            qForm.action = "${toURL}";
            qForm.submit();
        }
        /** 跳到指定页面 */
        function gotoPage(pageCount) {
            var pageNo = document.getElementById("goPage").value;
            if(pageNo > pageCount) {
                pageNo = pageCount;
            }
            turnOverPage(pageNo);
        }
    </script>
</div>
</#macro>  