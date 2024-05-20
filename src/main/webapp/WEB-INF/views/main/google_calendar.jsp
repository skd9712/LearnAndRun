<!--한글 깨짐 방지 코드-->
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<html lang='en'>
<head>
  <meta charset='utf-8' />
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <link href='/resources/css/index/fullcalendar.main.min.css' rel='stylesheet' />
  <script defer src='/resources/js/index/ko.js'></script>
  <script src='/resources/js/index/fullcalendar.main.min.js'></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.min.js"></script>
  <script>
    //페이지 리소스를 모두 로드하고난 다음에 dom content가 이미 로드된 상태에서 그 이후 시점에 내용을 실행
    document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
      var calendar = new FullCalendar.Calendar(calendarEl, {
        locale: "ko",
        initialView: 'dayGridMonth',
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
        },
        //ApiKey 변경 - 구글 캘린더 API 발급
        googleCalendarApiKey: 'AIzaSyASj_LG30qSzOcasZfF7pSP1OPgvINLKuY',
        events: {
          //구글 캘린더 ID 변경 - 구글 캘린더 ID 발급
          googleCalendarId: 'ab95eba7c984d2d82d392f10e41a8c1f9e94679727ddbca279bc9a492f56d423@group.calendar.google.com',
          className: 'gcal-event' // an option!
        },
        eventClick: function(info) {
          let start_year = info.event.start.getUTCFullYear();
          let start_month = info.event.start.getMonth() + 1;
          let start_date = info.event.start.getUTCDate();
          let start_hour = info.event.start.getHours();
          let start_minute = info.event.start.getMinutes();
          let start_second = info.event.start.getSeconds();
          let end_hour = info.event.end.getHours();

          let start = start_year + "년 " + start_month + "월 " + start_date + "일 " + start_hour + "시 - " + end_hour + "시";

          let attends = "";
          info.event.extendedProps.attachments.forEach(function(item) {
            attends += "<div><a href='"+item.fileUrl+"' target='_blank'>[첨부파일]</a></div>"
          });

          if(!info.event.extendedProps.description) {
            info.event.extendedProps.description = "";
          }

          let contents = "<div style='font-weight:bold; font-size:20px; margin-bottom:30px; text-align:center''>"
                        +start+"</div>" +
                  "<div style='font-size:18px; margin-bottom:20px'>"+
                  "강좌명:"+info.event.title+"</div>"+
                  "<div style='width:250px'>"+
                  info.event.extendedProps.description+attends +"</div>";

          $("#popup").html(contents);
          $("#popup").bPopup({
            speed: 650,
            transition: 'slideIn',
            transitionClose: 'slideBack',
            position: [($(document).width()-500)/2, 250] //x, y
          });

          // 클릭 시 원래 구글 캘린더로 이동하는데, 그러한 액션을 막기 위한 코드
          info.jsEvent.stopPropagation();
          info.jsEvent.preventDefault();
        }
      });
      calendar.render();
    });
  </script>
  <style>
    #schedule_box{
      text-align: center;
      padding-bottom: 100px;
    }
    #schedule_box>h1{
      position: relative;
      top: 60px;
      margin: 0;
    }
    #schedule_box img{
      width: 30px;
      position: relative;
      top: 5px;
      padding: 0 5px;
    }
  </style>
</head>
<body>
<div id="schedule_box">
  <h1>
    <img src="/resources/img/index/carrot.png" alt="당근">
    강의 일정
    <img src="/resources/img/index/carrot.png" alt="당근"></h1>
  <div id='calendar'></div>
  <div id='popup' style="width:500px; height:300px; display:none; background-color:white; padding:20px; border-radius:14px; border:2px solid #eeeeee"></div>
</div>
</body>
</html>