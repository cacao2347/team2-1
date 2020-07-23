package com.sys.comeit;

public class StudyDTO
{

	private String stu_cd, str_date, cmt_date, crt_date; 		// 스터디개설코드, 시작일, 확정일, 게시글등록일
	private String title, mem_num, content;				 		// 방제목, 인원수, 상세설명
	private String stu_hist_cd, stu_join_cd, apntm_dat; 		// 스터디장이력코드, (스터디장)참가코드, 임명일
	//private String leader_mem_cd, leader_id, name;				// 스터디장 회원코드, 스터디장 아이디, 스터디장 이름
	private String meet_term, area_name, spc_area_name;			// 기간, 지역명, 세부지역명 
	private String idntt_type, lv, cat_name, scrt_num;			// 신분유형, 레벨, 카테고리, 방비밀번호(없으면 0 나옴)
	
	
	// getter / setter 구성
	public String getStu_cd()
	{
		return stu_cd;
	}
	public void setStu_cd(String stu_cd)
	{
		this.stu_cd = stu_cd;
	}
	public String getStr_date()
	{
		return str_date;
	}
	public void setStr_date(String str_date)
	{
		this.str_date = str_date;
	}
	public String getCmt_date()
	{
		return cmt_date;
	}
	public void setCmt_date(String cmt_date)
	{
		this.cmt_date = cmt_date;
	}
	public String getCrt_date()
	{
		return crt_date;
	}
	public void setCrt_date(String crt_date)
	{
		this.crt_date = crt_date;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getMem_num()
	{
		return mem_num;
	}
	public void setMem_num(String mem_num)
	{
		this.mem_num = mem_num;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getStu_hist_cd()
	{
		return stu_hist_cd;
	}
	public void setStu_hist_cd(String stu_hist_cd)
	{
		this.stu_hist_cd = stu_hist_cd;
	}
	public String getStu_join_cd()
	{
		return stu_join_cd;
	}
	public void setStu_join_cd(String stu_join_cd)
	{
		this.stu_join_cd = stu_join_cd;
	}
	public String getApntm_dat()
	{
		return apntm_dat;
	}
	public void setApntm_dat(String apntm_dat)
	{
		this.apntm_dat = apntm_dat;
	}
	public String getMeet_term()
	{
		return meet_term;
	}
	public void setMeet_term(String meet_term)
	{
		this.meet_term = meet_term;
	}
	public String getArea_name()
	{
		return area_name;
	}
	public void setArea_name(String area_name)
	{
		this.area_name = area_name;
	}
	public String getSpc_area_name()
	{
		return spc_area_name;
	}
	public void setSpc_area_name(String spc_area_name)
	{
		this.spc_area_name = spc_area_name;
	}
	public String getIdntt_type()
	{
		return idntt_type;
	}
	public void setIdntt_type(String idntt_type)
	{
		this.idntt_type = idntt_type;
	}
	public String getLv()
	{
		return lv;
	}
	public void setLv(String lv)
	{
		this.lv = lv;
	}
	public String getCat_name()
	{
		return cat_name;
	}
	public void setCat_name(String cat_name)
	{
		this.cat_name = cat_name;
	}
	public String getScrt_num()
	{
		return scrt_num;
	}
	public void setScrt_num(String scrt_num)
	{
		this.scrt_num = scrt_num;
	}
	
}
