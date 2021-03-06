package user.member;


import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import Dtos.UsersDto;

public class UserMemberDBBean implements UserMemberDao{
	SqlSession session = SqlMapClient.getSession();

	public int nicknameCheck(String user_nickname) {
		return session.selectOne("Member.nicknameCheck",user_nickname);
	}
	public int loginCheck(int kakao_id) {
		return session.selectOne("Member.loginCheck",kakao_id);
	}
	public int insertUser(UsersDto usersDto) {
		return session.insert("Member.insertUser", usersDto);
	}
	public String findNickname(int kakao_id) {
		return session.selectOne("Member.findNickname",kakao_id);
	}
	public int withdrawlCheck(int kakao_id) {
		return session.selectOne("Member.withdrawlCheck", kakao_id);
	}
	public int updateUser(UsersDto usersDto) {
		return session.update("Member.updateUser", usersDto);
	}
	public int withdrawalUp(int kakao_id) {
		return session.update( "Member.withdrawalUp", kakao_id );
	}
	public int withdrawalDel( int kakao_id ) {
		return session.delete( "Member.withdrawalDel", kakao_id );
	}
	public int updateProfile( Map< String, String > modata ) {
		return session.update( "Member.updateProfile", modata );
	}
}