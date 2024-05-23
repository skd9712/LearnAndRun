<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/resources/css/index/scroll_up.css">
    <script defer src="/resources/js/index/scroll_up.js"></script>
    <style>

        @font-face {
            font-family: 'SeoulNamsanM';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/SeoulNamsanM.woff') format('woff');
            font-size: 1.2rem;
            font-weight: normal;
            font-style: normal;
        }
        @font-face {
            font-family: 'Noto Sans KR';
            font-style: normal;
            font-weight: 100 900;
            font-display: swap;
            src: url(https://fonts.gstatic.com/s/notosanskr/v36/PbykFmXiEBPT4ITbgNA5Cgm20xz64px_1hVWr0wuPNGmlQNMEfD4.2.woff2) format('woff2');
        }
        * {
            font-family: 'SeoulNamsanM';
        }

    </style>
</head>
<body>
    <jsp:include page="top.jsp"/>

    <section>
        <div id="wrap_main">

            <jsp:include page="main_section.jsp"/>

            <div class="section_box">
                <jsp:include page="promote_section.jsp"/>
            </div>

            <div id="subject_page1" class="section_box">
                <jsp:include page="subject_lecture.jsp"/>
            </div>

            <div class="section_box">
                <jsp:include page="${lec}"/>
            </div>

            <div class="section_box">
                <jsp:include page="${calendar}"/>
            </div>

        </div>
    </section>

    <jsp:include page="footer.jsp" flush="true"/>

</body>
</html>
