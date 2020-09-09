public class MergeSort2 {
    private static void mergeSort(int[] arr) {
        // 空数组 或 只有一个元素的数组，则什么都不做。
        if (arr == null || arr.length <= 1) return;
        mergeSort(arr, 0, arr.length - 1);
    }

    private static void mergeSort(int[] arr, int low, int high) {
        if (low >= high) return;

        // 计算出中间值，这种算法保证不会溢出。
        int mid = low + ((high - low) >> 1);
        // 先对左边排序
        mergeSort(arr, low, mid);
        // 先对右边排序
        mergeSort(arr, mid + 1,high);

        // 归并两个有序的子序列
        merge(arr, low, mid, high);

        // 把每一趟排序的结果也输出一下。
        print(arr);
    }

    private static void merge(int[] arr, int low, int mid, int high) {
        // temp[]是临时数组，包左不包右，所以要额外 + 1。
        int[] temp = new int[high - low + 1];
        int left = low; // 左侧指针从low开始。
        int right = mid + 1;    // 右侧指针从mid+1开始。
        int index = 0;  // 此索引用于temp[]
        // 当两个子序列还有元素时，从小到大放入temp[]中。
        while (left <= mid && right <= high) {
            if (arr[left] < arr[right]) {
                temp[index++] = arr[left++];
            } else {
                temp[index++] = arr[right++];
            }
        }

        // 要么左边没有元素
        while (left <= mid) {
            temp[index++] = arr[left++];
        }

        // 要么右边没有元素
        while (right <= high) {
            temp[index++] = arr[right++];
        }

        // 重新赋值给arr对应的区间。
        for (int i = 0; i < temp.length; i++) {
            arr[low + i] = temp[i];
        }
    }

    public static void main(String[] args) {
        int[] arr = {6, 9, 1, 4, 5, 8, 7, 0, 2, 3};

        System.out.print("排序前:  ");
        print(arr);

        mergeSort(arr);

        System.out.print("排序后:  ");
        print(arr);
    }

    // 打印数组
    private static void print(int[] arr) {
        if (arr == null)    return;

        for(int i : arr) {
            System.out.print(i + " ");
        }
        System.out.println();
    }
}