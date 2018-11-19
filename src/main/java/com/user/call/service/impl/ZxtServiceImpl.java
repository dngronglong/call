package com.user.call.service.impl;

import com.user.call.bean.ZxtBean;
import com.user.call.mapper.ZxtMapper;
import com.user.call.service.ZxtService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ZxtServiceImpl
        implements ZxtService {
    @Autowired
    private ZxtMapper zxtMapper;

    public List<ZxtBean> findAllZxtByPage(String value, int page, int limit) {
        return this.zxtMapper.findAllZxtByPage(value, page, limit);
    }

    public int findCount(String value) {
        return this.zxtMapper.findCount(value);
    }

    public List<ZxtBean> findByWhere(String value, String description, int page, int limit) {
        return this.zxtMapper.findByWhere(value, description, page, limit);
    }

    public int findByWhereCount(String value, String description) {
        return this.zxtMapper.findByWhereCount(value, description);
    }

    public ZxtBean findByValue(String findByZxt) {
        return this.zxtMapper.findByValue(findByZxt);
    }

    @Override
    public ZxtBean findById(String param) {
        return zxtMapper.findById(param);
    }
}
