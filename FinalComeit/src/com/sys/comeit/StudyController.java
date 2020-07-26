package com.sys.comeit;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sys.comeit.util.MyUtil;

@Controller
public class StudyController
{
	@Autowired
	private SqlSession sqlSession;

	// 기혜
	// ---------------------------------------------------------------------------------
	// ★
	@RequestMapping(value = "/studydetail.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String studyBfInfo(Model model, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		
		String mem_cd = (String)session.getAttribute("mem_cd");
		
		String view = null;
		
		IStudyDAO studyDao = sqlSession.getMapper(IStudyDAO.class);

		String stuCd = request.getParameter("stu_cd");
		// 1. stu_cd로 스터디 시작일/ 확정일 조회
		// 2. stu_cd로 참가 회원 코드 조회

		// 오늘 날짜 구하기
		Date sysdate = new Date();
		SimpleDateFormat date = new SimpleDateFormat("YYYY-MM-DD");
		int strDateCompare = 0;
		
		// 스터디방 정보 조회
		StudyDTO dto = studyDao.studyInfoSearch(stuCd);

		
		// 시작일 확정일 비교
		if (dto != null)
		{
			String strDate = dto.getStr_date();
			strDateCompare = date.format(sysdate).compareTo(strDate);
			
			if (strDateCompare < 0) 		// 시작일 전
			{
				view = "/WEB-INF/views/study/StudyBfDetail.jsp";
			}
			else 							// 시작일 또는 시작일보다 큼
			{
				StudyDTO search = new StudyDTO();
				search.setJoin_mem_cd(mem_cd);
				search.setStu_cd(stuCd);
				
				// 참여 여부 				
				int joinMem = studyDao.stuJoinMemSearch(search);
				
				if (dto.getCmt_date()!=null && joinMem != 0) 
					view = "/WEB-INF/views/study/StudyAfDetail.jsp";
				else 
					view = "/WEB-INF/views/study/StudyBfDetail.jsp";
			}
			
			
			// 스터디방 정보
			model.addAttribute("studyInfo", dto);
			// 스터디방 관심태그
			model.addAttribute("intTag", studyDao.studyIntTagSearch(stuCd));
			// 스터디방 기타 관심 태그
			model.addAttribute("etcTag", studyDao.studyEtcTagSearch(stuCd));
			// 스터디방 진행 요일
			model.addAttribute("dayName", studyDao.studyDaySearch(stuCd));
			// 스터디장 이름
			model.addAttribute("leaderName", studyDao.studyLeaderSearch(stuCd));
			// 스터디원 이름
			model.addAttribute("joinName", studyDao.studyJoinName(stuCd));
			// 스터디 참여자 이미지
			model.addAttribute("memImg", studyDao.memImgSearch(stuCd));
			
			
		}
		
		
		return view;
	}
	
	// 스터디 참가
	@ResponseBody
	@RequestMapping(value = "/studyjoin.action", method = {RequestMethod.GET, RequestMethod.POST})
	public int studyJoin(Model model, HttpServletRequest request)
	{
		//String view = null;
		
		HttpSession session = request.getSession();
		IStudyDAO studyDao = sqlSession.getMapper(IStudyDAO.class);
		
		// 멤버 코드
		String mem_cd = (String)session.getAttribute("mem_cd"); 
		String stu_cd = request.getParameter("stuCode");
		
		// 스터디방 정보 조회
		StudyDTO dto = studyDao.studyInfoSearch(stu_cd);
		
		
		// 오늘 날짜 구하기
		Date sysdate = new Date();
		SimpleDateFormat date = new SimpleDateFormat("YYYY-MM-DD");
		int strDateCompare = 0;
		int insertRslt = 0;
		
		// 시작일 확정일 비교
		if (dto != null)
		{
			String strDate = dto.getStr_date();
			strDateCompare = date.format(sysdate).compareTo(strDate);
			
			int joinMem = studyDao.joinMemNum(stu_cd);
			
			
			// 방에 참가중인지 아닌지 여부
			StudyDTO mem = new StudyDTO();
			mem.setJoin_mem_cd(mem_cd);
			mem.setStu_cd(stu_cd);
			int myJoin = studyDao.stuJoinMemSearch(mem);
			
			// 시작일 전 + 모집인원이 다 차지 않은 경우 + 방에 참가중이지 않은 경우
			if (strDateCompare <= 0 && joinMem < dto.getMem_num() && myJoin == 0) 	
				insertRslt = studyDao.joinStudy(mem);
								
			// 테스트
			//System.out.println(view + strDateCompare + strDate +testDate + "/" + sysdate);
			
		}
		
		return insertRslt;
	
	}
	
	
	// 스터디 커밋
	@ResponseBody
	@RequestMapping(value = "/leadercommit.action", method = {RequestMethod.GET, RequestMethod.POST})
	public int leaderCommit(Model model, HttpServletRequest request)
	{
		
		IStudyDAO studyDao = sqlSession.getMapper(IStudyDAO.class);
		
		int result = studyDao.studyCommit("stuCode");
		
		return result;
	}
	
	
	
