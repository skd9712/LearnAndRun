package com.chunjae.learnandrun.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@Getter @Setter
@AllArgsConstructor
@NoArgsConstructor
public class LectureDTO {
    private int lectureNo; //강의번호
    private String lectureName; //강의명
    private String teacher; //강사명
    private String subjectName; //과목
    private String description; //강의설명
    private int price; //가격
    private String startDate; //개강일
    private MultipartFile thumbnailFile; //썸네일파일
    private MultipartFile lectureDataFile; //강의자료
    private String target; //수강대상
    private String thumbnail; //썸네일
    private String lectureData; //강의자료명
}
