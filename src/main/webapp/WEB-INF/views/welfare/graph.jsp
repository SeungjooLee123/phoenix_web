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
<h2 id="chart_title" style="text-align: center; margin-left: 130px; margin-bottom: 20px;">출생아 수 및 합계 출산율</h2>
<div style=" width: 1050px; display: inline-block;">
<div id="grow_select" style="display: none; width: 90px; float: right; margin-right: 80px;">
	<select id="body" onchange="selectchg()" style="width: 90px; height: 36px; padding: 5px;">
		<option value="weight" selected="selected">체중</option>
		<option value="height">신장</option>
		<option value="head">머리둘레</option>
	</select>
</div>
</div>
<div id="chart_div" style="width: 1050px; height: 500px;"></div>
<div id="source" style="text-align: end; font-size: 13px; color: #818181; margin-top: 20px;">e-나라지표 보건복지부 합계출산율</div>
</div>
</div>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
$(".graph ul>li:not(:first-of-type)").css("display", "block");
  
google.charts.load('current', {'packages':['corechart']});

// 출처  https://www.index.go.kr/potal/main/EachDtlPageDetail.do?idx_cd=1428
  function birthVisualization() {
	$("#chart_title").text('출생아 수 및 합계 출산율');
	$("#source").text('출처: e-나라지표 보건복지부 합계출산율');
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
      //title : '출생아 수 및 합계 출산율',
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
	  $("#chart_title").text('한국 소아발육 표준치(체중)');
	  $("#source").text('출처: 강북구보건소 아이돌보기 한국소아발육 표준치');
	    // Some raw data (not necessarily accurate)
	    var data = google.visualization.arrayToDataTable([
	      ['나이', '남아', '여아'],
	      ['0',  3.40,  3.30],
	      ['1',  4.56,  4.36],
	      ['2',  5.82,  5.49],
	      ['3',  6.81,  6.32],
	      ['4',  7.56,  7.09],
	      ['5',  7.93,  7.51],
	      ['6',  8.52,  7.95],
	      ['7',  8.74,  8.25],
	      ['8',  9.03,  8.48],
	      ['9',  9.42,  8.85],
	      ['10',  9.68,  9.24],
	      ['11',  9.77,  9.28],
	      ['12',  10.42,  10.01],
	      ['15',  11.00,  10.52],
	      ['18',  11.72,  11.23],
	      ['21',  12.30,  12.03],
	      ['24',  12.94,  12.51],
	      ['30',  14.08,  13.35],
	      ['36',  15.08,  14.16]
	    ]);
	  //차트의 양옆 y축 설정 series, 라벨 axes ※3개 이상의 데이터값을 넣어줄 경우 겹치기때문에 제거..
	    
	    var options = {
	      //title : '한국 소아발육 표준치(체중)',
	      hAxis: {title: "개월", textStyle: {color: "#000"}},
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
	  $("#chart_title").text('한국 소아발육 표준치(신장)');
	  $("#source").text('출처: 강북구보건소 아이돌보기 한국소아발육 표준치');
	    // Some raw data (not necessarily accurate)
	    var data = google.visualization.arrayToDataTable([
	      ['나이', '남아', '여아'],
	      ['0',  50.8,  50.1],
	      ['1',  55.2,  54.2],
	      ['2',  59.0,  58.0],
	      ['3',  62.5,  61.1],
	      ['4',  65.2,  63.8],
	      ['5',  66.8,  65.7],
	      ['6',  69.0,  67.5],
	      ['7',  70.4,  69.1],
	      ['8',  71.9,  70.5],
	      ['9',  73.5,  72.2],
	      ['10',  74.6,  73.5],
	      ['11',  76.5,  75.6],
	      ['12',  77.8,  76.9],
	      ['15',  80.1,  79.2],
	      ['18',  82.6,  81.8],
	      ['21',  85.1,  84.4],
	      ['24',  87.7,  87.0],
	      ['30',  92.2,  90.9],
	      ['36',  95.7,  94.2]
	    ]);
	  //차트의 양옆 y축 설정 series, 라벨 axes ※3개 이상의 데이터값을 넣어줄 경우 겹치기때문에 제거..
	    
	    var options = {
	      //title : '한국 소아발육 표준치(신장)',
	      hAxis: {title: "개월", textStyle: {color: "#000"}},
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
	  $("#chart_title").text('한국 소아발육 표준치(머리둘레)');
	  $("#source").text('출처: 강북구보건소 아이돌보기 한국소아발육 표준치');
	    // Some raw data (not necessarily accurate)
	    var data = google.visualization.arrayToDataTable([
	      ['나이', '남아', '여아'],
	      ['0',  34.6,  34.1],
	      ['1',  37.3,  36.6],
	      ['2',  39.2,  38.5],
	      ['3',  40.7,  39.9],
	      ['4',  41.9,  41.0],
	      ['5',  42.8,  41.9],
	      ['6',  43.7,  43.2],
	      ['7',  44.1,  43.2],
	      ['8',  44.7,  43.8],
	      ['9',  45.2,  44.4],
	      ['10',  45.7,  44.7],
	      ['11',  46.1,  45.4],
	      ['12',  46.4,  45.6],
	      ['15',  47.1,  46.2],
	      ['18',  47.7,  46.8],
	      ['21',  47.9,  47.2],
	      ['24',  48.4,  47.7],
	      ['30',  49.4,  48.4],
	      ['36',  49.6,  48.7]
	    ]);
	  //차트의 양옆 y축 설정 series, 라벨 axes ※3개 이상의 데이터값을 넣어줄 경우 겹치기때문에 제거..
	    
	    var options = {
	      //title : '한국 소아발육 표준치(머리둘레)',
	      hAxis: {title: "개월", textStyle: {color: "#000"}},
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