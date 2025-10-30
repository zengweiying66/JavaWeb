package org.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JSTLCoreController {
    @GetMapping("/JSTLCore")
    public String showDate() {
        return "JSTLCore";
    }
}
