package com.hdax.service.impl;

import com.hdax.entity.Manager;
import com.hdax.mapper.ManagerMapper;
import com.hdax.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerServiceImpl implements ManagerService {
    @Autowired
    private ManagerMapper managerMapper;



    public Manager login(String mname) throws RuntimeException {
        return managerMapper.Find(mname);
    }
}
