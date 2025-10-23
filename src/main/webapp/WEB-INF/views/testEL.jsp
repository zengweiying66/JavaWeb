<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2025/10/23
  Time: 09:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.model.User" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    User user = new User(7,"彭豪", 20);
    pageContext.setAttribute("user", user);
    pageContext.setAttribute("username", "冯震键");
%>

<html>
<head>
    <title>测试EL</title>
</head>
<body>
    <h2>通过EL访问对象的属性</h2>
    <p>名字是:${user.name}<p>

    <h2>字符串的长度:</h2>
    <p>字符串 "Hello，World!" 的长度是:${fn:length("Hello，World!")}</p>

    <h2>页面作用域变量:</h2>
    <p>用户名是:${pageScope.username}</p>
</body>
</html>
