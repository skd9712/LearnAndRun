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
<%--관리자 페이지입니다.--%>
<%--환영합니다 ${dto.userId}님--%>
<%--<a href="/user_logout">로그아웃</a>--%>
<%--<a href="/lecture_insert">강의 등록하기</a>--%>
<jsp:include page="../main/top.jsp"/>
<div id="user">

    <div id="user_list">
        <div class="admin_func">
        <a href="/user_manager/">
            <h2>회원 정보</h2>
        </a>
        <a href="/order_list">
            <h2>수강 내역</h2>
        </a>
        </div>
        <%--    검색--%>
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
        <table>
            <th>
                <tr>유저번호</tr>
                <tr>아이디</tr>
                <tr>사용자명</tr>
                <tr>주소</tr>
            </th>
            <c:forEach var="item" items="${list}">
                <tbody>
                <td>${item.userNo}</td>
                <td><a href="/user_update/${item.userId}">${item.userId}</a></td>
                <td>${item.userName}</td>
                <td>${item.addr}</td>
                </tbody>
            </c:forEach>
        </table>
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
                        <a href="/user_manager/${index}?search=${search}&search_txt=${search_txt}"><c:out
                                value="${index}"/></a>
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
    </div>

</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>