	// 스터디장 모달창 정보 
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
	@RequestMapping(value = "/studylist.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String memberJoin(Model model, HttpServletRequest request) throws UnsupportedEncodingException
	{
		String view = null;

		IStuCatDAO stuCatDao = sqlSession.getMapper(IStuCatDAO.class); // 스터디 카테고리
		IAreaDAO areaDao = sqlSession.getMapper(IAreaDAO.class); // 지역
		ILevelDAO levelDao = sqlSession.getMapper(ILevelDAO.class); // 레벨

		IStudyDAO studyDao = sqlSession.getMapper(IStudyDAO.class); // 스터디 정보

		model.addAttribute("stuCat", stuCatDao.stuCatList());
		model.addAttribute("area", areaDao.areaList());
		model.addAttribute("level", levelDao.levelList());

		// model.addAttribute("study", studyDao.studyList()); // 실제 스터디 리스트
		model.addAttribute("count", studyDao.studyCount());

		model.addAttribute("studyTags", studyDao.studyTagList()); // 모든 스터디의 모든 키워드

		// 페이징 처리 --------------------------------------

		MyUtil util = new MyUtil();

		String pageNum = request.getParameter("pageNum"); // 페이지 번호? 왜 삭제 버튼에서..?

		int currentPage = 1;
		if (pageNum != null && pageNum.length() != 0)
		{
			currentPage = Integer.parseInt(pageNum);
		}

		String searchKey = null;
		String searchValue = null;

		searchKey = request.getParameter("searchKey");
		System.out.println("searchKey : " + searchKey);
		searchValue = request.getParameter("searchValue");
		System.out.println("searchValue : " +searchValue);

		if (searchKey == null)
		{
			searchKey = "title";
			searchValue = "";
		}

		if (request.getMethod().equalsIgnoreCase("GET"))
		{
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}

		StudyDTO dto = new StudyDTO();

		dto.setSearchKey(searchKey);
		dto.setSearchValue(searchValue);

		// 전체 데이터 개수
		int dataCount = studyDao.studySearchCount(dto); // 검색 완료된 데이터 개수

		// 전체 페이지 수 구하기
		int numPerPage = 10;
		int totalPage = util.getPageCount(numPerPage, dataCount);

		// 전체 페이지 수 보다 현재 표시할 페이지가 큰 경우
		if (totalPage < currentPage)
		{
			currentPage = totalPage;
		}

		// 테이블에서 가져올 리스트들의 시작과 끝 위치
		int start = (currentPage - 1) * numPerPage + 1;
		int end = currentPage * numPerPage;

		System.out.println("start : " + start);
		System.out.println("end : " + end);

		dto.setStart(start);
		dto.setEnd(end);

		// 테이블에서 리스트를 출력할 데이터 가져오기
		List<StudyDTO> study = studyDao.getListData(dto);

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
		{
			listUrl += "?" + params;
		}

		String pageIndexList = util.pageIndexList(currentPage, totalPage, listUrl);

		// 포워딩할 studylist.jsp 에 넘겨준다.
		request.setAttribute("study", study);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);

		view = "WEB-INF/views/study/StudyList.jsp";

		return view;
	}

	// 스터디 리스트에서 스터디 클릭 시 비밀번호 확인 AJAX 처리
	@ResponseBody
	@RequestMapping(value = "/stuscrtcheck.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
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
		IStuCatDAO stuCatDao = sqlSession.getMapper(IStuCatDAO.class); // 카테고리

		model.addAttribute("area", areaDao.areaList()); // 지역
		model.addAttribute("level", levelDao.levelList()); // 레벨
		model.addAttribute("idntt", idnttDao.idnttList()); // 신분
		model.addAttribute("day", dayDao.dayList()); // 요일
		model.addAttribute("intTag", intTagDao.intTagList()); // 관심키워드
		model.addAttribute("meetTerm", meetTermDao.meetTermList()); // 기간
		model.addAttribute("stuCat", stuCatDao.stuCatList()); // 카테고리

		view = "WEB-INF/views/study/StudyCreate.jsp";

		return view;
	}

