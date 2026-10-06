# max_total_magical_power

In the Kingdom of Wonderla, there are magical forests where you can find various types of magical fruits. Each type of fruit on a tree in a magical forest is unique and has a magical power index associated with it. The magical power of a fruit decreases linearly by a constant amount as you move deeper into the forest. You are tasked with finding out the maximum total magical power you can collect by picking one fruit from each tree, without picking two fruits with the same magical power index.

Let's assume there are $N$ trees, and each tree has $M$ fruits. The power of a fruit in a tree is given as an integer.

You are given the magical power of each fruit in each tree. Determine the maximum total magical power you can collect by picking exactly one fruit from each tree and ensuring no two picked fruits have the same magical power index.

Input

The input consists of a single test case in the format below:

$N$ $M$
$P_{1,1}$ $P_{1,2}$ $\ldots$ $P_{1,M}$
$P_{2,1}$ $P_{2,2}$ $\ldots$ $P_{2,M}$
$\vdots$
$P_{N,1}$ $P_{N,2}$ $\ldots$ $P_{N,M}$

The first line contains two integers $N$ ($2 \leq N \leq 10^3$) and $M$ ($2 \leq M \leq 10^3$), which are the number of trees and the number of fruits on each tree respectively. Each of the following $N$ lines contains $M$ integers (1 to $10^5$), which represent the power index of fruits on each tree.

Output

Print an integer, the maximum total magical power you can collect with the given conditions.

Example

Input

3 3
2 1 7
3 5 4
6 10 1

Output

22

Explanation

We can choose the following fruits to maximize the total power:
- From the first tree, pick the fruit with power 7.
- From the second tree, pick the fruit with power 5.
- From the third tree, pick the fruit with power 10.

Total power = 7 + 5 + 10 = 22

Example:
- `max_total_magical_power(3, 3, [[2, 1, 7], [3, 5, 4], [6, 10, 1]]) == 22`

Implement `max_total_magical_power(n: int, m: int, grid: list[list[int]]) -> int`.
