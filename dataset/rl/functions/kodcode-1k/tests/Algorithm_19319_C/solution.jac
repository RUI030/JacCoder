import re;
"""
    Identifies all email addresses in the input text and surrounds them with square brackets.
    """
def highlight_emails(text: str) -> str {
    email_pattern = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b';
    return re.sub(email_pattern, r'[\g<0>]', text);
}

