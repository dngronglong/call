package com.user.call.repository;

import com.user.call.bean.RepositoryBean;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public abstract interface UserInfoRepository
  extends JpaRepository<RepositoryBean, Integer>
{
  @Query(value="SELECT * FROM(SELECT A.*, ROWNUM RN FROM (SELECT * FROM REPOSITORY  ORDER BY filterdate DESC) A WHERE ROWNUM <= ?2) WHERE RN > ?1", nativeQuery=true)
  public abstract List<RepositoryBean> findByPage(int paramInt1, int paramInt2);
  
  @Query(value="SELECT COUNT(repositoryid) FROM REPOSITORY", nativeQuery=true)
  public abstract int findCount();
}
