package cu.edu.cujae.structbd.visual.components.input;

import cu.edu.cujae.structbd.utils.Numbers;

import javax.swing.*;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import javax.swing.text.BadLocationException;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
public class InputNumber extends InputText{
    private boolean isDecimal;
    private int min;
    private int max;

    public InputNumber(int x, int y, String label) {
        super(x, y, label);
        getTextField().getDocument().addDocumentListener(new DocumentListener() {
            @Override
            public void insertUpdate(DocumentEvent e) {
                String insertedText = null;
                try {
                    insertedText = e.getDocument().getText(e.getOffset(), e.getLength());
                    if (!Numbers.isNumber(insertedText)) {
                        String finalInsertedText = insertedText;
                        SwingUtilities.invokeLater(() -> {
                            boolean consume = false;
                            if (isDecimal) {
                                if (!finalInsertedText.contains(".")) {
                                    consume = true;
                                }
                            } else {
                                consume = true;
                            }
                            if (consume) {
                                try {
                                    e.getDocument().remove(e.getOffset(), e.getLength());
                                } catch (BadLocationException ex) {
                                    ex.printStackTrace();
                                }
                            }
                            if (getValue().equals(".")) {
                                setValue("0.");
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
                    if (isDecimal) {
                        if (".".equals(String.valueOf(e.getKeyChar()))) {
                            if (getValue().contains(".")) {
                                e.consume();
                            }
                        } else {
                            e.consume();
                        }
                    } else {
                        e.consume();
                    }
                }
            }
        });
    }

    public InputNumber(String label) {
        this(0,0,label);
    }

    public boolean isDecimal() {
        return isDecimal;
    }

    public void setDecimal(boolean decimal) {
        isDecimal = decimal;
    }

    public int getMin() {
        return min;
    }

    public void setMin(int min) {
        this.min = min;
    }

    public int getMax() {
        return max;
    }

    public void setMax(int max) {
        this.max = max;
    }


}
