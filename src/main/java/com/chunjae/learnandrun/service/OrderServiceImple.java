package com.chunjae.learnandrun.service;

import com.chunjae.learnandrun.dao.OrderMapper;
import com.chunjae.learnandrun.dto.OrderDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("orderService")
@RequiredArgsConstructor
@Transactional
public class OrderServiceImple implements OrderService{

    private final OrderMapper orderMapper;

    @Override
    public void insertOrder(int buyer_buyid, int lecture_id, String order_id) {
        HashMap<String, Object> hm = new HashMap<>();
        hm.put("buyer_buyerid", buyer_buyid);
        hm.put("lecture_id", lecture_id);
        hm.put("order_id", order_id);

        orderMapper.insertOrder(hm);
    }

    @Override
    public List<OrderDTO> listOrder() {
        return orderMapper.listOrder();
    }

    @Override
    public void updateAuthorities(Map<String, Boolean> hm) {
        for(Map.Entry<String,Boolean> entry: hm.entrySet()){
            orderMapper.updateAuthorities(entry.getKey(),entry.getValue());
        }
    }
}
