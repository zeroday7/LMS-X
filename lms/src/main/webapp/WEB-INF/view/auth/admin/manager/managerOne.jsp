<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>managerOne</title>
	<!-- Favicon -->
	<link href="${pageContext.request.contextPath}/assets/img/brand/favicon.png" rel="icon" type="image/png">
	<!-- Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"	rel="stylesheet">
	<!-- Icons -->
	<link href="${pageContext.request.contextPath}/assets/js/plugins/nucleo/css/nucleo.css"	rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"	rel="stylesheet" />
	<!-- CSS Files -->
	<link href="${pageContext.request.contextPath}/assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
	<!-- jQuery / Ajax Google CDN -->
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/view/auth/admin/include/menu.jsp" />
	<div class="main-content">
		<div class="container-fluid">
			<jsp:include page="/WEB-INF/view/auth/teacher/include/noLectureMenu.jsp" />
		</div>
		<!-- Header -->
		<div class="header bg-gradient-primary pb-8 pt-5 pt-md-8"></div>
		<!-- Page content -->
		<div class="container-fluid mt--7">
			<div class="row">
				<div class="col-xl-4 order-xl-2 mb-5 mb-xl-0">
					<div class="card card-profile shadow">
						<div class="row justify-content-center">
							<div class="col-lg-3 order-lg-2">
								<div class="card-profile-image">
									<img id="img" src="${pageContext.request.contextPath}/resource/mypageImage/${managerImage}">
								</div>
							</div>
						</div>
						<div class="card-body pt-0 pt-md-4" style="margin-top: 50px;">
							<div class="row">
								<div class="col">
									<div class="card-profile-stats justify-content-center mt-md-5 ">
									</div>
								</div>
							</div>
							<div class="text-center">
								<h3>
									${manager.managerName}<span class="font-weight-light">,	${manager.managerGender}</span>
								</h3>
								<div class="h5 font-weight-300">
									<i class="ni location_pin mr-2"></i>${manager.managerEmail}
								</div>
								<div class="h5 font-weight-300">
									<i class="ni location_pin mr-2"></i>${manager.managerPhone}
								</div>
								<div class="h5 mt-4">
									<i class="ni business_briefcase-24 mr-2"></i>${manager.managerAddressMain}
								</div>
								<div>
									<i class="ni education_hat mr-2"></i>${manager.managerAddressSub}
								</div>
								<hr class="my-4" />
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-8 order-xl-1">
					<div class="card bg-secondary shadow">
						<div class="card-header bg-white border-0">
							<div class="row align-items-center">
								<div class="col-8">
									<h3 class="mb-0">운영자 상세보기</h3>
								</div>
							</div>
						</div>
						<div class="card-body">
							<h6 class="heading-small text-muted mb-4">개인정보</h6>
							<div class="pl-lg-4">
								<form method="post"	action="${pageContext.request.contextPath}/auth/admin/updatePosition/${manager.managerId}">
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label class="form-control-label " for="input-username">직급</label>
												<select name="managerPosition" class="form-control form-control-alternative">
													<c:if test="${manager.managerPosition eq '사원'}">
														<option value="사원" selected="selected">사원</option>
														<option value="대리">대리</option>
														<option value="팀장">팀장</option>
													</c:if>
													<c:if test="${manager.managerPosition eq '대리'}">
														<option value="사원">사원</option>
														<option value="대리" selected="selected">대리</option>
														<option value="팀장">팀장</option>
													</c:if>
													<c:if test="${manager.managerPosition eq '팀장'}">
														<option value="사원">사원</option>
														<option value="대리">대리</option>
														<option value="팀장" selected="selected">팀장</option>
													</c:if>
												</select>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group" style="margin-top: 32px;">
												<button class="btn btn-primary" type="submit">직급 수정</button>
											</div>
										</div>
									</div>
								</form>
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label class="form-control-label" >아이디</label>
											<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${manager.managerId}" disabled="disabled">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<label class="form-control-label" >생년월일</label>
											<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${manager.managerBirth}" disabled="disabled">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label class="form-control-label" >이름</label>
											<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${manager.managerName}" disabled="disabled">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<label class="form-control-label" >성별</label>
											<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${manager.managerGender}" disabled="disabled">
										</div>
									</div>
								</div>
							
							
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label class="form-control-label" >이메일</label>
											<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${manager.managerEmail}" disabled="disabled">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<label class="form-control-label" >전화번호</label>
											<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${manager.managerPhone}" disabled="disabled">
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-lg-12">
										<div class="form-group">
											<label class="form-control-label" >주소</label>
											<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${manager.managerAddressMain} ${manager.managerAddressSub}" disabled="disabled">
										</div>
									</div>
								</div>
							</div>
							<hr class="my-4" />
							<h6 class="heading-small text-muted mb-4">부가정보</h6>
							<div class="pl-lg-4">
								<div class="form-group">
									<label class="form-control-label" for="input-username">경력</label>
									<c:if test="${manager.careerList[0].careerContent != null}">
									<c:forEach var="c" items="${manager.careerList}">
										<div class="row">
											<div class="col-lg-6">
												<div class="form-group ">
													<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${c.careerContent}" disabled="disabled">
												</div>
											</div>
											<div class="col-lg-6">
												<div class="form-group ">
													<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="( ${c.careerStartdate} ~ ${c.careerEnddate} )"	disabled="disabled">
												</div>
											</div>
										</div>
									</c:forEach>
									</c:if>
									<c:if test="${manager.careerList[0].careerContent == null}">
										<div class="row">
											<div class="col-lg-3">
												<h5>(경력이 없습니다)</h5>
											</div>
										</div>
									</c:if>
								</div>
							</div>
						
							<div class="pl-lg-4">
								<div class="form-group">
									<label class="form-control-label" for="input-username">자격증</label>
									<c:if test="${manager.licenseList[0].licenseNumber != null}">
										<c:forEach var="l" items="${manager.licenseList}">
											<div class="row">
												<div class="col-lg-3">
													<div class="form-group ">
														<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${l.licenseNumber}" disabled="disabled">
													</div>
												</div>
												<div class="col-lg-3">
													<div class="form-group ">
														<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${l.licenseName}" disabled="disabled">
													</div>
												</div>
												<div class="col-lg-3">
													<div class="form-group ">
														<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${l.licenseAgency}" disabled="disabled">
													</div>
												</div>
												<div class="col-lg-3">
													<div class="form-group ">
														<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${l.licenseGetdate}" disabled="disabled">
													</div>
												</div>
											</div>
										</c:forEach>
									</c:if>
									<c:if test="${manager.licenseList[0].licenseNumber == null}">
										<div class="row">
											<div class="col-lg-3">
												<h5>(자격증이 없습니다)</h5>
											</div>
										</div>
									</c:if>
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
	<script	src="${pageContext.request.contextPath}/assets/js/plugins/jquery/dist/jquery.min.js"></script>
	<script	src="${pageContext.request.contextPath}/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!--   Optional JS   -->
	<!--   Argon JS   -->
	<script	src="${pageContext.request.contextPath}/assets/js/argon-dashboard.min.js?v=1.1.2"></script>
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
		window.TrackJS && TrackJS.install({
			token : "ee6fab19c5a04ac1a32a645abde4613a",
			application : "argon-dashboard-free"
		});
	</script>
</body>
</html>