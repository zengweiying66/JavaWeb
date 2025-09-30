package org.example.controller;

import org.example.service.UserService;
import org.example.model.User;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class UserController {

    @Resource
    private UserService userService;

    // 获取application.properties、application.yml配置文件的site.name的值
    @Value("${site.name}")
    private String siteName;

    // 获取application.properties、application.yml配置文件的site.version的值
    @Value("${site.version}")
    private String siteVersion;

    // 获取application.properties、application.yml配置文件的site.author的值
    @Value("${site.author}")
    private String siteAuthor;

    @RequestMapping("/welcome")   // 对应浏览器网站 http://localhost:8080/welcome
    public String welcome(HttpServletRequest request, HttpServletResponse response, Model model){   // welcome任意命名
        // 从数据库获取用户列表
        List<User> users = userService.selectUsers();
        // 将用户列表数据保存到 model 中，命名为 "users"，以备响应给前端页面
        model.addAttribute("users",users);

        //获取application.properties、application.yml配置文件的信息
        model.addAttribute("siteName",siteName);
        model.addAttribute("siteVersion",siteVersion);
        model.addAttribute("siteAuthor",siteAuthor);

        // 获取当前访问时间，并传递给 JSP 页面
        String currentVisitTime = new SimpleDateFormat("yyyy-MM-dd-HH:mm:ss").format(new Date());
        model.addAttribute("currentVisitTime", currentVisitTime);

        // 获取上次访问时间 cookie 的值，并传递给 JSP 页面
        model.addAttribute("lastVisitTime", userService.getLastVisitCookie(request,response,currentVisitTime) );

        return "welcome"; //返回给 welcome.jsp
    }

    // 重定向到welcome.jsp
    @RequestMapping("/index")
    public String redirect(){
        return "redirect:/welcome";
    }

    // 请求重定向 vs 请求转发
    @RequestMapping("/forwardToStar")
    public String forward(){
        /*System.out.println("======================================等待6秒，重定向到star！======================================");
        try {
            // 让程序等待 6 秒（6000 毫秒）
            Thread.sleep(6000);
            System.out.println("6 秒已过去，查看浏览器URL是否发生变化。请求重定向的URL会发生变化的！");
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return "redirect:/star";*/

        System.out.println("======================================等待6秒，请求转发到star！======================================");
        try {
            // 让程序等待 6 秒（6000 毫秒）
            Thread.sleep(6000);
            System.out.println("6 秒已过去，查看浏览器URL是否发生变化。请求重定向的URL不会发生变化的！");
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return "forward:/star";

    }

    @RequestMapping("/star")
    public String star(){
        return "star";
    }
}
