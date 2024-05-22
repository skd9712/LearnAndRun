<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--한글 깨짐 방지 코드-->
<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<html lang='en'>
<head>
  <meta charset='utf-8' />
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="/resources/css/index/fullcalendar.main.min.css"/>
  <link rel="stylesheet" href="/resources/css/index/display_lecture2.css"/>
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
            //팝업뜨는 속도
            speed: 200,

            //슬라이드 효과
            //transition: 'slideIn',
            //transitionClose: 'slideBack',

            //팝업 뜨는 위치
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

    #schedule_container{
      display: flex;
      flex-direction: row;
      margin: 0 auto;
      width: 80%;
      justify-content: space-evenly;
    }

    #schedule_lecture_container{
      flex-basis: 20vw;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      margin-bottom: 135px;
    }

    #open_lecture_box{
      height: 480px;
      background: rgba(255,255,255,0.4);
      border-radius: 20px;
      padding: 0 10px 30px 10px;
      overflow: hidden;
      white-space: nowrap;
    }

    #schedule_box{
      flex-basis: 50vw;
      text-align: center;
      padding-bottom: 100px;
    }
    #schedule_box>h1{
      position: relative;
      top: 30px;
      margin: 0;
      z-index: 2;
    }
    #schedule_box img{
      width: 30px;
      position: relative;
      top: 5px;
      padding: 0 5px;
    }

    #calendar{
      width: 100%;
      margin: 0 auto;
      padding: 100px 30px 30px 30px;
      background: white;
      border-radius: 20px;
      position: relative;
      top: -35px;
    }

    #popup{
      width:500px;
      height:300px;
      display:none;
      background-color:white;
      padding:20px;
      border-radius:30px;
      border:2px solid #eeeeee;
    }

  </style>
</head>
<body>
<%--데이터 :..... ${bo_list}--%>
<%--최신강의 리스트: ${nl_list}--%>
<div id="schedule_container">
  <div id="schedule_lecture_container">

    <!--개강 임박 강의 스크롤 영역-->
    <section id="open_lecture_box">
      <h1>
        <img src="/resources/img/index/open_lecture_icon.png" alt="임박아이콘">
        개강 임박 강의
      </h1>
      <div class="scrollBar">
        <ul>
          <c:forEach var="item" items="${bo_list}">
            <li>
              <img src="/resources/img/index/flower_icon.png" alt="꽃리스트">
              ${item.startDate}
                <a href="#">
                    ${item.lectureName}
                </a>
            </li>
          </c:forEach>

        </ul>
      </div>
    </section>


    <!--최신 강의 슬라이더 영역-->
    <section class="display_lecture2">
      <h1><img id="title_icon3" src="/resources/img/index/clock_icon.png" alt="최신">최신 강의</h1>
      <div class="display_box2, slider2">

        <c:forEach var="item" items="${nl_list}">
          <div class="slide2">

            <a href="#1">
              <div class="lecture_box2">
                <img src="/getImage/${item.thumbnail}" alt="강의썸네일">
                <h3>${item.lectureName}</h3>
                <p>${item.description}</p>
              </div>
            </a>
          </div>
        </c:forEach>

      </div>
    </section>
  </div>


  <!--캘린더 영역-->
  <div id="schedule_box">
    <h1>
      <img src="/resources/img/index/carrot.png" alt="당근">
      강의 일정
      <img src="/resources/img/index/carrot.png" alt="당근"></h1>
    <div id='calendar'></div>
    <div id='popup'></div>
  </div>

</div>

</body>
</html>