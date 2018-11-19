package com.user.call.mapper;

import com.user.call.bean.TelBookBean;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created with IDEA
 * author:DongRonglong
 * Date:2018/9/27
 * Time:11:52
 */
@Component("TelMapper")
@Mapper
public interface TelMapper {
    TelBookBean findByTel(@Param("tel") String tel);
    TelBookBean findByUserNameEEN(@Param("name") String name);
}
