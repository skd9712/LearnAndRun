package com.chunjae.learnandrun.dto;

import lombok.*;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class UserDTO {
    private int userNo;
    private String userId;
    private String password;
    private String userName;
    private String addr;
}
