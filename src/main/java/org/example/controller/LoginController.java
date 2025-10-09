package org.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    // 1) 显示登录页面
    @GetMapping("/login")
    public String showLoginPage() {return "login"; // 呈现页面 login.jsp
    }

    // 2) 处理登录表单提交
    @PostMapping("/login")
    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password, Model model, HttpSession session) {

        // 登录失败，设置errorMessage
        if(!(username.equals("admin") && password.equals("12345678"))){
            model.addAttribute("errorMessage", "0");
            return "login";
        }

        // 登录成功，把用户信息存入session；后续你可以在任何Controller方法里通过HttpSession.getAttribute("loggedInUser")判断用户是否登录。
        session.setAttribute("loggedInUser", username);

        // 登录成功后跳转页面
        return "redirect:/welcome";
    }
}