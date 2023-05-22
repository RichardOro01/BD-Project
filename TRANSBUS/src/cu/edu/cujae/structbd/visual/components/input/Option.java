package cu.edu.cujae.structbd.visual.components.input;

public class Option {
    private String key;
    private String value;

    public Option(String key, String value) {
        this.key = key;
        this.value = value;
    }

    public String getKey() {
        if (key == null) {
            key = "";
        }
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getValue() {
        if (value == null) {
            value = "";
        }
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return value;
    }
}
