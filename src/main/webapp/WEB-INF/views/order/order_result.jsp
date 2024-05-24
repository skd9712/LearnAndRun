<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../main/top.jsp"/>
<link rel="stylesheet" href="/resources/css/order/order_result.css">
<div id="order_result_box">
    <div id="order_result_msg">
        <img src="/resources/img/index/rabbit_light2.gif" alt="빛나는토끼">
        <h1>결제가 완료되었습니다.</h1>
        <h4>결제한 강의는 <a id="mypage_link" href="/user_mypage">마이페이지>수강 중인 강의목록</a>에서 확인하실 수 있습니다.</h4>
        <a id="back_home_link" href="/index">홈으로</a>
    </div>
</div>
<%--<ul>--%>
<%--    <li>강의 번호: ${lid}</li>--%>
<%--    <li>유저 번호: ${uid}</li>--%>
<%--    <li>주문 번호: ${oid}</li>--%>
<%--</ul>--%>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>
