package com.user.call.mapper;

import com.user.call.bean.ZxtBean;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Component("zxtMapper")
@Mapper
public abstract interface ZxtMapper
{
  public abstract List<ZxtBean> findAllZxtByPage(@Param("value") String paramString, @Param("page") int paramInt1, @Param("limit") int paramInt2);
  
  public abstract int findCount(@Param("value") String paramString);
  
  public abstract List<ZxtBean> findByWhere(@Param("value") String paramString1, @Param("description") String paramString2, @Param("page") int paramInt1, @Param("limit") int paramInt2);
  
  public abstract int findByWhereCount(@Param("value") String paramString1, @Param("description") String paramString2);
  
  public abstract ZxtBean findByValue(@Param("fwz") String paramString);
  ZxtBean findById(@Param("value") String param);
}
