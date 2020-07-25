package com.sys.comeit;

import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
public class LoginController
{
   @Autowired
   private SqlSession sqlSession;
   
   @RequestMapping(value = "/memberlogin.action", method = {RequestMethod.GET, RequestMethod.POST})
   public String memberLogin(Model model)
   {
      String view = null;
      
      view = "/WEB-INF/views/member/MemberLogin.jsp";
      
      return view;
   }
   
   // 로그인 처리
   @RequestMapping(value = "/login.action", method = {RequestMethod.GET, RequestMethod.POST})
   public String memberLoginCheck(HttpServletRequest request)
   {
	  HttpSession session = request.getSession();   
      String result = null;
     
      IMemberDAO memDao = sqlSession.getMapper(IMemberDAO.class);		// 회원
      ISpaDAO spaDao = sqlSession.getMapper(ISpaDAO.class);				// 업체
      IAdminDAO admDao = sqlSession.getMapper(IAdminDAO.class);			// 관리자
      
      String id = request.getParameter("formUsername");					// 로그인 아이디
      String pwd = request.getParameter("formPassword");				// 패스워드
      String loginType = request.getParameter("loginType");				// 회원 유형
     
      MemberDTO member = new MemberDTO();
      SpaDTO spa = new SpaDTO();
      
      String stopDate = null;		// 정지일
      String code = null;			 //코드
      String name = null;		    // 이름
      
      
      // 로그인 정보 확인 및 정지 여부 조회
      //! loginType = "0" 일반 회원 로그인, "1" 업체 회원 로그인 , "2" 관리자 로그인
      if (loginType.equals("0")) 
      {
    	  MemberDTO dto = new MemberDTO();

          dto.setId(id);
          dto.setPwd(pwd);   
          
          // 멤버 이름, 멤버코드 조회
          member = memDao.memberLogin(dto);
          
          // 멤버 정지 내역 조회
          stopDate = memDao.memStop(id);
          
          // 멤버 이름,코드 받기
          if (! member.getName().isEmpty())
          {
        	  name = member.getName();
        	  code = member.getMem_cd();
          }
          
      }
      else if(loginType.equals("1")) 
      {
    	  SpaDTO dto = new SpaDTO();
    	  
    	  dto.setSpa_id(id);
    	  dto.setPwd(pwd);
    	  
    	  // 업체 이름 조회
    	  spa = spaDao.spaLogin(dto);
    	  
    	  // 업체 정지 내역 조회
    	  stopDate = spaDao.spaStop(id);
    	  
    	  // 업체 블락 조회
    	  //blockCount = spaDao.spaBlock(id);
    	  
    	  // 업체 코드 받기
    	  if (!spa.getName().isEmpty()) 
    	  {
    		  name = spa.getName();
    		  code = spa.getSpa_cd();
    	  }
    		  
      }
      else if(loginType.equals("2"))
      {
    	  AdminDTO dto = new AdminDTO();
    	  
    	  dto.setAdmin_cd(id);
    	  dto.setPwd(pwd);
    	  
    	  name = admDao.adminLogin(dto);
      }
      
      if (name == null|| name=="" ) 							// 로그인 실패시
      {
         result = "redirect:memberlogin.action";
      }
      else if(stopDate != null) 							// 정지 내역이 있을시
      {
    	  session.setAttribute("stopDate", stopDate);
          result = "/WEB-INF/views/member/MemStop.jsp";
      }
      else 													// 로그인 성공시
      {
         
    	  if (loginType.equals("2")) 		// 관리자
    	  {
    		  result = "/adminmemberlist.action";
		  }
    	  else if (loginType.equals("1"))   // 업체
    	  {
    		  session.setAttribute("spa_cd", code);
    		  result = "/WEB-INF/views/MainPage.jsp";
    	  }			
    	  else 								// 회원
    	  {
    		  session.setAttribute("mem_cd", code);
    		  result = "/WEB-INF/views/MainPage.jsp";
		  }
        
      }
 
      session.setAttribute("id", id);
      session.setAttribute("pwd", pwd);
      session.setAttribute("name", name);
      session.setAttribute("loginType", loginType);
      
      // 테스트
	  //System.out.println(name+id+pwd+loginType+stopDate+code);
      
      return result;
      
   }
   
   
   
