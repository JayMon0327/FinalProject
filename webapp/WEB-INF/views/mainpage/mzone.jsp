<%@page import="com.mat.zip.mainpage.MzlistVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.right-sidebar {
	float: right;
	width: 300px; /* 우측 UI의 너비를 조절할 수 있습니다. */
}
</style>
</head>


<body>
	<h1>맛집 상세페이지</h1>
	<hr color="green">


	<h3>${vo.name}</h3>

	<button onclick="copyToClipboard('http://localhost:8888/zip/mainpage/mzone?no=' + encodeURIComponent('{vo.no}'))">URL 복사</button>

	<script>
		function copyToClipboard(text) {
			// 가상의 textarea 엘리먼트를 생성하여 클립보드에 텍스트 복사하는 함수
			var textarea = document.createElement('textarea'); // 가상의 textarea 엘리먼트 생성(선택한 내용을 클립보드로 복사하는 메서드 사용)
			textarea.value = text; // textarea에 복사할 텍스트 설정
			document.body.appendChild(textarea); // textarea를 DOM에 추가
			textarea.select(); // textarea 내용을 선택
			document.execCommand('copy'); // 선택한 내용을 클립보드로 복사하는 메서드 사용
			document.body.removeChild(textarea); // 가상의 textarea를 DOM에서 제거(1회성)

			// 복사 완료 메시지 등을 추가로 처리할 수 있습니다.
			alert('URL이 클립보드에 복사되었습니다.'); // 복사 완료 메시지 표시
		}
	</script>

	<button onclick="후기커뮤니티.jsp">후기 및 커뮤니티 바로가기</button>
	<hr color="green">


	
	<!--반복문으로 5개의 이미지 태그를 출력 -->
	<%
	// 변수 초기화
	String name = ""; // 이름을 담을 변수
	int no = 0; // 번호를 담을 변수
	
	// 반복문을 통해 5번 실행
	for (int i = 0; i < 5; i++) {
		// request 객체에서 "vo" 속성을 가져옴
		MzlistVO vo = (MzlistVO) request.getAttribute("vo");
		
		// vo가 null이 아닌 경우 실행
		if (vo != null) {
			// vo에서 이름과 번호를 가져와 변수에 저장
			name = vo.getName();
			no = vo.getNo();
			
			// 이미지 태그를 출력
			out.print("<img src=../resources/img/" + no + name + i + ".jpg style= 'width: 150px; height: 100px;'>");
		}
	}
%>



	<br> 번호 :
	<input name="no" value="${vo.no}">
	<br> 상호명 :
	<input name="name" value="${vo.name}">
	<br> 지번주소 :
	<input name="landNumAddress" value="${vo.landNumAddress}">
	<br> 도로명주소 :
	<input name="roadNumAddress" value="${vo.roadNumAddress}">
	<br> 영업상태 :
	<input name="status" value="${vo.status}">
	<br> 전화번호 :
	<input name="tel" value="${vo.tel}">
	<br> 주요음식 :
	<input name="food" value="${vo.food}">
	<br>




	<div>

		<hr color="green">
		<h2>카테고리별 음식점 검색</h2>
		<h5>
			먹고 싶은 카테고리 검색<br>
		</h5>


		<form action="han.mz">
			<button type="submit" name="food" value="한식">한식 전송</button>
		</form>


		<form action="jjung.mz">
			<button type="submit" name="food" value="중국식">중국식 전송</button>
		</form>


		<form action="ill.mz">
			<button type="submit" name="food" value="일식">일식 전송</button>
		</form>

		<form action="gyung.mz">
			<button type="submit" name="food" value="경양식">경양식 전송</button>
		</form>


		<form action="boon.mz">
			<button type="submit" name="food" value="분식">분식 전송</button>
		</form>

	</div>


	<hr color="green">
	<div>
		<h2>포털 검색으로 매장의 정보 확인하기</h2>

		<button
			onclick="searchOnNaverMaps('${vo.name}', '${vo.landNumAddress}', '${vo.roadNumAddress}')">네이버
		 지도 홈</button>

		<script>
function searchOnNaverMaps(name, landAddress, roadAddress) {
  // 검색어와 주소를 URL 인코딩하여 파라미터로 전달하는 함수
  var encodedName = encodeURIComponent(name);
  var encodedLandAddress = encodeURIComponent(landAddress);
  var encodedRoadAddress = encodeURIComponent(roadAddress);
  
  // 네이버 길찾기 URL
  var naverMapsURL = 'https://map.naver.com/?query=' + encodedName;
  
  // 지번주소와 도로명주소가 일치하는 경우 해당 주소를 추가로 전달
  if (landAddress !== '') {
    naverMapsURL += '&sm=hty&searchCoordType=1&sx=' + encodedLandAddress;
  } else if (roadAddress !== '') {
    naverMapsURL += '&sm=hty&searchCoordType=2&sx=' + encodedRoadAddress;
  }
  
  // URL로 페이지 이동
  location.href = naverMapsURL;
}

</script>

	</div>

	<hr color="green">


	<h2>주변 카페, 음식점 더 보기</h2>

<title>카테고리별 장소 검색하기</title>
    <style>
