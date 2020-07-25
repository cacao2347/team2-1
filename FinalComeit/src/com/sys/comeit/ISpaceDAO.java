package com.sys.comeit;

import java.util.ArrayList;

public interface ISpaceDAO 
{
	public SpaReqDTO spaceInfoSearch(String spa_req_cd);						// 공간 정보 조회
	public ArrayList<SpaReqDTO> spaceFcltySearch(String spa_req_cd);		// 공간 시설안내 조회
	public ArrayList<SpaReqDTO> spaceTagSearch(String spa_req_cd);		// 공간 키워드 태그 조회
	public ArrayList<SpaReqDTO> spaceFeed(String spa_req_cd);		// 공간 피드백 조회
	public ArrayList<SpaReqDTO> reqCount(String spa_req_cd);// 각 회원별 피드백 등록 여부 체크
	
	public ArrayList<SpaReqDTO> spaceList(String check_type);			// 공간 리스트
	
	public int spaceCount(String check_type);						// 공간 개수 조회
	public ArrayList<SpaReqDTO> spaceTagList();		// 모든 공간 키워드들
	
}
