<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row col-11">
	<nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
		<div class="container-fluid">
			<ul class="navbar-nav">		
				<li class="nav-item">
					<a class="nav-link active" href="${pageContext.request.contextPath}/auth/student/lecture/classOne/${lectureNo}">강좌 홈</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/notice/noticeList/1">강좌 공지사항</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/qna/qnaList/1">질문 게시판</a>
				</li>
				
				<li class="nav-item">
					<a class="nav-link active" href="${pageContext.request.contextPath}/auth/student/lecture/syllabus/syllabus/${lectureNo}">강의계획서</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/report/reportList/1">과제</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/archive/archiveList/1">자료실</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/test/testList">최종평가</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="${pageContext.request.contextPath}/auth/student/lecture/${lectureNo}/attendance/attendanceByMonth/-1/-1">출석 현황</a>
				</li>
			</ul>
		</div>
	</nav>
</div>