import java.util.stream.IntStream;

public class Convolve {
    private static double[] convolve(double[] a, double[] b) {
        double[] output = new double[a.length + b.length - 1];
        for (int i = 0; i < a.length; i++) {
            for (int j = 0; j < b.length; j++) {
                output[i + j] += a[i] * b[j];
            }
        }
        return output;
    }

    public static void main(String[] args) {
        double a[] = IntStream.range(0, 5000)
                .mapToDouble(x -> Math.sin(Math.PI * (x / 8.0)))
                .toArray();
        double b[] = IntStream.range(0, 5000)
                .mapToDouble(x -> Math.cos(Math.PI * (x / 8.0)))
                .toArray();
        IntStream.range(0, 1000)
                .forEach(value -> {
                    long startTime = System.nanoTime();
                    convolve(a, b);
                    System.out.println("Elapsed Time: " + ((System.nanoTime() - startTime) / 1000000.0) + "ms");
                });
    }
}
