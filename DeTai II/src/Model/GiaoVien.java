package Model;

public class GiaoVien {
	private long MSGV;
	private String SDT;
	private String Email;
	private String DiaChi;
	public long getMSGV() {
		return MSGV;
	}
	public void setMSSV(Long MSGV) {
		this.MSGV = MSGV;
	}
	public String getSDT() {
		return SDT;
	}
	public void setSDT(String SDT) {
		this.SDT = SDT;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String Email) {
		this.Email = Email;
	}
	public String getDiaChi() {
		return DiaChi;
	}
	public void setDiaChi(String DiaChi) {
		this.DiaChi = DiaChi;
	}
	public GiaoVien(Long MSGV, String SDT, String Email, String DiaChi) {
		super();
		this.MSGV = MSGV;
		this.SDT = SDT;
		this.Email = Email;
		this.DiaChi = DiaChi;
	}
	public GiaoVien() {
		super();
		// TODO Auto-generated constructor stub
	}

}
