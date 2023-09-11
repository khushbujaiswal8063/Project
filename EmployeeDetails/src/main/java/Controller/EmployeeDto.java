package Controller;

public class EmployeeDto {
	private String firstname;
	private String lastname;
	private String dateofbirth;
	private String gender;
	private String address;
	private String country;
	private String state;
	private String zipcode;
	private String phone;
	private String education;
	private Integer id;
	private boolean tenth=false;
	private boolean GR=false;
	private boolean PG=false;
	
	
	
	public boolean isTenth() {
		return tenth;
	}
	public void setTenth(boolean tenth) {
		this.tenth = tenth;
	}
	public boolean isGR() {
		return GR;
	}
	public void setGR(boolean gR) {
		GR = gR;
	}
	public boolean isPG() {
		return PG;
	}
	public void setPG(boolean pG) {
		PG = pG;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getDateofbirth() {
		return dateofbirth;
	}
	public void setDateofbirth(String dateofbirth) {
		this.dateofbirth = dateofbirth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getPhone() {
		return phone;
	}
	public void setphone(String phone) {
		this.phone= phone;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
}
	
