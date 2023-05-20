package cu.edu.cujae.structbd.services;

import cu.edu.cujae.structbd.dto.DTO;

import java.sql.SQLException;
import java.util.List;

public interface Service {
    public void insert(Object ...args) throws SQLException;
    public void update(Object ...args) throws SQLException;
    public void delete(Object ...args) throws SQLException;

    public List<DTO> getAll() throws SQLException;
}
