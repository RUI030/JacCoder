# validate_html_tags

You are asked to write a function named `validate_html_tags` that checks if all HTML-like tags in a given input string are properly nested and balanced. 

Here are the details:

1. **Parameters:**
   - `html_str` (str): A string containing HTML-like tags.

2. **Tag Format:**
   The tags in the string have the format `<tag>` for opening tags and `</tag>` for closing tags. Tags do not contain attributes, and the tag names consist only of alphabetic characters.

3. **Function Requirements:**
   - The function should return `True` if all tags are correctly nested and balanced, and `False` otherwise.
   - Consider only the tags in the format described (e.g., `<div>`, `</div>`, etc.), ignoring any other content.

4. **Examples:**
   - `validate_html_tags("<div><p></p></div>")` should return `True`.
   - `validate_html_tags("<div><p></div></p>")` should return `False` because the tags are not properly nested.
   - `validate_html_tags("<div><p></p>")` should return `False` because the closing `</div>` tag is missing.
   - `validate_html_tags("Hello <b>world</b>!")` should return `True`.

Implement the function `validate_html_tags` as described above.

Example:
- `validate_html_tags('<div><p></p></div>') == True`

Implement `validate_html_tags(html_str: str) -> bool`.
