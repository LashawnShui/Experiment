package bean;

import java.util.ArrayList;

public class ShoppingCar {
	private ArrayList<MerchandiseItem> merchandiseItems;

	public ArrayList<MerchandiseItem> getMerchandiseItems() {
		return merchandiseItems;
	}
	public void setMerchandiseItems(ArrayList<MerchandiseItem> merchandiseItems) {
		this.merchandiseItems = merchandiseItems;
	}
	
	public ShoppingCar() {
		super();
		merchandiseItems = new ArrayList<MerchandiseItem>();
	}
	public ShoppingCar(ArrayList<MerchandiseItem> merchandiseItems) {
		super();
		this.merchandiseItems = merchandiseItems;
	}
	
	@Override
	public String toString() {
		return "ShoppingCar [merchandiseItems=" + merchandiseItems + "]";
	}
	
	public void addToShoppingCar(Merchandise merchandise){
		for(MerchandiseItem merchandiseItem : getMerchandiseItems()){
			if(merchandiseItem.getMerchandise().getId() == merchandise.getId()){
				merchandiseItem.setNumber(merchandiseItem.getNumber() + 1);
				return;
			}
		}
		getMerchandiseItems().add(new MerchandiseItem(merchandise,1));
	}
	public double getTotal(){
		double total = 0;
		for(MerchandiseItem merchandiseItem : getMerchandiseItems()){
			total += merchandiseItem.getSubtotal();
		}
		return total;
	}
	public int getNumber(){
		int number = 0;
		for(MerchandiseItem merchandiseItem : getMerchandiseItems()){
			number += merchandiseItem.getNumber();
		}
		return number;
	}
}
