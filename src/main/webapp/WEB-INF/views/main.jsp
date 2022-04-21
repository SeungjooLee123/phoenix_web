<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Noto+Sans+KR:wght@500&family=Poor+Story&display=swap" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>

<style type="text/css">

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
a:link,
a:visited {
  text-decoration: none;
  color: inherit;
}
nav ul {
  list-style: none;
} 

#line-chart-setting{
display: block;
width: 1300px;
height: 1000px;
margin: 0 auto;
}


#bss{
margin-top:5%;}


#container{
text-align: center;}

.app_name{
margin-top: 70px;
margin-bottom: 30px;
color: #333;
font-size: 18px;}

.main_text{
font-size: 42px;
line-height: 1.29;
letter-spacing: -.8px;
font-family: 'Noto Sans KR', sans-serif;
}

.icons {
margin-top: 50px;
display: flex;
justify-content: center;
}

.icons > a {
display: block;
padding: 0 1px 0 9px;
margin-bottom: 70px;}

.show:hover {
transform: scale (0.8);
}

.seconde-img{
margin-top: 190px;
}

#seconde-container{
text-align: center;}

.seconde-main-text{
font-size: 32px;
font-weight: 700;
line-height: 1.38;
color: #000;
letter-spacing: .8px;
font-family: 'Noto Sans KR', sans-serif;
padding-bottom: 200px;
padding-top: 40px;
}

#third-container{
padding-top: 50px;
position: relative;
text-align: center;
background: #3a549f;
}

.bss-control{
color: white;
padding-top: 8%;
font-family: 'Poor Story', cursive;
}

.third-main-text {
color: #fff;
font-weight: 300;

}

.row {
margin-top: 5%;
margin-left: 10%;
margin-right: 10%;
display: flex;
padding-bottom: 10%;
}

.row-left{
margin-top: 7%;
padding-bottom: 13%;
}

.left-one{
display: flex;
margin-left: 19px;}

.left-two{
display: flex;
padding: 80px 0 80px 0;
margin-left: 46px;}
.left-three{
display: flex;}

  

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

.card:hover{
transform: translate(0, -15px);
transition-duration: .4s;
}

#topBtn {
  position: fixed;
  right: 2%;
  bottom: 2%;
  width: 40px;
  height: 40px;
  line-height: 40px;
  display: block;
  background: #000;
  color: #fff;
  font-size: 10px;
  text-align: center;
  border-radius: 5px;
}
    

</style>

<meta charset="UTF-8">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>BSS</title>
</head>
<body>
<section id="bss">
	<div id="container">
		<h4 class="app_name">베시시</h4>
			<h2 class="main_text">아이와 부모를 위한
						<br/>
			모든 육아의 시작, 베시시</h2>
<div class="icons">
	<a href="<c:url value='login'/>"><img src="imgs/icon_naver.png" style="width:30px; height: 30px;"></a>
	<a href="<c:url value='login'/>"><img src="imgs/simple-kakao.png" style="width:30px; height: 30px;"></a>
	<a href="<c:url value='login'/>"><img src="imgs/simple-android.png" style="width:30px; height: 30px;"></a>
</div>
	</div>
<div class="show">
	<img src="imgs/bss_ad_pick.png" style="width:100%; height:770px;">
</div>	
</section>

<section>
<div id="seconde-container">
<div class="seconde-img">
	<img src="imgs/tmdwn_boy.png" style="width:300px; height:300px;">
</div>
<p class="seconde-main-text">
아이와 부모,
<br/>
모두의 행복을 이어주는 베시시
<br/>
양육자의 손이 되어주는
<br>
대표 육아어플
<br>
언제 어디서나 간편하게
<br>
아이와 함께 사용해보세요.
</p>
</div>
</section>

<section>
<div id="third-container">
<h2 class="bss-control">베시시 기능 소개</h2>
<br>
<h4 class="third-main-text">간단한 사용법과 심플한 디자인으로 행복한 육아의 완성</h4>
<div class="row">

	<div class="row-left">
		<div class="left-one">
			<div class="left-text" style="text-align: right; margin-top: 5px;">
				<h3 style="color:#fff; font-weight: 700;">간편한 육아 기록 입력</h3>
				<p style="color:#fff; margin-top: 15px; font-size: 14px;">최소한의 터치로 양육자의 불편함을 <br>최소화</p>
			</div>
				<div><img src="imgs/icon-feature.png" style="width:85px;"></div>		
		</div>
			<div class="left-two">
				<div class="left-text" style="text-align: right; margin-top: 5px;">
				<h3 style="color:#fff; font-weight: 700;">통계와 수치의 분석</h3>
				<p style="color:#fff; margin-top: 15px; font-size: 14px;">성장 기록을 항목별로 분석하여 <br>목적에 맞는 통계 제공</p>
		</div>
				<div><img src="imgs/icon-graph.png" style="width:85px;"></div>	
			</div>
			<div class="left-three">
				<div class="left-text" style="text-align: right; margin-top: 5px;">
				<h3 style="color:#fff; font-weight: 700;">빛나는 순간을 기록하고 공유</h3>
				<p style="color:#fff; margin-top: 15px; font-size: 14px;">하루가 다르게 성장하는 아이의 소중한 <br>시간을 기록 및 공유</p>
			</div>
				<div><img src="imgs/icon-share.png" style="width:85px;"></div>	
			</div>
