package com.user.call.mapper;

import com.user.call.bean.SiteBean;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

@Component("SiteMapper")
@Mapper
public abstract interface SiteMapper
{
  public abstract SiteBean findUnitBySite(@Param("siteId") int paramInt);
}
