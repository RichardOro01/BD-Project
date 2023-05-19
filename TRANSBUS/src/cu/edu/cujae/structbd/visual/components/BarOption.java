package cu.edu.cujae.structbd.visual.components;

import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.Objects;

public class BarOption extends JPanel{
    private JLabel label;
    private JLabel icon;
    private boolean isDropeable;

    public BarOption(String text){
        super(new BorderLayout());
        setBackground(Color.WHITE);
        setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        getLabel().setText(text);
        renderOption();
        add(getLabel(), BorderLayout.CENTER);
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
        icon=null;
        add(getIcon(), BorderLayout.WEST);
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
            icon.setBounds(0, 0, 24, 24);

            if (isDropeable()) {

                ImageIcon icoImgLock=new ImageIcon(Objects.requireNonNull(getClass().getResource("../img/chevron-right-regular-48.png")));
                ImageIcon imgLock=new ImageIcon(icoImgLock.getImage().getScaledInstance(icon.getWidth(), icon.getHeight(), Image.SCALE_DEFAULT));
                icon.setIcon(imgLock);
            }
        }
        return icon;
    }

    public boolean isDropeable() {
        return isDropeable;
    }

    public void setDropeable(boolean dropeable) {
        isDropeable = dropeable;
        renderOption();
    }


}
