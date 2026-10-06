# final_balance

Computes the final balance after processing a list of deposit and withdrawal transactions.

Parameters:
initial_balance (int): The initial balance of the account.
transactions (list of tuples): A list of transactions where each tuple contains:
                               - a string type ("deposit" or "withdrawal")
                               - an integer amount

Returns:
int: The final balance after processing all transactions.

>>> final_balance(1000, [("deposit", 500), ("withdrawal", 1200), ("withdrawal", 200), ("deposit", 300)])
400
>>> final_balance(0, [("deposit", 100), ("withdrawal", 50)])
50

Implement `final_balance(initial_balance: int, transactions: list[tuple[str, int]]) -> int`.
