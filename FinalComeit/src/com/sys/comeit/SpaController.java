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
public class SpaController
{
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/spalist.action", method = RequestMethod.GET)
	public String spaList(Model model)
	{
		String view = null;

		view = "/WEB-INF/views/space/SpaceList.jsp";

		return view;
	}

	// 공간 등록 키워드
	  @RequestMapping(value = "/spacreate.action", method = RequestMethod.GET)
	  public String spaCreate(Model model) 
	  { 
		  String view = null;
	  
		  IAreaDAO areaDao = sqlSession.getMapper(IAreaDAO.class);
		  ISpaTagDAO ispaTagDao = sqlSession.getMapper(ISpaTagDAO.class);
		  
		  model.addAttribute("area", areaDao.areaList()); 
		  model.addAttribute("spaTag",ispaTagDao.spaTagList());
		  
		  view = "WEB-INF/views/space/SpaceCreate.jsp";
		  
		  return view; 
	  }
	  
		/*
		 * // 지역에 맞는 세부지역 뿌려주는 AJAX 처리
		 * 
		 * @RequestMapping(value = "/areaajax.action", method = RequestMethod.POST)
		 * public String selectAjax(HttpServletRequest request, Model model) {
		 * 
		 * String view = null;
		 * 
		 * ISpcAreaDAO spcAreaDao = sqlSession.getMapper(ISpcAreaDAO.class);
		 * 
		 * ArrayList<SpcAreaDTO> list =
		 * spcAreaDao.spcAreaList(request.getParameter("area_cd"));
		 * 
		 * model.addAttribute("spcAreaList", list);
		 * 
		 * view = "WEB-INF/views/member/AjaxJoinSpcArea.jsp";
		 * 
		 * return view;
		 * 
		 * }
		 */
	 
}