</div> <!-- row-left -->

<div class="row-middle" style="width:480px;">
			<img src="imgs/bss-phone.png" style="width: 350px;">
</div>

	<div class="row-right" style="margin-top: 7%;">
		<div class="right-one" style="display: flex;">
			
				<div><img src="imgs/icon-test.png" style="width:85px;"></div>		
				<div class="right-text" style="text-align: left; margin-top: 5px;">
				<h3 style="color:#fff; font-weight: 700;">공동육아 시스템</h3>
				<p style="color:#fff; margin-top: 15px; font-size: 14px;">엄마, 아빠, 베이비시터 다양한 양육자가<br> 함께 기록 가능</p>
			</div>
		</div>
		<div class="right-two" style="display: flex; padding:80px 0 80px 0;">
			
				<div><img src="imgs/icon-map.png" style="width:85px;"></div>		
				<div class="right-text" style="text-align: left; margin-top: 5px;">
				<h3 style="color:#fff; font-weight: 700;">근처 육아 관련 시설 정보 제공</h3>
				<p style="color:#fff; margin-top: 15px; font-size: 14px;">병원, 키즈카페 등 양육자를 위한 <br>주변 정보 제공</p>
			</div>
		</div>
		<div class="right-three" style="display: flex;">
				<div><img src="imgs/icon-growth.png" style="width:85px;"></div>		
					<div class="right-text" style="text-align: left; margin-top: 5px;">
				<h3 style="color:#fff; font-weight: 700;">양육자 초대 기능 제공</h3>
				<p style="color:#fff; margin-top: 15px; font-size: 14px;">복잡한 가입절차 해소와 쉬운 <br>가족구성원 초대 방식 제공</p>
			</div>
		</div>
	</div>
</div> <!-- row -->
</div>
</section>

<section>
<div id="fourth-container" style="text-align: center;">
	<div style= "background: #f0f4f7; padding-bottom: 70px;">
	<h3 style="padding-bottom: 100px; padding-top: 10%; font-size: 40px; font-family: 'Jua', sans-serif; letter-spacing: 3px; font-weight: 550px;">베시시 사용자 리뷰</h3>
<div id="review" style="margin-left: 10%; margin-right: 10%; display: flex;">
	<figure class="review-one" style="text-align: left; width: 380px;">
		<p style="line-height: 150%; font-weight: 500; color: #868686;">"좋아요 신생아 때부터 쭉 쓰고 있어요 수유<br>
		시간 체크하기도 너무 간단하고요. 전반적으로<br>
		앱이 기록하기 좋게 되어있어요. 업데이트도 잘<br>
		되고 오류도 없고 무엇보다 실제로 쓰는 기능 <br>
		위주로 돼 있다 보니 편리해요"</p>
		<figcaption  style="display: flex; margin-top: 30px;">
			<img src="imgs/review.png" style="width:60px;">
			<div class="writer-one" style="margin-top:8px; margin-left:14px;">
				<h4 style="color: #000; font-size: 18px;">윤수빈</h4>
				<p style="opacity: 0.5; font-size: 14px;">샤샤 아빠</p>
			</div>
		</figcaption>
	</figure>
	
	<figure class="review-two" style="text-align:left; width:400px; margin-left: 100px;">
		<p style="line-height: 150%; font-weight: 500; color: #868686;">"너무너무 잘 쓰고 있어요. 백일 정도까지<br>
		종이에 수유 일지 쓰다가 늦게 이 어플을<br>
		설치했는데 왜 진작 몰랐나 아쉽네요.<br>
		진짜 거의 모든 게 딱 원하던 그대로에요<br>
		그래프로 볼 수 있는 기능 하루 패턴을 볼 수<br>
		있는 기능 등 너무 마음에 들어요"</p>
		<figcaption style="display: flex; margin-top: 30px;">
			<img src="imgs/review.png" style="width:60px;">
				<div class="writer-two" style="margin-top:8px; margin-left:14px;"> 
					<h4 style="color: #000; font-size: 18px;">이승주</h4>
					<p style="opacity: 0.5; font-size: 14px;">규형 엄마</p>
				</div>
		</figcaption>
	</figure>
	
	<figure class="review-three" style="text-align: left; width: 368px; margin-left: 33px;">
	<p style="line-height: 150%; font-weight: 500; color: #868686;">“말이 필요 없네요. 어떻게 이런 앱을 만들었<br>
			는지. 다른 어플과 비교도 안 되게 꼼꼼해요<br>
			아기가 있다면 꼭 필요한 어플입니다.<br>
			손이 바쁜 초보 맘에게 필수에요! 대만족!!”</p>
			<figcaption style="display: flex; margin-top: 30px;">
				<img src="imgs/review.png" style="width:60px;">
					<div class="writer-three" style="margin-top:8px; margin-left: 14px;">
					<h4 style="color: #000; font-size: 18px;">윤상민</h4>		
					<p style="opacity: 0.5; font-size: 14px;">승주 엄마</p>	
				</div>
			</figcaption>
	</figure>
