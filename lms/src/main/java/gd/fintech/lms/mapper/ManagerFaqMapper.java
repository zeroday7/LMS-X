package gd.fintech.lms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import gd.fintech.lms.vo.Faq;

@Mapper
public interface ManagerFaqMapper {
	List<Faq> selectFaqList();
}
