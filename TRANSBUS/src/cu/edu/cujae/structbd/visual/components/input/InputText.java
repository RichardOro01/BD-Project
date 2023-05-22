package cu.edu.cujae.structbd.visual.components.input;

import javax.swing.*;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import java.awt.*;

public class InputText extends JPanel implements FormItem {
    private Form form;
    private JTextField textField;
    private Label label;

    public InputText(int x, int y, String label) {
        setBounds(x, y, 200, 48);
        setLayout(new GridLayout(2,1));
        add(getLabel(label));
        add(getTextField());
    }

    public InputText(String label) {
        this(0, 0, label);
    }

    public JTextField getTextField() {
        if (textField == null) {
            textField = new JTextField();
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

    @Override
    public String getValue() {
        return getTextField().getText();
    }

    @Override
    public Form getForm() {
        return form;
    }

    public void setForm(Form form) {
        this.form = form;
        textField.getDocument().addDocumentListener(new DocumentListener() {
            @Override
            public void insertUpdate(DocumentEvent e) {
                getForm().update();
            }

            @Override
            public void removeUpdate(DocumentEvent e) {
                getForm().update();
            }

            @Override
            public void changedUpdate(DocumentEvent e) {
                getForm().update();
            }
        });
    }
}
