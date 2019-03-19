package global.dclass.team5.DAO;

import java.util.ArrayList;

import global.dclass.team5.VO.Message;

public interface MessageMapper {
	
	//select all messages
	public ArrayList<Message> select_all_messages(String id);

	//delete messages
	public int delete_messages(int msg_seq);
}
