package cu.edu.cujae.structbd.services;

import java.sql.SQLException;
import java.util.List;

public interface Service {
    public void insert(Object ...args) throws SQLException;
    public void update(Object ...args) throws SQLException;
    public void delete(Object ...args) throws SQLException;

    public List<List<String>> getAll() throws SQLException;
}