	// 스터디방 개설하기 → 프로시저 호출 및 관련 테이블 insert
	@RequestMapping(value = "/studycreate.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String studyCreate(Model model, HttpServletRequest request)
	{
		String view = null;

		IStudyDAO studyDao = sqlSession.getMapper(IStudyDAO.class);

		// 필수 항목
		HttpSession session = request.getSession();

		// 세션에 있는 회원코드 받아내기
		String mem_cd = (String) session.getAttribute("mem_cd"); // 개설자의 회원코드

		// 필수 항목
		String spc_area_cd = request.getParameter("spcArea"); // 세부지역코드
		String meet_term_cd = request.getParameter("term"); // 모임 기간 코드
		String idntt_cd = request.getParameter("Idntt"); // 신분 코드
		String lv_cd = request.getParameter("level"); // 레벨 코드
		String stu_cat_cd = request.getParameter("stuCat"); // 스터디 카테고리 코드
		String title = request.getParameter("title"); // 제목
		String str_date = request.getParameter("start"); // 시작날짜
		int mem_num = Integer.parseInt(request.getParameter("stuNum")); // 인원 수
		String content = request.getParameter("content"); // 상세 설명
		// 선택 항목
		String img_url = request.getParameter("okFile"); // 대표 이미지
		String scrt_num = request.getParameter("scrt"); // 비밀방 번호

		if (scrt_num == "") // 비밀번호가 없다면 null
			scrt_num = null;

		if (img_url == "") // 대표 이미지가 없다면 null
			img_url = null;

		/*
		 * System.out.println("파라미터 값"); System.out.println(mem_cd); // null
		 * System.out.println(spc_area_cd); System.out.println(meet_term_cd); // null
		 * System.out.println(idntt_cd); System.out.println(lv_cd);
		 * System.out.println(stu_cat_cd); // null System.out.println(title);
		 * System.out.println(str_date); System.out.println(mem_num);
		 * System.out.println(content); System.out.println(img_url);
		 * System.out.println(scrt_num); System.out.println("파라미터 끝");
		 */

		StudyDTO dto = new StudyDTO();

		dto.setCrt_mem_cd(mem_cd);
		dto.setSpc_area_cd(spc_area_cd);
		dto.setMeet_term_cd(meet_term_cd);
		dto.setIdntt_cd(idntt_cd);
		dto.setLv_cd(lv_cd);
		dto.setStu_cat_cd(stu_cat_cd);
		dto.setTitle(title);
		dto.setStr_date(str_date);
		dto.setMem_num(mem_num);
		dto.setContent(content);
		dto.setImg_url(img_url);
		dto.setScrt_num(scrt_num);

		studyDao.studyInsert(dto); // 실제 스터디 개설 프로시저 호출

		String stu_cd = dto.getStu_cd(); // out 변수인 pk 담기

		String[] intTagList =
		{};
		String[] etcTagList =
		{};

		if (request.getParameterValues("intTagList") != null)
		{
			intTagList = request.getParameterValues("intTagList"); // 선택한 모든 관심 키워드 배열에 넣기
		}

		if (request.getParameterValues("etcTagList") != null)
		{
			etcTagList = request.getParameterValues("etcTagList"); // 선택한 모든 관심 기타 키워드 배열에 넣기
		}

		String[] dayList = request.getParameterValues("dayList"); // 선택한 모든 요일

		// System.out.println("그냥 관심 : " + intTagList.length);
		// System.out.println("기타 관심 : " + etcTagList.length);
		// System.out.println("요일 : " + dayList.length);

		if (stu_cd != null)
		{
			if (intTagList.length > 0)
			{
				for (int i = 0; i < intTagList.length; i++) // 선택한 모든 관심 키워드 중에
				{
					dto.setInt_tag_cd(intTagList[i]); // 자바를 키워드에 세팅하고

					// System.out.println("각 관심 : " + intTagList[i]);

					studyDao.studyIntTagInsert(dto); // 회원관심 키워드 insert 실행시키기
				}
			}
			if (etcTagList.length > 0)
			{
				for (int i = 0; i < etcTagList.length; i++) // 선택한 모든 관심 기타 키워드 중에
				{
					// value에 따른 코드 뽑아내는 dao 호출

					dto.setEtc_tag_cd(etcTagList[i]); // 기타태그를 키워드에 세팅하고
					// System.out.println("각 기타 : " + etcTagList[i]);

					studyDao.studyEtcTagInsert(dto); // 기타 키워드 insert 실행시키기

					int etcTagCount = studyDao.studyEtcTagCount(etcTagList[i]);

					if (etcTagCount == 10) // 회원 관심 기타 키워드 테이블 호출해서 10개일 경우
						studyDao.addTagName(etcTagList[i]); // 그냥 관심키워드 테이블에 insert 시키기

				}
			}
			if (dayList.length > 0)
			{
				for (int i = 0; i < dayList.length; i++) // 선택한 모든 요일
				{
					dto.setStu_day_cd(dayList[i]);
					// System.out.println("각 요일 : " + dayList[i]);

					studyDao.studyDayInsert(dto); // 진행 요일에 insert 시키기
				}
			}

			view = "redirect:studylist.action"; // 스터디 리스트 페이지로 이동

		} else
		{
			view = "redirect:studycreate.action"; // 스터디 개설 페이지 다시 요청
		}

		view = "redirect:studylist.action"; // 스터디 리스트 페이지로 이동

		return view;
	}

	// 스터디 개설 클릭 시 회원이 참가중인 스터디 개수 체크 → 10개 이하만 가능
	@ResponseBody
	@RequestMapping(value = "/stucreatecnt.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String stuCreateCnt(HttpServletRequest request, Model model)
	{

		IStudyDAO studyDao = sqlSession.getMapper(IStudyDAO.class); // 스터디 정보

		HttpSession session = request.getSession();

		// 세션에 있는 회원코드 받아내기
		String mem_cd = (String) session.getAttribute("mem_cd"); // 개설자의 회원코드

		int stu_count = studyDao.memStudyCount(mem_cd);
		System.out.println("스터디 개수 : " + stu_count);

		return String.valueOf(stu_count);

	}

}
