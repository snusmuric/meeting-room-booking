package meeting.booking.server.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DefaultController {

    @GetMapping("/")
    public String root() {
//        return "redirect:/home";
        return "index.html";
    }

//    @GetMapping("/home")
//    public String home() {
//        return "index.html";
//    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }
}
