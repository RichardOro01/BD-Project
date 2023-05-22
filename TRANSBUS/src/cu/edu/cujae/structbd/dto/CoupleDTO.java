package cu.edu.cujae.structbd.dto;

import java.util.LinkedList;
import java.util.List;

public class CoupleDTO implements DTO{
    private int coupleCode;
    private int driver1;
    private int driver2;

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
            case "driver1" -> driver1 = Integer.parseInt((payload));
            case "driver2" -> driver2 = Integer.parseInt((payload));
            default -> throw new RuntimeException("Column " + column + " not found");
        }
    }

    @Override
    public List<String> getData(List<String> columns) {

        List<String> result = new LinkedList<>();
        for (String column : columns) {
            switch (column) {
                case "couple_code" -> result.add(String.valueOf(coupleCode));
                case "driver1" -> result.add(String.valueOf(driver1));
                case "driver2" -> result.add(String.valueOf(driver2));
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
}
