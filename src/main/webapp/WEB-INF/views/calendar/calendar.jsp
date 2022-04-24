<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<style>

body{
font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
font-size: 14px;
}

.fc-header-toolbar {
padding-top: 1em;
padding-left: 1em;
padding-right: 1em;
}

#calendar-container{
width:1300px;
}

.fc-h-event .fc-event-title-container {
background: #ffbfbf;
}

.fc-h-event .fc-event-title {
font-weight: 600;
color: #000;
}

.fc-h-event {
border: 1px solid #8d8ac2;
}

    @keyframes fadeInDown {
        0% {
            opacity: 0;
            transform: translate3d(0, -100%, 0);
        }
        to {
            opacity: 1;
            transform: translateZ(0);
        }
    }
 
    .show {
        position: relative;
        animation: fadeInDown 1s;
    }

</style>
</head>
<body style="padding:30px;">
<section id="notice" style="width:1300px; margin: 0 auto;">
  <img src="imgs/bss_event_img.jpg" style="width:1300px; height: 400px; margin-bottom: 50px;">
<div id='calendar-container'>
<div id='calendar'></div>
</div>
</section>



<script>
(function(){
$(function(){
// calendar element 취득
var calendarEl = $('#calendar')[0];
// full-calendar 생성하기
var calendar = new FullCalendar.Calendar(calendarEl, {
height: '700px', // calendar 높이 설정
expandRows: true, // 화면에 맞게 높이 재설정

// 해더에 표시할 툴바
headerToolbar: {
left: 'prev,next today',
center: 'title',
end: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
},
initialView: 'dayGridMonth', 
// 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
navLinks: false, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
editable: false, // 수정 가능?
selectable: false, // 달력 일자 드래그 설정가능
nowIndicator: false, // 현재 시간 마크
dayMaxEvents: false, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
locale: 'ko', // 한국어 설정

// 이벤트
events: [
{
title:'아이와 함께 나무 심기',
url: '',
start: '2022-04-05',
end: '2022-04-05'
},
{
title:'활짝 핀 봄! 벚꽃',
url:'http://m.mdilbo.com/detail/c3QycN/643833',
start:'2022-04-09',
end:'2022-04-10'
},
{
title:'베시시 테스트 이벤트',
url:'/bss',
start:'2022-04-13',
end:'2022-04-13'
	},
{
title: '커뮤니티 이벤트',
url: 'community', // 클릭시 해당 url로 이동
start: '2022-04-20',
end: '2022-04-22'
},
{
title:'어린이날맞이 문화행사 이벤트',
url: 'https://dmgj.kr/event.es?mid=a10301000000&seq=712&act=view',
start: '2022-05-05',
end: '2022-05-08'
},
{
title:'가정의 달 맞이 나눔왕 이벤트',
url:'', //나눔 페이지로 던질 예정
start:'2022-05-10',
end:'2022-05-17'
},
{
title:'어버이 날',
url:'',
start:'2022-05-08',
end:'2022-05-08'
},
{
title:'베시시 커뮤니티 이벤트',
url:'community',
start:'2022-05-25',
end:'2022-05-27'
}
]
});
// 캘린더 랜더링
calendar.render();
});
})();
</script>
</body>
</html>

