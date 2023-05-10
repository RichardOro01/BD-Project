package cu.edu.cujae.structbd.visual.views;
import cu.edu.cujae.structbd.services.ServicesLocator;
import cu.edu.cujae.structbd.visual.Definitions;
import cu.edu.cujae.structbd.visual.components.PButton;
import cu.edu.cujae.structbd.visual.components.TableScroll;
import cu.edu.cujae.structbd.visual.inputs.ManagerInput;
import cu.edu.cujae.structbd.visual.inputs.Mode;

import javax.swing.*;
import java.util.List;

public class TablesPanel extends JPanel {
    private JTabbedPane tabbedPane;
    private TableScroll tableBrands;
    private TableScroll tableCars;
    private TableScroll tableContracts;
    private TableScroll tableCouples;
    private TableScroll tableDiscrepancies;
    private TableScroll tableDistricts;
    private TableScroll tableDrivers;
    private TableScroll tableFreeCovers;
    private TableScroll tableReports;
    private TableScroll tableRoadmaps;
    private TableScroll tableServices;
    private PButton insertButton;
    private PButton deleteButton;
    private PButton updateButton;

    public TablesPanel(){
        add(getTabbedPane());
        add(getInsertButton());
        add(getDeleteButton());
        add(getUpdateButton());
    }

    private JTabbedPane getTabbedPane() {
        if (tabbedPane == null) {
            tabbedPane = new JTabbedPane(JTabbedPane.TOP);
            System.out.println(Definitions.APP_WIDTH-Definitions.SIDE_BAR_WIDTH-Definitions.MARGING-20);
            int y = 60;
            tabbedPane.setBounds(20, y, Definitions.APP_WIDTH-Definitions.SIDE_BAR_WIDTH-Definitions.MARGING-60, Definitions.APP_HEIGHT-y-150);
            tabbedPane.addTab("Brands", null, getTableBrands(), null);
            tabbedPane.addTab("Cars", null, getTableCars(), null);
            tabbedPane.addTab("Drivers", null, getTableDrivers(), null);
            tabbedPane.addTab("Contracts", null, getTableContracts(), null);
            tabbedPane.addTab("Free Covers", null, getTableFreeCovers(), null);
            tabbedPane.addTab("Services", null, getTableServices(), null);
            tabbedPane.addTab("Couples", null, getTableCouples(), null);
            tabbedPane.addTab("Discrepancies", null, getTableDiscrepancies(), null);
            tabbedPane.addTab("Reports", null, getTableReports(), null);
            tabbedPane.addTab("Roadmaps", null, getTableRoadmaps(), null);
            tabbedPane.addTab("District", null, getTableDistricts(), null);
        }
        return tabbedPane;
    }

    public PButton getInsertButton() {
        if (insertButton == null) {
            insertButton = new PButton("Insert");
            insertButton.setBounds(getTabbedPane().getX(), getTabbedPane().getY() + getTabbedPane().getHeight() + 20, 60, 30);
            insertButton.addActionListener(e -> {
                switch (getTabbedPane().getTitleAt(getTabbedPane().getSelectedIndex())){
                    case "Brands":
                        ManagerInput.showBrandInput(Mode.Insert);
                        break;
                }
            });
        }
        return insertButton;
    }

    public PButton getDeleteButton() {
        if (deleteButton == null) {
            deleteButton = new PButton("Delete");
            deleteButton.setBounds(getInsertButton().getX()+getInsertButton().getWidth()+20, getTabbedPane().getY() + getTabbedPane().getHeight() + 20, 60, 30);
            insertButton.addActionListener(e -> {

            });
        }
        return deleteButton;
    }

    public PButton getUpdateButton() {
        if (updateButton == null) {
            updateButton = new PButton("Update");
            updateButton.setBounds(getDeleteButton().getX()+getDeleteButton().getWidth()+20, getTabbedPane().getY() + getTabbedPane().getHeight() + 20, 60, 30);
            insertButton.addActionListener(e -> {

            });
        }
        return updateButton;
    }

