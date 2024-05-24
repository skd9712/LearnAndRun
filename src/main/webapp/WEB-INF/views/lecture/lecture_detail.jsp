<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/lecture/lecture_detail.css">
    <script src="https://kit.fontawesome.com/4e5b2f86bb.js" crossorigin="anonymous"></script>
    <script src="/resources/js/lecture/lecture_detail.js"></script>
    <script src="/resources/js/lecture/series.js"></script>
</head>
<body>
<jsp:include page="../main/top.jsp"/>
<div id="wrap">
    <section id="top">
        <h2>${dto.lectureName}</h2>
        <c:if test="${'admin'.equals(authority)}">
            <a href="/lecture_update/${dto.lectureNo}">수정하기</a>
        </c:if>
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
                <a href="/lecture_order/${lectureNo}" id="order">바로결제</a>
                <button type="button" id="wish"><i class="fa-solid fa-star"></i>찜하기</button>
            </li>
        </ul>
        <ul class="ul3">
<%--            <li><a href="#lectureDescription">강의소개</a></li>
            <li><a href="#lectureData">강의자료</a></li>
            <li><a href="#lectureSeries">세부강의</a></li>--%>
            <li><a href="javascript:window.scrollTo(0, 700);">강의소개</a></li>
            <li><a href="javascript:window.scrollTo(0, 900);">강의자료</a></li>
            <li><a href="javascript:window.scrollTo(0, 1200);">세부강의</a></li>
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
                <c:if test="${'admin'.equals(authority)}">
                    <%-- 세부 강의 등록폼 --%>
                    <form>
                        <ul>
                            <li>
                                <label for="detailName">세부 강의명</label>
                                <input type="text" name="detailName" id="detailName">
                            </li>
                            <li>
                                <label for="detailUrl">세부 강의 URL</label>
                                <input type="text" name="detailUrl" id="detailUrl">
                                <button type="button" name="append" id="append">등록</button>
                            </li>
                        </ul>
                    </form>
                    <div id="seriesTable">
                        <div class="seriesTr">
                            <div class="seriesTd"><p>강의</p></div>
                            <div class="seriesTd"><p>강의명</p></div>
                            <div class="seriesTd"><p>강의듣기</p></div>
                            <div class="seriesTd"><p>수정</p></div>
                            <div class="seriesTd"><p>삭제</p></div>
                        </div>
                    </div>
                </c:if>

                <div id="seriesTable">
                    <c:choose>
                        <c:when test="${'true'.equals(authority)}">
                            <div class="seriesTr">
                                <div class="seriesTd"><p>강의</p></div>
                                <div class="seriesTd"><p>강의명</p></div>
                                <div class="seriesTd"><p>강의듣기</p></div>
                            </div>
                        </c:when>
                        <c:when test="${'false'.equals(authority)}">
                            <div class="seriesTr">
                                <p>세부 강의는 결제 후 확인 가능합니다.</p>
                            </div>
                        </c:when>
                    </c:choose>
                </div>
                <c:if test="${'admin'.equals(authority) || 'true'.equals(authority)}">
                    <input type="hidden" name="lectureNo" id="lectureNo" value="${dto.lectureNo}">
                    <input type="hidden" name="lectureName" id="lectureName" value="${dto.lectureName}">
                    <input type="hidden" name="authority" id="authority" value="${authority}">
                </c:if>
            </div>
        </article>
    </section>
    <c:if test="${'admin'.equals(authority)}">
        <a href="/lecture_delete/${dto.lectureNo}">삭제하기</a>
    </c:if>
</div>
<jsp:include page="../main/footer.jsp"/>

<script>
    let lectureNo=${dto.lectureNo};
    init(lectureNo);
</script>
</body>
</html>
