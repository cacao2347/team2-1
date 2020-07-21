package com.sys.comeit;

import java.util.ArrayList;

public interface IAdminDAO
{
	public int adminCount();					// 愿�由ъ옄 �닔
	public ArrayList<AdminDTO> adminList();	// 愿�由ъ옄 由ъ뒪�듃	
	public String adminLogin(AdminDTO dto); //濡쒓렇�씤
}
