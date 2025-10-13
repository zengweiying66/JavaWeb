<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2025/10/13
  Time: 11:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>获取当前日期</title>
</head>
<body>
<P>
    今天的日期是：<%= (new java.util.Date()).toLocaleString() %>
</P>
</body>
</html>
