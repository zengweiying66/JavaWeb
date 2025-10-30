<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2025/10/30
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息展示</title>
</head>
<body>
<h2>个人信息：</h2>

<!-- 设置学生的姓名、年龄和兴趣爱好 -->
<c:set var="name" value="张三" />
<c:set var="age" value="17" />
<c:set var="hobbies" value="${['阅读', '游泳', '编程']}" />

<!-- 显示姓名 -->
<p>姓名：${name}</p>

<!-- 显示年龄 -->
<p>年龄：${age}</p>

<!-- 根据年龄判断是否成年 -->
<c:if test="${age >= 18}">
    <p>已成年</p>
</c:if>
<c:if test="${age < 18}">
    <p>未成年</p>
</c:if>

<!-- 显示兴趣爱好 -->
<h3>兴趣爱好：</h3>
<ul>
    <c:forEach var="hobby" items="${hobbies}">
        <li>${hobby}</li>
    </c:forEach>
</ul>
</body>
</html>