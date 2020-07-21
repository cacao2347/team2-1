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
   
   
   // 로그인 페이지(뷰)
   @RequestMapping(value = "/memberlogin.action", method = RequestMethod.GET)
   public String memberLogin()
   {
      String view = null;
      
      view = "/WEB-INF/views/member/MemberLogin.jsp";
      
      return view;
   }
   
   // 메인페이지
   @RequestMapping(value = "/mainPage.action", method = RequestMethod.GET)
   public String mainPage()
   {
      String view = null;
      
      view = "/WEB-INF/views/MainPage.jsp";
      
      return view;
   }
   
   // 로그인 처리
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

      
      // �α��� ������ ������ name �� ������
      //! loginType = "0" �̸� �Ϲ� ȸ�� , "1" �̸� ��ü ȸ�� , "2"�̸� ������
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
      
     
      // �α��� ���н�
      if (name == null||name=="" ) 
      {
         request.setAttribute("msg", "���̵� �Ǵ� �н����尡 ���� �ʽ��ϴ�.");
         result = "redirect:memberlogin.action";
      }
      else 			// �α��� ������
      {
         HttpSession session = request.getSession();
         
         session.setAttribute("name", name);
         session.setAttribute("id", id);
         session.setAttribute("pwd", pwd); 	 
         session.setAttribute("loginType", loginType);
         
         if (loginType.equals("2")) 						// �����ڷ� �α��� �� ���
        	 result = "";
         else 												// �Ϲ� ȸ���̳� ��ü ȸ���� ���
        	 result = "/WEB-INF/views/MainPage.jsp";
      }
      
      // �׽�Ʈ
		/* System.out.println(name+id+pwd+loginType); */
      
      return result;
   }
   
   // 아이디 찾기
   @RequestMapping(value = "/SearchId.action", method = RequestMethod.GET)
   public String searchId(HttpServletRequest request)
   {
		/* String loginType = request.getParameter("loginType"); */
	   
	   String view = null;
	   
		/* if(!loginType.equals("2")) */
	   view = "/WEB-INF/views/SearchId.jsp";
	      
	   return view;
   }
   
   // 패스워드 찾기
   @RequestMapping(value = "/SearchPwd.action", method = RequestMethod.GET)
   public String searchPwd(HttpServletRequest request)
   {
		/* String loginType = request.getParameter("loginType"); */
	   
	   String view = null;
	   
		/* if(!loginType.equals("2")) */
	   view = "/WEB-INF/views/SearchPwd.jsp";
	      
	   return view;
   }
   
   
   
}