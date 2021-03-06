<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>studentList</title>
		
		<link href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" rel="icon" type="image/png">
		
		<!-- Fonts -->
		<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
		
		<!-- Icons -->
		<link href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
		
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
	            
			<!-- Page content -->
			<div class="container-fluid mt--7">
				<div class="card shadow">
					<div class="card-header bg-white border-0">
						<div class="row align-items-center">
							<div class="col-8">
								<h3 class="mb-0">학생 목록</h3>
							</div>
							<div class="col-4 text-right">
								<a class="btn btn-sm btn-success" href="${pageContext.request.contextPath}/auth/manager/student/studentQueueList/1">승인대기 목록</a>
							</div>
						</div>
					</div>
					
					<div class="table-responsive">
						<table class="table">
							<thead class="thead-light">
								<tr>
									<th scope="col" style="font-size: 15px; width: 12%;">아이디</th>
									<th scope="col" style="font-size: 15px; width: 10%;">이름</th>
									<th scope="col" style="font-size: 15px; width: 8%;">성별</th>
									<th scope="col" style="font-size: 15px; width: 10%;">생일</th>
									<th scope="col" style="font-size: 15px; width: 18%;">이메일</th>
									<th scope="col" style="font-size: 15px; width: 13%;">연락처</th>
									<th scope="col" style="font-size: 15px; width: 13%;">승인날짜</th>
									<th scope="col" style="font-size: 15px; width: 8%;">휴면</th>
									<th scope="col" style="font-size: 15px; width: 8%;">탈퇴</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${!empty studentList}">
									<c:forEach var="s" items="${studentList}" >
										<tr>
											<td style="font-size: 13px;"><a href="${pageContext.request.contextPath}/auth/manager/student/studentOne/${s.studentId}">${s.studentId}</a></td>
											<td style="font-size: 13px;">${s.studentName}</td>
											<td style="font-size: 13px;">${s.studentGender}</td>
											<td style="font-size: 13px;">${s.studentBirth}</td>
											<td style="font-size: 13px;">${s.studentEmail}</td>
											<td style="font-size: 13px;">${s.studentPhone}</td>
											<td style="font-size: 13px;">${s.studentAccessdate}</td>
											<td style="font-size: 13px;">
												<c:if test="${s.account.accountState == '휴면'}">
													<button type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#modal-default-${s.studentId}">휴면 해제</button>
													<div class="modal fade" id="modal-default-${s.studentId}" tabindex="-1"
														role="dialog" aria-labelledby="modal-default" aria-hidden="true">
														<div class="modal-dialog modal- modal-dialog-centered modal-"
															role="document">
															<div class="modal-content">
												
																<div class="modal-header">
																	<h6 class="modal-title" id="modal-title-notification">확인</h6>
																	<button type="button" class="close" data-dismiss="modal"
																		aria-label="Close">
																		<span aria-hidden="true">×</span>
																	</button>
																</div>
												
																<div class="modal-body">
												
																	<div class="py-3 text-center">
																		<i class="ni ni-bell-55 ni-3x"></i>
																		<h4 class="heading mt-4">휴면해제 확인</h4>
																		<p>${s.studentId} 학생을 휴면해제하시겠습니까?</p>
																	</div>
												
																</div>
												
																<div class="modal-footer">
																	<button type="button" class="btn btn-link" data-dismiss="modal">취소</button>
																	<button type="button" class="btn btn-primary ml-auto" onclick="location.href='${pageContext.request.contextPath}/auth/manager/student/dormantStudent/${currentPage}/${s.studentId}'">확인</button>
																</div>
															</div>
														</div>
													</div>
												</c:if>
											</td>
											<td style="font-size: 13px;">
												<!-- ALERT -->
												<div>
													<button type="button" class="btn btn-sm btn-danger"
														data-toggle="modal" data-target="#modal-notification-${s.studentId}">탈퇴</button>
													<div class="modal fade" id="modal-notification-${s.studentId}" tabindex="-1"
														role="dialog" aria-labelledby="modal-notification" aria-hidden="true">
														<div class="modal-dialog modal-danger modal-dialog-centered modal-"
															role="document">
															<div class="modal-content bg-gradient-danger">
												
																<div class="modal-header">
																	<h6 class="modal-title" id="modal-title-notification">경고</h6>
																	<button type="button" class="close" data-dismiss="modal"
																		aria-label="Close">
																		<span aria-hidden="true">×</span>
																	</button>
																</div>
												
																<div class="modal-body">
												
																	<div class="py-3 text-center">
																		<i class="ni ni-bell-55 ni-3x"></i>
																		<h4 class="heading mt-4">탈퇴 처리 확인</h4>
																		<p>${s.studentId} 학생을 탈퇴처리하시겠습니까?</p>
																	</div>
												
																</div>
												
																<div class="modal-footer">
																	<button type="button" class="btn btn-white" data-dismiss="modal">취소</button>
																	<button type="button" class="btn btn-link text-white ml-auto" onclick="location.href='${pageContext.request.contextPath}/auth/manager/student/deleteStudent/${currentPage}/${s.studentId}'">탈퇴</button>
																</div>
															</div>
														</div>
													</div>
												</div>
											</td>
										</tr>	
									</c:forEach>
								</c:if>
								<c:if test="${empty studentList}">
									<tr>
										<td colspan="9">(학생이 없습니다)</td>
									</tr>
								</c:if>
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
										<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/student/studentList/1/">
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
										<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/student/studentList/${prePage}">
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
												<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/student/studentList/${i}">${i}</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:if>
							</c:forEach>
							
							<!-- 다음 버튼 -->
							<c:choose>
								<c:when test="${currentPage < lastPage}">
									<li class="page-item">
										<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/student/studentList/${nextPage}">
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
										<a class="page-link" href="${pageContext.request.contextPath}/auth/manager/student/studentList/${lastPage}">
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
					<div class="card-footer py-4">
						<!-- 검색 -->
						<form method="get"
							action="${pageContext.request.contextPath}/auth/manager/student/studentList/1"
							class="form-inline">
							<div class="input-group" style="width: 30%; margin: auto;">
								<!-- 계정검색 -->
								<div class="input-group-prepend">
									<span class="input-group-text">아이디</span>
								</div>
								<input type="text" class="form-control" name="searchText"
									value="${searchText}">
								<div class="input-group-append">
									<button type="submit" class="btn btn-primary">검색</button>
								</div>
							</div>
						</form>
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