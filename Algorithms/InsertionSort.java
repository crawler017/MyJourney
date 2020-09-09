
// InsertionSort with the time complexity of O(n2).

public class InsertionSort {
    public static void insertionSort(int[] list){
        long startTime = System.currentTimeMillis();
        for (int i = 1; i < list.length; i++) {
            /** Insert list[i] into a sorted sublist list[0...i-1] so that
             * list[0..i] is sorted.
             */
            int currentElement = list[i];
            int k;
            for (k = i - 1; k >= 0 && list[k] > currentElement; k--) {
                list[k + 1] = list[k];
            }
            list[k + 1] = currentElement;
        }
        long endTime = System.currentTimeMillis();
        System.out.println(endTime);
        for (int e: list)
            System.out.println(e);
    }

    public static void main(String[] args) {
        long startTime = System.currentTimeMillis();
        System.out.println(startTime);
        int[] e = {2,5,7,2,9,2,12,54,98,11,66,323,88,0,32,12};
        insertionSort(e);
    }
}
