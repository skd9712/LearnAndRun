package com.chunjae.learnandrun.service;

import com.chunjae.learnandrun.dto.OrderDTO;

import java.util.List;
import java.util.Map;

public interface OrderService {
    void insertOrder(int buyer_buyid, int lecture_id, String order_id);

    List<OrderDTO> listOrder();

    void updateAuthorities(Map<String, Boolean> hm);
}
