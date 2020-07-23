package com.sys.comeit;


import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SpaController
{
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/spalist.action", method = RequestMethod.GET)
	public String spaList()
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
	  
	  // 사업자 번호 중복 확인 ajax
		@ResponseBody
		@RequestMapping(value = "/checkspanum.action", method = RequestMethod.POST)
		public String checkidAjax(HttpServletRequest request, Model model)
		{
			ISpaNumDAO iSpaNumDao = sqlSession.getMapper(ISpaNumDAO.class);

			int aa = Integer.parseInt(request.getParameter("aa"));

			int result = iSpaNumDao.spacheckCount(aa);
			System.out.println(result);

			return String.valueOf(result);
		}
	  
	 
}
