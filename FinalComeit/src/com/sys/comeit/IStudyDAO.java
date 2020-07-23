package com.sys.comeit;

import java.util.ArrayList;

public interface IStudyDAO
{
	public StudyDTO studyInfoSearch(String stu_cd);			// 스터디방 정보 조회
	
	public String studyInsert(StudyDTO dto);		// 스터디 개설 
	public int studyDayInsert(String day);			// 스터디 진행 요일 insert
	public int studyIntTagInsert(StudyDTO dto);		// 스터디 관심 키워드 insert
	public int studyEtcTagInsert(StudyDTO dto);		// 스터디 관심 기타 키워드 insert
	public int studyEtcTagCount(String etcTag);		// 스터디 관심 기타 키워드 10개 체크
	
	public ArrayList<StudyDTO> studyList();			// 스터디 리스트
	public int studyModify(StudyDTO dto);			// 스터디 정보 수정
}
