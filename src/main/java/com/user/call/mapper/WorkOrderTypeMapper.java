package com.user.call.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component("WorkOrderTypeMapper")
@Mapper
public interface WorkOrderTypeMapper {
    List<?> findAll();
    //事件
    List<Map> findIncident();
    //服务请求
    List<Map> findSr();
    //服务请求分类
    List<Map> findType(@Param("type") String param);
}
