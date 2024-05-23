<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../main/top.jsp"/>
<div id="order_detail_box">
    <h1>* 주문 확인서</h1>

    <ul>
        <input type="hidden" id="payer_uid" value="${sessionScope.dto.userNo}">
        <input type="hidden" id="lecture_no" value="${dto.lectureNo}">
        <c:out value="테스트: ${sessionScope.dto.userNo}"/>
        <c:out value="강의 번호: ${dto.lectureNo}"/>

        <li>
            강좌명: <label id="product_name">${dto.lectureName}</label>
        </li>
        <li>
            강사명 : <label id="teacher_name">${dto.teacher}</label>
        </li>
        <li>
            가격: <label id="product_price">${dto.price}</label>
        </li>
        <li>
            총 결제 금액: <label id="order_total">${dto.price}</label>
        </li>
    </ul>

    <button>결제하기</button>


    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <script src="/resources/js/order/pay.js"></script>

</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>
