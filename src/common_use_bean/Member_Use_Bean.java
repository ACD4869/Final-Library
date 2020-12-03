package common_use_bean;

public class Member_Use_Bean {
	
	private String member_id;
	private String member_name;
	private String telephone;
	private String number_id;
	private String added_by;
	private String added_on;
	
	private int status;
	
	
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getAdded_by() {
		return added_by;
	}
	public void setAdded_by(String added_by) {
		this.added_by = added_by;
	}
	public String getAdded_on() {
		return added_on;
	}
	public void setAdded_on(String added_on) {
		this.added_on = added_on;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}	
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getNumber_id() {
		return number_id;
	}
	public void setNumber_id(String number_id) {
		this.number_id = number_id;
	}
	
}
