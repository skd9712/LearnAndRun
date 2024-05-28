<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <script>
        if(parseInt(${result})>0)
            alert("수정이 완료되었습니다.");
        else
            alert("수정을 실패했습니다.");

        location.href="/lecture_detail/${lectureNo}";
    </script>
</body>
</html>
