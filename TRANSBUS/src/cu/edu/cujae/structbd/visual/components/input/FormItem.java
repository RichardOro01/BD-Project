package cu.edu.cujae.structbd.visual.components.input;

import javax.accessibility.Accessible;
import javax.swing.*;

public interface FormItem extends Accessible {
    public String getValue();
    public Form getForm();
}
