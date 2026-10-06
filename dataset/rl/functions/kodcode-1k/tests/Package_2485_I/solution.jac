"""
    Validates if the given HTML-like tags in the input string are properly nested and balanced.

    Args:
    html_str (str): A string containing HTML-like tags.

    Returns:
    bool: True if the tags are properly nested and balanced, False otherwise.
    """
def validate_html_tags(html_str: str) -> bool {
    import re;
    tag_re = re.compile(r'</?([a-zA-Z]+)>');
    stack = [];
    for `match in tag_re.finditer(html_str) {
        tag = `match.group(0);
        tag_name = `match.group(1);
        if tag.startswith('</') {
            if (not stack or (stack[-1] != tag_name)) {
                return False;
            }
            stack.pop();
        } else {
            stack.append(tag_name);
        }
    }
    return not stack;
}

