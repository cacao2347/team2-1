package com.sys.comeit;

import java.util.ArrayList;

public interface ISpaDAO
{
	public int add(SpaDTO dto);	// 실제 회원 가입 insert
	public int count();				// 회원 수
	public ArrayList<SpaDTO> list();	// 회원 리스트
	
	public int modify(SpaDTO dto);	// 업체 회원이 자기 정보 수정 update
	public int remove(int sid); 		// 업체 회원탈퇴요청
}
