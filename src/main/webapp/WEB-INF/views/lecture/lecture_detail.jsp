<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/lecture/lecture_detail.css">
    <script src="/resources/js/lecture/series.js"></script>
</head>
<body>
<jsp:include page="../main/top.jsp"/>
<div id="wrap">
    <section id="top">
        <h2>${dto.lectureName}</h2>
        <%-- 강의수정 : 관리자만 볼 수 있도록 수정 --%>
        <a href="/lecture_update/${dto.lectureNo}">수정하기</a>
    </section>
    <div class="line"></div>
    <section>
       <article id="mainInfo">
           <img src="/getImage/${dto.thumbnail}" alt="${dto.thumbnail}">
           <ul class="ul1">
               <li>
                   <h3>${dto.lectureName}</h3>
               </li>
               <li>
                   <span>과목</span>
                   <span>${dto.subjectName}</span>
               </li>
               <li>
                   <span>선생님</span>
                   <span>${dto.teacher}</span>
               </li>
               <li>
                   <span>가격</span>
                   <span><fmt:formatNumber value="${dto.price}" pattern="#,###" /></span>
               </li>
               <li>
                   <span>수강대상</span>
                   <span>${dto.target}</span>
               </li>
               <li>
                   <span>개강일</span>
                   <span>${dto.startDate}</span>
               </li>
           </ul>
       </article>
        <ul class="ul2">
            <li>
                <a href="#" id="order">바로결제</a>
                <a href="#" id="wish">찜하기</a>
            </li>
        </ul>

        <ul class="ul3">
            <li><a href="#lectureDescription">강의소개</a></li>
            <li><a href="#lectureData">강의자료</a></li>
            <li><a href="#lectureSeries">세부강의</a></li>
        </ul>
        <article id="lectureDescription">
            <h3>강의소개</h3>
            <div id="lectureInfoBox">
                <p>${dto.description}</p>
            </div>
        </article>
        <article id="lectureData">
            <h3>강의자료</h3>
            <span>첨부파일</span>
            <span><a href="/download/${dto.lectureData}">강의자료(${dto.lectureName})</a></span>
        </article>
        <article id="lectureSeries">
            <h3>세부강의</h3>
            <div id="series">
                <%-- 세부강의 등록 --%>
                <form>
                    <ul>
                        <li>
                            <label for="detailName">세부 강의명</label>
                            <input type="text" name="detailName" id="detailName">
                        </li>
                        <li>
                            <label for="detailUrl">세부 강의 URL</label>
                            <input type="url" name="detailUrl" id="detailUrl">
                            <input type="hidden" name="lectureNo" id="lectureNo" value="${dto.lectureNo}">
                            <input type="button" name="append" id="append" value="등록">
                        </li>
                    </ul>
                </form>
                <div id="seriesTable">
                    <div class="seriesTr">
                        <div class="seriesTd">강의</div>
                        <div class="seriesTd">강의명</div>
                        <div class="seriesTd">강의듣기</div>
                        <div class="seriesTd">수정</div>
                        <div class="seriesTd">삭제</div>
                    </div>
                </div>
            </div>
        </article>
    </section>
</div>
<jsp:include page="../main/footer.jsp"/>

<script>
    let lectureNo=${dto.lectureNo};
    init(lectureNo);
</script>
</body>
</html>
