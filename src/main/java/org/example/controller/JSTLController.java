package org.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class JSTLController {
    @GetMapping("/JSTL")
    public String showDate() {
        return "testJSTL";
    }
}
