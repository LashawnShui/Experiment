package bean;

public class MerchandiseItem {
	private Merchandise merchandise;
	private int number;
	
	public Merchandise getMerchandise() {
		return merchandise;
	}
	public void setMerchandise(Merchandise merchandise) {
		this.merchandise = merchandise;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	
	public MerchandiseItem() {
		super();
	}
	public MerchandiseItem(Merchandise merchandise, int number) {
		super();
		this.merchandise = merchandise;
		this.number = number;
	}
	
	public double getSubtotal(){
		return merchandise.getUnitPrice() * number;
	}
	
	@Override
	public String toString() {
		return "MerchandiseItem [merchandise=" + merchandise + ", number="
				+ number + "]";
	}
}
