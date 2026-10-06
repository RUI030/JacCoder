# calculate_final_amount

Let’s imagine you're developing a simple shopping cart system for an online store. An important feature is calculating the total cost of the items in the cart after applying discounts. The store offers a straightforward discount policy: if the total cost exceeds $100$, a discount is applied to the total amount based on the following rules:

- A $10\%$ discount for totals between $100$ and $200$ inclusive.
- A $20\%$ discount for totals above $200$.

Write a program that reads a list of item prices, computes the total cost, applies the appropriate discount, and outputs the final amount.

-----Input-----
Input begins with an integer $N$ ($1 \le N \le 50$) representing the number of items in the cart. The next line contains $N$ positive integers representing the prices of the items in dollars. Each price is between $1$ and $500$.

-----Output-----
Output the final amount in dollars after applying any applicable discount. Output must be a floating number with two decimal places.

-----Examples-----
Sample Input:
5
30 20 50 40 10
Sample Output:
135.00

Sample Input:
3
60 80 100
Sample Output:
192.00

Example:
- `calculate_final_amount([30, 20, 50, 40, 10]) == 135.0`

Implement `calculate_final_amount(item_prices: list[int]) -> float`.
