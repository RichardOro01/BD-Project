package cu.edu.cujae.structbd.visual.components;

import javax.swing.*;
import java.awt.*;

public class InputText extends JPanel {
    private TextField textField;
    private Label label;

    public InputText(int x, int y, String label) {
        setBounds(x, y, 200, 48);
        setLayout(new GridLayout(2,1));
        add(getLabel(label));
        add(getTextField());
    }

    public TextField getTextField() {
        if (textField == null) {
            textField = new TextField();
        }
        return textField;
    }

    public Label getLabel(String labelText) {
        if (label == null) {
            label = new Label(labelText);
            label.setAlignment(Label.LEFT);
        }
        return label;
    }

}
