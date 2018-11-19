package com.user.call.mapper;

import com.user.call.bean.CommoditiesBean;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Mapper
@Component("CommoditiesMapper")
public abstract interface CommoditiesMapper
{
  public abstract int findCount();
  
  public abstract List<CommoditiesBean> findAllCommoditiesByPage(@Param("page") int paramInt1, @Param("limit") int paramInt2);
  
  public abstract List<CommoditiesBean> findByWhere(@Param("page") int paramInt1, @Param("limit") int paramInt2, @Param("description") String paramString);
  
  public abstract int findByWhereCount(@Param("description") String paramString);
  
  public abstract CommoditiesBean findByCom(@Param("com") String paramString);
}
