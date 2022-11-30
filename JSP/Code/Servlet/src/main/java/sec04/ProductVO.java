package sec04;

public class ProductVO {
	private String PrdName;
	private int PrdNo;
	private int PrdPrice;
	private int PrdQty;
	
	
	public ProductVO(String prdName, int prdNo, int prdPrice, int prdQty) {
		super();
		PrdName = prdName;
		PrdNo = prdNo;
		PrdPrice = prdPrice;
		PrdQty = prdQty;
	}

	public String getPrdName() {
		return PrdName;
	}

	public void setPrdName(String prdName) {
		PrdName = prdName;
	}

	public int getPrdNo() {
		return PrdNo;
	}

	public void setPrdNo(int prdNo) {
		PrdNo = prdNo;
	}

	public int getPrdPrice() {
		return PrdPrice;
	}

	public void setPrdPrice(int prdPrice) {
		PrdPrice = prdPrice;
	}

	public int getPrdQty() {
		return PrdQty;
	}

	public void setPrdQty(int prdQty) {
		PrdQty = prdQty;
	}

	public ProductVO() {} 
	
	
	
}
