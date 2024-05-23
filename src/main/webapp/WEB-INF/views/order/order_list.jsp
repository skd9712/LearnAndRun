<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-23
  Time: 오후 3:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/order/order_list.css">
</head>
<body>
<jsp:include page="../main/top.jsp"/>
<div id="order_list">
<form method="post" action="updateAuthority">
    <div class="admin_func">
        <a href="/user_manager">
            <h2>회원 정보</h2>
        </a>
        <a href="/order_list">
            <h2>수강 내역</h2>
        </a>
    </div>
    <c:forEach var="item" items="${list}">
        <li>
                ${item.lectureNo}
                ${item.orderDate}
                ${item.userNo}
                    <input type="hidden" name="orderNo_${item.orderNo}" value="${item.orderNo}">
            <input type="checkbox" name="authority_${item.orderNo}" value="true" ${item.authority ? 'checked' : ''}/>
            Authority
        </li>
    </c:forEach>
    <div id="page">
        <c:if test="${page.prev}">
        <a href="/order_list/1"><i class="fa-solid fa-angles-left"></i></a>
        <a href="/order_list/${page.startBlock-1}"><i
                class="fa-solid fa-angles-left"></i></a>
        </c:if>
        <c:forEach var="index" begin="${page.startBlock}" end="${page.endBlock}">
            <c:choose>
                <c:when test="${index==page.currPage}">
                    <p><c:out value="${index}"/></p>
                </c:when>
                <c:otherwise>
                    <a href="/order_list/${index}"><c:out
                            value="${index}"/></a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
        <c:if test="${page.next}">
            <a href="/order_list/${page.endBlock+1}">
                <i class="fa-solid fa-angle-right"></i></a>
            <a href="/order_list/${page.totalPage}">
                <i class="fa-solid fa-angle-right"></i></a>
        </c:if>
    </div>
    <input type="submit" value="Update">
</form>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>
