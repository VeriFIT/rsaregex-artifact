using System;
using System.Text.RegularExpressions;

public class RegexMatcher {
    public static void Main(string[] args) {
        if (args.Length < 2) {
            Console.WriteLine("Please provide both a string and a pattern.");
            Environment.Exit(1);
        }

        string input = args[0];
        string pattern = args[1];

        try {
            bool isMatch = Regex.IsMatch(input, pattern);
            Console.WriteLine(isMatch); // Output "True" or "False"
        } catch (Exception e) {
            Console.WriteLine("Invalid regex pattern"); Environment.Exit(1);
        }
    }
}

