package com.chunjae.learnandrun.controller;

import com.chunjae.learnandrun.dto.LectureDTO;
import com.chunjae.learnandrun.service.LectureService;
import com.chunjae.learnandrun.service.OrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class OrderController {

    private final OrderService orderService;

    private final LectureService lectureService;

    @GetMapping("/lecture_order/{lectureNO}")
    public String order_detail(
            @PathVariable int lectureNO
            , Model model
    ){
        LectureDTO dto = lectureService.detailLecture(lectureNO);
        model.addAttribute("dto", dto);
        return "order/order_detail";
    }

    @PostMapping("/order_result")
    public String order_result(
            @RequestParam(required = false) int buyer_buyid
            , @RequestParam(required = false) int lecture_id
            , @RequestParam(required = false) String order_id
    ){

        orderService.insertOrder(buyer_buyid, lecture_id, order_id);

        return "order/order_result";
    }

}
