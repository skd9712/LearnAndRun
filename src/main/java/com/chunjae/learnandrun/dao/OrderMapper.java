package com.chunjae.learnandrun.dao;

import com.chunjae.learnandrun.dto.OrderDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface OrderMapper {
    void insertOrder(HashMap<String, Object> hm);

    List<HashMap<String,Object>> listOrder(HashMap<String,Object>hm);

//    void updateAuthorities(String key, Boolean value);
    void updateAuthorities(@Param("orderNo") String orderNo, @Param("authority") boolean authority);

    int getOrderCount();
}
