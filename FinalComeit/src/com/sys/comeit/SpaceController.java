package com.sys.comeit;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

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
			ISpaceDAO ispaceDAO = sqlSession.getMapper(ISpaceDAO.class); // 공간 정보
			
			String check_type="CHET1001";
			
			model.addAttribute("area", areaDao.areaList());
			model.addAttribute("space", ispaceDAO.spaceList(check_type));
			model.addAttribute("count", ispaceDAO.spaceCount(check_type));
			
			model.addAttribute("spaceTags", ispaceDAO.spaceTagList());	// 모든 공간 모든 키워드 

			view = "WEB-INF/views/space/SpaceList.jsp";

			return view;
		}
		
		// 공간 상세페이지로 이동
		@RequestMapping(value = "/spacedetail.action", method = RequestMethod.GET)
		public String spaceDetail(Model model,HttpServletRequest request)
		{
			String view = null;
			
			String spa_req_cd = request.getParameter("spa_req_cd");
			
			ISpaceDAO ispaceDAO = sqlSession.getMapper(ISpaceDAO.class); // 공간 정보
			
			// 공간 정보
			model.addAttribute("spaceInfo",ispaceDAO.spaceInfoSearch(spa_req_cd));
			// 키워드
			model.addAttribute("spaceTag",ispaceDAO.spaceTagSearch(spa_req_cd));
			// 시설 안내
			model.addAttribute("fclty",ispaceDAO.spaceFcltySearch(spa_req_cd));
			// 피드백
			model.addAttribute("feedback",ispaceDAO.spaceFeed(spa_req_cd));
			// 피드백 입력 체크
			model.addAttribute("feedCheck",ispaceDAO.reqCount(spa_req_cd));
			
			
			view = "WEB-INF/views/space/SpaceDetail.jsp";
			return view;
		}
		
		// 공간 마이페이지로 이동
		@RequestMapping(value = "/spacemy.action", method = RequestMethod.GET)
		public String spaceMy(Model model,HttpServletRequest request)
		{
			String view = null;
			
			
			view = "WEB-INF/views/space/SpaceMy.jsp";
			return view;
		}
		
}
