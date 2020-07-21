package com.sys.comeit;

import java.util.ArrayList;

public interface IAdminDAO
{
	public int adminCount();					// 관리자 수
	public ArrayList<AdminDTO> adminList();	// 관리자 리스트	
	public AdminDTO adminLogin(AdminDTO dto); //로그인
}
