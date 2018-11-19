package com.user.call.controller;

import com.user.call.bean.CommoditiesBean;
import com.user.call.bean.LayDataBean;
import com.user.call.mapper.CommoditiesMapper;
import java.io.PrintStream;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping({"/com"})
@Controller
public class CommoditiesController
{
  @Resource
  private CommoditiesMapper commoditiesMapper;
  
  @GetMapping({"/findAll"})
  @ResponseBody
  public LayDataBean findAll(int page, int limit)
  {
    int count = this.commoditiesMapper.findCount();
    if (page == 1)
    {
      page = 0;
    }
    else
    {
      page = (page - 1) * limit;
      limit = page + limit;
    }
    List<CommoditiesBean> list = this.commoditiesMapper.findAllCommoditiesByPage(page, limit);
    LayDataBean layDataBean = new LayDataBean();
    layDataBean.setCode(0);
    layDataBean.setCount(count);
    layDataBean.setData(list);
    return layDataBean;
  }
  
  @GetMapping({"/findByWhere"})
  @ResponseBody
  public LayDataBean findByWhere(int page, int limit, String name)
  {
    name = "%" + name + "%";
    int count = this.commoditiesMapper.findByWhereCount(name);
    if (page == 1)
    {
      page = 0;
    }
    else
    {
      page = (page - 1) * limit;
      limit = page + limit;
    }
    List<CommoditiesBean> list = this.commoditiesMapper.findByWhere(page, limit, name);
    LayDataBean layDataBean = new LayDataBean();
    layDataBean.setCode(0);
    layDataBean.setCount(count);
    layDataBean.setData(list);
    return layDataBean;
  }
  
  @RequestMapping({"/findByCom"})
  @ResponseBody
  public CommoditiesBean findByCom(String com)
  {
    System.out.println(com);
    return this.commoditiesMapper.findByCom(com);
  }
}
