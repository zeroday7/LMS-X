<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<title>answersheetOne</title>
		
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
		
		<style>
			.table {
				text-align: center;
			}
			
			.table td {
				vertical-align: middle;
			}
			
			th {
				text-align: center;
			}
		</style>
	</head>
	
	<body>
		<!-- 내비게이션 메인 메뉴 -->
		<jsp:include page="/WEB-INF/view/auth/teacher/include/menu.jsp" />
		
		<div class="main-content">
			<!-- 내비게이션 상단 메뉴 -->
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/teacher/include/lectureMenu.jsp" />
			</div>
			
			<!-- 접속자 -->
			<jsp:include page="/WEB-INF/view/auth/teacher/include/connector.jsp" />
			
			<!-- Page content -->
			<div class="container-fluid mt--7">
				<!-- Table -->
				<div class="row">
					<div class="col">
						<div class="card shadow">
							<div class="card-header bg-white border-0">
								<div class="row align-items-center">
									<div class="col-8">
										<h3 class="mb-0">학생 답안지 조회&nbsp;&nbsp;<span class="badge badge-primary">${studentId}</span></h3>
									</div>
									<div class="col-4 text-right">
										<button class="btn btn-sm btn-dark" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/lecture/${lectureNo}/test/answersheetList'">목록</button>
									</div>
								</div>
							</div>
							
							<div class="table-responsive">
								<c:forEach var="mcl" items="${multiplechoiceList}">
									<table class="table align-items-center table-flush">
										<thead class="thead-light">
											<tr>
												<th colspan="3" width="20%">${mcl.multiplechoiceId}</th>
												<th width="80%">${mcl.multiplechoiceQuestion}</th>
											</tr>
										</thead>
										<thead>
											<tr>
												<th>보기 번호</th>
												<th>학생 제출</th>
												<th>정답</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="mcel" items="${mcl.multiplechoiceExampleList}">
												<tr>
													<td>
														<c:if test="${mcel.multiplechoiceExampleId == 1}">①</c:if>
														<c:if test="${mcel.multiplechoiceExampleId == 2}">②</c:if>
														<c:if test="${mcel.multiplechoiceExampleId == 3}">③</c:if>
														<c:if test="${mcel.multiplechoiceExampleId == 4}">④</c:if>
														<c:if test="${mcel.multiplechoiceExampleId == 5}">⑤</c:if>
													</td>
													<c:if test="${mcel.multiplechoiceExampleId == mcl.answersheetList[0].answerSelect}">
														<td style="background-color: #bbdefb;"></td>
													</c:if>
													<c:if test="${mcel.multiplechoiceExampleId != mcl.answersheetList[0].answerSelect}">
														<td></td>
													</c:if>
													<c:if test="${mcel.multiplechoiceExampleId == mcl.multiplechoiceAnswer}">
														<td style="background-color: #aeed58;"></td>
													</c:if>
													<c:if test="${mcel.multiplechoiceExampleId != mcl.multiplechoiceAnswer}">
														<td></td>
													</c:if>
													<td>
														${mcel.multiplechoiceExampleContent}
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				
				<!-- Footer -->
				<jsp:include page="/WEB-INF/view/auth/include/footer.jsp"></jsp:include>
			</div>
		</div>
		<!--   Core   -->
		<script src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
		<!--   Optional JS   -->
		<script src="${pageContext.request.contextPath}/assets/js/plugins/chart.js/dist/Chart.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
		<!--   Argon JS   -->
		<script src="${pageContext.request.contextPath}/assets/js/argon-dashboard.min.js?v=1.1.2"></script>
		<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
		<script>
	    window.TrackJS &&
	      TrackJS.install({
	        token: "ee6fab19c5a04ac1a32a645abde4613a",
	        application: "argon-dashboard-free"
	      });
	  </script>
	</body>
</html>