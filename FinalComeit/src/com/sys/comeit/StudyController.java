package com.sys.comeit;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StudyController
{
	@Autowired
	private SqlSession sqlSession;
	
	
	// 스터디방 페이지 요청	★ 후에 list랑 연결되면 GET 방식에서 POST 방식으로 바꾸기!
	@RequestMapping(value = "/studydetail.action", method = RequestMethod.GET)
	public String memberLogin(Model model, HttpServletRequest request)
	{
		IStudyDAO studyDao = sqlSession.getMapper(IStudyDAO.class);
		
		String view = null;
		
		String stu_cd = "STU1002";
		
		StudyDTO dto = studyDao.studyInfoSearch(stu_cd);
		
		
		model.addAttribute("studyInfo", dto);
		model.addAttribute("intTag", studyDao.studyIntTagSearch(stu_cd));
		
		
		
		
		view = "/WEB-INF/views/study/StudyBfDetail.jsp";

		return view;
	}
	
	
}
