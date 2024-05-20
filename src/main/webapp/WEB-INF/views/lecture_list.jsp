<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
    <script src="https://kit.fontawesome.com/4e5b2f86bb.js" crossorigin="anonymous"></script>
    <script src="/resources/js/lecture_list.js"></script>
    <link rel="stylesheet" href="/resources/css/lecture_list.css">
</head>
<body>
<div id="wrap">
    <%-- 검색창 --%>
    <form method="get" action="/lecture_list/${page.currPage}">
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

    <%-- 정렬 --%>
    <ul class="select_list">
        <li class="select_option">
            <a href="/lecture_list/${page.currPage}?search=${search}&search_txt=${search_txt}&sort=new">최신순</a>
        </li>
        <li class="select_option">
            <a href="/lecture_list/${page.currPage}?search=${search}&search_txt=${search_txt}&sort=popular">인기순</a>
        </li>
        <li class="select_option">
            <a href="/lecture_list/${page.currPage}?search=${search}&search_txt=${search_txt}&sort=lowPrice">낮은가격순</a>
        </li>
        <li class="select_option">
            <a href="/lecture_list/${page.currPage}?search=${search}&search_txt=${search_txt}&sort=highPrice">높은가격순</a>
        </li>
    </ul>

    <%-- 강의 리스트 --%>
    <div id="lecture_list">
        <c:forEach var="item" items="${list}">
            <a href="/lecture_detail/${item.lectureNo}" class="lecture_href">
                <div class="lecture_room">
                    <img src="" alt="썸네일" class="thumbnail">
                    <ul>
                        <li>
                            <h4>${item.lectureName}</h4>
                        </li>
                        <li>
                            <span>${item.subjectName}</span>
                            <span>${item.teacher}</span>
                        </li>
                        <li>
                            <span><fmt:formatNumber value="${item.price}" pattern="#,###" /></span>
                        </li>
                    </ul>
                </div>
            </a>
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
</body>
</html>
