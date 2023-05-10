package cu.edu.cujae.structbd.visual.inputs;

public class ManagerInput {
    private static BrandInput brandInput = null;

    public static void showBrandInput(Mode mode) {
        if (brandInput==null || !brandInput.isVisible()) {
            brandInput = new BrandInput(mode);
        }
    }
}
