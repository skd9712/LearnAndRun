<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/index/main_section.css">
    <script defer src="/resources/js/index/main_section.js"></script>
</head>
<body>

<div id="main_page1">
    <div class="night">
        <div class="surface"></div>
        <div class="car"><img src="/resources/img/index/runnig_rabbit_slow.gif" alt="달리는 토끼"></div>
        <div class="main_txt">
            <h2 class="sub_title" id="sub_title">
                <span>학</span>
                <span>습</span>
                <span>의</span>
                <span>  </span>
                <span>해</span>
                <span>법</span>
                <span>  </span>
                <span>런</span>
                <span>앤</span>
                <span>런</span>
                <span>!</span>
            </h2>
            <h1>어떤 강의를 찾고 있나요?</h1>
            <form id="search_form" method="get" action="/lecture_list/1">
                <img class="search" src="/resources/img/index/search_icon.gif" alt="검색 아이콘">
                <%--            <select name="search">--%>
                <%--                <option value="과목명">과목명</option>--%>
                <%--                <option value="강사명">강사명</option>--%>
                <%--                <option value="강의제목">강의제목</option>--%>
                <%--            </select>--%>
                <input type="hidden"name="search" id="search" value="all">
                <input type="text" name="search_txt" id="search_txt">
            </form>
        </div>
    </div>
</div>

</body>
</html>
