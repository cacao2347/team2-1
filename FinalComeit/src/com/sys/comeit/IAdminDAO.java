package com.sys.comeit;

import java.util.ArrayList;

public interface IAdminDAO
{
	public int adminCount();				// 관리자 수
	public ArrayList<AdminDTO> adminList();	// 관리자 리스트	
	public String adminLogin(AdminDTO dto); //로그인
	
	public int adminAdd(AdminDTO dto);		// 관리자 추가
	public int adminDelete(String admin_cd);// 관리자 삭제
	
	public int banAdd(BanDTO dto);
	public ArrayList<BanDTO> banList();
	public int banDelete(String lngg_ban_cd);
	
	public int adminModify(AdminDTO dto);	// 관리자 비밀번호 수정
	
	// 한명의 관리자에 대한 정보 리스트
	public AdminDTO adminSearchList(String admin_cd);	// 관리자 리스트	 
	
	// 관리자 업체 회원 리스트 조회
	public ArrayList<SpaDTO> admspaList();	// 회원 리스트
}
