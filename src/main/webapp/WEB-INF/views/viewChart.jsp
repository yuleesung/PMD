<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#mapchart {
  width: 100%;
  height: 500px;
}
#stackchart{
width: 100%;
	height: 800px;
}
</style>
</head>
<body>

<!-- HTML -->
<h1>지역별 오픈 된 교육갯수</h1>
<div id="mapchart"></div>



<h1>훈련분야 검색</h1>
<section class="search-sec" style="margin-top: 120px;">
		<div class="container">
			<form action="#" method="post" novalidate="novalidate">
					<div class="col-lg-12">
							<div class="col-lg-3 col-md-3 col-sm-12 p-0">
								<select class="form-control search-slt" id="srchKeco1">
									<option value="none">::훈련분야::</option>
									<option value="01">사업관리(01)</option>
									<option value="02">경영·회계·사무(02)</option>
									<option value="03">금융·보험(03)</option>
									<option value="04">교육·자연·사회과학(04)</option>
									<option value="05">법률·경찰·소방·교도·국방(05)</option>
									<option value="06">보건·의료(06)</option>
									<option value="07">사회복지·종교(07)</option>
									<option value="08">문화·예술·디자인·방송(08)</option>
									<option value="09">운전·운송(09)</option>
									<option value="10">영업판매(10)</option>
									<option value="11">경비·청소(11)</option>
									<option value="12">이용·숙박·여행·오락·스포츠(12)</option>
									<option value="13">음식서비스(13)</option>
									<option value="14">건설(14)</option>
									<option value="15">기계(15)</option>
									<option value="16">재료(16)</option>
									<option value="17">화학(17)</option>
									<option value="18">섬유·의복(18)</option>
									<option value="19">전기·전자(19)</option>
									<option value="20">정보통신(20)</option>
									<option value="21">식품가공(21)</option>
									<option value="22">인쇄·목재·가구·공예(22)</option>
									<option value="23">환경·에너지·안전(23)</option>
									<option value="24">농림어업(24)</option>
								</select>
							</div>
							
							<div style="width: 350px; margin: auto;">
								<button type="button" class="btn btn-danger wrn-btn"
									id="search_btn">검 색</button>
							</div>
						</div>
			</form>
		</div>
	</section>

<h1>검색결과</h1>
<div id="stackchart"></div>


<!-- 차트 -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/maps.js"></script>
<script src="https://www.amcharts.com/lib/4/geodata/southKoreaLow.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<!-- jquery -->
<script src="resources/js/jquery-3.4.1.min.js"></script>

<script type="text/javascript">
var loc_seoul = new Array();
var loc_busan = new Array();
var loc_daagu = new Array();
var loc_incheon = new Array();
var loc_gwangju = new Array();
var loc_daejoen = new Array();
var loc_ulsan = new Array();
var loc_saejong = new Array();
var loc_gyounggi = new Array();
var loc_gangwon = new Array();
var loc_choongbook = new Array();
var loc_choongnam = new Array();
var loc_jeonbook = new Array();
var loc_jeonnam = new Array();
var loc_gyoungbook = new Array();
var loc_gyoungnam = new Array();
var loc_jeju = new Array();

var cnt_seoul = new Array();
var cnt_busan = new Array();
var cnt_daagu = new Array();
var cnt_incheon = new Array();
var cnt_gwangju = new Array();
var cnt_daejoen = new Array();
var cnt_ulsan = new Array();
var cnt_saejong = new Array();
var cnt_gyounggi = new Array();
var cnt_gangwon = new Array();
var cnt_choongbook = new Array();
var cnt_choongnam = new Array();
var cnt_jeonbook = new Array();
var cnt_jeonnam = new Array();
var cnt_gyoungbook = new Array();
var cnt_gyoungnam = new Array();
var cnt_jeju = new Array();


