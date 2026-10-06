# find_mismatched_parentheses

You are tasked with writing a function called `find_mismatched_parentheses` that checks a string of parentheses characters `(` and `)`, and determines the minimum number of parentheses that need to be added to make the string valid. A string is considered valid if every opening parenthesis has a corresponding closing parenthesis and vice versa.

Your function, `find_mismatched_parentheses(input_string: str) -> int`, should:

1. Iterate through the input string and use a counter to keep track of unmatched opening and closing parentheses.
2. Increment the counter for each opening parenthesis `(` found.
3. Decrement the counter for each closing parenthesis `)` found. If a closing parenthesis is found without a preceding matching opening parenthesis, maintain a separate count of unmatched closing parentheses.
4. After processing all characters in the input string, ensure that the counter correctly represents the number of unmatched opening parentheses.
5. Sum the unmatched opening and closing parentheses to determine the minimum number of parentheses that need to be added to balance the parentheses in the input string.

The function should return the minimum number of parentheses needed to make the input string valid.

### Examples
- Input: `")("` 
  Output: `2` (One opening parenthesis is missing before the closing parenthesis, and one closing parenthesis is missing after the opening parenthesis.)
  
- Input: `"((())"`
  Output: `1` (One closing parenthesis is missing to balance the last opening parenthesis.)
  
- Input: `"())"`
  Output: `1` (One opening parenthesis is missing to balance the unmatched closing parenthesis.)

Example:
- `find_mismatched_parentheses('()') == 0`

Implement `find_mismatched_parentheses(input_string: str) -> int`.
