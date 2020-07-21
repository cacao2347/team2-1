package com.sys.comeit;

import java.util.ArrayList;

public interface ISpaDAO
{
	public int spaAdd(SpaDTO dto);	// �떎�젣 �쉶�썝 媛��엯 insert
	public int spaCount();				// �쉶�썝 �닔
	public ArrayList<SpaDTO> spaList();	// �쉶�썝 由ъ뒪�듃
	
	public int spaModify(SpaDTO dto);	// �뾽泥� �쉶�썝�씠 �옄湲� �젙蹂� �닔�젙 update
	public int spaRemove(int sid); 		// �뾽泥� �쉶�썝�깉�눜�슂泥�
	public String spaLogin(SpaDTO dto); //濡쒓렇�씤
}
