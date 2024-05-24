package com.chunjae.learnandrun.dao;

import com.chunjae.learnandrun.dto.LectureDTO;
import com.chunjae.learnandrun.dto.SeriesDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface SeriesMapper {

    List<SeriesDTO> listSeries(int lectureNo);

    int insertSeries(HashMap<String, Object> hm);

    int deleteSeries(int seriesNo);

    int updateSeries(SeriesDTO dto);

    SeriesDTO detailSeries(int seriesNo);

    int getAuthority(HashMap<String, Object> hm);
}
