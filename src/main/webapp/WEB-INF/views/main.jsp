<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="Doctor Search Form Responsive Widget, Audio and Video players, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design">
<title>Main</title>
      <!-- Calendar -->
      <link rel="stylesheet" href="resources/css/jquery-ui.css">

      <!--stylesheeddddddts-->
      <link rel="stylesheet" href="resources/css/style.css">
      <link href="resources/css/main_style.css" rel="stylesheet" type="text/css" media="all">
      <link href="//fonts.googleapis.com/css?family=Cuprum:400,700" rel="stylesheet">
      <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>
<div class="header">
	<a class="navbar-brand absolute" href="main.inc">
		<span style="font-size: 30px; color: white;">PMD</span>
	</a>
</div>



	<!-- 배너 추천 훈련과정 -->
	<div class="container-fluid">
      <div id="carouselExample" class="carouselPrograms carousel slide"
         data-ride="carousel" data-interval="false">
         <div class="carousel-inner row w-100 mx-auto" role="listbox">
         <c:forEach var="mvo" items="${ar }" varStatus="st">
         	<c:if test="${st.index == 0 }">
            <div class="carousel-item col-md-4 active" style="width: 360px; height: 334px;">
               <div class="panel panel-default">
                  <div class="panel-thumbnail">
                     <div class="card h-100 thumb">
                        <a href="#"> <img class="card-img-top img-fluid mx-auto d-block"
                           src="http://www.hrd.go.kr/comm/com/fileDownload.do?athfilId=9ASjRQApTKgazXp2gwmS1Aw&athfilSeqNo=1" alt="img">${mvo.subTitle }
                        </a>
                        <div class="card-body">
                           <h4 class="card-title">${mvo.title }</h4>
                           <p class="card-text" style="text-align: center;">
                              <span style="font-weight: bold; color: rgba(250, 0, 0, 0.7);">총
                                 훈련비</span> 6,600,000원 <span
                                 style="border-radius: 10px; background-color: rgba(0, 150, 150, 0.7); display: inline-block; width: 50px; color: white; font-size: 0.7em;">모집중</span>
                           </p>
                           <hr />
                           <p class="card-text" style="text-align: center;">훈련기간<br/>
                              2020-01-01 ~ 2020-12-31</p>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            </c:if>
            <c:if test="${st.index > 0 }">
            <div class="carousel-item col-md-4" style="width: 360px; height: 334px;">
               <div class="panel panel-default">
                  <div class="panel-thumbnail">
                     <div class="card h-100 thumb">
                        <a href="#"> <img class="card-img-top img-fluid mx-auto d-block"
                           src="${mvo.vvo.filePath }" alt="img">${mvo.subTitle }
                        </a>
                        <div class="card-body">
                           <h4 class="card-title">${mvo.title }</h4>
                           <p class="card-text" style="text-align: center;">
                              <span style="font-weight: bold; color: rgba(250, 0, 0, 0.7);">총
                                 훈련비</span> 6,600,000원 <span
                                 style="border-radius: 10px; background-color: rgba(0, 150, 150, 0.7); display: inline-block; width: 50px; color: white; font-size: 0.7em;">모집중</span>
                           </p>
                           <hr />
                           <p class="card-text" style="text-align: center;">훈련기간<br/>
                              2020-01-01 ~ 2020-12-31</p>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            </c:if>
            </c:forEach>
            
            
         </div>
         
         <a class="carousel-control-prev" href="#carouselExample"
            role="button" data-slide="prev"> <span
            class="carousel-control-prev-icon" aria-hidden="true"></span> <span
            class="sr-only">Previous</span>
         </a> <a class="carousel-control-next text-faded" href="#carouselExample"
            role="button" data-slide="next"> <span
            class="carousel-control-next-icon" aria-hidden="true"></span> <span
            class="sr-only">Next</span>
         </a>
      </div>
   </div>




	<!-- 훈련과정 검색 영역 -->
	<div class="doctor-form">
		<h2 class="doctor-list-w3l">훈련과정검색</h2>
        <form action="#" method="post" class="srch-area">
        	<div class="main">
        		<div class="form-left-to-w3l">
        			<input type="text" name="inoNm" placeholder="훈련기관" />
                    <div class="clear"></div>
        		</div>
        		<div class="form-left-to-w3l">
        			<input type="text" name="trprNm" placeholder="훈련과정" />
                	<div class="clear"></div>
        		</div>
            </div>
            <div class="main">
               <div class="form-left-to-w3l">
                  <select class="form-control">
                     <option value="">훈련유형</option>
                     <option>국민내일배움카드(구직자)</option>
                     <option>국가기간전략산업직종</option>
                     <option>컨소시엄 채용예정자</option>
                     <option>폴리텍대학훈련</option>
                     <option>청년취업아카데미</option>
                     <option>장애인직업능력지원훈련</option>
                     <option>건설일용근로자기능향상</option>
                     <option>지역맞춤형일자리창출</option>
                     <option>지역구직자</option>
                  </select>
               </div>
               <div class="form-right-to-w3l">
					 <select class="form-control">
	                     <option value="">NCS직무</option>
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
            <div class="main">
               <div class="form-left-to-w3l">
                  <input id="datepicker1" name="text" type="text" placeholder="훈련시작" required="" class="hasDatepicker">
               </div>
               <div class="form-right-to-w3l">
                  <select class="form-control buttom" title="훈련지역 시도" >
                     <option value="">
                     	훈련지역 시도
                     </option>
                     <option value="11">서울</option>
					 <option value="26">부산</option>
					 <option value="27">대구</option>
					 <option value="28">인천</option>
					 <option value="29">광주</option>
					 <option value="30">대전</option>
					 <option value="31">울산</option>
					 <option value="36">세종</option>
					 <option value="41">경기</option>
					 <option value="42">강원</option>
					 <option value="43">충북</option>
					 <option value="44">충남</option>
					 <option value="45">전북</option>
					 <option value="46">전남</option>
					 <option value="47">경북</option>
					 <option value="48">경남</option>
					 <option value="50">제주</option>
                  </select>
                  <div class="clear"></div>
               </div>
            </div>
            <div class="clear"></div>
            
            <div class="btnn">
               <button type="button" onclick="">SEARCH</button><br>
            </div>
         </form>
      </div>
      
      
      
     <!-- 리스트 -->
      <div class="container">
 <h1 class="my-5" style="font-weight: bold;">검색 결과</h1>
  <hr/>
   <div class="row">
      <div class="col-lg-4 col-md-6 col-sm-12 p-3">
         <div class="card h-100">
            <a href="#">
               <img class="card-img-top img-fluid" src="//via.placeholder.com/350x150" alt="img">
            </a>
            <div class="card-body">
               <h4 class="card-title">과정명</h4>
               <p class="card-text" style="text-align: center;">
                     <span style="font-weight: bold; color: rgba(250, 0, 0, 0.7);">총 훈련비</span> 6,600,000원
                     <span style="border-radius: 10px; background-color: rgba(0, 150, 150,  0.7); display: inline-block; width: 50px; color: white; font-size: 0.7em;">모집중</span>
                  </p>
               <hr/>
               <p class="card-text" style="text-align: center;">훈련기간 2020-01-01 ~ 2020-12-31</p>
            </div>
         </div>
      </div>
      <div class="col-lg-4 col-md-6 col-sm-12 p-3">
         <div class="card h-100">
            <a href="#">
               <img class="card-img-top img-fluid" src="//via.placeholder.com/350x150" alt="img">
            </a>
            <div class="card-body">
               <h4 class="card-title">과정명</h4>
               <p class="card-text" style="text-align: center;">
                     <span style="font-weight: bold; color: rgba(250, 0, 0, 0.7);">총 훈련비</span> 6,600,000원
                     <span style="border-radius: 10px; background-color: rgba(0, 150, 150,  0.7); display: inline-block; width: 50px; color: white; font-size: 0.7em;">모집중</span>
                  </p>
               <hr/>
               <p class="card-text" style="text-align: center;">훈련기간 2020-01-01 ~ 2020-12-31</p>
            </div>
         </div>
      </div>
      <div class="col-lg-4 col-md-6 col-sm-12 p-3">
         <div class="card h-100">
            <a href="#">
               <img class="card-img-top img-fluid" src="//via.placeholder.com/350x150" alt="img">
            </a>
            <div class="card-body">
               <h4 class="card-title">과정명</h4>
               <p class="card-text" style="text-align: center;">
                     <span style="font-weight: bold; color: rgba(250, 0, 0, 0.7);">총 훈련비</span> 6,600,000원
                     <span style="border-radius: 10px; background-color: rgba(0, 150, 150,  0.7); display: inline-block; width: 50px; color: white; font-size: 0.7em;">모집중</span>
                  </p>
               <hr/>
               <p class="card-text" style="text-align: center;">훈련기간 2020-01-01 ~ 2020-12-31</p>
            </div>
         </div>
      </div>
      <div class="col-lg-4 col-md-6 col-sm-12 p-3">
         <div class="card h-100">
            <a href="#">
               <img class="card-img-top img-fluid" src="//via.placeholder.com/350x150" alt="img">
            </a>
            <div class="card-body">
               <h4 class="card-title">과정명</h4>
               <p class="card-text" style="text-align: center;">
                     <span style="font-weight: bold; color: rgba(250, 0, 0, 0.7);">총 훈련비</span> 6,600,000원
                     <span style="border-radius: 10px; background-color: rgba(0, 150, 150,  0.7); display: inline-block; width: 50px; color: white; font-size: 0.7em;">모집중</span>
                  </p>
               <hr/>
               <p class="card-text" style="text-align: center;">훈련기간 2020-01-01 ~ 2020-12-31</p>
            </div>
         </div>
      </div>
      <div class="col-lg-4 col-md-6 col-sm-12 p-3">
         <div class="card h-100">
            <a href="#">
               <img class="card-img-top img-fluid" src="//via.placeholder.com/350x150" alt="img">
            </a>
            <div class="card-body">
               <h4 class="card-title">과정명</h4>
               <p class="card-text" style="text-align: center;">
                     <span style="font-weight: bold; color: rgba(250, 0, 0, 0.7);">총 훈련비</span> 6,600,000원
                     <span style="border-radius: 10px; background-color: rgba(0, 150, 150,  0.7); display: inline-block; width: 50px; color: white; font-size: 0.7em;">모집중</span>
                  </p>
               <hr/>
               <p class="card-text" style="text-align: center;">훈련기간 2020-01-01 ~ 2020-12-31</p>
            </div>
         </div>
      </div>
      <div class="col-lg-4 col-md-6 col-sm-12 p-3">
         <div class="card h-100">
            <a href="#">
               <img class="card-img-top img-fluid" src="//via.placeholder.com/350x150" alt="img">
            </a>
            <div class="card-body">
               <h4 class="card-title">과정명</h4>
               <p class="card-text" style="text-align: center;">
                     <span style="font-weight: bold; color: rgba(250, 0, 0, 0.7);">총 훈련비</span> 6,600,000원
                     <span style="border-radius: 10px; background-color: rgba(0, 150, 150,  0.7); display: inline-block; width: 50px; color: white; font-size: 0.7em;">모집중</span>
                  </p>
               <hr/>
               <p class="card-text" style="text-align: center;">훈련기간 2020-01-01 ~ 2020-12-31</p>
            </div>
         </div>
      </div>
      <div class="col-lg-4 col-md-6 col-sm-12 p-3">
         <div class="card h-100">
            <a href="#">
               <img class="card-img-top img-fluid" src="//via.placeholder.com/350x150" alt="img">
            </a>
            <div class="card-body">
               <h4 class="card-title">과정명</h4>
               <p class="card-text" style="text-align: center;">
                     <span style="font-weight: bold; color: rgba(250, 0, 0, 0.7);">총 훈련비</span> 6,600,000원
                     <span style="border-radius: 10px; background-color: rgba(0, 150, 150,  0.7); display: inline-block; width: 50px; color: white; font-size: 0.7em;">모집중</span>
                  </p>
               <hr/>
               <p class="card-text" style="text-align: center;">훈련기간 2020-01-01 ~ 2020-12-31</p>
            </div>
         </div>
      </div>
      <div class="col-lg-4 col-md-6 col-sm-12 p-3">
         <div class="card h-100">
            <a href="#">
               <img class="card-img-top img-fluid" src="//via.placeholder.com/350x150" alt="img">
            </a>
            <div class="card-body">
               <h4 class="card-title">과정명</h4>
               <p class="card-text" style="text-align: center;">
                     <span style="font-weight: bold; color: rgba(250, 0, 0, 0.7);">총 훈련비</span> 6,600,000원
                     <span style="border-radius: 10px; background-color: rgba(0, 150, 150,  0.7); display: inline-block; width: 50px; color: white; font-size: 0.7em;">모집중</span>
                  </p>
               <hr/>
               <p class="card-text" style="text-align: center;">훈련기간 2020-01-01 ~ 2020-12-31</p>
            </div>
         </div>
      </div>
      <div class="col-lg-4 col-md-6 col-sm-12 p-3">
         <div class="card h-100">
            <a href="#">
               <img class="card-img-top img-fluid" src="//via.placeholder.com/350x150" alt="img">
            </a>
            <div class="card-body">
               <h4 class="card-title">과정명</h4>
               <p class="card-text" style="text-align: center;">
                     <span style="font-weight: bold; color: rgba(250, 0, 0, 0.7);">총 훈련비</span> 6,600,000원
                     <span style="border-radius: 10px; background-color: rgba(0, 150, 150,  0.7); display: inline-block; width: 50px; color: white; font-size: 0.7em;">모집중</span>
                  </p>
               <hr/>
               <p class="card-text" style="text-align: center;">훈련기간 2020-01-01 ~ 2020-12-31</p>
            </div>
         </div>
      </div>
      <div class="col-lg-4 col-md-6 col-sm-12 p-3">
         <div class="card h-100">
            <a href="#">
               <img class="card-img-top img-fluid" src="//via.placeholder.com/350x150" alt="img">
            </a>
            <div class="card-body">
               <h4 class="card-title">과정명</h4>
               <p class="card-text" style="text-align: center;">
                     <span style="font-weight: bold; color: rgba(250, 0, 0, 0.7);">총 훈련비</span> 6,600,000원
                     <span style="border-radius: 10px; background-color: rgba(0, 150, 150,  0.7); display: inline-block; width: 50px; color: white; font-size: 0.7em;">모집중</span>
                  </p>
               <hr/>
               <p class="card-text" style="text-align: center;">훈련기간 2020-01-01 ~ 2020-12-31</p>
            </div>
         </div>
      </div>
      <div class="col-lg-4 col-md-6 col-sm-12 p-3">
         <div class="card h-100">
            <a href="#">
               <img class="card-img-top img-fluid" src="//via.placeholder.com/350x150" alt="img">
            </a>
            <div class="card-body">
               <h4 class="card-title">과정명</h4>
               <p class="card-text" style="text-align: center;">
                     <span style="font-weight: bold; color: rgba(250, 0, 0, 0.7);">총 훈련비</span> 6,600,000원
                     <span style="border-radius: 10px; background-color: rgba(0, 150, 150,  0.7); display: inline-block; width: 50px; color: white; font-size: 0.7em;">모집중</span>
                  </p>
               <hr/>
               <p class="card-text" style="text-align: center;">훈련기간 2020-01-01 ~ 2020-12-31</p>
            </div>
         </div>
      </div>
      <div class="col-lg-4 col-md-6 col-sm-12 p-3">
         <div class="card h-100">
            <a href="#">
               <img class="card-img-top img-fluid" src="//via.placeholder.com/350x150" alt="img">
            </a>
            <div class="card-body">
               <h4 class="card-title">과정명</h4>
               <p class="card-text" style="text-align: center;">
                     <span style="font-weight: bold; color: rgba(250, 0, 0, 0.7);">총 훈련비</span> 6,600,000원
                     <span style="border-radius: 10px; background-color: rgba(0, 150, 150,  0.7); display: inline-block; width: 50px; color: white; font-size: 0.7em;">모집중</span>
                  </p>
               <hr/>
               <p class="card-text" style="text-align: center;">훈련기간 2020-01-01 ~ 2020-12-31</p>
            </div>
         </div>
      </div>
      
   </div>
