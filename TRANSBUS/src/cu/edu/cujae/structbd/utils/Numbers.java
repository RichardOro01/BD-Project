package cu.edu.cujae.structbd.utils;

public class Numbers {
    public static  boolean isNumber(String number){
        try {
            Double.parseDouble(number);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
