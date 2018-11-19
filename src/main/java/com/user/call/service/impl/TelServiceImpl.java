package com.user.call.service.impl;

import com.user.call.bean.TelBookBean;
import com.user.call.mapper.TelMapper;
import com.user.call.service.TelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IDEA
 * author:DongRonglong
 * Date:2018/9/27
 * Time:11:56
 */
@Service
public class TelServiceImpl implements TelService {
    @Autowired
    private TelMapper telMapper;
    @Override
    public TelBookBean findByTel(String tel) {
        return telMapper.findByTel(tel);
    }

    @Override
    public TelBookBean findByUserNameEEN(String name) {
        return telMapper.findByUserNameEEN(name);
    }
}
