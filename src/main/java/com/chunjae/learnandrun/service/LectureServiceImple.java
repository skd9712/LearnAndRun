package com.chunjae.learnandrun.service;

import com.chunjae.learnandrun.dao.LectureMapper;
import com.chunjae.learnandrun.dto.LectureDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class LectureServiceImple implements LectureService{

    private LectureMapper mapper;
    @Autowired
    public LectureServiceImple(LectureMapper mapper){
        this.mapper=mapper;
    }
    @Override
    public int getCount(String search, String search_txt) {
        HashMap<String, Object> hm=new HashMap<>();
        hm.put("search", search);
        hm.put("search_txt", search_txt);

        int result=mapper.getCount(hm);

        return result;
    }

    @Override
    public List<LectureDTO> listLecture(int startRow, int pageSize, String search, String search_txt, String sort) {
        HashMap<String, Object> hm=new HashMap<>();
        hm.put("startRow", startRow);
        hm.put("pageSize", pageSize);
        hm.put("search", search);
        hm.put("search_txt", search_txt);
        hm.put("sort", sort);

        List<LectureDTO> list=mapper.listLecture(hm);

        return list;
    }

    @Override
    public LectureDTO detailLecture(int lectureNo) {
        LectureDTO dto=mapper.detailLecture(lectureNo);
        return dto;
    }

    @Override
    public int deleteLecture(int lectureNo) {
        int result=mapper.deleteLecture(lectureNo);
        return result;
    }
}
