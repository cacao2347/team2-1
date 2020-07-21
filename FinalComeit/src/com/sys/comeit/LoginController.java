package com.sys.comeit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.filters.SessionInitializerFilter;
import org.apache.ibatis.javassist.expr.NewArray;
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
   
   @RequestMapping(value = "/login.action", method = RequestMethod.POST)
   public String memberLoginCheck(HttpServletRequest request)
   {
         
      String result = null;
      
      IMemberDAO memDao = sqlSession.getMapper(IMemberDAO.class);
      ISpaDAO spaDao = sqlSession.getMapper(ISpaDAO.class);
      IAdminDAO admDao = sqlSession.getMapper(IAdminDAO.class);
      
      String id = request.getParameter("formUsername");
      String pwd = request.getParameter("formPassword");
      String loginType = request.getParameter("loginType");
      String name = null;
      
		/*
		 * String memType=request.getParameter("memType"); String
		 * spaType=request.getParameter("spaType"); String
		 * admType=request.getParameter("admType");
		 */

      
      // 로그인 정보가 맞으면 name 을 가져옴
      //! loginType = "0" 이면 일반 회원 , "1" 이면 업체 회원 , "2"이면 관리자
      if (loginType.equals("0")) 
      {
    	  MemberDTO dto = new MemberDTO();

          dto.setId(id);
          dto.setPwd(pwd);  
          
          name = memDao.memberLogin(dto);
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
         request.setAttribute("msg", "아이디 또는 패스워드가 맞지 않습니다.");
         result = "redirect:memberlogin.action";
      }
      else 			// 로그인 성공시
      {
         HttpSession session = request.getSession();
         
         session.setAttribute("name", name);
         session.setAttribute("id", id);
         session.setAttribute("pwd", pwd); 	 
         session.setAttribute("loginType", loginType);
         
         if (loginType.equals("2")) 						// 관리자로 로그인 한 경우
        	 result = "";
         else 												// 일반 회원이나 업체 회원인 경우
        	 result = "/WEB-INF/views/MainPage.jsp";
      }
      
      // 테스트
		/* System.out.println(name+id+pwd+loginType); */
      
      return result;
      
   }
}