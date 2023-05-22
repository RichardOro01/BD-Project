package cu.edu.cujae.structbd.visual.components.input;

import cu.edu.cujae.structbd.utils.Numbers;

import javax.swing.*;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import javax.swing.text.BadLocationException;
import javax.swing.text.MaskFormatter;
import java.awt.*;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.text.DecimalFormat;
import java.text.ParseException;
public class InputNumber extends InputText{

    public InputNumber(int x, int y, String label) {
        super(x, y, label);
        getTextField().getDocument().addDocumentListener(new DocumentListener() {
            @Override
            public void insertUpdate(DocumentEvent e) {
                String insertedText = null;
                try {
                    insertedText = e.getDocument().getText(e.getOffset(), e.getLength());
                    if (!Numbers.isNumber(insertedText)) {
                        SwingUtilities.invokeLater(() -> {
                            try {
                                e.getDocument().remove(e.getOffset(), e.getLength());
                            } catch (BadLocationException ex) {
                                ex.printStackTrace();
                            }
                        });
                    }
                    getForm().update();
                } catch (BadLocationException ex) {
                    ex.printStackTrace();
                }
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
        getTextField().addKeyListener(new KeyAdapter() {
            @Override
            public void keyTyped(KeyEvent e) {
                if (!Numbers.isNumber(String.valueOf(e.getKeyChar()))){
                    e.consume();
                }
            }
        });
    }

    public InputNumber(String label) {
        this(0,0,label);
    }


}
