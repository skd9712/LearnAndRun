package com.chunjae.learnandrun.service;

import com.chunjae.learnandrun.dto.SeriesDTO;

import java.util.HashMap;
import java.util.List;

public interface SeriesService {
    List<SeriesDTO> listSeries(int lectureNo);

    int insertSeries(HashMap<String, Object> hm);

    int deleteSeries(int seriesNo);
}
