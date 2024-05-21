<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-21
  Time: 오후 1:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/user/user_join.css">
    <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous">
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="/resources/js/user/user_join.js"></script>
    <script src="/resources/js/user/findaddr.js"></script>
</head>
<body>
<form method="post" action="joinresult">
    <ul>
        <li>
            <label for="userId">아이디</label>
            <input type="text" class="id_input" name="userId" id="userId" required>
            <span class="id_null">사용가능</span>
            <span class="id_notnull">사용불가</span>
        </li>
        <li>
            <label for="password">비밀번호</label>
            <input type="password" name="password" id="password" required>
        </li>
        <li>
            <span class="pwd_mismatch">비밀번호가 일치하지 않습니다.</span>
            <input type="password" name="pwdCheck" id="pwdCheck" placeholder="비밀번호 확인" required>
        </li>
        <li>
            <label for="userName">이름</label>
            <input type="text" name="userName" id="userName" required>
        </li>
        <li>
            <div><input type="text" id="addr" onclick="findAddr()">주소 입력하기</div>
        </li>
        <li>
            <input type="text" name="postcode" id="postcode" placeholder="우편번호" readonly>
        </li>
        <li>
            <input type="text" name="roadAddress" id="roadAddress" placeholder="도로명주소" readonly>
        </li>
        <li>
            <input type="text" name="jibunAddress" id="jibunAddress" placeholder="지번주소" readonly>
        </li>
        <li>
            <input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목" readonly>
        </li>
        <li>
            <span class="detail_addr">상세 주소를 입력해 주세요.</span>
            <input type="text" name="detailAddress" id="detailAddress" placeholder="상세 주소">
        </li>
        <li>
            <button type="submit">회원가입</button>
            <button type="reset">취소</button>
        </li>
    </ul>
</form>
<script defer src="/resources/js/user/valid.js"></script>

</body>
</html>
