package global.dclass.team5.DAO;

import global.dclass.team5.VO.Application;
import global.dclass.team5.VO.Member;
import global.dclass.team5.VO.Message;

public interface MemberMapper {

	public Member selectMember(String id);

	public int insertMember(Member member);

	public int updateMember(Member member);

	public int insertApplication(Application application);

	public Application selectApplication(String id);

	public void sendConfirmMessage(Message message);


}
