<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/lecture/lecture_class.css">
</head>
<body>
<jsp:include page="../main/top.jsp"/>
<div id="wrap">
    <div id="top">
        <h2>${lectureName}</h2>
        <p>${dto.detailName}</p>
    </div>
    <div class="line"></div>
    <div id="lecture">
        <iframe src="https://www.youtube.com/embed/${dto.detailUrl}"
                title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write;
            encrypted-media; gyroscope; picture-in-picture; web-share"
                referrerpolicy="strict-origin-when-cross-origin" allowfullscreen>
        </iframe>
    </div>
</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>
