package global.dclass.team5.DAO;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.dclass.team5.VO.Application;

@Repository
public class AdminDAO {

	@Autowired
	SqlSession session;

	public ArrayList<Application> searchApplication() {
		ArrayList<Application> result = null;
		
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		
		try {
			result = mapper.searchApplication();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return result;
	}

	public int insertGroupBoard() {
		int result = 0;
		
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		
		try {
			result = mapper.insertGroupBoard();
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		return result;
	}

	public Application selectApplication(int applicationSeq) {
		Application result = null;
		
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		
		try {
			result = mapper.selectApplication(applicationSeq);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
		return result;
	}

	public int updateApplication(int applicationSeq) {
		int result = 0;
		
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		
		try {
			result = mapper.updateApplication(applicationSeq);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		return result;
	}
}
