package global.dclass.team5.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.dclass.team5.VO.Message;

@Repository
public class MessageDAO {
	@Autowired
	SqlSession session;

	public ArrayList<Message> select_all_messages(String id) {
		ArrayList<Message> list = null;
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		try {
			list = mapper.select_all_messages(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int delete_messages(int msg_seq) {
		int num = 0;
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		try {
			num = mapper.delete_messages(msg_seq);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return num;
	}

}
