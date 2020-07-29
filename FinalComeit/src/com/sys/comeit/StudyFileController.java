package com.sys.comeit;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sys.comeit.util.MyUtil;

@Controller
public class StudyFileController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 스터디방 별 산출물 게시물 리스트
	@RequestMapping(value = "/studyfilelist.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String studyFileList(Model model, HttpServletRequest request) throws UnsupportedEncodingException
	{
		String view = null;
		
		IStudyFileDAO fileDao = sqlSession.getMapper(IStudyFileDAO.class);
		
		String stu_cd = request.getParameter("stu_cd");
		
		//ArrayList<StudyFileDTO> studyFileList = fileDao.studyFileList(stu_cd);
		
		//model.addAttribute("studyFileList", studyFileList);
		
		// 페이징 처리 ----------------
		
		MyUtil util = new MyUtil();
		
		String pageNum = request.getParameter("pageNum");
		
		int currentPage = 1;
		if (pageNum != null && pageNum.length() != 0)
			currentPage = Integer.parseInt(pageNum);

		String searchKey = null;
		String searchValue = null;
		
		searchKey = request.getParameter("searchKey");
		searchValue = request.getParameter("searchValue");
		
		if (searchKey == null)
		{
			searchKey = "title";
			searchValue = "";
		}
		
		if (request.getMethod().equals("GET"))
		{
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		StudyFileDTO pagingDto = new StudyFileDTO();
		
		pagingDto.setFile_stu_cd(stu_cd);
		pagingDto.setSearchKey(searchKey);
		pagingDto.setSearchValue(searchValue);
		
		// 전체 데이터 개수
		int dataCount = fileDao.searchFileCount(pagingDto);
		
		// 전체 페이지 수 구하기
		int numPerPage = 5;
		int totalPage = util.getPageCount(numPerPage, dataCount);
		
		// 전체 페이지 수 보다 현재 표시할 페이지가 큰 경우
		if (totalPage < currentPage)
			currentPage = totalPage;
		
		// 테이블에서 가져올 리스트들의 시작과 끝 위치
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;
		
		pagingDto.setStart(start);
		pagingDto.setEnd(end);
		
		// 출력할 데이터
		ArrayList<StudyFileDTO> studyFileList = fileDao.getFileListData(pagingDto);
		
		String params = "";
		if (searchValue != null && searchValue.length() != 0)
		{
			searchValue = URLEncoder.encode(searchKey, "UTF-8");
			params = "searchKey=" + searchKey + "&searchValue=" + searchValue;
		}
		
		String cp = request.getContextPath();

		// 페이징 처리
		String listUrl = cp + "/studylist.action";
		if (params.length() != 0)
			listUrl += "?" + params;
		
		String pageIndexList = util.pageIndexList(currentPage, totalPage, listUrl);
		
		// 포워딩 할 데이터 넘겨주기
		request.setAttribute("studyFileList", studyFileList);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
		
		// 테스트
		//System.out.println(stu_cd);
		System.out.println("start : " + start);
		System.out.println("end : " + end);
		
		view = "WEB-INF/views/study/AjaxStudyFileList.jsp";
		
		return view;
	}
	
	// 스터디방 산출물 상세 
	@RequestMapping(value = "/studyfiledetail.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String studyFileDetail(Model model, HttpServletRequest request)
	{
		String view = null;
		
		IStudyFileDAO fileDao = sqlSession.getMapper(IStudyFileDAO.class);
		
		String stu_cd = request.getParameter("stu_cd");
		String oput_cd = request.getParameter("oput_cd");
		
		//System.out.println("파일코드"+oput_cd);
		
		StudyFileDTO dto = new StudyFileDTO();
		dto.setFile_stu_cd(stu_cd);
		dto.setFile_oput_cd(oput_cd);
		
		// 산출물 게시판 조회
		StudyFileDTO detail = fileDao.studyFileDetail(dto);
		if (detail != null)
			model.addAttribute("detail", detail);
		
		// 테스트
		//System.out.println(detail.getFile_title());
		
		// 첨부파일 조회
		ArrayList<StudyFileDTO> file = fileDao.fileUrlSearch(dto);
		
		if (!file.isEmpty())
			model.addAttribute("file", file);
		else
			model.addAttribute("file", "없음");
		
		
		view = "WEB-INF/views/study/AjaxStudyFileDetail.jsp";
		
		return view;
	}
	
	
	// 스터디방 산출물 등록
	@RequestMapping(value = "/studyfileadd.action", method = { RequestMethod.GET, RequestMethod.POST })
	public String studyFileAdd(Model model, HttpServletRequest request)
	{
		String view = null;
		
		
		view = "WEB-INF/views/study/StudyFileAdd.jsp";
		
		return view;
	}
	

}
