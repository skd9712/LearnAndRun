package com.chunjae.learnandrun.dto;

import org.springframework.web.multipart.MultipartFile;

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
    private String lectureData;

    public int getLectureNo() {
        return lectureNo;
    }

    public void setLectureNo(int lectureNo) {
        this.lectureNo = lectureNo;
    }

    public String getLectureName() {
        return lectureName;
    }

    public void setLectureName(String lectureName) {
        this.lectureName = lectureName;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public MultipartFile getThumbnailFile() {
        return thumbnailFile;
    }

    public void setThumbnailFile(MultipartFile thumbnailFile) {
        this.thumbnailFile = thumbnailFile;
    }

    public MultipartFile getLectureDataFile() {
        return lectureDataFile;
    }

    public void setLectureDataFile(MultipartFile lectureDataFile) {
        this.lectureDataFile = lectureDataFile;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public String getLectureData() {
        return lectureData;
    }

    public void setLectureData(String lectureData) {
        this.lectureData = lectureData;
    }

    @Override
    public String toString() {
        return "LectureDTO{" +
                "lectureNo=" + lectureNo +
                ", lectureName='" + lectureName + '\'' +
                ", teacher='" + teacher + '\'' +
                ", subjectName='" + subjectName + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", startDate='" + startDate + '\'' +
                ", thumbnailFile=" + thumbnailFile +
                ", lectureDataFile=" + lectureDataFile +
                ", target='" + target + '\'' +
                ", thumbnail='" + thumbnail + '\'' +
                ", lectureData='" + lectureData + '\'' +
                '}';
    }
}
