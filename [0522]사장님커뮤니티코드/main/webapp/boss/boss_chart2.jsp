<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
	<style>
  @import
	url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@300&display=swap')
	; 
</style>
<meta charset="UTF-8">

<title>Chart.js Test</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<!-- 재방문율 차트 -->
	 <!-- 이번달,지난달 재방문율 차트 조회 -->
	<script type="text/javascript">
	google.charts.load('current', { 'packages': ['corechart'] });
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
        var storeId = '<%= session.getAttribute("store_id") %>';
        var encodedStoreId = encodeURIComponent(storeId);
        $.ajax({
            url: 'returnCustomerCount/' + encodedStoreId,
            type: 'GET',
            dataType: 'json',
            success: function (response) {
            	console.log(response);
            
            	var thisMonthNewCustomers = response.thisMonthNew.new_customers;  /* 이번달 신규 고객 수 */
            	var thisMonthReturningCustomers = response.thisMonthReturning.returning_customers; /* 이번달 재방문 고객 수 */

            	var lastMonthNewCustomers = response.lastMonthNew.new_customers; /* 저번달 신규 고객 수 */
            	var lastMonthReturningCustomers = response.lastMonthReturning.returning_customers; /* 저번달 재방문 고객 수 */

            	/* 재방문 고객 증가율 */
            	var returningCustomerGrowth; 
            	if (lastMonthReturningCustomers === 0) {
            	  returningCustomerGrowth = thisMonthReturningCustomers > 0 ? 100 : 0;
            	} else {
            	  returningCustomerGrowth = (thisMonthReturningCustomers - lastMonthReturningCustomers) / lastMonthReturningCustomers * 100;
            	}
            	console.log(returningCustomerGrowth);

            	/* 신규 고객 증가율 */
            	var newCustomerGrowth; 
            	if (lastMonthNewCustomers === 0) {
            	  newCustomerGrowth = thisMonthNewCustomers > 0 ? 100 : 0;
            	} else {
            	  newCustomerGrowth = (thisMonthNewCustomers - lastMonthNewCustomers) / lastMonthNewCustomers * 100; 
            	}

                /* 도넛 차트 데이터 생성 */
                var data = google.visualization.arrayToDataTable([
                    ['Customer', 'Count'],
                    ['신규주문\n'+returningCustomerGrowth.toFixed(2) + '%', thisMonthNewCustomers],
                    ['재주문\n'+newCustomerGrowth.toFixed(2) + '%', thisMonthReturningCustomers]
                ]);

                 /* 도넛 차트 옵션 */
                var options = {
                    title: '재주문율 비교',
                    pieHole: 0.3,
                    stroke: {
                        0: { color: '#0064FF' }, // 이번달 선 색상
                        1: { color: '#FF9100' }  // 저번달 선 색상
                    }
                };

                /* 도넛 차트 그리기 */
                var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
                chart.draw(data, options);

                /* HTML 태그에 데이터 설정 */
                document.getElementById('returningCustomerGrowth').textContent = '재방문 고객 증가율: ' + returningCustomerGrowth.toFixed(2) + '%';
                document.getElementById('newCustomerGrowth').textContent = '신규 고객 증가율: ' + newCustomerGrowth.toFixed(2) + '%';
            },
            error: function (error) {
                console.log(error);
            }
        });
    }
