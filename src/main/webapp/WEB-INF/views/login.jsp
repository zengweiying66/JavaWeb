<%--
  Created by IntelliJ IDEA.
  User: 爱丽丝
  Date: 2025/8/28
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <title></title>
</head>
<style>
    .outer-template-class{  <%--作用：页面内容水平垂直居中 --%>
        width: calc(90vw - 48px);
        height: 90vh;
        padding: 24px 60px;
        background: white;
        border-radius: 10px;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        overflow: auto;
    }
    .login-template-class{
        width: 300px;
        height: 200px;
        display: flex;
        flex-direction: column;
    }
    .login-user-content, .login-password-content{
        width: 100%;
        height: 40px;
        display: flex;
        margin-bottom: 10px;
    }
    .login-user-tips, .login-password-tips{
        width: 60px;
        height: 100%;
        display: inline-flex;
        align-items: center;
        font-size: 14px;
        color: #030303;
        margin-right: 8px;
    }
    .login-user-input, .login-password-input{
        width: 235px;
        height: 100%;
        border-radius: 8px;
        border: solid 1px #1956FF;
    }
    .login-btn-class{
        width: 100%;
        height: 40px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 14px;
        color: #FFFFFF;
        border-radius: 4px;
        cursor: pointer;
        background: #1956FF;
    }
</style>
<body>
<div class="outer-template-class">
    <form action="/login" method="post">
        <div class="login-template-class">
            <!-- 使用JSTL判断errorMessage -->
            <c:if test="${errorMessage == '0'}">
                <div style="color: red; margin-bottom: 10px;">
                    账户或密码错误，请重新登录!
                </div>
            </c:if>

            <div class="login-user-content">
                <div class="login-user-tips">用户名:</div>
                <input type="text" name="username" class="login-user-input" placeholder="请输入用户名">
            </div>
            <div class="login-password-content">
                <div class="login-password-tips">密码:</div>
                <input type="password" name="password" class="login-password-input" placeholder="请输入密码">
            </div>
            <button type="submit" class="login-btn-class">登录</button>
        </div>
    </form>
</div>



</body>
</html>
