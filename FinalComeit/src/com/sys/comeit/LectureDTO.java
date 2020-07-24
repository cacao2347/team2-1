package com.sys.comeit;

public class LectureDTO
{
	String lec_cd, prof_cd, spc_area_cd, lec_term_cd
	, lec_name, crt_date, str_date, lec_intro , min_mem
	, max_mem, int_tag_cd, etc_tag;
	
	public String getInt_tag_cd()
	{
		return int_tag_cd;
	}
	public void setInt_tag_cd(String int_tag_cd)
	{
		this.int_tag_cd = int_tag_cd;
	}
	public String getEtc_tag()
	{
		return etc_tag;
	}
	public void setEtc_tag(String etc_tag)
	{
		this.etc_tag = etc_tag;
	}
	int lec_fee;
	
	public String getLec_cd()
	{
		return lec_cd;
	}
	public void setLec_cd(String lec_cd)
	{
		this.lec_cd = lec_cd;
	}
	public String getProf_cd()
	{
		return prof_cd;
	}
	public void setProf_cd(String prof_cd)
	{
		this.prof_cd = prof_cd;
	}
	public String getSpc_area_cd()
	{
		return spc_area_cd;
	}
	public void setSpc_area_cd(String spc_area_cd)
	{
		this.spc_area_cd = spc_area_cd;
	}
	public String getLec_term_cd()
	{
		return lec_term_cd;
	}
	public void setLec_term_cd(String lec_term_cd)
	{
		this.lec_term_cd = lec_term_cd;
	}
	public String getLec_name()
	{
		return lec_name;
	}
	public void setLec_name(String lec_name)
	{
		this.lec_name = lec_name;
	}
	public String getCrt_date()
	{
		return crt_date;
	}
	public void setCrt_date(String crt_date)
	{
		this.crt_date = crt_date;
	}
	public String getStr_date()
	{
		return str_date;
	}
	public void setStr_date(String str_date)
	{
		this.str_date = str_date;
	}
	public String getLec_intro()
	{
		return lec_intro;
	}
	public void setLec_intro(String lec_intro)
	{
		this.lec_intro = lec_intro;
	}
	public String getMin_mem()
	{
		return min_mem;
	}
	public void setMin_mem(String min_mem)
	{
		this.min_mem = min_mem;
	}
	public String getMax_mem()
	{
		return max_mem;
	}
	public void setMax_mem(String max_mem)
	{
		this.max_mem = max_mem;
	}
	public int getLec_fee()
	{
		return lec_fee;
	}
	public void setLec_fee(int lec_fee)
	{
		this.lec_fee = lec_fee;
	}
	
}
