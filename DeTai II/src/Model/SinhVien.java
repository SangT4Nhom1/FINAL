package Model;

public class SinhVien {
	private long MSSV;
	private String SDT;
	private String Email;
	private String DiaChi;
	public long getMSSV() {
		return MSSV;
	}
	public void setMSSV(Long MSSV) {
		this.MSSV = MSSV;
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
	public SinhVien(Long MSSV, String SDT, String Email, String DiaChi) {
		super();
		this.MSSV = MSSV;
		this.SDT = SDT;
		this.Email = Email;
		this.DiaChi = DiaChi;
	}
	public SinhVien() {
		super();
		// TODO Auto-generated constructor stub
	}


}
