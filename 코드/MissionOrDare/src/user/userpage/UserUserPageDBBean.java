package user.userpage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import Dtos.NotesDto;
import Dtos.SuccessBoardDto;
import Dtos.UserMissionsDto;
import Dtos.UserNotesDto;
import Dtos.UsersDto;

public class UserUserPageDBBean implements UserUserPageDao{
	SqlSession session = SqlMapClient.getSession();
	
	public UsersDto getUserInfo(String user_nickname) {
		return session.selectOne("UserPage.getUserInfo",user_nickname);
	}
	public List<UserMissionsDto> userMissionInfo(String user_nickname) {
		return session.selectList("UserPage.userMissionInfo", user_nickname);
	}
	public List<UserNotesDto> receivedMessageInfo(String user_nickname) {
		return session.selectList("UserPage.receivedMessageInfo",user_nickname);
	}
	public List<NotesDto> sentMessageInfo(String user_nickname) {
		return session.selectList("UserPage.sentMessageInfo",user_nickname);
	}
	public String getProfile(String user_nickname) {
		return session.selectOne("UserPage.getProfile",user_nickname);
	}
	public int sendMessage(NotesDto notesDto) {
		return session.insert("UserPage.sendMessage",notesDto);
	}
	public int userModify(UsersDto usersDto) {
		return session.update("UserPage.userModify",usersDto);
	}
	public UserMissionsDto getMyMission(String mission_state_id) {
		return session.selectOne("UserPage.getMyMission", mission_state_id);
	}
	public SuccessBoardDto getSuccessMission(String mission_state_id) {
		return session.selectOne("UserPage.getSuccessMission", mission_state_id);
	}
}
