package com.chunjae.learnandrun.service;

import com.chunjae.learnandrun.dao.UserMapper;
import com.chunjae.learnandrun.dto.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

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

    @Override
    public int getUserCount(String search, String search_txt) {
        HashMap<String,Object> hm = new HashMap<>();
        hm.put("search",search);
        hm.put("search_txt",search_txt);

        int result = userMapper.getUserCount(hm);
        return result;
    }
    @Override
    public List<UserDTO> listUser(String search, String search_txt) {
        HashMap<String, Object> hm = new HashMap<>();
        hm.put("search",search);
        hm.put("search_txt",search_txt);

        List<UserDTO> list = userMapper.listUser(hm);
        return list;
    }

}