.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap {position:relative;width:100%;height:350px;}
#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
#category li.on {background: #eee;}
#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
#category li:last-child{margin-right:0;border-right:0;}
#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
#category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
#category li .bank {background-position: -10px 0;}
#category li .mart {background-position: -10px -36px;}
#category li .pharmacy {background-position: -10px -72px;}
#category li .oil {background-position: -10px -108px;}
#category li .cafe {background-position: -10px -144px;}
/* #category li .store {background-position: -10px -180px;} */
#category li .food {background-position: -10px -216px;}
#category li.on .category_bg {background-position-x:-46px;}
.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.placeinfo .tel {color:#0f7833;}
.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
</style>
</head>
<body>
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
    <ul id="category">
        <!-- <li id="BK9" data-order="0"> 
            <span class="category_bg bank"></span>
            은행
        </li>       
        <li id="MT1" data-order="1"> 
            <span class="category_bg mart"></span>
            마트
        </li>  
        <li id="PM9" data-order="2"> 
            <span class="category_bg pharmacy"></span>
            약국
        </li>  
        <li id="OL7" data-order="3"> 
            <span class="category_bg oil"></span>
            주유소
        </li>   -->
        <li id="CE7" data-order="4"> 
            <span class="category_bg cafe"></span>
            카페
        <!-- </li>  
        <li id="CS2" data-order="5"> 
            <span class="category_bg store"></span>
            편의점
        </li>      --> 
        
        <!-- bank 이미지를 썼지만 음식점이라고 부르기로 함 -->
        <li id="FD6" data-order="0"> 
            <span class="category_bg bank"></span>
            음식점
        </li>
    </ul>
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	77203b0d278b8fd803304a030e6d4c61&libraries=services"></script>
<script>
// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
    markers = [], // 마커를 담을 배열입니다
    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
 
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 















//주소를 좌표로 변환하여 지도 위에 마커 표시
//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

var address; // 주소 변수 선언

if ('${vo.landNumAddress}') {
	  address = '${vo.landNumAddress}';
	} 
	else if ( '${vo.roadNumAddress}') {
	  address = '${vo.roadNumAddress}';
	} 
	else {
	  address = ''; // 두 주소 모두 없을 경우 빈 문자열로 설정
	}


if ('${vo.landNumAddress}' || '${vo.roadNumAddress}') {  

//주소로 좌표를 검색합니다
geocoder.addressSearch(address, function(result, status) {

// 정상적으로 검색이 완료됐으면 
if (status === kakao.maps.services.Status.OK) {

   var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

   // 결과값으로 받은 위치를 마커로 표시합니다
   var marker = new kakao.maps.Marker({
       map: map,
       position: coords
   });

   // 인포윈도우로 장소에 대한 설명을 표시합니다
   var infowindow = new kakao.maps.InfoWindow({
       content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.name}</div>'
   });
   infowindow.open(map, marker);

   // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
   map.setCenter(coords);
} 
})
};















// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(map); 

// 지도에 idle 이벤트를 등록합니다
kakao.maps.event.addListener(map, 'idle', searchPlaces);

// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
contentNode.className = 'placeinfo_wrap';

// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

// 커스텀 오버레이 컨텐츠를 설정합니다
placeOverlay.setContent(contentNode);  

// 각 카테고리에 클릭 이벤트를 등록합니다
addCategoryClickEvent();

// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
        target.addEventListener(type, callback);
    } else {
        target.attachEvent('on' + type, callback);
    }
}

// 카테고리 검색을 요청하는 함수입니다
function searchPlaces() {
    if (!currCategory) {
        return;
    }
    
    // 커스텀 오버레이를 숨깁니다 
    placeOverlay.setMap(null);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
        displayPlaces(data);
    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

    } else if (status === kakao.maps.services.Status.ERROR) {
        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
        
    }
}

// 지도에 마커를 표출하는 함수입니다
function displayPlaces(places) {
	
	

    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
    var order = document.getElementById(currCategory).getAttribute('data-order');

    

    for ( var i=0; i<places.length; i++ ) {

            // 마커를 생성하고 지도에 표시합니다
            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

            // 마커와 검색결과 항목을 클릭 했을 때
            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
            (function(marker, place) {
                kakao.maps.event.addListener(marker, 'click', function() {
                    displayPlaceInfo(place);
                });
            })(marker, places[i]);
    }
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, order) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}


// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
function displayPlaceInfo (place) {
    var content = '<div class="placeinfo">' +
                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

    if (place.road_address_name) {
        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
    }  else {
        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
    }                
   
    content += '    <span class="tel">' + place.phone + '</span>' + 
                '</div>' + 
                '<div class="after"></div>';

    contentNode.innerHTML = content;
    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
    placeOverlay.setMap(map);  
}


// 각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() {
    var category = document.getElementById('category'),
        children = category.children;

    for (var i=0; i<children.length; i++) {
        children[i].onclick = onClickCategory;
    }
}

// 카테고리를 클릭했을 때 호출되는 함수입니다
function onClickCategory() {
    var id = this.id,
        className = this.className;

    placeOverlay.setMap(null);

    if (className === 'on') {
        currCategory = '';
        changeCategoryClass();
        removeMarker();
    } else {
        currCategory = id;
        changeCategoryClass(this);
        searchPlaces();
    }
}

// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
function changeCategoryClass(el) {
    var category = document.getElementById('category'),
        children = category.children,
        i;

    for ( i=0; i<children.length; i++ ) {
        children[i].className = '';
    }

    if (el) {
        el.className = 'on';
    } 
}

</script>
</body>


</body>
</html> 