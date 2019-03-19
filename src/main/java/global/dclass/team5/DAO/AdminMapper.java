package global.dclass.team5.DAO;

import java.util.ArrayList;

import global.dclass.team5.VO.Application;

public interface AdminMapper {

	public ArrayList<Application> searchApplication();

	public int insertGroupBoard();

	public Application selectApplication(int applicationSeq);

	public int updateApplication(int applicationSeq);

}
