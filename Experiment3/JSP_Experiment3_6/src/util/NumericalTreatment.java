package util;

public class NumericalTreatment {
	public static double retainedDecimal(double number){
		return (double)Math.round(number*100)/100;
	}
}
