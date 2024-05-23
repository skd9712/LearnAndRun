package com.chunjae.learnandrun.dao;

import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;

@Mapper
public interface OrderMapper {
    void insertOrder(HashMap<String, Object> hm);
}
