<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016-09-08
  Time: 13:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <title>jsp cards list</title>

</head>
<body>
<a href="/cards">freemarker version</a>
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
  <c:forEach var="card" items="cards">
      <tr>
        <td>${card.id}</td>
        <td>${card.cardId}</td>
        <td>${card.faceValue}</td>
        <td>${card.frozenValue}</td>
        <td>${card.balanceValue}</td>
        <td>${card.comments}</td>
      </tr>
  </c:forEach>
  </#list>
</table>
</body>
</html>
