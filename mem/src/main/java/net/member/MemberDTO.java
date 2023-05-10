package net.member;

public class MemberDTO {
	
	private String mid;
	private String passwd;
	private String mname;
	private int jomin1;
	private int jomin2;
	private String tel;
	private String email;
	private String mlevel;
	private String mdate;
	
	//기본생성자, getter, setter
	
	public MemberDTO() {}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public int getJomin1() {
		return jomin1;
	}

	public void setJomin1(int jomin1) {
		this.jomin1 = jomin1;
	}

	public int getJomin2() {
		return jomin2;
	}

	public void setJomin2(int jomin2) {
		this.jomin2 = jomin2;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMlevel() {
		return mlevel;
	}

	public void setMlevel(String mlevel) {
		this.mlevel = mlevel;
	}

	public String getMdate() {
		return mdate;
	}

	public void setMdate(String mdate) {
		this.mdate = mdate;
	}

	@Override
	public String toString() {
		return "MemberDTO [mid=" + mid + ", passwd=" + passwd + ", mname=" + mname + ", jomin1=" + jomin1 + ", jomin2="
				+ jomin2 + ", tel=" + tel + ", email=" + email + ", mlevel=" + mlevel + ", mdate=" + mdate + "]";
	}
	
	
}//class end
