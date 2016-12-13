package Model;

public class DeTai {
	public long MaDeTai;
	public String TenDeTai;
	public long MaSV;
	public String NgayBaoCao;
	public String GioBaoCao;
	public String ThoiLuongBaoCao;
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
	public long getMaSV() {
		return MaSV;
	}
	public void setMaSV(Long MaSV) {
		this.MaSV = MaSV;
	}
	public String getNgayBaoCao() {
		return NgayBaoCao;
	}
	public void setNgayBaoCao(String NgayBaoCao) {
		this.NgayBaoCao = NgayBaoCao;
	}
	public String getGioBaoCao() {
		return GioBaoCao;
	}
	public void setGioBaoCao(String GioBaoCao) {
		this.GioBaoCao = GioBaoCao;
	}
	public String getThoiLuongBaoCao() {
		return ThoiLuongBaoCao;
	}
	public void setThoiLuongBaoCao(String ThoiLuongBaoCao) {
		this.ThoiLuongBaoCao = ThoiLuongBaoCao;
	}
	public DeTai(Long MaDeTai, String TenDeTai, Long MaSV, String NgayBaoCao, String GioBaoCao,
			String ThoiLuongBaoCao) {
		super();
		this.MaDeTai = MaDeTai;
		this.TenDeTai = TenDeTai;
		this.MaSV = MaSV;
		this.NgayBaoCao = NgayBaoCao;
		this.GioBaoCao = GioBaoCao;
		this.ThoiLuongBaoCao = ThoiLuongBaoCao;
	}

	public DeTai(Long MaDeTai, String NgayBaoCao, String GioBaoCao, String ThoiLuongBaoCao) {
		super();
		this.MaDeTai = MaDeTai;
		this.NgayBaoCao = NgayBaoCao;
		this.GioBaoCao = GioBaoCao;
		this.ThoiLuongBaoCao = ThoiLuongBaoCao;
	}
	
	public DeTai() {
		super();
		// TODO Auto-generated constructor stub
	}


}
