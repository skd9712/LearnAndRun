package com.chunjae.learnandrun.service;

import com.chunjae.learnandrun.dao.UserMapper;
import com.chunjae.learnandrun.dto.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImple implements UserService{
    private final UserMapper userMapper;

    @Autowired
    public UserServiceImple(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public void insertUser(UserDTO dto) {
        userMapper.insertUser(dto);
    }

    @Override
    public UserDTO loginUser(UserDTO dto) {
        return userMapper.loginUser(dto);
    }

    @Override
    public int checkId(String userId) {
        return userMapper.checkId(userId);
    }

    @Override
    public int updateUser(UserDTO dto) {
        int result = userMapper.updateUser(dto);
        return result;
    }

    @Override
    public UserDTO detailUser(String userId) {
        return userMapper.detailUser(userId);
    }
}
