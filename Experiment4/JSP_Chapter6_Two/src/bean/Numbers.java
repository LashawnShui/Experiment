package bean;

import java.util.ArrayList;

public class Numbers {
	private ArrayList<Double> numbers;

	public ArrayList<Double> getNumbers() {
		return numbers;
	}
	public void setNumbers(ArrayList<Double> numbers) {
		this.numbers = numbers;
	}
	
	public Numbers(ArrayList<Double> numbers) {
		super();
		this.numbers = numbers;
	}
	public Numbers() {
		super();
		this.numbers = new ArrayList<Double>();
	}
	
	@Override
	public String toString() {
		return "Numbers [numbers=" + numbers + "]";
	}
}
