package com.user.call.mapper;

import com.user.call.bean.PersonBean;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Component("PersonMapper")
@Mapper
public abstract interface PersonMapper
{
  public abstract List<PersonBean> findAllPerson();
  
  public abstract List<PersonBean> findAllPersonByPage(@Param("page") int paramInt1, @Param("limit") int paramInt2);
  
  public abstract int findCount();
  
  public abstract List<PersonBean> findPersonByWhere(@Param("personid") String paramString1, @Param("displayname") String paramString2, @Param("department") String paramString3, @Param("page") int paramInt1, @Param("limit") int paramInt2);
  
  public abstract int findCountByWhere(@Param("personid") String paramString1, @Param("displayname") String paramString2, @Param("department") String paramString3, @Param("page") int paramInt1, @Param("limit") int paramInt2);
}
