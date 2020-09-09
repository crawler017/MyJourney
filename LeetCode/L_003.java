class L_003{
    private static int method(String s){
        if (s.length() == 0)
            return 0;
        int len = 1;
        for (int i = 0; i < s.length(); ++i) {
            boolean f = true;
            for (int j = i + 1; j < s.length(); ++j) {
                if (!f) //已检测到当前重复字符，则从当前j~i+1的后续字符不必再检测
                    break;
                for (int k = i; k < j; ++k) { //判断从i~j+1的字符是否存在重复
                    if (s.charAt(k) == s.charAt(j)) {
                        f = false;
                        break;
                    }
                }
                if (f)
                    len = len > (j - i + 1) ? len : (j - i + 1); //更新最大长度
            }
        }
        return len;
    }

    public static void main(String[] args) {
        String s = "pwwkewew";
        System.out.println(method(s));
    }
}