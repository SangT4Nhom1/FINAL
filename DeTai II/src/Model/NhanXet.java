package Model;

public class NhanXet {
	public long MaDeTai;
	public String TenDeTai;
	public long MaGV;
	public String ChucVu;
	public String NhanXet;
	public String BaoCao;
	public String XepLoai;
	public String TenGV;
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
	public Long getMaGV() {
		return MaGV;
	}
	public void setMaGV(Long MaGV) {
		this.MaGV = MaGV;
	}
	public String getChucVu() {
		return ChucVu;
	}
	public void setChucVu(String ChucVu) {
		this.ChucVu = ChucVu;
	}
	public String getNhanXet() {
		return NhanXet;
	}
	public void setNhanXet(String NhanXet) {
		this.NhanXet = NhanXet;
	}
	public String getBaoCao() {
		return BaoCao;
	}
	public void setBaoCao(String BaoCao) {
		this.BaoCao = BaoCao;
	}
	public String getXepLoai() {
		return XepLoai;
	}
	public void setXepLoai(String XepLoai) {
		this.XepLoai = XepLoai;
	}
	public String getTenGV() {
		return TenGV;
	}
	public void setTenGV(String TenGV) {
		this.TenGV = TenGV;
	}
	public NhanXet(Long MaDeTai, String TenDeTai, Long MaGV, String ChucVu, String NhanXet, String BaoCao,
			String XepLoai, String TenGV) {
		super();
		this.MaDeTai = MaDeTai;
		this.TenDeTai = TenDeTai;
		this.MaGV = MaGV;
		this.ChucVu = ChucVu;
		this.NhanXet = NhanXet;
		this.BaoCao = BaoCao;
		this.XepLoai = XepLoai;
		this.TenGV = TenGV;
	}

	public NhanXet(Long MaDeTai,Long MaGV, String TenDeTai, String TenGV, String NhanXet, String BaoCao, String XepLoai) {
		super();
		this.MaDeTai = MaDeTai;
		this.TenDeTai = TenDeTai;
		this.NhanXet = NhanXet;
		this.BaoCao = BaoCao;
		this.XepLoai = XepLoai;
		this.TenGV = TenGV;
		this.MaGV=MaGV;
	}

	public NhanXet(long MaDeTai, String TenDeTai, long MaGV, String ChucVu) {
		super();
		this.MaDeTai = MaDeTai;
		this.TenDeTai = TenDeTai;
		this.MaGV = MaGV;
		this.ChucVu = ChucVu;
	}

	public NhanXet(long MaDeTai) {
		super();
		this.MaDeTai = MaDeTai;
	}
	public NhanXet() {
		super();
		// TODO Auto-generated constructor stub
	}




}
