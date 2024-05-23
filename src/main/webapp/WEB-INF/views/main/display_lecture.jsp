<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/index/display_lecture.css">
</head>
<body>
    <div class="display_container">
        <section class="display_lecture">
            <h1><img id="title_icon2" src="/resources/img/index/flame_icon.png" alt="인기">인기 강의</h1>
            <div class="display_box, slider">

                <div class="slide">
                    <c:forEach var="i" begin="0" end="3">
                        <a href="/lecture_detail/${hl_list[i].lectureNo}">
                            <div class="lecture_box">
                                <img src="/getImage/${hl_list[i].thumbnail}" alt="강의썸네일">
                                <h3>${hl_list[i].lectureName}</h3>
                                <p>${hl_list[i].description}</p>
                            </div>
                        </a>
                    </c:forEach>
                </div>

                <div class="slide">
                    <c:forEach var="i" begin="4" end="7">
                        <a href="/lecture_detail/${hl_list[i].lectureNo}">
                            <div class="lecture_box">
                                <img src="/getImage/${hl_list[i].thumbnail}" alt="강의썸네일">
                                <h3>${hl_list[i].lectureName}</h3>
                                <p>${hl_list[i].description}</p>
                            </div>
                        </a>
                    </c:forEach>
                </div>

                <div class="slide">
                    <c:forEach var="i" begin="8" end="11">
                        <a href="/lecture_detail/${hl_list[i].lectureNo}">
                            <div class="lecture_box">
                                <img src="/getImage/${hl_list[i].thumbnail}" alt="강의썸네일">
                                <h3>${hl_list[i].lectureName}</h3>
                                <p>${hl_list[i].description}</p>
                            </div>
                        </a>
                    </c:forEach>
                </div>

            </div>
        </section>


    </div>
</body>
</html>

