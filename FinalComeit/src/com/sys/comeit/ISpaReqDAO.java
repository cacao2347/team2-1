package com.sys.comeit;

import java.util.ArrayList;

public interface ISpaReqDAO 
{
	public String spaReqAdd(SpaReqDTO dto);	// 공간 등록
	public int spaReqCount();				// 공간 수
	public ArrayList<SpaReqDTO> spaReqList();	// 공간 리스트
	public int spaReqModify(SpaReqDTO dto);	// 공간 수정
	public int spaReqRemove(int sid); 		// 공간 삭제
	
	public int spaIntTagInsert(SpaReqDTO dto);	// 키워드
	public int spaEtcTagInsert(SpaReqDTO dto);	// 기타 키워드
	
	public int spaEtcTagCount(String etcTag);		// 회원 관심 기타 키워드 10개 체크
	public int spaAddTagName(String etcTag);	// 관심 키워드에 INSERT
	public ArrayList<SpaReqDTO> spaTagList();	// 키워드 리스트
	
	public int spaAddImg(SpaReqDTO dto);	// 공간 이미지 INSERT
	public int spaAddContent(SpaReqDTO dto);	// 시설안내 INSERT
}
