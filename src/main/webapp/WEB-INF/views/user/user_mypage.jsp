<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-21
  Time: 오후 2:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/user/user_mypage.css">
</head>
<body>
<div id="mypage">
    <section class="myinfo">
        <h3>${user.userId}님의 마이 페이지</h3>
        <a href="/user_update">내정보 수정</a>
        <a href="/user_logout">로그아웃</a>
    </section>
    <ul class="lecture_list">
    <li class="mylecture">
        <h4>수강중인 강의 목록</h4>
    </li>
    <li class="wishlist">
        <h4>내가 찜한 목록</h4>
    </li>
    </ul>
</div>
</body>
</html>
