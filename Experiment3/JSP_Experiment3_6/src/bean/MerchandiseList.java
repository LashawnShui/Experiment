package bean;

import java.util.ArrayList;

public class MerchandiseList {
	private ArrayList<Merchandise> merchandises;

	public ArrayList<Merchandise> getMerchandises() {
		return merchandises;
	}
	public void setMerchandises(ArrayList<Merchandise> merchandises) {
		this.merchandises = merchandises;
	}
	public MerchandiseList() {
		super();
		merchandises = new ArrayList<Merchandise>();
		merchandises.add(new Merchandise(
			System.currentTimeMillis()+1,
			"醉牙尖 无骨鸭掌 去骨鸭掌鸭爪鸭脚 四川小吃麻辣零食96g 香辣味",
			"img/1.jpg",
			24.90
		));
		merchandises.add(new Merchandise(
			System.currentTimeMillis()+2,
			"雀巢(Nestle)脆脆鲨 休闲零食 威化饼干巧克力味24 * 20g + 8 * 20g",
			"img/2.jpg",
			25.70
		));
		merchandises.add(new Merchandise(
			System.currentTimeMillis()+3,
			"良品铺子 小米锅巴 麻辣味小吃零食 五香味膨化休闲食品 90 麻辣味",
			"img/3.jpg",
			10.90
		));
		merchandises.add(new Merchandise(
			System.currentTimeMillis()+4,
			"天美华乳 【厂家直送】内蒙古奶酪条零食特产额颉牛奶初乳奶贝奶片原味250g包邮 250g巧克力奶贝",
			"img/4.png",
			17.80
		));
	}
	
	@Override
	public String toString() {
		return "MerchandiseList [merchandises=" + merchandises + "]";
	}
}
