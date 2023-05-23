package cu.edu.cujae.structbd.dto;

import java.util.LinkedList;
import java.util.List;

public class CoupleDTO implements DTO{
    private int coupleCode;
    private int driver1;
    private int driver2;
    private String driver1Name;
    private String driver2Name;

    public CoupleDTO(int coupleCode, int driver1, int driver2) {
        this.coupleCode = coupleCode;
        this.driver1 = driver1;
        this.driver2 = driver2;
    }

    public CoupleDTO(List<String> columnNames, List<String> values) throws RuntimeException {
        if (columnNames != null && values != null && columnNames.size() == values.size()) {
            for (int i = 0; i < columnNames.size(); i++) {
                setData(columnNames.get(i), values.get(i));
            }
        } else {
            throw new RuntimeException("Data error");
        }
    }

    @Override
    public void setData(String column, String payload) {
        switch (column) {
            case "couple_code" -> coupleCode = Integer.parseInt((payload));
            case "driver_1" -> driver1 = Integer.parseInt((payload));
            case "driver_2" -> driver2 = Integer.parseInt((payload));
            case "driver1_name" -> driver1Name =(payload);
            case "driver2_name" -> driver2Name = (payload);
            default -> throw new RuntimeException("Column " + column + " not found");
        }
    }

    @Override
    public List<String> getData(List<String> columns) {

        List<String> result = new LinkedList<>();
        for (String column : columns) {
            switch (column) {
                case "couple_code" -> result.add(String.valueOf(coupleCode));
                case "driver_1" -> result.add(String.valueOf(driver1));
                case "driver_2" -> result.add(String.valueOf(driver2));
                case "driver1_name" -> result.add(String.valueOf(driver1Name));
                case "driver2_name" -> result.add(String.valueOf(driver2Name));
                default -> throw new RuntimeException("Column " + column + " not found");
            }
        }
        return result;
    }

    public int getDriver1() {
        return driver1;
    }

    public void setDriver1(int driver1) {
        this.driver1 = driver1;
    }

    public int getDriver2() {
        return driver2;
    }

    public void setDriver2(int driver2) {
        this.driver2 = driver2;
    }

    public int getCoupleCode() {
        return coupleCode;
    }

    public void setCoupleCode(int coupleCode) {
        this.coupleCode = coupleCode;
    }

    public String getDriver1Name() {
        return driver1Name;
    }

    public void setDriver1Name(String driver1Name) {
        this.driver1Name = driver1Name;
    }

    public String getDriver2Name() {
        return driver2Name;
    }

    public void setDriver2Name(String driver2Name) {
        this.driver2Name = driver2Name;
    }
}
