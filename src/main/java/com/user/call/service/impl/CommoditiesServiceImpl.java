package com.user.call.service.impl;

import com.user.call.bean.CommoditiesBean;
import com.user.call.mapper.CommoditiesMapper;
import com.user.call.service.CommoditiesService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommoditiesServiceImpl
        implements CommoditiesService {
    @Autowired
    private CommoditiesMapper commoditiesMapper;

    public int findCount() {
        return this.commoditiesMapper.findCount();
    }

    public List<CommoditiesBean> findAllCommoditiesByPage(int page, int limit) {
        return this.commoditiesMapper.findAllCommoditiesByPage(page, limit);
    }

    public List<CommoditiesBean> findByWhere(int page, int limit, String name) {
        return this.commoditiesMapper.findByWhere(page, limit, name);
    }

    public int findByWhereCount(String name) {
        return this.commoditiesMapper.findByWhereCount(name);
    }

    public CommoditiesBean findByCom(String com) {
        return this.commoditiesMapper.findByCom(com);
    }
}
