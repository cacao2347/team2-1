package com.sys.comeit;

import java.util.ArrayList;

public interface IAdminDAO
{
	public int count();					// 관리자 수
	public ArrayList<AdminDTO> list();	// 관리자 리스트	
}
