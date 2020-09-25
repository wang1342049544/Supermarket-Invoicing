/*
package com.hdax.service.impl;

import com.hdax.entity.Kct;
import com.hdax.mapper.KctDao;
import com.hdax.mapper.ManagerMapper;
import com.hdax.service.KctService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class KctServiceImpl implements KctService {
    @Autowired
    private KctDao kctDao;

//进货叠加数量
    @Override
    public Boolean knum(long nums, long id) {
        Kct kct =new Kct();
        kct.setTypeId(id);
        kct.setNums(nums);
        return kctDao.knum(nums,id);
    }
}
*/
