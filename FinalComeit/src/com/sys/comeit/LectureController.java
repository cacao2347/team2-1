package com.sys.comeit;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LectureController
{
	@Autowired
	private SqlSession sqlSession;

	// 강의 등록 FORM에서 지역, 기간, 요일 리스트 던져주기
	@RequestMapping(value = "/lecturecreate.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String lectureCreate(Model model)
	{
		String view = null;

		IAreaDAO areaDao = sqlSession.getMapper(IAreaDAO.class);
		IIntTagDAO intTagDao = sqlSession.getMapper(IIntTagDAO.class);

		model.addAttribute("area", areaDao.areaList());
		model.addAttribute("intTag", intTagDao.intTagList());

		view = "WEB-INF/views/lecture/LectureCreate.jsp";

		return view;
	}

	@RequestMapping(value = "/lectureinsert.action", method =
	{ RequestMethod.GET, RequestMethod.POST })
	public String lectureInsert(Model model, HttpServletRequest request)
	{
		ILectureDAO lectureDao = sqlSession.getMapper(ILectureDAO.class);

		String view = "";

		// String lec_cd = request.getParameter("id");
		String prof_cd = "PROF1001"; //
		String spc_area_cd = request.getParameter("spcArea");
		String lec_term_cd = request.getParameter("lecTerm");
		String lec_name = request.getParameter("lecName"); //
		String str_date = request.getParameter("start"); //
		int lec_fee = Integer.parseInt(request.getParameter("lecFee"));
		String lec_intro = request.getParameter("lecIntro"); //
		String min_mem = request.getParameter("minMem");
		String max_mem = request.getParameter("maxMem");
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");

		LectureDTO dto = new LectureDTO();

		dto.setLec_name(lec_name);
		dto.setProf_cd(prof_cd);
		dto.setSpc_area_cd(spc_area_cd);
		dto.setLec_term_cd(lec_term_cd);
		dto.setLec_name(lec_name);
		dto.setStr_date(str_date);
		dto.setLec_fee(lec_fee);
		dto.setLec_intro(lec_intro);
		dto.setMin_mem(min_mem);
		dto.setMax_mem(max_mem);
		dto.setStr_hrs(startTime);
		dto.setEnd_hrs(endTime);

		lectureDao.lectureInsert(dto);

		String lec_cd = dto.getLec_cd();
		System.out.println(lec_cd);

		String[] dayTagList = request.getParameterValues("dayTagList");		
		String[] intTagList = {};
		String[] etcTagList = {};
		
		if(request.getParameterValues("intTagList")!=null)
		{
			intTagList = request.getParameterValues("intTagList"); // 선택한 모든 관심 키워드 배열에 넣기
		}
		
		if(request.getParameterValues("etcTagList")!=null)
		{
			etcTagList = request.getParameterValues("etcTagList"); // 선택한 모든 관심 기타 키워드 배열에 넣기
		}
		System.out.println("그냥 관심 : " + intTagList.length);
		System.out.println("기타 관심 : " + etcTagList.length);
		
		// 관심키워드 DB INSERT
		if (lec_cd != null)
		{
			// 관심키워드가 존재할 때 INSERT
			if (intTagList.length > 0)
			{
				for (int i = 0; i < intTagList.length; i++)
				{
					dto.setInt_tag_cd(intTagList[i]);

					System.out.println("각 관심 : " + intTagList[i]);

					lectureDao.insertIntTag(dto);
				}
			}
			// 기타 키워드가 존재할 때 INSERT
			if (etcTagList.length > 0)
			{
				for (int i = 0; i < etcTagList.length; i++)
				{
					dto.setEtc_tag(etcTagList[i]);
					System.out.println("각 기타 키워드 : " + etcTagList[i]);

					lectureDao.insertEtcTag(dto); // 기타 키워드 INSERT

					int etcTagCount = lectureDao.etcTagCount(etcTagList[i]);

					if (etcTagCount == 10)
						lectureDao.addTagName(etcTagList[i]);

				}
			}

			// 강의 진행 일시 INSERT
			if (dayTagList.length > 0)
			{
				for (int i = 0; i < dayTagList.length; i++)
				{
					dto.setDay_cd(dayTagList[i]);
					lectureDao.addLecturePrgTime(dto);	
				}
			}

		}

		return view;
	}

}
