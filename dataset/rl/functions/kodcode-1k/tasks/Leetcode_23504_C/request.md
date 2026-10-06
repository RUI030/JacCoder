# maxProfit

You are given a 0-indexed integer array prices where prices[i] represents the price of a ticket on day i.
There is also a positive integer k. You want to buy and sell tickets in such a way that you maximize your profit,
given the following conditions:
- You can complete at most k transactions.
- A transaction is defined as buying a ticket on one day and selling it on a later day.
- You cannot engage in multiple transactions simultaneously (i.e., you must sell the ticket before you buy another one).

Return the maximum profit you can achieve under these conditions.

>>> maxProfit(2, [3, 3]) 
0
>>> maxProfit(2, []) 
0

Implement `maxProfit(k: int, prices: list[int]) -> int`.
