package com.user.call.service.impl;

import com.user.call.bean.PersonBean;
import com.user.call.mapper.PersonMapper;
import com.user.call.service.PersonService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PersonServiceImpl
  implements PersonService
{
  @Autowired
  private PersonMapper personMapper;
  
  public List<PersonBean> findAllPerson()
  {
    return this.personMapper.findAllPerson();
  }
  
  public List<PersonBean> findAllPersonByPage(int page, int limit)
  {
    return this.personMapper.findAllPersonByPage(page, limit);
  }
  
  public int findCount()
  {
    return this.personMapper.findCount();
  }
  
  public List<PersonBean> findPersonByWhere(String personid, String displayname, String department, int page, int limit)
  {
    return this.personMapper.findPersonByWhere(personid, displayname, department, page, limit);
  }
  
  public int findCountByWhere(String personid, String displayname, String department, int page, int limit)
  {
    return this.personMapper.findCountByWhere(personid, displayname, department, page, limit);
  }
}
