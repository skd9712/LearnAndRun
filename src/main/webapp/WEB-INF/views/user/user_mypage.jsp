<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-05-21
  Time: 오후 2:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/user/user_mypage.css">
</head>
<body>
<jsp:include page="../main/top.jsp"/>
<div id="mypage">
    <section class="myinfo">
        <h2>${user.userId}님의 마이 페이지</h2>
        <div class="link">
            <a href="/user_update"><img class="mypage_icon" src="/resources/img/index/edit_icon.png" alt="수정">내정보 수정</a>
        </div>
    </section>
    <ul class="lecture_list">
        <li class="mylecture">
            <h3><img class="mypage_icon" src="/resources/img/index/carrot.png" alt="당근">수강중인 강의<img class="mypage_icon" src="/resources/img/index/carrot.png" alt="당근"></h3>
            <div class="scrollBar">
                <div class="lecture_detail">
                    <c:forEach var="item" items="${lecturelist}">
                        <div class="lect">
                            <a href="/lecture_detail/${item.lectureNo}">
                                <img src="/getImage/${item.thumbnail}" alt="썸네일" class="thumbnail">
                            </a>
                            <p>${item.lectureName}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>

        </li>
        <li class="wishlist">
            <h3><img class="mypage_icon" src="/resources/img/index/star_icon.png" alt="별">찜한 강의<img class="mypage_icon" src="/resources/img/index/star_icon.png" alt="별"></h3>
            <div class="scrollBar">
                <div class="lecture_wish">
                    <c:forEach var="wish" items="${wishlist}">
                        <div class="lect">
                            <a href="/lecture_detail/${wish.lectureNo}">
                                <img src="/getImage/${wish.thumbnail}" alt="썸네일" class="thumbnail">
                            </a>
                            <p>${wish.lectureName}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </li>
    </ul>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>
