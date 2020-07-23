package com.sys.comeit;

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
	
	
	// 스터디방 페이지 요청	
	// ★ 
	// 1. 후에 list랑 연결되면 GET 방식에서 POST 방식으로 바꾸기!
	// 2. 사진 경로 가져오기(진짜 사진 등록되면)
	@RequestMapping(value = "/studydetail.action", method = RequestMethod.GET)
	public String memberLogin(Model model, HttpServletRequest request)
	{
		IStudyDAO studyDao = sqlSession.getMapper(IStudyDAO.class);
		
		String view = null;
		
		String stu_cd = "STU1002";
		
		// 스터디방 정보
		model.addAttribute("studyInfo", studyDao.studyInfoSearch(stu_cd));
		// 스터디방 관심태그
		model.addAttribute("intTag", studyDao.studyIntTagSearch(stu_cd));
		// 스터디방 기타 관심 태그
		model.addAttribute("etcTag", studyDao.studyEtcTagSearch(stu_cd));
		// 스터디방 진행 요일
		model.addAttribute("dayName", studyDao.studyDaySearch(stu_cd));
		// 스터디장 이름
		model.addAttribute("leaderName", studyDao.studyLeaderSearch(stu_cd));
		// 스터디원 이름
		model.addAttribute("joinName", studyDao.studyJoinName(stu_cd));
		// 스터디 참여자 이미지
		model.addAttribute("memImg", studyDao.memImgSearch(stu_cd));
		
		
		view = "/WEB-INF/views/study/StudyBfDetail.jsp";

		return view;
	}
	
	
}
