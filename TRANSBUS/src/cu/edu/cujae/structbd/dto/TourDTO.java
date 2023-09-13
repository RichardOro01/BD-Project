package cu.edu.cujae.structbd.dto;

import java.util.LinkedList;
import java.util.List;

public class TourDTO implements DTO{
    private String groupCode;
    private String groupName;

    public TourDTO(String groupCode, String groupName) {
        this.groupCode = groupCode;
        this.groupName = groupName;
    }

    public TourDTO(List<String> columnNames, List<String> values) throws RuntimeException {
        if (columnNames != null && values != null && columnNames.size() == values.size()) {
            for (int i = 0; i < columnNames.size(); i++) {
                setData(columnNames.get(i), values.get(i));
            }
        } else {
            throw new RuntimeException("Data error");
        }
    }

    @Override
    public List<String> getData(List<String> columns) {

        List<String> result = new LinkedList<>();
        for (String column : columns) {
            switch (column) {
                case "group_code" -> result.add(String.valueOf(groupCode));
                case "group_name" -> result.add(String.valueOf(groupName));
                default -> throw new RuntimeException("Column " + column + " not found");
            }
        }
        return result;
    }

    @Override
    public void setData(String column, String payload) {
        switch (column) {
            case "group_code" -> groupCode = (payload);
            case "group_name" -> groupName = (payload);
            default -> throw new RuntimeException("Column " + column + " not found");
        }
    }

    public String getGroupCode() {
        return groupCode;
    }

    public void setGroupCode(String groupCode) {
        this.groupCode = groupCode;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }
}
