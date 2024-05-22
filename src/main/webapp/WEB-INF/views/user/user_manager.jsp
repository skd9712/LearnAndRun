<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-22
  Time: 오전 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="https://kit.fontawesome.com/4e5b2f86bb.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/user/user_manager.css">
</head>
<body>
관리자 페이지입니다.
환영합니다 ${dto.userId}님
<a href="/user_logout">로그아웃</a>
<a href="/lecture_insert">강의 등록하기</a>
<form method="get" action="/user_manager/${page.currPage}">
    <select name="search" id="search">
        <option value="all">전체검색</option>
        <option value="userId">아이디</option>
        <option value="userName">사용자명</option>
        <option value="addr">주소</option>
    </select>
    <div id="input_box">
        <input type="text" name="search_txt" id="search_txt">
        <button type="submit" id="glass">
            <i class="fa-solid fa-magnifying-glass fa-lg"></i>
        </button>
    </div>
</form>
<div id="user_list">
    <c:forEach var="item" items="${list}">
        <ul>
            <li>${item.userNo}</li>
            <li>${item.userId}</li>
            <li>${item.userName}</li>
            <li>${item.addr}</li>
        </ul>
    </c:forEach>
</div>

<div id="page">
<%--    이전--%>
    <c:if test="${page.prev}">
        <a href="/user_manager/1?search=${search}&search_txt=${search_txt}"><i class="fa-solid fa-angles-left"></i></a>
        <a href="/user_manager/${page.startBlock-1}?search=${search}&search_txt=${search_txt}"><i
                class="fa-solid fa-angles-left"></i></a>
    </c:if>
<%--페이지 번호--%>
    <c:forEach var="index" begin="${page.startBlock}" end="${page.endBlock}">
        <c:choose>
            <c:when test="${index==page.currPage}">
                <p><c:out value="${index}"/></p>
            </c:when>
            <c:otherwise>
                <a href="/user_manager/${index}?search=${search}&search_txt=${search_txt}"><c:out value="${index}"/></a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
<%--다음--%>
    <c:if test="${page.next}">
        <a href="/user_manager/${page.endBlock+1}?search=${search}&search_txt=${search_txt}">
            <i class="fa-solid fa-angle-right"></i></a>
        <a href="/user_manager/${page.totalPage}?search=${search}&search_txt=${search_txt}">
            <i class="fa-solid fa-angle-right"></i></a>
    </c:if>
</div>
<script>
    window.onload = function() {
        // URL에서 검색 조건(search)과 검색어(search_txt) 값을 가져옵니다.
        var search = getParameterByName('search');
        var searchTxt = getParameterByName('search_txt');

        // 검색 조건(select box)에 이전에 선택했던 값을 설정합니다.
        if(search) {
            document.getElementById('search').value = search;
        }

        // 검색어(input box)에 이전에 입력했던 값을 설정합니다.
        if(searchTxt) {
            document.getElementById('search_txt').value = searchTxt;
        }
    };

    // URL에서 특정 파라미터 값을 가져오는 함수입니다.
    function getParameterByName(name) {
        name = name.replace(/[\[\]]/g, '\\$&');
        var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
            results = regex.exec(window.location.href);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, ' '));
    }
</script>

</body>
</html>
