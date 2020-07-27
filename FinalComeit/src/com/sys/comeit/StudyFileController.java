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
public class StudyFileController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 스터디방 별 산출물 게시물 리스트
	@RequestMapping(value = "/studyfilelist.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String studyFileList(Model model, HttpServletRequest request)
	{
		String view = null;
		
		IStudyFileDAO fileDao = sqlSession.getMapper(IStudyFileDAO.class);
		
		String stu_cd = request.getParameter("stu_cd");
		
		ArrayList<StudyFileDTO> studyFileList = fileDao.studyFileList(stu_cd);
		
		model.addAttribute("studyFileList", studyFileList);
		
		view = "WEB-INF/views/study/AjaxStudyFileList.jsp";
		
		System.out.println(stu_cd);
		
		return view;
	}
	
	// 스터디방 산출물 상세  // 첨부파일 조회하기★
	@RequestMapping(value = "/studyfiledetail.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String studyFileDetail(Model model, HttpServletRequest request)
	{
		String view = null;
		
		IStudyFileDAO fileDao = sqlSession.getMapper(IStudyFileDAO.class);
		
		String stu_cd = request.getParameter("stu_cd");
		String oput_cd = request.getParameter("oput_cd");
		
		StudyFileDTO dto = new StudyFileDTO();
		dto.setFile_stu_cd(stu_cd);
		dto.setFile_oput_cd(oput_cd);
		
		StudyFileDTO detail = fileDao.studyFileDetail(dto);
		ArrayList<StudyFileDTO> file = fileDao.fileUrlSearch(dto);
		
		if (!file.isEmpty())
			model.addAttribute("file", file);
		else
			model.addAttribute("file", "없음");
		
		model.addAttribute("detail", detail);
		
		view = "WEB-INF/views/study/AjaxStudyFileDetail.jsp";
		
		return view;
	}
	

}
