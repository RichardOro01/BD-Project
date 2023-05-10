package cu.edu.cujae.structbd.visual.views;

import cu.edu.cujae.structbd.services.BrandServices;
import cu.edu.cujae.structbd.services.ServicesLocator;
import cu.edu.cujae.structbd.visual.components.TableScroll;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TablesPanel extends JPanel {
    private JTabbedPane tabbedPane;
    private TableScroll tableBrands;
    public TablesPanel(){
        add(getTabbedPane());
    }

    private JTabbedPane getTabbedPane() {
        if (tabbedPane == null) {
            tabbedPane = new JTabbedPane(JTabbedPane.TOP);
            tabbedPane.setBounds(73, 112, 538, 264);
            tabbedPane.addTab("Brands", null, getTableBrands(), null);
        }
        return tabbedPane;
    }



    public TableScroll getTableBrands() {
        if (tableBrands == null) {
            String[] columns = new String[]{"Visitante", "Local Visitado", "Fecha entrada", "Fecha salida"};
            tableBrands = new TableScroll(columns);

            try {
                List<List<String>> data = ServicesLocator.getBrandServices().getBrands();
                tableBrands.setTableData(data);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }


        }
        return tableBrands;
    }
}
