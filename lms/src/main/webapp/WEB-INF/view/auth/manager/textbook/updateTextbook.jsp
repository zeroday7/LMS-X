<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>UpdateTextBook</title>
	<!-- Favicon -->
	<link href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" rel="icon" type="image/png">
	<!-- Fonts -->
	<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
	<!-- Icons -->
	<link href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
	<link
	href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet" />
	<!-- CSS Files -->
	<link href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
</head>
<body>
	<!-- 내비게이션 메인 메뉴 -->
	<jsp:include page="/WEB-INF/view/auth/manager/include/menu.jsp" />
	<div class="main-content">
		<!-- 내비게이션 상단 메뉴 -->
		<div class="container-fluid">
			<jsp:include page="/WEB-INF/view/auth/manager/include/topMenu.jsp" />
		</div>
		
		<!-- Header -->
			<div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
				<div class="container-fluid">
					<div class="header-body">
						<!-- Card stats -->
						<div class="row">
							<div class="col-xl-3 col-lg-6">
								<div class="card card-stats mb-4 mb-xl-0">
									<div class="card-body">
										<div class="row">
											<div class="col">
												<h5 class="card-title text-uppercase text-muted mb-0">접속자 현황</h5>
												<span class="h2 font-weight-bold mb-0">350,897</span>
											</div>
											<div class="col-auto">
												<div
													class="icon icon-shape bg-danger text-white rounded-circle shadow">
													<i class="fas fa-chart-bar"></i>
												</div>
											</div>
										</div>
										<p class="mt-3 mb-0 text-muted text-sm">
											<span class="text-nowrap">누적 접속자</span> <span
												class="text-success mr-2">1,000,000,000</span>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
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
										<h3 class="mb-0">교재 수정</h3>
									</div>
									<div class="col-4 text-right">
									</div>
									<br>
								</div>
							</div>
							<div class="table-responsive">
								<form method="post" action="${pageContext.request.contextPath}/auth/manager/textbook/updateTextbook">
									<table class="table align-items-center table-flush">
										<tr>
											<td>교재 isbn</td>
											<td><input type="text" name="textbookIsbn" class="form-control" readonly="readonly" value="${textbook.textbookIsbn}"></td>
										</tr>
										<tr>
											<td>교재 이름</td>
											<td><input type="text" name="textbookTitle" class="form-control" value="${textbook.textbookTitle}"></td>
										</tr>
										<tr>
											<td>교재 저자</td>
											<td><input type="text" name="textbookWriter" class="form-control" value="${textbook.textbookWriter}"></td>
										</tr>
										<tr>
											<td>교재 출판사</td>
											<td><input type="text" name="textbookPublisher" class="form-control" value="${textbook.textbookPublisher}"></td>
										</tr>
										<tr>
											<td>교재 출판일</td>
											<td><input type="text" name="textbookPublishdate" class="form-control" value="${textbook.textbookPublishdate}"></td>
										</tr>
										<tr>
											<td>교재 정보</td>
											<td><input type="text" name="textbookInfo" class="form-control" value="${textbook.textbookInfo}"></td>
										</tr>
										<tr>
											<td>교재 가격</td>
											<td><input type="text" name="textbookPrice" class="form-control" value="${textbook.textbookPrice}"></td>
										</tr>
									</table>
								<div style="text-align: right">
									<button type="submit" class="btn btn-outline-primary">교재 수정</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- Footer -->
			<jsp:include page="/WEB-INF/view/auth/include/footer.jsp"></jsp:include>
		</div>
	</div>				
</body>
</html>