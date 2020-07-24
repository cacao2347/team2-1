package com.sys.comeit;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SpaController
{
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/spalist.action", method = RequestMethod.GET)
	public String spaList()
	{
		String view = null;

		view = "/WEB-INF/views/space/SpaceList.jsp";

		return view;
	}

	// 공간 등록 키워드
	  @RequestMapping(value = "/spacreate.action", method = RequestMethod.GET)
	  public String spaCreate(Model model) 
	  { 
		  String view = null;
	  
		  IAreaDAO areaDao = sqlSession.getMapper(IAreaDAO.class);
		  ISpaTypeDAO ispaTypeDao = sqlSession.getMapper(ISpaTypeDAO.class);
		  ISpaReqDAO iSpaReqDao = sqlSession.getMapper(ISpaReqDAO.class);
		  
		  model.addAttribute("spaType", ispaTypeDao.cafeList());
		  model.addAttribute("area", areaDao.areaList()); 
		  model.addAttribute("spaTag",iSpaReqDao.spaTagList());
		  
		  view = "WEB-INF/views/space/SpaceCreate.jsp";
		  
		  return view; 
	  }
	  
	  // 사업자 번호 중복 확인 ajax
		@ResponseBody
		@RequestMapping(value = "/checkspanum.action", method = RequestMethod.POST)
		public String checkidAjax(HttpServletRequest request, Model model)
		{
			ISpaNumDAO iSpaNumDao = sqlSession.getMapper(ISpaNumDAO.class);

			int aa = Integer.parseInt(request.getParameter("aa"));

			int result = iSpaNumDao.spacheckCount(aa);

			return String.valueOf(result);
		}
		
		// 공간 등록
		@RequestMapping(value = "/spareqinsert.action", method = RequestMethod.POST)
		public String spareqinsert(Model model, HttpServletRequest request)
		{
			String view = null;
			ISpaReqDAO dao = sqlSession.getMapper(ISpaReqDAO.class);
			HttpSession session = request.getSession(); 

			String spa_cd = (String) session.getAttribute("spa_cd");
			
			// 필수항목
			String num = request.getParameter("num"); // 사업자 번호
			String cafe_cd = request.getParameter("cafe"); // 카페유형
			String onein = request.getParameter("onein"); // 한줄소개
			String dtlin = request.getParameter("dtlin"); // 상세소개
			String sparsv = request.getParameter("sparsv"); // 주의사항
			
			String img_url_file = request.getParameter("okFile"); // 첨부파일
			String img_url_img = request.getParameter("uploadSpaFile"); // 공간 이미지
			
			String spc_area_cd = request.getParameter("spcArea"); // 세부지역 코드
			String spa = request.getParameter("spa"); // 상호명
			String spapeo = request.getParameter("spapeo"); // 대표자명
			String spaname = request.getParameter("spaname"); // 공간명
			String spatel = request.getParameter("spatel"); // 업체 전화번호
			int start = Integer.parseInt(request.getParameter("start").trim());  // 영업시작시간
			int end = Integer.parseInt(request.getParameter("end").trim()); // 영업최대 이용시간
			int max = Integer.parseInt(request.getParameter("max").trim()); // 영업최대 이용시간
			String dtladdr = request.getParameter("dtladdr"); // 업체 상세주소
			String web_url = null;
			
			
			System.out.println(spa_cd);
			System.out.println(num);
			System.out.println(cafe_cd);
			System.out.println(onein);
			System.out.println(dtlin);
			System.out.println(sparsv);
			System.out.println(img_url_file);
			System.out.println(img_url_img);
			System.out.println(spc_area_cd);
			System.out.println(spa);
			System.out.println(spapeo);
			System.out.println(spaname);
			System.out.println(spatel);
			System.out.println(start);
			System.out.println(end);
			System.out.println(max);
			System.out.println(dtladdr);
			
			
			
			
			
			
			
			SpaReqDTO dto = new SpaReqDTO();

			dto.setRprsn_num(num);
			dto.setSpa_type(cafe_cd);
			dto.setOne_intro(onein);
			dto.setDtl_intro(dtlin);
			dto.setRsv_notes(sparsv);
			dto.setFile_url(img_url_file);
			dto.setImg_url(img_url_img);
			dto.setSpc_area_cd(spc_area_cd);
			dto.setBusi_name(spa);
			dto.setRprsn_name(spapeo);
			dto.setSpa_name(spaname);
			dto.setTel(spatel);
			dto.setDtl_addr(dtladdr);
			dto.setSpa_cd(spa_cd);
			dto.setUse_hrs(max);
			dto.setStr_time(start); 
			dto.setEnd_time(end);
			dto.setWeb_url(web_url);
			
			// 공간등록 프로시저 호출
			dao.spaReqAdd(dto);
			
			String spa_req_cd = dto.getSpa_req_cd(); // OUT 변수인 PK를 담기

			System.out.println(spa_req_cd);

			String[] intTagList = request.getParameterValues("intTagList"); // 선택한 모든 키워드 배열에 넣기
			String[] etcTagList = request.getParameterValues("etcTagList"); // 선택한 모든 기타 키워드 배열에 넣기

			System.out.println("그냥 관심 : " + intTagList.length);
			System.out.println("기타 관심 : " + etcTagList.length);
			
			// 공간 이미지 설정
			String img_type_cd = "IMGT1001";
			

			if (spa_req_cd != null) // 카페 등록 성공했을경우
			{
				if (intTagList.length > 0)
				{
					for (int i = 0; i < intTagList.length; i++) // 선택한 모든 관심 키워드 중에
					{
						dto.setInt_tag(intTagList[i]); // 자바를 키워드에 세팅하고

						System.out.println("각 관심 : " + intTagList[i]);

						dao.spaIntTagInsert(dto); // 키워드 insert 실행시키기
					}
				}
				if (etcTagList.length > 0)
				{
					for (int i = 0; i < etcTagList.length; i++) // 선택한 모든 기타 키워드 중에
					{
						dto.setEtc_tag(etcTagList[i]); // 기타태그를 키워드에 세팅하고
						System.out.println("각 기타 : " + etcTagList[i]);

						dao.spaEtcTagInsert(dto); // 기타 키워드 insert 실행시키기

						int etcTagCount = dao.spaEtcTagCount(etcTagList[i]);

						if (etcTagCount == 10) // 기타 키워드 테이블 호출해서 10개일 경우
							dao.spaAddTagName(etcTagList[i]); // 그냥 관심키워드 테이블에 insert 시키기
					}
				}
				
				// 공간 이미지 등록
				dto.setImg_type_cd(img_type_cd);
				dao.spaAddImg(dto);
				
				// 시설안내 등록
				String[] contentList = request.getParameterValues("contentList"); // 모든 시설안내를 배열에 넣기
				if (contentList.length > 0)
				{
					for (int i = 0; i < contentList.length; i++) // 모든 시설안내를
					{
						dto.setContent(contentList[i]); // 시설안내 set
						System.out.println("시설안내 : " + contentList[i]);

						dao.spaAddContent(dto); // 시설안내 insert 실행시키기
					}
				}
				
				view = "redirect:spalist.action"; // 회원가입 성공 시 로그인 페이지
			} else
			{
				view = "redirect:spacreate.action"; // 회원가입 실패 시 회원가입 페이지 유지

			}

			view = "redirect:spalist.action";
			
			return view;
		}
}
