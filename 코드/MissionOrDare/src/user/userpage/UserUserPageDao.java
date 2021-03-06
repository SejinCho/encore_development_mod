package user.userpage;

import java.util.List;

import Dtos.NotesDto;
import Dtos.SuccessBoardDto;
import Dtos.UserMissionsDto;
import Dtos.UserNotesDto;
import Dtos.UsersDto;

public interface UserUserPageDao {
	public UsersDto getUserInfo(String user_nickname);
	public List<UserMissionsDto> userMissionInfo(String user_nickname);
	public List<UserNotesDto> receivedMessageInfo(String user_nickname);
	public List<NotesDto> sentMessageInfo(String user_nickname);
	public String getProfile(String user_nickname);
	public int sendMessage(NotesDto notesDto);
	public int userModify(UsersDto usersDto);
	public UserMissionsDto getMyMission(String mission_state_id);
	public SuccessBoardDto getSuccessMission(String mission_state_id);
}