    public TableScroll getTableBrands() {
        if (tableBrands == null) {
            String[] columns = new String[]{"Name", "Seats", "Fuel Type", "Spending"};
            tableBrands = new TableScroll(columns);
            List<List<String>> data = ServicesLocator.getBrandServices().getBrands();
            tableBrands.setTableData(data);
        }
        return tableBrands;
    }

    public TableScroll getTableCars() {
        if (tableCars == null) {
            String[] columns = new String[]{"Name", "Seats", "Fuel Type", "Spending"};
            tableCars = new TableScroll(columns);
            List<List<String>> data = ServicesLocator.getBrandServices().getBrands();
            tableCars.setTableData(data);
        }
        return tableCars;
    }

    public TableScroll getTableContracts() {
        if (tableContracts == null) {
            String[] columns = new String[]{"Name", "Seats", "Fuel Type", "Spending"};
            tableContracts = new TableScroll(columns);
            List<List<String>> data = ServicesLocator.getBrandServices().getBrands();
            tableContracts.setTableData(data);
        }
        return tableContracts;
    }

    public TableScroll getTableCouples() {
        if (tableCouples == null) {
            String[] columns = new String[]{"Name", "Seats", "Fuel Type", "Spending"};
            tableCouples = new TableScroll(columns);
            List<List<String>> data = ServicesLocator.getBrandServices().getBrands();
            tableCouples.setTableData(data);
        }
        return tableCouples;
    }

    public TableScroll getTableDiscrepancies() {
        if (tableDiscrepancies == null) {
            String[] columns = new String[]{"Name", "Seats", "Fuel Type", "Spending"};
            tableDiscrepancies = new TableScroll(columns);
            List<List<String>> data = ServicesLocator.getBrandServices().getBrands();
            tableDiscrepancies.setTableData(data);
        }
        return tableDiscrepancies;
    }

    public TableScroll getTableDistricts() {
        if (tableDistricts == null) {
            String[] columns = new String[]{"Name", "Seats", "Fuel Type", "Spending"};
            tableDistricts = new TableScroll(columns);
            List<List<String>> data = ServicesLocator.getBrandServices().getBrands();
            tableDistricts.setTableData(data);
        }
        return tableDistricts;
    }

    public TableScroll getTableDrivers() {
        if (tableDrivers == null) {
            String[] columns = new String[]{"Name", "Seats", "Fuel Type", "Spending"};
            tableDrivers = new TableScroll(columns);
            List<List<String>> data = ServicesLocator.getBrandServices().getBrands();
            tableDrivers.setTableData(data);
        }
        return tableDrivers;
    }

    public TableScroll getTableReports() {
        if (tableReports == null) {
            String[] columns = new String[]{"Name", "Seats", "Fuel Type", "Spending"};
            tableReports = new TableScroll(columns);
            List<List<String>> data = ServicesLocator.getBrandServices().getBrands();
            tableReports.setTableData(data);
        }
        return tableReports;
    }

    public TableScroll getTableRoadmaps() {
        if (tableRoadmaps == null) {
            String[] columns = new String[]{"Name", "Seats", "Fuel Type", "Spending"};
            tableRoadmaps = new TableScroll(columns);
            List<List<String>> data = ServicesLocator.getBrandServices().getBrands();
            tableRoadmaps.setTableData(data);
        }
        return tableRoadmaps;
    }

    public TableScroll getTableServices() {
        if (tableServices == null) {
            String[] columns = new String[]{"Name", "Seats", "Fuel Type", "Spending"};
            tableServices = new TableScroll(columns);
            List<List<String>> data = ServicesLocator.getBrandServices().getBrands();
            tableServices.setTableData(data);
        }
        return tableServices;
    }

    public TableScroll getTableFreeCovers() {
        if (tableFreeCovers == null) {
            String[] columns = new String[]{"Name", "Seats", "Fuel Type", "Spending"};
            tableFreeCovers = new TableScroll(columns);
            List<List<String>> data = ServicesLocator.getBrandServices().getBrands();
            tableFreeCovers.setTableData(data);
        }
        return tableFreeCovers;
    }
}
