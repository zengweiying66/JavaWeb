<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PageContext 隐式对象演示</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;500;600&family=Inter:wght@400;500;600;700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: #0a0e27;
            min-height: 100vh;
            padding: 60px 20px;
            position: relative;
            color: #e4e4e7;
        }

        /* 网格背景 */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image:
                    linear-gradient(rgba(99, 102, 241, 0.03) 1px, transparent 1px),
                    linear-gradient(90deg, rgba(99, 102, 241, 0.03) 1px, transparent 1px);
            background-size: 50px 50px;
            z-index: 0;
        }

        /* 科技感光晕 */
        .glow-orb {
            position: fixed;
            border-radius: 50%;
            filter: blur(100px);
            opacity: 0.15;
            pointer-events: none;
            z-index: 1;
        }

        .glow-orb-1 {
            width: 500px;
            height: 500px;
            background: #6366f1;
            top: -200px;
            right: -200px;
        }

        .glow-orb-2 {
            width: 400px;
            height: 400px;
            background: #8b5cf6;
            bottom: -150px;
            left: -150px;
        }

        .container {
            max-width: 1100px;
            margin: 0 auto;
            position: relative;
            z-index: 2;
        }

        header {
            margin-bottom: 60px;
        }

        .header-tag {
            display: inline-block;
            font-family: 'JetBrains Mono', monospace;
            font-size: 12px;
            color: #6366f1;
            background: rgba(99, 102, 241, 0.1);
            border: 1px solid rgba(99, 102, 241, 0.2);
            padding: 6px 14px;
            border-radius: 6px;
            margin-bottom: 20px;
            letter-spacing: 1px;
        }

        h1 {
            font-size: 48px;
            font-weight: 700;
            color: #f4f4f5;
            margin-bottom: 16px;
            letter-spacing: -1px;
        }

        .subtitle {
            font-size: 18px;
            color: #a1a1aa;
            font-weight: 400;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 24px;
            margin-bottom: 40px;
        }

        .card {
            background: rgba(24, 24, 27, 0.6);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(63, 63, 70, 0.4);
            border-radius: 12px;
            padding: 28px;
            position: relative;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        /* 修复后的悬停效果 - 使用 box-shadow 替代复杂的 mask */
        .card:hover {
            transform: translateY(-4px);
            border-color: rgba(99, 102, 241, 0.8);
            box-shadow:
                    0 0 0 1px rgba(99, 102, 241, 0.4),
                    0 10px 30px rgba(99, 102, 241, 0.2);
        }

        .card-header {
            display: flex;
            align-items: center;
            gap: 16px;
            margin-bottom: 20px;
            padding-bottom: 20px;
            border-bottom: 1px solid rgba(63, 63, 70, 0.3);
        }

        .icon-box {
            width: 48px;
            height: 48px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: rgba(99, 102, 241, 0.1);
            border: 1px solid rgba(99, 102, 241, 0.2);
            border-radius: 10px;
            font-size: 20px;
            transition: all 0.3s;
        }

        .card:hover .icon-box {
            background: rgba(99, 102, 241, 0.2);
            border-color: rgba(99, 102, 241, 0.4);
        }

        .icon-box.request { color: #f87171; }
        .icon-box.response { color: #34d399; }
        .icon-box.session { color: #fbbf24; }
        .icon-box.application { color: #60a5fa; }
        .icon-box.out { color: #a78bfa; }

        .card-title {
            flex: 1;
        }

        .card-title h3 {
            font-size: 16px;
            font-weight: 600;
            color: #f4f4f5;
            margin-bottom: 4px;
        }

        .card-title .type {
            font-family: 'JetBrains Mono', monospace;
            font-size: 11px;
            color: #71717a;
        }

        .card-content {
            font-size: 14px;
            line-height: 1.7;
            color: #d4d4d8;
        }

        .status-indicator {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            font-size: 12px;
            color: #34d399;
            font-family: 'JetBrains Mono', monospace;
        }

        .status-dot {
            width: 6px;
            height: 6px;
            background: #34d399;
            border-radius: 50%;
            animation: blink 2s infinite;
        }

        @keyframes blink {
            0%, 100% { opacity: 1; }
            50% { opacity: 0.4; }
        }

        .info-panel {
            background: rgba(24, 24, 27, 0.6);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(63, 63, 70, 0.4);
            border-radius: 12px;
            padding: 32px;
        }

        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 32px;
        }

        .info-item h4 {
            font-size: 12px;
            font-weight: 500;
            color: #71717a;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 8px;
        }

        .info-item p {
            font-family: 'JetBrains Mono', monospace;
            font-size: 14px;
            color: #e4e4e7;
        }

        .code-block {
            background: rgba(9, 9, 11, 0.8);
            border: 1px solid rgba(63, 63, 70, 0.4);
            border-radius: 8px;
            padding: 16px;
            font-family: 'JetBrains Mono', monospace;
            font-size: 13px;
            color: #a1a1aa;
            margin-top: 12px;
            overflow-x: auto;
        }

        .code-keyword { color: #c084fc; }
        .code-class { color: #60a5fa; }
        .code-method { color: #34d399; }

        footer {
            margin-top: 60px;
            padding-top: 32px;
            border-top: 1px solid rgba(63, 63, 70, 0.3);
            text-align: center;
        }

        .tech-stack {
            display: flex;
            justify-content: center;
            gap: 12px;
            flex-wrap: wrap;
            margin-top: 16px;
        }

        .tech-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 8px 14px;
            background: rgba(24, 24, 27, 0.6);
            border: 1px solid rgba(63, 63, 70, 0.4);
            border-radius: 8px;
            font-family: 'JetBrains Mono', monospace;
            font-size: 11px;
            color: #a1a1aa;
            transition: all 0.3s;
        }

        .tech-badge:hover {
            border-color: rgba(99, 102, 241, 0.6);
            color: #e4e4e7;
        }

        .tech-dot {
            width: 6px;
            height: 6px;
            background: #6366f1;
            border-radius: 50%;
        }

        @media (max-width: 768px) {
            body {
                padding: 40px 16px;
            }

            h1 {
                font-size: 32px;
            }

            .grid {
                grid-template-columns: 1fr;
            }

            .info-grid {
                grid-template-columns: 1fr;
                gap: 24px;
            }
        }

        /* 细节优化 */
        ::selection {
            background: rgba(99, 102, 241, 0.3);
            color: #f4f4f5;
        }

        ::-webkit-scrollbar {
            width: 8px;
            height: 8px;
        }

        ::-webkit-scrollbar-track {
            background: rgba(24, 24, 27, 0.5);
        }

        ::-webkit-scrollbar-thumb {
            background: rgba(99, 102, 241, 0.3);
            border-radius: 4px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: rgba(99, 102, 241, 0.5);
        }
    </style>
</head>
<body>
<%
    // 1. pageContext 获取 request 对象
    javax.servlet.http.HttpServletRequest req = (javax.servlet.http.HttpServletRequest) pageContext.getRequest();
    req.setAttribute("reqMsg", "通过 pageContext 获取 request 对象成功");

    // 2. pageContext 获取 response 对象
    javax.servlet.http.HttpServletResponse res = (javax.servlet.http.HttpServletResponse) pageContext.getResponse();
    res.setHeader("resMsg", "通过 pageContext 获取 response 对象成功");

    // 3. pageContext 获取 session 对象
    javax.servlet.http.HttpSession sess = pageContext.getSession();
    sess.setAttribute("sessMsg", "通过 pageContext 获取 session 对象成功");

    // 4. pageContext 获取 application 对象
    javax.servlet.ServletContext app = pageContext.getServletContext();
    app.setAttribute("appMsg", "通过 pageContext 获取 application 对象成功");

    // 5. pageContext 获取 out 对象
    javax.servlet.jsp.JspWriter outWriter = pageContext.getOut();
%>

<div class="glow-orb glow-orb-1"></div>
<div class="glow-orb glow-orb-2"></div>

<div class="container">
    <header>
        <div class="header-tag">JSP / SERVLET API</div>
        <h1>PageContext 对象访问</h1>
        <p class="subtitle">通过 PageContext 统一访问 JSP 隐式对象</p>
    </header>

    <div class="grid">
        <div class="card">
            <div class="card-header">
                <div class="icon-box request">⟨/⟩</div>
                <div class="card-title">
                    <h3>Request</h3>
                    <span class="type">HttpServletRequest</span>
                </div>
            </div>
            <div class="card-content">
                <%= req.getAttribute("reqMsg") %>
                <div class="code-block">
                    <span class="code-class">pageContext</span>.<span class="code-method">getRequest</span>()
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-header">
                <div class="icon-box response">⟩/⟨</div>
                <div class="card-title">
                    <h3>Response</h3>
                    <span class="type">HttpServletResponse</span>
                </div>
            </div>
            <div class="card-content">
                <%= res.getHeader("resMsg") %>
                <div class="code-block">
                    <span class="code-class">pageContext</span>.<span class="code-method">getResponse</span>()
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-header">
                <div class="icon-box session">◈</div>
                <div class="card-title">
                    <h3>Session</h3>
                    <span class="type">HttpSession</span>
                </div>
            </div>
            <div class="card-content">
                <%= sess.getAttribute("sessMsg") %>
                <div class="code-block">
                    <span class="code-class">pageContext</span>.<span class="code-method">getSession</span>()
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-header">
                <div class="icon-box application">◉</div>
                <div class="card-title">
                    <h3>Application</h3>
                    <span class="type">ServletContext</span>
                </div>
            </div>
            <div class="card-content">
                <%= app.getAttribute("appMsg") %>
                <div class="code-block">
                    <span class="code-class">pageContext</span>.<span class="code-method">getServletContext</span>()
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-header">
                <div class="icon-box out">◐</div>
                <div class="card-title">
                    <h3>Out</h3>
                    <span class="type">JspWriter</span>
                </div>
            </div>
            <div class="card-content">
                <% outWriter.print("通过 pageContext 获取的 out 对象成功"); %>
                <div class="code-block">
                    <span class="code-class">pageContext</span>.<span class="code-method">getOut</span>()
                </div>
            </div>
        </div>
    </div>

    <div class="info-panel">
        <div class="info-grid">
            <div class="info-item">
                <h4>Status</h4>
                <p class="status-indicator">
                    <span class="status-dot"></span>
                    All Systems Operational
                </p>
            </div>
            <div class="info-item">
                <h4>Objects Accessed</h4>
                <p>5 / 5</p>
            </div>
            <div class="info-item">
                <h4>Response Time</h4>
                <p>&lt; 10ms</p>
            </div>
            <div class="info-item">
                <h4>Encoding</h4>
                <p>UTF-8</p>
            </div>
        </div>
    </div>

    <footer>
        <p style="color: #71717a; font-size: 14px; margin-bottom: 16px;">Built with</p>
        <div class="tech-stack">
            <span class="tech-badge">
                <span class="tech-dot"></span>
                JSP 2.3
            </span>
            <span class="tech-badge">
                <span class="tech-dot"></span>
                Servlet 4.0
            </span>
            <span class="tech-badge">
                <span class="tech-dot"></span>
                PageContext API
            </span>
            <span class="tech-badge">
                <span class="tech-dot"></span>
                Java EE
            </span>
        </div>
    </footer>
</div>

</body>
</html>