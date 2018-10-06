package bean;

import java.util.ArrayList;

public class Grade {
	private ArrayList<Double> scores;

	public ArrayList<Double> getScores() {
		return scores;
	}
	public void setScores(ArrayList<Double> scores) {
		this.scores = scores;
	}

	public Grade(ArrayList<Double> scores) {
		super();
		this.scores = scores;
	}
	public Grade() {
		super();
		scores = new ArrayList<Double>();
	}
	
	@Override
	public String toString() {
		return "Grade [scores=" + scores + "]";
	}
	
}
