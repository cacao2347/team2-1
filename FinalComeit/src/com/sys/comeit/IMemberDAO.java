/*========================
	IMemberDAO.java
	- 인터페이스
========================*/
package com.sys.comeit;

import java.util.ArrayList;

public interface IMemberDAO
{
	public int add(MemberDTO dto);	// 실제 회원 가입 insert
	public int count();				// 회원 수
	public ArrayList<MemberDTO> list();	// 회원 리스트	
	public int modify(MemberDTO dto);	// 회원이 자기 정보 수정 update
	public int remove(int mid); 		// 회원탈퇴(프로시저로 탈퇴될텐데?)
	
}
