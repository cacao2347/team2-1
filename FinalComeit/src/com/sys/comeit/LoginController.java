package com.sys.comeit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


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
   public String memberLogin(Model model)
   {
      String view = null;
      
      view = "/WEB-INF/views/member/MemberLogin.jsp";
      
      return view;
   }
   
   @RequestMapping(value = "/login.action", method = RequestMethod.POST)
   public String memberLoginCheck(HttpServletRequest request)
   {
         
      String result = null;
      HttpSession session = null;
      
      IMemberDAO memDao = sqlSession.getMapper(IMemberDAO.class);
      ISpaDAO spaDao = sqlSession.getMapper(ISpaDAO.class);
      IAdminDAO admDao = sqlSession.getMapper(IAdminDAO.class);
      
      String id = request.getParameter("formUsername");
      String pwd = request.getParameter("formPassword");
      String loginType = request.getParameter("loginType");
      String name = null;
      String stopCode = null;
      int blockCount = 0;
      int aplCount = 0;
      
      
      // 로그인 정보 확인 및 정지 여부 조회
      //! loginType = "0" 일반 회원 로그인, "1" 업체 회원 로그인 , "2" 관리자 로그인
      if (loginType.equals("0")) 
      {
    	  MemberDTO dto = new MemberDTO();

          dto.setId(id);
          dto.setPwd(pwd);  
          
          name = memDao.memberLogin(dto);
          stopCode = memDao.memStop(id);
          
          if (stopCode != null) 
        	  aplCount = memDao.memAppeal(stopCode);
          
          blockCount = memDao.memBlock(id);
      }
      else if(loginType.equals("1")) 
      {
    	  SpaDTO dto = new SpaDTO();
    	  
    	  dto.setSpa_id(id);
    	  dto.setPwd(pwd);
    	  
    	  name = spaDao.spaLogin(dto);
      }
      else if(loginType.equals("2"))
      {
    	  AdminDTO dto = new AdminDTO();
    	  
    	  dto.setAdmin_cd(id);
    	  dto.setPwd(pwd);
    	  
    	  name = admDao.adminLogin(dto);
      }
      
     
      // 로그인 실패시
      if (name == null||name=="" ) 
      {
         request.setAttribute("msg", "아이디와 패스워드가 일치하지 않습니다.");
         result = "redirect:memberlogin.action";
      }
      else if(blockCount != 0) // 블락된 내역이 있을시
      {
    	  result = "/WEB-INF/views/MemStop.jsp";
      }
      else if(stopCode != null)		// 정지된 내역이 있을시
      {
    	  if (aplCount == 0) 		// 항소 요청해서 승인 받은 내역이 없을시
    	  {
    		  result = "/WEB-INF/views/MemStop.jsp";
    	  }
    	  else						// 항소 요청해서 승인 받은 내역이 있을시 일반 로그인 가능
    	  {
    		  session = request.getSession();
    	         
    	      session.setAttribute("name", name);
    	      session.setAttribute("id", id);
    	      session.setAttribute("pwd", pwd); 	 
    	      session.setAttribute("loginType", loginType);
    	      
    	      result = "/WEB-INF/views/MainPage.jsp";
    	  }
    	  
      }
      else 			// 로그인 성공시
      {
         session = request.getSession();
         
         session.setAttribute("name", name);
         session.setAttribute("id", id);
         session.setAttribute("pwd", pwd); 	 
         session.setAttribute("loginType", loginType);
         
         if (loginType.equals("2")) 						// 관리자 로그인
        	 result = "";
         else 												// 업체 및 회원 로그인
        	 result = "/WEB-INF/views/MainPage.jsp";
      }
      
      // 테스트
	  //System.out.println(name+id+pwd+loginType+stopCode);
      
      return result;
      
   }
   
   
   // 아이디 찾기 뷰
   @RequestMapping(value = "/searchId.action", method = RequestMethod.GET)
   public String searchIdView(HttpServletRequest request)
   {
	   HttpSession session = request.getSession();
	   
	   String searchId = request.getParameter("searchId"); 
	   String view = null;
	   
	   session.setAttribute("searchId", searchId);
	   view = "/WEB-INF/views/SearchId.jsp";
	      
	   return view;
   }
   
   // 
   @RequestMapping(value = "/searchIdCheck.action", method = RequestMethod.POST)
   public String loginSearchId(HttpServletRequest request)
   {
      String result = null;
      //HttpSession session = null;
      
      IMemberDAO memDao = sqlSession.getMapper(IMemberDAO.class);
      //ISpaDAO spaDao = sqlSession.getMapper(ISpaDAO.class);

      String name = request.getParameter("form-username");
      String tel = request.getParameter("form-tel");
      String search_id = null;
		/*
		 * String type = (String)session.getAttribute("type");
		 */
      // 일반 회원 검색
		/*
		 * if (type.equals("memIdSearch")) {
		 */
		
		  MemberDTO dto = new MemberDTO();
		  
		  dto.setName(name);
		  dto.setTel(tel);
		 
          search_id = memDao.memId(dto);
     /* }
      else if(type.equals("spaIdSearch")) 
      {
    	  SpaDTO dto = new SpaDTO();
    	  
    	  dto.setName(name);
    	  dto.setTel(tel);;
    	  
    	  search_id = spaDao.spaLogin(dto);
      }
    */ 
      // 아이디 찾기 실패시
      if (search_id == null||search_id=="" ) 
      {
         request.setAttribute("msg", "정보가 존재하지 않습니다.");
         result = "redirect:searchId.action";
      }
      else // 아이디 찾기 성공시
      {
    	  request.setAttribute("search_id", search_id);
    	  result = "redirect:searchId.action";
      }
      
      return result;
   }

   
   // 패스워드 찾기 뷰
   @RequestMapping(value = "/searchPwd.action", method = RequestMethod.GET)
   public String searchPwdView(HttpServletRequest request)
   {
	   HttpSession session = request.getSession();
	   
	   String searchPwd = request.getParameter("searchPwd"); 
	   String view = null;
	   
	   session.setAttribute("searchPwd", searchPwd);
	   
	   view = "/WEB-INF/views/SearchPw.jsp";
	   
	   return view;
   }
}
