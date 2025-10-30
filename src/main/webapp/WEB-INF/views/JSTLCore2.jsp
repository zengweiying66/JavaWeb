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
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Microsoft YaHei", sans-serif;
            background: #f5f7fa;
            padding: 40px 20px;
            line-height: 1.6;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
        }

        h2 {
            color: #2c3e50;
            font-size: 24px;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 2px solid #e8e8e8;
        }

        .info-section {
            margin-bottom: 25px;
        }

        .info-section p {
            color: #333;
            font-size: 16px;
            margin-bottom: 12px;
        }

        .info-section label {
            color: #555;
            font-size: 15px;
            font-weight: 500;
        }

        input[type="number"] {
            width: 120px;
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 15px;
            margin-left: 10px;
            transition: border-color 0.3s;
        }

        input[type="number"]:focus {
            outline: none;
            border-color: #4a90e2;
        }

        #ageDisplay {
            color: #4a90e2;
            font-weight: 600;
            font-size: 18px;
        }

        #ageStatus {
            display: inline-block;
            padding: 6px 16px;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 500;
            margin-top: 5px;
        }

        .status-adult {
            background-color: #e8f5e9;
            color: #2e7d32;
        }

        .status-minor {
            background-color: #ffebee;
            color: #c62828;
        }

        h3 {
            color: #2c3e50;
            font-size: 18px;
            margin-top: 30px;
            margin-bottom: 15px;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        ul li {
            background: #fafafa;
            padding: 12px 16px;
            margin-bottom: 8px;
            border-radius: 6px;
            color: #555;
            border-left: 3px solid #4a90e2;
            transition: all 0.2s;
        }

        ul li:hover {
            background: #f0f0f0;
            transform: translateX(5px);
        }

        ul li:before {
            content: "• ";
            color: #4a90e2;
            font-weight: bold;
            margin-right: 8px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>个人信息</h2>

    <!-- 设置学生的姓名、年龄和兴趣爱好 -->
    <c:set var="name" value="张三" />
    <c:set var="hobbies" value="${['阅读', '游泳', '编程']}" />

    <div class="info-section">
        <!-- 显示姓名 -->
        <p>姓名：${name}</p>

        <!-- 年龄输入 -->
        <p>
            <label>请输入年龄：</label>
            <input type="number" id="ageInput" value="17" min="1" max="120" onchange="updateAge()" />
        </p>

        <!-- 显示年龄 -->
        <p>年龄：<span id="ageDisplay">17</span> 岁</p>

        <!-- 根据年龄判断是否成年 -->
        <p id="ageStatus">未成年</p>
    </div>

    <!-- 显示兴趣爱好 -->
    <h3>兴趣爱好</h3>
    <ul>
        <c:forEach var="hobby" items="${hobbies}">
            <li>${hobby}</li>
        </c:forEach>
    </ul>
</div>

<script>
    // 页面加载时初始化
    window.onload = function() {
        updateAge();
    };

    function updateAge() {
        var age = document.getElementById('ageInput').value;
        document.getElementById('ageDisplay').textContent = age;

        var statusElement = document.getElementById('ageStatus');
        if (age >= 18) {
            statusElement.textContent = '已成年';
            statusElement.className = 'status-adult';
        } else {
            statusElement.textContent = '未成年';
            statusElement.className = 'status-minor';
        }
    }
</script>
</body>
</html>