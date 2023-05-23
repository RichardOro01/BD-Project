package cu.edu.cujae.structbd.visual.views;

import cu.edu.cujae.structbd.dto.BrandDTO;
import cu.edu.cujae.structbd.dto.DTO;
import cu.edu.cujae.structbd.dto.DTOLocator;
import cu.edu.cujae.structbd.services.ServicesLocator;
import cu.edu.cujae.structbd.utils.DTOUtils;
import cu.edu.cujae.structbd.visual.App;
import cu.edu.cujae.structbd.visual.Definitions;
import cu.edu.cujae.structbd.visual.components.PButton;
import cu.edu.cujae.structbd.visual.components.TableScroll;
import cu.edu.cujae.structbd.visual.inputs.BrandInput;

import javax.swing.*;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class ReportsPanel extends JPanel {
    private JTabbedPane tabbedPane;
    private TableScroll tableBrands;
    private TableScroll tableCars;
    private TableScroll tableDrivers;
    private TableScroll tableReports;
    private PButton insertButton;
    private PButton deleteButton;
    private PButton updateButton;

    public ReportsPanel(){
        add(getTabbedPane());
        add(getInsertButton());
        add(getDeleteButton());
        add(getUpdateButton());
    }

    private JTabbedPane getTabbedPane() {
        if (tabbedPane == null) {
            tabbedPane = new JTabbedPane(JTabbedPane.TOP);
            int y = 60;
            tabbedPane.setBounds(20, y, Definitions.APP_WIDTH-Definitions.SIDE_BAR_WIDTH-Definitions.MARGING-60, Definitions.APP_HEIGHT-y-150);
            tabbedPane.addTab("Reports", null, getTableReports(), null);
        }
        return tabbedPane;
    }

    public void refresh(Table table){
        try {
            switch (table){
                case Reports -> {}
            }
        } catch (Exception e) {
            App.getInstance().handleError(e);
        }

    }
    public PButton getInsertButton() {
        if (insertButton == null) {
            insertButton = new PButton("Insert");
            insertButton.setBounds(getTabbedPane().getX(), getTabbedPane().getY() + getTabbedPane().getHeight() + 20, 60, 30);
            insertButton.addActionListener(e -> {
                switch (getTabbedPane().getTitleAt(getTabbedPane().getSelectedIndex())){

                }
            });
        }
        return insertButton;
    }

    public PButton getDeleteButton() {
        if (deleteButton == null) {
            deleteButton = new PButton("Delete");
            deleteButton.setBounds(getInsertButton().getX()+getInsertButton().getWidth()+20, getTabbedPane().getY() + getTabbedPane().getHeight() + 20, 60, 30);
            deleteButton.addActionListener(e -> {
//                try {
//                    int index;
//                    switch (getTabbedPane().getTitleAt(getTabbedPane().getSelectedIndex())) {
//
//                    }
//                } catch (SQLException ex) {
//                    App.getInstance().handleError(ex);
//                }
            });
        }
        return deleteButton;
    }

    public PButton getUpdateButton() {
        if (updateButton == null) {
            updateButton = new PButton("Update");
            updateButton.setBounds(getDeleteButton().getX()+getDeleteButton().getWidth()+20, getTabbedPane().getY() + getTabbedPane().getHeight() + 20, 60, 30);
            updateButton.addActionListener(e -> {
                switch (getTabbedPane().getTitleAt(getTabbedPane().getSelectedIndex())){

                }
            });
        }
        return updateButton;
    }



    public TableScroll getTableReports() {
        if (tableReports == null) {
            String[] columns = new String[]{"Name", "Seats", "Fuel Type", "Spending"};
            tableReports = new TableScroll(columns);
            refresh(Table.Reports);
        }
        return tableReports;
    }
}
