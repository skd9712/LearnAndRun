<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/lecture/lecture_detail.css">
    <script src="/resources/js/lecture/lecture_detail.js"></script>
</head>
<body>
<jsp:include page="../main/top.jsp"/>
<div id="wrap">
    <%--카카오 스티커--%>
    <div id="kakao_channel">
        <a href="http://pf.kakao.com/_mkuUs">
            <img src="/resources/img/lecture/kakao_icon2.webp" alt="카카오 채널추가">
        </a>
    </div>

    <section id="top">
        <h2>${dto.lectureName}</h2>
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
            <c:set var="now" value="<%=new java.util.Date()%>"/>
            <fmt:formatDate var="today" value="${now}" pattern="yyyy-MM-dd" />
            <c:set var="uid" value="${sessionScope.dto.userNo}"/>
            <li>
                <c:choose>
                    <c:when test="${uid==1}">
                        <a id="lecture_edit_btn" href="/lecture_update/${dto.lectureNo}">수정하기</a>
                        <a id="lecture_del_btn" href="/lecture_delete/${dto.lectureNo}">삭제하기</a>
                    </c:when>
                    <c:otherwise>
                        <c:choose>

                            <c:when test="${empty uid || uid==null}">
                                <a href="/user_login" id="order">수강신청</a>
                            </c:when>

                            <c:otherwise>
                                <c:choose>
                                    <c:when test="${'false'.equals(authority)}">
                                        <c:choose>
                                            <c:when test="${dto.startDate>today}">
                                                <a href="#" id="order">개강전 강의</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="/lecture_order/${lectureNo}" id="order">수강신청</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:when>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>
                        <button type="button" id="wish" value="false"><img id="wish_star" src="/resources/img/lecture/empty_star_icon2.png" alt="별">찜하기</button>

                    </c:otherwise>
                </c:choose>
            </li>
        </ul>
        <ul class="ul3">
<%--        <li><a href="#lectureDescription">강의소개</a></li>
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
            <c:choose>
                <c:when test="${'true'.equals(authority) || uid==1}">
                    <span>첨부파일</span>
                    <span><a href="/download/${dto.lectureData}">강의자료(${dto.lectureName}).zip</a></span>
                </c:when>
                <c:when test="${'false'.equals(authority)}">
                    <p></p>
                    <p class="info_msg">강의 자료는 수강 신청 후 확인 가능합니다.</p>
                </c:when>
            </c:choose>

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


                    <c:choose>
                        <c:when test="${'true'.equals(authority)}">
                        <div id="seriesTable">
                            <div class="seriesTr">
                                <div class="seriesTd"><p>강의</p></div>
                                <div class="seriesTd"><p>강의명</p></div>
                                <div class="seriesTd"><p>강의듣기</p></div>
                            </div>
                        </div>
                        </c:when>
                        <c:when test="${'false'.equals(authority)}">
                            <p class="info_msg">세부 강의는 수강 신청 후 확인 가능합니다.</p>
                        </c:when>
                    </c:choose>

                <c:if test="${'admin'.equals(authority) || 'true'.equals(authority)}">
                    <input type="hidden" name="lectureNo" id="lectureNo" value="${dto.lectureNo}">
                    <input type="hidden" name="lectureName" id="lectureName" value="${dto.lectureName}">
                    <input type="hidden" name="authority" id="authority" value="${authority}">
                </c:if>
                <input type="hidden" name="user" id="user" value="${user}">
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
