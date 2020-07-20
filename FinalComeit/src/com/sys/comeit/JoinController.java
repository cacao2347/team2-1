/*===========================
	JoinController.java
	- 회원가입 컨트롤러
===========================*/

package com.sys.comeit;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class JoinController
{
	@Autowired
	// private SqlSession sqlSession;
	
	/*
	 * @RequestMapping(value = "/memberinsert.action", method = RequestMethod.POST)
	 * public String memberInsert(MemberDTO m) { String view =
	 * "redirect:memberlist.action";
	 * 
	 * IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
	 * 
	 * dao.add(m);
	 * 
	 * return view;
	 * 
	 * }
	 */
	
	@RequestMapping(value = "/memberjoin.action", method = RequestMethod.GET)
	public String memberJoin(Model model)
	{
		String view = null;
		
		/*
		 * IIdnttDAO idnttDao = sqlSession.getMapper(IIdnttDAO.class); IAreaDAO areaDao
		 * = sqlSession.getMapper(IAreaDAO.class); ISpcAreaDAO spcAreaDao =
		 * sqlSession.getMapper(ISpcAreaDAO.class); IIntTagDAO intTagDao =
		 * sqlSession.getMapper(IIntTagDAO.class);
		 * 
		 * model.addAttribute("idntt", idnttDao.idnttList()); model.addAttribute("area",
		 * areaDao.areaList()); model.addAttribute("spcArea", spcAreaDao.spcAreaList());
		 * model.addAttribute("intTag", intTagDao.intTagList());
		 */
		
		view = "/WEB-INF/views/member/MemberJoin.jsp";
		
		return view;
	}
	

}
