package cu.edu.cujae.structbd.visual.components;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.io.Serial;
import java.util.Arrays;
import java.util.List;

public class TableScroll extends JScrollPane {
    private JTable table;
    private String[] columns;
    private Object[][] data;
    public TableScroll(){
        this.setViewportView(getTable());
    }


    public TableScroll(String[] columns){
        this.setViewportView(getTable());
        this.columns = columns;
        setTableModel();
    }

    public void setTableData(Object[][] data) {
        this.data = data;
        setTableModel();
    }

    public void setColumns(String[] columns){
        this.columns = columns;
        setTableModel();
    }

    public void setTableData(List<List<String>> list) {
        Object obj[][]=new Object[list.size()][4];
        for (int i=0; i<list.size(); i++) {
            list.get(i).toArray(obj[i]);
        }
        setTableData(obj);
    }

    private void setTableModel() {
        boolean[] editables = new boolean[columns.length];
        Arrays.fill(editables, false);
        this.getTable().setModel(new DefaultTableModel(
                data,
                columns
        ) {
            @Serial
            private static final long serialVersionUID = -7368912137855283709L;
            final boolean[] columnEditables = editables;

            @Override
            public boolean isCellEditable(int row, int column) {
                return columnEditables[column];
            }
        });
    }

    public JTable getTable() {
        if (table==null) {
            table = new JTable();
        }
        return table;
    }
}
