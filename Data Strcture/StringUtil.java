public class StringUtil {
    public int comparison (char[] v1, char[] v2) {
        String string1 = new String(v1);
        String string2 = new String(v2);
        int result = string1.compareTo(string2);
        return result == 0 ? 0 : (result == 1 ? 1 : -1);
    }
}
