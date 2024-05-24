package com.chunjae.learnandrun.dto;

import lombok.*;

@Getter @Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ChartDTO {
    private String subjectName;
    private int total_students;
}
