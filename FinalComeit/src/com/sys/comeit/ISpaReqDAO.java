package com.sys.comeit;

import java.util.ArrayList;

public interface ISpaReqDAO 
{
	public String spaReqAdd(SpaReqDTO dto);	// 공간 등록
	public int spaReqCount();				// 공간 수
	public ArrayList<SpaReqDTO> spaReqList();	// 공간 리스트
	public int spaReqModify(SpaReqDTO dto);	// 공간 수정
	public int spaReqRemove(int sid); 		// 공간 삭제
}
