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
    h3{  <%-- h3的样式--%>
        color: #1956FF;
    }
    .table-content-class{ <%-- 表格与上面元素的间距--%>
        margin-top: 24px;
    }
    .table-content-class table {   <%-- 表格的外边框样式--%>
        border: solid 1px #1956FF;
    }
    .table-content-class td{   <%-- 表格的内部样式--%>
        border: solid 1px #1956FF;
        width: 100px;
    }
    .input-content-class{    <%-- 输入框外部样式（父级）--%>
        width: 320px;
        height: 32px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        border: solid 1px #1956FF;
        border-radius: 10px;
        padding: 0 4px;
        margin-top: 24px;
    }
    input{   <%-- 输入框内部样式（子级）--%>
        width: 220px;
        height: 32px;
        border: solid 1px transparent;
        border-radius: 10px;
    }
    .search-btn-class{  <%-- 输入框搜索按钮样式（子级）--%>
        width: 60px;
        height: 26px;
        color: #FFFFFF;
        font-size: 12px;
        line-height: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        border: solid 1px #1956FF;
        background: #1956FF;
        border-radius: 10px;
        cursor: pointer;   <%-- 鼠标变小手--%>
    }
    h6{  <%-- h6样式--%>
        margin-top: 24px;
    }

    .header-class{
        display: flex;
        align-items: center;
    }
    .login-btn-class{
        width: 54px;
        height: 36px;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 14px;
        color: #1956FF;
        border-radius: 999px;
        background: transparent;
        border: solid 1px #1956FF;
        margin-left: 10px;
        cursor: pointer;
    }
</style>
<body>
<div class="outer-template-class">

    <div class="header-class">
        <h1>${siteName}</h1>  <%--读取配置属性siteName的值--%>
        <!-- 仅当用户未登录时才显示登录按钮 -->
        <c:if test="${empty sessionScope.loggedInUser}">
            <a class="login-btn-class" href="/login">
                <span>登录</span>
            </a>
        </c:if>
    </div>
    <a href="/forwardToStar">✨一眼蓝空✨</a>
    <div class="input-content-class">
        <!--输入框-->
        <input type="text" placeholder="请搜索">
        <!--搜索框按钮-->
        <div class="search-btn-class">点击搜索</div>
    </div>
    <div class="table-content-class">
        <table>
            <tr>
                <td>序号</td>
                <td>姓名</td>
                <td>年齡</td>
            </tr>
            <c:forEach items="${users}" var="u">
                <tr>
                    <td>${u.id}</td>
                    <td>${u.name}</td>
                    <td>${u.age}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <h6>${siteVersion}❀${siteAuthor}</h6>
    <h6>上次访问时间: ${lastVisitTime}</h6>
    <h6>当前访问时间: ${currentVisitTime}</h6>
</div>
</body>
</html>
