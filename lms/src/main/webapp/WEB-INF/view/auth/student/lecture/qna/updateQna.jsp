<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>updateQna</title>
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
	<!-- NAVER SmartEditor2 스크립트 -->
	<script src="${pageContext.request.contextPath}/smarteditor2/js/HuskyEZCreator.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>
			$(document).ready(function(){	
				// 파일 추가 버튼
				$('#addFileBtn').click(function(){
					// 파일 개수 제한
					if($('#fileInput').children().length >= 10){
						alert('최대 10개만 가능합니다.');
						return;
					}
		
					let html =`<div><input type="file" name="questionFile" class="form-control questionFile"></div>`;
					$('#fileInput').append(html);
		
				})
				
				// 파일 삭제 버튼
				$('#delFileBtn').click(function(){
					// 마지막 파일을 삭제함
					$('#fileInput').children().last().remove();
				})
				
				// 질문 작성 버튼
				$('#updateQnaBtn').click(function(){
					oEditors.getById["questionContent"].exec("UPDATE_CONTENTS_FIELD", []); // 스마트 에디터 내용 추가
					var qc = $("#questionContent").val();
					// 제목, 내용 유효성 검사
					if($('#qnaTitle').val().length < 1){
						alert('제목을 입력해 주세요.');
						return;
						
					} else if(qc == "" || qc == null || qc == '&nbsp;' || qc == '<p>&nbsp;</p>'){
						alert('내용을 입력해 주세요.');
						oEditors.getById["qc"].exec("FOCUS");
						
					} else if($('#qnaPassword').val() == '0'){
						alert('0은 비밀번호로 설정이 불가능합니다.');
						return;
					}
					// 첨부 파일 유효성 검사
					let submitCk = true;
					$('.questionFile').each(function(index, item){
						// 파일 비어있을시 && submitCk가 true일때(경고창 한번만 출력하기 위함)
						if($(item).val() == '' && submitCk){
							alert('파일이 비어있습니다!');
							submitCk = false;
							return;
						}
					})
					// 정상적일 때 submit
					$('#updateQnaForm').submit();
				})
				// 파일 한개 삭제 -- 비동기 요청
				$('.deleteQnaFileOneBtn').on('click', function(){
					let uuid = $(this).val();
					let fileId = uuid.split('.')[0];
					$.ajax({
						url: '${pageContext.request.contextPath}/auth/student/lecture/qna/deleteQnaFileOne/' + uuid,
						type:'get',
						success: function(){
							$('#' + fileId).remove();
						}
					})
				})
				// NAVER SmartEditor2 적용 코드
				let oEditors = [];				
				nhn.husky.EZCreator.createInIFrame({
					oAppRef : oEditors,
					elPlaceHolder : 'questionContent',
					sSkinURI : '${pageContext.request.contextPath}/smarteditor2/SmartEditor2Skin.html',
					fCreator : 'createSEditor2'
				});
			})
		</script>
	</head>
	<body>
		<nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/student/include/menu.jsp" />
		    </div>	
		</nav>   		
		<div class="main-content">
			<!-- 상단 Navbar -->
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/student/include/topMenu.jsp" />
	    	</div>
	    	
			<!-- 강좌 Navbar -->
			<div class="container-fluid">
				<jsp:include page="/WEB-INF/view/auth/student/include/lectureMenu.jsp" />
	    	</div>
	    	
	    	<!-- 접속자 -->
			<jsp:include page="/WEB-INF/view/auth/student/include/connector.jsp" />
		    <div class="container-fluid mt--7">
				<div class="card shadow">
					<div class="card-header border-0">
						<div class="row align-items-center">
							<div class="col-8">
								<h3 class="mb-0">질문 수정</h3>
							</div>
							<div class="col-4 text-right">
								<button type="button" class="btn btn-sm btn-dark" onclick="location.href='${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaList/1'">목록</button>
								<button type="button" class="btn btn-sm btn-primary" id="updateQnaBtn">수정</button>
							</div>
						</div>
					</div>
		    	
			    	<!-- 질문 수정 폼 -->
					<div class="row align-items-center">
						<div class="col-12">
				    		<form id="updateQnaForm" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/auth/student/lecture/${question.lectureNo}/qna/updateQna/${question.questionNo}">
				    			<input type="hidden" id="questionNo" name="questionNo" value="${question.questionNo}">   	 
						    		
					    		<!-- 내용 -->
						    	<table class="table">
						    		<tr>
						    			<th width="20%">제목</th>
						    			<td width="80%">
						    				<input id="qnaTitle" type="text" name="questionTitle" value="${question.questionTitle}" class="form-control">
						    			</td>
						    		</tr>
						    		<tr>
						    			<th>비밀번호(선택)</th>
						    			<td>
						    				<input id="qnaPassword" type="password" placeholder="비밀글로 설정하실려면 비밀번호를 입력해주세요" name="questionPassword" class="form-control" value="${question.questionPassword}">
						    			</td>
						    		</tr>
						    		<tr>
						    			<th>내용</th>
						    			<td>
						    				<textarea id="questionContent" name="questionContent" style="width:100%;" rows="22px">${question.questionContent}</textarea>
						    			</td>
						    		</tr>
						    	</table>
						    	
						    	<!-- 기존 첨부파일 -->
					    		<table class="table">
					    			<thead class="thead-light">
					    				<tr>
						    				<th>기존 첨부파일</th>
					    				</tr>
					    			</thead>
					    			<tbody>
					    				<c:if test="${!empty question.questionFileList}">
						    			<c:forEach var="qf" items="${question.questionFileList}">
											<tr>
												<td>
													<a href="${pageContext.request.contextPath}/resource/questionFile/${qf.questionFileUuid}">${qf.questionFileOriginal}</a>
													<c:if test="${!empty qf.questionFileOriginal}">
														<td><button class="deleteQnaFileOneBtn" value="${qf.questionFileUuid}" type="button" class="btn btn-outline-danger">X</button></td>
													</c:if>
												</td>
											</tr>
										</c:forEach>
										</c:if>
					    				<c:if test="${empty question.questionFileList}">
					    					<tr>
					    						<td>(첨부파일이 없습니다)</td>
					    					</tr>
					    				</c:if>
						   			</tbody>
				    			</table>
		
				    			<!-- 신규 첨부파일 -->
					    		<table class="table">
					    			<thead class="thead-light">
					    				<tr>
						    				<th>신규 첨부파일</th>
					    				</tr>
					    			</thead>
					    			<tbody>
						    			<tr>
						    				<td>
						    					<div>
									   				<button id="addFileBtn" type="button" class="btn btn-sm btn-primary">파일 추가</button>
							   						<button id="delFileBtn" type="button" class="btn btn-sm btn-danger">파일 삭제</button>
							   					</div>
							   				</td>
							   			</tr>
							   			<tr>
					    					<td><div id="fileInput"></div></td>
					    				</tr>
				    				</tbody>
				    			</table>
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