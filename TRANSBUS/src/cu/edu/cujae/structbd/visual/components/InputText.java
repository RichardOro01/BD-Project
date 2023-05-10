package cu.edu.cujae.structbd.visual.components;

import javax.swing.*;
import java.awt.*;

public class InputText extends JPanel {
    private TextField textField;
    private Label label;

    public InputText(int x, int y, String label) {
        setBounds(x, y, 200, 24);
        setLayout(null);
        add(getLabel(label));
        add(getTextField());
    }

    public TextField getTextField() {
        if (textField == null) {
            textField = new TextField();
            textField.setBounds(110, 0, 90, 24);
            textField.setColumns(10);
        }
        return textField;
    }

    public Label getLabel(String labelText) {
        if (label == null) {
            label = new Label(labelText);
            label.setBounds(0, 0, 100, 24);
            label.setAlignment(Label.RIGHT);
        }
        return label;
    }

}
