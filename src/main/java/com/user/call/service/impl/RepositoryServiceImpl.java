package com.user.call.service.impl;

import com.user.call.mapper.RepositoryMapper;
import com.user.call.mapper.ZxtMapper;
import com.user.call.service.RepositoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @program: call
 * @description: repository实现类
 * @author: DrongRonglong
 * @create: 2018-12-04 16:04
 **/
@Service
public class RepositoryServiceImpl implements RepositoryService {
    @Autowired
    private RepositoryMapper repositoryMapper;
    @Autowired
    private ZxtMapper zxtMapper;
    @Override
    public List<Map> findByPage(int page, int limit) {
        List<Map> list=repositoryMapper.findByPage(page, limit);
        return list;
    }
}
