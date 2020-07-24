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

	// 기혜
	// ---------------------------------------------------------------------------------
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

	// 수진
	// ---------------------------------------------------------------------------------

	// 스터디방 개설 페이지에서 지역, 레벨, 신분, 요일, 관심키워드, 기간 리스트 던져주기
	@RequestMapping(value = "/studycreate.action", method = RequestMethod.GET)
	public String studyCreate(Model model)
	{
		String view = null;

		IAreaDAO areaDao = sqlSession.getMapper(IAreaDAO.class); // 지역
		ILevelDAO levelDao = sqlSession.getMapper(ILevelDAO.class); // 레벨
		IIdnttDAO idnttDao = sqlSession.getMapper(IIdnttDAO.class); // 신분
		IDayDAO dayDao = sqlSession.getMapper(IDayDAO.class); // 요일
		IIntTagDAO intTagDao = sqlSession.getMapper(IIntTagDAO.class); // 관심키워드
		IMeetTermDAO meetTermDao = sqlSession.getMapper(IMeetTermDAO.class); // 기간

		model.addAttribute("area", areaDao.areaList()); // 지역
		model.addAttribute("level", levelDao.levelList()); // 레벨
		model.addAttribute("idntt", idnttDao.idnttList()); // 신분
		model.addAttribute("day", dayDao.dayList()); // 요일
		model.addAttribute("intTag", intTagDao.intTagList()); // 관심키워드
		model.addAttribute("meetTerm", meetTermDao.meetTermList()); // 기간

		view = "WEB-INF/views/study/StudyCreate.jsp";

		return view;
	}

	// 스터디 리스트 화면 노출하기
	@RequestMapping(value = "/studylist.action", method = RequestMethod.GET)
	public String memberJoin(Model model)
	{
		String view = null;

		IStuCatDAO stuCatDao = sqlSession.getMapper(IStuCatDAO.class); // 스터디 카테고리
		IAreaDAO areaDao = sqlSession.getMapper(IAreaDAO.class); // 지역
		ILevelDAO levelDao = sqlSession.getMapper(ILevelDAO.class); // 레벨

		IStudyDAO studyDao = sqlSession.getMapper(IStudyDAO.class); // 스터디 정보

		model.addAttribute("stuCat", stuCatDao.stuCatList());
		model.addAttribute("area", areaDao.areaList());
		model.addAttribute("level", levelDao.levelList());

		model.addAttribute("study", studyDao.studyList());

		view = "WEB-INF/views/study/StudyList.jsp";

		return view;
	}

	// 지역에 맞는 세부지역 뿌려주는 AJAX 처리
	/*
	@RequestMapping(value = "/areaajax.action", method = RequestMethod.POST)
	public String selectAjax(HttpServletRequest request, Model model)
	{

		String view = null;

		ISpcAreaDAO spcAreaDao = sqlSession.getMapper(ISpcAreaDAO.class);

		ArrayList<SpcAreaDTO> list = spcAreaDao.spcAreaList(request.getParameter("area_cd"));

		model.addAttribute("spcAreaList", list);

		view = "WEB-INF/views/member/AjaxJoinSpcArea.jsp";

		return view;

	}
	*/

}
