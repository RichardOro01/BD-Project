package cu.edu.cujae.structbd.services;

import cu.edu.cujae.structbd.dto.CarDTO;
import cu.edu.cujae.structbd.dto.DTOLocator;
import cu.edu.cujae.structbd.utils.Conection;

import java.sql.*;
import java.util.List;

public class CarServices implements Service {
    @Override
    public void insert(Object... args) throws SQLException {
        java.sql.Connection connection = ServicesLocator.getConnection();
        CallableStatement call = null;
        try {
            call = connection.prepareCall("{ call insert_car(?, ?, ?, ?) }");
            call.setInt(1, (int) args[0]);
            call.setString(2, (String) args[1]);
            call.setInt(3, (int) args[2]);
            call.setInt(4,(int) args[3]);
            call.execute();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            if (call != null)
                call.close();
            connection.close();
        }
    }
    @Override
    public void update(Object... args) throws SQLException {
        java.sql.Connection connection = ServicesLocator.getConnection();
        CallableStatement call = null;
        try {
            call = connection.prepareCall("{ call update_car(?, ?, ?, ?, ?) }");
            call.setInt(1, (int) args[0]);
            call.setInt(2, (int) args[1]);
            call.setString(3, (String) args[2]);
            call.setInt(4, (int) args[3]);
            call.setInt(5, (int) args[4]);
            System.out.println(call);
            call.execute();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            if (call != null)
                call.close();
            connection.close();
        }
    }
    @Override
    public void delete(Object... args) throws SQLException {
        java.sql.Connection connection = ServicesLocator.getConnection();
        CallableStatement call = null;
        try {
            call = connection.prepareCall("{ call delete_car(?) }");
            call.setInt(1, (int) args[0]);
            call.execute();
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            if (call != null)
                call.close();
            connection.close();
        }
    }

    @Override
    public void refresh() {
        String queryToExecute = """
            SELECT car_code, fleet_number, plate, brand_name, driver.driver_name as driver1, driver2.driver_name as driver2
            FROM car
            JOIN brand
                ON brand.brand_code = car.brand_code
            JOIN couple
                ON couple.couple_code = car.couple_code
            JOIN driver
                ON driver.driver_code = couple.driver_1
            JOIN driver AS driver2 ON couple.driver_2 = driver2.driver_code
            ORDER BY fleet_number;
        """;
        List<List<String>> result = Conection.executeQuery(queryToExecute);
        List<CarDTO> cars = DTOLocator.getCarDTOList();
        cars.clear();
        List<String> columnNames = result.remove(0);
        for (List<String> list: result) {
            CarDTO car = new CarDTO(columnNames, list);
            cars.add(car);
        }
    }
}


