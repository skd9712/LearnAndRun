<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/index/top.css">
</head>
<body>

<header>
    <span class="header_01">
        <a href="/index">
            <img class="header_img" src="/resources/img/index/logo.gif" alt="로고 이미지">
            <img class="header_img_txt" src="/resources/img/index/logo_text.png" alt="로고 텍스트">
        </a>
    </span>

    <span class="header_03">
        <a class="menu_tab" href="/lecture_list">강의 탐색</a>


        <c:set var="uid" value="${sessionScope.dto.userNo}"/>
        <c:choose>
            <c:when test="${empty uid || uid==null}">
                <a class="menu_tab" id="login_btn" href="/user_login">로그인</a>
            </c:when>
            <c:otherwise>
                <c:choose>
                    <c:when test="${uid==1}">
                        <a class="menu_tab" href="#">관리자페이지</a>
                    </c:when>
                    <c:otherwise>
                        <a class="menu_tab" href="#">마이페이지</a>
                    </c:otherwise>
                </c:choose>
                <a class="menu_tab" id="logout_btn" href="/user_logout">로그아웃</a>
            </c:otherwise>


        </c:choose>

<%--        <a href="#">관리자페이지</a>--%>
<%--        <a href="#">마이페이지</a>--%>
    </span>
</header>

</body>
</html>
