package org.example.service;

import org.example.dao.UserDao;
import org.example.model.User;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Service
public class UserService {

    @Resource
    private UserDao userDao;

    // 查找用户列表
    public List<User> selectUsers() {
        return userDao.selectUsers();
    }

    // 获取上次访问时间的Cookie
    public String getLastVisitCookie(HttpServletRequest request, HttpServletResponse response, String currentVisitTime){
        // 获取cookies：request.getCookies() 方法返回一个 Cookie 数组，包含了浏览器发送给服务器的所有 Cookie。
        Cookie[] cookies = request.getCookies();

        String lastVisitTime = "你是第一次访问该网站！";

        // cookies 不为空：如果 cookies 不为空,说明浏览器中确实有存储 Cookie，接下来会进入循环遍历这些 Cookie。
        if (cookies != null) {
            for (Cookie cookie : cookies) { // 增强型 for 循环，遍历 cookies 数组中的每一个 Cookie 对象。
                if ("lastVisitTime".equals(cookie.getName())) { // 查找同名 Cookie
                    lastVisitTime = cookie.getValue(); // 返回 Cookie 的值。
                }
            }
        }

        // 创建 cookie，将当前访问时间存储为 【上次访问时间】,以备下次使用
        Cookie visitCookie = new Cookie("lastVisitTime", currentVisitTime);
        visitCookie.setMaxAge(60 * 60 * 24 * 365);  // 设置为 1 年有效
        visitCookie.setPath("/");  // 设置 Cookie 对整个网站有效
        response.addCookie(visitCookie);  // 将 Cookie 添加到响应中

        return lastVisitTime;
    }
}
