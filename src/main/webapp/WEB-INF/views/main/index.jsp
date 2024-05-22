<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <meta charset="utf-8">
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

        .section_box {
            /* 기본적인 스타일 */
            opacity: 0; /* 초기에는 투명하게 설정 */
            transform: translateY(50px); /* 아래에서 위로 50px 만큼 이동 */

            /* 트랜지션 */
            transition: opacity 0.5s ease, transform 0.5s ease; /* 변경 사항에 대한 애니메이션 지정 */
        }

        .section_box.show {
            opacity: 1; /* 보이게 만듦 */
            transform: translateY(0); /* 이동하지 않음 */
        }

    </style>
</head>
<body>
    <jsp:include page="top.jsp"/>

    <section>
        <c:set var="contentpage" value="${contentpage}"/>
        <c:choose>
            <c:when test="${empty contentpage || contentpage==''}">
                <div id="wrap_main">
                    <jsp:include page="main_section.jsp"/>

                    <div class="section_box">
                        <jsp:include page="promote_section.jsp"/>
                    </div>

                    <div id="subject_page1" class="section_box">
                        <jsp:include page="subject_lecture.jsp"/>
                    </div>

                    <div class="section_box">
                        <jsp:include page="display_lecture.jsp"/>
                    </div>

                    <div class="section_box">
                        <jsp:include page="google_calendar.jsp"/>
                    </div>

                </div>

            </c:when>

            <c:when test="${contentpage=='login'}">
                <jsp:include page="../user_login.jsp"/>
            </c:when>

            <c:when test="${contentpage=='lecture_list'}">
                <jsp:include page="../lecture/lecture_list.jsp"/>
            </c:when>


<%--            <c:when test="admin.do">--%>
<%--                <jsp:include page="user/admin.jsp"/>--%>
<%--            </c:when>--%>
<%--            <c:otherwise>--%>
<%--                <jsp:include page="${contentpage}"/>--%>
<%--            </c:otherwise>--%>
        </c:choose>
    </section>



    <jsp:include page="footer.jsp" flush="true"/>


    <script>
        window.addEventListener('scroll', function() {
            // 각 section_box 요소들에 대해 반복
            let sectionBoxes = document.querySelectorAll('.section_box');
            sectionBoxes.forEach(function(sectionBox) {
                // section_box 요소의 상단 위치 계산
                let sectionBoxTop = sectionBox.getBoundingClientRect().top;
                // 윈도우의 높이
                let windowHeight = window.innerHeight;
                // 특정 위치까지 스크롤됐을 때 클래스 추가
                if (sectionBoxTop < windowHeight * 0.75) {
                    sectionBox.classList.add('show');
                }
            });
        });
    </script>
</body>
</html>
