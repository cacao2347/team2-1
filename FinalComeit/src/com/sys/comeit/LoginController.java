package com.sys.comeit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



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
   
   // 로그인 처리
   @RequestMapping(value = "/login.action", method = RequestMethod.POST)
   public String memberLoginCheck(HttpServletRequest request)
   {
	  HttpSession session = request.getSession();   
      String result = null;
     
      IMemberDAO memDao = sqlSession.getMapper(IMemberDAO.class);
      ISpaDAO spaDao = sqlSession.getMapper(ISpaDAO.class);
      IAdminDAO admDao = sqlSession.getMapper(IAdminDAO.class);
      
      String id = request.getParameter("formUsername");
      String pwd = request.getParameter("formPassword");
      String loginType = request.getParameter("loginType");
      String name = null;
      String stopDate = null;
      int blockCount = 0;
      
      
      // 로그인 정보 확인 및 정지 여부 조회
      //! loginType = "0" 일반 회원 로그인, "1" 업체 회원 로그인 , "2" 관리자 로그인
      if (loginType.equals("0")) 
      {
    	  MemberDTO dto = new MemberDTO();

          dto.setId(id);
          dto.setPwd(pwd);   
          
          // 멤버 이름 조회
          name = memDao.memberLogin(dto);
          
          // 멤버 정지 내역 조회
          stopDate = memDao.memStop(id);
          
          // 멤버 블락 조회
          blockCount = memDao.memBlock(id);
          
      }
      else if(loginType.equals("1")) 
      {
    	  SpaDTO dto = new SpaDTO();
    	  
    	  dto.setSpa_id(id);
    	  dto.setPwd(pwd);
    	  
    	  // 업체 이름 조회
    	  name = spaDao.spaLogin(dto);
    	  
    	  // 업체 정지 내역 조회
    	  stopDate = spaDao.spaStop(id);
    	  
    	  // 업체 블락 조회
    	  blockCount = spaDao.spaBlock(id);
    	  
      }
      else if(loginType.equals("2"))
      {
    	  AdminDTO dto = new AdminDTO();
    	  
    	  dto.setAdmin_cd(id);
    	  dto.setPwd(pwd);
    	  
    	  name = admDao.adminLogin(dto);
      }
      
     
      
      if (name == null||name=="" ) 							// 로그인 실패시
      {
         request.setAttribute("msg", "아이디와 패스워드가 일치하지 않습니다.");
         result = "redirect:memberlogin.action";
      }
      else if(blockCount != 0 || stopDate != null) 			// 블락된 내역, 정지 내역이 있을시
      {
    	  session.setAttribute("stopDate", stopDate);
          result = "/WEB-INF/views/MemStop.jsp";
      }
      else 													// 로그인 성공시
      {
         
         if (loginType.equals("2")) 						// 관리자 로그인
        	 result = "";
         else 												// 업체 및 회원 로그인
        	 result = "/WEB-INF/views/MainPage.jsp";
      }
      
      session.setAttribute("name", name);
      session.setAttribute("id", id);
      session.setAttribute("pwd", pwd); 	 
      session.setAttribute("loginType", loginType);
      
      // 테스트
	  // System.out.println(name+id+pwd+loginType+stopDate);
      
      return result;
      
   }
   
   
   
   // 아이디 찾기 뷰
   @RequestMapping(value = "/searchId.action", method = RequestMethod.GET)
   public String searchIdView(HttpServletRequest request)
   {
	   HttpSession session = request.getSession();
	   
	   String searchId = request.getParameter("searchId"); 
	   String view = null;
	   
	   System.out.println(searchId);
	   
	   session.setAttribute("searchId", searchId);
	   view = "/WEB-INF/views/SearchId.jsp";
	   
	      
	   return view;
   }
   
   // 찾은 아이디 값
   @RequestMapping(value = "/searchIdCheck.action", method = RequestMethod.POST)
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
          mav.setViewName("redirect:searchId.action");
      }
      else 											// 아이디 찾기 성공시
      {
    	  // 테스트
    	  //System.out.println(search_id + searchId);

    	  mav.addObject("search_id", search_id);
    	  mav.setViewName("/WEB-INF/views/SearchId.jsp");   	  
      }
      
      return mav;
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
