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
}
