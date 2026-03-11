public class RegexMatcher {
    public static void main(String[] args) {
        if (args.length < 2) {
            System.out.println("Please provide both a string and a pattern.");
            System.exit(1);
        }
        String input = args[0];
        String pattern = args[1];
        
        try {
            boolean match = input.matches(pattern);
            System.out.println(match);
        } catch (Exception e) {
            System.out.println("Invalid regex pattern");
            System.exit(1);
        }
    }
}
