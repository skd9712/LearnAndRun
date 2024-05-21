<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-21
  Time: 오후 1:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/user/user_login.css">
</head>
<body>
<form method="post" action="loginresult">
    <ul>
        <li>
            <label for="userId">아이디</label>
            <input type="text" name="userId" id="userId">
        </li>
        <li>
            <label for="password">비밀번호</label>
            <input type="password" name="password" id="password">
        </li>
        <li>
            <button type="submit">로그인</button>
            <button type="reset">취소</button>
        </li>
        <li>
            <c:if test = "${result == 0}">
                <div class="login_warn">사용자ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
            </c:if>
        </li>
    </ul>
</form>
</body>
</html>
