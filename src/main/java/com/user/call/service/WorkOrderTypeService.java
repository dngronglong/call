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
    List<Map> searchGjyh(int paramInt1, int paramInt2);
    int countGjyh();
    List<Map> findGjyhByWhere(String personid,String displayname,String department,int page,int limit);
    int findGjyhCountByWhere(String personid,String displayname,String department,int page,int limit);
}
