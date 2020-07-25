package com.sys.comeit;

import java.util.ArrayList;

public interface ISpaceDAO 
{
	public SpaReqDTO spaceInfoSearch(String spa_req_cd);						// 공간 정보 조회
	public ArrayList<SpaReqDTO> spaceIntTagSearch(String spa_req_cd);		// 공간 키워드 태그 조회
	public ArrayList<SpaReqDTO> spaceEtcTagSearch(String spa_req_cd);		// 공간 기타 키워드 태그 조회
	
	public ArrayList<SpaReqDTO> spaceList(String check_type);			// 공간 리스트
	public int spaceModify(SpaReqDTO dto);			// 공간 정보 수정
	
	public int spaceCount(String check_type);						// 공간 개수 조회
	public ArrayList<SpaReqDTO> spaceTagList();		// 모든 공간 키워드들

}