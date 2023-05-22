<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script>
    $(document).ready(function() {
        $("#SentimentButton").click(function() {
            var storeId = '<%= session.getAttribute("store_id") %>';
            var encodedStoreId = encodeURIComponent(storeId);

            $.ajax({
                url: 'analyze/' + encodedStoreId,
                type: 'GET',
                dataType: 'json',
                contentType: 'application/json; charset=UTF-8',
                success: function(response) {
                    console.log("성공시 응답받은 데이터: " + JSON.stringify(response, null, 2));
                    // 필드들을 표시할 <div> 요소 가져오기
                    var resultElement = $("#result");

                    // 기존 결과 초기화
                    resultElement.empty();

                    // 통계 변수 초기화
                    var totalCount = response.length;
                    var positiveCount = 0;
                    var negativeCount = 0;
                    var neutralCount = 0;

                    // response 객체를 순회하며 필드들을 <div>에 표시
                    for (var i = 0; i < response.length; i++) {
                        var review = response[i];
                        /* resultElement.append("<p>리뷰 내용: " + review.sentences[0].content + ", 감정 분석 결과: " + review.document.sentiment); */

                        // 통계 카운트 계산
                        if (review.document.sentiment === "positive") {
                            positiveCount++;
                        } else if (review.document.sentiment === "negative") {
                            negativeCount++;
                        } else {
                            neutralCount++;
                        }
                    }

                    var positivePercentage = (positiveCount / totalCount) * 100;
                    var negativePercentage = (negativeCount / totalCount) * 100;
                    var neutralPercentage = (neutralCount / totalCount) * 100;
					/* 퍼센트 표시할시 사용 */
                    /* resultElement.append("<p>긍정 리뷰: " + positivePercentage.toFixed(2) + "%</p>");
                    resultElement.append("<p>부정 리뷰: " + negativePercentage.toFixed(2) + "%</p>");
                    resultElement.append("<p>중립 리뷰: " + neutralPercentage.toFixed(2) + "%</p>"); */
                    
                    google.charts.load("current", {packages:["corechart"]});
                    google.charts.setOnLoadCallback(drawChart);
                    function drawChart() {
                      var data = google.visualization.arrayToDataTable([
                        ['Task', 'Hours per Day'],
                        ['긍정', positivePercentage],
                        ['부정', negativePercentage],
                        ['중립', neutralPercentage]
                      ]);

                      var options = {
                        title: '<%= session.getAttribute("store_id") %>'+ ' 리뷰 감정분석',
                        is3D: true,
                      };

                      var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
                      chart.draw(data, options);
                    }
                },

                error: function(error) {
                    alert('감정 분석 중 오류가 발생했습니다. 다시 시도해주세요.');
                }
            });
        });
    });
</script>

</head>
<body>
    긍정부정 리뷰 분석
    <button id="SentimentButton">차트보기</button>
    <div id="result"></div>
    <div id="piechart_3d" style="width: 900px; height: 500px;"></div>
</body>
</html>
