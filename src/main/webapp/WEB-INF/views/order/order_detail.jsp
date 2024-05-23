<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/order/order_detail.css">
</head>
<body>
<jsp:include page="../main/top.jsp"/>
    <div id="order_detail_box">

        <div id="order_detail_info">
            <h2>결제 정보 확인</h2>
            <h4>결제 정보를 다시 한 번 확인해 주세요</h4>
            <ul>
                <input type="hidden" id="payer_uid" value="${sessionScope.dto.userNo}">
                <input type="hidden" id="lecture_no" value="${dto.lectureNo}">

                <li class="list_item">
                    <label class="field">강좌명</label>
                    <label class="field_value" id="product_name">${dto.lectureName}</label>
                </li>
                <li class="list_item">
                    <label class="field">강사명</label>
                    <label class="field_value" id="teacher_name">${dto.teacher}</label>
                </li>
                <li class="list_item">
                    <label class="field">가격</label>
                    <label class="field_value">
                        <label id="product_price">${dto.price}</label>
                        <span>원</span>
                    </label>
                </li>
                <li class="list_item">
                    <label class="field">총 결제 금액</label>
                    <div class="field_value">
                        <label class="blue_text" id="order_total">${dto.price}</label>
                        <label class="blue_text">원</label>
                    </div>
                </li>
            </ul>

            <button>결제하기</button>
            <div id="back_link">
                <a href="/lecture_detail/${lectureNO}">뒤로가기</a>
            </div>
        </div>
    </div>
<jsp:include page="../main/footer.jsp"/>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="/resources/js/order/pay.js"></script>
</body>
</html>
