<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<title>updateMypage</title>
		
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
		
		<script>
			$(document).ready(function(){
				$('#insertCareerBtn').click(function(){
					let insertCareerHtml = `
						<form id="careerForm" method="post" action="${pageContext.request.contextPath}/auth/teacher/mypage/insertMypageCareer">
							<div style="float: right;" >
								<button id="careerBtn" class="btn btn-sm btn-primary" type="button" >등록</button>
								<button id="insertCareerBtnDelete" class="btn btn-sm btn-primary" type="button" >취소</button>
							</div>
							<h6 class="heading-small text-muted mb-4">경력 추가</h6>
							<input type="text" name="accountId" hidden="hidden" value="${sessionScope.loginId}">
							<div class="row">
								<div class="col-lg-12">
									<div class="form-group">
										<label class="form-control-label">경력 정보</label>
										<input id="careerContent" class="form-control form-control-alternative" type="text" name="careerContent">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-5">
									<div class="form-group">
										<label class="form-control-label">시작 경력 일자</label>
										<input id="careerStartdate" class="form-control form-control-alternative" type="date" name="careerStartdate">
									</div>
								</div>
								<div class="col-lg-2">
									<div class="form-group">
										<label style="margin-top: 40px; margin-left: 40px; font-size:20px;" class="form-control-label"> ~ </label>
									</div>
								</div>
								<div class="col-lg-5">
									<div class="form-group">
										<label class="form-control-label">마지막 경력 일자</label>
										<input id="careerEnddate" class="form-control form-control-alternative" type="date" name="careerEnddate">
										<div id="careerDateCheck"></div>
									</div>
								</div>
							</div>
						</form>
						<hr class="my-4" />
					
					`;
					
					$('#insertCareer').html(insertCareerHtml);
					
					$('#insertCareerBtnDelete').click(function(){
						$('#insertCareer').html('');
					});
					
					$('#careerBtn').click(function(){
				
						if ($('#careerContent').val().replace(/(\s*)/g, "") == "" ) {
							$('#careerContent').focus();
							return;
						}
						if ($('#careerStartdate').val().replace(/(\s*)/g, "") == "") {
							$('#careerDateCheck').html('<span class="text-danger">경력 일자를 입력해주세요.</span>');
							return;
						} else if ($('#careerEnddate').val().replace(/(\s*)/g, "") == "") {
							$('#careerDateCheck').html('<span class="text-danger">경력 일자를 입력해주세요.</span>');
							return;
						} else if ($('#careerStartdate').val().replace(/-/gi,"") > $('#careerEnddate').val().replace(/-/gi,"")) {
							$('#careerDateCheck').html('<span class="text-danger">경력 일자를 확인해주세요.</span>');
							return;
						} else{
							$('#careerDateCheck').html('');
						}
						$('#careerForm').submit();
					});
				});
	
				$('#insertLicenseBtn').click(function(){
					let insertLicenseHtml = `
						<form id="licenseForm" method="post" action="${pageContext.request.contextPath}/auth/teacher/mypage/insertMypageLicense">
							<div style="float: right;" >
								<button id="licenseBtn" class="btn btn-sm btn-primary" type="button" >등록</button>
								<button id="insertLicenseBtnDelete" class="btn btn-sm btn-primary" type="button" >취소</button>
							</div>
							<h6 class="heading-small text-muted mb-4">자격증 추가</h6>
							<input type="text" name="accountId" hidden="hidden" value="${sessionScope.loginId}">
							<div class="row">
								<div class="col-lg-6">
									<div class="form-group">
										<label class="form-control-label">자격증 번호</label>
										<input id="licenseNumber" class="form-control form-control-alternative" type="text" name="licenseNumber">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label class="form-control-label">자격증 이름</label>
										<input id="licenseName" class="form-control form-control-alternative" type="text" name="licenseName">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-6">
									<div class="form-group">
										<label class="form-control-label">자격증 발급기관</label>
										<input id="licenseAgency" class="form-control form-control-alternative" type="text" name="licenseAgency">
									</div>
								</div>
								<div class="col-lg-6">
									<div class="form-group">
										<label class="form-control-label">자격증 발급 일자</label>
										<input id="licenseGetdate" class="form-control form-control-alternative" type="date" name="licenseGetdate">
										<div id="licenseDateCheck"></div>
									</div>
								</div>
							</div>
						</form>
					`;
					
					$('#insertLicense').html(insertLicenseHtml);
	
					$('#insertLicenseBtnDelete').click(function(){
						$('#insertLicense').html('');
					});
					
					$('#licenseBtn').click(function(){
						if ($('#licenseNumber').val().replace(/(\s*)/g, "") == "") {
							$('#licenseNumber').focus();
							return;
						}
						if ($('#licenseName').val().replace(/(\s*)/g, "") == "") {
							$('#licenseName').focus();
							return;
						}
						if ($('#licenseAgency').val().replace(/(\s*)/g, "") == "") {
							$('#licenseAgency').focus();
							return;
						}
						if ($('#licenseGetdate').val().replace(/(\s*)/g, "") == "") {
							$('#licenseDateCheck').html('<span class="text-danger">자격증 발급 일자를 입력해주세요.</span>');
							return;
						} else {
							$('#licenseDateCheck').html('');
						}
						
						$('#licenseForm').submit();
					});
				});
			
			});
		</script>
	</head>
	
	<body>
		<!-- 내비게이션 메인 메뉴 -->
		<jsp:include page="/WEB-INF/view/auth/teacher/include/menu.jsp" />
		
		<div class="main-content">
			<!-- 내비게이션 상단 메뉴 -->
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
										<img id="img" style="width: 200px; height: 200px;" src="${pageContext.request.contextPath}/resource/mypageImage/${sessionScope.loginImage}">
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
										${teacher.teacherName}<span class="font-weight-light">,	${teacher.teacherGender}</span>
									</h3>
									<div class="h5 font-weight-300">
										<i class="ni location_pin mr-2"></i>${teacher.teacherEmail}
									</div>
									<div class="h5 font-weight-300">
										<i class="ni location_pin mr-2"></i>${teacher.teacherPhone}
									</div>
									<div class="h5 mt-4">
										<i class="ni business_briefcase-24 mr-2"></i>${teacher.teacherAddressMain}
									</div>
									<div>
										<i class="ni education_hat mr-2"></i>${teacher.teacherAddressSub}
									</div>
									<hr class="my-4" />
									<p>${teacher.teacherInfo}</p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-8 order-xl-1">
						<div class="card bg-secondary shadow">
							<div class="card-header bg-white border-0">
								<div class="row align-items-center">
									<div class="col-8">
										<h3 class="mb-0">마이페이지</h3>
									</div>
								</div>
							</div>
							<div class="card-body">
								<div class="row align-items-center mb-4">
									<br>
									<div class="col-8">
										<h6 class="heading-small text-muted">개인정보</h6>
									</div>
									<div class="col-4 text-right">
										<button type="button" class="btn btn-sm btn-primary" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/mypage/updateMypage'">개인정보 수정</button>
									</div>
								</div>
								<div class="pl-lg-4">
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label class="form-control-label" >아이디</label>
												<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${teacher.teacherId}" disabled="disabled">
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group">
												<label class="form-control-label" >생년월일</label>
												<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${teacher.teacherBirth}" disabled="disabled">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label class="form-control-label" >이름</label>
												<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${teacher.teacherName}" disabled="disabled">
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group">
												<label class="form-control-label" >성별</label>
												<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${teacher.teacherGender}" disabled="disabled">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label class="form-control-label" >이메일</label>
												<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${teacher.teacherEmail}" disabled="disabled">
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group">
												<label class="form-control-label" >전화번호</label>
												<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${teacher.teacherPhone}" disabled="disabled">
											</div>
										</div>
									</div>
									
									<div class="row">
										<div class="col-lg-12">
											<div class="form-group">
												<label class="form-control-label" >자기소개</label>
												<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${teacher.teacherInfo}" disabled="disabled">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-12">
											<div class="form-group">
												<label class="form-control-label" >주소</label>
												<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${teacher.teacherAddressMain} ${teacher.teacherAddressSub}" disabled="disabled">
											</div>
										</div>
									</div>
								</div>
								<hr class="my-4" />
								<h6 class="heading-small text-muted mb-4">부가정보 </h6>
								<div class="pl-lg-4">
									<div class="form-group">
										<span style="float: right;">
											<button id="insertCareerBtn" class="btn btn-sm btn-primary" type="button">추가</button>
										</span>
										<label class="form-control-label" style="margin-bottom: 20px;" >경력</label>
										<c:if test="${teacher.careerList[0].careerContent != null}">
											<c:forEach var="c" items="${teacher.careerList}">
												<div class="row">
													<div class="col-lg-7">
														<div class="form-group ">
															<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${c.careerContent}" disabled="disabled">
														</div>
													</div>
													<div class="col-lg-4">
														<div class="form-group ">
															<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="( ${c.careerStartdate} ~ ${c.careerEnddate} )"	disabled="disabled">
														</div>
													</div>
													<div class="col-lg-1">
														<div class="form-group ">
															<span style="font-size: 25px;" >
																<a class="text-danger" href="${pageContext.request.contextPath}/auth/teacher/mypage/deleteMypageCareer/${c.careerNo}">x</a>
															</span>
														</div>
													</div>
												</div>
											</c:forEach>
										</c:if>
										<c:if test="${teacher.careerList[0].careerContent == null}">
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
										<div id="insertCareer"></div>
									</div>
								</div>
								<div class="pl-lg-4">
									<div class="form-group">
										<label class="form-control-label" style="margin-bottom: 20px;" >자격증</label>
										<div style="float: right;">
											<button id="insertLicenseBtn"  class="btn btn-sm btn-primary" type="button">추가</button>
										</div>
										<c:if test="${teacher.licenseList[0].licenseNumber != null}">
											<c:forEach var="l" items="${teacher.licenseList}">
												<div class="row">
													<div class="col-lg-2">
														<div class="form-group">
															<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${l.licenseNumber}" disabled="disabled">
														</div>
													</div>
													<div class="col-lg-3">
														<div class="form-group">
															<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${l.licenseName}" disabled="disabled">
														</div>
													</div>
													<div class="col-lg-3">
														<div class="form-group">
															<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${l.licenseAgency}" disabled="disabled">
														</div>
													</div>
													<div class="col-lg-3">
														<div class="form-group">
															<input type="text" class="form-control form-control-alternative" style="background-color: white;" value="${l.licenseGetdate}" disabled="disabled">
														</div>
													</div>
													<div class="col-lg-1">
														<div class="form-group">
															<span style="font-size: 25px;" >
																<a class="text-danger" data-toggle="modal" data-target="#modal-notification-${l.licenseNo}" href="#">×</a>
															</span>
														
															<div class="modal fade" id="modal-notification-${l.licenseNo}" tabindex="-1" role="dialog" aria-labelledby="modal-notification" aria-hidden="true">
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
																				<h4 class="heading mt-4">삭제 확인</h4>
																				<p>선택한 자격증을 삭제하시겠습니까?</p>
																			</div>
														
																		</div>
														
																		<div class="modal-footer">
																			<button type="button" class="btn btn-white" data-dismiss="modal">취소</button>
																			<button type="button" class="btn btn-link text-white ml-auto" onclick="location.href='${pageContext.request.contextPath}/auth/teacher/mypage/deleteMypageLicense/${l.licenseNo}'">삭제</button>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</c:forEach>
										</c:if>
										<c:if test="${teacher.licenseList[0].licenseNumber == null}">
											<div class="row">
												<div class="col-lg-3">
													<h5>(자격증이 없습니다)</h5>
												</div>
											</div>
										</c:if>
									</div>
								</div>
								<div class="pl-lg-4">
									<div class="form-group">
										<div id="insertLicense"></div>
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