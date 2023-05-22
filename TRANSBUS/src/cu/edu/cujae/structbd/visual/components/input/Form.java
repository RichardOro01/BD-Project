package cu.edu.cujae.structbd.visual.components.input;

import cu.edu.cujae.structbd.visual.inputs.FormConatiner;

import javax.swing.*;
import java.awt.*;
import java.util.LinkedList;
import java.util.List;

public class Form extends JPanel {
    private FormConatiner container;
    private List<FormItem> formItemList;
    public Form(List<FormItem> formItems, int rows, int cols) {
        super(new GridLayout(rows, cols, 30, 10));
        for (FormItem item: formItems) {
            add((Component)item);
        }
        formItemList = formItems;
    }
    public Form(int rows, int cols) {
        super(new GridLayout(rows, cols, 30, 10));
        formItemList = new LinkedList<>();
    }

    public void addFormItem(FormItem item) {
        add((JComponent)item);
        formItemList.add(item);
    }

    public FormConatiner getContainer() {
        return container;
    }

    public void setContainer(FormConatiner container) {
        this.container = container;
    }

    public void update(){
        container.onFormUpdate();
    }

    public List<FormItem> getFormItemList() {
        return formItemList;
    }
}
