package cu.edu.cujae.structbd.visual.components;

import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.Objects;

public class BarOption extends JPanel{
    private JLabel label;
    private JLabel icon;
    private String text;
    private boolean dropped;
    private boolean isDroppable;

    public BarOption(String text){
        super(new BorderLayout());
        setBackground(Color.WHITE);
        setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        setText(text);
        renderOption();
        addMouseListener(new MouseAdapter() {
            @Override
            public void mouseEntered(MouseEvent e) {
                super.mouseEntered(e);

                setBackground(Color.LIGHT_GRAY);
            }
            @Override
            public void mouseExited(MouseEvent e) {
                super.mouseExited(e);

                setBackground(Color.WHITE);
            }
        });
    }

    private void renderOption() {
        removeAll();
        repaint();
        icon = null;
        Box horizontalBox = Box.createHorizontalBox();
        horizontalBox.add(Box.createHorizontalStrut(24));
        if (isDroppable()) {
            add(getIcon(), BorderLayout.WEST);
        } else {
            add(horizontalBox, BorderLayout.WEST);
        }
        getLabel().setText(text);
        add(getLabel(), BorderLayout.CENTER);
        repaint();
    }

    public JLabel getLabel() {
        if (label == null) {
            label = new JLabel();
            label.setFont(new Font("Tahoma", Font.BOLD, 13));
            label.setForeground(Color.GRAY);
            label.setOpaque(false);
            label.setBackground(Color.WHITE);
        }
        return label;
    }

    private JLabel getIcon() {
        if (icon == null) {
            icon = new JLabel("");
            icon.setBounds(0, 20, 24, 24);
            String iconDir = this.dropped? "../img/chevron-down-regular-48.png":"../img/chevron-right-regular-48.png";
            ImageIcon icoImgLock=new ImageIcon(Objects.requireNonNull(getClass().getResource(iconDir)));
            ImageIcon imgLock=new ImageIcon(icoImgLock.getImage().getScaledInstance(icon.getWidth(), icon.getHeight(), Image.SCALE_DEFAULT));
            icon.setIcon(imgLock);
        }
        return icon;
    }

    public boolean isDroppable() {
        return isDroppable;
    }

    public void setDroppable(boolean droppable) {
        isDroppable = droppable;
        renderOption();
    }

    public void setDropped(boolean dropped) {
        this.dropped = dropped;
        renderOption();
    }

    public boolean getDropped() {
        return this.dropped;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }


}
