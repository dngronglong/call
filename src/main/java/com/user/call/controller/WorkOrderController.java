package com.user.call.controller;

import com.user.call.bean.WorkOrderTypeBean;
import com.user.call.service.WorkOrderTypeService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/workOrder")
public class WorkOrderController {
    @Resource
    private WorkOrderTypeService workOrderTypeService;

    @RequestMapping("/findAll")
    private List<WorkOrderTypeBean> findAll(){
        System.out.println(workOrderTypeService.findAll());
        return (List<WorkOrderTypeBean>) workOrderTypeService.findAll();
    }

    @RequestMapping("/add")
    public String add(@RequestParam Map<String,Object> map){
        return workOrderTypeService.add(map);
    }
    @RequestMapping("/incident")
    public List<Map> ncident(){
        return workOrderTypeService.findIncident();
    }
    @RequestMapping("/sr")
    public List<Map> sr(){
        return workOrderTypeService.findSr();
    }
    @RequestMapping("/sr/type")
    public List<Map> type(String param){
        System.out.println(param);
        return workOrderTypeService.findType(param);
    }
}
