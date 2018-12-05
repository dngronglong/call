package com.user.call.service;

import java.util.List;
import java.util.Map;

public interface RepositoryService {
    List<Map> findByPage(int page, int limit);
}
