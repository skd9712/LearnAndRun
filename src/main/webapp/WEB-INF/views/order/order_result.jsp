<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../main/top.jsp"/>
<ul>
    <li>강의 번호: ${lid}</li>
    <li>유저 번호: ${uid}</li>
    <li>주문 번호: ${oid}</li>
</ul>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>
