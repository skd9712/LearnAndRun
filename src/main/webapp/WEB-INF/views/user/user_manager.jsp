<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-22
  Time: 오전 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="https://kit.fontawesome.com/4e5b2f86bb.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/user/user_manager.css">

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
                colors:['#ffedc9','#f8dddc','#c7d8eb','#d2dce0','#dde7cf'],
                pieSliceTextStyle: {color: '#7392aa'},
            };

            let chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
            chart.draw(data, options);
        }
    </script>
</head>
<body>
<%--관리자 페이지입니다.--%>

<jsp:include page="../main/top.jsp"/>

<div id="chart" style="width: 60vw; margin: 0 auto">
    <h2 style="position: relative; top: 10vh; padding-bottom:20px;border-bottom: 1px solid silver">과목별 수강 인원</h2>
    <div id="piechart_3d" style="margin-top: 10vh;
    width: 600px; height: 400px; position: relative; top: 20px;"></div>
</div>

<div id="user">

    <div id="user_list">
        <div class="admin_func">
        <a href="/user_manager/">
            <h2 id="user_manage_tab">회원 관리</h2>
        </a>
        <a href="/order_list">
            <h2 id="enroll_manage_tab">수강 관리</h2>
        </a>
        </div>
        <%--    검색--%>
        <form method="get" action="/user_manager/${page.currPage}">
            <select name="search" id="search">
                <option value="all">전체검색</option>
                <option value="userId">아이디</option>
                <option value="userName">회원명</option>
                <option value="addr">주소</option>
            </select>
            <div id="input_box">
                <input type="text" name="search_txt" id="search_txt">
                <button type="submit" id="glass">
                    <i class="fa-solid fa-magnifying-glass fa-lg"></i>
                </button>
            </div>
        </form>
        <ul class="detail_list">
            <li>
                <span>회원번호</span>
                <span>아이디</span>
                <span>회원명</span>
                <span>주소</span>
            </li>
            <c:forEach var="item" items="${list}">
                <li class="user_data">
                    <span>${item.userNo}</span>
                    <span><a  href="/user_update/${item.userId}">${item.userId}</a></span>
                    <span>${item.userName}</span>
                    <span>${item.addr}</span>
                </li>
            </c:forEach>
        </ul>
        <div id="page">
            <%--    이전--%>
            <c:if test="${page.prev}">
                <a href="/user_manager/1?search=${search}&search_txt=${search_txt}"><i class="fa-solid fa-angles-left"></i></a>
                <a href="/user_manager/${page.startBlock-1}?search=${search}&search_txt=${search_txt}"><i
                        class="fa-solid fa-angles-left"></i></a>
            </c:if>
            <%--페이지 번호--%>
            <c:forEach var="index" begin="${page.startBlock}" end="${page.endBlock}">
                <c:choose>
                    <c:when test="${index==page.currPage}">
                        <a href="/user_manager/${index}?search=${search}&search_txt=${search_txt}" class="current-page"><c:out value="${index}"/></a>
                    </c:when>
                    <c:otherwise>
                        <a href="/user_manager/${index}?search=${search}&search_txt=${search_txt}"><c:out
                                value="${index}"/></a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <%--다음--%>
            <c:if test="${page.next}">
                <a href="/user_manager/${page.endBlock+1}?search=${search}&search_txt=${search_txt}">
                    <i class="fa-solid fa-angle-right"></i></a>
                <a href="/user_manager/${page.totalPage}?search=${search}&search_txt=${search_txt}">
                    <i class="fa-solid fa-angle-right"></i></a>
            </c:if>
        </div>
    </div>

</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>
