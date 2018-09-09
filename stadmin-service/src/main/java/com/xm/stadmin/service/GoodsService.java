package com.xm.stadmin.service;


import com.xm.stadmin.common.agent.SysDaoAgent;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GoodsService {

    private static final Logger logger = LoggerFactory.getLogger(GoodsService.class);

    @Autowired
    private SysDaoAgent daoAgent;



}
