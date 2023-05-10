package cu.edu.cujae.structbd.visual.inputs;
import cu.edu.cujae.structbd.services.ServicesLocator;
import cu.edu.cujae.structbd.visual.components.InputText;
import cu.edu.cujae.structbd.visual.components.PButton;

import javax.swing.*;
import java.sql.SQLException;

public class BrandInput extends JFrame {
    private Mode mode;
    private InputText brandName;
    private InputText amoSeats;
    private InputText fuelType;
    private InputText spending;
    private PButton submitButton;


    public BrandInput(Mode mode) {
        this.mode = mode;
        if (mode == Mode.Insert) {
            setTitle("Insert brand");
        } else {
            setTitle("Update brand");
        }
        setBounds(0, 0, 600, 500);
        getContentPane().setLayout(null);
        setResizable(false);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setLocationRelativeTo(getOwner());
        setVisible(true);

        JPanel panel = new JPanel();
        panel.setLayout(null);
        setContentPane(panel);
        panel.add(getBrandName());
        panel.add(getAmoSeats());
        panel.add(getSpending());
        panel.add(getFuelType());
        panel.add(getSubmitButton());
    }

    public InputText getBrandName() {
        if (brandName == null) {
            brandName = new InputText(20, 20, "Brand name:");
        }
        return brandName;
    }
    public InputText getAmoSeats() {
        if (amoSeats == null) {
            amoSeats = new InputText(220, 20, "Seats amount:");
        }
        return amoSeats;
    }
    public InputText getFuelType() {
        if (fuelType == null) {
            fuelType = new InputText(20, 70, "Fuel type:");
        }
        return fuelType;
    }
    public InputText getSpending() {
        if (spending == null) {
            spending = new InputText(220, 70, "Spending:");
        }
        return spending;
    }

    public PButton getSubmitButton() {
        if (submitButton == null) {
            submitButton = new PButton("Insert");
            submitButton.setBounds(20, 100, 60, 30);
            if (mode == Mode.Update) {
                submitButton.setText("Update");
            }
            submitButton.addActionListener(e -> {
                String brandName = getBrandName().getTextField().getText();
                int amoSeats = Integer.parseInt(getAmoSeats().getTextField().getText());
                String fuelType = getFuelType().getTextField().getText();
                double spending = Double.parseDouble(getSpending().getTextField().getText());
                try {
                    if (mode == Mode.Insert) {
                        ServicesLocator.getBrandServices().insertBrand(brandName, amoSeats, fuelType, spending);
                    } else {
                        ServicesLocator.getBrandServices().updateBrand(brandName, amoSeats, fuelType, spending);
                    }
                } catch (SQLException ex) {
                    throw new RuntimeException(ex);
                }

            });
        }
        return submitButton;
    }
}
