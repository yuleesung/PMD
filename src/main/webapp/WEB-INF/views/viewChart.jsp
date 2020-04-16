<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#mapchart {
	width: 80%;
	height: 500px;
	margin: auto;
}

#stackchart {
	width: 100%;
	height: 800px;
}

.full_box {
	background: #FFFCEC;
	height: 200px;
}

.heading {
	border-bottom: 2px solid #EB593C;
	padding-bottom: 10px;
	position: relative;
	margin-top: 20px;
	margin-bottom: 0;
}

.heading span {
	background: #333333 none repeat scroll 0 0;
	bottom: -2px;
	height: 3px;
	left: 0;
	position: absolute;
	width: 100px;
}

.ending {
	border-bottom: 2px solid #333333;
	padding-bottom: 10px;
	position: relative;
	top: -10px;
	margin-top: 0;
	margin-bottom: 0;
}

.ending span {
	background: #EB593C none repeat scroll 0 0;
	bottom: -2px;
	height: 2px;
	left: 0;
	position: absolute;
	width: 1050px;
}
</style>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800|Playfair+Display:,300, 400, 700"
	rel="stylesheet">

<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/animate.css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/mediaelementplayer.min.css">
<link rel="stylesheet"
	href="resources/fonts/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="resources/fonts/fontawesome/css/font-awesome.min.css">

<!-- 메뉴바 관련 추가 -->
<link href="http://fonts.googleapis.com/css?family=Didact+Gothic"
	rel="stylesheet">
<link href="resources/css/fonts.css" rel="stylesheet" type="text/css"
	media="all">
<link href="resources/css/default.css" rel="stylesheet" type="text/css"
	media="all">

<!-- Theme Style -->
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>


	<jsp:include page="menubar2.jsp" />



	<div class="container" style="padding: 0;">
		<section class="home-slider owl-carousel">
			<div class="slider-item"
				style="background-image: url('resources/images/mario.gif'); background-size: 30%;">
				<div class="container">
					<div
						class="row slider-text align-items-center justify-content-center">
						<div class="col-md-8 text-center col-sm-12 element-animate">
							<h1 style="font-family: inherit;"></h1>
							<p class="mb-5"></p>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<!-- HTML -->
	<section class="section element-animate container" style="padding: 0;">

		<h2 class="heading" style="font-family: fantasy;">
			<strong>지역별 </strong> 교육현황 <span></span>
		</h2>
		<div style="background-color: #FFFCEC; height: 550px; padding-top: 20px;">
			<div id="mapchart"></div>
		</div>
		<h2 class="ending">
			<strong></strong><span style="text-align: right;"></span>
		</h2>
		

		<h2 class="heading" style="font-family: fantasy;">
			<strong>분야별 </strong> 교육현황 <span></span>
		</h2>
		<div class="container" style="padding: 0;">
			<div class="full_box">
				<div class="form_controls">
					<div class="row" style="width: 100%; margin: 0;">
						<div class="form-group col-md-3" style="margin-top: 20px;">
							<select class="form-control" id="srchKeco1">
								<option value="none">:: 분야 선택 ::</option>
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
					</div>				
				</div>	
				<span style="margin-left: 5%; font-size:16px; font-weight:bold; font-family: inherit;">분야별 교육현황을 지역별로 확인해보세요!</span>	
			</div>
		</div>
		<!-- 스택형차트 영역 -->
		<div class="container" style="display: none; background-color: #FFFCEC; position: relative;" id="viewStack">
			<span style="margin-left: 5%; font-weight:bold;">※ 속도느림</span>
			<div id="stackchart"></div>
		</div>
		<h2 class="ending">
			<strong></strong><span style="text-align: right;"></span>
		</h2>
	</section>

	<jsp:include page="footer.jsp" />

	<jsp:include page="scroll.jsp"/>
	
