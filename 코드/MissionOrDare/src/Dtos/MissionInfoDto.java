package Dtos;

public class MissionInfoDto {

	private String mission_info_id;
	private String mission_title;
	private int mission_level;
	private String mission_category_id;
	private int mission_success_score;
	private int mission_accept_count;
	private int mission_reject_count;
	private String mission_location;
	private int mission_avg_score;
	private String mission_contents;
	public String getMission_info_id() {
		return mission_info_id;
	}
	public void setMission_info_id(String mission_info_id) {
		this.mission_info_id = mission_info_id;
	}
	public String getMission_title() {
		return mission_title;
	}
	public void setMission_title(String mission_title) {
		this.mission_title = mission_title;
	}
	public int getMission_level() {
		return mission_level;
	}
	public void setMission_level(int mission_level) {
		this.mission_level = mission_level;
	}
	public String getMission_category_id() {
		return mission_category_id;
	}
	public void setMission_category_id(String mission_category_id) {
		this.mission_category_id = mission_category_id;
	}
	public int getMission_success_score() {
		return mission_success_score;
	}
	public void setMission_success_score(int mission_success_score) {
		this.mission_success_score = mission_success_score;
	}
	public int getMission_accept_count() {
		return mission_accept_count;
	}
	public void setMission_accept_count(int mission_accept_count) {
		this.mission_accept_count = mission_accept_count;
	}
	public int getMission_reject_count() {
		return mission_reject_count;
	}
	public void setMission_reject_count(int mission_reject_count) {
		this.mission_reject_count = mission_reject_count;
	}
	public String getMission_location() {
		return mission_location;
	}
	public void setMission_location(String mission_location) {
		this.mission_location = mission_location;
	}
	public int getMission_avg_score() {
		return mission_avg_score;
	}
	public void setMission_avg_score(int mission_avg_score) {
		this.mission_avg_score = mission_avg_score;
	}
	public String getMission_contents() {
		return mission_contents;
	}
	public void setMission_contents(String mission_contents) {
		this.mission_contents = mission_contents;
	}
	
}
