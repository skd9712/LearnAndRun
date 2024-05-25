package com.chunjae.learnandrun.service;

import com.chunjae.learnandrun.dto.LectureDTO;
import com.chunjae.learnandrun.dto.WishDTO;

import java.util.List;

public interface LectureService {
    int getCount(String search, String search_txt);

    List<LectureDTO> listLecture(int startRow, int pageSize, String search, String search_txt, String sort);

    LectureDTO detailLecture(int lectureNo);

    int deleteLecture(String uploadPath, int lectureNo);

    int insertLecture(String uploadPath, LectureDTO dto);

    int updateLecture(String uploadPath, LectureDTO dto, boolean ThumbnailIsEmpty, boolean LectureDataIsEmpty);

    List<LectureDTO> before_open_lecture();

    List<LectureDTO> new_lecture();

    List<LectureDTO> hot_lecture();

    String getAuthority(int lectureNo, String userId);

    boolean wishList(int userNo, int lectureNo);

    int deleteWish(int userNo, int lectureNo);

    int insertWish(int userNo, int lectureNo);
}
