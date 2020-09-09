public class L_001 {
    private static int[] method(int[] list, int key){
        int[] outcome = new int[2];
        for (int i = 0; i < list.length; i++){
            for (int n = 0; n < list.length; n++){
                if (i != n){
                    if (list[i] + list[n] == key) {
                        outcome[0] = n;
                        outcome[1] = i;
                    }
                }
            }
        }
        return outcome;
    }

    public static void main(String[] args) {
        int[] list = {2,7,11,5};
        int key = 16;
        for (int e: method(list, key))
            System.out.println(e + " ");
    }
}
