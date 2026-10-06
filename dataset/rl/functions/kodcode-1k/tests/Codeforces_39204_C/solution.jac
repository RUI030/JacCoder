"""
    Computes the final balance after processing a list of deposit and withdrawal transactions.

    Parameters:
    initial_balance (int): The initial balance of the account.
    transactions (list of tuples): A list of transactions where each tuple contains:
                                   - a string type ("deposit" or "withdrawal")
                                   - an integer amount

    Returns:
    int: The final balance after processing all transactions.
    """
def final_balance(initial_balance: int, transactions: list[tuple[str, int]]) -> int {
    balance = initial_balance;
    for (t_type, amount) in transactions {
        if (t_type == "deposit") {
            balance += amount;
        } elif (t_type == "withdrawal") {
            if (balance >= amount) {
                balance -= amount;
            }
        }
    }
    return balance;
}

