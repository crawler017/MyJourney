public class L_004 {
    private static void merge_sort(int[] array1, int[] array2){
        int [] array = new int[array1.length + array2.length];
        System.arraycopy(array1, 0, array, 0, array1.length);
        System.arraycopy(array2, 0, array, array1.length, array2.length);
        java.util.Arrays.sort(array);
        median_finder(array);
    }


    private static void median_finder(int[] array){
        double median;
        if (array.length % 2 == 0){
            int firstSlice = array[array.length / 2 - 1];
            int secondSlice = array[array.length / 2];
            median = (double) (firstSlice + secondSlice) / 2;
        }
        else
            median = array[array.length / 2];

        System.out.println("median = " + median);
    }

    public static void main(String[] args) {
        int[] array1 = {2, 3, 5, 7 ,9, 10};
        int[] array2 = {0, 1, 4 ,6 , 10, 11, 12, 13, 14, 15};
        merge_sort(array1, array2);
    }
}
