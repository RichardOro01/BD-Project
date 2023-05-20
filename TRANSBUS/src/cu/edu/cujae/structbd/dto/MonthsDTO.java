package cu.edu.cujae.structbd.dto;

public class MonthsDTO {
    private int ResportCode;
    private String monthCode;

    public MonthsDTO(int resportCode, String monthCode) {
        ResportCode = resportCode;
        this.monthCode = monthCode;
    }

    public int getResportCode() {
        return ResportCode;
    }

    public String getMonthCode() {
        return monthCode;
    }
}
