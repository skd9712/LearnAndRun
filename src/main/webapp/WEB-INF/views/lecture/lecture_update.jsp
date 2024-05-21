<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="wrap">
    <h2>강의 수정</h2>
    <div class="line"></div>
    <form method="post" action="/lecture_update_result" enctype="multipart/form-data">
        <ul>
            <li>
                <label for="thumbnailFile">썸네일</label>
                <img src="/getImage/${dto.thumbnail}" alt="${dto.thumbnail}">
                <input type="file" name="thumbnailFile" id="thumbnailFile" value="${dto.thumbnail}">
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
                <select name="subjectName" id="subjectName" >
                    <option value="국어">국어</option>
                    <option value="수학">수학</option>
                    <option value="영어">영어</option>
                    <option value="사탐">사탐</option>
                    <option value="과탐">과탐</option>
                </select>
            </li>
            <li>
                <label for="target">수강대상</label>
                <select name="target" id="target">
                    <option value="고1">고1</option>
                    <option value="고2">고2</option>
                    <option value="고3">고3</option>
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
                <input type="file" name="lectureDataFile" id="lectureDataFile" datasrc="/getImage/${dto.thumbnail}">
            </li>
            <li>
                <input type="hidden" name="lectureNo" value="${dto.lectureNo}">
                <input type="submit" value="등록하기">
            </li>
        </ul>
    </form>
</div>
</body>
</html>
