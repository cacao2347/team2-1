/*===========================
	MemberController.java
	- 占쎄텢占쎌뒠占쎌쁽 占쎌젟占쎌벥 �뚢뫂�뱜嚥▲끇�쑎
===========================*/


package com.sys.comeit;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.SessionScope;

import com.sys.comeit.util.MyUtil;

@Controller
public class AdminController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/admin_info_pwd.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String AdminInfoPwd(Model model, HttpServletRequest request)
	{
		String view = null;
		
		model.addAttribute("args", "/WEB-INF/views/admin/AdminInfoPwd.jsp");
		
		view = "/WEB-INF/views/admin/PageLayout.jsp";
		
		return view;
	}
	@RequestMapping(value = "/admin_info_mod.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String AdminInfoMod(Model model, HttpServletRequest request)
	{
		HttpSession session= request.getSession();
		String id = (String) session.getAttribute("id");
		String pwd = (String) session.getAttribute("pwd");
		String name = (String) session.getAttribute("name");
		
		System.out.println(id);
		System.out.println(pwd);
		System.out.println(name);
		
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("adminSearchList", dao.adminSearchList(id));
		model.addAttribute("args", "/WEB-INF/views/admin/AdminInfoMod.jsp");
		
		view = "/WEB-INF/views/admin/PageLayout.jsp";
		
		return view;
	}
	
	@RequestMapping(value = "/adminspalist.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String spaceList(Model model)
	{
		String view = null;
		
		IAdminDAO admDao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("adminspaList", admDao.admspaList());
		
		model.addAttribute("args", "/WEB-INF/views/admin/AdminSpaceList.jsp");
		
		view = "/WEB-INF/views/admin/PageLayout.jsp";
		
		return view;
	}
	
	@RequestMapping(value = "/adminmemberlist.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String memberList(Model model)
	{
		String view = null;
		
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		model.addAttribute("memberList", dao.memberList());
		model.addAttribute("args", "/WEB-INF/views/admin/MemberList.jsp");
		
		view = "/WEB-INF/views/admin/PageLayout.jsp";
		
		return view;
	}
	
	@RequestMapping(value = "/adminlist.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminList(Model model, HttpServletRequest request)
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		//AdminDTO admin = dao.adminSearchList((String) request.getAttribute("id"));
		
		//model.addAttribute("admin", admin);
		model.addAttribute("adminList", dao.adminList());
		model.addAttribute("args", "/WEB-INF/views/admin/AdminList.jsp");
		
		view = "/WEB-INF/views/admin/PageLayout.jsp";
		
		return view;
	}
	
	@RequestMapping(value = "/adminadd.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminAdd(AdminDTO dto)
	{
		String view = "redirect:adminlist.action";

		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		dao.adminAdd(dto);
		
		return view;
	}
	
	@RequestMapping(value = "/adminmodify.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminModify(AdminDTO dto, HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		
		String view = "redirect:adminlist.action";

		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		String admin_cd = request.getParameter("name");
		String pwd = request.getParameter("password");
		String tel = request.getParameter("phoneNumber");
		String email = request.getParameter("email");

		dto.setPwd(pwd); 
		System.out.println(dto.getPwd());
		dto.setTel(tel);
		System.out.println(dto.getTel());
		dto.setEmail(email);
		System.out.println(dto.getEmail());
		dto.setAdmin_cd(admin_cd);
		
		dao.adminModify(dto);
		System.out.println(dao.adminModify(dto));
		
		session.setAttribute("pwd", pwd);
		return view;
	}

	
	@RequestMapping(value = "/admindelete.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminDelete(String admin_cd)
	{
		String view = "redirect:adminlist.action";

		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		System.out.println(admin_cd);
  
		dao.adminDelete(admin_cd);

		return view;
	}

	
	@RequestMapping(value = "/admin_com_appeal_list.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminComAppealList(Model model, HttpServletRequest request) throws UnsupportedEncodingException
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		//model.addAttribute("ComApList", dao.adminComAppealList());
		model.addAttribute("args", "/WEB-INF/views/admin/AdminComAppealList.jsp");
		
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

		if(searchValue == "승인"|| searchValue =="승인완료")
		{
			searchValue = "YES";
		}
		
		if(searchValue == "거부"|| searchValue =="거부완료")
		{
			searchValue = "NO";
		}
		
		
		
		searchKey = request.getParameter("searchKey");
		System.out.println("searchKey : " + searchKey);
		searchValue = request.getParameter("searchValue");
		if(searchValue == "확인")
		{
			searchValue = "CHECK";
		}
		System.out.println("searchValue : " +searchValue);

		if (searchKey == null)
		{
			searchKey = "TYPE";
			searchValue = "";
		}
		
		
		
		
		if (request.getMethod().equalsIgnoreCase("GET"))
		{
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}

		AdmSpaReqDTO dto = new AdmSpaReqDTO();

		dto.setSearchKey(searchKey);
		dto.setSearchValue(searchValue);
		
		/* lecDao.getListData(dto); */
		
		// 전체 데이터 개수
		int dataCount = dao.comapplSearchCount(dto); // 검색 완료된 데이터 개수
		
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
		List<AdmSpaReqDTO> ComApList = dao.comapplListData(dto);

		String params = "";
		if (searchValue != null && searchValue.length() != 0)
		{
			searchValue = URLEncoder.encode(searchKey, "UTF-8");
			params = "searchKey=" + searchKey + "&searchValue=" + searchValue;
		}

		String cp = request.getContextPath();

		// 페이징 처리
		String listUrl = cp + "/admin_com_appeal_list.action";
		if (params.length() != 0)
		{
			listUrl += "?" + params;
		}

		String pageIndexList = util.pageIndexList(currentPage, totalPage, listUrl);
		System.out.println("pageIndexList : " + pageIndexList);
		
		// 포워딩할 studylist.jsp 에 넘겨준다.
		request.setAttribute("ComApList", ComApList);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("dataCount", dataCount);
				
		view = "/WEB-INF/views/admin/PageLayout.jsp";
		
		return view;
	}
	
	@RequestMapping(value = "/admin_com_appeal_detail.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String AdminComAppealDetail(Model model)
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("args", "/WEB-INF/views/admin/AdminComAppealDetail.jsp");
		
		view = "/WEB-INF/views/admin/PageLayout.jsp";
		
		return view;
	}
	
	@RequestMapping(value = "/admin_report.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminReport(Model model)
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		//model.addAttribute("list", 筌뤿굝�뼊);
		// model.addAttribute("list", dao.list());
		model.addAttribute("args", "/WEB-INF/views/admin/AdminReport.jsp");
		
		view = "/WEB-INF/views/admin/PageLayout.jsp";
		
		return view;
	}
	
	@RequestMapping(value = "/admin_report_reject_list.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminReportRejectList(Model model)
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		//model.addAttribute("list", 筌뤿굝�뼊);
		// model.addAttribute("list", dao.list());
		model.addAttribute("args", "/WEB-INF/views/admin/AdminReportRejectList.jsp");
		
		view = "/WEB-INF/views/admin/PageLayout.jsp";
		
		return view;
	}
	
	@RequestMapping(value = "/admin_penalty.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminPenalty(Model model)
	{
		String view = null;
		
		IMemPnltDAO pnltDao = sqlSession.getMapper(IMemPnltDAO.class);
		
		model.addAttribute("mempnltList", pnltDao.memPnltList());
		model.addAttribute("args", "/WEB-INF/views/admin/AdminPenalty.jsp");
		
		view = "/WEB-INF/views/admin/PageLayout.jsp";
		
		return view;
	}
	
	
	@RequestMapping(value = "/admin_stop.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminStop(Model model)
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		//model.addAttribute("list", 筌뤿굝�뼊);
		// model.addAttribute("list", dao.list());
		model.addAttribute("args", "/WEB-INF/views/admin/AdminStop.jsp");
		
		view = "/WEB-INF/views/admin/PageLayout.jsp";
		
		return view;
	}
	
	@RequestMapping(value = "/admin_ask_list.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminAskList(Model model)
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		//model.addAttribute("list", 筌뤿굝�뼊);
		// model.addAttribute("list", dao.list());
		model.addAttribute("args", "/WEB-INF/views/admin/AdminAskList.jsp");
		
		view = "/WEB-INF/views/admin/PageLayout.jsp";
		
		return view;
	}
	
	@RequestMapping(value = "/admin_ask_refund_list.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminAskRefundList(Model model)
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		//model.addAttribute("list", 筌뤿굝�뼊);
		// model.addAttribute("list", dao.list());
		model.addAttribute("args", "/WEB-INF/views/admin/AdminAskRefundList.jsp");
		
		view = "/WEB-INF/views/admin/PageLayout.jsp";
		
		return view;
	}
	
	@RequestMapping(value = "/admin_appeal.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminAppeal(Model model)
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		//model.addAttribute("list", 筌뤿굝�뼊);
		// model.addAttribute("list", dao.list());
		model.addAttribute("args", "/WEB-INF/views/admin/AdminAppeal.jsp");
		
		view = "/WEB-INF/views/admin/PageLayout.jsp";
		
		return view;
	}
	
	@RequestMapping(value = "/admin_appeal_reject_list.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminAppealRejectList(Model model)
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		//model.addAttribute("list", 筌뤿굝�뼊);
		// model.addAttribute("list", dao.list());
		model.addAttribute("args", "/WEB-INF/views/admin/AdminAppealRejectList.jsp");
		
		view = "/WEB-INF/views/admin/PageLayout.jsp";
		
		return view;
	}
	
	@RequestMapping(value = "/admin_block.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminBlock(Model model)
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		//model.addAttribute("list", 筌뤿굝�뼊);
		// model.addAttribute("list", dao.list());
		model.addAttribute("args", "/WEB-INF/views/admin/AdminBlock.jsp");
		
		view = "/WEB-INF/views/admin/PageLayout.jsp";
		
		return view;
	}
	
	
	@RequestMapping(value = "/admin_prof_list.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminProfList(Model model)
	{
		String view = null;
		
		IProDAO proDao = sqlSession.getMapper(IProDAO.class);
		
		model.addAttribute("proList", proDao.proList());
		model.addAttribute("args", "/WEB-INF/views/admin/AdminProfList.jsp");
		
		view = "/WEB-INF/views/admin/PageLayout.jsp";
		
		return view;
	}
	
	
	@RequestMapping(value = "/admin_space_reject_list.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminSpaceRejectList(Model model)
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		//model.addAttribute("list", 筌뤿굝�뼊);
		// model.addAttribute("list", dao.list());
		model.addAttribute("args", "/WEB-INF/views/admin/AdminSpaceRejectList.jsp");
		
		view = "/WEB-INF/views/admin/PageLayout.jsp";
		
		return view;
	}
	
	@RequestMapping(value = "/admin_cal.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminCal(Model model)
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		//model.addAttribute("list", 筌뤿굝�뼊);
		// model.addAttribute("list", dao.list());
		model.addAttribute("args", "/WEB-INF/views/admin/AdminCal.jsp");
		
		view = "/WEB-INF/views/admin/PageLayout.jsp";
		
		return view;
	}
	
	@RequestMapping(value = "/admin_refund.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminRefund(Model model)
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		//model.addAttribute("list", 筌뤿굝�뼊);
		// model.addAttribute("list", dao.list());
		model.addAttribute("args", "/WEB-INF/views/admin/AdminRefund.jsp");
		
		view = "/WEB-INF/views/admin/PageLayout.jsp";
		
		return view;
	}
	
	
	
	@RequestMapping(value = "/admin_refund_detail.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String AdminRefundDetail(Model model)
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("args", "/WEB-INF/views/admin/AdminRefunDetail.jsp");
		
		view = "/WEB-INF/views/admin/PageLayout.jsp";
		
		return view;
	}
	
	@RequestMapping(value = "/admin_refund_reject_list.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String adminRefundRejectList(Model model)
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		//model.addAttribute("list", 筌뤿굝�뼊);
		// model.addAttribute("list", dao.list());
		model.addAttribute("args", "/WEB-INF/views/admin/AdminRefundRejectList.jsp");
		
		view = "/WEB-INF/views/admin/PageLayout.jsp";
		
		return view;
	}
	
	@RequestMapping(value="/studynotice.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String studyList(Model model)
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		//model.addAttribute("list", 筌뤿굝�뼊);
		// model.addAttribute("list", dao.list());
		model.addAttribute("args", "/WEB-INF/views/admin/StudyNoticeList.jsp");
		
		view = "/WEB-INF/views/admin/PageLayout.jsp";
		
		return view;
		
	}
	
	@RequestMapping(value="/board.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String BoardList(Model model)
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		//model.addAttribute("list", 筌뤿굝�뼊);
		// model.addAttribute("list", dao.list());
		model.addAttribute("args", "/WEB-INF/views/admin/Board.jsp");
		
		view = "/WEB-INF/views/admin/PageLayout.jsp";
		
		return view;
		
	}
	
	
	@RequestMapping(value = "/banlist.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String banList(Model model)
	{
		String view = null;

		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		model.addAttribute("banList", dao.banList());
		model.addAttribute("args", "/WEB-INF/views/admin/AdminBanList.jsp");

		view = "/WEB-INF/views/admin/PageLayout.jsp";

		return view;

	}
	

	
	@RequestMapping(value = "/banadd.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String banAdd(BanDTO dto, HttpServletRequest request)
	{
		String view = "redirect:banlist.action";

		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		System.out.println(dto.getBan());

		dao.banAdd(dto);

		return view;
	}
	

	
	@RequestMapping(value = "/bandelete.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String banDelete(String lngg_ban_cd)
	{
		String view = "redirect:banlist.action";

		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		System.out.println(lngg_ban_cd);

		dao.banDelete(lngg_ban_cd);

		return view;
	}
	
	// 관리자 업체 요청 확인
	@RequestMapping(value = "/ajaxcpcheck.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String ajaxCpCheck(HttpServletRequest request)
	{

		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class); 
		
		String spa_req_cd = request.getParameter("spa_req_cd");
		System.out.println(spa_req_cd);
		
		dao.spaCheckMod(spa_req_cd);
		view = "WEB-INF/views/admin/admin_com_appeal_list.action";

		return view;

	}
	
	// 관리자 업체 요청 승인/거부
	@RequestMapping(value = "/ajaxcpconfirm.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String selectAjax(HttpServletRequest request)
	{

		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class); 
		
		String admin_cd = request.getParameter("admin_cd");
		String spa_req_cd = request.getParameter("spa_req_cd");
		String check_type_cd = request.getParameter("check_type_cd");
		
		System.out.println(spa_req_cd);
		System.out.println(check_type_cd);
		
		AdmSpaReqDTO dto = new AdmSpaReqDTO();
		
		dto.setAdmin_cd(admin_cd);
		dto.setSpa_req_cd(spa_req_cd);
		dto.setCheck_type_cd(check_type_cd);
		
		dao.spaConfirmMod(dto);
		
		view = "WEB-INF/views/admin/admin_com_appeal_list.action";

		return view;

	}
	
	
	
}
