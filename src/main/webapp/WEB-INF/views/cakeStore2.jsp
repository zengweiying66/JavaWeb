<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>蛋糕商城</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Microsoft YaHei', Arial, sans-serif;
            background: linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%);
            min-height: 100vh;
        }

        /* 头部样式 */
        header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px 20px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        header h1 {
            font-size: 2.5em;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.2);
        }

        header a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            padding: 10px 20px;
            border-radius: 25px;
            transition: all 0.3s ease;
            display: inline-block;
        }

        header a:hover {
            background: rgba(255,255,255,0.2);
            transform: translateY(-2px);
        }

        /* 主体部分 */
        .product-list {
            max-width: 1200px;
            margin: 40px auto;
            padding: 20px;
        }

        .product-list h2 {
            text-align: center;
            font-size: 2em;
            color: #333;
            margin-bottom: 40px;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
        }

        .products {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            padding: 20px;
        }

        /* 商品卡片 */
        .product-card {
            background: white;
            border-radius: 15px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            overflow: hidden;
        }

        .product-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 24px rgba(0,0,0,0.2);
        }

        .product-card img {
            width: 100%;
            height: 300px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 15px;
            transition: transform 0.3s ease;
        }

        .product-card:hover img {
            transform: scale(1.05);
        }

        .product-card h3 {
            font-size: 1.5em;
            color: #333;
            margin: 15px 0;
        }

        .product-card p {
            font-size: 1.2em;
            color: #e74c3c;
            font-weight: bold;
            margin: 10px 0;
        }

        .product-card button {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            padding: 12px 30px;
            font-size: 1em;
            border-radius: 25px;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 10px;
        }

        .product-card button:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.4);
        }

        .product-card button:active {
            transform: scale(0.98);
        }

        /* 底部样式 */
        footer {
            background: #333;
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: 40px;
        }

        footer p {
            font-size: 1em;
        }

        /* 响应式设计 */
        @media (max-width: 768px) {
            header h1 {
                font-size: 1.8em;
            }

            header a {
                margin: 5px;
                padding: 8px 15px;
                font-size: 0.9em;
            }

            .products {
                grid-template-columns: 1fr;
                padding: 10px;
            }
        }
    </style>
</head>
<body>
<!--网站头部-->
<header>
    <h1>🎂 欢迎来到蛋糕商城</h1>
    <nav>
        <a href="#">首页</a>
        <a href="#">蛋糕种类</a>
        <a href="#">购物车</a>
        <a href="#">联系我们</a>
    </nav>
</header>

<!--主体部分:蛋糕商品列表-->
<section class="product-list">
    <h2>🍰 精选蛋糕商品</h2>
    <div class="products">
        <!--商品卡片-->
        <div class="product-card">
            <img src="/images/cake1.png" alt="蛋糕1">
            <h3>玫瑰蛋糕</h3>
            <p>价格: ￥88</p>
            <button>🛒 加入购物车</button>
        </div>

        <div class="product-card">
            <img src="/images/cake2.png" alt="蛋糕2">
            <h3>梵高的向日葵</h3>
            <p>价格: ￥120</p>
            <button>🛒 加入购物车</button>
        </div>

        <div class="product-card">
            <img src="/images/cake3.png" alt="蛋糕3">
            <h3>枯叶蝶蛋糕</h3>
            <p>价格: ￥100</p>
            <button>🛒 加入购物车</button>
        </div>
    </div>
</section>

<!--网站底部-->
<footer>
    <p>© 2025 蛋糕商城 版权所有 | 用心烘焙，甜蜜生活 ❤️</p>
</footer>

</body>
</html>