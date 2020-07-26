package com.sys.comeit;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sys.comeit.util.MyUtil;

@Controller
public class StudyNoticeController
{
	@Autowired
	private SqlSession sqlSession;

	// 스터디 리스트 화면 노출하기
	@RequestMapping(value = "/studynoticelist.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String memberJoin(Model model, HttpServletRequest request) throws UnsupportedEncodingException
	{
		String view = null;

		IStudyNoticeDAO studyNoticeDao = sqlSession.getMapper(IStudyNoticeDAO.class);
		
		String stu_cd = request.getParameter("stu_cd");
		
		model.addAttribute("studyNoticeList", studyNoticeDao.studyNoticeList(stu_cd));
		
		

		view = "WEB-INF/views/study/StudyNoticeList.jsp";

		return view;
	}

}
