import java.util.ArrayList;
import java.util.List;

public class stack_<E extends Comparable<E>> {

    class Node<E> {
        E element;
        Node<E> next;

        public Node(E e) {
            element = e;
        }
    }

    List<E> list = new ArrayList<>();

    public stack_() {
    }

    public void push(E e) {
        list.add(e);
    }

    public E peek() {
        if (list.size() > 0)
            return list.get(list.size() - 1);
        else return null;
    }

    public E pop() {
        if (list.size() > 0) {
            E popUpElement = list.get(list.size() - 1);
            list.remove(list.size() - 1);
            return popUpElement;
        } else return null;
    }

    public boolean isEmpty_() {
        if (list.size() > 0)
            return false;
        else
            return true;
    }
}
