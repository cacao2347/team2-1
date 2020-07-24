package com.sys.comeit;

public interface ILectureDAO
{
	// 강의 개설 메소드
	public String lectureInsert(LectureDTO dto);
	public int insertIntTag(LectureDTO dto);
	public int insertEtcTag(LectureDTO dto);
	public int etcTagCount(String etcTag);
	public int addTagName(String etcTag);
	
}
