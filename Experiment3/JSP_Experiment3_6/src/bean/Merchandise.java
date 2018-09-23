package bean;

import java.util.ArrayList;

public class Merchandise {
	private long id;
	private String name;
	private String imageURL;
	private double unitPrice;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImageURL() {
		return imageURL;
	}
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	
	public Merchandise() {
		super();
	}
	public Merchandise(long id, String name, String imageURL, double unitPrice) {
		super();
		this.id = id;
		this.name = name;
		this.imageURL = imageURL;
		this.unitPrice = unitPrice;
	}
	
	@Override
	public String toString() {
		return "Merchandise [id=" + id + ", name=" + name + ", imageURL="
				+ imageURL + ", unitPrice=" + unitPrice + "]";
	}
}
