package com.user.call.service;

import com.user.call.bean.RepositoryBean;
import java.util.List;

public abstract interface CallService
{
  public abstract List<?> findCallByWhere(String paramString1, String paramString2, String paramString3, int paramInt1, int paramInt2);
  
  public abstract List<RepositoryBean> findAll();
  
  public abstract int findCount(String paramString1, String paramString2, String paramString3);
  
  public abstract List<?> findByCn(String paramString1, String paramString2, String paramString3, int paramInt1, int paramInt2);
  
  public abstract int countByCn(String paramString1, String paramString2, String paramString3);
}
