package gd.fintech.lms.manager.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import gd.fintech.lms.manager.mapper.ManagerLectureArchiveMapper;
import gd.fintech.lms.vo.LectureArchive;

@Service
public class ManagerLectureArchiveService {
	@Autowired ManagerLectureArchiveMapper managerLectureArchiveMapper;
	
	// 자료 목록
	public List<LectureArchive> getLectureArchiveListByPage(Map<String, Object> map) {
		return managerLectureArchiveMapper.selectLectureArchiveListByPage(map);
	}
		
	// 자료 카운팅
	public int selectLectureArchiveCount(int lectureNo) {
		return managerLectureArchiveMapper.selectLectureArchiveListCount(lectureNo);
	}
}