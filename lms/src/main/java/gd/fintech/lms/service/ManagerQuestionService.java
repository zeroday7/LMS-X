package gd.fintech.lms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import gd.fintech.lms.mapper.ManagerQuestionMapper;
import gd.fintech.lms.vo.Question;

@Service
@Transactional
public class ManagerQuestionService {
	@Autowired ManagerQuestionMapper managerQuestionMapper;
	
	public List<Question> getQuestionList(){
		return managerQuestionMapper.selectQuestionList();
	}
}
