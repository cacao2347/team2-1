package com.sys.comeit;

import java.util.ArrayList;

public interface IStudyFileDAO {
	
	public ArrayList<StudyFileDTO> studyFileList(String file_stu_cd);		// 전체 리스트 조회
	public StudyFileDTO studyFileDetail(StudyFileDTO dto);				// 상세 내역 조회
	public ArrayList<StudyFileDTO> fileUrlSearch(StudyFileDTO dto) throws NumberFormatException;		// 첨부파일 조회
	public int searchFileCount(StudyFileDTO dto);			// 게시물 수
	public ArrayList<StudyFileDTO> getFileListData(StudyFileDTO dto);	// 페이징 처리 된 게시물 리스트
}
