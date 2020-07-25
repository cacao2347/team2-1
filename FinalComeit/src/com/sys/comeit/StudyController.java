package com.sys.comeit;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class StudyController
{
	@Autowired
	private SqlSession sqlSession;

	// 기혜
	// ---------------------------------------------------------------------------------
	// 스터디방 Bf 페이지 요청
	// ★
	// 1. 후에 list랑 연결되면 GET 방식에서 POST 방식으로 바꾸기!
	// 2. 사진 경로 가져오기(진짜 사진 등록되면)
	@RequestMapping(value = "/studybfdetail.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String studyBfInfo(Model model, HttpServletRequest request)
	{
		String view = null;
		
		IStudyDAO studyDao = sqlSession.getMapper(IStudyDAO.class);

		String stu_cd = "STU1002";				// 임시 스터디 개설 코드

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
	
	// 스터디방 Af 페이지 요청
	@RequestMapping(value = "/studyafdetail.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String studyAfInfo(Model model, HttpServletRequest request)
	{
		String view = null;
		
		IStudyDAO studyDao = sqlSession.getMapper(IStudyDAO.class);

		String stu_cd = "STU1002";				// 임시 스터디 개설 코드

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

		view = "/WEB-INF/views/study/StudyAfDetail.jsp";

		return view;
	}
	
	
	// 스터디장 모달창 정보 leaderMemCd
	@RequestMapping(value = "/leaderinfomodal.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String leaderInfoModal(Model model, HttpServletRequest request)
	{
		String view = null;
		
		IMemberDAO memberDao = sqlSession.getMapper(IMemberDAO.class);
		
		MemberDTO dto = new MemberDTO();
		
		dto = memberDao.memModalList(request.getParameter("leaderMemCd"));
		ArrayList<MemberDTO> intTagSearch = memberDao.memIntTagSearch(request.getParameter("leaderMemCd"));
		ArrayList<MemberDTO> stuTitle = memberDao.modalStudyList(request.getParameter("leaderMemCd"));
		

		String name = dto.getName();
		String idntt = dto.getIdntt();
		String memContent = dto.getMem_content();
		String intTag = "/";
		String joinStudy = "";
	
		
		for (int i = 0; i < intTagSearch.size(); i++) 
		{
			intTag += intTagSearch.get(i).getInt_tag();
			intTag += "/";
		}
		
		if (!stuTitle.isEmpty()) 
		{
			joinStudy = "/";
			
			for (int i = 0; i < stuTitle.size(); i++) 
			{
				joinStudy += stuTitle.get(i).getJoin_stu_title();
				joinStudy += "/";
			}
		}
		else 
		{
			joinStudy += "없음";
		}
		// 테스트
		// System.out.println(intTag);
		
		model.addAttribute("name", name);
		model.addAttribute("idntt", idntt);
		model.addAttribute("memContent", memContent);
		model.addAttribute("intTag", intTag);
		model.addAttribute("joinStudy", joinStudy);
		
		view = "/WEB-INF/views/member/AjaxMemModal.jsp";
		
		return view;
	}
	
	
	// 스터디원 모달창 정보
	@RequestMapping(value = "/meminfomodal.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String memInfoModal(Model model, HttpServletRequest request)
	{
		String view = null;
		
		IMemberDAO memberDao = sqlSession.getMapper(IMemberDAO.class);
		
		MemberDTO dto = new MemberDTO();
		
		dto = memberDao.memModalList(request.getParameter("joinMemCd"));
		ArrayList<MemberDTO> intTagSearch = memberDao.memIntTagSearch(request.getParameter("joinMemCd"));
		ArrayList<MemberDTO> stuTitle = memberDao.modalStudyList(request.getParameter("joinMemCd"));
		

		String name = dto.getName();
		String idntt = dto.getIdntt();
		String memContent = dto.getMem_content();
		String intTag = "/";
		String joinStudy = "";
	
		
		for (int i = 0; i < intTagSearch.size(); i++) 
		{
			intTag += intTagSearch.get(i).getInt_tag();
			intTag += "/";
		}
		
		if (!stuTitle.isEmpty()) 
		{
			joinStudy = "/";
			
			for (int i = 0; i < stuTitle.size(); i++) 
			{
				joinStudy += stuTitle.get(i).getJoin_stu_title();
				joinStudy += "/";
			}
		}
		else 
		{
			joinStudy += "없음";
		}
		// 테스트
		// System.out.println(intTag);
		
		model.addAttribute("name", name);
		model.addAttribute("idntt", idntt);
		model.addAttribute("memContent", memContent);
		model.addAttribute("intTag", intTag);
		model.addAttribute("joinStudy", joinStudy);
		
		view = "/WEB-INF/views/member/AjaxMemModal.jsp";
		
		return view;
		
	}

	// 수진
	// ---------------------------------------------------------------------------------

	// 스터디 리스트 화면 노출하기
	@RequestMapping(value = "/studylist.action", method = RequestMethod.GET)
	public String memberJoin(Model model, HttpServletRequest request)
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
		model.addAttribute("count", studyDao.studyCount());
		
		model.addAttribute("studyTags", studyDao.studyTagList());	// 모든 스터디의 모든 키워드 

		view = "WEB-INF/views/study/StudyList.jsp";

		return view;
	}
	
	// 스터디 리스트에서 스터디 클릭 시 비밀번호 확인 AJAX 처리
	@ResponseBody
	@RequestMapping(value = "/stuscrtcheck.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String checkSpaIdAjax(HttpServletRequest request, Model model)
	{

		IStudyDAO studyDao = sqlSession.getMapper(IStudyDAO.class); // 스터디 정보

		String stu_cd = request.getParameter("stu_cd");
		System.out.println("스터디코드 : " + stu_cd);

		String scrt_num = studyDao.studyScrt(request.getParameter("stu_cd"));
		System.out.println("비밀번호 : " + scrt_num);

		return String.valueOf(scrt_num);

	}
	
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
	

	

}
