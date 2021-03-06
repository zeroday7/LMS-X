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
	<!-- jQuery / Ajax Google CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			$('#updateTextbookBtn').click(function(){
				
				if ($('#textbookTitle').val().replace(/(\s*)/g, "") == "") {
					$('#textbookTitle').focus();
					return;
				}
				if ($('#textbookWriter').val().replace(/(\s*)/g, "") == "") {
					$('#textbookWriter').focus();
					return;
				}
				if ($('#textbookPublisher').val().replace(/(\s*)/g, "") == "") {
					$('#textbookPublisher').focus();
					return;
				}
				if ($('#textbookPublishdate').val().replace(/(\s*)/g, "") == "") {
					$('#textbookPublishdate').focus();
					return;
				}
				if ($('#textbookInfo').val().replace(/(\s*)/g, "") == "") {
					$('#textbookInfo').focus();
					return;
				}
				if ($('#textbookPrice').val().replace(/(\s*)/g, "") == "") {
					$('#textbookPrice').focus();
					return;
				}
				
				$('#textbookForm').submit();
				
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
						<form id="textbookForm" method="post" action="${pageContext.request.contextPath}/auth/manager/textbook/updateTextbook">
							<div class="card-header bg-white border-0">
								<div class="row align-items-center">
									<br>
									<div class="col-8">
										<h3 class="mb-0">교재 수정</h3>
									</div>
									<div class="col-4 text-right">
										<button type="button" class="btn btn-sm btn-dark" onclick="location.href='${pageContext.request.contextPath}/auth/manager/textbook/textbookList/1'">목록</button>
										<button type="button" id="updateTextbookBtn" class="btn btn-sm btn-primary">수정</button>
									</div>
									<br>
								</div>
							</div>
							
							<div class="table-responsive">
								<table class="table align-items-center table-flush">
									<tr>
										<th width="20%">교재 ISBN</th>
										<td width="80%"><input type="text" name="textbookIsbn" class="form-control" readonly="readonly" value="${textbook.textbookIsbn}"></td>
									</tr>
									<tr>
										<th>교재 이름</th>
										<td><input type="text" name="textbookTitle" class="form-control" value="${textbook.textbookTitle}" id="textbookTitle"></td>
									</tr>
									<tr>
										<th>교재 저자</th>
										<td><input type="text" name="textbookWriter" class="form-control" value="${textbook.textbookWriter}" id="textbookWriter"></td>
									</tr>
									<tr>
										<th>교재 출판사</th>
										<td><input type="text" name="textbookPublisher" class="form-control" value="${textbook.textbookPublisher}" id="textbookPublisher"></td>
									</tr>
									<tr>
										<th>교재 출판일</th>
										<td><input type="date" name="textbookPublishdate" class="form-control" value="${textbook.textbookPublishdate}" id="textbookPublishdate"></td>
									</tr>
									<tr>
										<th>교재 정보</th>
										<td><input type="text" name="textbookInfo" class="form-control" value="${textbook.textbookInfo}" id="textbookInfo"></td>
									</tr>
									<tr>
										<th>교재 가격</th>
										<td><input type="number" name="textbookPrice" class="form-control" value="${textbook.textbookPrice}" id="textbookPrice"></td>
									</tr>
								</table>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- Footer -->
			<jsp:include page="/WEB-INF/view/auth/include/footer.jsp"></jsp:include>
		</div>
	</div>
		<!--   Core   -->
		<script src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
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