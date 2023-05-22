package cu.edu.cujae.structbd.visual.components.input;

import javax.swing.*;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import javax.swing.text.MaskFormatter;
import java.awt.*;
import java.text.ParseException;
import java.util.Objects;

public class InputFormattedText extends JPanel implements FormItem{
    private Form form;
    private MaskFormatter maskFormatter;
    private JFormattedTextField textField;
    private Label label;

    public InputFormattedText(int x, int y, String label, String mask) {
        try {
            maskFormatter = new MaskFormatter(mask);
            setBounds(x, y, 200, 48);
            setLayout(new GridLayout(2,1));
            add(getLabel(label));
            add(getTextField());
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    public InputFormattedText(String label, String mask) {
        this(0, 0, label, mask);
    }

    public JFormattedTextField getTextField() {
        if (textField == null) {
            textField = new JFormattedTextField();
            maskFormatter.install(textField);
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
        if (getTextField().getText().contains(" "))
            return "";
        return getTextField().getText();
    }

    @Override
    public void setValue(String value) {
        getTextField().setText(value);
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
