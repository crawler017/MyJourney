import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class CountOccurrentOfWords {
    public static void main(String[] args) {
        String sentence = "Hello, world! Good morning, i just got here, have no friends, " +
                "trying to get into this world, " +
                "would you help me friends? " +
                "since it is quite hard to be alone out there.";

        Map<String, Integer> map = new HashMap<>();
        String[] words = sentence.split("[\\s+\\p{P}]");
        for (int i = 0; i < words.length; i++){
            String key = words[i].toLowerCase();

            if (key.length() > 0){
                if (!map.containsKey(key))
                    map.put(key, 1);
                else {
                    int value = map.get(key);
                    value++;
                    map.put(key, value);
                }
            }
        }

        Set<Map.Entry<String, Integer>> entries = map.entrySet();
        for (Map.Entry<String, Integer> entry : entries) {
            System.out.println(entry);
        }
    }
}
