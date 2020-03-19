<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="Doctor Search Form Responsive Widget, Audio and Video players, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design">
<title>Main</title>
      <!-- Calendar -->
      <link rel="stylesheet" href="resources/css/jquery-ui.css">

      <!--stylesheets-->
      <link href="resources/css/main_style.css" rel="stylesheet" type="text/css" media="all">
      <link href="//fonts.googleapis.com/css?family=Cuprum:400,700" rel="stylesheet">
      <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<body>

	<!-- 배너 추천 훈련과정 -->
	<div class="container-fluid">
	<div>
		<strong><span>구직자</span> 우수훈련과정</strong>
	</div>
    <div id="carouselExample" class="carouselPrograms carousel slide" data-ride="carousel" data-interval="false">
        <div class="carousel-inner row w-100 mx-auto" role="listbox">
            <div class="carousel-item col-md-4  active">
               <div class="panel panel-default">
                  <div class="panel-thumbnail">
                    <a href="#" title="image 1" class="thumb">
                      <img class="img-fluid mx-auto d-block" src="//via.placeholder.com/600x400?text=1" alt="slide 1">
                    </a>
                  </div>
                </div>
            </div>
            <div class="carousel-item col-md-4 ">
               <div class="panel panel-default">
                  <div class="panel-thumbnail">
                    <a href="#" title="image 3" class="thumb">
                     <img class="img-fluid mx-auto d-block" src="//via.placeholder.com/600x400?text=2" alt="slide 2">
                    </a>
                  </div>
                </div>
            </div>
            <div class="carousel-item col-md-4 ">
               <div class="panel panel-default">
                  <div class="panel-thumbnail">
                    <a href="#" title="image 4" class="thumb">
                     <img class="img-fluid mx-auto d-block" src="//via.placeholder.com/600x400?text=3" alt="slide 3">
                    </a>
                  </div>
                </div>
            </div>
            <div class="carousel-item col-md-4 ">
                <div class="panel panel-default">
                  <div class="panel-thumbnail">
                    <a href="#" title="image 5" class="thumb">
                     <img class="img-fluid mx-auto d-block" src="//via.placeholder.com/600x400?text=4" alt="slide 4">
                    </a>
                  </div>
                </div>
            </div>
            <div class="carousel-item col-md-4 ">
              <div class="panel panel-default">
                  <div class="panel-thumbnail">
                    <a href="#" title="image 6" class="thumb">
                      <img class="img-fluid mx-auto d-block" src="//via.placeholder.com/600x400?text=5" alt="slide 5">
                    </a>
                  </div>
                </div>
            </div>
            <div class="carousel-item col-md-4 ">
               <div class="panel panel-default">
                  <div class="panel-thumbnail">
                    <a href="#" title="image 7" class="thumb">
                      <img class="img-fluid mx-auto d-block" src="//via.placeholder.com/600x400?text=6" alt="slide 6">
                    </a>
                  </div>
                </div>
            </div>
            <div class="carousel-item col-md-4 ">
               <div class="panel panel-default">
                  <div class="panel-thumbnail">
                    <a href="#" title="image 8" class="thumb">
                      <img class="img-fluid mx-auto d-block" src="//via.placeholder.com/600x400?text=7" alt="slide 7">
                    </a>
                  </div>
                </div>
            </div>
             <div class="carousel-item col-md-4  ">
                <div class="panel panel-default">
                  <div class="panel-thumbnail">
                    <a href="#" title="image 2" class="thumb">
                     <img class="img-fluid mx-auto d-block" src="//via.placeholder.com/600x400?text=8" alt="slide 8">
                    </a>
                  </div>
                  
                </div>
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExample" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next text-faded" href="#carouselExample" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</div>




	<!-- 훈련과정 검색 영역 -->
	<h1 class="header-w3ls">
		훈련과정 검색
	</h1>
	<div class="doctor-form">
		<h2 class="doctor-list-w3l">조건검색</h2>
        <form action="#" method="post" class="srch-area">
        	<div class="main">
        		<div class="form-left-to-w3l">
        			<input type="text" name="name" placeholder="훈련기관" required="">
                  <div class="clear"></div>
                  <input type="text" name="name" placeholder="훈련과정" required="">
                  <div class="clear"></div>
        		</div>
                <div class="form-right-to-w3l">
               </div>
               <div class="form-right-to-w3l">
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
            </div>
            <div class="main">
               <div class="form-left-to-w3l">
                  <input id="datepicker1" name="text" type="text" placeholder="Select Date" required="" class="hasDatepicker">
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
            <div class="main">
               <div class="form-left-to-w3l">
                  <div class="grid-outs1">
                     <div class="w3-agile1">
                        <label class="rating">Best time to call you</label>
                        <ul>
                           <li>
                              <input type="radio" id="a-option" name="selector1">
                              <label for="a-option">Morning </label>
                              <div class="check"></div>
                           </li>
                           <li>
                              <input type="radio" id="b-option" name="selector1">
                              <label for="b-option">Afternoon</label>
                              <div class="check">
                                 <div class="inside"></div>
                              </div>
                           </li>
                           <li>
                              <input type="radio" id="c-option" name="selector1">
                              <label for="c-option">Evening </label>
                              <div class="check">
                                 <div class="inside"></div>
                              </div>
                           </li>
                        </ul>
                     </div>
                  </div>
                  <div class="clear"></div>
               </div>
               <div class="form-right-to-w3l gap-top">
                  <div class="grid-outs1">
                     <div class="w3-agile1">
                        <label class="rating">I would like to (choose one)</label>
                        <ul>
                           <li>
                              <input type="radio" id="d-option" name="selector2">
                              <label for="d-option">A new patient appointment</label>
                              <div class="check"></div>
                           </li>
                           <li>
                              <input type="radio" id="e-option" name="selector2">
                              <label for="e-option">A routine checkup</label>
                              <div class="check">
                                 <div class="inside"></div>
                              </div>
                           </li>
                           <li>
                              <input type="radio" id="f-option" name="selector2">
                              <label for="f-option">A comprehensive health exam </label>
                              <div class="check">
                                 <div class="inside"></div>
                              </div>
                           </li>
                        </ul>
                     </div>
                     <div class="clear"></div>
                  </div>
                  <div class="clear"></div>
               </div>
            </div>
            <div class="btnn">
               <button type="submit">SEARCH</button><br>
            </div>
         </form>
      </div>
      
      
      
      <!-- 리스트 -->
      <div class="container">
  <h1 class="my-5">Equal card deck height using Bootstrap 4</h1>
   <div class="row">
      <div class="col-lg-4 col-md-6 col-sm-12 p-3">
         <div class="card h-100">
            <img class="card-img-top img-fluid" src="//via.placeholder.com/350x150" alt="img">
            <div class="card-body">
               <h4 class="card-title">Card title</h4>
               <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
            </div>
            <div class="card-footer text-center bg-white">
               <a class="btn btn-outline-secondary" href="#">View all</a>
            </div>
         </div>
      </div>
      <div class="col-lg-4 col-md-6 col-sm-12 p-3">
         <div class="card h-100">
            <img class="card-img-top img-fluid" src="//via.placeholder.com/350x150" alt="img">
            <div class="card-body">
               <h4 class="card-title">Card title</h4>
               <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
            </div>
            <div class="card-footer text-center bg-white">
               <a class="btn btn-outline-secondary" href="#">View all</a>
            </div>
         </div>
      </div>
      <div class="col-lg-4 col-md-6 col-sm-12 p-3">
         <div class="card h-100">
            <img class="card-img-top img-fluid" src="//via.placeholder.com/350x150" alt="img">
            <div class="card-body">
               <h4 class="card-title">Card title</h4>
               <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
            </div>
            <div class="card-footer text-center bg-white">
               <a class="btn btn-outline-secondary" href="#">View all</a>
            </div>
         </div>
      </div>
      <div class="col-lg-4 col-md-6 col-sm-12 p-3">
         <div class="card h-100">
            <img class="card-img-top img-fluid" src="//via.placeholder.com/350x150" alt="img">
            <div class="card-body">
               <h4 class="card-title">Card title</h4>
               <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
            </div>
            <div class="card-footer text-center bg-white">
               <a class="btn btn-outline-secondary" href="#">View all</a>
            </div>
         </div>
      </div>
      <div class="col-lg-4 col-md-6 col-sm-12 p-3">
         <div class="card h-100">
            <img class="card-img-top img-fluid" src="//via.placeholder.com/350x150" alt="img">
            <div class="card-body">
               <h4 class="card-title">Card title</h4>
               <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
            </div>
            <div class="card-footer text-center bg-white">
               <a class="btn btn-outline-secondary" href="#">View all</a>
            </div>
         </div>
      </div>
      <div class="col-lg-4 col-md-6 col-sm-12 p-3">
         <div class="card h-100">
            <img class="card-img-top img-fluid" src="//via.placeholder.com/350x150" alt="img">
            <div class="card-body">
               <h4 class="card-title">Card title</h4>
               <p class="card-text">This is a longer card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
            </div>
            <div class="card-footer text-center bg-white">
               <a class="btn btn-outline-secondary" href="#">View all</a>
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
         });
      </script>
      <!-- //Calendar -->
   
<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div>



<h1>${ar[0].address }</h1>
<h1>${ar[0].yardMan }</h1>
</body>
</html>