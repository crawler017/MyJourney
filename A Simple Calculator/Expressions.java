import java.util.Scanner;
import java.util.Stack;

public class Expressions {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String input = scanner.nextLine();

        System.out.println(evaluateExpression(input));
    }

    public static int evaluateExpression(String expression) {
        stack_<Integer> operandStack = new stack_<>();
        stack_<Character> operatorStack = new stack_<>();

        expression = insertBlacks(expression);

        String[] tokens = expression.split(" ");

        for (String token : tokens) {
            if (token.length() == 0)
                continue;
            else if (token.trim().charAt(0) == '-' || token.trim().charAt(0) == '+') {
                while (!operatorStack.isEmpty_() && (operatorStack.peek() == '-' ||
                        operatorStack.peek() == '+' || operatorStack.peek() == '*' ||
                        operatorStack.peek() == '/'))
                    processAnOperator(operatorStack, operandStack);

                operatorStack.push(token.charAt(0));
            } else if (token.charAt(0) == '*' || token.charAt(0) == '/') {
                while (!operatorStack.isEmpty_() &&
                        (operatorStack.peek() == '*' ||
                        operatorStack.peek() == '/'))
                    processAnOperator(operatorStack, operandStack);

                operatorStack.push(token.charAt(0));
            } else if (token.trim().charAt(0) == '(') {
                operatorStack.push(token.charAt(0));
            } else if (token.trim().charAt(0) == ')') {
                if (operatorStack.peek() != '(')
                    processAnOperator(operatorStack, operandStack);

                operatorStack.pop();
            } else operandStack.push(new Integer(token));
        }

        while (!operatorStack.isEmpty_())
            processAnOperator(operatorStack, operandStack);

        return operandStack.pop();
    }

    public static void processAnOperator(stack_<Character> opt, stack_<Integer> opd) {
        char op = opt.pop();
        int num1 = opd.pop();
        int num2 = opd.pop();

        if (op == '+')
            opd.push(num2 + num1);
        else if (op == '-')
            opd.push(num2 - num1);
        else if (op == '*')
            opd.push(num2 * num1);
        else if (op == '/')
            opd.push(num2 / num1);
    }

    public static String insertBlacks(String e) {
        String result = "";
        for (int i = 0; i < e.length(); i++) {
            if (e.charAt(i) == '(' || e.charAt(i) == ')' ||
                    e.charAt(i) == '+' || e.charAt(i) == '-' ||
                    e.charAt(i) == '*' || e.charAt(i) == '/')
                result += " " + e.charAt(i) + " ";
            else
                result += e.charAt(i);
        }

        return result;
    }
}
