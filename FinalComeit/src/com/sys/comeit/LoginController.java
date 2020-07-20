package com.sys.comeit;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/memberlogin.action", method = RequestMethod.GET)
	public String memberJoin(Model model)
	{
		String view = null;
		
		view = "/WEB-INF/views/member/MemberLogin.jsp";
		
		return view;
	}
	

}
