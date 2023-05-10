package cu.edu.cujae.structbd.visual.views;

import cu.edu.cujae.structbd.services.ServicesLocator;
import cu.edu.cujae.structbd.visual.components.PButton;
import cu.edu.cujae.structbd.visual.components.TextAreaScroll;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.SQLException;

public class HomePanel extends JPanel {
    private PButton insertButton;
    private JTextField brandNameTextField;

    public HomePanel(){
        add(getInsertButton());
        add(getBrandNameTextField());
    }

    public JTextField getBrandNameTextField(){
        if (brandNameTextField==null){
            brandNameTextField = new JTextField();
            brandNameTextField.setBounds(100, 40, 70, 30);
        }
        return brandNameTextField;
    }
    public PButton getInsertButton(){
        if (insertButton==null){
            insertButton = new PButton("Insert");
            insertButton.setBounds(20, 40, 70, 30);
            insertButton.addActionListener(e -> {
                //call huffman
                String brand=getBrandNameTextField().getText();
                try {
                    ServicesLocator.getBrandServices().insertBrand(brand);
                } catch (SQLException ex) {
                    throw new RuntimeException(ex);
                }
            });
        }
        return insertButton;
    }
}
