import re;
"""
    Masks all but the last four characters of any sequence of digits
    that is exactly 16 digits long in the input string.
    """
def mask_credit_card_number(s: str) -> str {
    pattern = r'\b(\d{12})(\d{4})\b';
    masked_string = re.sub(pattern, r'************\2', s);
    return masked_string;
}

