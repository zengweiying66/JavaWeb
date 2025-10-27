<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head></head>
<body>
<h1>通过 pageContext 访问其他隐式对象</h1>
<!-- JSP -->
<%
    // 1. pageContext 获取 request 对象
    javax.servlet.http.HttpServletRequest req = (javax.servlet.http.HttpServletRequest) pageContext.getRequest();
    req.setAttribute("reqMsg", "通过pageContext 获取 request 对象成功");

    // 2. pageContext 获取 response 对象
    javax.servlet.http.HttpServletResponse res = (javax.servlet.http.HttpServletResponse) pageContext.getResponse();
    res.setHeader("resMsg", "通过pageContext 获取 response 对象成功");

    // 3. pageContext 获取 session 对象
    javax.servlet.http.HttpSession sess = pageContext.getSession();
    sess.setAttribute("sessMsg", "通过pageContext 获取 session 对象成功");

    // 4. pageContext 获取 application 对象
    javax.servlet.ServletContext app = pageContext.getServletContext();
    app.setAttribute("appMsg", "通过pageContext 获取 application 对象成功");

    // 5. pageContext 获取 out 对象
    javax.servlet.jsp.JspWriter outWriter = pageContext.getOut();
%>

<p>访问 request 属性： <%= req.getAttribute("reqMsg") %></p>

<p>访问 response 属性： <%= res.getHeader("resMsg") %></p>

<p>访问 session 属性：<%= sess.getAttribute("sessMsg") %></p>

<p>访问 application 属性：<%= app.getAttribute("appMsg") %></p>

<p>访问 out 对象输出：
    <%
        outWriter.println("通过 pageContext 获取的 out 对象成功");
    %>
</p>
</body>
</html>