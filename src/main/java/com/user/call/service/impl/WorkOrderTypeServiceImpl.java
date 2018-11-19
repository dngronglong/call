package com.user.call.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.user.call.mapper.WorkOrderTypeMapper;
import com.user.call.service.WorkOrderTypeService;
import com.user.call.utils.HttpClientUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class WorkOrderTypeServiceImpl implements WorkOrderTypeService {
    @Autowired
    private WorkOrderTypeMapper workOrderTypeMapper;

    @Override
    public List<?> findAll() {
        return workOrderTypeMapper.findAll();
    }

    @Override
    public String add(Map<String,Object> map) {
        //正式：http://10.185.101.24:9081/maximo/mobile/ticket/start
//        String url = "http://10.185.101.24:9081/maximo/mobile/ticket/start?data=";
        //测试：http://10.184.16.181:7001/maximo/mobile/ticket/start
        String url = "http://10.184.16.181:7001/maximo/mobile/ticket/start?data=";
        String jsonObject = JSONObject.toJSONString(map);
        jsonObject=jsonObject.replace(":\"\"","");
        jsonObject= jsonObject.substring(0,jsonObject.length()-1);
        jsonObject=jsonObject.substring(1,jsonObject.length());
        jsonObject= jsonObject.substring(0,jsonObject.length()-1);
        jsonObject=jsonObject.substring(1,jsonObject.length());
        jsonObject=jsonObject.replace("\\","");
        String result = null;
        String data="";
        try {
            data=URLEncoder.encode(jsonObject,"UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        try {
            result = HttpClientUtil.doPost(url+data);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public List<Map> findIncident() {
        return workOrderTypeMapper.findIncident();
    }

    @Override
    public List<Map> findSr() {
        return workOrderTypeMapper.findSr();
    }

    @Override
    public List<Map> findType(String param) {
//        System.out.println(param);
        return workOrderTypeMapper.findType(param);
    }
}
