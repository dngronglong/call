package com.user.call.service;

import java.util.List;
import java.util.Map;

public interface WorkOrderTypeService {
    List<?> findAll();
    String add(Map<String,Object> map);
    //事件
    List<Map> findIncident();
    //服务请求
    List<Map> findSr();
    List<Map> findType(String param);
}
