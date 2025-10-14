package org.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DateController {
    @GetMapping("/date")
    public String showDate() {
        return "date";
    }

    @GetMapping("/firstJsp")
    public String firstJsp() {
        return "firstJsp";
    }
}
