package com.chunjae.learnandrun.controller;

import com.chunjae.learnandrun.dto.LectureDTO;
import com.chunjae.learnandrun.dto.MakePage;
import com.chunjae.learnandrun.service.LectureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class LectureController {

    private final LectureService service;
    @Autowired
    public LectureController(LectureService service){
        this.service=service;
    }

    /** 강의 리스트 */
    @GetMapping(value = {"/lecture_list", "/lecture_list/{curr}"})
    public String listLecture(@PathVariable(required = false) String curr
            , @RequestParam(required = false, defaultValue = "") String search
            , @RequestParam(required = false, defaultValue = "") String search_txt
            , @RequestParam(required = false, defaultValue = "") String sort
            , Model model){

        /* 현재 페이지 */
        int currPage=1;
        if(curr!=null)
            currPage = Integer.parseInt(curr);

        /* 자료 카운트 */
        int totalCount=service.getCount(search, search_txt);


        /* 페이지 */
        int pageSize=12;
        int blockSize=5;
        MakePage page=new MakePage(currPage, totalCount, pageSize, blockSize);

        List<LectureDTO> list=service.listLecture(page.getStartRow(), pageSize, search, search_txt, sort);

        model.addAttribute("list", list);
        model.addAttribute("page", page);
        model.addAttribute("search", search);
        model.addAttribute("search_txt", search_txt);
        model.addAttribute("sort", sort);

        return "lecture_list";
    }

    /** 강의 등록 폼 */
    @GetMapping("/lecture_insert")
    public String insertLecture(){
        return "lecture_insert";
    }

    /** 강의 등록 결과 */
    @PostMapping("/lecture_insert_result")
    public String insertLectureResult(@RequestParam(required = false, defaultValue = "") String thumbnail
            , @RequestParam(required = false, defaultValue = "") String lectureName
            , @RequestParam(required = false, defaultValue = "") String teacher
            , @RequestParam(required = false, defaultValue = "") String description
            , @RequestParam(required = false, defaultValue = "") String subjectName
            , @RequestParam(required = false, defaultValue = "") String target
            , @RequestParam(required = false, defaultValue = "") String price
            , @RequestParam(required = false, defaultValue = "") String startDate
            , @RequestParam(required = false, defaultValue = "") String lectureData){
        return "redirect:/lecture_list";
    }

    /** 강의 상세 */
    @GetMapping("/lecture_detail/{lectureNo}")
    public String detailLecture(@PathVariable int lectureNo, Model model){

        LectureDTO dto=service.detailLecture(lectureNo);
        model.addAttribute("dto", dto);
        return "lecture_detail";
    }

//    /** 강의 수정 폼 */
//    @GetMapping("/lecture_update")
//    public String updateLecture(){
//        return "lecture_insert";
//    }

    /** 강의 삭제 */
    @GetMapping("/lecture_delete/{lectureNo}")
    public String deleteLecture(@PathVariable int lectureNo, Model model){

        int result=service.deleteLecture(lectureNo);

        model.addAttribute("result", result);

        return "lecture_delete";
    }
}
