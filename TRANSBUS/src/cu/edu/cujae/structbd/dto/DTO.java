package cu.edu.cujae.structbd.dto;

import java.util.List;

public interface DTO {
    public boolean setData(String column, String payload);
    public List<String> getData(List<String> columns);
}