<!-- loader -->
    <div id="loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#f4b214"/></svg></div>
    
    
	<!-- 차트! -->
	<script src="https://www.amcharts.com/lib/4/core.js"></script>
	<script src="https://www.amcharts.com/lib/4/maps.js"></script>
	<script src="https://www.amcharts.com/lib/4/geodata/southKoreaLow.js"></script>
	<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
	<script src="https://www.amcharts.com/lib/4/charts.js"></script>
	<!-- jquery -->
	<script src="resources/js/jquery-3.4.1.min.js"></script>

	<script src="resources/js/jquery-3.2.1.min.js"></script>
	<script src="resources/js/popper.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/owl.carousel.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/mediaelement-and-player.min.js"></script>
	<script src="resources/js/jquery.waypoints.min.js"></script>
	<script src="resources/js/jquery.countdown.min.js"></script>
	<script src="resources/js/main.js"></script>

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

		$(function() {

			// 맵차트 영역
			$.ajax({
				url : "http://localhost:5000/mapChart",
				type : "post",
				dataType : "json"
			}).done(function(data) {
				mapChart(data);
			}).fail(function(err) {
				console.log(err);
			});

			//스택차트 영역
			$("#srchKeco1").change(
					function() {
						srchKeco1 = $("#srchKeco1").val();

						if (srchKeco1 == "none") {
							$('#viewStack').hide();
							return;
						} else {
							$('#viewStack').show();
						}

						param = "srchKeco1=" + srchKeco1;

						$.ajax({
							url : "http://localhost:5000/stackChart",
							type : "post",
							dataType : "json",
							data : param
						}).done(
								function(data) {

									//console.log(data);

									loc_seoul = new Array();
									loc_busan = new Array();
									loc_daagu = new Array();
									loc_incheon = new Array();
									loc_gwangju = new Array();
									loc_daejoen = new Array();
									loc_ulsan = new Array();
									loc_saejong = new Array();
									loc_gyounggi = new Array();
									loc_gangwon = new Array();
									loc_choongbook = new Array();
									loc_choongnam = new Array();
									loc_jeonbook = new Array();
									loc_jeonnam = new Array();
									loc_gyoungbook = new Array();
									loc_gyoungnam = new Array();
									loc_jeju = new Array();

									cnt_seoul = new Array();
									cnt_busan = new Array();
									cnt_daagu = new Array();
									cnt_incheon = new Array();
									cnt_gwangju = new Array();
									cnt_daejoen = new Array();
									cnt_ulsan = new Array();
									cnt_saejong = new Array();
									cnt_gyounggi = new Array();
									cnt_gangwon = new Array();
									cnt_choongbook = new Array();
									cnt_choongnam = new Array();
									cnt_jeonbook = new Array();
									cnt_jeonnam = new Array();
									cnt_gyoungbook = new Array();
									cnt_gyoungnam = new Array();
									cnt_jeju = new Array();

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

									for (var i = 0; i < data.length; i++) {
										if (data[i].city == "서울") {
											c_seoul = dataa(c_seoul, loc_seoul,
													cnt_seoul,
													data[i].location,
													data[i].counts);
										}
										if (data[i].city == "부산") {
											c_busan = dataa(c_busan, loc_busan,
													cnt_busan,
													data[i].location,
													data[i].counts);
										}
										if (data[i].city == "대구") {
											c_daagu = dataa(c_daagu, loc_daagu,
													cnt_daagu,
													data[i].location,
													data[i].counts);
										}
										if (data[i].city == "인천") {
											c_incheon = dataa(c_incheon,
													loc_incheon, cnt_incheon,
													data[i].location,
													data[i].counts);
										}
										if (data[i].city == "광주") {
											c_gwangju = dataa(c_gwangju,
													loc_gwangju, cnt_gwangju,
													data[i].location,
													data[i].counts);
										}
										if (data[i].city == "대전") {
											c_daejoen = dataa(c_daejoen,
													loc_daejoen, cnt_daejoen,
													data[i].location,
													data[i].counts);
										}
										if (data[i].city == "울산") {
											c_ulsan = dataa(c_ulsan, loc_ulsan,
													cnt_ulsan,
													data[i].location,
													data[i].counts);
										}
										if (data[i].city == "세종") {
											c_saejong = dataa(c_saejong,
													loc_saejong, cnt_saejong,
													data[i].location,
													data[i].counts);
										}
										if (data[i].city == "경기") {
											c_gyounggi = dataa(c_gyounggi,
													loc_gyounggi, cnt_gyounggi,
													data[i].location,
													data[i].counts);
										}
										if (data[i].city == "강원") {
											c_gangwon = dataa(c_gangwon,
													loc_gangwon, cnt_gangwon,
													data[i].location,
													data[i].counts);
										}
										if (data[i].city == "충북") {
											c_choongbook = dataa(c_choongbook,
													loc_choongbook,
													cnt_choongbook,
													data[i].location,
													data[i].counts);
										}
										if (data[i].city == "충남") {
											c_choongnam = dataa(c_choongnam,
													loc_choongnam,
													cnt_choongnam,
													data[i].location,
													data[i].counts);
										}
										if (data[i].city == "전북") {
											c_jeonbook = dataa(c_jeonbook,
													loc_jeonbook, cnt_jeonbook,
													data[i].location,
													data[i].counts);
										}
										if (data[i].city == "전남") {
											c_jeonnam = dataa(c_jeonnam,
													loc_jeonnam, cnt_jeonnam,
													data[i].location,
													data[i].counts);
										}
										if (data[i].city == "경북") {
											c_gyoungbook = dataa(c_gyoungbook,
													loc_gyoungbook,
													cnt_gyoungbook,
													data[i].location,
													data[i].counts);
										}
										if (data[i].city == "경남") {
											c_gyoungnam = dataa(c_gyoungnam,
													loc_gyoungnam,
													cnt_gyoungnam,
													data[i].location,
													data[i].counts);
										}
										if (data[i].city == "제주") {
											c_jeju = dataa(c_jeju, loc_jeju,
													cnt_jeju, data[i].location,
													data[i].counts);
										}
									} // for 끝

									stackChart(); // 스택차트 함수호출
								}).fail(function(err) {
							console.log(err);
							alert("개설 된 교육이 없습니다.");
							$("#viewStack").css("display", "none");
							$("#stackchart").empty();
						});

					});

		});

		function dataa(num, loc, loc_cnt, data_loc, data_cnt) {
			if (num < 1) { // 처음에만 진입.
				loc[num] = data_loc;
				loc_cnt[num] = data_cnt;

				num++;
			} else if (num > 0) {
				for (var k = 0; k < num; k++) {
					if (loc[k] != data_loc) { // 동일한 지역이 아닐 때 진입.
						if (k == num - 1) {
							// 만약, 끝까지 동일한 지역이 없었다면,
							// 배열에 넣어주기
							loc[num] = data_loc;
							loc_cnt[num] = data_cnt;

							num++;
							break;
						}
					} else { // 동일한 지역일 때 진입.
						loc_cnt[num] += data_cnt; // 그 지역에 값만 누적

						break;
					}
				}
			}

			return num;
		}

		function mapChart(data_json) { // 맵차트 영역

			// Themes begin
			am4core.useTheme(am4themes_animated);
			// Themes end

			// Create map instance
			var chart = am4core.create("mapchart", am4maps.MapChart);

			// Set map definition
			chart.geodata = am4geodata_southKoreaLow;

			// Create map polygon series
			var polygonSeries = chart.series
					.push(new am4maps.MapPolygonSeries());
			polygonSeries.name = "지역명";
			polygonSeries.value = "과정수";

			//Set min/max fill color for each area
			polygonSeries.heatRules.push({
				property : "fill",
				target : polygonSeries.mapPolygons.template,
				min : chart.colors.getIndex(1).brighten(1),
				max : chart.colors.getIndex(1).brighten(-0.3)
			});

			// Make map load polygon data (state shapes and names) from GeoJSON
			polygonSeries.useGeodata = true;

			// Set heatmap values for each state /* json값 뿌리기 */
			polygonSeries.data = data_json;

			// Set up heat legend
			let heatLegend = chart.createChild(am4maps.HeatLegend);
			heatLegend.series = polygonSeries;
			heatLegend.align = "center";
			heatLegend.valign = "bottom";
			heatLegend.width = am4core.percent(15);
			heatLegend.marginRight = am4core.percent(4);
			heatLegend.minValue = 0;
			heatLegend.maxValue = 4000;

			// Set up custom heat map legend labels using axis ranges
			var minRange = heatLegend.valueAxis.axisRanges.create();
			minRange.value = heatLegend.minValue;
			minRange.label.text = "0";
			var maxRange = heatLegend.valueAxis.axisRanges.create();
			maxRange.value = heatLegend.maxValue;
			maxRange.label.text = "4000";

			// Blank out internal heat legend value axis labels
			heatLegend.valueAxis.renderer.labels.template.adapter.add("text",
					function(labelText) {
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

			var series = [];
			for (var i = 0; i < data_json.length; i++) {
				series[i] = chart.series.push(new am4maps.MapPolygonSeries());
				series[i].name = data_json[i].name;
				series[i].value = data_json[i].value;
			}

			chart.legend = new am4maps.Legend();
			chart.legend.labels.template.text = "[bold {color}]{name} : {value}[/]";
			chart.legend.position = "right";
			chart.legend.align = "right";

			chart.legend.itemContainers.template.paddingTop = 1;
			chart.legend.itemContainers.template.paddingBottom = 1;

			chart.legend.itemContainers.template.clickable = false;
			chart.legend.itemContainers.template.focusable = false;

		} // 맵차트 끝

		function stackChart() { // 스택차트

			// Themes begin
			am4core.useTheme(am4themes_animated);
			// Themes end

			// Create chart instance
			var chart = am4core.create("stackchart", am4charts.XYChart);

			var str = '[';

			if (loc_seoul.length > 0) {
				str += '{"지역":"서울",';
				for (var i = 0; i < loc_seoul.length; i++) {
					str += '"서울';
					str += loc_seoul[i];
					str += '":"';
					str += cnt_seoul[i] + '"';

					if (i < loc_seoul.length - 1)
						str += ',';
				}
				str += '}';
			}

			if (loc_busan.length > 0) {
				if (loc_seoul.length > 0)
					str += ',';

				str += '{"지역":"부산",';
				for (var i = 0; i < loc_busan.length; i++) {
					str += '"부산';
					str += loc_busan[i];
					str += '":"';
					str += cnt_busan[i] + '"';

					if (i < loc_busan.length - 1)
						str += ',';
				}
				str += '}';

			}

			if (loc_daagu.length > 0) {
				str += ',{"지역":"대구",';
				for (var i = 0; i < loc_daagu.length; i++) {
					str += '"대구';
					str += loc_daagu[i];
					str += '":"';
					str += cnt_daagu[i] + '"';

					if (i < loc_daagu.length - 1)
						str += ',';
				}
				str += '}';
			}

			if (loc_incheon.length > 0) {
				str += ',{"지역":"인천",';
				for (var i = 0; i < loc_incheon.length; i++) {
					str += '"인천';
					str += loc_incheon[i];
					str += '":"';
					str += cnt_incheon[i] + '"';

					if (i < loc_incheon.length - 1)
						str += ',';
				}
				str += '}';
			}

			if (loc_gwangju.length > 0) {
				str += ',{"지역":"광주",';
				for (var i = 0; i < loc_gwangju.length; i++) {
					str += '"광주';
					str += loc_gwangju[i];
					str += '":"';
					str += cnt_gwangju[i] + '"';

					if (i < loc_gwangju.length - 1)
						str += ',';
				}
				str += '}';
			}

			if (loc_daejoen.length > 0) {
				str += ',{"지역":"대전",';
				for (var i = 0; i < loc_daejoen.length; i++) {
					str += '"대전';
					str += loc_daejoen[i];
					str += '":"';
					str += cnt_daejoen[i] + '"';

					if (i < loc_daejoen.length - 1)
						str += ',';
				}
				str += '}';
			}

			if (loc_ulsan.length > 0) {
				str += ',{"지역":"울산",';
				for (var i = 0; i < loc_ulsan.length; i++) {
					str += '"울산';
					str += loc_ulsan[i];
					str += '":"';
					str += cnt_ulsan[i] + '"';

					if (i < loc_ulsan.length - 1)
						str += ',';
				}
				str += '}';
			}

			if (loc_saejong.length > 0) {
				str += ',{"지역":"세종",';
				for (var i = 0; i < loc_saejong.length; i++) {
					str += '"세종';
					str += loc_saejong[i];
					str += '":"';
					str += cnt_saejong[i] + '"';

					if (i < loc_saejong.length - 1)
						str += ',';
				}
				str += '}';
			}

			if (loc_gyounggi.length > 0) {
				str += ',{"지역":"경기",';
				for (var i = 0; i < loc_gyounggi.length; i++) {
					str += '"경기';
					str += loc_gyounggi[i];
					str += '":"';
					str += cnt_gyounggi[i] + '"';

					if (i < loc_gyounggi.length - 1)
						str += ',';
				}
				str += '}';
			}

			if (loc_gangwon.length > 0) {
				str += ',{"지역":"강원",';
				for (var i = 0; i < loc_gangwon.length; i++) {
					str += '"강원';
					str += loc_gangwon[i];
					str += '":"';
					str += cnt_gangwon[i] + '"';

					if (i < loc_gangwon.length - 1)
						str += ',';
				}
				str += '}';
			}

			if (loc_choongbook.length > 0) {
				str += ',{"지역":"충북",';
				for (var i = 0; i < loc_choongbook.length; i++) {
					str += '"충북';
					str += loc_choongbook[i];
					str += '":"';
					str += cnt_choongbook[i] + '"';

					if (i < loc_choongbook.length - 1)
						str += ',';
				}
				str += '}';
			}

			if (loc_choongnam.length > 0) {
				str += ',{"지역":"충남",';
				for (var i = 0; i < loc_choongnam.length; i++) {
					str += '"충남';
					str += loc_choongnam[i];
					str += '":"';
					str += cnt_choongnam[i] + '"';

					if (i < loc_choongnam.length - 1)
						str += ',';
				}
				str += '}';
			}

			if (loc_jeonbook.length > 0) {
				str += ',{"지역":"전북",';
				for (var i = 0; i < loc_jeonbook.length; i++) {
					str += '"전북';
					str += loc_jeonbook[i];
					str += '":"';
					str += cnt_jeonbook[i] + '"';

					if (i < loc_jeonbook.length - 1)
						str += ',';
				}
				str += '}';
			}

			if (loc_jeonnam.length > 0) {
				str += ',{"지역":"전남",';
				for (var i = 0; i < loc_jeonnam.length; i++) {
					str += '"전남';
					str += loc_jeonnam[i];
					str += '":"';
					str += cnt_jeonnam[i] + '"';

					if (i < loc_jeonnam.length - 1)
						str += ',';
				}
				str += '}';
			}

			if (loc_gyoungbook.length > 0) {
				str += ',{"지역":"경북",';
				for (var i = 0; i < loc_gyoungbook.length; i++) {
					str += '"경북';
					str += loc_gyoungbook[i];
					str += '":"';
					str += cnt_gyoungbook[i] + '"';

					if (i < loc_gyoungbook.length - 1)
						str += ',';
				}
				str += '}';
			}

			if (loc_gyoungnam.length > 0) {
				str += ',{"지역":"경남",';
				for (var i = 0; i < loc_gyoungnam.length; i++) {
					str += '"경남';
					str += loc_gyoungnam[i];
					str += '":"';
					str += cnt_gyoungnam[i] + '"';

					if (i < loc_gyoungnam.length - 1)
						str += ',';
				}
				str += '}';
			}

			if (loc_jeju.length > 0) {
				str += ',{"지역":"제주",';
				for (var i = 0; i < loc_jeju.length; i++) {
					str += '"제주';
					str += loc_jeju[i];
					str += '":"';
					str += cnt_jeju[i] + '"';

					if (i < loc_jeju.length - 1)
						str += ',';
				}
				str += '}';
			}
			str += ']';

			var str1 = JSON.parse(str); // 문자열 str을 JSON화 시켜줌

			//console.log(str1);

			// Add data
			chart.data = str1; // 결과값을 차트에 전달

			var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
			categoryAxis.dataFields.category = "지역";
			categoryAxis.renderer.grid.template.location = 0;
			categoryAxis.renderer.minGridDistance = 10;

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
				series.sequencedInterpolation = false;

				// Make it stacked
				series.stacked = true;

				// Configure columns
				series.columns.template.width = am4core.percent(60);
				series.columns.template.tooltipText = "[bold]{name}[/]\n[font-size:14px]{categoryX}: {valueY}";

				// Add label
				var labelBullet = series.bullets
						.push(new am4charts.LabelBullet());
				labelBullet.label.text = "[bold][font-size:10px]{name} [font-size:10px]{valueY}";
				labelBullet.locationY = 0.5;
				labelBullet.label.hideOversized = true;

				return series;
			}

			for (var i = 0; i < loc_seoul.length; i++) {
				createSeries("서울" + loc_seoul[i], loc_seoul[i]);
			}
			for (var i = 0; i < loc_busan.length; i++) {
				createSeries("부산" + loc_busan[i], loc_busan[i]);
			}
			for (var i = 0; i < loc_daagu.length; i++) {
				createSeries("대구" + loc_daagu[i], loc_daagu[i]);
			}
			for (var i = 0; i < loc_incheon.length; i++) {
				createSeries("인천" + loc_incheon[i], loc_incheon[i]);
			}
			for (var i = 0; i < loc_gwangju.length; i++) {
				createSeries("광주" + loc_gwangju[i], loc_gwangju[i]);
			}
			for (var i = 0; i < loc_daejoen.length; i++) {
				createSeries("대전" + loc_daejoen[i], loc_daejoen[i]);
			}
			for (var i = 0; i < loc_ulsan.length; i++) {
				createSeries("울산" + loc_ulsan[i], loc_ulsan[i]);
			}
			for (var i = 0; i < loc_saejong.length; i++) {
				createSeries("세종" + loc_saejong[i], loc_saejong[i]);
			}
			for (var i = 0; i < loc_gyounggi.length; i++) {
				createSeries("경기" + loc_gyounggi[i], loc_gyounggi[i]);
			}
			for (var i = 0; i < loc_gangwon.length; i++) {
				createSeries("강원" + loc_gangwon[i], loc_gangwon[i]);
			}
			for (var i = 0; i < loc_choongbook.length; i++) {
				createSeries("충북" + loc_choongbook[i], loc_choongbook[i]);
			}
			for (var i = 0; i < loc_choongnam.length; i++) {
				createSeries("충남" + loc_choongnam[i], loc_choongnam[i]);
			}
			for (var i = 0; i < loc_jeonbook.length; i++) {
				createSeries("전북" + loc_jeonbook[i], loc_jeonbook[i]);
			}
			for (var i = 0; i < loc_jeonnam.length; i++) {
				createSeries("전남" + loc_jeonnam[i], loc_jeonnam[i]);
			}
			for (var i = 0; i < loc_gyoungbook.length; i++) {
				createSeries("경북" + loc_gyoungbook[i], loc_gyoungbook[i]);
			}
			for (var i = 0; i < loc_gyoungnam.length; i++) {
				createSeries("경남" + loc_gyoungnam[i], loc_gyoungnam[i]);
			}
			for (var i = 0; i < loc_jeju.length; i++) {
				createSeries("제주" + loc_jeju[i], loc_jeju[i]);
			}

			// Legend
			//chart.legend = new am4charts.Legend();

		}
	</script>
</body>
</html>