package com.chunjae.learnandrun.service;


import com.chunjae.learnandrun.dto.ChartDTO;
import com.chunjae.learnandrun.dto.LectureDTO;
import com.chunjae.learnandrun.dto.UserDTO;

import java.util.List;

public interface UserService {
    void insertUser(UserDTO dto);

    UserDTO loginUser(UserDTO dto);

    int checkId(String userId);

    int updateUser(UserDTO dto);

    UserDTO detailUser(String userId);

    List<UserDTO> listUser(int startRow, int pageSize, String search, String search_txt);

    int getUserCount(String search, String search_txt);

    int deleteUser(int userNo);

    List<LectureDTO> lectUser(int userNo);

    List<LectureDTO> wishUser(int userNo);

    List<ChartDTO> getChartData();
}
