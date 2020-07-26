package com.sys.comeit;

import java.util.ArrayList;

public interface IStudyNoticeDAO
{
	// 스터디 공지사항
	
	public int studyNoticeInsert(StudyNoticeDTO dto);	// 게시글 등록
	
	public int studyNoticeReInsert(StudyNoticeDTO dto);	// 댓글 등록
	
	public int studyNoticeUpdate(StudyNoticeDTO dto);	// 게시글 수정
	
	public int studyNoticeDelete(StudyNoticeDTO dto);	// 게시글 삭제
	
	public int studyNoticeReDelete(StudyNoticeDTO dto);	// 댓글 삭제
	
	public int studyReCount(StudyNoticeDTO dto);	// 특정 게시글의 댓글 개수 확인
	
	public ArrayList<StudyNoticeDTO> studyNoticeList(String stu_cd);	// 전체 리스트 확인
	
	public ArrayList<StudyNoticeDTO> studyNoticeSearch(String title);	// 제목 검색
	
	public StudyNoticeDTO studyNoticeDetail(StudyNoticeDTO dto);	// 특정 게시글의 상세 데이터
	
	public ArrayList<StudyNoticeDTO> studyNoticeReList(StudyNoticeDTO dto);	// 1번방의 2번게시물의 댓글리스트

}
