package cn.com.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hello")
public class HelloWorldController {
    public String Hello(ModelMap model){
        model.addAttribute("message","This is my first mvc application");
        return "Hello";
    }
}
