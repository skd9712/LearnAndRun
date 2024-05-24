package com.chunjae.learnandrun.dao;

import com.chunjae.learnandrun.dto.ChartDTO;
import com.chunjae.learnandrun.dto.LectureDTO;
import com.chunjae.learnandrun.dto.UserDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface UserMapper {
    void insertUser(UserDTO dto);

    UserDTO loginUser(UserDTO dto);

    int checkId(String userId);

    int updateUser(UserDTO dto);

    UserDTO detailUser(String userId);

    List<UserDTO> listUser(HashMap<String,Object> hm);

    int getUserCount(HashMap<String, Object> hm);

    int deleteUser(int userNo);

    List<LectureDTO> lectUser(int userNo);

    List<LectureDTO> wishUser(int userNo);

    List<ChartDTO> getChartData();
}
