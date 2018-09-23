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
			"������ �޹�Ѽ�� ȥ��Ѽ��ѼצѼ�� �Ĵ�С��������ʳ96g ����ζ",
			"img/1.jpg",
			24.90
		));
		merchandises.add(new Merchandise(
			System.currentTimeMillis()+2,
			"ȸ��(Nestle)����� ������ʳ ���������ɿ���ζ24 * 20g + 8 * 20g",
			"img/2.jpg",
			25.70
		));
		merchandises.add(new Merchandise(
			System.currentTimeMillis()+3,
			"��Ʒ���� С�׹��� ����ζС����ʳ ����ζ������ʳƷ 90 ����ζ",
			"img/3.jpg",
			10.90
		));
		merchandises.add(new Merchandise(
			System.currentTimeMillis()+4,
			"�������� ������ֱ�͡����ɹ���������ʳ�ز����ţ�̳����̱���Ƭԭζ250g���� 250g�ɿ����̱�",
			"img/4.png",
			17.80
		));
	}
	
	@Override
	public String toString() {
		return "MerchandiseList [merchandises=" + merchandises + "]";
	}
}
