package Model;

public class TaiKhoan {
	private long Id_TK;
	private String Pass;
	private String Quyen;	

	public long getId_TK() {
		return Id_TK;
	}
	public void setId_TK(Long Id_TK) {
		this.Id_TK = Id_TK;
	}
	public String getPass() {
		return Pass;
	}
	public void setPass(String Pass) {
		this.Pass = Pass;
	}
	public String getQuyen() {
		return Quyen;
	}
	public void setQuyen(String Quyen) {
		this.Quyen = Quyen;
	}


	public TaiKhoan(Long Id_TK, String Pass, String Quyen) {
		super();
		this.Id_TK = Id_TK;
		this.Pass = Pass;
		this.Quyen = Quyen;
	}
	public TaiKhoan(Long Id_TK, String Pass) {
		this.Id_TK = Id_TK;
		this.Pass = Pass;
	}
	public TaiKhoan() {
		super();
		// TODO Auto-generated constructor stub
	}



}
