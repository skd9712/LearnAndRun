<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/lecture/lecture_update.css">
    <script src="/resources/js/lecture/lecture_update.js"></script>
</head>
<body>
<div id="wrap">
    <h2>강의 수정</h2>
    <div class="line"></div>
    <form method="post" action="/lecture_update_result" enctype="multipart/form-data">
        <ul>
            <li id="li1">
                <label for="thumbnailFile">썸네일</label>
                <img src="/getImage/${dto.thumbnail}" alt="${dto.thumbnail}" id="thumbnailImg">
                <input type="file" name="thumbnailFile" id="thumbnailFile">
                <input type="hidden" name="prevThumbnail" value="${dto.thumbnail}">
            </li>
            <li>
                <label for="lectureName">강의명</label>
                <input type="text" name="lectureName" id="lectureName" value="${dto.lectureName}">
            </li>
            <li>
                <label for="teacher">강사명</label>
                <input type="text" name="teacher" id="teacher" value="${dto.teacher}">
            </li>
            <li>
                <label for="description">강의설명</label>
                <textarea cols="40" rows="5" maxlength="250" name="description" id="description">${dto.description}</textarea>
            </li>
            <li>
                <label for="subjectName">과목</label>
                <select name="subjectName" id="subjectName">
                    <option value="국어"
                            <c:if test="${dto.subjectName=='국어'}">
                                selected
                            </c:if>>국어</option>
                    <option value="수학"
                            <c:if test="${dto.subjectName=='수학'}">
                                selected
                            </c:if>>수학</option>
                    <option value="영어"
                            <c:if test="${dto.subjectName=='영어'}">
                                selected
                            </c:if>>영어</option>
                    <option value="사탐"
                            <c:if test="${dto.subjectName=='사탐'}">
                                selected
                            </c:if>>사탐</option>
                    <option value="과탐"
                            <c:if test="${dto.subjectName=='과탐'}">
                                selected
                            </c:if>>과탐</option>
                </select>
            </li>
            <li>
                <label for="target">수강대상</label>
                <select name="target" id="target">
                    <option value="고1"
                            <c:if test="${dto.target=='고1'}">
                                selected
                            </c:if>>고1</option>
                    <option value="고2"
                            <c:if test="${dto.target=='고2'}">
                                selected
                            </c:if>>고2</option>
                    <option value="고3"
                            <c:if test="${dto.target=='고3'}">
                                selected
                            </c:if>>고3</option>
                </select>
            </li>
            <li>
                <label for="price">가격</label>
                <input type="text" name="price" id="price" value="${dto.price}">
            </li>
            <li>
                <label for="startDate">개강일</label>
                <input type="date" name="startDate" id="startDate" value="${dto.startDate}">
            </li>
            <li>
                <label for="lectureDataFile">강의자료</label>
                <input type="text" name="lectureData" id="lectureData" value="${dto.lectureData}" readonly>
                <input type="file" name="lectureDataFile" id="lectureDataFile">
                <input type="hidden" name="prevLectureData" id="prevLectureData" value="=${dto.lectureData}">
            </li>
            <li>
                <input type="hidden" name="lectureNo" value="${dto.lectureNo}">
                <input type="submit" id="append" value="수정하기">
            </li>
        </ul>
    </form>
</div>
</body>
</html>
