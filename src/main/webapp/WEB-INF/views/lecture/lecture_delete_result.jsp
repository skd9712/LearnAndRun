<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script>
    if (parseInt(${result}) > 0) {
        alert("강의 삭제가 완료되었습니다.");
        location.href = "/lecture_list";
    } else {
        alert("강의 삭제를 실패했습니다.");
        location.href = "/lecture_detail/${lectureNo}";
    }
</script>
</body>
</html>
