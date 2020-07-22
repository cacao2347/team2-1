package com.sys.comeit;

import java.util.ArrayList;

public class MemberDTO
{
	private String id, mem_cd, idntt, name, email, tel , joinDate;	// 아이디, 멤버코드, 신분, 이름, 이메일, 전화번호, 가입일
	private String mem_content;										// 본인소개
	private String area_name, spc_area_name;						// 지역명, 세부지역명
	private String int_tag, etc_tag;						// 관심키워드, 기타관심키워드
	private String img_url;											// 회원 이미지 url
	private String pwd;												// 비밀번호							
	
	// 수진 추가
	private String idntt_cd, spc_area_cd;		// 신분코드, 세부지역코드  
	
	
	// getter / setter 구성


	public String getIdntt_cd()
	{
		return idntt_cd;
	}

	public String getInt_tag()
	{
		return int_tag;
	}

	public void setInt_tag(String int_tag)
	{
		this.int_tag = int_tag;
	}

	public String getEtc_tag()
	{
		return etc_tag;
	}

	public void setEtc_tag(String etc_tag)
	{
		this.etc_tag = etc_tag;
	}

	public void setIdntt_cd(String idntt_cd)
	{
		this.idntt_cd = idntt_cd;
	}

	public String getSpc_area_cd()
	{
		return spc_area_cd;
	}

	public void setSpc_area_cd(String spc_area_cd)
	{
		this.spc_area_cd = spc_area_cd;
	}

	public String getId() 
	{
		return id;
	}
	
	public void setId(String id) 
	{
		this.id = id;
	}
	
	public String getMem_cd() 
	{
		return mem_cd;
	}
	
	public void setMem_cd(String mem_cd) 
	{
		this.mem_cd = mem_cd;
	}
	
	public String getIdntt() 
	{
		return idntt;
	}
	
	public void setIdntt(String idntt) 
	{
		this.idntt = idntt;
	}
	
	public String getName() 
	{
		return name;
	}
	
	public void setName(String name) 
	{
		this.name = name;
	}
	
	public String getEmail() 
	{
		return email;
	}
	
	public void setEmail(String email) 
	{
		this.email = email;
	}
	
	public String getTel() 
	{
		return tel;
	}
	
	public void setTel(String tel) 
	{
		this.tel = tel;
	}
	
	public String getJoinDate() 
	{
		return joinDate;
	}
	
	public void setJoinDate(String joinDate) 
	{
		this.joinDate = joinDate;
	}
	
	public String getMem_content() 
	{
		return mem_content;
	}
	
	public void setMem_content(String mem_content) 
	{
		this.mem_content = mem_content;
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
	
	public String getImg_url() 
	{
		return img_url;
	}
	
	public void setImg_url(String img_url) 
	{
		this.img_url = img_url;
	}
	
	public String getPwd() 
	{
		return pwd;
	}
	
	public void setPwd(String pwd) 
	{
		this.pwd = pwd;
	}

}
