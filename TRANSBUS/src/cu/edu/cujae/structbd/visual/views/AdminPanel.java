package cu.edu.cujae.structbd.visual.views;

import cu.edu.cujae.structbd.dto.BrandDTO;
import cu.edu.cujae.structbd.dto.DTOLocator;
import cu.edu.cujae.structbd.dto.UserDTO;
import cu.edu.cujae.structbd.services.ServicesLocator;
import cu.edu.cujae.structbd.visual.App;
import cu.edu.cujae.structbd.visual.Definitions;
import cu.edu.cujae.structbd.visual.components.PButton;
import cu.edu.cujae.structbd.visual.components.TableScroll;
import cu.edu.cujae.structbd.visual.inputs.BrandInput;
import cu.edu.cujae.structbd.visual.inputs.UserInput;

import javax.swing.*;
import java.sql.SQLException;

public class AdminPanel extends JPanel {
    private JTabbedPane tabbedPane;
    private TableScroll tableUsers;
    private PButton insertButton;
    private PButton deleteButton;
    private PButton updateButton;

    public AdminPanel(){
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
            tabbedPane.addTab("Users", null, getTableUsers(), null);
        }
        return tabbedPane;
    }

    public void refresh(Table table){
        try {
            switch (table){
                case Users -> {}
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
                    case "Users":
                        new UserInput();
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
            deleteButton.addActionListener(e -> {
                try {
                    int index;
                switch (getTabbedPane().getTitleAt(getTabbedPane().getSelectedIndex())) {
                    case "Users":
                        index = getTableUsers().getTable().getSelectedRow();
                        if (index >= 0) {
                            int userCode = DTOLocator.getUserDTOList().get(index).getId();
                            ServicesLocator.getUserServices().delete(userCode);
                            refresh(Table.Users);
                        }
                        break;
                }
                } catch (SQLException ex) {
                    App.getInstance().handleError(ex);
                }
            });
        }
        return deleteButton;
    }

    public PButton getUpdateButton() {
        if (updateButton == null) {
            updateButton = new PButton("Update");
            updateButton.setBounds(getDeleteButton().getX()+getDeleteButton().getWidth()+20, getTabbedPane().getY() + getTabbedPane().getHeight() + 20, 60, 30);
            updateButton.addActionListener(e -> {
                int index;
                switch (getTabbedPane().getTitleAt(getTabbedPane().getSelectedIndex())){
                    case "Users":
                        index = getTableUsers().getTable().getSelectedRow();
                        if (index >= 0) {
                            UserDTO userDTO = DTOLocator.getUserDTOList().get(index);
                            new UserInput(userDTO);
                        }
                        break;
                }
            });
        }
        return updateButton;
    }


    public TableScroll getTableUsers() {
        if (tableUsers == null) {
            String[] columns = new String[]{"Username", "Password", "Name", "Role"};
            tableUsers = new TableScroll(columns);
            refresh(Table.Users);
        }
        return tableUsers;
    }
}
