package com.user.call.controller;

import com.user.call.bean.LayDataBean;
import com.user.call.bean.ZxtBean;
import com.user.call.service.ZxtService;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping({"/zxt"})
@Controller
public class ZxtController {
    @Resource
    private ZxtService zxtService;

    @GetMapping({"/findAllZxt"})
    @ResponseBody
    public LayDataBean findAllZxt(String value, int page, int limit) {
        int count = this.zxtService.findCount(value);
        if (page == 1) {
            page = 0;
        } else {
            page = (page - 1) * limit;
            limit = page + limit;
        }
        List<ZxtBean> list = this.zxtService.findAllZxtByPage(value, page, limit);
        LayDataBean layDataBean = new LayDataBean();
        layDataBean.setCode(0);
        layDataBean.setCount(count);
        layDataBean.setData(list);
        return layDataBean;
    }

    @GetMapping({"/findByWhere"})
    @ResponseBody
    public LayDataBean findByWhere(String value, int page, int limit, String name) {
        int count = this.zxtService.findByWhereCount(value, name);
        if (page == 1) {
            page = 0;
        } else {
            page = (page - 1) * limit;
            limit = page + limit;
        }
        List<ZxtBean> list = this.zxtService.findByWhere(value, name, page, limit);
        LayDataBean layDataBean = new LayDataBean();
        layDataBean.setCode(0);
        layDataBean.setCount(count);
        layDataBean.setData(list);
        return layDataBean;
    }
    @RequestMapping("/findById")
    @ResponseBody
    public ZxtBean findById(String zxt){
        return zxtService.findById(zxt);
    }
}
