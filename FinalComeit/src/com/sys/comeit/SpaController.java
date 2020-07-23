package com.sys.comeit;

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

	@RequestMapping(value = "/spacreate.action", method = RequestMethod.GET)
	public String spacreate(Model model)
	{
		String view = null;

		view = "/WEB-INF/views/space/SpaceCreate.jsp";

		return view;
	}

	// 공간 등록 키워드
	/*
	 * @RequestMapping(value = "/memberjoin.action", method = RequestMethod.GET)
	 * public String memberJoin(Model model) { String view = null;
	 * 
	 * IAreaDAO areaDao = sqlSession.getMapper(IAreaDAO.class); ISpcAreaDAO
	 * spcAreaDao = sqlSession.getMapper(ISpcAreaDAO.class); IIntTagDAO intTagDao =
	 * sqlSession.getMapper(IIntTagDAO.class);
	 * 
	 * model.addAttribute("area", areaDao.areaList()); model.addAttribute("spcArea",
	 * spcAreaDao.spcAreaList()); model.addAttribute("intTag",
	 * intTagDao.intTagList());
	 * 
	 * view = "WEB-INF/views/member/MemberJoin.jsp";
	 * 
	 * return view; }
	 */
}
