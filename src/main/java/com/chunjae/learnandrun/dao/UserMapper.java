package com.chunjae.learnandrun.dao;

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
}
