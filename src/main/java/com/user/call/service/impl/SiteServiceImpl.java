package com.user.call.service.impl;

import com.user.call.bean.SiteBean;
import com.user.call.mapper.SiteMapper;
import com.user.call.service.SiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SiteServiceImpl
  implements SiteService
{
  @Autowired
  private SiteMapper siteMapper;
  
  public SiteBean findUnitBySite(int id)
  {
    return this.siteMapper.findUnitBySite(id);
  }
}
