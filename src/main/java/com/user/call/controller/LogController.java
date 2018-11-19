package com.user.call.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping({"/user"})
public class LogController
{
  @GetMapping({"/info"})
  public String info(String caller, String fwz, String callId, String luId, HttpServletRequest rq)
  {
    HttpSession session = rq.getSession();
    session.setAttribute("caller", caller);
    session.setAttribute("fwz", fwz);
    session.setAttribute("callId", callId);
    session.setAttribute("luId", luId);
    session.setMaxInactiveInterval(-1);
    return "userInfo";
  }
}
