package cu.edu.cujae.structbd.visual.components;

import cu.edu.cujae.structbd.visual.App;

import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class BarOption extends JPanel{
    private JLabel label;
    private boolean hidden;
    private JLabel icon;
    private String text;
    private boolean dropped;
    private boolean isDroppable;
    private ArrayList<BarOption> optionsList;

    public BarOption(String text){
        super(new BorderLayout());
        setBackground(Color.WHITE);
        optionsList = new ArrayList<>();
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
        for (BarOption option: getOptionsList()) {
            option.setHidden(!dropped);
        }
        renderOption();
    }

    public boolean isDropped() {
        return this.dropped;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public List<BarOption> getOptionsList() {
        return optionsList;
    }

    public BarOption addOption(BarOption option) {
        optionsList.add(option);
        return option;
    }

    public boolean isHidden() {
        return hidden;
    }

    public void setHidden(boolean hidden) {
        this.hidden = hidden;
    }

}
