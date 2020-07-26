package com.sys.comeit;

import java.util.ArrayList;
import java.util.List;

public interface ILectureDAO
{
	// 강의 개설 메소드
	public String lectureInsert(LectureDTO dto); // 강의 inserT
	
	public int insertIntTag(LectureDTO dto);
	public int insertEtcTag(LectureDTO dto);
	public int etcTagCount(String etcTag);
	public int addTagName(String etcTag);
	public int addLecturePrgTime(LectureDTO dto);
	
	public ArrayList<LectureDTO> lecList();			// 강의 리스트
	public ArrayList<LectureDTO> lecTagList();		// 모든 강의 키워드들
	
	public int lecCount();						// 강의방 개수 조회
	
	public int lecSearchCount(LectureDTO dto);	// 검색완료된 스터디방 개수
	
	public List<LectureDTO> getListData(LectureDTO dto);	// 검색완료된 스터디방
	
	public ArrayList<LectureDTO> lecHrDaySearch();	// 모든 요일 빼오는 리스트
	
}
