package com.user.call.service;

import com.user.call.bean.TelBookBean;

import java.util.List;

/**
 * Created with IDEA
 * author:DongRonglong
 * Date:2018/9/27
 * Time:11:55
 */
public interface TelService {
    TelBookBean findByTel(String tel);
    TelBookBean findByUserNameEEN(String name);
}
