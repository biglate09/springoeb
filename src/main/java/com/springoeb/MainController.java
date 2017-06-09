package com.springoeb;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by bighead on 6/9/17.
 */
@Controller
public class MainController {
    @RequestMapping("/")
    public String index(){
        return "index";
    }
}
