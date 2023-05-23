package cu.edu.cujae.structbd.dto;

import java.util.LinkedList;
import java.util.List;

public class DistrictDTO implements DTO{
    private int districtCode;
    private String districtName;

    public DistrictDTO(int districtCode, String districtName) {
        this.districtCode = districtCode;
        this.districtName = districtName;
    }

    public DistrictDTO(List<String> columnNames, List<String> values) throws RuntimeException {
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
            case "district_code" -> {
                districtCode = Integer.parseInt((payload));
                System.out.println(districtCode);
            }
            case "district_name" -> districtName = (payload);
            default -> throw new RuntimeException("Column " + column + " not found");
        }
    }

    @Override
    public List<String> getData(List<String> columns) {

        List<String> result = new LinkedList<>();
        for (String column : columns) {
            switch (column) {
                case "district_code" -> result.add(String.valueOf(districtCode));
                case "district_name" -> result.add(String.valueOf(districtName));
                default -> throw new RuntimeException("Column " + column + " not found");
            }
        }
        return result;
    }

    public int getDistrictCode() {
        return districtCode;
    }

    public String getDistrictName() {
        return districtName;
    }

    public void setDistrictName(String districtName) {
        this.districtName = districtName;
    }
}
