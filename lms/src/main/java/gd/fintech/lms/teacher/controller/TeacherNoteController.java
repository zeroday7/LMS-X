package gd.fintech.lms.teacher.controller;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import gd.fintech.lms.teacher.service.TeacherNoteService;
import gd.fintech.lms.vo.Note;

@Controller
public class TeacherNoteController {
	@Autowired TeacherNoteService teacherNoteService;
	
	// Logger 사용
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	// 쪽지 수신함
	@GetMapping("/auth/teacher/note/noteReceiveList/{currentPage}")
	public String noteReceiveList(ServletRequest request, Model model,
			@PathVariable(value = "currentPage") int currentPage) {
		// 세션 정보를 가져온다.
		HttpSession session = ((HttpServletRequest)request).getSession();
		
		// 세션에 있는 아이디를 가져온다 (강사)
		String teacherId = (String)session.getAttribute("loginId");
		
		// [Logger] 세션에 있는 teacherId 확인
		logger.trace("nowSessionId[" + teacherId + "]");
		
		// 한 페이지에 표시할 데이터 수
		int rowPerPage = 10;
		
		// 시작 페이지 계산
		int beginRow = (currentPage - 1) * rowPerPage;
		
		// [Logger] 데이터베이스로부터 강사 ID에 해당하는 수신 쪽지 목록을 가져온다
		List<Note> noteReceiveList = teacherNoteService.selectNoteReceiveListByPage(teacherId, beginRow, rowPerPage);
		logger.trace("noteReceiveList[" + noteReceiveList + "]");
		
		// 페이징 코드
		// 전체 데이터 수
		int totalCount = teacherNoteService.selectTeacherNoteReceiveCount(teacherId);
		
		// 마지막 페이지
		int lastPage = totalCount / rowPerPage;
		
		// 10 미만의 개수의 데이터가 있는 페이지를 표시
		if (totalCount % rowPerPage != 0) {
			lastPage += 1;
		}
		
		// 전체 페이지가 0개이면 현재 페이지도 0으로 표시
		if (lastPage == 0) {
			currentPage = 0;
		}
		
		// 내비게이션에 표시할 페이지 수
		int navPerPage = 10;
		
		// 내비게이션 첫번째 페이지
		int navFirstPage = currentPage - (currentPage % navPerPage) + 1;	
		
		// 내비게이션 마지막 페이지
		int navLastPage = navFirstPage + navPerPage - 1;
		
		// 10으로 나누어 떨어지는 경우 처리하는 코드
		if (currentPage % navPerPage == 0 && currentPage != 0) {
			navFirstPage = navFirstPage - navPerPage;
			navLastPage = navLastPage - navPerPage;
		}
		
		// 현재 페이지에 대한 이전 페이지
		int prePage;
		if (currentPage > 10) {
			prePage = currentPage - (currentPage % navPerPage) + 1 - 10;
		} else {
			prePage = 1;
		}
		
		// 현재 페이지에 대한 다음 페이지
		int nextPage = currentPage - (currentPage % navPerPage) + 1 + 10;
		if (nextPage > lastPage) {
			nextPage = lastPage;
		}
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다
		model.addAttribute("noteReceiveList", noteReceiveList);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
		
		// [View] /auth/teacher/note/noteReceiveList.jsp
		return "/auth/teacher/note/noteReceiveList";
	}
	
	// 쪽지 발신함
	@GetMapping("/auth/teacher/note/noteDispatchList/{currentPage}")
	public String noteDispatchList(ServletRequest request, Model model,
			@PathVariable(value = "currentPage") int currentPage) {
		// 세션 정보를 가져온다.
		HttpSession session = ((HttpServletRequest)request).getSession();
		
		// 세션에 있는 아이디를 가져온다 (강사)
		String teacherId = (String)session.getAttribute("loginId");
		
		// [Logger] 세션에 있는 teacherId 확인
		logger.trace("nowSessionId[" + teacherId + "]");
		
		// 한 페이지에 표시할 데이터 수
		int rowPerPage = 10;
		
		// 시작 페이지 계산
		int beginRow = (currentPage - 1) * rowPerPage;
		
		// [Logger] 데이터베이스로부터 강사 ID에 해당하는 발신 쪽지 목록을 가져온다
		List<Note> noteDispatchList = teacherNoteService.selectNoteDispatchListByPage(teacherId, beginRow, rowPerPage);
		logger.trace("noteDispatchList[" + noteDispatchList + "]");
		
		// 페이징 코드
		// 전체 데이터 수
		int totalCount = teacherNoteService.selectTeacherNoteDispatchCount(teacherId);
		
		// 마지막 페이지
		int lastPage = totalCount / rowPerPage;
		
		// 10 미만의 개수의 데이터가 있는 페이지를 표시
		if (totalCount % rowPerPage != 0) {
			lastPage += 1;
		}
		
		// 전체 페이지가 0개이면 현재 페이지도 0으로 표시
		if (lastPage == 0) {
			currentPage = 0;
		}
		
		// 내비게이션에 표시할 페이지 수
		int navPerPage = 10;
		
		// 내비게이션 첫번째 페이지
		int navFirstPage = currentPage - (currentPage % navPerPage) + 1;	
		
		// 내비게이션 마지막 페이지
		int navLastPage = navFirstPage + navPerPage - 1;
		
		// 10으로 나누어 떨어지는 경우 처리하는 코드
		if (currentPage % navPerPage == 0 && currentPage != 0) {
			navFirstPage = navFirstPage - navPerPage;
			navLastPage = navLastPage - navPerPage;
		}
		
		// 현재 페이지에 대한 이전 페이지
		int prePage;
		if (currentPage > 10) {
			prePage = currentPage - (currentPage % navPerPage) + 1 - 10;
		} else {
			prePage = 1;
		}
		
		// 현재 페이지에 대한 다음 페이지
		int nextPage = currentPage - (currentPage % navPerPage) + 1 + 10;
		if (nextPage > lastPage) {
			nextPage = lastPage;
		}
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다
		model.addAttribute("noteDispatchList", noteDispatchList);
		
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);
		
		model.addAttribute("navPerPage", navPerPage);
		model.addAttribute("navFirstPage", navFirstPage);
		model.addAttribute("navLastPage", navLastPage);
		
		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
		
		// [View] /auth/teacher/note/noteDispatchList.jsp
		return "/auth/teacher/note/noteDispatchList";
	}
	
	// 쪽지 수신 내용
	@GetMapping("/auth/teacher/note/noteReceiveOne/{noteNo}")
	public String noteReceiveOne(Model model, 
			@PathVariable(value = "noteNo") int noteNo) {
		Note note = teacherNoteService.selectNoteReceiveOne(noteNo);
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다
		model.addAttribute("note", note);
		
		// [View] /auth/teacher/note/noteReceiveOne.jsp
		return "/auth/teacher/note/noteReceiveOne";
	}
	
	// 쪽지 발신 내용
	@GetMapping("/auth/teacher/note/noteDispatchOne/{noteNo}")
	public String noteDispatchOne(Model model, 
			@PathVariable(value = "noteNo") int noteNo) {
		Note note = teacherNoteService.selectNoteDispatchOne(noteNo);
		
		// model을 통해 View에 다음과 같은 정보들을 보내준다
		model.addAttribute("note", note);
		
		// [View] /auth/teacher/note/noteDispatchOne.jsp
		return "/auth/teacher/note/noteDispatchOne";
	}
}
