package oop0320;

class BbsDTO { //Data Transfer Object
	
	//멤버변수 field
	private int bbsno;		//글번호 //private는 은폐
	private String writer;	//글작성자
	private String subject;	//글제목
	
	//생성자함수 constructor
	public BbsDTO() {}	
	
	//멤버함수 method
	public int getBbsno() {
		return this.bbsno;
	}
	
	public void setBbsno(int bbsno) {
		this.bbsno=bbsno;
	}
	
	public String getWriter() {
		return this.writer;
	}
	
	public void setWriter(String writer) {
		this.writer=writer;
	}
	
	public String getSubject() {
		return this.subject;
	}
	
	public void setSubject(String subject) {
		this.subject=subject;
	}
	
}//class end
