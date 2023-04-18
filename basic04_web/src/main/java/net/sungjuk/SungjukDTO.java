package net.sungjuk;

public class SungjukDTO {	//Data Transfer Object 전송객체
							//Value Object
	
	//sungjuk table 칼럼명을 기준으로 멤버변수(field) 선언 
	
    private int sno;		//일련번호
    private String uname;	//이름
    private int kor;		//국어
    private int eng;		//영어
    private int mat;		//수학
    private int aver;		//평균
    private String addr;	//주소
    private String wdate;	//등록일(년월일시분초)
    
    //기본생성자 default constructor
    public SungjukDTO() {}

    //private 멤버변수 각각에 대한 getter와 setter함수 작성
	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getMat() {
		return mat;
	}

	public void setMat(int mat) {
		this.mat = mat;
	}

	public int getAver() {
		return aver;
	}

	public void setAver(int aver) {
		this.aver = aver;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	//부모에 상속받은것을 자식에 맞춰서 설계
	@Override
	public String toString() {
		return "SungjukDTO [sno=" + sno + ", uname=" + uname + ", kor=" + kor + ", eng=" + eng + ", mat=" + mat
				+ ", aver=" + aver + ", addr=" + addr + ", wdate=" + wdate + "]";
	}
    
	
    

}//class end
