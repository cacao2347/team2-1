/*===========================
	JoinController.java
	- 회원가입 컨트롤러
===========================*/

package com.sys.comeit;


import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class JoinController
{
	@Autowired
	private SqlSession sqlSession;
	
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
		
		
		IIdnttDAO idnttDao = sqlSession.getMapper(IIdnttDAO.class); 
		IAreaDAO areaDao = sqlSession.getMapper(IAreaDAO.class); 
		ISpcAreaDAO spcAreaDao = sqlSession.getMapper(ISpcAreaDAO.class); 
		IIntTagDAO intTagDao = sqlSession.getMapper(IIntTagDAO.class);
		  
		model.addAttribute("idntt", idnttDao.idnttList()); 
		model.addAttribute("area", areaDao.areaList()); 
		model.addAttribute("spcArea", spcAreaDao.spcAreaList());
		model.addAttribute("intTag", intTagDao.intTagList());
		 
		
		view = "/WEB-INF/views/member/MemberJoin.jsp";
		
		return view;
	}
	
	@RequestMapping(value= "/sendsms.action", method = RequestMethod.GET)
	public void sendSms()
	{
		String api_key = "NCSQ1JKQ4YU5EFZ8";
		String api_secret = "RB1KRCMOO2KRFIYVCDTQLMV3FZSKDX7O";
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", "01099044626");
		params.put("from", "01022319316"); // 무조건 자기번호 (인증)
		params.put("type", "SMS");
		params.put("text", "안녕하세요 COME-IT 사이트 문자 인증 번호는 ... 입니다.");
		params.put("app_version", "test app 1.2"); // application name and version

		try
		{
			// send() 는 메시지를 보내는 함수
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e)
		{
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}

}
