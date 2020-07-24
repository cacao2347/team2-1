package com.sys.comeit;

public class SpaReqDTO
{
	private String spa_req_cd, spa_cd, spa_type;//등록요청 코드, 업체코드, 업체타입
    private String one_intro,dtl_intro, rsv_notes, req_date; //한줄 소개, 상세소개, 주의사항, 등록요청일
    private int use_hrs, str_time, end_time;//최대 이용시간, 시작시간, 종료시간
    private String busi_name, spa_name, dtl_addr, tel; // 상호명, 공간명, 상세주소, 전화번호
    private String rprsn_name, spa_addr; //대표자명, 사업장 주소
    private String web_url, file_url;//웹사이트, 사업자번호파일
    private String area_name, spc_area_name;						// 지역명, 세부지역명
    private String rprsn_num,img_url ; //사업자번호, 대표이미지
    private String spc_area_cd; //세부지역코드
    
	   
	public String getSpc_area_cd() {
		return spc_area_cd;
	}
	public void setSpc_area_cd(String spc_area_cd) {
		this.spc_area_cd = spc_area_cd;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public String getRprsn_num() {
		return rprsn_num;
	}
	public void setRprsn_num(String rprsn_num) {
		this.rprsn_num = rprsn_num;
	}
	public String getArea_name() {
		return area_name;
	}
	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}
	public String getSpc_area_name() {
		return spc_area_name;
	}
	public void setSpc_area_name(String spc_area_name) {
		this.spc_area_name = spc_area_name;
	}
	public String getSpa_req_cd()
	{
		return spa_req_cd;
	}
	public void setSpa_req_cd(String spa_req_cd)
	{
		this.spa_req_cd = spa_req_cd;
	}
	public String getSpa_cd()
	{
		return spa_cd;
	}
	public void setSpa_cd(String spa_cd)
	{
		this.spa_cd = spa_cd;
	}
	public String getSpa_type()
	{
		return spa_type;
	}
	public void setSpa_type(String spa_type)
	{
		this.spa_type = spa_type;
	}
	public String getOne_intro()
	{
		return one_intro;
	}
	public void setOne_intro(String one_intro)
	{
		this.one_intro = one_intro;
	}
	public String getDtl_intro()
	{
		return dtl_intro;
	}
	public void setDtl_intro(String dtl_intro)
	{
		this.dtl_intro = dtl_intro;
	}
	public String getRsv_notes()
	{
		return rsv_notes;
	}
	public void setRsv_notes(String rsv_notes)
	{
		this.rsv_notes = rsv_notes;
	}
	public String getReq_date()
	{
		return req_date;
	}
	public void setReq_date(String req_date)
	{
		this.req_date = req_date;
	}
	public int getUse_hrs()
	{
		return use_hrs;
	}
	public void setUse_hrs(int use_hrs)
	{
		this.use_hrs = use_hrs;
	}
	public int getStr_time()
	{
		return str_time;
	}
	public void setStr_time(int str_time)
	{
		this.str_time = str_time;
	}
	public int getEnd_time()
	{
		return end_time;
	}
	public void setEnd_time(int end_time)
	{
		this.end_time = end_time;
	}
	public String getBusi_name()
	{
		return busi_name;
	}
	public void setBusi_name(String busi_name)
	{
		this.busi_name = busi_name;
	}
	public String getSpa_name()
	{
		return spa_name;
	}
	public void setSpa_name(String spa_name)
	{
		this.spa_name = spa_name;
	}
	public String getDtl_addr()
	{
		return dtl_addr;
	}
	public void setDtl_addr(String dtl_addr)
	{
		this.dtl_addr = dtl_addr;
	}
	public String getTel()
	{
		return tel;
	}
	public void setTel(String tel)
	{
		this.tel = tel;
	}
	public String getRprsn_name()
	{
		return rprsn_name;
	}
	public void setRprsn_name(String rprsn_name)
	{
		this.rprsn_name = rprsn_name;
	}
	public String getSpa_addr()
	{
		return spa_addr;
	}
	public void setSpa_addr(String spa_addr)
	{
		this.spa_addr = spa_addr;
	}
	public String getWeb_url()
	{
		return web_url;
	}
	public void setWeb_url(String web_url)
	{
		this.web_url = web_url;
	}
	public String getFile_url()
	{
		return file_url;
	}
	public void setFile_url(String file_url)
	{
		this.file_url = file_url;
	}
	   
	   
	

}
