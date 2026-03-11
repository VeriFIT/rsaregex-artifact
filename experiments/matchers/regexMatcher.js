const [,, input, pattern] = process.argv;

try {
    const regex = new RegExp(pattern);
    const match = regex.test(input);
    console.log(match);
} catch (error) {
    console.error("Invalid regex pattern");
    process.exit(1);
}
