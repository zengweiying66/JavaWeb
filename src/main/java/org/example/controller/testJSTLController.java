package org.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class testJSTLController {
    @GetMapping("/testJSTL")
    public String showDate() {
        return "testJSTL";
    }
}
