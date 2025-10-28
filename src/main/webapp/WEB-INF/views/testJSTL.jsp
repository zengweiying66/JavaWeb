<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2025/10/28
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<body>
<!-- JSTL核心标签库 -->
<!-- 1. 变量操作 -->
<c:set var="message" value="欢迎学习JSTL" scope="page"/>
<p>消息内容: <c:out value="${message}"/></p>

<!-- 2. 条件判断 -->
<c:set var="userRole" value="admin"/>
<p>用户角色: ${userRole}</p>
<c:if test="${userRole == 'admin'}">
    <p style="color:green;">管理员权限已激活</p>
</c:if>

<h2>当前日期格式化：</h2>
<fmt:formatDate value="<%= new java.util.Date() %>" pattern="yyyy-MM-dd HH:mm:ss" />

<p>
    字符串 "Hello" 的长度是:
<%--    <fn:length value="Hello"/>--%>
    ${fn:length("Hello")}
</p>

</body>
</html>