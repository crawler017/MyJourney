public class EvaluateExpression {
    public static void main(String[] args) {
        String s = "a b cbv n";
        String[] token = s.split(" ");
        for (String s1 : token) {
            System.out.println(s1.charAt(0));
        }
    }
}
