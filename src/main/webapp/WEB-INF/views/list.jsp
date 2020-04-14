<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>${board_name } 게시물 목록</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700,800|Playfair+Display:,300, 400, 700" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/bootstrap.css">
    <link rel="stylesheet" href="resources/css/animate.css">
    <link rel="stylesheet" href="resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/mediaelementplayer.min.css">
    <link rel="stylesheet" href="resources/fonts/ionicons/css/ionicons.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
    <link rel="stylesheet" href="resources/fonts/fontawesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="resources/css/jquery-ui.css"/>
	<!-- 메뉴바 관련 추가 -->
	<link href="http://fonts.googleapis.com/css?family=Didact+Gothic" rel="stylesheet">
	<link href="resources/css/fonts.css" rel="stylesheet" type="text/css" media="all">
	<link href="resources/css/default.css" rel="stylesheet" type="text/css" media="all">
	
	<link rel="stylesheet" href="resources/fonts/fontawesome/css/all.min.css">
	
	<!-- 페이징 css적용 -->
	<link rel="stylesheet" href="resources/css/text.css"/>
    <!-- Theme Style -->
    <link rel="stylesheet" href="resources/css/style.css">
    
    <style type="text/css">
    	#t1{
    		width: 100%;
    		border-collapse: collapse;
    		font-size: 18px;
    		color: #000;
    	}
    	
    	#t1 caption{
    		text-indent: -9999px;
    		height: 0;
    	}
    	
    	#t1 th, #t1 tbody td:last-child, #t1 tbody td:first-child, #t1 tbody td:nth-child(3){
    		text-align: center;
    	}
    	
    	#t1 th, #t1 td{
    		border: 1px solid #ccc;
    		padding: 20px;
    		color: black;
    	}
    	
    	#t1 tbody td a{
    		color: black;
    	}
    	
    	#t1 tbody tr:hover {
			background-color: #eee;
		}
		
		#t1 tfoot tr, #t1 tfoot td{
			border: none;
		}
		.pagination-v4 > li > a.active,
		.pagination-v4 > li > a:hover,
		.pagination-v4 > li > span:hover,
		.pagination-v4 > li > a:focus,
		.pagination-v4 > li > span:focus {
			 cursor: pointer;
			 border-color: #fff;
		}
    </style>
  </head>
  <body>
    
    <jsp:include page="menubar.jsp"/>
   
   <div class="container" style="padding: 0;"> 
    <section class="home-slider owl-carousel">
      <div class="slider-item" style="background-image: url('resources/images/mario.gif'); background-size: 30%;">
        <div class="container">
          <div class="row slider-text align-items-center justify-content-center">
            <div class="col-md-8 text-center col-sm-12 element-animate">
              <h1 style="font-family: inherit;"></h1>
              <p class="mb-5"></p>
            </div>
          </div>
        </div>
      </div>
    </section>
   </div> 
    
    <section class="section element-animate">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
	          <div>
		          <h2 class="title" style="margin-bottom: 50px;">${board_name } 게시물 목록</h2>
		          <table id="t1">
		          	<caption>${board_name }게시물 목록</caption>
		          	<colgroup>
		          		<col width="50px"/>
		          		<col width="*"/>
		          		<col width="250px"/>
		          		<col width="150px"/>
		          		<col width="100px"/>
		          	</colgroup>
		          	<thead>
		          		<tr>
		          			<th></th>
		          			<th>제&nbsp;&nbsp;&nbsp;&nbsp;목</th>
		          			<th>글쓴이</th>
		          			<th>날&nbsp;&nbsp;짜</th>
		          			<th>조회수</th>
		          		</tr>
		          	</thead>
		          	
		          	<tbody>
		          		<c:if test="${fn:length(list) > 0 }">
			   				<c:forEach var="vo" items="${list }" varStatus="st">
								<tr>
								  <td>
									${rowTotal - ((nowPage-1)*blockList+st.index) }
								  </td>
								  <td>
								  <c:if test='${vo.secret_content eq 1 && b_category eq "adv"}'>
									 <c:set value="${sessionScope.userInfo }" var="uvo" />
									 <c:if test="${vo.u_idx eq uvo.u_idx  }">
										 <a href="viewBoard.inc?b_idx=${vo.b_idx }&nowPage=${nowPage}&b_category=${b_category}" > 
											${vo.subject }
										 </a>
										 <c:if test="${fn:length(vo.c_list) > 0 }">
										 	&nbsp;<span style="font-weight: bold; color: #6a99cb">(${comm_ar[st.index] })</span>
										 </c:if>
									 </c:if>
									 <c:if test="${vo.u_idx ne uvo.u_idx  }">
										${vo.subject }
									 </c:if>
									 
									<i class="fas fa-lock fa-lg" style="color: rgba(38,81,168, 0.8)"></i>
								  </c:if>
								  
								   <c:if test="${'광고문의' ne board_name || vo.secret_content ne 1}">
									 <a href="viewBoard.inc?b_idx=${vo.b_idx }&nowPage=${nowPage}&b_category=${b_category}"> 
										${vo.subject }
									 </a>
									 <c:if test="${fn:length(vo.c_list) > 0 }">
									 	&nbsp;<span style="font-weight: bold; color: #6a99cb">(${comm_ar[st.index] })</span>
									 </c:if>
								  </c:if>
								  </td>
								  <td>${vo.uvo.nickname }</td>
								  <td>${fn:substring(vo.write_date, 0, 10) }</td>
								  <td>${vo.hit }</td>
								</tr>
			   				</c:forEach>
		   				</c:if>
			   			<c:if test="${empty list }">
							<tr>
							  <td colspan="5" height="70" align="center">등록된 게시물이 없습니다.</td>
							</tr>
			   			</c:if>
		          	</tbody>
		          	<tfoot>
		          		<tr>
		          			<td colspan="4">
		          				<div class="pagination-wrap">
						         ${pageCode }
						        </div>
		          			</td>
		          			<td>
		          				<c:if test="${userInfo ne null }">
		          					<input type="button" class="btn btn-primary" value="글쓰기" style="font-size: 15px; cursor: pointer;" 
		          					onclick="javascript: location.href='write.inc?nowPage=${nowPage}&b_category=${b_category }'"/>	
		          				</c:if>
		          			</td>
		          		</tr>
		          	</tfoot>
		          </table>
	        </div>
          </div>

        </div>

        
      </div>
    </section>
    
	<jsp:include page="footer.jsp"/>

    <!-- loader -->
    <div id="loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#f4b214"/></svg></div>

    <script src="resources/js/jquery-3.2.1.min.js"></script>
    <script src="resources/js/popper.min.js"></script>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/owl.carousel.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/mediaelement-and-player.min.js"></script>
    <script src="resources/js/jquery.waypoints.min.js"></script>
    <script src="resources/js/jquery.countdown.min.js"></script>
    <script src="resources/js/main.js"></script>
    <script src="resources/js/jquery-ui.min.js"></script>
    <script>
	    document.addEventListener('DOMContentLoaded', function() {
            var mediaElements = document.querySelectorAll('video, audio'), total = mediaElements.length;

            for (var i = 0; i < total; i++) {
                new MediaElementPlayer(mediaElements[i], {
                    pluginPath: 'https://cdn.jsdelivr.net/npm/mediaelement@4.2.7/build/',
                    shimScriptAccess: 'always',
                    success: function () {
                        var target = document.body.querySelectorAll('.player'), targetTotal = target.length;
                        for (var j = 0; j < targetTotal; j++) {
                            target[j].style.visibility = 'visible';
                        }
              }
            });
            }
        });
	    
	    
	  
	    
    </script>
  </body>
</html>