<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#graph-ul{display: flex; position: relative; margin-top: 30px;}
#graph-ul li{display: block; font-size: 14px; background: #f5f5f5; display: block; cursor: pointer; text-align: center; border-radius: 20px; margin: 0 10px; padding: 10px 13px;}
#graph-ul li.active{background: #c3bfff; color: #fff;}
</style>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.20/c3.css">
</head>
<body>

<jsp:include page="/WEB-INF/views/welfare/welfare.jsp"/>
<script type="text/javascript">
	$("#cate-ul li>a").not("a.btn-empty").attr("class", "btn-empty");
	$("#cate-ul li>a").eq(2).attr("class", "btn-fill");
</script>
<ul id='graph-ul'>
	<li>출생</li>
	<li>표준발육</li>
</ul>

<div id="grow_select" style="display: none;">
	<select id="sex" onchange="selectchg()">
		<option value="man" selected="selected">남아</option>
		<option value="woman">여아</option>
	</select>
	<select id="body" onchange="selectchg()">
		<option value="weight" selected="selected">체중</option>
		<option value="height">신장</option>
		<option value="head">머리둘레</option>
	</select>
</div>

<div id="chart_div" style="width: 900px; height: 500px;"></div>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  
google.charts.load('current', {'packages':['corechart']});

// 출처  https://www.index.go.kr/potal/main/EachDtlPageDetail.do?idx_cd=1428
  function birthVisualization() {
    // Some raw data (not necessarily accurate)
    var data = google.visualization.arrayToDataTable([
      ['년도', '출생아 수', '출산율'],
      ['2009',  444.8,  1.149],
      ['2010',  470.2,  1.226],
      ['2011',  471.3,  1.244],
      ['2012',  484.6,  1.297],
      ['2013',  436.5,  1.197],
      ['2014',  435.4,  1.205],
      ['2015',  434.8,  1.239],
      ['2016',  406.2,  1.172],
      ['2017',  357.8,  1.052],
      ['2018',  326.8,  0.977],
      ['2019',  302.7,  0.918],
      ['2020',  272.3,  0.84]
    ]);
  //차트의 양옆 y축 설정 series, 라벨 axes ※3개 이상의 데이터값을 넣어줄 경우 겹치기때문에 제거..
    
    var options = {
      title : '출생아 수 및 합계 출산율',
      hAxis: {title: "Date"},
      seriesType: 'bars',
      series: {1: {type: 'line', targetAxisIndex: 1}},
      vAxes:{0:{title:'출생아수(천명)'},1:{title:'합계출산율'}}
      /* axes: {
          y: {
        	  baby_cnt: {title: appbundle.get('circulation'),}, // Left y-axis.
        	  baby_percent: {title: appbundle.get('circulation'),} // Right y-axis.
          }
        } */
    };

    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  }
  
  ///출처 http://mhealth.gangbuk.go.kr/pms/contents/contents.do?contseqn=434&decorator=pmsweb&menucdv=05140200
  function growVisualization() {
	    // Some raw data (not necessarily accurate)
	    var data = google.visualization.arrayToDataTable([
	      ['년도', '출생아 수', '출산율'],
	      ['2009',  444.8,  1.149],
	      ['2010',  470.2,  1.226],
	      ['2011',  471.3,  1.244],
	      ['2012',  484.6,  1.297],
	      ['2013',  436.5,  1.197]
	    ]);
	  //차트의 양옆 y축 설정 series, 라벨 axes ※3개 이상의 데이터값을 넣어줄 경우 겹치기때문에 제거..
	    
	    var options = {
	      title : '출생아 수 및 합계 출산율',
	      hAxis: {title: "Date"},
	      seriesType: 'bars',
	      series: {1: {type: 'line', targetAxisIndex: 1}},
	      vAxes:{0:{title:'출생아수(천명)'},1:{title:'합계출산율'}}
	      /* axes: {
	          y: {
	        	  baby_cnt: {title: appbundle.get('circulation'),}, // Left y-axis.
	        	  baby_percent: {title: appbundle.get('circulation'),} // Right y-axis.
	          }
	        } */
	    };

	    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
	    chart.draw(data, options);
	  }
  $(function () {
		$('#graph-ul li:eq(0)').trigger('click');
	})
  $(document).on('click', '#graph-ul li', function () {
		$('#graph-ul li').removeClass();
		$(this).addClass('active');
		
		var idx = $(this).index();
		
		if( idx==0 ) {
			$('#grow_select').css('display', 'none');
			google.charts.setOnLoadCallback(birthVisualization);
		}
		else if( idx==1 ) {
			$('#grow_select').css('display', 'block');
			selectchg();
		}
	});
  
  function selectchg() {
	 var sex = $('#sex').val();
	 var body = $('#body').val();
	 
	 if(sex == 'man'){
		 if(body == 'weight') alert('man weight');
		 else if(body == 'height') alert('man height');
		 else alert('man head');
	 }else{
		 if(body == 'weight') alert('woman weight');
		 else if(body == 'height') alert('woman height');
		 else alert('woman head');
	 }
	  
	  }
</script>


</body>
</html>