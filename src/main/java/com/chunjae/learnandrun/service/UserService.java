package com.chunjae.learnandrun.service;


import com.chunjae.learnandrun.dto.UserDTO;

public interface UserService {
    void insertUser(UserDTO dto);

    UserDTO loginUser(UserDTO dto);

    int checkId(String userId);

    int updateUser(UserDTO dto);

    UserDTO detailUser(String userId);
}
