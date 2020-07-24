/*===========================
	MemberController.java
	- 占쎄텢占쎌뒠占쎌쁽 占쎌젟占쎌벥 �뚢뫂�뱜嚥▲끇�쑎
===========================*/


package com.sys.comeit;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.SessionScope;

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
		
		System.out.println(id);
		System.out.println(pwd);
		
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("adminSearchList", dao.adminSearchList(id));
		model.addAttribute("args", "/WEB-INF/views/admin/AdminInfoMod.jsp");
		
		view = "/WEB-INF/views/admin/PageLayout.jsp";
		
		return view;
	}
	
	@RequestMapping(value = "/spacelist.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String spaceList(Model model)
	{
		String view = null;
		
		ISpaDAO spaDao = sqlSession.getMapper(ISpaDAO.class);
		
		model.addAttribute("spaList", spaDao.spaList());
		System.out.println(spaDao.spaList().get(0).getSpa_id());
		System.out.println(spaDao.spaList().get(0).getSpa_cd());
		System.out.println(spaDao.spaList().get(0).getName());
		System.out.println(spaDao.spaList().get(0).getEmail());
		System.out.println(spaDao.spaList().get(0).getJoin_date());
		System.out.println(spaDao.spaList().get(0).getTel());
		
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
	public String adminList(Model model)
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
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
	public String adminComAppealList(Model model)
	{
		String view = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		//model.addAttribute("list", 筌뤿굝�뼊);
		// model.addAttribute("list", dao.list());
		model.addAttribute("args", "/WEB-INF/views/admin/AdminComAppealList.jsp");
		
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
	public String banAdd(BanDTO dto)
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
	
	
}
