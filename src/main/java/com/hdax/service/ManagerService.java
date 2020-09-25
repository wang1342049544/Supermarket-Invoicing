package com.hdax.service;

import com.hdax.entity.Manager;

public interface ManagerService {
        Manager login(String mname) throws RuntimeException;
}
