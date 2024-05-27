<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <script src="https://kit.fontawesome.com/4e5b2f86bb.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/lecture/lecture_list.css">
</head>
<body>
<jsp:include page="../main/top.jsp"/>
<div id="wrap">

    <%--배너--%>
    <div id="banner_box">
        <img src="/resources/img/lecture/banner.gif" alt="배너">
    </div>

    <%-- 검색창 --%>
    <div id="lecture_search_box">
        <form method="get" action="/lecture_list/1">
            <select name="search" id="search">
                <option value="all">전체검색</option>
                <option value="lectureName">강의명</option>
                <option value="teacher">강사명</option>
                <option value="subjectName">과목</option>
            </select>
            <div id="input_box">
                <input type="text" name="search_txt" id="search_txt" >
                <button type="submit" id="glass">
                    <i class="fa-solid fa-magnifying-glass fa-lg"></i>
                </button>
            </div>
        </form>
    </div>

    <%-- 정렬 --%>
    <div id="lecture_sort_box">
        <c:choose>
            <c:when test="${empty sort || sort=='' || sort=='new'}">
                <a class="color_txt, neon" href="/lecture_list/1?search=${search}&search_txt=${search_txt}&sort=new">
                    <img class="sort_check" src="/resources/img/lecture/fill_star_icon_blue.png">
                    최신순
                </a>
                <a class="white_txt" href="/lecture_list/1?search=${search}&search_txt=${search_txt}&sort=popular">
                    <img class="sort_check" src="/resources/img/lecture/empty_star_icon.png">
                    인기순
                </a>
                <a class="white_txt" href="/lecture_list/1?search=${search}&search_txt=${search_txt}&sort=lowPrice">
                    <img class="sort_check" src="/resources/img/lecture/empty_star_icon.png">
                    낮은가격순
                </a>
                <a class="white_txt" href="/lecture_list/1?search=${search}&search_txt=${search_txt}&sort=highPrice">
                    <img class="sort_check" src="/resources/img/lecture/empty_star_icon.png">
                    높은가격순
                </a>
            </c:when>

            <c:when test="${sort=='popular'}">
                <a class="white_txt" href="/lecture_list/1?search=${search}&search_txt=${search_txt}&sort=new">
                    <img class="sort_check" src="/resources/img/lecture/empty_star_icon.png">
                    최신순
                </a>
                <a class="color_txt, neon" href="/lecture_list/1?search=${search}&search_txt=${search_txt}&sort=popular">
                    <img class="sort_check" src="/resources/img/lecture/fill_star_icon_blue.png">
                    인기순
                </a>
                <a class="white_txt" href="/lecture_list/1?search=${search}&search_txt=${search_txt}&sort=lowPrice">
                    <img class="sort_check" src="/resources/img/lecture/empty_star_icon.png">
                    낮은가격순
                </a>
                <a class="white_txt" href="/lecture_list/1?search=${search}&search_txt=${search_txt}&sort=highPrice">
                    <img class="sort_check" src="/resources/img/lecture/empty_star_icon.png">
                    높은가격순
                </a>
            </c:when>

            <c:when test="${sort=='lowPrice'}">
                <a class="white_txt" href="/lecture_list/1?search=${search}&search_txt=${search_txt}&sort=new">
                    <img class="sort_check" src="/resources/img/lecture/empty_star_icon.png">
                    최신순
                </a>
                <a class="white_txt" href="/lecture_list/1?search=${search}&search_txt=${search_txt}&sort=popular">
                    <img class="sort_check" src="/resources/img/lecture/empty_star_icon.png">
                    인기순
                </a>
                <a class="color_txt, neon" href="/lecture_list/1?search=${search}&search_txt=${search_txt}&sort=lowPrice">
                    <img class="sort_check" src="/resources/img/lecture/fill_star_icon_blue.png">
                    낮은가격순
                </a>
                <a class="white_txt" href="/lecture_list/1?search=${search}&search_txt=${search_txt}&sort=highPrice">
                    <img class="sort_check" src="/resources/img/lecture/empty_star_icon.png">
                    높은가격순
                </a>
            </c:when>

            <c:when test="${sort=='highPrice'}">
                <a class="white_txt" href="/lecture_list/1?search=${search}&search_txt=${search_txt}&sort=new">
                    <img class="sort_check" src="/resources/img/lecture/empty_star_icon.png">
                    최신순
                </a>
                <a class="white_txt" href="/lecture_list/1?search=${search}&search_txt=${search_txt}&sort=popular">
                    <img class="sort_check" src="/resources/img/lecture/empty_star_icon.png">
                    인기순
                </a>
                <a class="white_txt" href="/lecture_list/1?search=${search}&search_txt=${search_txt}&sort=lowPrice">
                    <img class="sort_check" src="/resources/img/lecture/empty_star_icon.png">
                    낮은가격순
                </a>
                <a class="color_txt, neon" href="/lecture_list/1?search=${search}&search_txt=${search_txt}&sort=highPrice">
                    <img class="sort_check" src="/resources/img/lecture/fill_star_icon_blue.png">
                    높은가격순
                </a>
            </c:when>

        </c:choose>

    </div>


    <%-- 강의 리스트 --%>
    <div id="lecture_list">
        <c:forEach var="item" items="${list}">

                <div class="lecture_room">
                    <a href="/lecture_detail/${item.lectureNo}" class="lecture_href">
                    <img src="/getImage/${item.thumbnail}" alt="썸네일" class="thumbnail">
                    <ul class="lecture_info">
                        <li>
                            <h4 class="lecture_name_field">${item.lectureName}</h4>
                        </li>
                        <li>
                            <c:choose>
                                <c:when test="${item.subjectName=='국어'}">
                                    <span class="subject_style1">${item.subjectName}</span>
                                </c:when>

                                <c:when test="${item.subjectName=='수학'}">
                                    <span class="subject_style2">${item.subjectName}</span>
                                </c:when>

                                <c:when test="${item.subjectName=='영어'}">
                                    <span class="subject_style3">${item.subjectName}</span>
                                </c:when>

                                <c:when test="${item.subjectName=='사탐'}">
                                    <span class="subject_style4">${item.subjectName}</span>
                                </c:when>

                                <c:when test="${item.subjectName=='과탐'}">
                                    <span class="subject_style5">${item.subjectName}</span>
                                </c:when>
                            </c:choose>

                            <span>${item.teacher}</span>
                        </li>
                        <li>
                            <span> ₩</span>
                            <span><fmt:formatNumber value="${item.price}" pattern="#,###" /></span>
                        </li>
                    </ul>
                    </a>
                </div>

        </c:forEach>
    </div>

    <div id="page">
        <%-- 이전 --%>
        <c:if test="${page.prev}">
            <a href="/lecture_list/1?search=${search}&search_txt=${search_txt}&sort=${sort}"><i class="fa-solid fa-angles-left"></i></a>
            <a href="/lecture_list/${page.startBlock-1}?search=${search}&search_txt=${search_txt}&sort=${sort}"><i class="fa-solid fa-angle-left"></i></a>
        </c:if>

        <%-- 페이지 --%>
        <c:forEach var="index" begin="${page.startBlock}" end="${page.endBlock}">
            <c:choose>
                <c:when test="${index==page.currPage}">
                    <p><c:out value="${index}"/></p>
                </c:when>
                <c:otherwise>
                    <a href="/lecture_list/${index}?search=${search}&search_txt=${search_txt}&sort=${sort}"><c:out value="${index}"/></a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <%-- 다음 --%>
        <c:if test="${page.next}">
            <a href="/lecture_list/${page.endBlock+1}?search=${search}&search_txt=${search_txt}&sort=${sort}"><i class="fa-solid fa-angle-right"></i></a>
            <a href="/lecture_list/${page.totalPage}?search=${search}&search_txt=${search_txt}&sort=${sort}"><i class="fa-solid fa-angles-right"></i></a>
        </c:if>
    </div>
</div>
<jsp:include page="../main/footer.jsp"/>

</body>
</html>
