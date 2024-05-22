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
        List<LectureDTO> bo_list = service.before_open_lecture();

        model.addAttribute("bo_list", bo_list);
        return "main/index";
    }
}
