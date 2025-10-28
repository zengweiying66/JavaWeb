package org.example.controller;

import org.springframework.web.bind.annotation.GetMapping;

public class testJSTLController {
    @GetMapping("/testJSTL")
    public String showDate() {
        return "testJSTL";
    }
}
