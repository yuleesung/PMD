var time; // 슬라이드 넘어가는 시간
var $carouselLi, $carouselLi2, $carouselLi3, $carouselLi4;
var carouselCount, carouselCount2, carouselCount3, carouselCount4; // 캐러셀 사진 갯수
var currentIndex, currentIndex2, currentIndex3, currentIndex4; // 현재 보여지는 슬라이드 인덱스 값
var caInterval, caInterval2, caInterval3, caInterval4;

//사진 연결sadsasagyufiaf

var imgW; // 사진 한장의 너비
$(document).ready(function(){

	carouselInit(300, 2000);
});

$(window).resize(function(){
	carousel_setImgPosition();
});

/* 초기 설정 */
function carouselInit( height, t ){
	/*
	 * height : 캐러셀 높이
	 * t : 사진 전환 간격 
	*/

	time = t;
	$("#carousel_section").height(height); // 캐너셀 높이 설정
	$("#carousel_section2").height(height);
	$("#carousel_section3").height(height);
	$("#carousel_section4").height(height);
	
	$carouselLi = $("#carousel_section > ul >li");
	$carouselLi2 = $("#carousel_section2 > ul >li");
	$carouselLi3 = $("#carousel_section3 > ul >li");
	$carouselLi4 = $("#carousel_section4 > ul >li");
	
	carouselCount = $carouselLi.length; // 캐러셀 사진 갯수
	carouselCount2 = $carouselLi2.length;
	carouselCount3 = $carouselLi3.length;
	carouselCount4 = $carouselLi3.length;
	
	currentIndex = 0; // 현재 보여지는 슬라이드 인덱스 값
	currentIndex2 = 0;
	currentIndex3 = 0;
	currentIndex4 = 0;
	
	carousel_setImgPosition();
	carousel();
}

function carousel_setImgPosition(){

	imgW = $carouselLi.width(); // 사진 한장의 너비
	imgW2 = $carouselLi2.width();
	imgW3 = $carouselLi3.width();
	imgW4 = $carouselLi4.width();
	
	// 이미지 위치 조정
	for(var i = 0; i < carouselCount; i++)
	{
		if( i == currentIndex)
		{
			$carouselLi.eq(i).css("left", 0);
		}
		else
		{
			$carouselLi.eq(i).css("left", imgW);
		}
	}
	
	for(var i = 0; i < carouselCount2; i++)
	{
		if( i == currentIndex2)
		{
			$carouselLi2.eq(i).css("left", 0);
		}
		else
		{
			$carouselLi2.eq(i).css("left", imgW2);
		}
	}
	
	for(var i = 0; i < carouselCount3; i++)
	{
		if( i == currentIndex3)
		{
			$carouselLi3.eq(i).css("left", 0);
		}
		else
		{
			$carouselLi3.eq(i).css("left", imgW3);
		}
	}
	
	for(var i = 0; i < carouselCount4; i++)
	{
		if( i == currentIndex4)
		{
			$carouselLi4.eq(i).css("left", 0);
		}
		else
		{
			$carouselLi4.eq(i).css("left", imgW4);
		}
	}
}

function carousel(){

	// 사진 넘기기
	// 사진 하나가 넘어간 후 다시 꼬리에 붙어야함
	// 화면에 보이는 슬라이드만 보이기
	caInterval = setInterval(function(){
		var left = "-" + imgW;

		//현재 슬라이드를 왼쪽으로 이동 ( 마이너스 지점 )
		$carouselLi.eq(currentIndex).animate( { left: left }, function(){
			// 다시 오른쪽 (제자리)로 이동
			$carouselLi.eq(currentIndex).css("left", imgW);

			if( currentIndex == ( carouselCount - 1 ) )
			{
				currentIndex = 0;
			}
			else
			{
				currentIndex ++;
			}
		} );

		// 다음 슬라이드 화면으로
		if( currentIndex == ( carouselCount - 1 ) )
		{
			// 마지막 슬라이드가 넘어갈땐 처음 슬라이드가 보이도록
			$carouselLi.eq(0).animate( { left: 0 } );
		}
		else
		{
			$carouselLi.eq(currentIndex + 1).animate( { left: 0 } );
		}
	}, time);
	


	caInterval2 = setInterval(function(){
		var left = "-" + imgW2;

		//현재 슬라이드를 왼쪽으로 이동 ( 마이너스 지점 )
		$carouselLi2.eq(currentIndex2).animate( { left: left }, function(){
			// 다시 오른쪽 (제자리)로 이동
			$carouselLi2.eq(currentIndex2).css("left", imgW2);

			if( currentIndex2 == ( carouselCount2 - 1 ) )
			{
				currentIndex2 = 0;
			}
			else
			{
				currentIndex2 ++;
			}
		} );

		// 다음 슬라이드 화면으로
		if( currentIndex2 == ( carouselCount2 - 1 ) )
		{
			// 마지막 슬라이드가 넘어갈땐 처음 슬라이드가 보이도록
			$carouselLi2.eq(0).animate( { left: 0 } );
		}
		else
		{
			$carouselLi2.eq(currentIndex2 + 1).animate( { left: 0 } );
		}
	}, time);
	
	
	
	caInterval3 = setInterval(function(){
		var left = "-" + imgW3;

		//현재 슬라이드를 왼쪽으로 이동 ( 마이너스 지점 )
		$carouselLi3.eq(currentIndex3).animate( { left: left }, function(){
			// 다시 오른쪽 (제자리)로 이동
			$carouselLi3.eq(currentIndex3).css("left", imgW3);

			if( currentIndex3 == ( carouselCount3 - 1 ) )
			{
				currentIndex3 = 0;
			}
			else
			{
				currentIndex3 ++;
			}
		} );

		// 다음 슬라이드 화면으로
		if( currentIndex3 == ( carouselCount3 - 1 ) )
		{
			// 마지막 슬라이드가 넘어갈땐 처음 슬라이드가 보이도록
			$carouselLi3.eq(0).animate( { left: 0 } );
		}
		else
		{
			$carouselLi3.eq(currentIndex3 + 1).animate( { left: 0 } );
		}
	}, time);
	
	caInterval4 = setInterval(function(){
		var left = "-" + imgW4;

		//현재 슬라이드를 왼쪽으로 이동 ( 마이너스 지점 )
		$carouselLi4.eq(currentIndex4).animate( { left: left }, function(){
			// 다시 오른쪽 (제자리)로 이동
			$carouselLi4.eq(currentIndex4).css("left", imgW4);

			if( currentIndex4 == ( carouselCount4 - 1 ) )
			{
				currentIndex4 = 0;
			}
			else
			{
				currentIndex4 ++;
			}
		} );

		// 다음 슬라이드 화면으로
		if( currentIndex4 == ( carouselCount4 - 1 ) )
		{
			// 마지막 슬라이드가 넘어갈땐 처음 슬라이드가 보이도록
			$carouselLi4.eq(0).animate( { left: 0 } );
		}
		else
		{
			$carouselLi4.eq(currentIndex4 + 1).animate( { left: 0 } );
		}
	}, time);
}