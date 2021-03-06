<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>textbookList</title>
		<link href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" rel="icon" type="image/png">
		<!-- Fonts -->
		<link
			href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
			rel="stylesheet">
		<!-- Icons -->
		<link href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
		<link
			href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"
			rel="stylesheet" />
		<!-- CSS Files -->
		<link href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
	
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
	<jsp:include page="/WEB-INF/view/auth/manager/include/menu.jsp" />
	<div class="main-content">
		<!-- 내비게이션 상단 메뉴 -->
		<div class="container-fluid">
			<jsp:include page="/WEB-INF/view/auth/manager/include/topMenu.jsp" />
		</div>
		<!-- 접속자 -->
           <jsp:include page="/WEB-INF/view/auth/manager/include/connector.jsp" />
			<div class="container-fluid mt--7">
				<div class="card shadow">
					<div class="card-header border-0">
						<div class="row align-items-center">
							<div class="col-8">
								<h3 class="mb-0">교재 목록</h3>
							</div>
							<div class="col-4 text-right">
								<a class="btn btn-sm btn-success" href="${pageContext.request.contextPath}/auth/manager/textbook/insertTextbook">교재 추가</a>
							</div>
						</div>
					</div>
					
					<div class="table-responsive">
						<table class="table align-items-center table-flush">
							<thead class="thead-light">
								<tr>
									<th>교재 번호</th>
									<th>교재 이름</th>
									<th>교재 저자</th>
									<th>교재 출판일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${textbookList}" var="t">
									<tr>
										<td>${t.textbookIsbn}</td>
										<td><a href="${pageContext.request.contextPath}/auth/manager/textbook/textbookOne/${t.textbookIsbn}">${t.textbookTitle}</a></td>
										<td>${t.textbookWriter}</td>
										<td>${t.textbookPublishdate}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
						
					<div class="card-footer py-4">
						<!-- 페이지 네비게이션 -->
						<ul class="pagination justify-content-center">
							<!-- 처음으로 버튼 -->
							<c:choose>
								<c:when test="${currentPage > 1}">
									<li class="page-item">
										<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/textbook/textbookList/1">
											<i class='fas fa-angle-double-left'></i>
										</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item disabled">
										<a class="page-link" href="#">
											<i class='fas fa-angle-double-left'></i>
										</a>
									</li>
								</c:otherwise>
							</c:choose>
							
							<!-- 이전 버튼 -->
							<c:choose>
								<c:when test="${currentPage > 1}">
									<li class="page-item">
										<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/textbook/textbookList/${prePage}">
											<i class='fas fa-angle-left'></i>
										</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item disabled">
										<a class="page-link" href="#">
											<i class='fas fa-angle-left'></i>
										</a>
									</li>
								</c:otherwise>
							</c:choose>
							
							<!-- 현재 페이지 표시 -->
							<c:forEach var="i" begin="${navFirstPage}" end="${navLastPage}">
								<c:if test="${i <= lastPage}">
									<c:choose>
										<%-- 현재 페이지 --%>
										<c:when test="${i == currentPage}">
											<li class="page-item active">
												<a class="page-link" href="#">${i}</a>
											</li>
										</c:when>
										<%-- 현재 페이지가 아닌 선택 가능한 페이지 --%>
										<c:otherwise>
											<li class="page-item">
												<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/textbook/textbookList/${i}">${i}</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:if>
							</c:forEach>
							
							<!-- 다음 버튼 -->
							<c:choose>
								<c:when test="${currentPage < lastPage}">
									<li class="page-item">
										<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/textbook/textbookList/${nextPage}">
											<i class='fas fa-angle-right'></i>
										</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item disabled">
										<a class="page-link" href="#">
											<i class='fas fa-angle-right'></i>
										</a>
									</li>
								</c:otherwise>
							</c:choose>
							
							<!-- 마지막으로 버튼 -->
							<c:choose>
								<c:when test="${currentPage < lastPage}">
									<li class="page-item">
										<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/textbook/textbookList/${lastPage}">
											<i class='fas fa-angle-double-right'></i>
										</a>
									</li>
								</c:when>
								<c:otherwise>
									<li class="page-item disabled">
										<a class="page-link" href="#">
											<i class='fas fa-angle-double-right'></i>
										</a>
									</li>
								</c:otherwise>
							</c:choose>
						</ul>
						
						<!-- 총 페이지 수 출력 -->
						<table style="margin: auto;">
							<tr>
								<td>
									<button type="button" class="btn btn-outline-primary btn-sm">
										${currentPage} / ${lastPage} 페이지
									</button>
								</td>
							</tr>
						</table>
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