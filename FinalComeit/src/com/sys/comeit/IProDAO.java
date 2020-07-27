/*========================
private String 	IMemberDAO.java
	- 인터페이스
========================*/


package com.sys.comeit;

import java.util.ArrayList;

public interface IProDAO
{
	public ArrayList<ProDTO> proList();
	public ProDTO profInfo(String mem_cd);
	public int lecCreateCheck(String mem_cd);
	public String lecCreateCheck2(String mem_cd);
}