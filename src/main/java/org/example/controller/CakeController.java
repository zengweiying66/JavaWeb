package org.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class CakeController {
    @GetMapping("/cakeStore")
    public String showDate() {
        return "cakeStore";
    }

    @GetMapping("/cakeStore2")
    public String showDate2() {
        return "cakeStore2";
    }
}
