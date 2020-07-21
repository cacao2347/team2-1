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
      
      IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
      
      String id = request.getParameter("formUsername");
      String pwd = request.getParameter("formPassword");
      
      MemberDTO dto = new MemberDTO();
      
      dto.setId(id);
      dto.setPwd(pwd);  
      
      String name = dao.memberLogin(dto);
      
      if (name == "" ) 
      {
         /* mav.setViewName("redirect:memberlogin.action"); */
         request.setAttribute("msg", "아아디 또는 패스워드가 맞지 않습니다.");
         result = "redirect:memberlogin.action";
         return result;
         
      }
      else 
      {
         HttpSession session = request.getSession();
         session.setAttribute("name", name);
         result = "/WEB-INF/views/MainPage.jsp";
      }
      
      System.out.println(id+pwd);
      
      return result;
      
   }
}