package global.dclass.team5.VO;

public class Member {
	private String id;
	private String pw;
	private String name;
	private String department;
	private String division;
	private String indate;
 	private String start_day;
	private String last_day;
	
	
	public String getStart_day() {
		return start_day;
	}

	public void setStart_day(String start_day) {
		this.start_day = start_day;
	}

	public String getLast_day() {
		return last_day;
	}

	public void setLast_day(String last_day) {
		this.last_day = last_day;
	}

	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(String id, String pw, String name, String department, String division, String indate) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.department = department;
		this.division = division;
		this.indate = indate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public String getIndate() {
		return indate;
	}

	public void setIndate(String indate) {
		this.indate = indate;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pw=" + pw + ", name=" + name + ", department=" + department + ", division="
				+ division + ", indate=" + indate + ", start_day=" + start_day + ", last_day=" + last_day + "]";
	}


	
	
	
}