$(function(){

	// 맵차트 영역
	$.ajax({
		url:"http://localhost:5000/mapChart",
		type:"post",
		dataType:"json"
	}).done(function(data){
		mapChart(data);
	}).fail(function(err){
		console.log(err);
	});
	
	//스택차트 영역
	$("#search_btn").click(function(){
		srchKeco1 = $("#srchKeco1").val();
		
		if(srchKeco1=="none"){
			alert("유형을 선택하세요");
			return;
		}
		
		param = "srchKeco1="+srchKeco1;
		
		$.ajax({
			url:"http://localhost:5000/stackChart",
			type:"post",
			dataType:"json",
			data: param
		}).done(function(data){
			//stackChart(data);
			//$("#stackchart").show();
			
			var c_seoul = 0;
			var c_busan = 0;
			var c_daagu = 0;
			var c_incheon = 0;
			var c_gwangju = 0;
			var c_daejoen = 0;
			var c_ulsan = 0;
			var c_saejong = 0;
			var c_gyounggi = 0;
			var c_gangwon = 0;
			var c_choongbook = 0;
			var c_choongnam = 0;
			var c_jeonbook = 0;
			var c_jeonnam = 0;
			var c_gyoungbook = 0;
			var c_gyoungnam = 0;
			var c_jeju = 0;
			
			for(var i=0; i<data.length; i++){
				if(data[i].city == "서울"){
					loc_seoul[c_seoul] = data[i].location;
					cnt_seoul[c_seoul] = data[i].counts;

					c_seoul++;	
				} else if(data[i].city == "부산"){
					loc_busan[c_busan] = data[i].location;
					cnt_busan[c_busan] = data[i].counts;

					c_busan++;	
				} else if(data[i].city == "대구"){
					loc_daagu[c_daagu] = data[i].location;
					cnt_daagu[c_daagu] = data[i].counts;

					c_daagu++;	
				} else if(data[i].city == "인천"){
					loc_incheon[c_incheon] = data[i].location;
					cnt_incheon[c_daagu] = data[i].counts;

					c_incheon++;	
				} else if(data[i].city == "광주"){
					loc_gwangju[c_gwangju] = data[i].location;
					cnt_gwangju[c_gwangju] = data[i].counts;

					c_gwangju++;	
				} else if(data[i].city == "대전"){
					loc_daejoen[c_daejoen] = data[i].location;
					cnt_daejoen[c_daejoen] = data[i].counts;

					c_daejoen++;	
				} else if(data[i].city == "울산"){
					loc_ulsan[c_ulsan] = data[i].location;
					cnt_ulsan[c_ulsan] = data[i].counts;

					c_ulsan++;	
				} else if(data[i].city == "세종"){
					loc_saejong[c_saejong] = data[i].location;
					cnt_saejong[c_saejong] = data[i].counts;

					c_saejong++;	
				} else if(data[i].city == "경기"){
					loc_gyounggi[c_gyounggi] = data[i].location;
					cnt_gyounggi[c_gyounggi] = data[i].counts;

					c_gyounggi++;	
				} else if(data[i].city == "강원"){
					loc_gangwon[c_gangwon] = data[i].location;
					cnt_gangwon[c_gangwon] = data[i].counts;

					c_gangwon++;	
				} else if(data[i].city == "충북"){
					loc_choongbook[c_choongbook] = data[i].location;
					cnt_choongbook[c_choongbook] = data[i].counts;

					c_choongbook++;	
				} else if(data[i].city == "충남"){
					loc_choongnam[c_choongnam] = data[i].location;
					cnt_choongnam[c_choongnam] = data[i].counts;

					c_choongnam++;	
				} else if(data[i].city == "전북"){
					loc_jeonbook[c_jeonbook] = data[i].location;
					cnt_jeonbook[c_jeonbook] = data[i].counts;

					c_jeonbook++;	
				} else if(data[i].city == "전남"){
					loc_jeonnam[c_jeonnam] = data[i].location;
					cnt_jeonnam[c_jeonnam] = data[i].counts;

					c_jeonnam++;	
				} else if(data[i].city == "경북"){
					loc_gyoungbook[c_gyoungbook] = data[i].location;
					cnt_gyoungbook[c_gyoungbook] = data[i].counts;

					c_gyoungbook++;	
				} else if(data[i].city == "경남"){
					loc_gyoungnam[c_gyoungnam] = data[i].location;
					cnt_gyoungnam[c_gyoungnam] = data[i].counts;

					c_gyoungnam++;	
				} else if(data[i].city == "제주"){
					loc_jeju[c_jeju] = data[i].location;
					cnt_jeju[c_jeju] = data[i].counts;

					c_jeju++;	
				}				
			} // for 끝

			 stackChart();
			
		}).fail(function(err){
			console.log(err);
		});
		
	});
	
});

