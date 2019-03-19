package global.dclass.team5.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import global.dclass.team5.DAO.MessageDAO;
import global.dclass.team5.VO.Message;

@Service
public class MessageService {
	@Autowired
	MessageDAO dao;
	
	//5개 리스트만 출력
	public ArrayList<Message> select_five_messages(String id) {
		ArrayList<Message> newList = null;
		ArrayList<Message> list = dao.select_all_messages(id);
		 if(list.size()<5) {
			 newList = list;
		 } else {	 
		 newList =new ArrayList<Message>(list.subList(0, 4));
		 }
			System.out.println("[Service]"+newList.toString());
		return newList;
	}
	
	//��� �޽��� ��ȸ
	public ArrayList<Message> select_all_messages(String id) {

		 ArrayList<Message>	list = dao.select_all_messages(id);
			System.out.println("[Service]"+list.toString());
		return list;
	}

	public int delete_messages(int msg_seq) {
		int num = dao.delete_messages(msg_seq);
		return num;
	}

	
}
