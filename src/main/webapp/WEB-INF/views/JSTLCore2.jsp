<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2025/10/30
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人信息</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Microsoft YaHei", "PingFang SC", "Hiragino Sans GB", sans-serif;
            background: linear-gradient(to bottom, #fef5e7, #fff9f0);
            min-height: 100vh;
            padding: 40px 20px;
        }

        .container {
            max-width: 550px;
            margin: 0 auto;
            background: #fff;
            border-radius: 16px;
            padding: 42px 45px;
            box-shadow: 0 8px 40px rgba(212, 175, 55, 0.12);
            border: 1px solid rgba(212, 175, 55, 0.15);
        }

        .header {
            text-align: center;
            margin-bottom: 38px;
            padding-bottom: 24px;
            border-bottom: 2px solid #f5f5f5;
            position: relative;
        }

        .header::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 2px;
            background: linear-gradient(to right, #d4af37, #f4d03f);
        }

        h2 {
            font-size: 26px;
            color: #2c3e50;
            font-weight: 500;
            margin-bottom: 8px;
        }

        .subtitle {
            font-size: 13px;
            color: #95a5a6;
            letter-spacing: 1px;
        }

        .info-card {
            background: linear-gradient(135deg, #fdfbf7 0%, #fcf8f3 100%);
            border-radius: 12px;
            padding: 28px;
            margin-bottom: 24px;
            border: 1px solid #f0ebe3;
        }

        .info-row {
            display: flex;
            align-items: center;
            margin-bottom: 18px;
            padding-bottom: 18px;
            border-bottom: 1px dashed #ede8e0;
        }

        .info-row:last-child {
            margin-bottom: 0;
            padding-bottom: 0;
            border-bottom: none;
        }

        .info-label {
            font-size: 15px;
            color: #7f8c8d;
            min-width: 70px;
            display: flex;
            align-items: center;
        }

        .info-label::before {
            content: '●';
            color: #d4af37;
            margin-right: 8px;
            font-size: 10px;
        }

        .info-value {
            font-size: 16px;
            color: #2c3e50;
            font-weight: 500;
        }

        .age-box {
            background: linear-gradient(135deg, #fff8e1 0%, #fff3cd 100%);
            border-radius: 12px;
            padding: 28px;
            margin: 28px 0;
            border: 1px solid #ffeaa7;
            box-shadow: 0 4px 15px rgba(255, 234, 167, 0.3);
        }

        .age-title {
            font-size: 14px;
            color: #d68910;
            margin-bottom: 16px;
            font-weight: 500;
        }

        .age-input-wrapper {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 16px;
        }

        input[type="number"] {
            flex: 1;
            background: #fff;
            border: 2px solid #f4d03f;
            color: #2c3e50;
            padding: 12px 16px;
            border-radius: 8px;
            font-size: 17px;
            font-weight: 500;
            transition: all 0.3s;
        }

        input[type="number"]:focus {
            outline: none;
            border-color: #d4af37;
            box-shadow: 0 0 0 3px rgba(212, 175, 55, 0.1);
        }

        .age-display {
            background: #fff;
            padding: 12px 20px;
            border-radius: 8px;
            font-size: 16px;
            color: #d68910;
            font-weight: 600;
            border: 2px solid #f4d03f;
            min-width: 80px;
            text-align: center;
        }

        .status-tag {
            padding: 8px 18px;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 500;
            display: inline-block;
        }

        .status-tag.adult {
            background: linear-gradient(135deg, #a8e063 0%, #56ab2f 100%);
            color: #fff;
            box-shadow: 0 3px 10px rgba(86, 171, 47, 0.3);
        }

        .status-tag.minor {
            background: linear-gradient(135deg, #ff6b6b 0%, #ee5a6f 100%);
            color: #fff;
            box-shadow: 0 3px 10px rgba(238, 90, 111, 0.3);
        }

        .hobbies-section {
            margin-top: 32px;
        }

        .section-title {
            font-size: 16px;
            color: #2c3e50;
            margin-bottom: 18px;
            font-weight: 500;
            display: flex;
            align-items: center;
        }

        .section-title::before {
            content: '';
            width: 4px;
            height: 18px;
            background: linear-gradient(to bottom, #d4af37, #f4d03f);
            margin-right: 10px;
            border-radius: 2px;
        }

        .hobby-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
            list-style: none;
        }

        .hobby-tags li {
            background: linear-gradient(135deg, #fff 0%, #fef9f3 100%);
            color: #5d4e37;
            padding: 10px 20px;
            border-radius: 20px;
            font-size: 14px;
            border: 1.5px solid #e8dcc4;
            transition: all 0.3s;
            cursor: default;
        }

        .hobby-tags li:hover {
            border-color: #d4af37;
            background: linear-gradient(135deg, #fff8e1 0%, #fff3cd 100%);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(212, 175, 55, 0.2);
        }

        .decoration {
            text-align: center;
            margin-top: 32px;
            padding-top: 24px;
            border-top: 1px solid #f5f5f5;
        }

        .decoration span {
            display: inline-block;
            width: 6px;
            height: 6px;
            background: #d4af37;
            border-radius: 50%;
            margin: 0 4px;
            opacity: 0.3;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h2>个人档案</h2>
        <p class="subtitle">PERSONAL PROFILE</p>
    </div>

    <c:set var="name" value="张三" />
    <c:set var="hobbies" value="${['阅读', '游泳', '编程']}" />

    <div class="info-card">
        <div class="info-row">
            <span class="info-label">姓名</span>
            <span class="info-value">${name}</span>
        </div>
    </div>

    <div class="age-box">
        <div class="age-title">年龄信息</div>
        <div class="age-input-wrapper">
            <input type="number" id="ageInput" value="17" min="1" max="120" oninput="updateAge()" placeholder="请输入年龄" />
            <div class="age-display">
                <span id="ageDisplay">17</span> 岁
            </div>
        </div>
        <div style="text-align: center;">
            <span class="status-tag" id="ageStatus">未成年</span>
        </div>
    </div>

    <div class="hobbies-section">
        <div class="section-title">兴趣爱好</div>
        <ul class="hobby-tags">
            <c:forEach var="hobby" items="${hobbies}">
                <li>${hobby}</li>
            </c:forEach>
        </ul>
    </div>

    <div class="decoration">
        <span></span>
        <span></span>
        <span></span>
    </div>
</div>

<script>
    window.onload = function() {
        updateAge();
    };

    function updateAge() {
        var age = parseInt(document.getElementById('ageInput').value) || 0;
        document.getElementById('ageDisplay').textContent = age;

        var status = document.getElementById('ageStatus');
        if (age >= 18) {
            status.textContent = '已成年';
            status.className = 'status-tag adult';
        } else {
            status.textContent = '未成年';
            status.className = 'status-tag minor';
        }
    }
</script>
</body>
</html>