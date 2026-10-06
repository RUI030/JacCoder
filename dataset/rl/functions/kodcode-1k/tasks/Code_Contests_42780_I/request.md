# calculate_total_price

An online bookstore offers various discounts on orders based on the total number of distinct books a customer buys. However, there are some rules about the discounts that make the calculation a bit tricky.

The discount rules are as follows:

1. If a customer buys at least two distinct books, they get a 5% discount on the total price.
2. If a customer buys at least four distinct books, they get a 10% discount on the total price.
3. If a customer buys at least six distinct books, they get a 20% discount on the total price.

You are given a list representing the prices of books a customer wants to buy and need to calculate the total price the customer needs to pay after applying the appropriate discount based on the given rules. If the customer doesn't buy any books, the total price should be zero.

Input

The first line contains an integer n (0 ≤ n ≤ 1000) — the number of books the customer wants to buy.
The second line contains n space-separated integers p1, p2, ..., pn (1 ≤ pi ≤ 1000) — the prices of the books the customer wants to buy.

Output

Print a single real number — the total price after the discount is applied. The answer will be considered correct if its absolute or relative error does not exceed 10 - 2.

Examples

Input

5
100 200 300 400 500

Output

1350.00

Input

6
100 200 300 400 500 600

Output

1680.00

Input

0

Output

0.00

Example:
- `calculate_total_price(0, []) == 0.0`

Implement `calculate_total_price(n: int, prices: list[int]) -> float`.
