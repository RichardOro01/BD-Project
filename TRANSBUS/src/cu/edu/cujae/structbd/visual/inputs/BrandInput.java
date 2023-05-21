package cu.edu.cujae.structbd.visual.inputs;
import cu.edu.cujae.structbd.dto.BrandDTO;
import cu.edu.cujae.structbd.services.ServicesLocator;
import cu.edu.cujae.structbd.visual.App;
import cu.edu.cujae.structbd.visual.components.InputText;
import cu.edu.cujae.structbd.visual.components.PButton;
import cu.edu.cujae.structbd.visual.views.Table;

import javax.swing.*;

public class BrandInput extends JFrame {
    private Mode mode;
    private BrandDTO brandDTO;
    private InputText brandName;
    private InputText amoSeats;
    private InputText fuelType;
    private InputText spending;
    private PButton submitButton;


    public BrandInput(BrandDTO brandDTO) {
        this.mode = Mode.Update;
        this.brandDTO = brandDTO;
        setTitle("Update brand");
        setBounds(0, 0, 600, 200);
        getContentPane().setLayout(null);
        setResizable(false);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setLocationRelativeTo(getOwner());
        setVisible(true);

        JPanel panel = new JPanel();
        panel.setLayout(null);
        setContentPane(panel);
        panel.add(getBrandName(brandDTO.getBrandName()));
        panel.add(getAmoSeats(String.valueOf(brandDTO.getAmoSeats())));
        panel.add(getSpending(String.valueOf(brandDTO.getSpending())));
        panel.add(getFuelType(String.valueOf(brandDTO.getFuelCode())));
        panel.add(getSubmitButton());
    }
    public BrandInput() {
        this.mode = Mode.Insert;
        setTitle("Insert brand");
        setBounds(0, 0, 600, 200);
        getContentPane().setLayout(null);
        setResizable(false);
        setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        setLocationRelativeTo(App.getInstance());
        setVisible(true);

        JPanel panel = new JPanel();
        panel.setLayout(null);
        setContentPane(panel);
        panel.add(getBrandName(""));
        panel.add(getAmoSeats(""));
        panel.add(getSpending(""));
        panel.add(getFuelType(""));
        panel.add(getSubmitButton());
    }

    public InputText getBrandName(String text) {
        if (brandName == null) {
            brandName = new InputText(20, 20, "Brand name:");
            brandName.getTextField().setText(text);
        }
        return brandName;
    }
    public InputText getAmoSeats(String text) {
        if (amoSeats == null) {
            amoSeats = new InputText(220, 20, "Seats amount:");
            amoSeats.getTextField().setText(text);
        }
        return amoSeats;
    }
    public InputText getFuelType(String text) {
        if (fuelType == null) {
            fuelType = new InputText(20, 70, "Fuel type:");
            fuelType.getTextField().setText(text);
        }
        return fuelType;
    }
    public InputText getSpending(String text) {
        if (spending == null) {
            spending = new InputText(220, 70, "Spending:");
            spending.getTextField().setText(text);
        }
        return spending;
    }

    public PButton getSubmitButton() throws RuntimeException{
        if (submitButton == null) {
            submitButton = new PButton("Insert");
            submitButton.setBounds(getWidth()-100, 120, 60, 30);
            if (mode == Mode.Update) {
                submitButton.setText("Update");
            }
            submitButton.addActionListener(e -> {
                try {
                    String brandName = getBrandName("").getTextField().getText();
                    int amoSeats = Integer.parseInt(getAmoSeats("").getTextField().getText());
                    int fuelType = Integer.parseInt(getFuelType("").getTextField().getText());
                    double spending = Double.parseDouble(getSpending("").getTextField().getText());
                    if (mode == Mode.Insert) {
                        ServicesLocator.getBrandServices().insert(brandName, amoSeats, fuelType, spending);
                    } else {
                        ServicesLocator.getBrandServices().update(brandDTO.getBrandCode(), brandName, amoSeats, fuelType, spending);
                    }
                    App.getInstance().getAssetsPanel().refresh(Table.Brands);
                } catch (Exception ex) {
                    App.getInstance().handleError(ex);
                }
            });
        }
        return submitButton;
    }
}
