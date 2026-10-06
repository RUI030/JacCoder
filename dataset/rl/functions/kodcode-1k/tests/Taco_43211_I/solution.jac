"""
    Checks if the bank account number is valid.
    """
def is_valid_bank_account(account_str: str) -> str {
    if (len(account_str) != 10) {
        return "Invalid";
    }
    if not account_str.isdigit() {
        return "Invalid";
    }
    if (account_str[0] == '0') {
        return "Invalid";
    }
    return "Valid";
}

