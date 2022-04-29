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
.graph ul>li:nth-child(1) a{color: #000; font-weight: 700; border-bottom: 1px solid #000;}
</style>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.20/c3.css">
</head>
<body>
<div style="display: flex; width: 1300px; margin: 0 auto;">
<div><jsp:include page="/WEB-INF/views/welfare/welfare.jsp"/></div>
<div style="width: 900px; margin-top: 50px; margin-left: 20px;">
<script type="text/javascript">
	$("#cate-ul li>a").not("a.btn-empty").attr("class", "btn-empty");
	$("#cate-ul li>a").eq(2).attr("class", "btn-fill");
</script>

<div id="grow_select" style="display: none;">
	<select id="body" onchange="selectchg()">
		<option value="weight" selected="selected">체중</option>
		<option value="height">신장</option>
		<option value="head">머리둘레</option>
	</select>
</div>

<div id="chart_div" style="width: 1050px; height: 500px;"></div>
</div>
</div>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
$(".graph ul>li:not(:first-of-type)").css("display", "block");
  
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
      hAxis: {title: "년도"},
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
  
  /* http://mhealth.gangbuk.go.kr/pms/contents/contents.do?contseqn=434&decorator=pmsweb&menucdv=05140200 */
  function grow_weightVisualization() {
	    // Some raw data (not necessarily accurate)
	    var data = google.visualization.arrayToDataTable([
	      ['나이', '남아', '여아'],
	      ['출생시',  3.40,  3.30],
	      ['1개월',  4.56,  4.36],
	      ['2개월',  5.82,  5.49],
	      ['3개월',  6.81,  6.32],
	      ['4개월',  7.56,  7.09],
	      ['5개월',  7.93,  7.51],
	      ['6개월',  8.52,  7.95],
	      ['7개월',  8.74,  8.25],
	      ['8개월',  9.03,  8.48],
	      ['9개월',  9.42,  8.85],
	      ['10개월',  9.68,  9.24],
	      ['11개월',  9.77,  9.28],
	      ['12개월',  10.42,  10.01],
	      ['15개월',  11.00,  10.52],
	      ['18개월',  11.72,  11.23],
	      ['21개월',  12.30,  12.03],
	      ['24개월',  12.94,  12.51],
	      ['30개월',  14.08,  13.35],
	      ['36개월',  15.08,  14.16]
	    ]);
	  //차트의 양옆 y축 설정 series, 라벨 axes ※3개 이상의 데이터값을 넣어줄 경우 겹치기때문에 제거..
	    
	    var options = {
	      title : '한국 소아발육 표준치(체중)',
	      hAxis: {title: "개월", textStyle: {color: "#000",fontSize: 10}},
	      vAxis: {title: "kg"},
	      pointSize: 5,
	      seriesType: 'lines'
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
  
  function grow_heightVisualization() {
	    // Some raw data (not necessarily accurate)
	    var data = google.visualization.arrayToDataTable([
	      ['나이', '남아', '여아'],
	      ['출생시',  50.8,  50.1],
	      ['1개월',  55.2,  54.2],
	      ['2개월',  59.0,  58.0],
	      ['3개월',  62.5,  61.1],
	      ['4개월',  65.2,  63.8],
	      ['5개월',  66.8,  65.7],
	      ['6개월',  69.0,  67.5],
	      ['7개월',  70.4,  69.1],
	      ['8개월',  71.9,  70.5],
	      ['9개월',  73.5,  72.2],
	      ['10개월',  74.6,  73.5],
	      ['11개월',  76.5,  75.6],
	      ['12개월',  77.8,  76.9],
	      ['15개월',  80.1,  79.2],
	      ['18개월',  82.6,  81.8],
	      ['21개월',  85.1,  84.4],
	      ['24개월',  87.7,  87.0],
	      ['30개월',  92.2,  90.9],
	      ['36개월',  95.7,  94.2]
	    ]);
	  //차트의 양옆 y축 설정 series, 라벨 axes ※3개 이상의 데이터값을 넣어줄 경우 겹치기때문에 제거..
	    
	    var options = {
	      title : '한국 소아발육 표준치(신장)',
	      hAxis: {title: "개월", textStyle: {color: "#000",fontSize: 10}},
	      vAxis: {title: "cm"},
	      pointSize: 5,
	      seriesType: 'lines'
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
  
  function grow_headVisualization() {
	    // Some raw data (not necessarily accurate)
	    var data = google.visualization.arrayToDataTable([
	      ['나이', '남아', '여아'],
	      ['출생시',  34.6,  34.1],
	      ['1개월',  37.3,  36.6],
	      ['2개월',  39.2,  38.5],
	      ['3개월',  40.7,  39.9],
	      ['4개월',  41.9,  41.0],
	      ['5개월',  42.8,  41.9],
	      ['6개월',  43.7,  43.2],
	      ['7개월',  44.1,  43.2],
	      ['8개월',  44.7,  43.8],
	      ['9개월',  45.2,  44.4],
	      ['10개월',  45.7,  44.7],
	      ['11개월',  46.1,  45.4],
	      ['12개월',  46.4,  45.6],
	      ['15개월',  47.1,  46.2],
	      ['18개월',  47.7,  46.8],
	      ['21개월',  47.9,  47.2],
	      ['24개월',  48.4,  47.7],
	      ['30개월',  49.4,  48.4],
	      ['36개월',  49.6,  48.7]
	    ]);
	  //차트의 양옆 y축 설정 series, 라벨 axes ※3개 이상의 데이터값을 넣어줄 경우 겹치기때문에 제거..
	    
	    var options = {
	      title : '한국 소아발육 표준치(머리둘레)',
	      hAxis: {title: "개월", textStyle: {color: "#000",fontSize: 10}},
	      vAxis: {title: "cm"},
	      pointSize: 5,
	      seriesType: 'lines'
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
		$('.graph ul>li:eq(1)').trigger('click');
	})
  $(document).on('click', '.graph ul>li', function () {
		var idx = $(this).index();
		
		if( idx==1 ) {
			$('#grow_select').css('display', 'none');
			google.charts.setOnLoadCallback(birthVisualization);
		}
		else if( idx==2 ) {
			$('#grow_select').css('display', 'block');
			selectchg();
		}
	});
  
  function selectchg() {
	 var body = $('#body').val();
	 
	 if(body == 'weight') google.charts.setOnLoadCallback(grow_weightVisualization);
	 else if(body == 'height') google.charts.setOnLoadCallback(grow_heightVisualization);
	 else google.charts.setOnLoadCallback(grow_headVisualization);
	 
  }
</script>


</body>
</html>