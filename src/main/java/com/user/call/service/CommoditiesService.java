package com.user.call.service;

import com.user.call.bean.CommoditiesBean;
import java.util.List;

public abstract interface CommoditiesService
{
  public abstract int findCount();
  
  public abstract List<CommoditiesBean> findAllCommoditiesByPage(int paramInt1, int paramInt2);
  
  public abstract List<CommoditiesBean> findByWhere(int paramInt1, int paramInt2, String paramString);
  
  public abstract int findByWhereCount(String paramString);
  
  public abstract CommoditiesBean findByCom(String paramString);
}