</script>
<!-- 재방문율 -->
	 <!-- 2~5번 방문한 단골고객의 수 차트 -->
	<script type="text/javascript">
	 google.charts.load("current", {packages:['corechart']});
	    google.charts.setOnLoadCallback(drawChart);
	    function drawChart() {
	    	var storeId = '<%= session.getAttribute("store_id") %>';
	        var encodedStoreId = encodeURIComponent(storeId);
	        $.ajax({
	            url: 'orderCount/' + encodedStoreId,
	            type: 'GET',
	            dataType: 'json',
	            success: function (response) {
	            	console.log(response);
	            	var twoOrders = response.twoOrders.twoOrderCustomers;  /* 2번주문한 고객 수 */
	            	var threeOrders = response.threeOrders.threeOrderCustomers; /* 3번주문한 고객 수 */
	            	var fourOrders = response.fourOrders.fourOrderCustomers; /* 4번주문한 고객 수 */
	            	var fiveOrders = response.fiveOrders.fiveOrderCustomers; /* 5번주문한 고객 수 */
	            	
				      var data = google.visualization.arrayToDataTable([
				        ["Element", "방문횟수", { role: "style" } ],
				        ["2번", twoOrders, "#b87333"],
				        ["3번", threeOrders, "silver"],
				        ["4번", fourOrders, "gold"],
				        ["5번", fiveOrders, "color: #e5e4e2"]
				      ]);
			
				      var view = new google.visualization.DataView(data);
				      view.setColumns([0, 1,
				                       { calc: "stringify",
				                         sourceColumn: 1,
				                         type: "string",
				                         role: "annotation" },
				                       2]);
			
				      var options = {
				        title: "여러번 방문한 단골손님",
				        width: 600,
				        height: 400,
				        bar: {groupWidth: "95%"},
				        legend: { position: "none" },
				      };
				      var chart = new google.visualization.ColumnChart(document.getElementById("여러번주문차트"));
				      chart.draw(view, options);
				  },
				  error: function (error) {
		                console.log(error);
		            }
		        });
		    }
</script>
	<!-- 재방문율 차트 -->
	 <!-- 이번달,저번달 신규회원 주문건수,총액 / 재주문 회원 주문건수, 총액 -->
<script type="text/javascript">
google.charts.load("current", {packages:['corechart']});
google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
        var storeId = '<%= session.getAttribute("store_id") %>';
        var encodedStoreId = encodeURIComponent(storeId);
        $.ajax({
            url: 'orderTotal/' + encodedStoreId,
            type: 'GET',
            dataType: 'json',
            success: function (response) {
            	console.log(response);
            	/* 신규고객 */
            	var thisMonthNewOrder = response.thisMonthNewTotal.newOrdersThisMonth;  /* 이번달 신규 고객 주문수 */
            	var thisMonthNewTotal = response.thisMonthNewTotal.newOrderTotalThisMonth;  /* 이번달 신규 고객 총 결제금액 */
            	var lastMonthNewOrder = response.lastMonthNewTotal.newOrdersLastMonth; /* 지난달 신규 고객 주문수 */
            	var lastMonthNewTotal = response.lastMonthNewTotal.newOrdersTotalLastMonth; /* 지난달 신규 고객 총 결제금액 */
				/* 재주문고객  */
            	var thisMonthReturnOrder = response.thisMonthReturnTotal.returningOrdersThisMonth; /* 이번달 재주문 고객 주문수 */
            	var thisMonthReturnTotal = response.thisMonthReturnTotal.returningOrderTotalThisMonth; /* 이번달 재주문 고객 총 결제금액 */
            	var lastMonthReturnOrder = response.lastMonthReturnTotal.returningOrdersLastMonth; /* 저번달 재주문 고객 주문수 */
            	var lastMonthReturnTotal = response.lastMonthReturnTotal.returningOrderTotalLastMonth; /* 저번달 재주문 고객 총 결제금액 */
				console.log(thisMonthNewOrder);
            	/* 여기서부터 로직 짜야댐 */
            	/* 신규 고객 결제금액 증가율 */
				var newOrderTotalGrowth; 
				if (lastMonthNewTotal === 0) {
				    newOrderTotalGrowth = thisMonthNewTotal > 0 ? 100 : 0;
				} else {
				    newOrderTotalGrowth = (thisMonthNewTotal - lastMonthNewTotal) / lastMonthNewTotal * 100; 
				}
				
				/* 신규 고객 주문건 증가율 */
				var newOrderCountGrowth; 
				if (lastMonthNewOrder === 0) {
				    newOrderCountGrowth = thisMonthNewOrder > 0 ? 100 : 0;
				} else {
				    newOrderCountGrowth = (thisMonthNewOrder - lastMonthNewOrder) / lastMonthNewOrder * 100; 
				}
				
				/* 재주문 고객 결제 금액증가율 */
				var returnOrderTotalGrowth; 
				if (lastMonthReturnTotal === 0) {
				    returnOrderTotalGrowth = thisMonthReturnTotal > 0 ? 100 : 0;
				} else {
				    returnOrderTotalGrowth = (thisMonthReturnTotal - lastMonthReturnTotal) / lastMonthReturnTotal * 100;
				}
				console.log(returnOrderTotalGrowth);
				
				/* 재주문 고객 주문건 증가율 */
				var returnOrderCountGrowth; 
				if (lastMonthReturnOrder === 0) {
				    returnOrderCountGrowth = thisMonthReturnOrder > 0 ? 100 : 0;
				} else {
				    returnOrderCountGrowth = (thisMonthReturnOrder - lastMonthReturnOrder) / lastMonthReturnOrder * 100;
				}
				console.log(returnOrderCountGrowth);



                /* HTML 태그에 데이터 설정 */
				/* 신규 고객 주문수와 총 결제금액을 HTML에 출력 */
				document.getElementById('thisMonthNewOrder').textContent = '이번달 신규 고객 주문수: ' + thisMonthNewOrder;
				document.getElementById('thisMonthNewTotal').textContent = '이번달 신규 고객 총 결제금액: ' + thisMonthNewTotal + '원';

				/* 지난달 신규 고객 주문수와 총 결제금액을 HTML에 출력 */
				document.getElementById('lastMonthNewOrder').textContent = '지난달 신규 고객 주문수: ' + lastMonthNewOrder;
				document.getElementById('lastMonthNewTotal').textContent = '지난달 신규 고객 총 결제금액: ' + lastMonthNewTotal + '원';

				/* 이번달 재주문 고객 주문수와 총 결제금액을 HTML에 출력 */
				document.getElementById('thisMonthReturnOrder').textContent = '이번달 재주문 고객 주문수: ' + thisMonthReturnOrder;
				document.getElementById('thisMonthReturnTotal').textContent = '이번달 재주문 고객 총 결제금액: ' + thisMonthReturnTotal + '원';

				/* 지난달 재주문 고객 주문수와 총 결제금액을 HTML에 출력 */
				document.getElementById('lastMonthReturnOrder').textContent = '저번달 재주문 고객 주문수: ' + lastMonthReturnOrder;
				document.getElementById('lastMonthReturnTotal').textContent = '저번달 재주문 고객 총 결제금액: ' + lastMonthReturnTotal + '원';

				/* 증가율을 HTML에 출력 */
				document.getElementById('newOrderTotalGrowth').textContent = '신규 고객 결제금액 증가율: ' + newOrderTotalGrowth.toFixed(2) + '%';
				document.getElementById('newOrderCountGrowth').textContent = '신규 고객 주문건 증가율: ' + newOrderCountGrowth.toFixed(2) + '%';
				document.getElementById('returnOrderTotalGrowth').textContent = '재주문 고객 결제 금액증가율: ' + returnOrderTotalGrowth.toFixed(2) + '%';
				document.getElementById('returnOrderCountGrowth').textContent = '재주문 고객 주문건 증가율: ' + returnOrderCountGrowth.toFixed(2) + '%';

            },
            error: function (error) {
                console.log(error);
            }
        });
    }