   // 아이디 찾기 뷰
   @RequestMapping(value = "/searchid.action", method = {RequestMethod.GET, RequestMethod.POST})
   public String searchIdView(HttpServletRequest request)
   {
	   HttpSession session = request.getSession();
	   
	   String searchId = request.getParameter("searchId"); 
	   String view = null;
	   
	   System.out.println(searchId);
	   
	   session.setAttribute("searchId", searchId);
	   view = "/WEB-INF/views/member/SearchId.jsp";
	   
	      
	   return view;
   }
   
   // 찾은 아이디 값
   @RequestMapping(value = "/searchidcheck.action", method = {RequestMethod.GET, RequestMethod.POST})
   public ModelAndView loginSearchId(HttpServletRequest request)
   {
      ModelAndView mav = new ModelAndView();  
      
      IMemberDAO memDao = sqlSession.getMapper(IMemberDAO.class);
      ISpaDAO spaDao = sqlSession.getMapper(ISpaDAO.class);
      
      String searchId = request.getParameter("searchId");		// 업체/ 회원 여부
      String name = request.getParameter("formUserName");		// 이름
      String tel = request.getParameter("formTel");				// 전화번호
      String search_id = null;									// 찾은 아이디

      
      if (searchId.equals("memIdSearch")) 			// 일반 회원 아이디 찾기일 때
      {
    	  MemberDTO dto = new MemberDTO();
    	  
    	  dto.setName(name);
    	  dto.setTel(tel);
    	  
    	  search_id = memDao.memId(dto);
	  }
      else if (searchId.equals("spaIdSearch")) 		// 업체 회원 아이디 찾기일 때
      {
    	  SpaDTO dto = new SpaDTO();
    	  
    	  dto.setName(name);
    	  dto.setTel(tel);

    	  search_id = spaDao.sapId(dto);
      }
    
      
      if (search_id == null||search_id=="" ) 		// 아이디 찾기 실패시
      {
    	  mav.addObject("msg", "정보가 존재하지 않습니다.");
          mav.setViewName("/WEB-INF/views/member/SearchId.jsp");
      }
      else 											// 아이디 찾기 성공시
      {
    	  // 테스트
    	  //System.out.println(search_id + searchId);

    	  mav.addObject("search_id", search_id);
    	  mav.setViewName("/WEB-INF/views/member/SearchId.jsp");   	  
      }
      
      return mav;
   }
   
