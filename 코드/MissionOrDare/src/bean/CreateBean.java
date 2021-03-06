package bean;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import analysis.AnalysisDBBean;
import analysis.AnalysisDao;
import log.LogDBBean;
import log.LogDao;
import manager.managecontent.ManageContentDBBean;
import manager.managecontent.ManageContentDao;
import manager.managemessage.ManageMessageDBBean;
import manager.managemessage.ManageMessageDao;
import manager.managemission.ManageMissionDBBean;
import manager.managemission.ManageMissionDao;
import manager.managereport.ManageReportDBBean;
import manager.managereport.ManageReportDao;
import manager.manageuser.ManageUserDBBean;
import manager.manageuser.ManageUserDao;
import manager.member.MemberManagerDBbean;
import manager.member.MemberManagerDao;
import manager.supermanager.SupermanagerDBBean;
import manager.supermanager.SupermanagerDao;
import user.member.UserMemberDBBean;
import user.member.UserMemberDao;
import user.missionauth.MissionAuthDBBean;
import user.missionauth.MissionAuthDao;
import user.missioneval.UserMissionEvalDBBean;
import user.missioneval.UserMissionEvalDao;
import user.missionget.MissionGetDBBean;
import user.missionget.MissionGetDao;
import user.successboard.UserSuccessBoardDBBean;
import user.successboard.UserSuccessBoardDao;
import user.userpage.UserUserPageDBBean;
import user.userpage.UserUserPageDao;

@Configuration
public class CreateBean {
	@Bean
	public LogDao logDao() {
		LogDao logDao = new LogDBBean();
		return logDao;
	}
	
	@Bean
	public UserSuccessBoardDao userSuccessBoardDao() {
		UserSuccessBoardDBBean userSuccessBoardDao = new UserSuccessBoardDBBean();
		return userSuccessBoardDao;
	}
	
	@Bean
	public MissionGetDao missionGetDao() {
		MissionGetDBBean missionGetDao = new MissionGetDBBean();
		return missionGetDao;
	}
	@Bean
	public MissionAuthDao missionAuthDao() {
		MissionAuthDBBean missionAuthDao = new MissionAuthDBBean();
		return missionAuthDao;
	}
	
	@Bean
	public ManageReportDao manageReportDao() {
		ManageReportDBBean manageReportDao = new ManageReportDBBean();
		return manageReportDao;
	}
	@Bean
	public ManageContentDao manageContentDao() {
		ManageContentDBBean manageContentDao = new ManageContentDBBean();
		return manageContentDao;
	}
	@Bean
	public SupermanagerDao supermanagerDao() {
		SupermanagerDBBean supermanagerDao = new SupermanagerDBBean();
		return supermanagerDao;
	}
	
	@Bean
	public MemberManagerDao memberManagerDao() {
		MemberManagerDBbean memberManagerDao = new MemberManagerDBbean();
		return memberManagerDao;
	}	
	@Bean
	public ManageMissionDao manageMissionDao() {
		ManageMissionDBBean manageMissionDao = new ManageMissionDBBean();
		return manageMissionDao;
	}
	
	@Bean
	public ManageMessageDao manageMessageDao() {
		ManageMessageDBBean manageMessageDao = new ManageMessageDBBean();
		return manageMessageDao;
	}
	@Bean
	public ManageUserDao manageUserDao() {
		ManageUserDBBean manageUserDao = new ManageUserDBBean();
		return manageUserDao;
	}
	@Bean
	public UserMemberDao userMemberDao() {
		UserMemberDBBean userMemberDao = new UserMemberDBBean();
		return userMemberDao;
	}
	@Bean
	public UserMissionEvalDao userMissionEvalDao() {
		UserMissionEvalDBBean userMissionEvalDao = new UserMissionEvalDBBean();
		return userMissionEvalDao;
	}	
	@Bean
	public UserUserPageDao userUserPageDao() {
		UserUserPageDBBean UserUserPageDao = new UserUserPageDBBean();
		return UserUserPageDao;
	}
	@Bean
	public ViewResolver viewResolver() {
		UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
		viewResolver.setContentType("utf-8");
		viewResolver.setViewClass( JstlView.class );
		viewResolver.setPrefix( "/" );
		viewResolver.setSuffix( ".jsp" );
		return viewResolver;
	}
	
	@Bean
	public MultipartResolver multipartResolver() throws Exception {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		return multipartResolver;
	}
	
	@Bean
	public AnalysisDao analysisDao() {
		AnalysisDBBean analysisDao = new AnalysisDBBean();
		return analysisDao;
	}
}









