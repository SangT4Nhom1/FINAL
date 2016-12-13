package Model;

public class NopBai {
	private long MaDeTai;
	private String TenDeTai;
	private long MSSV;
	private String TenSV;
	private String TenGV;
	private String TomTat;
	private byte[] File;
	
	public long getMaDeTai() {
		return MaDeTai;
	}
	public void setMaDeTai(Long MaDeTai) {
		this.MaDeTai = MaDeTai;
	}
	public String getTenDeTai() {
		return TenDeTai;
	}
	public void setTenDeTai(String TenDeTai) {
		this.TenDeTai = TenDeTai;
	}
	public long getMSSV() {
		return MSSV;
	}
	public void setMSSV(Long MSSV) {
		this.MSSV = MSSV;
	}
	public String getTenSV() {
		return TenSV;
	}
	public void setTenSV(String TenSV) {
		this.TenSV = TenSV;
	}
	public String getTenGV() {
		return TenGV;
	}
	public void setTenGV(String TenGV) {
		this.TenGV = TenGV;
	}
	public String getTomTat() {
		return TomTat;
	}
	public void setTomTat(String TomTat) {
		this.TomTat = TomTat;
	}
		
	public byte[] getFile() {
		return File;
	}
	public void setFile(byte[] File) {
		this.File = File;
	}
	public NopBai(long MaDeTai, String TenDeTai, Long MSSV, String TenSV, String TenGV, String TomTat) {
		super();
		this.MaDeTai = MaDeTai;
		this.TenDeTai = TenDeTai;
		this.MSSV = MSSV;
		this.TenSV = TenSV;
		this.TenGV = TenGV;
		this.TomTat = TomTat;
	}	
	public NopBai(long MaDeTai, String TenDeTai, Long MSSV, String TenSV, String TenGV, String TomTat, byte[] File) {
		super();
		this.MaDeTai = MaDeTai;
		this.TenDeTai = TenDeTai;
		this.MSSV = MSSV;
		this.TenSV = TenSV;
		this.TenGV = TenGV;
		this.TomTat = TomTat;
		this.File = File;
	}
	public NopBai() {
		super();
		// TODO Auto-generated constructor stub
	}


}
