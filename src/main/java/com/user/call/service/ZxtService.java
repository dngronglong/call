package com.user.call.service;

import com.user.call.bean.ZxtBean;
import java.util.List;

public abstract interface ZxtService
{
  public abstract List<ZxtBean> findAllZxtByPage(String paramString, int paramInt1, int paramInt2);
  
  public abstract int findCount(String paramString);
  
  public abstract List<ZxtBean> findByWhere(String paramString1, String paramString2, int paramInt1, int paramInt2);
  
  public abstract int findByWhereCount(String paramString1, String paramString2);
  
  public abstract ZxtBean findByValue(String paramString);
  ZxtBean findById(String param);
}
