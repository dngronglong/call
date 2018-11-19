package com.user.call.controller;

import com.user.call.bean.LayDataBean;
import com.user.call.bean.SiteBean;
import com.user.call.service.PersonService;
import com.user.call.service.SiteService;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping({"/person"})
public class PersonController
{
  @Resource
  private PersonService personService;
  @Resource
  private SiteService siteService;
  
  @ResponseBody
  @GetMapping(value={"/findAllPerson"}, produces={"application/json;charset=utf-8"})
  public LayDataBean findAllPerson(int page, int limit)
  {
    int count = this.personService.findCount();
    if (page == 1)
    {
      page = 0;
    }
    else
    {
      page = (page - 1) * limit;
      limit = page + limit;
    }
    LayDataBean layDataBean = new LayDataBean();
    layDataBean.setData(this.personService.findAllPersonByPage(page, limit));
    layDataBean.setCode(0);
    layDataBean.setCount(count);
    return layDataBean;
  }
  
  @ResponseBody
  @GetMapping({"/findPersonByWhere"})
  public LayDataBean findPersonByWhere(int page, int limit, String personid, String displayname, String department)
  {
    LayDataBean layDataBean = new LayDataBean();
    if (page == 1)
    {
      page = 0;
    }
    else
    {
      page = (page - 1) * limit;
      limit = page + limit;
    }
    personid = personid.toUpperCase();
    layDataBean.setData(this.personService.findPersonByWhere(personid, displayname, department, page, limit));
    layDataBean.setCount(this.personService.findCountByWhere(personid, displayname, department, page, limit));
    
    layDataBean.setCode(0);
    layDataBean.setMsg("succes");
    return layDataBean;
  }
  
  @ResponseBody
  @RequestMapping({"/findUnitBySite"})
  public SiteBean findUnitBySite(int id)
  {
    SiteBean siteBean = new SiteBean();
    siteBean = this.siteService.findUnitBySite(id);
    return siteBean;
  }
}