</div>
</div>
</div>
<div class="chart-section" style="margin-top: 100px; padding-bottom: 170px; ">
	<h2 class="chart-text" style="text-align: left; margin-top:50px; margin-left: 75px; margin-bottom: 50px;">시각화 자료</h2>
		<h3 style="text-align: center; font-size: 17px; margin-bottom: 50px; color:#898989;">베시시 서비스 사용자 현황</h3>
			<div style="width: 1300px; margin: 0 auto; display: flex;">	
				<div style="float: left">
					<canvas id="pie-chart" width="650" height="450"></canvas>
				</div>
				<div style="float:right;">
					<canvas id="bar-chart-horizontal" width="650" height="450"></canvas>
				</div>
			</div>
</div>
<h2 class="color" style="text-align: left; margin-top:50px; margin-left: 75px;">관련 콘텐츠</h2>
	<div class="card-view" style="display:flex; text-align: left; margin-top: 45px; margin-left: 5%; width: 1330px;">
	<!-- first -->
		<div class="card" style="width:408px; height:530px; overflow: hidden; background: #fff; border-radius: 14px; position: relative; box-shadow: 4px 12px 30px 6px rgb(0 0 0 / 9%);" >
			<span class="wrap_cont" style="display: block; position: relative; padding: 25px 24px 0; box-sizing: border=box;">
				<span class="info_cate" style="display: block; height: 36px; margin-top: -1px; padding-right: 20px; font-size: 0;">
					<img src="imgs/main_icon.png" style="width:36px; height: 36px; display: inline-block; margin-right: 8px; vertical-align: top;">
						<span style="display: inline-block; position: relative; height: 34px; margin-top: 1px; padding: 0 13px; border-radius: 13px; font-size:13px; line-height: 34px; color: #000; background-color: #eee; vertical-align: top;">
						이벤트
						</span>
				</span>
				<a href="" style="display: block; margin: 0 -24px;">
				<div>
					<h2 class="card-text" style="height: 80px; font-size: 27px; line-height: 40px; padding-left: 20px; margin-top: 20px; margin-bottom: 20px; padding-right: 20px;">
					베시시, 5월 가정의 달 맞이 &nbsp 이벤트 게시!
					</h2>
				</div>
				
						<span class="info_hash" style="font-weight: 300; overflow: hidden; color: #666666; padding-left: 20px; font-size: 14px; left: 0; right: 84px;">
							<span class="keyword" style="display: inline-block; margin-right: 3px; vertical-align: top;">#베시시</span>
							<span class="keyword" style="display: inline-block; margin-right: 3px; vertical-align: top;">#육아어플</span>
							<span class="keyword" style="display: inline-block; margin-right: 3px; vertical-align: top;">#초보육아</span>
							<span class="keyword" style="display: inline-block; margin-right: 3px; vertical-align: top;">#이벤트</span>
						</span>
				<div style="margin-top:25px;">
						<span class="wrap_imgs" style="height: 306px; margin-top: 71px;">
							<img src="imgs/size_test.jpg" style="display: block; width:100%; min-height: 100%;">
						</span>
				</div>
				</a>
			</span><!-- wrap -->
		</div>
		<!-- second -->
		<div class="card" style="width:408px; height:530px; overflow: hidden; background: #fff; border-radius: 14px; position: relative; box-shadow: 4px 12px 30px 6px rgb(0 0 0 / 9%); margin-left: 40px; margin-right: 40px;" >
			<span class="wrap_cont" style="display: block; position: relative; padding: 25px 24px 0; box-sizing: border=box;">
				<span class="info_cate" style="display: block; height: 36px; margin-top: -1px; padding-right: 20px; font-size: 0;">
					<img src="imgs/main_icon2.png" style="width:36px; height: 36px; display: inline-block; margin-right: 8px; vertical-align: top;">
						<span style="display: inline-block; position: relative; height: 34px; margin-top: 1px; padding: 0 13px; border-radius: 13px; font-size:13px; line-height: 34px; color: #000; background-color: #eee; vertical-align: top;">
						육아정보
						</span>
				</span>
				<a href="" style="display: block; margin: 0 -24px;">
				<div>
					<h2 class="card-text" style="height: 80px; font-size: 27px; line-height: 40px; padding-left: 20px; margin-top: 20px; margin-bottom: 20px; padding-right: 20px;">
					베시시, 베시시어플 양육자와 아이 행복 추구
					</h2>
				</div>
				
						<span class="info_hash" style="font-weight: 300; overflow: hidden; color: #666666; padding-left: 20px; font-size: 14px; left: 0; right: 84px;">
							<span class="keyword" style="display: inline-block; margin-right: 3px; vertical-align: top;">#베시시</span>
							<span class="keyword" style="display: inline-block; margin-right: 3px; vertical-align: top;">#육아어플</span>
							<span class="keyword" style="display: inline-block; margin-right: 3px; vertical-align: top;">#초보육아</span>
							<span class="keyword" style="display: inline-block; margin-right: 3px; vertical-align: top;">#공지사항</span>
						</span>
				<div style="margin-top:25px;">
						<span class="wrap_imgs" style="height: 306px; margin-top: 71px;">
							<img src="imgs/size_test.jpg" style="display: block; width:100%; min-height: 100%;">
						</span>
				</div>
				</a>
			</span><!-- wrap -->
		</div>
		<!-- third -->
		<div class="card" style="width:408px; height:530px; overflow: hidden; background: #fff; border-radius: 14px; position: relative; box-shadow: 4px 12px 30px 6px rgb(0 0 0 / 9%);" >
			<span class="wrap_cont" style="display: block; position: relative; padding: 25px 24px 0; box-sizing: border=box;">
				<span class="info_cate" style="display: block; height: 36px; margin-top: -1px; padding-right: 20px; font-size: 0;">
					<img src="imgs/main_icon3.png" style="width:36px; height: 36px; display: inline-block; margin-right: 8px; vertical-align: top;">
						<span style="display: inline-block; position: relative; height: 34px; margin-top: 1px; padding: 0 13px; border-radius: 13px; font-size:13px; line-height: 34px; color: #000; background-color: #eee; vertical-align: top;">
						커뮤니티
						</span>
				</span>
				<a href="" style="display: block; margin: 0 -24px;">
				<div>
					<h2 class="card-text" style="height: 80px; font-size: 27px; line-height: 40px; padding-left: 20px; margin-top: 20px; margin-bottom: 20px; padding-right: 20px;">
					베시시, 베시시어플 양육자와 아이 행복 추구
					</h2>
				</div>
				
						<span class="info_hash" style="font-weight: 300; overflow: hidden; color: #666666; padding-left: 20px; font-size: 14px; left: 0; right: 84px;">
							<span class="keyword" style="display: inline-block; margin-right: 3px; vertical-align: top;">#베시시</span>
							<span class="keyword" style="display: inline-block; margin-right: 3px; vertical-align: top;">#육아어플</span>
							<span class="keyword" style="display: inline-block; margin-right: 3px; vertical-align: top;">#초보육아</span>
							<span class="keyword" style="display: inline-block; margin-right: 3px; vertical-align: top;">#공지사항</span>
						</span>
				<div style="margin-top:25px;">
						<span class="wrap_imgs" style="height: 306px; margin-top: 71px;">
							<img src="imgs/size_test.jpg" style="display: block; width:100%; min-height: 100%;">
						</span>
				</div>
				</a>
			</span><!-- wrap -->
		</div>
	</div><!-- card-view -->
<div>
	<span id="topBtn">top</span>
</div>	

</section>
<script type="text/javascript">
var topEle =$('#topBtn');
var delay =1000;
topEle.on('click', function(){
	$('html, body').stop().animate({scrollTop:0}, delay);
});

new Chart(document.getElementById("pie-chart"), {
    type: 'pie',
    data: {
      labels: ["웹 사용자", "앱 사용자", "앱 미사용자"],
      datasets: [{
        label: "Population (millions)",
        backgroundColor: ["#ffc81b", "#5b6777","#f15628"],
        data: [2478,5267,234]
      }]
    },
    options: {
      title: {
        display: true,
        text: ''
      }
    }
});

new Chart(document.getElementById("bar-chart-horizontal"), {
    type: 'horizontalBar',
    data: {
      labels: ["앱 사용자", "웹 사용자", "앱 미사용자"],
      datasets: [
        {
          label: "Population (millions)",
          backgroundColor: ["#5b6777", "#ffc81b","#f15628"],
          data: [5267,2478,234]
        }
      ]
    },
    options: {
      legend: { display: false },
      title: {
        display: true,
        text: ''
      }
    }
});
</script>
</body>
</html>