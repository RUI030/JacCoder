# redistribute_heights

In a game of line formation, there are n people standing in a row. Each person is assigned a height, represented by an integer.

The players have a peculiar way of redistributing themselves to form a new line. They follow these steps iteratively:
1. If there are at least 2 people, the tallest person moves to the leftmost position and the shortest person moves to the rightmost position of the current lineup.
2. The process continues with the next tallest and next shortest people (ignoring the ones already moved) until all people are repositioned.

Given the initial heights of all people standing in the row, determine the final order of their heights after the described redistribution process.

Input

The first line of input contains integer n (2 ≤ n ≤ 100) — the number of people in the row.

The second line contains n integers h1, h2, h3, ..., hn (1 ≤ hi ≤ 1000), where hi is the height of the i-th person.

Output

Output a single line with n integers representing the heights of the people in their final order after redistribution.

Examples

Input

5  
160 150 180 170 140  

Output

180 170 160 150 140

Input

4  
100 200 150 120  

Output

200 150 120 100

Input

3  
300 100 200  

Output

300 200 100

Note

In the first sample: Initially, the heights are [160, 150, 180, 170, 140].

1. Tallest (180) goes to the leftmost position, shortest (140) goes to the rightmost position -> [180, 160, 150, 170, 140]
2. Second tallest (170) is next to the tallest, second shortest (150) is next to the shortest -> [180, 170, 160, 150, 140]

In the second sample, the same process is followed to reach the final order [200, 150, 120, 100].

In the third sample, even with three people, the process maintains the tallest leftmost and shortest rightmost rule.

Example:
- `redistribute_heights(5, [160, 150, 180, 170, 140]) == [180, 140, 170, 150, 160]`

Implement `redistribute_heights(n: int, heights: list[int]) -> list[int]`.
