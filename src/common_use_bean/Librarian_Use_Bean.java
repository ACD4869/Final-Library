package common_use_bean;

public class Librarian_Use_Bean {
	
	private String librarian_id;
	private String librarian_name;
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
	public String getLibrarian_id() {
		return librarian_id;
	}
	public void setLibrarian_id(String librarian_id) {
		this.librarian_id = librarian_id;
	}
	public String getLibrarian_name() {
		return librarian_name;
	}
	public void setLibrarian_name(String librarian_name) {
		this.librarian_name = librarian_name;
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
