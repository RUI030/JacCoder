# is_valid_sentence

# Task
Given a string containing a sequence of words separated by spaces, write a function that returns true if the sequence forms a valid sentence according to the following rules:
1. The sentence must start with an uppercase letter.
2. Each word must contain only alphabetical characters.
3. The sentence must end with a single period (.) with no spaces before it.

# Example

For `inputString = "Hello world."`, the output should be `true`;

For `inputString = "hello world."`, the output should be `false` (does not start with an uppercase letter);

For `inputString = "Hello world"`, the output should be `false` (does not end with a period);

For `inputString = "Hello world. "`, the output should be `false` (period followed by a space);

For `inputString = "Hello Wo123rld."`, the output should be `false` (contains non-alphabetical characters).

# Input/Output

- `[input]` string `inputString`

- `[output]` a boolean value

    `true` if inputString forms a valid sentence according to the rules, `false` otherwise.

Example:
- `is_valid_sentence('Hello world.') == True`

Implement `is_valid_sentence(inputString: str) -> bool`.
