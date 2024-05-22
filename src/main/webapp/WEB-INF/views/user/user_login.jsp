<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/user/user_login.css">
</head>
<body>
<jsp:include page="../main/top.jsp"/>
<div id="wrap">
<form method="post" action="loginresult">
<%--    <img src="/resources/img/index/rabbit_moon.png" alt="토끼"/>--%>
    <ul>
        <h2>로그인</h2>
        <li>
            <input type="text" name="userId" id="userId" placeholder="아이디">
        </li>
        <li>
            <input type="password" name="password" id="password" placeholder="비밀번호">
        </li>
        <li>
            <button type="submit">로그인</button>
        </li>
        <a href="/user_join">회원가입</a>
        <li>
            <c:if test = "${result == 0}">
                <div class="login_warn">사용자ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
            </c:if>
        </li>
    </ul>
</form>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>
