package com.user.call.repository;

import com.user.call.bean.SeatBean;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public abstract interface SeatRepository
  extends JpaRepository<SeatBean, Integer>
{
  @Query("from SeatBean where MAXUSERID=?1")
  public abstract SeatBean findByMaxUserId(@Param("id") String paramString);
}
