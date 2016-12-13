package Model;

public class Diem {
	public long MaDeTai;
	public long MaGV;
	public long Diem;
	public long getMaDeTai() {
		return MaDeTai;
	}
	public void setMaDeTai(Long MaDeTai) {
		this.MaDeTai = MaDeTai;
	}
	public long getMaGV() {
		return MaGV;
	}
	public void setMaGV(Long MaGV) {
		this.MaGV = MaGV;
	}
	public long getDiem() {
		return Diem;
	}
	public void setDiem(Long Diem) {
		this.Diem = Diem;
	}
	public Diem(Long MaDeTai, Long MaGV, Long Diem) {
		super();
		this.MaDeTai = MaDeTai;
		this.MaGV = MaGV;
		this.Diem = Diem;
	}
	public Diem() {
		super();
		// TODO Auto-generated constructor stub
	}


}
