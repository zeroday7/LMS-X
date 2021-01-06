<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>chartIndex</title>
		<!-- Favicon -->
		<link href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" rel="icon" type="image/png">
		
		<!-- Fonts -->
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
		
		<!-- Icons -->
		<link href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
		
		<!-- CSS Files -->
		<link href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<!-- Bootstrap 4 Icons -->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		
		<!-- Argon Chart -->
		<script src="${pageContext.request.contextPath}/assets/vendor/chart.js/dist/Chart.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/vendor/chart.js/dist/Chart.extension.js"></script>
		
		<script>
			$(document).ready(function() {
				let ctx = document.getElementById('chart-bars').getContext('2d');
				let myChart = new Chart(ctx, {
				    type: 'bar',
				    data: {
				        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
				        datasets: [{
				            label: '# of Votes',
				            data: [12, 19, 3, 5, 2, 3],
				            backgroundColor: [
				                'rgba(255, 99, 132, 0.2)',
				                'rgba(54, 162, 235, 0.2)',
				                'rgba(255, 206, 86, 0.2)',
				                'rgba(75, 192, 192, 0.2)',
				                'rgba(153, 102, 255, 0.2)',
				                'rgba(255, 159, 64, 0.2)'
				            ],
				            borderColor: [
				                'rgba(255, 99, 132, 1)',
				                'rgba(54, 162, 235, 1)',
				                'rgba(255, 206, 86, 1)',
				                'rgba(75, 192, 192, 1)',
				                'rgba(153, 102, 255, 1)',
				                'rgba(255, 159, 64, 1)'
				            ],
				            borderWidth: 1
				        }]
				    },
				    options: {
				        scales: {
				            yAxes: [{
				                ticks: {
				                    beginAtZero: true
				                }
				            }]
				        }
				    }
				});
			});
		</script>
	</head>
	<body>
		<!-- 내비게이션 메인 메뉴 -->
		<jsp:include page="/WEB-INF/view/auth/manager/include/menu.jsp" />
		<div class="main-content">
			<!-- 내비게이션 상단 메뉴 -->
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/manager/include/topMenu.jsp" />
			</div>
	
			<!-- 접속자 -->
			<jsp:include page="/WEB-INF/view/auth/manager/include/connector.jsp" />
	
			<!-- Page content -->
			<div class="container-fluid mt--7">
				<!-- Table -->
				<div class="row">
					<div class="col">
						<div class="card shadow">
							<div class="card-header bg-white border-0">
								<div class="row align-items-center">
									<br>
									<div class="col-8">
										<h3 class="mb-0">통계</h3>
									</div>
									<div class="col-4 text-right"></div>
									<br>
								</div>
							</div>
	
							<div class="card-footer py-4">
								<!--* Card init *-->
								<div class="card">
								
								    <!-- Card header -->
								    <div class="card-header">
								    
										<!-- Title -->
										<h5 class="h3 mb-0">Bar형 차트 예제</h5>
								    </div>
								    
								    <!-- Card body -->
								    <div class="card-body">
	
										<div class="chart">
										    <!-- Chart wrapper -->
										    <canvas id="chart-bars" class="chart-canvas"></canvas>
										</div>
								    </div>
								</div>
							</div>
							
							<div class="card-footer py-4">
								<div class="row">
									<div class="col-4">
										<a class="btn btn-lg btn-primary btn-block" href="${pageContext.request.contextPath}/auth/manager/chart/chart1">강좌별 최종평가 평균</a>
										<a class="btn btn-lg btn-primary btn-block" href="${pageContext.request.contextPath}/auth/manager/chart/chart2">강좌별 상위/하위 학생</a>
										<a class="btn btn-lg btn-primary btn-block" href="${pageContext.request.contextPath}/auth/manager/chart/chart3">강좌별 과제 점수 평균</a>
										<a class="btn btn-lg btn-primary btn-block" href="${pageContext.request.contextPath}/auth/manager/chart/chart4">강좌별 과제 제출률</a>
										<a class="btn btn-lg btn-primary btn-block" href="${pageContext.request.contextPath}/auth/manager/chart/chart5">강좌별 최종평가 점수</a>
									</div>
									<div class="col-4">
										<a class="btn btn-lg btn-secondary btn-block" href="${pageContext.request.contextPath}/auth/manager/chart/chart6">과목별 최종평가 점수</a>
										<a class="btn btn-lg btn-secondary btn-block" href="${pageContext.request.contextPath}/auth/manager/chart/chart7">학생별 최종평가 평균</a>
										<a class="btn btn-lg btn-secondary btn-block" href="${pageContext.request.contextPath}/auth/manager/chart/chart8">학생별 과제 점수</a>
										<a class="btn btn-lg btn-secondary btn-block" href="${pageContext.request.contextPath}/auth/manager/chart/chart9">학생별 과제 점수 평균</a>
										<a class="btn btn-lg btn-secondary btn-block" href="${pageContext.request.contextPath}/auth/manager/chart/chart10">강좌별 평점</a>
									</div>
									<div class="col-4">
										<a class="btn btn-lg btn-primary btn-block" href="${pageContext.request.contextPath}/auth/manager/chart/chart11">강좌별 종합 출석률</a>
										<a class="btn btn-lg btn-primary btn-block" href="${pageContext.request.contextPath}/auth/manager/chart/chart12">강좌별 월별 출석률</a>
										<a class="btn btn-lg btn-primary btn-block" href="${pageContext.request.contextPath}/auth/manager/chart/chart13">학생별 종합 출석률</a>
										<a class="btn btn-lg btn-primary btn-block" href="${pageContext.request.contextPath}/auth/manager/chart/chart14">학생별 월별 출석률</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- Footer -->
				<jsp:include page="/WEB-INF/view/auth/include/footer.jsp"></jsp:include>
			</div>
		</div>
		<!--   Core   -->
		<script
			src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
		<!--   Optional JS   -->
		<script
			src="${pageContext.request.contextPath}/assets/js/plugins/chart.js/dist/Chart.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
		<!--   Argon JS   -->
		<script
			src="${pageContext.request.contextPath}/assets/js/argon-dashboard.min.js?v=1.1.2"></script>
		<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
		<script>
			window.TrackJS && TrackJS.install({
				token : "ee6fab19c5a04ac1a32a645abde4613a",
				application : "argon-dashboard-free"
			});
		</script>
	</body>
</html>