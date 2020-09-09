//import java.util.Collection;
//import java.util.Collections;
//
//public interface Tree<E> extends Collections<E> {
//    /** Return true if the element is in the tree */
//    public boolean search(E e);
//
//    /** Insert element e into the binary tree
//     * Return true if the element is inserted successfully
//     */
//    public boolean insert(E e);
//
//    /** Delete the specified element from the tree
//     * Return true if the element is deleted successfully
//     */
//    public boolean delete(E e);
//
//    /** Get the number of elements in the tree */
//    public int getSize();
//
//    /** Inorder traversal from the root */
//    public default void inorder() {
//    }
//
//    /** Postorder  traversal from the root */
//    public default void postorder() {
//    }
//
//    /** Preorder traversal from the root */
//    public default void preorder() {
//    }
//
//    @Override /** Return true if the tree is empty */
//    public default boolean isEmpty() {
//        return getSize() == 0;
//    }
//
//    @Override
//    public default boolean contains(Object e) {
//        return search((E) e);
//    }
//
//    @Override
//    public default boolean add(E e) {
//        return insert((E) e);
//    }
//
//    @Override
//    public default boolean remove(Object e) {
//        return delete((E) e);
//    }
//
//    @Override
//    public default int size() {
//        return getSize();
//    }
//
//    public default boolean containsAll(Collections<?> c) {
//        // Left as an exercise
//        return false;
//    }
//
//    @Override default boolean addAll(Collection<? extends E> c) {
//        // Left as an exercise
//        return false;
//    }
//
//    @Override
//    public default boolean removeAll(Collections<?> c) {
//        // Left as an exercise
//        return false;
//    }
//
//    @Override
//    public default boolean retainAll(Collections<?> c) {
//        // Left as an exercise
//        return false;
//    }
//
//    @Override
//    public default Object[] toArray() {
//        // Left as an exercise
//        return null;
//    }
//
//    @Override
//    protected default <T> T[] toArray(T[] array) {
//        // Left as an exercise
//        return null;
//    }
//}