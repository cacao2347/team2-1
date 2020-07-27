package com.sys.comeit;

import java.util.ArrayList;

public interface ISpaceDAO 
{
	public SpaReqDTO spaceInfoSearch(String spa_req_cd);						// 공간 정보 조회
	public ArrayList<SpaReqDTO> spaceFcltySearch(String spa_req_cd);		// 공간 시설안내 조회
	public ArrayList<SpaReqDTO> spaceTagSearch(String spa_req_cd);		// 공간 키워드 태그 조회
	public ArrayList<SpaReqDTO> spaceFeed(String spa_req_cd);		// 공간 피드백 조회
	public ArrayList<SpaReqDTO> reqCount(SpaReqDTO dto);// 각 회원별 피드백 등록 여부 체크
	public String reqCd(SpaReqDTO dto);// 각 회원별 피드백 등록 여부 체크
	
	public ArrayList<SpaReqDTO> spaceList(SpaReqDTO dto);			// 공간 리스트
	public ArrayList<SpaReqDTO> MyInfoSearch(String spa_id);			// 마이페이지 공간 리스트
	
	public int spaceCount(SpaReqDTO dto);						// 공간 개수 조회
	public ArrayList<SpaReqDTO> spaceTagList();		// 모든 공간 키워드들
	public int feedInsert(SpaReqDTO dto);	// 피드백 insert
	public int reqInsert(SpaReqDTO dto);	// 예약하기 insert
	
	public ArrayList<SpaReqDTO> googleChart(String spa_id);		// 마이페이지 그래프
}
