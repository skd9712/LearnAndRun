package com.chunjae.learnandrun.dao;

import com.chunjae.learnandrun.dto.LectureDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface LectureMapper {
    int getCount(HashMap<String, Object> hm);

    List<LectureDTO> listLecture(HashMap<String, Object> hm);

    List<LectureDTO> before_open_lecture();

    LectureDTO detailLecture(int lectureNo);

    int deleteLecture(int lectureNo);

    int insertLecture(LectureDTO dto);

    void updateLecture(LectureDTO dto);

    List<LectureDTO> new_lecture();
}