</div>
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      <div class="copy">
         <p>© 2018 Doctor Search Form. All Rights Reserved | Design by <a href="http://www.W3Layouts.com" target="_blank">W3Layouts</a></p>
      </div>
      
      
      <!--scripts-->
      <script src="resources/js/jquery-3.4.1.min.js"></script>
      <script src="resources/js/jquery-ui.min.js"></script>
      <script>
		addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); }
	  </script>
	  <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
      <script>
         $(function() {
         $( "#datepicker,#datepicker1,#datepicker2,#datepicker3" ).datepicker();
      $('#carouselExample').on('slide.bs.carousel', function (e) {

             
               var $e = $(e.relatedTarget);
               var idx = $e.index();
               var itemsPerSlide = 3;
               var totalItems = $('.carousel-item').length;
               
               if (idx >= totalItems-(itemsPerSlide-1)) {
                   var it = itemsPerSlide - (totalItems - idx);
                   for (var i=0; i<it; i++) {
                       // append slides to end
                       if (e.direction=="left") {
                           $('.carousel-item').eq(i).appendTo('.carousel-inner');
                       }
                       else {
                           $('.carousel-item').eq(0).appendTo('.carousel-inner');
                       }
                   }
               }
           });

             $(document).ready(function() {
           /* show lightbox when clicking a thumbnail */
               $('a.thumb').click(function(event){
                 event.preventDefault();
                 var content = $('.modal-body');
                 content.empty();
                   var title = $(this).attr("title");
                   $('.modal-title').html(title);        
                   content.html($(this).html());
                   $(".modal-profile").modal({show:true});
               });

             });
         });
      </script>
   
<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div>



<h1>${ar[0].address }</h1>
<h1>${ar[0].yardMan }</h1>
</body>
</html>