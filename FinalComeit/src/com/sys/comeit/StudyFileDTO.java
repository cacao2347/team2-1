package com.sys.comeit;

public class StudyFileDTO
{
	// 회원 아이디 , 회원코드, 이름(작성자), 스터디 참가 코드, 스터디 코드
	private String id, mem_cd, name, stu_join_cd, stu_cd;
	
	// 게시판 코드, 제목, 내용, 작성일, 조회수, 게시글 삭제일
	private String oput_cd, title, content, crt_date, hits, board_del;
	
	// 파일 코드, 파일 이름, 파일 url, 파일 삭제일
	private String file_cd, file_name, file_url, file_del, row_num;

	
	// getter / setter 구성
	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getMem_cd()
	{
		return mem_cd;
	}

	public void setMem_cd(String mem_cd)
	{
		this.mem_cd = mem_cd;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getStu_join_cd()
	{
		return stu_join_cd;
	}

	public void setStu_join_cd(String stu_join_cd)
	{
		this.stu_join_cd = stu_join_cd;
	}

	public String getStu_cd()
	{
		return stu_cd;
	}

	public void setStu_cd(String stu_cd)
	{
		this.stu_cd = stu_cd;
	}

	public String getOput_cd()
	{
		return oput_cd;
	}

	public void setOput_cd(String oput_cd)
	{
		this.oput_cd = oput_cd;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public String getCrt_date()
	{
		return crt_date;
	}

	public void setCrt_date(String crt_date)
	{
		this.crt_date = crt_date;
	}

	public String getHits()
	{
		return hits;
	}

	public void setHits(String hits)
	{
		this.hits = hits;
	}

	public String getBoard_del()
	{
		return board_del;
	}

	public void setBoard_del(String board_del)
	{
		this.board_del = board_del;
	}

	public String getFile_cd()
	{
		return file_cd;
	}

	public void setFile_cd(String file_cd)
	{
		this.file_cd = file_cd;
	}

	public String getFile_name()
	{
		return file_name;
	}

	public void setFile_name(String file_name)
	{
		this.file_name = file_name;
	}

	public String getFile_url()
	{
		return file_url;
	}

	public void setFile_url(String file_url)
	{
		this.file_url = file_url;
	}

	public String getFile_del()
	{
		return file_del;
	}

	public void setFile_del(String file_del)
	{
		this.file_del = file_del;
	}
	
	public String getRow_num()
	{
		return row_num;
	}

	public void setRow_num(String row_num)
	{
		this.row_num = row_num;
	}

}
