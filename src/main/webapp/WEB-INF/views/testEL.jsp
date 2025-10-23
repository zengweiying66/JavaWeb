<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2025/10/23
  Time: 09:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.model.User" %>
<%
    User user = new User(7,"彭豪", 20);
    pageContext.setAttribute("user", user);
%>

<html>
<head>
    <title>测试EL</title>
</head>
<body>
    <h2>通过EL访问对象的属性</h2>
    <p>名字是:${user.name}<p>
</body>
</html>
