package cu.edu.cujae.structbd.dto;

import java.util.LinkedList;
import java.util.List;

public class UserDTO implements DTO{
    private int id;
    private String username;
    private String password;
    private String name;
    private String description;

    public UserDTO(int id, String username, String password, String name, String description) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.name = name;
        this.description = description;
    }

    public UserDTO(List<String> columnNames, List<String> values) throws RuntimeException {
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
                case "id" -> result.add(String.valueOf(id));
                case "username" -> result.add(String.valueOf(username));
                case "password" -> result.add(String.valueOf(password));
                case "name" -> result.add(String.valueOf(name));
                case "description" -> result.add(String.valueOf(description));
                default -> throw new RuntimeException("Column " + column + " not found");
            }
        }
        return result;
    }

    @Override
    public void setData(String column, String payload) {
        switch (column) {
            case "id" -> id = Integer.parseInt((payload));
            case "username" -> username = (payload);
            case "password" -> password = (payload);
            case "name" -> name = (payload);
            case "description" -> description = payload;
            default -> throw new RuntimeException("Column " + column + " not found");
        }
    }

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
