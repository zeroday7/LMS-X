<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>insertQna</title>
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
		
					let html =`<div><input type="file" name="questionFile" class="form-control questionFile" onchange="checkSize(this)"></div>`;
					$('#fileInput').append(html);
		
				})
				
				// 파일 삭제 버튼
				$('#delFileBtn').click(function(){
					// 마지막 파일을 삭제함
					$('#fileInput').children().last().remove();
				})
				
				// 질문 작성 버튼
				$('#qnaBtn').click(function(){
					oEditors.getById["questionContent"].exec("UPDATE_CONTENTS_FIELD", []); // 스마트 에디터 내용 추가
					var qc = $("#questionContent").val();
					// 제목, 내용 유효성 검사
					if($('#qnaTitle').val().length < 1){
						alert('제목을 입력해 주세요.');
						return;
					} else if(qc == "" || qc == null || qc == '&nbsp;' || qc == '<p>&nbsp;</p>'){
						alert('내용을 입력해 주세요.');
						oEditors.getById["qc"].exec("FOCUS");
						return;
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
					$('#qnaForm').submit();
				});
				
				// NAVER SmartEditor2 적용 코드
				let oEditors = [];				
				nhn.husky.EZCreator.createInIFrame({
					oAppRef : oEditors,
					elPlaceHolder : 'questionContent',
					sSkinURI : '${pageContext.request.contextPath}/smarteditor2/SmartEditor2Skin.html',
					fCreator : 'createSEditor2'
				});
			});

			function checkSize(input) {
			    if (input.files && input.files[0].size > (10 * 1024 * 1000)) {
			        alert("파일 사이즈가 10MB 를 넘습니다.");
			        input.value = null;
			    }
			}
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
							<h3 class="mb-0">질문 작성</h3>
						</div>
						<div class="col-4 text-right">
							<button type="button" class="btn btn-sm btn-dark" onclick="location.href='${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaList/1'">목록</button>
							<button type="button" class="btn btn-sm btn-success" id="qnaBtn">작성</button>
						</div>
					</div>
				</div>
				
		    	<!-- 질문 작성 폼 -->
		   		 <div>
		   		 	<div class="row align-items-center">
						<div class="col-12">
				    	<form id="qnaForm" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/insertQna">   	
				    		<input id="lectureNo" type="hidden" name="lectureNo" value="${lectureNo}"> 
				    		<!-- 내용 -->
					    	<table class="table">
					    		<tr>
					    			<th width="20%">제목</th>
					    			<td width="80%">
					    				<input class="form-control" id="qnaTitle" type="text" name="questionTitle">
					    			</td>
					    		</tr>
								<tr>
					    			<th>비밀 글 설정</th>
					    			<td>
					    				<input class="form-control" id="qnaPassword" type="password" placeholder="비밀글로 설정하실려면 비밀번호를 입력해주세요" name="questionPassword">
					    			</td>
					    		</tr>
					    		<tr>
					    			<th>내용</th>
					    			<td>
					    				<textarea id="questionContent" name="questionContent" style="width:100%;" rows="22px" class="form-control"></textarea>
					    			</td>
					    		</tr>
					    	</table>
				    	
				    		<!-- 첨부파일 -->
				    		<table class="table">
				    			<thead class="thead-light">
				    				<tr>
					    				<th>첨부파일</th>
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