   // 아이디 찾기 인증 번호 전송하기
    @ResponseBody
	@RequestMapping(value = "/idsendsms.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String idSendSms(@RequestParam(value = "receiver") String receiver) throws CoolsmsException
    {
		String api_key = "NCSSVMTOHVFAMAWF";
		String api_secret = "LAFEEWGYZJ7GGRH4MKT9TUXNY4OSVWBL";
		String authNum = "";
		Message coolsms = new Message(api_key, api_secret);
		
		System.out.println("Hello");
		authNum = sendString();
		
		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", "01028652034");
		params.put("from", "01028652034"); 				// 인증할 전화번호
		params.put("type", "SMS");
		params.put("text", "[COME-IT] 인증번호 : " + authNum);
		params.put("app_version", "test app 1.2"); // application name and version

		try
		{
			// send() 는 메시지를 보내는 함수
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.get("error_count"));
			
		} catch (CoolsmsException e)
		{
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		
		return authNum;
		
	}
   
   
   // 인증번호 난수 발생
   public String sendString()
   {
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();

		for (int i = 0; i < 6; i++)
		{
			int rIndex = rnd.nextInt(2);
			switch (rIndex)
			{
			case 0:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65)); // +97이면 소문자 +65면 대문자
				break;
			case 1:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		return temp.toString();
	}
   
   // 패스워드 찾기 뷰
   @RequestMapping(value = "/searchpwd.action", method = {RequestMethod.GET, RequestMethod.POST})
   public String searchPwdView(HttpServletRequest request)
   {
	   HttpSession session = request.getSession();
	   
	   String searchPwd = request.getParameter("searchPwd"); 
	   String view = null;
	   
	   session.setAttribute("searchPwd", searchPwd);
	   
	   view = "/WEB-INF/views/member/SearchPw.jsp";
	   
	   return view;
   }
   
   
   // 패스워드 찾기
   @RequestMapping(value = "/searchpwdcheck.action", method = {RequestMethod.GET, RequestMethod.POST})
   public ModelAndView loginSearchPwd(HttpServletRequest request)
   {
      ModelAndView mav = new ModelAndView();  
      
      IMemberDAO memDao = sqlSession.getMapper(IMemberDAO.class);
      ISpaDAO spaDao = sqlSession.getMapper(ISpaDAO.class);

      String name = request.getParameter("formUserName");
      String id = request.getParameter("formUserId");
      String tel = request.getParameter("formTel");
      String searchPwd = request.getParameter("searchPwd");
    		  
      int result =0;
      
   
      
      if (searchPwd.equals("memPwdSearch")) 			// 일반 회원 비밀번호 찾기일 때
      {
		 MemberDTO dto = new MemberDTO();

		 dto.setName(name);
		 dto.setId(id);
		 dto.setTel(tel);

		 result = memDao.pwdInfo(dto);
		 
		 mav.addObject("infoDto", dto);
	  }
      else if (searchPwd.equals("spaPwdSearch")) 		// 업체 회원 비밀번호 찾기일때
      {
    	  SpaDTO dto = new SpaDTO();
    	  
    	  dto.setName(name);
    	  dto.setSpa_id(id);
    	  dto.setTel(tel);
    	  
    	  result = spaDao.pwdInfo(dto);
    	  
    	  mav.addObject("infoDto", dto);
      }
      
   
      // 비밀번호 찾기 실패시
      if (result==0) 
      {
         mav.addObject("msg", "정보가 존재하지 않습니다.");
         mav.setViewName("/WEB-INF/views/member/SearchPw.jsp");
      }
      else // 패스워드 찾기 성공시
      { 	  
          mav.addObject("msg", "문자발송 버튼을 클릭하세요.");
          mav.setViewName("/WEB-INF/views/member/SearchPw.jsp");
      }
      
      //System.out.println(result);
      return mav;
   }
   
   
   // 패스워드 업데이트용 난수 발생
   public String updatePwd()
   {
      StringBuffer temp = new StringBuffer();
      Random rnd = new Random();

      for (int i = 0; i < 7; i++)
      {
         int rIndex = rnd.nextInt(2);
         switch (rIndex)
         {
         case 0:
            // A-Z
            temp.append((char) ((int) (rnd.nextInt(26)) + 65)); // +97이면 소문자 +65면 대문자
            break;
         case 1:
            // 0-9
            temp.append((rnd.nextInt(10)));
            break;
         }
      }
      return temp.toString();
   }
   
   
   // 변경된 난수 비밀번호 전송
   @RequestMapping(value = "/pwdsendsms.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String pwdSendSms(HttpServletRequest request) throws CoolsmsException
   {
	   
	    String result = "";
	    IMemberDAO memDao = sqlSession.getMapper(IMemberDAO.class);
	    ISpaDAO spaDao = sqlSession.getMapper(ISpaDAO.class);
	    
	   

	    String authNum = updatePwd();							// 난수 발생 비밀번호
	    String name = request.getParameter("formUserName");
	    String id = request.getParameter("formUserId");
	    String tel = request.getParameter("formTel");
	    String searchPwd = request.getParameter("searchPwd");	// 회원 여부
	    
	    if (searchPwd.equals("memPwdSearch")) 					// 일반 회원 
	      {
			 MemberDTO dto = new MemberDTO();

			 dto.setPwd(authNum); 
		     dto.setName(name); 
		     dto.setId(id);
		     dto.setTel(tel);
		     
		     memDao.memPwd(dto);
		  }
	      else if (searchPwd.equals("spaPwdSearch")) 			// 업체 회원
	      {
	    	  SpaDTO dto = new SpaDTO();
	    	  
	    	  dto.setPwd(authNum);
	    	  dto.setName(name);
	    	  dto.setSpa_id(id);
	    	  dto.setTel(tel);
	    	  
	    	  spaDao.spaPwd(dto);
	      }
	       
		String api_key = "NCSSVMTOHVFAMAWF";
		String api_secret = "LAFEEWGYZJ7GGRH4MKT9TUXNY4OSVWBL";

		Message coolsms = new Message(api_key, api_secret);
		
		System.out.println("Hello");
		
		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", "01028652034");
		params.put("from", "01028652034"); 				// 인증할 전화번호
		params.put("type", "SMS");
		params.put("text", "[COME-IT] 인증번호 : " + authNum);
		params.put("app_version", "test app 1.2"); // application name and version

		try
		{
			// send() 는 메시지를 보내는 함수
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.get("error_count"));
			
		} catch (CoolsmsException e)
		{
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		
		result="redirect:memberlogin.action";

		return result;
		
	}
     
   
}
