package com.chunjae.learnandrun.service;

import com.chunjae.learnandrun.dto.LectureDTO;

import java.util.List;

public interface LectureService {
    int getCount(String search, String search_txt);

    List<LectureDTO> listLecture(int startRow, int pageSize, String search, String search_txt, String sort);

    LectureDTO detailLecture(int lectureNo);

    int deleteLecture(int lectureNo);
}
