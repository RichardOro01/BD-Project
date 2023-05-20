package cu.edu.cujae.structbd.dto;

public class UserDTO {
    private int id;
    private String username;
    private String password;
    private String name;
    private int roleCode;

    public UserDTO(int id, String username, String password, String name, int roleCode) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.name = name;
        this.roleCode = roleCode;
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

    public int getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(int roleCode) {
        this.roleCode = roleCode;
    }
}
