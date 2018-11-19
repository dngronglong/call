package com.user.call.service.impl;

import com.user.call.bean.RepositoryBean;
import com.user.call.mapper.CallMapper;
import com.user.call.service.CallService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CallServiceImpl
  implements CallService
{
  @Autowired
  private CallMapper callMapper;
  
  public List<?> findCallByWhere(String fwz, String zy, String ssxt, int page, int limit)
  {
    return this.callMapper.findCallByWhere(fwz, zy, ssxt, page, limit);
  }
  
  public List<RepositoryBean> findAll()
  {
    return this.callMapper.findAll();
  }
  
  public int findCount(String fwz, String zy, String ssxt)
  {
    return this.callMapper.findCount(fwz, zy, ssxt);
  }
  
  public List<?> findByCn(String fwz, String zy, String ssxt, int page, int limit)
  {
    return callMapper.findByCn(fwz, zy, ssxt, page, limit);
  }
  
  public int countByCn(String fwz, String zy, String ssxt)
  {
    return this.callMapper.countByCn(fwz, zy, ssxt);
  }
}
