package com.chunjae.learnandrun.controller;

import com.chunjae.learnandrun.dto.SeriesDTO;
import com.chunjae.learnandrun.service.SeriesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@Controller
public class SeriesController {

    private SeriesService service;
    @Autowired
    public SeriesController(SeriesService service){
        this.service=service;
    }

    /** 세부 강의 리스트 */
    @GetMapping("/listSeries/{lectureNo}")
    public @ResponseBody List<SeriesDTO> listSeries(@PathVariable int lectureNo){
        List<SeriesDTO> list=service.listSeries(lectureNo);

        return list;
    }

    /** 세부 강의 등록 */
    @PostMapping("/insertSeries")
    public @ResponseBody HashMap<String, Object> insertSeries(@RequestBody HashMap<String, Object> hm){

        System.out.println("!!!!!!!!!!!!!!!!!!!!");
        System.out.println("!!!!!!!!!!!!!!!!!!!!");
        System.out.println(hm.get("detailName"));
        System.out.println("!!!!!!!!!!!!!!!!!!!!");
        System.out.println("!!!!!!!!!!!!!!!!!!!!");


        int result=service.insertSeries(hm);

        return hm;
    }


    /** 세부 강의 수정 */


    /** 세부 강의 삭제 */
    @GetMapping("/deleteSeries/{lectureNo}/{seriesNo}")
    public String deleteSeries(@PathVariable int lectureNo
            , @PathVariable int seriesNo){

        int result=service.deleteSeries(seriesNo);

        return "redirect:/lecture_detail/"+lectureNo+"#lectureSeries";
    }
}
