<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2025/10/20
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
    <script>
        //前端校验密码和确定密码是否一致
        function validateForm(){
            //获取文档ID为password的元素的当前值
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            if(password != confirmPassword){
                //调用函数alert 用于显示弹出一个提示
                alert("密码和确认密码不一致，请重新输入");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<h1>用户注册</h1>
<form action="/register" method="post" onsubmit="return validateForm()">
    <!--用户名输入框-->
    <label for="username">用户名:</label>
    <input type="text" id="username" name="username" required>
    <br><br>

    <label for="email">邮箱:</label>
    <input type="email" id="email" name="email" required>
    <br><br>

    <label for="password">密码:</label>
    <input type="password" id="password" name="password" required>
    <br><br>

    <label for="confirmPassword">确认密码:</label>
    <input type="password" id="confirmPassword" name="confirmPassword" required>
    <br><br>
</body>
</html>
