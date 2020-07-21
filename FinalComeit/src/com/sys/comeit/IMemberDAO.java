/*========================
	IMemberDAO.java
	- 인터페이스
========================*/
package com.sys.comeit;

import java.util.ArrayList;

public interface IMemberDAO
{
	public int memberAdd(MemberDTO dto);	// 실제 회원 가입 insert
	public int memberCount();			// 회원 수
	public ArrayList<MemberDTO> memberList();	// 회원 리스트	
	public int memberModify(MemberDTO dto);	// 회원이 자기 정보 수정 update
	public int memberRemove(int mid); 		// 회원탈퇴(프로시저로 탈퇴될텐데?)
	
	public String memberLogin(MemberDTO dto); //로그인
	public String memStop(String id);		// 정지 여부 확인
	public int memBlock(String id);			// 블락 여부 확인

}
