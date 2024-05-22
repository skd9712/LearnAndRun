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
<jsp:include page="../main/top.jsp"/>
<div id="wrap">
    <form method="post" action="joinresult">
        <ul>
            <h2>회원가입</h2>
            <li>
                <input type="text" class="id_input" name="userId" id="userId" placeholder="아이디" required>
            </li>
            <li>
                <span class="id_null">사용가능</span>
                <span class="id_notnull">사용불가</span>
            </li>
            <li>
                <input type="password" name="password" id="password" placeholder="비밀번호" required>
            </li>
            <li>
                <span class="pwd_mismatch">비밀번호가 일치하지 않습니다.</span>
                <input type="password" name="pwdCheck" id="pwdCheck" placeholder="비밀번호 확인" required>
            </li>
            <li>
                <input type="text" name="userName" id="userName" placeholder="이름" required>
            </li>
            <li>
                <input type="text" id="addr" onclick="findAddr()" placeholder="주소 입력하기">
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
                <input type="text" name="detailAddress" id="detailAddress" placeholder="상세 주소 입력">
            </li>
            <li>
                <button type="submit">회원가입</button>
            </li>
        </ul>
    </form>
    <script defer src="/resources/js/user/valid.js"></script>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>
