<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>freemarker cards list</title>

    </head>
    <body>
    <a href="/">jsp version</a>
    <table class="row table table-striped table-bordered">
        <tr>
            <td>序列号</td>
            <td>卡号</td>
            <td>面值</td>
            <td>已使用金额</td>
            <td>余额</td>
            <td>备注</td>
            <td>快捷操作</td>
        </tr>
    <#list cards as card>
        <tr>
            <td>${card.id}</td>
            <td>${card.cardId}</td>
            <td>${card.faceValue}</td>
            <td>${card.frozenValue}</td>
            <td>${card.balanceValue}</td>
            <td>${card.comments}</td>
         </tr>
    </#list>
        </table>
    </body>
</html>
