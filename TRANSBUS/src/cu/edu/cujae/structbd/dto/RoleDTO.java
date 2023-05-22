package cu.edu.cujae.structbd.dto;

import java.util.LinkedList;
import java.util.List;

public class RoleDTO implements DTO{
    private int roleCode;
    private String description;

    public RoleDTO(int roleCode, String description) {
        this.roleCode = roleCode;
        this.description = description;
    }

    public RoleDTO(List<String> columnNames, List<String> values) throws RuntimeException {
        if (columnNames != null && values != null && columnNames.size() == values.size()) {
            for (int i = 0; i < columnNames.size(); i++) {
                setData(columnNames.get(i), values.get(i));
            }
        } else {
            throw new RuntimeException("Data error");
        }
    }

    public int getRoleCode() {
        return roleCode;
    }

    public void setDescription(String brandName) {
        this.description = brandName;
    }

    public String getDescription() {
        return description;
    }

    public void setData(String column, String payload) {
        switch (column) {
            case "role_code" -> roleCode =Integer.parseInt(payload);
            case "description" -> description =payload;
            default -> throw new RuntimeException("Column " + column + " not found");
        }
    }

    public List<String> getData(List<String> columns) {
        List<String> result = new LinkedList<>();
        for (String column: columns) {
            switch (column) {
                case "role_code" -> result.add(String.valueOf(roleCode));
                case "description" -> result.add(String.valueOf(description));
                default -> throw new RuntimeException("Column " + column + " not found");
            }
        }
        return result;
    }
}