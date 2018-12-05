package com.user.call.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Mapper
@Component
public interface RepositoryMapper {
    @Select("SELECT * FROM(SELECT A.*, ROWNUM RN FROM (SELECT * FROM REPOSITORY RE LEFT JOIN TELBOOK TEL ON lower(RE.PERSON)=TEL.USERNAMEEN left join commodities com on RE.COMMODITYGROUP=com.COMMODITY  ORDER BY filterdate DESC) A WHERE ROWNUM <= #{limit}) WHERE RN > #{page}")
    List<Map> findByPage(@Param("page") int page, @Param("limit") int limit);
}
