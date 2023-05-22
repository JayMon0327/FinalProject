<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript">
google.charts.load('current', {'packages':['line']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
    var storeId = '<%= session.getAttribute("store_id") %>'; /* 세션에서 storeId 가져오기 */
    var encodedStoreId = encodeURIComponent(storeId);
    console.log('chart/' + encodedStoreId);
    $.ajax({
        url: 'chart/'+ encodedStoreId,
        type: 'GET',
        dataType: 'json',
        success: function(response) {
            /* console.log(response); */
            var data = new google.visualization.DataTable();
            data.addColumn('number', '날짜'); //날짜 대신에 달의 날짜를 표시
            data.addColumn('number', '이번달');
            data.addColumn('number', '저번달');
			
            /* 이번달,저번달 총 매출액  */
            var thisMonthData = response.thisMonthTotal;
			var lastMonthData = response.lastMonthTotal;
			
			var thisMonthTotalAmount = thisMonthData.reduce(function (total, item) {
			    return total + item.total_amount;
			}, 0);
			
			var lastMonthTotalAmount = lastMonthData.reduce(function (total, item) {
			    return total + item.total_amount;
			}, 0);
			
		
            // HTML 태그에 매출액 설정
            document.getElementById('thisMonthTotal').textContent = '이번달 총매출: ' + thisMonthTotalAmount.toLocaleString('ko-KR') + '원';
			document.getElementById('lastMonthTotal').textContent = '저번달 총매출: ' + lastMonthTotalAmount.toLocaleString('ko-KR') + '원';

            
            /* 최근7일간의 이번달과 저번달 매출액  */
            var thisMonthData = response.thisMonth;
            var lastMonthData = response.lastMonth;
            /* reduce함수 */
            var thisMonthDays = thisMonthData.reduce(function(total, item) { return total + item.total_amount; }, 0);
            var lastMonthDays = lastMonthData.reduce(function(total, item) { return total + item.total_amount; }, 0);
         
         	// HTML 태그에 매출액 설정
            document.getElementById('thisMonthDays').textContent = '같은기간 이번달 매출: ' + thisMonthDays.toLocaleString('ko-KR') + '원';
            document.getElementById('lastMonthDays').textContent = '같은기간 저번달 매출: ' + lastMonthDays.toLocaleString('ko-KR') + '원';

            var rows = [];

            for (var i = 0; i < thisMonthData.length; i++) {
                var dateParts = thisMonthData[i].date.split("-");
                if (dateParts.length === 3) {
                    var dayOfMonth = dateParts[2];
                    rows[dayOfMonth] = [parseInt(dayOfMonth), thisMonthData[i].total_amount, null];
                } else {
                    console.log(`날짜 형식이 잘못되었습니다: ${thisMonthData[i].date}`);
                }
            }

            for (var i = 0; i < lastMonthData.length; i++) {
                var dateParts = lastMonthData[i].date.split("-");
                if (dateParts.length === 3) {
                    var dayOfMonth = dateParts[2];
                    if(rows[dayOfMonth]) {
                        rows[dayOfMonth][2] = lastMonthData[i].total_amount;
                    } else {
                        rows[dayOfMonth] = [parseInt(dayOfMonth), null, lastMonthData[i].total_amount];
                    }
                } else {
                    console.log(`날짜 형식이 잘못되었습니다: ${lastMonthData[i].date}`);
                }
            }

              // Add rows to data table
            Object.keys(rows).forEach(function(key) {
    		data.addRow(rows[key]);
			});
                   
           	
            var options = {
                chart: {
                    title: '<%= session.getAttribute("store_id") %>',
                    subtitle: '일별매출, 월별비교'
                },
                width: 1200,
                height: 400,
                hAxis: {
                  //날짜 포맷설정 format:'D' 원하는 문자열 삽입
                   
                },
                vAxis: {
                    format: '#,###'  // Y축 단위변경 
                },
                series: {
                    0: { color: '#0064FF' }, // 이번달 선 색상
                    1: { color: '#FF9100' }  // 저번달 선 색상
                }
            };

            var chart = new google.charts.Line(document.getElementById('linechart_material'));

            chart.draw(data, google.charts.Line.convertOptions(options));
        },
        error: function(error) {
            console.log(error);
        }
    });
}

</script>
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
	



</head>
<body>
	<div class="container">
	<div id="linechart_material" style="width: 1200px; height: 400px"></div>
	<div class="row">
	<table>
	<tr>
	<td>
	<div class="text-bg-primary p-3">
	<div id="thisMonthDays">같은기간 이번달 매출</div>
	<div id="thisMonthTotal">이번달 총 매출</div>
	</div>
	</td>
	<td>
	<div class="text-bg-warning p-3">
	<div id="lastMonthDays">같은기간 저번달 매출</div>
	<div id="lastMonthTotal">저번달 총 매출</div>
	</div></td></tr>
	</table>
	</div>
	</div>
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