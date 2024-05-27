package com.chunjae.learnandrun.service;

import com.chunjae.learnandrun.dao.SeriesMapper;
import com.chunjae.learnandrun.dto.SeriesDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class SeriesServiceImple implements SeriesService{

    private SeriesMapper mapper;
    @Autowired
    public SeriesServiceImple(SeriesMapper mapper){
        this.mapper=mapper;
    }
    @Override
    public List<SeriesDTO> listSeries(int lectureNo) {

        List<SeriesDTO> list=mapper.listSeries(lectureNo);

        return list;
    }

    @Override
    public int insertSeries(HashMap<String, Object> hm) {

        int result=mapper.insertSeries(hm);

        return result;
    }

    @Override
    public int deleteSeries(int seriesNo) {

        int result=mapper.deleteSeries(seriesNo);

        return result;
    }

    @Override
    public int updateSeries(SeriesDTO dto) {

        int result=mapper.updateSeries(dto);

        return result;
    }

    @Override
    public SeriesDTO detailSeries(int seriesNo) {

        SeriesDTO dto=mapper.detailSeries(seriesNo);

        return dto;
    }

    @Override
    public int getAuthority(int lectureNo, String userId) {

        HashMap<String, Object> hm=new HashMap<>();
        hm.put("lectureNo", lectureNo);
        hm.put("userId", userId);

        int result=mapper.getAuthority(hm);

        return result;
    }

    @Override
    public String getLectureName(int lectureNo) {

        String lectureName=mapper.getLectureName(lectureNo);

        return lectureName;
    }
}
