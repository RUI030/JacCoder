# sanitize_string

### Context
You are working on a data processing application that frequently involves parsing and extracting information from strings containing various forms of whitespace and special characters. To assist with this task, you need to write a utility function that sanitizes these strings by removing all leading and trailing whitespace as well as any specified special characters.

### Task
Write a function `sanitize_string(input_string: str, special_chars: str) -> str` that removes all leading and trailing whitespace and specified special characters from the `input_string`.

### Specifications
1. **Input Format**:
    * A string `input_string` which may contain any characters.
    * A string `special_chars` which specifies the special characters to be removed, e.g., `"$#@"`.

2. **Output Format**:
    * A string with all leading and trailing whitespace and special characters removed.

### Constraints
* The `input_string` can have a maximum length of 2000.
* The `special_chars` can have a maximum length of 20.
* If the `input_string` is empty, the function should return an empty string.

### Performance Requirements
* The solution should efficiently handle the maximum input size within a reasonable time frame.

### Examples
* `sanitize_string('  hello world! ', '!')` should return `'hello world'`
* `sanitize_string('@@goodbye##', '@#')` should return `'goodbye'`
* `sanitize_string('***Python***', '*')` should return `'Python'`
* `sanitize_string('   ', ' ')` should return an empty string `''`
* `sanitize_string('', '@')` should return an empty string `''`

### Additional Notes
* The function should strictly handle removing the exact characters specified in `special_chars` and should not alter the original sequence inside the main string except for trimming the undesired characters.

Example:
- `sanitize_string('  hello world! ', '!') == 'hello world'`

Implement `sanitize_string(input_string: str, special_chars: str) -> str`.