function mapChart(data_json) { // 맵차트 영역

   // Themes begin
   am4core.useTheme(am4themes_animated);
   // Themes end

    // Create map instance
   var chart = am4core.create("mapchart", am4maps.MapChart);

   // Set map definition
   chart.geodata = am4geodata_southKoreaLow;

   // Create map polygon series
   var polygonSeries = chart.series.push(new am4maps.MapPolygonSeries());

   //Set min/max fill color for each area
   polygonSeries.heatRules.push({
     property: "fill",
     target: polygonSeries.mapPolygons.template,
     min: chart.colors.getIndex(1).brighten(1),
     max: chart.colors.getIndex(1).brighten(-0.3)
   });

   // Make map load polygon data (state shapes and names) from GeoJSON
   polygonSeries.useGeodata = true;

   // Set heatmap values for each state /* json값 뿌리기 */
   polygonSeries.data = data_json;

   // Set up heat legend
   let heatLegend = chart.createChild(am4maps.HeatLegend);
   heatLegend.series = polygonSeries;
   heatLegend.align = "right";
   heatLegend.valign = "bottom";
   heatLegend.width = am4core.percent(20);
   heatLegend.marginRight = am4core.percent(4);
   heatLegend.minValue = 0;
   heatLegend.maxValue = 40000000;

   // Set up custom heat map legend labels using axis ranges
   var minRange = heatLegend.valueAxis.axisRanges.create();
   minRange.value = heatLegend.minValue;
   minRange.label.text = "Little";
   var maxRange = heatLegend.valueAxis.axisRanges.create();
   maxRange.value = heatLegend.maxValue;
   maxRange.label.text = "A lot!";

   // Blank out internal heat legend value axis labels
   heatLegend.valueAxis.renderer.labels.template.adapter.add("text", function(labelText) {
     return "";
   });

   // Configure series tooltip
   var polygonTemplate = polygonSeries.mapPolygons.template;
   polygonTemplate.tooltipText = "{name}: {value}";
   polygonTemplate.nonScalingStroke = true;
   polygonTemplate.strokeWidth = 0.5;

   // Create hover state and set alternative fill color
   var hs = polygonTemplate.states.create("hover");
   hs.properties.fill = am4core.color("#3c5bdc");

   } // 맵차트 끝
   
   
   
   function stackChart() { // 스택차트
   
		// Themes begin
		am4core.useTheme(am4themes_animated);
		// Themes end

		// Create chart instance
		var chart = am4core.create("stackchart", am4charts.XYChart);


		var str = '[';
		
		if(loc_seoul.length > 0) {		
			str += '{"지역":"서울",';
			for(var i=0; i<loc_seoul.length; i++){
				str += '"';
				str += loc_seoul[i];
				str += '":"';
				str += cnt_seoul[i]+'"';
				
				if(i<loc_seoul.length-1)
					str += ',';
			}
			str += '}';
		}
		
		if(loc_busan.length > 0) {
			if(loc_seoul.length > 0)
				str += ',';
			
			str += '{"지역":"부산",';
			for(var i=0; i<loc_busan.length; i++){
				str += '"';
				str += loc_busan[i];
				str += '":"';
				str += cnt_busan[i]+'"';
				
				if(i<loc_busan.length-1)
					str += ',';
			}
			str += '}';

		}
		
		if(loc_daagu.length > 0) {		
			str += ',{"지역":"대구",';
			for(var i=0; i<loc_daagu.length; i++){
				str += '"';
				str += loc_daagu[i];
				str += '":"';
				str += cnt_daagu[i]+'"';
				
				if(i<loc_daagu.length-1)
					str += ',';
			}
			str += '}';
		}
		
		if(loc_incheon.length > 0) {		
			str += ',{"지역":"인천",';
			for(var i=0; i<loc_incheon.length; i++){
				str += '"';
				str += loc_incheon[i];
				str += '":"';
				str += cnt_incheon[i]+'"';
				
				if(i<loc_incheon.length-1)
					str += ',';
			}
			str += '}';
		}
		
		if(loc_gwangju.length > 0) {		
			str += ',{"지역":"광주",';
			for(var i=0; i<loc_gwangju.length; i++){
				str += '"';
				str += loc_gwangju[i];
				str += '":"';
				str += cnt_gwangju[i]+'"';
				
				if(i<loc_gwangju.length-1)
					str += ',';
			}
			str += '}';
		}
		
		if(loc_daejoen.length > 0) {		
			str += ',{"지역":"대전",';
			for(var i=0; i<loc_daejoen.length; i++){
				str += '"';
				str += loc_daejoen[i];
				str += '":"';
				str += cnt_daejoen[i]+'"';
				
				if(i<loc_daejoen.length-1)
					str += ',';
			}
			str += '}';
		}
		
		if(loc_ulsan.length > 0) {		
			str += ',{"지역":"울산",';
			for(var i=0; i<loc_ulsan.length; i++){
				str += '"';
				str += loc_ulsan[i];
				str += '":"';
				str += cnt_ulsan[i]+'"';
				
				if(i<loc_ulsan.length-1)
					str += ',';
			}
			str += '}';
		}
		
		if(loc_saejong.length > 0) {		
			str += ',{"지역":"세종",';
			for(var i=0; i<loc_saejong.length; i++){
				str += '"';
				str += loc_saejong[i];
				str += '":"';
				str += cnt_saejong[i]+'"';
				
				if(i<loc_saejong.length-1)
					str += ',';
			}
			str += '}';
		}
		
		if(loc_gyounggi.length > 0) {		
			str += ',{"지역":"경기",';
			for(var i=0; i<loc_gyounggi.length; i++){
				str += '"';
				str += loc_gyounggi[i];
				str += '":"';
				str += cnt_gyounggi[i]+'"';
				
				if(i<loc_gyounggi.length-1)
					str += ',';
			}
			str += '}';
		}
		
		if(loc_gangwon.length > 0) {		
			str += ',{"지역":"강원",';
			for(var i=0; i<loc_gangwon.length; i++){
				str += '"';
				str += loc_gangwon[i];
				str += '":"';
				str += cnt_gangwon[i]+'"';
				
				if(i<loc_gangwon.length-1)
					str += ',';
			}
			str += '}';
		}
		
		if(loc_choongbook.length > 0) {		
			str += ',{"지역":"충북",';
			for(var i=0; i<loc_choongbook.length; i++){
				str += '"';
				str += loc_choongbook[i];
				str += '":"';
				str += cnt_choongbook[i]+'"';
				
				if(i<loc_choongbook.length-1)
					str += ',';
			}
			str += '}';
		}
		
		if(loc_choongnam.length > 0) {		
			str += ',{"지역":"충남",';
			for(var i=0; i<loc_choongnam.length; i++){
				str += '"';
				str += loc_choongnam[i];
				str += '":"';
				str += cnt_choongnam[i]+'"';
				
				if(i<loc_choongnam.length-1)
					str += ',';
			}
			str += '}';
		}
		
		if(loc_jeonbook.length > 0) {		
			str += ',{"지역":"전북",';
			for(var i=0; i<loc_jeonbook.length; i++){
				str += '"';
				str += loc_jeonbook[i];
				str += '":"';
				str += cnt_jeonbook[i]+'"';
				
				if(i<loc_jeonbook.length-1)
					str += ',';
			}
			str += '}';
		}
		
		if(loc_jeonnam.length > 0) {		
			str += ',{"지역":"전남",';
			for(var i=0; i<loc_jeonnam.length; i++){
				str += '"';
				str += loc_jeonnam[i];
				str += '":"';
				str += cnt_jeonnam[i]+'"';
				
				if(i<loc_jeonnam.length-1)
					str += ',';
			}
			str += '}';
		}
		
		if(loc_gyoungbook.length > 0) {		
			str += ',{"지역":"경북",';
			for(var i=0; i<loc_gyoungbook.length; i++){
				str += '"';
				str += loc_gyoungbook[i];
				str += '":"';
				str += cnt_gyoungbook[i]+'"';
				
				if(i<loc_gyoungbook.length-1)
					str += ',';
			}
			str += '}';
		}
		
		if(loc_gyoungnam.length > 0) {		
			str += ',{"지역":"경남",';
			for(var i=0; i<loc_gyoungnam.length; i++){
				str += '"';
				str += loc_gyoungnam[i];
				str += '":"';
				str += cnt_gyoungnam[i]+'"';
				
				if(i<loc_gyoungnam.length-1)
					str += ',';
			}
			str += '}';
		}
		
		if(loc_jeju.length > 0) {		
			str += ',{"지역":"제주",';
			for(var i=0; i<loc_jeju.length; i++){
				str += '"';
				str += loc_jeju[i];
				str += '":"';
				str += cnt_jeju[i]+'"';
				
				if(i<loc_jeju.length-1)
					str += ',';
			}
			str += '}';
		}
		
	
		str += ']';
		console.log(str);
		var str1 = JSON.parse(str);
		console.log(str1);
		//var data_val = [{str}];
		
		// console.log(data_val);
		// Add data
		chart.data = str1;

		var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
		categoryAxis.dataFields.category = "지역";
		categoryAxis.renderer.grid.template.location = 0;


		var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
		valueAxis.renderer.inside = true;
		valueAxis.renderer.labels.template.disabled = true;
		valueAxis.min = 0;

		// Create series
		function createSeries(field, name) {
		  
		  // Set up series
		  var series = chart.series.push(new am4charts.ColumnSeries());
		  series.name = name;
		  series.dataFields.valueY = field;
		  series.dataFields.categoryX = "지역";
		  series.sequencedInterpolation = true;
		  
		  // Make it stacked
		  series.stacked = true;
		  
		  // Configure columns
		  series.columns.template.width = am4core.percent(60);
		  series.columns.template.tooltipText = "[bold]{name}[/]\n[font-size:14px]{categoryX}: {valueY}";
		  
		  // Add label
		  var labelBullet = series.bullets.push(new am4charts.LabelBullet());
		  labelBullet.label.text = "{valueY}";
		  labelBullet.locationY = 0.5;
		  labelBullet.label.hideOversized = true;
		  
		  return series;
		}

		
		for(var i=0; i<loc_seoul.length; i++){
			createSeries(loc_seoul[i], loc_seoul[i]);
		}
		for(var i=0; i<loc_busan.length; i++){
			createSeries(loc_busan[i], loc_busan[i]);
		}
		for(var i=0; i<loc_daagu.length; i++){
			createSeries(loc_daagu[i], loc_daagu[i]);
		}
		for(var i=0; i<loc_incheon.length; i++){
			createSeries(loc_incheon[i], loc_incheon[i]);
		}
		for(var i=0; i<loc_gwangju.length; i++){
			createSeries(loc_gwangju[i], loc_gwangju[i]);
		}
		for(var i=0; i<loc_daejoen.length; i++){
			createSeries(loc_daejoen[i], loc_daejoen[i]);
		}
		for(var i=0; i<loc_ulsan.length; i++){
			createSeries(loc_ulsan[i], loc_ulsan[i]);
		}
		for(var i=0; i<loc_saejong.length; i++){
			createSeries(loc_saejong[i], loc_saejong[i]);
		}
		for(var i=0; i<loc_gyounggi.length; i++){
			createSeries(loc_gyounggi[i], loc_gyounggi[i]);
		}
		for(var i=0; i<loc_gangwon.length; i++){
			createSeries(loc_gangwon[i], loc_gangwon[i]);
		}
		for(var i=0; i<loc_choongbook.length; i++){
			createSeries(loc_choongbook[i], loc_choongbook[i]);
		}
		for(var i=0; i<loc_choongnam.length; i++){
			createSeries(loc_choongnam[i], loc_choongnam[i]);
		}
		for(var i=0; i<loc_jeonbook.length; i++){
			createSeries(loc_jeonbook[i], loc_jeonbook[i]);
		}
		for(var i=0; i<loc_jeonnam.length; i++){
			createSeries(loc_jeonnam[i], loc_jeonnam[i]);
		}
		for(var i=0; i<loc_gyoungbook.length; i++){
			createSeries(loc_gyoungbook[i], loc_gyoungbook[i]);
		}
		for(var i=0; i<loc_gyoungnam.length; i++){
			createSeries(loc_gyoungnam[i], loc_gyoungnam[i]);
		}
		for(var i=0; i<loc_jeju.length; i++){
			createSeries(loc_jeju[i], loc_jeju[i]);
		}
		
		// Legend
		chart.legend = new am4charts.Legend();

		}
   
   
   
</script>
</body>
</html>