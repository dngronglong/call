package com.user.call.service;

import com.user.call.bean.PersonBean;
import java.util.List;

public abstract interface PersonService
{
  public abstract List<PersonBean> findAllPerson();
  
  public abstract List<PersonBean> findAllPersonByPage(int paramInt1, int paramInt2);
  
  public abstract int findCount();
  
  public abstract List<PersonBean> findPersonByWhere(String paramString1, String paramString2, String paramString3, int paramInt1, int paramInt2);
  
  public abstract int findCountByWhere(String paramString1, String paramString2, String paramString3, int paramInt1, int paramInt2);
}
