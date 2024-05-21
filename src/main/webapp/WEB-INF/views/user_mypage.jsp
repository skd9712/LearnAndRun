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
</head>
<body>
${user.userId}님의 마이 페이지
<input type="hidden" name="userNo" id="userNo" value="${user.userNo}">
<input type="hidden" name="password" id="password" value="${user.password}">
<input type="hidden" name="userName" id="userName" value="${user.userName}">
<input type="hidden" name="addr" id="addr" value="${user.addr}">
<a href="/user_update">내정보 수정</a>
<a href="/user_logout">로그아웃</a>
</body>
</html>
