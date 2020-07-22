package com.sys.comeit;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ComeitController 
{
	   @RequestMapping(value = "/comeit.action", method = RequestMethod.GET)
	   public String memberLogin(Model model)
	   {
	      String view = null;
	      
	      view = "/WEB-INF/views/MainPage.jsp";
	      
	      return view;
	   }

}
