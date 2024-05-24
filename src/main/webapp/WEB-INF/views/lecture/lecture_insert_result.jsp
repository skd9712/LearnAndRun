<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <script>
        if (parseInt(${result}) > 0) {
            alert("강의 등록이 완료되었습니다.");
            location.href = "/lecture_list";
        } else {
            alert("강의 등록을 실패했습니다.");
            location.href = "/lecture_list";
        }
    </script>
</body>
</html>
