import java.util.LinkedList;
import java.util.Queue;

public class TestQueue {
    public static void main(String[] args) {
        Queue<String> queue = new LinkedList<>();
        queue.offer("a");
        queue.offer("b");
        queue.offer("c");
        queue.offer("d");

        System.out.println("one" + "\b");
        for (String s : queue) {
            System.out.println(s);
        }

        System.out.println("second" + "\b");
        while (queue.size() > 0) {
            System.out.println(queue.remove() + " ");
        }

        System.out.println("third" + "\b");
        for (String s : queue) {
            System.out.println(s);
        }
    }
}
