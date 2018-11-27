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
    //查找关键用户
    List<Map> findGjyh(@Param("page") int paramInt1, @Param("limit") int paramInt2);
    //返回关键用户总条数
    int countGjyh();
    //条件查询
    List<Map> findGjyhByWhere(@Param("personid") String personid, @Param("displayname") String displayname, @Param("department") String department, @Param("page") int page, @Param("limit") int limit);
    //返回条件查询条数
    int findGjyhCountByWhere(@Param("personid") String paramString1, @Param("displayname") String paramString2, @Param("department") String paramString3, @Param("page") int paramInt1, @Param("limit") int paramInt2);
}
