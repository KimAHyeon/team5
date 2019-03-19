package global.dclass.team5.DAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GroupBoardDAO {
	
	@Autowired
	SqlSession session;

}
