package com.sys.comeit;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SpaceController 
{
	@Autowired
	private SqlSession sqlSession;
	
		// 공간 리스트 화면 노출하기
		@RequestMapping(value = "/spalist.action", method = RequestMethod.GET)
		public String spaList(Model model)
		{
			String view = null;

			IAreaDAO areaDao = sqlSession.getMapper(IAreaDAO.class); // 지역
			ISpaceDAO ispaceDAO = sqlSession.getMapper(ISpaceDAO.class); // 스터디 정보
			
			String check_type="CHET1001";
			
			model.addAttribute("area", areaDao.areaList());
			model.addAttribute("space", ispaceDAO.spaceList(check_type));
			model.addAttribute("count", ispaceDAO.spaceCount(check_type));
			
			model.addAttribute("spaceTags", ispaceDAO.spaceTagList());	// 모든 공간 모든 키워드 

			view = "WEB-INF/views/space/SpaceList.jsp";

			return view;
		}
}
