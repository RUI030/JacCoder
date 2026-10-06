# assemble_bicycles

Bob is a bicycle enthusiast. He has `n` chains and `m` bicycle tires at home. Bob knows that a functional bicycle requires exactly one chain and two tires. He wants to know how many complete bicycles he can assemble and how many chains and tires he will have left over after assembling the maximum number of bicycles possible.

Given the number of chains `n` and the number of tires `m`, calculate the maximum number of bicycles Bob can assemble and the remaining chains and tires.

Input

The input consists of a single line containing two space-separated integers `n` and `m` (0 ≤ n, m ≤ 10^5) — the number of chains and the number of tires, respectively.

Output

Output a single line with three space-separated integers:
- The maximum number of bicycles that can be assembled,
- The number of chains left,
- The number of tires left.

Examples

Input

5 10

Output

5 0 0

Input

3 5

Output

2 1 1

Input

6 14

Output

5 1 4

Note

In the first example, Bob has 5 chains and 10 tires, which are exactly enough to assemble 5 bicycles with no chains or tires left.

In the second example, Bob can assemble 2 bicycles using 2 chains and 4 tires, leaving 1 chain and 1 tire.

In the third example, Bob can assemble 5 bicycles using 5 chains and 10 tires, leaving 1 chain and 4 tires.

Example:
- `assemble_bicycles(5, 10) == (5, 0, 0)`

Implement `assemble_bicycles(n: int, m: int) -> tuple[int, int, int]`.
