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
    <script src="https://kit.fontawesome.com/4e5b2f86bb.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/order/order_list.css">

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load("current", {packages:["corechart"]});
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            let data = google.visualization.arrayToDataTable([
                ['Task', 'Hours per Day'],
                ["${chart_data.get(1).subjectName}",${chart_data.get(1).total_students}],
                ["${chart_data.get(3).subjectName}",${chart_data.get(3).total_students}],
                ["${chart_data.get(4).subjectName}",${chart_data.get(4).total_students}],
                ["${chart_data.get(2).subjectName}",${chart_data.get(2).total_students}],
                ["${chart_data.get(0).subjectName}",${chart_data.get(0).total_students}]
            ]);

            let options = {
                is3D: true,
            };

            let chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
            chart.draw(data, options);
        }
    </script>
</head>
<body>
<jsp:include page="../main/top.jsp"/>

<div id="chart" style="width: 60vw; margin: 0 auto">
    <h2 style="position: relative; top: 10vh">과목별 수강 인원</h2>
    <div id="piechart_3d" style="margin-top: 10vh; width: 600px; height: 400px;"></div>
</div>

<div id="order_list">
    <div class="admin_func">
        <a href="/user_manager">
            <h2>회원 정보</h2>
        </a>
        <a href="/order_list">
            <h2>수강 내역</h2>
        </a>
    </div>
    <%--    검색--%>
    <div id="search_form">
        <form method="get"action="/order_list/${page.currPage}">
        <select name="search" id="search">
            <option value="all">전체검색</option>
            <option value="userName">회원명</option>
            <option value="lectureName">강의명</option>
        </select>
        <div id="input_box">
            <input type="text" name="search_txt" id="search_txt">
            <button type="submit" id="glass">
                <i class="fa-solid fa-magnifying-glass fa-lg"></i>
            </button>
        </div>
        </form>
    </div>
    <form method="post" action="updateAuthority">
<%--        <input type="submit" class="updateAuth">--%>
        <input type="image" src="/resources/img/order/order_list_update.png" alt="update" class="updateAuth">
        <ul class="detail_list">
            <li><span>주문번호</span>
                <span>회원명</span>
                <span>주문일</span>
                <span>강의명</span>
                <span>수강상태</span>
                <span>주문번호</span>
            </li>
            <c:forEach var="item" items="${list}">
                <li class="user_data">
                    <span>${item.orderNo}</span>
                    <span>${item.userName}</span>
                    <span>${item.orderDate}</span>
                    <span>${item.lectureName}</span>
                    <span style="display: none"><input type="hidden" name="orderNo_${item.orderNo}" value="${item.orderNo}"></span>
                    <span><input type="checkbox" name="authority_${item.orderNo}"
                                 value="true" ${item.authority ? 'checked' : ''}/></span>
                    <span>${item.orderNum}</span>
                </li>
            </c:forEach>
        </ul>
        <div id="page">
            <c:if test="${page.prev}">
                <a href="/order_list/1}"><i class="fa-solid fa-angles-left"></i></a>
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

    </form>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>
