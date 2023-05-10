package cu.edu.cujae.structbd.visual.inputs;
import cu.edu.cujae.structbd.services.ServicesLocator;
import cu.edu.cujae.structbd.visual.App;
import cu.edu.cujae.structbd.visual.components.InputText;
import cu.edu.cujae.structbd.visual.components.PButton;
import cu.edu.cujae.structbd.visual.views.Table;

import javax.swing.*;

public class CarInput extends JFrame {
    private Mode mode;
    private int number;
    private InputText coupleCode;
    private InputText plate;
    private InputText brandName;
    private PButton submitButton;


    public CarInput(int number, String plate, String couple, String brandName) {
        this.mode = Mode.Update;
        this.number = number;
        setTitle("Update car");
        setBounds(0, 0, 600, 200);
        getContentPane().setLayout(null);
        setResizable(false);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setLocationRelativeTo(getOwner());
        setVisible(true);

        JPanel panel = new JPanel();
        panel.setLayout(null);
        setContentPane(panel);
        panel.add(getBrandName(brandName));
        panel.add(getCouple(couple));
        panel.add(getPlate(plate));
        panel.add(getSubmitButton());
    }
    public CarInput() {
        this.mode = Mode.Insert;
        setTitle("Insert car");
        setBounds(0, 0, 600, 200);
        getContentPane().setLayout(null);
        setResizable(false);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setLocationRelativeTo(getOwner());
        setVisible(true);

        JPanel panel = new JPanel();
        panel.setLayout(null);
        setContentPane(panel);
        panel.add(getBrandName(""));
        panel.add(getCouple(""));
        panel.add(getPlate(""));
        panel.add(getSubmitButton());
    }

    public InputText getBrandName(String text) {
        if (brandName == null) {
            brandName = new InputText(20, 20, "Brand name:");
            brandName.getTextField().setText(text);
        }
        return brandName;
    }
    public InputText getCouple(String text) {
        if (coupleCode == null) {
            coupleCode = new InputText(220, 20, "Couple code:");
            coupleCode.getTextField().setText(text);
        }
        return coupleCode;
    }
    public InputText getPlate(String text) {
        if (plate == null) {
            plate = new InputText(220, 70, "Plate:");
            plate.getTextField().setText(text);
        }
        return plate;
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
                    int couple = Integer.parseInt(getCouple("").getTextField().getText());
                    String plate = getPlate("").getTextField().getText();
                    if (mode == Mode.Insert) {
                        ServicesLocator.getCarServices().insert(plate, couple, brandName);
                    } else {
                        ServicesLocator.getCarServices().update(number, plate, couple, brandName);
                    }
                    App.getInstance().getTablesPanel().refresh(Table.Cars);
                } catch (Exception ex) {
                    App.getInstance().handleError(ex);
                }
            });
        }
        return submitButton;
    }
}