</script>

</head>
<body>
<div id="thisMonthNewOrder"></div>
	<div id="thisMonthNewTotal"></div>
	<div id="lastMonthNewOrder"></div>
	<div id="lastMonthNewTotal"></div>
	<div id="thisMonthReturnOrder"></div>
	<div id="thisMonthReturnTotal"></div>
	<div id="lastMonthReturnOrder"></div>
	<div id="lastMonthReturnTotal"></div>
	<div id="newOrderTotalGrowth"></div>
	<div id="newOrderCountGrowth"></div>
	<div id="returnOrderTotalGrowth"></div>
	<div id="returnOrderCountGrowth"></div>
<div class="container">
	<table>
	<tr>
	<td><div class="col-md-6"><div id="donutchart" style="width: 500px; height: 300px;"></div></div></td>
	<td><div class="col-md-6"><div id="여러번주문차트" style="width: 500px; height: 300px;"></div></div></td>
	</tr>
	<tr class="col-md-6">
	<td>
	<div class="text-bg-warning p-3">
	<div id="returningCustomerGrowth"></div></div></td></tr>
	<tr><td>
	<div class="text-bg-primary p-3">
	<div id="newCustomerGrowth"></div></div>
	</td></tr>
	</table>
	
	
	
	
	
	</div>
</body>
</html>