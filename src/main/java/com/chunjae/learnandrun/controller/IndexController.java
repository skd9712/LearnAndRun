package com.chunjae.learnandrun.controller;

import com.chunjae.learnandrun.dto.LectureDTO;
import com.chunjae.learnandrun.service.LectureService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class IndexController {

    private final LectureService service;

    @GetMapping("/index")
    public String index(Model model){
        //개강 임박 강의 리스트
        List<LectureDTO> bo_list = service.before_open_lecture();

        //최신 강의 리스트
        List<LectureDTO> nl_list = service.new_lecture();

        //인기 강의 리스트
        List<LectureDTO> hl_list = service.hot_lecture();

        //개강 임박 강의 리스트 넘김
        model.addAttribute("bo_list", bo_list);

        //최신 강의 리스트 넘김
        model.addAttribute("nl_list", nl_list);

        //인기 강의 리스트 넘김
        model.addAttribute("hl_list", hl_list);

        //데이터 넘겨야 하는 페이지들
        model.addAttribute("lec","display_lecture.jsp");
        model.addAttribute("calendar","google_calendar.jsp");

        return "main/index";
    }
}
