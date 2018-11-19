package com.user.call.mapper;

import com.user.call.bean.RepositoryBean;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Component("callMapper")
@Mapper
public abstract interface CallMapper
{
  public abstract List<?> findCallByWhere(@Param("fwz") String paramString1, @Param("zy") String paramString2, @Param("ssxt") String paramString3, @Param("page") int paramInt1, @Param("limit") int paramInt2);
  
  public abstract List<RepositoryBean> findAll();
  
  public abstract int findCount(@Param("fwz") String paramString1, @Param("zy") String paramString2, @Param("ssxt") String paramString3);
  
  public abstract List<?> findByCn(@Param("fwz") String paramString1, @Param("zy") String paramString2, @Param("ssxt") String paramString3, @Param("page") int paramInt1, @Param("limit") int paramInt2);
  
  public abstract int countByCn(@Param("fwz") String paramString1, @Param("zy") String paramString2, @Param("ssxt") String paramString3);
}
