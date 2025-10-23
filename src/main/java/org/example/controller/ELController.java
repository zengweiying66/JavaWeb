package org.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class ELController {
    @GetMapping("/testEL")
    public String showEL() {
        return "testEL";
    }
}
