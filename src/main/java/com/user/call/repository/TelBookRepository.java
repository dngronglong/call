package com.user.call.repository;

import com.user.call.bean.TelBookBean;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface TelBookRepository
        extends JpaRepository<TelBookBean, Integer> {
    @Query(value = "select * FROM TELBOOK where MOBILE1 like ?1 or MOBILE2 like ?1 or OFFICEPHONENUMBER like ?1 or PHONE1 like ?1 or PHONE2 like ?1", nativeQuery = true)
    List<TelBookBean> findByTel(String paramString);

    @Query(value = "select a.* from (select * from TELBOOK where  USERNAMEEN=?1) a where ROWNUM = 1", nativeQuery = true)
    TelBookBean findByUserNameEEN(String paramString);
}
