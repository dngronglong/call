package com.user.call.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController
{
  @GetMapping({"/login"})
  public String login()
  {
    return "login";
  }
  
  @ResponseBody
  @PostMapping(value={"/login"}, produces={"application/json;charset=utf-8"})
  public ModelAndView login(String userName, String password, HttpServletRequest rq, HttpServletResponse rp)
  {
    return new ModelAndView("redirect:/index");
  }
  
  @GetMapping({"/redirect"})
  public String redirec(String userId, HttpServletRequest rq)
  {
    HttpSession session = rq.getSession();
    session.setAttribute("userId", userId);
    session.setMaxInactiveInterval(-1);
    return "redirect:/index";
  }
  
  @GetMapping({"/index"})
  public String index()
  {
    return "/index";
  }
}
