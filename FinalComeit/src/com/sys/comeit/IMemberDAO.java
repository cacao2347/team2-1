/*========================
	IMemberDAO.java
	- �씤�꽣�럹�씠�뒪
========================*/
package com.sys.comeit;

import java.util.ArrayList;

public interface IMemberDAO
{
	public int memberAdd(MemberDTO dto);	// 실제 회원 가입 insert
	public int memberCount();				// 회원수
	public ArrayList<MemberDTO> memberList();	// 회원 리스트	
	public int memberModify(MemberDTO dto);	// 회원이 자기 정보 수정 update
	public int memberRemove(int mid); 		// 회원 탈퇴
	public String memberLogin(MemberDTO dto); //로그인
	
	public int stopSearch(String id);		// 정지 여부 확인
}
