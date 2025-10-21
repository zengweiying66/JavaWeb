<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2025/10/21
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset=UTF-8">
    <title>蛋糕商城</title>
</head>
<body>
<!--网站头部-->
<header>
    <h1>欢迎来到蛋糕商城</h1>
    <a href="#">首页</a> <a href="#">蛋糕种类</a> <a href="#">购物车</a> <a href="#">联系我们</a>
</header>
<!--主体部分:蛋糕商品列表-->
<section class="product-list">
    <h2>蛋糕商品</h2>
   <div class="products">
       <!--商品卡片-->
       <div class="product-card">
           <img src="/images/cake1.png" alt="蛋糕1" width="300" height="300">
           <h3>玫瑰蛋糕</h3>
           <p>价格:￥88</p>
           <button>加入购物车</button>
       </div>

       <div class="product-card">
           <img src="/images/cake2.png" alt="蛋糕2" width="300" height="300">
           <h3>梵高的向日葵</h3>
           <p>价格:￥120</p>
           <button>加入购物车</button>
       </div>

       <div class="product-card">
           <img src="/images/cake3.png" alt="蛋糕3" width="300" height="300">
           <h3>枯叶蝶蛋糕</h3>
           <p>价格:￥100</p>
           <button>加入购物车</button>
       </div>
   </div>
</section>
<!--网站底部-->

<footer>
    <p>© 2025 蛋糕商城 版权所有</p>
</footer>

</body>
</html>
